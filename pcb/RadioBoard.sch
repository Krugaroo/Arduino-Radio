EESchema Schematic File Version 4
LIBS:RadioBoard-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Radio Board"
Date "2020-03-02"
Rev "1"
Comp "EWB - NL"
Comment1 "michael.krugaroo@gmail.com"
Comment2 "Michael Kruger"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 4100 2750 0    50   ~ 0
Sound (Radio)
$Comp
L Device:Antenna AE1
U 1 1 5E26821F
P 6700 2750
F 0 "AE1" V 6917 2693 50  0000 C CNN
F 1 "Antenna" V 6826 2693 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Horizontal" H 6700 2750 50  0001 C CNN
F 3 "~" H 6700 2750 50  0001 C CNN
	1    6700 2750
	1    0    0    -1  
$EndComp
NoConn ~ 5400 3300
NoConn ~ 5400 3400
NoConn ~ 6700 3200
Connection ~ 7250 4400
Wire Wire Line
	7250 4550 7250 4400
Wire Wire Line
	7250 4200 7250 4400
Wire Wire Line
	6650 4550 7250 4550
Wire Wire Line
	6650 4550 6050 4550
Connection ~ 6650 4550
Connection ~ 6650 4400
Wire Wire Line
	6650 4200 6650 4400
Wire Wire Line
	6650 4550 6650 4400
$Comp
L power:GND #PWR03
U 1 1 5E7F3E9E
P 6650 4550
F 0 "#PWR03" H 6650 4300 50  0001 C CNN
F 1 "GND" H 6650 4400 50  0000 C CNN
F 2 "" H 6650 4550 50  0001 C CNN
F 3 "" H 6650 4550 50  0001 C CNN
	1    6650 4550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW6
U 1 1 5E7E3F10
P 7050 4200
F 0 "SW6" H 6750 4150 50  0000 C CNN
F 1 "Scan_Channels" H 7150 4350 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 7050 4400 50  0001 C CNN
F 3 "~" H 7050 4400 50  0001 C CNN
	1    7050 4200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW5
U 1 1 5E7E36B6
P 6450 4200
F 0 "SW5" H 6150 4150 50  0000 C CNN
F 1 "Volume_Down" H 6500 4350 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 6450 4400 50  0001 C CNN
F 3 "~" H 6450 4400 50  0001 C CNN
	1    6450 4200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW4
U 1 1 5E7E1E85
P 5850 4200
F 0 "SW4" H 5550 4150 50  0000 C CNN
F 1 "Volume_Up" H 5850 4350 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_PUSH_6mm" H 5850 4400 50  0001 C CNN
F 3 "~" H 5850 4400 50  0001 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4400 5650 4200
Wire Wire Line
	6250 4400 6250 4200
Wire Wire Line
	6850 4400 6850 4200
Connection ~ 6850 4200
NoConn ~ 5350 4300
Wire Wire Line
	6050 4200 6050 4400
NoConn ~ 6700 3300
$Comp
L MCU_Microchip_ATtiny:ATtiny13V-10PU U3
U 1 1 5E7E0340
P 4750 4100
F 0 "U3" H 4700 4250 50  0000 R CNN
F 1 "ATtiny13V-10PU" H 4950 4100 50  0000 R CNN
F 2 "SamacSys_Parts:DIP794W56P254L959H533Q8N" H 4750 4100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc2535.pdf" H 4750 4100 50  0001 C CNN
	1    4750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4700 4150 4700
Wire Wire Line
	4150 4700 4150 3500
Wire Wire Line
	4150 3500 4450 3500
Connection ~ 4750 3500
$Comp
L Regulator_Linear:MCP1700-3002E_TO92 U2
U 1 1 5E93EAFF
P 4450 3100
F 0 "U2" H 4850 3050 50  0000 C CNN
F 1 "MCP1700-3002E_TO92" H 5400 2850 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4450 2900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001826D.pdf" H 4450 3100 50  0001 C CNN
	1    4450 3100
	1    0    0    1   
$EndComp
Wire Wire Line
	6250 4200 6250 4100
Connection ~ 6250 4200
Wire Wire Line
	6850 4000 5350 4000
Wire Wire Line
	6850 4000 6850 4200
Connection ~ 4150 3500
Wire Wire Line
	4150 3500 4150 3300
Wire Wire Line
	4150 2950 4150 3100
Wire Notes Line
	4000 2600 4000 4750
$Comp
L Device:C C5
U 1 1 5EA3A866
P 4600 3500
F 0 "C5" V 4450 3500 50  0000 C CNN
F 1 "1 uF" V 4550 3650 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 4638 3350 50  0001 C CNN
F 3 "~" H 4600 3500 50  0001 C CNN
	1    4600 3500
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5EA3B99E
P 4150 3350
F 0 "C4" H 4250 3350 50  0000 L CNN
F 1 "1 uF" H 4200 3250 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 4188 3200 50  0001 C CNN
F 3 "~" H 4150 3350 50  0001 C CNN
	1    4150 3350
	1    0    0    -1  
$EndComp
Connection ~ 4150 3100
Wire Wire Line
	4150 3100 4150 3200
Wire Wire Line
	4750 3100 4750 3500
Wire Wire Line
	4450 3400 4450 3500
Connection ~ 4450 3500
Wire Wire Line
	5350 4100 6250 4100
Wire Wire Line
	5650 4200 5350 4200
Connection ~ 5650 4200
Wire Wire Line
	6050 4400 6050 4550
Connection ~ 6050 4400
Wire Wire Line
	6050 4550 6050 4700
Wire Wire Line
	6050 4700 4750 4700
Connection ~ 6050 4550
Connection ~ 4750 4700
Wire Wire Line
	7700 4300 7700 4350
$Comp
L Device:Speaker LS1
U 1 1 5E265646
P 7900 4200
F 0 "LS1" H 7800 3800 50  0000 L CNN
F 1 "Speaker" H 7800 3900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 7900 4000 50  0001 C CNN
F 3 "~" H 7890 4150 50  0001 C CNN
	1    7900 4200
	1    0    0    -1  
$EndComp
Wire Notes Line
	4000 4750 8200 4750
Wire Notes Line
	8200 2600 8200 4750
Wire Notes Line
	4000 2600 8200 2600
Wire Wire Line
	4750 3500 5400 3500
Wire Wire Line
	5350 3100 5400 3100
Wire Wire Line
	5350 3100 5350 3800
Wire Wire Line
	5350 3900 5450 3900
Wire Wire Line
	5450 3900 5450 3550
Wire Wire Line
	6700 3100 6700 2950
Wire Wire Line
	6850 3400 6700 3400
Wire Wire Line
	6850 3300 6800 3300
Wire Wire Line
	6800 3300 6800 3500
Wire Wire Line
	6800 3500 6700 3500
NoConn ~ 6850 3200
NoConn ~ 8050 3200
NoConn ~ 8050 3300
Wire Wire Line
	8050 3850 8050 3950
Wire Wire Line
	6850 3950 6850 3850
$Comp
L power:GND #PWR0101
U 1 1 5E810E48
P 6800 3500
F 0 "#PWR0101" H 6800 3250 50  0001 C CNN
F 1 "GND" H 6950 3500 50  0000 C CNN
F 2 "" H 6800 3500 50  0001 C CNN
F 3 "" H 6800 3500 50  0001 C CNN
	1    6800 3500
	1    0    0    -1  
$EndComp
Connection ~ 6800 3500
$Comp
L power:GND #PWR0102
U 1 1 5E8116EA
P 7550 3950
F 0 "#PWR0102" H 7550 3700 50  0001 C CNN
F 1 "GND" H 7555 3777 50  0000 C CNN
F 2 "" H 7550 3950 50  0001 C CNN
F 3 "" H 7550 3950 50  0001 C CNN
	1    7550 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3750 8150 3750
Wire Wire Line
	8150 3750 8150 4000
Wire Wire Line
	8150 4000 7700 4000
Wire Wire Line
	7700 4000 7700 4200
Text GLabel 6850 3750 0    50   Input ~ 0
OUTPUT_SOUND
Wire Wire Line
	5450 3550 5250 3550
Wire Wire Line
	5250 3550 5250 3200
Wire Wire Line
	5250 3200 5400 3200
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5E829949
P 2750 3150
F 0 "J1" H 2858 3331 50  0000 C CNN
F 1 "Power Input" H 2858 3240 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2750 3150 50  0001 C CNN
F 3 "~" H 2750 3150 50  0001 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 2950 3350 2950
Wire Wire Line
	3350 2950 3350 3150
Wire Wire Line
	3350 3150 2950 3150
Wire Wire Line
	4150 4700 2950 4700
Wire Wire Line
	2950 4700 2950 3250
Connection ~ 4150 4700
Text GLabel 3500 2950 1    50   Input ~ 0
OUTPUT_SOUND
Wire Wire Line
	7550 3950 6850 3950
Wire Wire Line
	8050 3950 7650 3950
Wire Wire Line
	7650 3950 7650 4350
Wire Wire Line
	7650 4350 7700 4350
$Comp
L custom_symbols:module_radio_RDA5807M M1
U 1 1 5EADBC1F
P 6050 2950
F 0 "M1" H 6050 3065 50  0000 C CNN
F 1 "module_radio_RDA5807M" H 6050 2974 50  0000 C CNN
F 2 "custom_symbols:module_radio_RDA5807M" H 6050 2950 50  0001 C CNN
F 3 "" H 6050 2950 50  0001 C CNN
	1    6050 2950
	1    0    0    -1  
$EndComp
$Comp
L custom_symbols:module_audioamp_PAM8403 M2
U 1 1 5EADE6F9
P 8100 3550
F 0 "M2" V 7525 2900 50  0000 C CNN
F 1 "module_audioamp_PAM8403" V 7616 2900 50  0000 C CNN
F 2 "custom_symbols:module_audioamp_PAM8403" H 8100 3650 50  0001 C CNN
F 3 "" H 8100 3650 50  0001 C CNN
	1    8100 3550
	0    1    1    0   
$EndComp
$EndSCHEMATC
