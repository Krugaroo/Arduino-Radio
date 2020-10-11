/*
  Arduino Radio based on the RDA5807 module
  
  Copyright (c) 2020 Michael Kruger
  
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
  
  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.
  
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

// Define this if building for the AtTiny-85
#define BUILD_FOR_ATTINY85

// Build for AtTiny-85:
// To program this use the following settings:
// https://create.arduino.cc/projecthub/arjun/programming-attiny85-with-arduino-uno-afb829

#ifdef BUILD_FOR_ATTINY85
// i2c library for AtTiny85, install with Sketch->Include Library->Manage Libraries and search for USIWire and click on install
#include <USIWire.h>
#else
// Build for Arduino's with native I2C support:
#include <Wire.h>
#endif

#include <EEPROM.h>

#define BTN_VOL_UP 4
#define BTN_SCAN 3
#define DEFAULT_CHANNEL 100


#define ADDRESS_INDEX 0x11
#define ADDRESS_SEQ  0x10

#define REG_CONTROL 0x02
#define REG_CHANNEL 0x03
#define REG_AFC 0x04
#define REG_VOLUME 0x05
#define REG_READ_CHANNEL 0x0A

// Reg Control
#define AUDIO_OUTPUT_EN 0x8000
#define AUDIO_DMUTE_EN  0x4000
#define AUDIO_MONO_EN   0x2000
#define AUDIO_BASS_EN   0x1000

#define AUDIO_SEEKUP_EN 0x0200
#define AUDIO_SEEK_EN   0x0100
#define AUDIO_SEEK_MODE 0x0080
#define AUDIO_RDS_EN    0x0008
#define AUDIO_NEW_METH  0x0004
#define AUDIO_RESET     0x0002
#define AUDIO_ENABLE    0x0001

#define CHANNEL_SEL      0xFFC0
#define TUNE             0x0010
#define BAND_WORLD       0x000C
#define CHANNEL_25KHZ    0x0003
#define CHANNEL_50KHZ    0x0002
#define CHANNEL_200KHZ   0x0001
#define CHANNEL_100KHZ   0x0000

void writeReg(byte reg, uint16_t value) {
  Wire.beginTransmission(ADDRESS_INDEX);
  Wire.write(reg);
  Wire.write(value >> 8);
  Wire.write(value & 0xFF);
  Wire.endTransmission();
}

uint16_t readReg(byte reg) {
  Wire.beginTransmission(ADDRESS_INDEX);
  Wire.write(REG_VOLUME);                  
  Wire.endTransmission(0);          
  Wire.requestFrom(ADDRESS_INDEX,2,1); 
  return(256*Wire.read() + Wire.read());
}

uint16_t getFreq() {      
  Wire.requestFrom(ADDRESS_SEQ,2,1); 
  return(256*Wire.read() + Wire.read());
}

uint8_t volume = 2;
uint8_t channel = 0;

uint8_t channel_changed = 0;
uint8_t unsaved_change = 0;

uint8_t volume_up_press_dur = 0;
uint8_t scan_press_dur = 0;

uint16_t save_ticks = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(BTN_VOL_UP, INPUT);
  digitalWrite(BTN_VOL_UP, HIGH);
  pinMode(BTN_SCAN, INPUT);
  digitalWrite(BTN_SCAN, HIGH);
  
  Wire.begin();
  
  uint8_t saved_channel = EEPROM.read(0);
  uint8_t saved_volume= EEPROM.read(1);

  if(saved_volume != 255) {
    volume = saved_volume & 0xF;
  }

  if(saved_channel != 255) {
    channel = saved_channel;
  }
  
  writeReg(REG_CONTROL, AUDIO_OUTPUT_EN | AUDIO_DMUTE_EN | AUDIO_RESET | AUDIO_ENABLE);
  writeReg(REG_AFC, 0x0A00);
  delay(1000);
  writeReg(REG_CONTROL, AUDIO_OUTPUT_EN | AUDIO_DMUTE_EN | AUDIO_ENABLE);
  uint16_t current_reg = (readReg(REG_VOLUME)&0xFFF0);
  writeReg(REG_VOLUME, current_reg | volume);
  writeReg(REG_CHANNEL, (channel << 6) | TUNE | CHANNEL_100KHZ);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  delay(50);

  // Scan
  if(digitalRead(BTN_SCAN) == LOW) {
    scan_press_dur++;
    if(scan_press_dur > 30) {
      scan_press_dur = 0;
      channel++;
      if(channel > 210) {
        channel = 0;
      }
      writeReg(REG_CONTROL, AUDIO_OUTPUT_EN | AUDIO_SEEK_EN | AUDIO_SEEKUP_EN | AUDIO_DMUTE_EN | AUDIO_ENABLE);
      channel_changed = 1;
      
    }
  } else if(channel_changed == 1) {
    // Only save after channel was kept.
    unsaved_change = 1;
    channel_changed = 0;
  }
  
  // Volume UP
  if (digitalRead(BTN_VOL_UP) == LOW) {
    volume_up_press_dur++;
  } else if(digitalRead(BTN_VOL_UP) == HIGH && volume_up_press_dur > 0) {
    volume_up_press_dur = 0;
    
    volume ++;
    if (volume > 10) {
      volume = 0;
    }
    uint16_t current_reg = (readReg(REG_VOLUME)&0xFFF0);
    writeReg(REG_VOLUME, current_reg | volume);

    unsaved_change = 1;
  }

  if(unsaved_change != 0) {
    save_ticks++;

    if(save_ticks > 200) {
      uint16_t channel_reg = getFreq();
      channel = (channel_reg) & 0xFF;
      EEPROM.update(0, channel);
      EEPROM.update(1, volume);
      unsaved_change = 0;
    }
  }

}
