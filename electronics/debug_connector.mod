PCBNEW-LibModule-V1  Wed 11 Nov 2015 04:37:11 PM SGT
# encoding utf-8
Units mm
$INDEX
SOD323
Test_pad_1.5mm
Test_pad_1mm
debug_connector
$EndINDEX
$MODULE SOD323
Po 0 0 0 15 5642FE2A 00000000 ~~
Li SOD323
Sc 0
AR /5642900B
Op 0 0 0
T0 0 1.6 0.762 0.762 0 0.15 N I 21 N "D1"
T1 0.127 1.143 0.50038 0.50038 0 0.10922 N V 21 N "1N4148"
DS -0.5 -0.6 0.5 0 0.15 21
DS -0.5 0.6 0.5 0 0.15 21
DS 0.5 -0.6 0.5 0.6 0.15 21
DS -0.5 -0.6 -0.5 0.6 0.15 21
$PAD
Sh "1" R 1 1 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 1 "VCC"
Po -1.1 0
.SolderPaste -0.05
$EndPAD
$PAD
Sh "2" R 1 1 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 2 "VDD"
Po 1.1 0
.SolderPaste -0.05
$EndPAD
$EndMODULE SOD323
$MODULE Test_pad_1.5mm
Po 0 0 0 15 5642FA93 00000000 ~~
Li Test_pad_1.5mm
Sc 0
AR 
Op 0 0 0
T0 -0.1 1.9 1 1 0 0.15 N V 21 N "Test pad 1.5mm"
T1 0 -1.8 1 1 0 0.15 N V 21 N "VAL**"
$PAD
Sh "1" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00808000
Ne 0 ""
Po 0 0
$EndPAD
$EndMODULE Test_pad_1.5mm
$MODULE Test_pad_1mm
Po 0 0 0 15 5642FC94 00000000 ~~
Li Test_pad_1mm
Sc 0
AR 
Op 0 0 0
T0 0 1.8 1 1 0 0.15 N I 21 N "Test_pad_1mm"
T1 0 -1.4 1 1 0 0.15 N I 21 N "VAL**"
$PAD
Sh "1" C 1 1 0 0 0
Dr 0 0 0
At SMD N 00808000
Ne 0 ""
Po 0 0
$EndPAD
$EndMODULE Test_pad_1mm
$MODULE debug_connector
Po 0 0 0 15 5642AF52 00000000 ~~
Li debug_connector
Sc 0
AR 
Op 0 0 0
T0 0 2.54 1 1 0 0.15 N V 21 N "debug_connector"
T1 0 -1.27 1 1 0 0.15 N V 21 N "VAL**"
$PAD
Sh "1" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00808000
Ne 0 ""
Po -2.54 0
$EndPAD
$PAD
Sh "2" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po -1.27 1.27
$EndPAD
$PAD
Sh "3" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 0 0
$EndPAD
$PAD
Sh "4" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 1.27 1.27
$EndPAD
$PAD
Sh "5" C 1.5 1.5 0 0 0
Dr 0 0 0
At SMD N 00888000
Ne 0 ""
Po 2.54 0
$EndPAD
$EndMODULE debug_connector
$EndLIBRARY
