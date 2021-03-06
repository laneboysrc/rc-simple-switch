EESchema Schematic File Version 2
LIBS:PMV30UN
LIBS:WLA-STC
LIBS:WLA-power
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:rc-simple-switch-stc-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "RC Simple Switch"
Date "2018-03-30"
Rev "1"
Comp "LANE Boys RC"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "STC15W104 version"
$EndDescr
$Comp
L D D1
U 1 1 5ABB25ED
P 2850 4200
F 0 "D1" H 2850 4300 50  0000 C CNN
F 1 "1N4148" H 2600 4300 50  0000 C CNN
F 2 "Diodes_SMD:D_SOD-323_HandSoldering" H 2850 4200 50  0001 C CNN
F 3 "" H 2850 4200 50  0001 C CNN
	1    2850 4200
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x03 J1
U 1 1 5ABB2764
P 2300 4200
F 0 "J1" H 2300 4400 50  0000 C CNN
F 1 "IN" H 2300 4000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03_Pitch2.54mm" H 2300 4200 50  0001 C CNN
F 3 "" H 2300 4200 50  0001 C CNN
	1    2300 4200
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x03 J2
U 1 1 5ABB279B
P 9500 3300
F 0 "J2" H 9500 3500 50  0000 C CNN
F 1 "SW" H 9500 3100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 9500 3300 50  0001 C CNN
F 3 "" H 9500 3300 50  0001 C CNN
	1    9500 3300
	1    0    0    1   
$EndComp
$Comp
L TEST TP3
U 1 1 5ABB28F6
P 7150 2650
F 0 "TP3" H 7150 2950 50  0000 C BNN
F 1 "TX" H 7150 2900 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 7150 2650 50  0001 C CNN
F 3 "" H 7150 2650 50  0001 C CNN
	1    7150 2650
	1    0    0    -1  
$EndComp
$Comp
L TEST TP4
U 1 1 5ABB2961
P 7350 2650
F 0 "TP4" H 7350 2950 50  0000 C BNN
F 1 "RX" H 7350 2900 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 7350 2650 50  0001 C CNN
F 3 "" H 7350 2650 50  0001 C CNN
	1    7350 2650
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5ABB2CBB
P 3450 4100
F 0 "R1" V 3530 4100 50  0000 C CNN
F 1 "1k" V 3450 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3380 4100 50  0001 C CNN
F 3 "" H 3450 4100 50  0001 C CNN
	1    3450 4100
	0    1    1    0   
$EndComp
$Comp
L MOSFET_N Q1
U 1 1 5ABB2D01
P 8550 3900
F 0 "Q1" H 8560 4070 60  0000 R CNN
F 1 "PMV30UN" H 9150 3900 60  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 8550 3900 60  0001 C CNN
F 3 "" H 8550 3900 60  0000 C CNN
	1    8550 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5ABB2F16
P 9200 3500
F 0 "#PWR01" H 9200 3250 50  0001 C CNN
F 1 "GND" H 9200 3350 50  0000 C CNN
F 2 "" H 9200 3500 50  0001 C CNN
F 3 "" H 9200 3500 50  0001 C CNN
	1    9200 3500
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR02
U 1 1 5ABB30BD
P 2600 4000
F 0 "#PWR02" H 2600 3850 50  0001 C CNN
F 1 "VDD" H 2600 4150 50  0000 C CNN
F 2 "" H 2600 4000 50  0001 C CNN
F 3 "" H 2600 4000 50  0001 C CNN
	1    2600 4000
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR03
U 1 1 5ABB30F6
P 9200 3100
F 0 "#PWR03" H 9200 2950 50  0001 C CNN
F 1 "VDD" H 9200 3250 50  0000 C CNN
F 2 "" H 9200 3100 50  0001 C CNN
F 3 "" H 9200 3100 50  0001 C CNN
	1    9200 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3100 9200 3200
Wire Wire Line
	9200 3200 9300 3200
Wire Wire Line
	9300 3400 9200 3400
Wire Wire Line
	9200 3400 9200 3500
Wire Wire Line
	8650 3700 8650 3300
Wire Wire Line
	8650 3300 9300 3300
$Comp
L GND #PWR04
U 1 1 5ABB33C4
P 8650 4500
F 0 "#PWR04" H 8650 4250 50  0001 C CNN
F 1 "GND" H 8650 4350 50  0000 C CNN
F 2 "" H 8650 4500 50  0001 C CNN
F 3 "" H 8650 4500 50  0001 C CNN
	1    8650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4100 8650 4500
$Comp
L TEST TP2
U 1 1 5ABB377E
P 6950 2650
F 0 "TP2" H 6950 2950 50  0000 C BNN
F 1 "GND" H 6950 2900 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 6950 2650 50  0001 C CNN
F 3 "" H 6950 2650 50  0001 C CNN
	1    6950 2650
	1    0    0    -1  
$EndComp
$Comp
L TEST TP1
U 1 1 5ABB37EE
P 6750 2650
F 0 "TP1" H 6750 2950 50  0000 C BNN
F 1 "VCC" H 6750 2900 50  0000 C CNN
F 2 "Measurement_Points:Measurement_Point_Round-SMD-Pad_Small" H 6750 2650 50  0001 C CNN
F 3 "" H 6750 2650 50  0001 C CNN
	1    6750 2650
	1    0    0    -1  
$EndComp
$Comp
L STC15x10x U1
U 1 1 5ABB2598
P 5450 4200
F 0 "U1" H 6400 3600 60  0000 C CNN
F 1 "STC15W104" H 4550 3600 60  0000 C CNN
F 2 "SMD_Packages:SOIC-8-N" H 5450 4200 60  0001 C CNN
F 3 "" H 5450 4200 60  0001 C CNN
	1    5450 4200
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5ABB39C5
P 5800 3100
F 0 "C1" H 5825 3200 50  0000 L CNN
F 1 "1u" H 5825 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 5838 2950 50  0001 C CNN
F 3 "" H 5800 3100 50  0001 C CNN
	1    5800 3100
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR05
U 1 1 5ABB3A15
P 5450 2650
F 0 "#PWR05" H 5450 2500 50  0001 C CNN
F 1 "VCC" H 5450 2800 50  0000 C CNN
F 2 "" H 5450 2650 50  0001 C CNN
F 3 "" H 5450 2650 50  0001 C CNN
	1    5450 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2650 5450 3500
$Comp
L GND #PWR06
U 1 1 5ABB3ADA
P 5800 3400
F 0 "#PWR06" H 5800 3150 50  0001 C CNN
F 1 "GND" H 5800 3250 50  0000 C CNN
F 2 "" H 5800 3400 50  0001 C CNN
F 3 "" H 5800 3400 50  0001 C CNN
	1    5800 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5ABB3C60
P 5450 5000
F 0 "#PWR07" H 5450 4750 50  0001 C CNN
F 1 "GND" H 5450 4850 50  0000 C CNN
F 2 "" H 5450 5000 50  0001 C CNN
F 3 "" H 5450 5000 50  0001 C CNN
	1    5450 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4900 5450 5000
$Comp
L GND #PWR08
U 1 1 5ABB3ECF
P 2600 4400
F 0 "#PWR08" H 2600 4150 50  0001 C CNN
F 1 "GND" H 2600 4250 50  0000 C CNN
F 2 "" H 2600 4400 50  0001 C CNN
F 3 "" H 2600 4400 50  0001 C CNN
	1    2600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4300 2600 4300
Wire Wire Line
	2600 4300 2600 4400
Wire Wire Line
	2600 4000 2600 4200
Wire Wire Line
	3100 4200 3000 4200
Wire Wire Line
	3100 2800 3100 4200
Wire Wire Line
	2500 4200 2700 4200
Connection ~ 2600 4200
Wire Wire Line
	2500 4100 3200 4100
Wire Wire Line
	3700 4100 4100 4100
NoConn ~ 4100 4300
Wire Wire Line
	6650 4300 7150 4300
Wire Wire Line
	7150 4300 7150 2650
Wire Wire Line
	7350 2650 7350 4500
Wire Wire Line
	7350 4500 6650 4500
NoConn ~ 6650 4100
Wire Wire Line
	6650 3900 8350 3900
$Comp
L GND #PWR09
U 1 1 5ABB4D20
P 6950 2750
F 0 "#PWR09" H 6950 2500 50  0001 C CNN
F 1 "GND" H 6950 2600 50  0000 C CNN
F 2 "" H 6950 2750 50  0001 C CNN
F 3 "" H 6950 2750 50  0001 C CNN
	1    6950 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2650 6950 2750
Wire Wire Line
	6750 2800 6750 2650
Wire Wire Line
	3100 2800 6750 2800
Text Label 8850 3300 0    60   ~ 0
SW
Text Label 7850 3900 0    60   ~ 0
OUT
Text Label 7350 3250 0    60   ~ 0
RX
Text Label 7150 3250 2    60   ~ 0
TX
Text Label 2750 4100 2    60   ~ 0
S
Text Label 4000 4100 2    60   ~ 0
S-MCU
Text Notes 7150 5800 0    60   ~ 0
The output MOSFET is connected\nto RSTOUT_LOW on the MCU, which\nneeds to be programmed with the \nISP tool to be low after reset.\nThis way the load stays off when the \nMCU is starting up.
Wire Wire Line
	5800 3300 5800 3400
Wire Wire Line
	5800 2800 5800 2900
Connection ~ 5450 2800
Text Notes 2500 5900 0    60   ~ 0
The diode provides at \nleast 0.5V voltage drop\nso that the 5.5V MCU can\nbe safely powered from\na 6V RC system.\n\nDo not use a Schottky diode!
Connection ~ 5800 2800
Text Notes 6550 2100 0    60   ~ 0
Programming header
$EndSCHEMATC
