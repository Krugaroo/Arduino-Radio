# Arduino Radio
 A simple solar powered FM radio project
 
 *Note: The software included in this project is complete and can be used to flash onto an Arduino directly. The final project is intended to be on a custom PCB with an AtTiny-85 microcontroller.
 The PCB design is on its first revision, and requires some workaround. I will finish the PCB and add a proper readme in the future.*
 
 This project is a simple solar power radio that was to be used in a volunteering project via Engineers without Borders to teach and engage children with science and engineering.
 It was intended to be a fun and useful project for schools kids on our yearly trip to Mozambique to teach Engineering [https://www.ewbnl.org/schools-of-the-future/]. However due to Covid-19 the execution is currently postphoned.
 
 I have made the PCB design and Arduino software available freely in the hope that it might still be of use.
 
 The project uses a simple module (RDA5807) that can be bought cheaply and controlled over I2C using a microcontroller (i.e Arduino). The audio is amplified with an amplifier (PAM8403). I have included a BOM list for reference.
 The total cost at single units is less than 10 Euro. 
 

 # Tips
 1. The PCB design is nearly complete, but was put on hold. As such I plan to still work on it. Let me know if there is interest to do so. The PCB is workable but requires a workaround, because of the switch to the AtTiny 85
 2. When soldering the RDA5807 it is a lot easier to do it upside down so the crystal and small chip is facing down, this exposes the pads much better.
 3. If you have trouble getting it to work make sure the crystal on the RDA5807 is not shorted. This is quite easily to do accidentally when soldering.
 4. For the antenna any piece of wire will do, it will probably also work okayish without one.
 
 If you run into any problems please post an issue in Github!
