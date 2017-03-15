# clarinet_robot

The controlling module consists of the VHDL controlling part,  the solenoid valves and the power supply.
 
The VHDL controlling module is programmed by me via the Quartus 11 software and downloaded to the chip on the integrated circuit which allows to send out a set of 16 ways of controlling signals to the valves after different but customizable periods of time. You can customize the note to play and its length.
 
The solenoid valves are pneumatically powered by an air pump and electrically powered by the power supply, which is basically an adapter converts 220V AC current to 16 ways of 24V DC current. also there was a relay module between the valves , the VHDL part and the power supply so the controlling signals sent by the VHDL part with a relatively small voltage could be able to power the larger-voltage-demanding solenoid valves, which enables the air cylinders linked to the valves to expand their length and press the buttons and holes like human fingers.
 
It's currently able to play almost 18 notes in 1 sec.
