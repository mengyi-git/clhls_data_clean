/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0005: 2008-2014 LONGITUDINAL DATA, VERSION 1)
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g.,
 | "c:\temp\36692-0005-data.txt").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | If any variables have more than one missing value, they are assigned
 | to the standard missing value of a single period (.) in the statement
 | below. To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | NOTE:  Users should modify this setup file to suit their specific needs.
 | Sections for PROC FORMAT, FORMAT, and MISSING VALUE RECODES have been
 | commented out (i.e., '/*'). To include these sections in the final SAS
 | setup, users should remove the SAS comment indicators from the desired
 | section(s).
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
VALUE e4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d14licdf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE f6521_1_1f  1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE a53b3fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 9='(9) missing';
VALUE c32fffff  0='(0) wrong' 1='(1) correct' 8='(8) can''t use pen to draw the figure'
                9='(9) not able to do this (disabled)';
VALUE re11_14f  9='(9) without proxy';
VALUE d11retif  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) retired (worker) '
                2='(2) retired (cadre) ' 3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE f47_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE e5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE c31dffff  0='(0) wrong' 1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE f651afff  88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE f16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE d11livaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home '
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE d11vdayf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE a533_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d11disef  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(00) no'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cancer' 8='(08) glaucoma, cataracts' 9='(09) prostate tumor'
                10='(10) gynecological diseases' 11='(11) gastric or duodenal ulcer'
                12='(12) parkinson''s disease' 13='(13) bedsore' 14='(14) dementia' 15='(15) psychosis'
                16='(16) neuropathy' 17='(17) arthritis' 18='(18) other' 88='(88) don''t know'
                99='(99) missing';
VALUE f25a1_1f  -1='(-0001) not applicable' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
VALUE a531ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 8='(8) don''t know'
                9='(9) missing';
VALUE f27_14ff  1='(1) not worth' 2='(2) not necessary'
                3='(3) cannot afford to the payment' 8='(8) do not know' 9='(9) missing';
VALUE d33_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) vegetable grease'
                2='(2) gingili grease' 3='(3) lard' 4='(4) other animal''s fat' 8='(8) don''t know'
                9='(9) missing';
VALUE g511ffff  888='(888) don''t know' 999='(999) missing';
VALUE d11a53a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d14carpf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE g102c_1_1f  888='(888) do not know' 998='(998) more than 1000' 999='(999) missing';
VALUE a540_14f  1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE rd12ffff  0='(0)  without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE re12_14f  10='(10) without proxy';
VALUE h21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE g102c_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                998='(998) more than 1000' 999='(999) missing';
VALUE d78a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d11licdf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE rd1fffff  0='(0) without proxy' 1='(1) with proxy';
VALUE d14g102f  -9='(-09) lost to follow-up in the 2014 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE a53a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d14bedrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a54bffff  88='(88) don''t know' 99='(99) missing';
VALUE a531_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE a52_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                99='(99) missing';
VALUE d85_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f26_14ff  1='(001) .' 3='(003) 100' 4='(004) 1000' 5='(005) 1004' 6='(006) 1010'
                7='(007) 1020' 8='(008) 1030' 9='(009) 1040' 10='(010) 1045' 11='(011) 105'
                12='(012) 1050' 13='(013) 1080' 14='(014) 1090' 15='(015) 110' 16='(016) 1100'
                17='(017) 1110' 18='(018) 1119' 19='(019) 1120' 20='(020) 1130' 21='(021) 1140'
                22='(022) 115' 23='(023) 1170' 24='(024) 1180' 25='(025) 1197' 26='(026) 120'
                27='(027) 1200' 28='(028) 1201' 29='(029) 1210' 30='(030) 1224' 31='(031) 123'
                32='(032) 124' 33='(033) 1240' 34='(034) 125' 35='(035) 130' 36='(036) 1300'
                37='(037) 132' 38='(038) 133' 39='(039) 1340' 40='(040) 1350' 41='(041) 1370'
                42='(042) 1390' 43='(043) 1396' 44='(044) 140' 45='(045) 1400' 46='(046) 1429'
                47='(047) 1440' 48='(048) 145' 49='(049) 1450' 50='(050) 1462' 51='(051) 148'
                52='(052) 1480' 53='(053) 150' 54='(054) 1500' 55='(055) 1540' 56='(056) 155'
                57='(057) 156' 58='(058) 159' 59='(059) 160' 60='(060) 1600' 61='(061) 1618'
                62='(062) 1630' 63='(063) 1640' 64='(064) 165' 65='(065) 1650' 66='(066) 1690'
                67='(067) 170' 68='(068) 1700' 69='(069) 172' 70='(070) 175' 71='(071) 180'
                72='(072) 1800' 73='(073) 190' 74='(074) 1900' 75='(075) 195' 76='(076) 200'
                77='(077) 2000' 78='(078) 2017' 79='(079) 2018' 80='(080) 2047' 81='(081) 2060'
                82='(082) 208' 83='(083) 210' 84='(084) 2100' 85='(085) 215' 86='(086) 2160'
                87='(087) 2178' 88='(088) 220' 89='(089) 2200' 90='(090) 2210' 91='(091) 2240'
                92='(092) 2260' 93='(093) 2284' 94='(094) 230' 95='(095) 2300' 96='(096) 240'
                97='(097) 2400' 98='(098) 2450' 99='(099) 250' 100='(100) 2500' 101='(101) 258'
                102='(102) 260' 103='(103) 2600' 104='(104) 270' 105='(105) 2700' 106='(106) 275'
                107='(107) 2800' 108='(108) 2880' 109='(109) 290' 110='(110) 30' 111='(111) 300'
                112='(112) 3000' 113='(113) 3020' 114='(114) 3060' 115='(115) 310' 116='(116) 318'
                117='(117) 320' 118='(118) 325' 119='(119) 328' 120='(120) 330' 121='(121) 335'
                122='(122) 340' 123='(123) 3400' 124='(124) 344' 125='(125) 346' 126='(126) 350'
                127='(127) 3500' 128='(128) 358' 129='(129) 360' 130='(130) 3600' 131='(131) 365'
                132='(132) 37' 133='(133) 3700' 134='(134) 375' 135='(135) 3750' 136='(136) 380'
                137='(137) 383' 138='(138) 385' 139='(139) 390' 140='(140) 40' 141='(141) 400'
                142='(142) 4000' 143='(143) 403' 144='(144) 408' 145='(145) 410' 146='(146) 420'
                147='(147) 4200' 148='(148) 423' 149='(149) 425' 150='(150) 430' 151='(151) 433'
                152='(152) 440' 153='(153) 450' 154='(154) 46' 155='(155) 460' 156='(156) 465'
                157='(157) 480' 158='(158) 486' 159='(159) 495' 160='(160) 50' 161='(161) 500'
                162='(162) 5000' 163='(163) 5025' 164='(164) 507' 165='(165) 510' 166='(166) 525'
                167='(167) 55' 168='(168) 550' 169='(169) 554' 170='(170) 560' 171='(171) 5600'
                172='(172) 565' 173='(173) 570' 174='(174) 575' 175='(175) 578' 176='(176) 590'
                177='(177) 60' 178='(178) 600' 179='(179) 6000' 180='(180) 609' 181='(181) 61'
                182='(182) 610' 183='(183) 620' 184='(184) 640' 185='(185) 65' 186='(186) 650'
                187='(187) 657' 188='(188) 66' 189='(189) 660' 190='(190) 665' 191='(191) 670'
                192='(192) 680' 193='(193) 690' 194='(194) 70' 195='(195) 700' 196='(196) 7000'
                197='(197) 72' 198='(198) 720' 199='(199) 729' 200='(200) 75' 201='(201) 750'
                202='(202) 76' 203='(203) 770' 204='(204) 80' 205='(205) 800' 206='(206) 81'
                207='(207) 83' 208='(208) 830' 209='(209) 84' 210='(210) 85' 211='(211) 870'
                212='(212) 8888' 213='(213) 9' 214='(214) 90' 215='(215) 900' 216='(216) 905'
                217='(217) 920' 218='(218) 95' 219='(219) 960' 220='(220) 970' 221='(221) 978'
                222='(222) 980' 223='(223) 990' 224='(224) 999' 225='(225) 9999' 226='(226) 1'
                227='(227) 2' 228='(228) 3' 229='(229) 8';
VALUE a52fffff  -1='(-1) not applicable' 99='(99) missing';
VALUE e0_14fff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE e67fffff  -1='(-01) not applicable' 888='(888) not able to answer'
                999='(999) missing';
VALUE f21fffff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 9='(9) missing';
VALUE f103a2_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE a54affff  8888='(8888) don''t know' 9999='(9999) missing';
VALUE e6b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE f43a4fff  -1='(-1) not applicable' 1='(1) good' 2='(2) so so' 3='(3) bad'
                8='(8) don''t know' 9='(9) missing';
VALUE d14cargf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body' 9='(9) do not need care';
VALUE d4meat2f  1='(1) almost everyday' 2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d11bedrf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE g15f3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE a537_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) never cooking'
                1='(1) gas: from underground pipes' 2='(2) gas: bottled, tank, or lp' 3='(3) electricity'
                4='(4) fuel oil, kerosene, etc' 5='(5) coal or coke' 6='(6) charcoal'
                7='(7) solar energy' 8='(8) firewood or straw' 9='(9) other';
VALUE g1061_1_1f  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE f92a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g81fffff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE d11g106_2f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) suddenly (over a few days)' 2='(2) over a few months' 3='(3) over a few years'
                8='(8) do not know' 9='(9) missing';
VALUE c54_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE d11painf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE d4drug1f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE g15n1a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9)  missing';
VALUE a53a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE c55_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE f151ffff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE d11a537f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE g81_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right hand' 2='(2) left hand'
                3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE f46fffff  -1='(-1) not applicable' 1='(1) yes full time' 2='(2) yes part time'
                3='(3) no' 9='(9) missing';
VALUE d14bathf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE e63fffff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d14wcfaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE f31fffff  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 99='(99) missing';
VALUE d11illff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE h22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE a534_14f  8888='(8888) do not know' 9999='(9999) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) rice and wheat' 5='(5) other' 9='(9) missing';
VALUE d14a535f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE h1ffffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE d14d21bf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know' 9='(9) missing';
VALUE g4b_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE ra52_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE f12a_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f251_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE e6ffffff  1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding'
                9='(9) missing';
VALUE f340ffff  0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE a41_14ff  11='(11) beijing' 12='(12) tianjian' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian'
                36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan'
                44='(44) guangdong' 45='(45) guangxi' 46='(46)  hainan' 50='(50) chongqing'
                51='(51) sichuan' 52='(52)  guizhou' 53='(53) yunnan' 54='(54)  tibet' 61='(61) shaanxi'
                62='(62) gansu' 63='(63)  qinghai' 64='(64)  ningxia' 65='(65)  xinjiang'
                71='(71) taiwan' 81='(81) hongkong' 88='(88) don''t know' 90='(90) north korea'
                91='(91) south korea' 92='(92) burma' 93='(93) indonesia' 94='(94)  japan'
                95='(95) vietnam' 96='(96) others' 99='(99) missing';
VALUE rd1_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) without proxy'
                1='(1) with proxy';
VALUE a53a1fff  -1='(-1) not applicable' 0='(0) spouse' 1='(1) child'
                2='(2) spouse of child' 3='(3) grandchild' 4='(4)  spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g9_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without using hands'
                2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11knddf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE d11marrf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f35fffff  99998='(99998) more than 100000' 99999='(99999) missing';
VALUE a53a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) UNDOCUMENTED CODE' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE d91fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE c55fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE d11medcf  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for deceased, not applicable for survivors' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE e610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) not able to answer' 99='(99) missing';
VALUE g15a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE e610ffff  -1='(-1) not applicable' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchild(ren)' 8='(08) other relative(s)' 9='(09) neighbors'
                10='(10) social services' 11='(11) housekeeper' 12='(12) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d14g4aff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE d14vyeaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors';
VALUE d11mon1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE g11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE a541ffff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_1f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE d11a53a_2f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE g4b_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE f651a1_f  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f651a1__1f  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE d5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE g1062_1_1f  1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE g6_14fff  1='(1) regular' 2='(2) irregular' 8='(8) do not know' 9='(9) missing';
VALUE f111a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) spouse' 1='(01) son'
                2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE f1031b3f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                0='(000) UNDOCUMENTED CODE' 888='(888) do not know' 999='(999) missing';
VALUE d32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a53a4fff  -1='(-1) not applicable' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE f62_14ff  1='(1) yes' 2='(2) no' 8='(8) didn''t answer' 9='(9) missing';
VALUE g4a_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE d76_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) within 5 minutes'
                2='(2) 6-30 minutes' 3='(3) 31-60 minutes' 4='(4) after 60 minutes' 8='(8) do not know '
                9='(9) missing';
VALUE g9ffffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d14a537f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE f41a12__1f  88='(88) do not know' 99='(99) missing';
VALUE d11didaf  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE f6521_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE g131ffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE re13_14f  11='(11) without proxy';
VALUE g4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE d11wcfaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE f45_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE e2_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE d1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) rice' 2='(2) corn(maize)'
                3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat' 5='(5) other'
                9='(9) missing';
VALUE f47fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                9='(9) missing';
VALUE d11g4bff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE e1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
VALUE e7ffffff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                9='(9) missing';
VALUE f2ffffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture, forestry, animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d11resif  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE f610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable (not sick)'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconvenience to travel'
                4='(4) nobody to go with' 5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE re64_14f  2='(2) without proxy';
VALUE a53a3fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
                9='(9) missing';
VALUE h22fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE dth08_1f  -9='(-9) lost to follow-up in the 2011/2012 survey'
                0='(0) surviving at the 2011/2012 survey' 1='(1) died before the 2011/2012 survey'
                2='(2) surviving at 2011 survey but died before 2012 survey';
VALUE d11noinf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) not worth' 2='(2) not necessary' 3='(3) cannot afford to pay' 4='(4) not sure'
                8='(8) do not know' 9='(9) missing';
VALUE provffff  11='(11) beijing' 12='(12) tianjing' 13='(13) hebei' 14='(14) shanxi'
                21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang' 31='(31) shanghai'
                32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi'
                37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan' 44='(44) guangdong'
                45='(45) guangxi' 46='(46) hainan' 50='(50) chongqing' 51='(51) sichuan'
                61='(61) shaanxi';
VALUE a533_14f  1='(1) detached house' 2='(2) duplex/triplex'
                3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE g11fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d14marrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE g14b1fff  -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes'
                3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) uterine tumor'
                22='(22) hepatitis' 23='(23) other'
                66='(66) natural senescence without reporting any disease' 88='(88) don''t know'
                99='(99) missing';
VALUE f64i_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE g132ffff  88='(88) bedridden all the year around' 99='(99) missing';
VALUE d11medif  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) was not sick' 8='(8) do not know' 9='(9) missing';
VALUE c11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to answer' 9='(9) missing';
VALUE d78a_14f  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4)  seldom'
                5='(5) never' 8='(8)  not able to answer' 9='(9) missing';
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE e1ffffff  1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE e6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE g4ffffff  1='(1) right-handed' 2='(2) left-handed' 8='(8) don''t know'
                9='(9) missing';
VALUE re67_14f  4='(4) without proxy';
VALUE f5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchildren' 8='(08) other relatives' 9='(09) friends and neighbors'
                10='(10) social services' 11='(11) live-in care giver' 12='(12) nobody'
                88='(88) don''t know' 99='(99) missing';
VALUE d14d26af  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4) spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d11g106_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE re8_14ff  6='(6) without proxy';
VALUE d14g4fff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE d11insuf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE d71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE e0_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, strongly limited'
                2='(2) yes, limited' 3='(3) not limited' 8='(8) do not know' 9='(9) missing';
VALUE c53a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to do' 9='(9) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE b121_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE d14painf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE a54a_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d11a53ef  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) no education' 2='(02) attend school but not graduated from primary school'
                3='(03) primary school' 4='(04) middle school' 5='(05) high school'
                6='(06) collage or above' 8='(08) don''t know' 9='(09) missing'
                13='(13) UNDOCUMENTED CODE';
VALUE a43fffff  1='(1) urban' 2='(2) rural' 8='(8) don''t know' 9='(9) missing';
VALUE g14a2fff  -1='(-01) not applicable' 888='(888) bedridden all the year around'
                999='(999) missing';
VALUE f84_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE f610ffff  -1='(-1) not applicable (not sick)' 1='(1) no money'
                2='(2) far from hospital' 3='(3) inconvenience to travel' 4='(4) nobody to go with'
                5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE re1_14ff  0='(0) without proxy';
VALUE d11whopf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE g15f3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE re63_14f  1='(1) without proxy';
VALUE d4drug1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE h3ffffff  1='(1) surprisingly healthy' 2='(2) relatively healthy'
                3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE d14doctf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE d31fffff  1='(1) almost everyday' 2='(2) quite often' 3='(3) occasionally'
                4='(4) rarely or never' 8='(8) don''t know' 9='(9) missing';
VALUE g132_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE d75fffff  -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE d91_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d32fffff  1='(1) almost everyday' 2='(2) except winter' 3='(3) occasionally'
                4='(4) rarely or never' 8='(8) don''t know' 9='(9) missing';
VALUE f64iffff  0='(0) no' 1='(1) yes' 8='(8) don''t know' 9='(9) missing';
VALUE h1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without hearing aid'
                2='(2) yes, but needs hearing aid' 3='(3) partly, despite hearing aid' 4='(4) no'
                9='(9) missing';
VALUE f43a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE h5_14fff  888='(888) don''t know';
VALUE d77_14ff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE d11inspf  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE g1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) can see and distinguish'
                2='(2) can see only' 3='(3) can''t see' 4='(4) blind' 8='(8) don''t know' 9='(9) missing';
VALUE d11d21bf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE g15n1a__1f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
VALUE f34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very rich' 2='(2) rich'
                3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE f23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE e65_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE e3_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE f16fffff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE re7_14ff  5='(5) without proxy';
VALUE g7_14fff  888='(888) do not know' 999='(999) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                8='(8) don''t know' 9='(9) missing';
VALUE d14tapwf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE f1033_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who live in other village/district/city' 8='(8) not able to answer'
                9='(9) missing';
VALUE a41fffff  1='(01) UNDOCUMENTED CODE' 2='(02) UNDOCUMENTED CODE'
                3='(03) UNDOCUMENTED CODE' 7='(07) UNDOCUMENTED CODE' 10='(10) UNDOCUMENTED CODE'
                11='(11) beijing' 12='(12) tianjian' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 16='(16) UNDOCUMENTED CODE' 21='(21) liaoning' 22='(22) jilin'
                23='(23) helongjiang' 24='(24) UNDOCUMENTED CODE' 25='(25) UNDOCUMENTED CODE'
                26='(26) UNDOCUMENTED CODE' 31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang'
                34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan'
                42='(42) hubei' 43='(43) hunan' 44='(44) guangdong' 45='(45) guangxi' 46='(46)  hainan'
                50='(50) chongqing' 51='(51) sichuan' 52='(52)  guizhou' 53='(53) yunnan'
                54='(54)  tibet' 61='(61) shaanxi' 62='(62) gansu' 63='(63)  qinghai' 64='(64)  ningxia'
                65='(65)  xinjiang' 71='(71) taiwan' 81='(81) hongkong' 82='(82) UNDOCUMENTED CODE'
                88='(88) don''t know' 90='(90) north korea' 91='(91) south korea' 92='(92) burma'
                93='(93) indonesia' 94='(94)  japan' 95='(95) vietnam' 96='(96) others' 99='(99) missing';
VALUE f221_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' 88888='(88888) do not know'
                99999='(99999) missing';
VALUE g12_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) can''t turn around'
                99='(99) missing';
VALUE a542ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE g14a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) uterine tumor'
                22='(22) hepatitis' 23='(23) other' 25='(25) UNDOCUMENTED CODE'
                66='(66) natural senescence without reporting any disease' 88='(88) don''t know'
                99='(99) missing';
VALUE a535_14f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE d4meat2_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a541_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d14a533f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE a534_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) do not know'
                9999='(9999) missing';
VALUE g1062_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE f340_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE d11g102f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE g01fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE d11batdf  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 9='(9) missing';
VALUE resid_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural';
VALUE g1063_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) suddenly (over a few days)'
                2='(2) over a few months' 3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d14vdayf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE d11g4aff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE a53b3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE h3_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) surprisingly healthy'
                2='(2) relatively healthy' 3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE a2ffffff  1='(1) han' 2='(2) hui' 3='(3) zhuang' 4='(4) yao' 5='(5) korea'
                6='(6) man' 7='(7) mongolia' 8='(8) others' 9='(9) missing';
VALUE monthin_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 99='(99) missing';
VALUE b210_14f  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE g6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) regular' 2='(2) irregular'
                8='(8) do not know' 9='(9) missing';
VALUE a53a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d11doctf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE f103a5_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE d11dplaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d11yr1ff  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE a532ffff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) missing';
VALUE g4a_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e6bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d14dplaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE f221_14f  88888='(88888) do not know' 99999='(99999) missing';
VALUE d4b_14ff  1='(1) Green tea' 2='(2) Red tea (black tea)' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE f35_11ff  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE d11a535f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11genef  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE f12affff  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f25b1_1f  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE d14dresf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE d11marr_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d11carpf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE f34fffff  1='(1) very rich' 2='(2) rich' 3='(3) so so' 4='(4) poor'
                5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE d11a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE f104_14f  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE e65fffff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) not able to answer' 9='(9) missing';
VALUE d34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) insipidity' 2='(2) salty'
                3='(3) sweet' 4='(4) hot' 5='(5) crude' 6='(6) do not have all the above tastes'
                8='(8) don''t know' 9='(9) missing';
VALUE d11affff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE d14d26a_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE a530_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                8='(8) don''t know' 9='(9) missing';
VALUE a542_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE g23_14ff  0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day'
                3='(3) twice a day' 4='(4) three or more times a day ' 8='(8) do not know'
                9='(9) not applicable (no teeth)';
VALUE b21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE d11a533f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE f92a5fff  -1='(-1) not applicable' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE g15a3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 9='(9) missing';
VALUE d11a53a_3f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE yearin_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE a535_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9) missing';
VALUE g15n3a__1f  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE a530ffff  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 8='(8) don''t know' 9='(9) missing';
VALUE d31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) quite often' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE d4a_14ff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE d11hypef  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE f1032_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who is not in corsidence with me but live in the sa'
                8='(8) not able to answer' 9='(9) missing';
VALUE d14knddf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE f43a2fff  -1='(-1) not applicable' 1='(1) married' 2='(2) divorced' 3='(3) widowed'
                8='(8) don''t know' 9='(9) missing';
VALUE d33fffff  1='(1) vegetable grease' 2='(2) gingili grease' 3='(3) lard'
                4='(4) other animal''s fat' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_3f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) suddenly (over a few days)' 2='(2) over a few months' 3='(3) over a few years'
                8='(8) do not know' 9='(9) missing';
VALUE a51_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) with household member(s)'
                2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE dth11_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2014 survey' 1='(1) died before the 2014 survey';
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE rd12_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0)  without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d14g4bff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE g83fffff  1='(1) only left arm' 2='(2) only right arm' 3='(3) two arms'
                4='(4) neither left nor right arms' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE re10_14f  8='(8) without proxy';
VALUE d14contf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE f23fffff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE d14dreaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE d11bathf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE a532_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) missing';
VALUE ra51_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE f31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE e63_11ff  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) not able to answer' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE f141_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE e3ffffff  1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE e64_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE g1061_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) left' 2='(2) right'
                3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE f41_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE g15a1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know' 9='(9)  missing';
VALUE f45fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE f652ffff  1='(01) public free medical services' 2='(02) collective medical services'
                3='(03) UNDOCUMENTED CODE' 4='(04) medical insurance' 5='(05) self' 6='(06) spouse'
                7='(07) children' 8='(08) no money to pay' 9='(09) others' 99='(99) missing';
VALUE e62fffff  -1='(-1) not applicable' 1='(1) willing to do' 2='(2) without patience'
                3='(3) need respite care' 4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE g83_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE d11g23ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE d11incof  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g15n3a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) do not know'
                9='(9) missing';
VALUE d11beddf  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE a537_14f  0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE d11dreaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE e67_11ff  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE e7_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE b11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE d11finaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relative''s' 6='(6) state/local govenments or collectives' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE g131_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE f41fffff  1='(1) currently married and living with spouse' 2='(2) separated'
                3='(3)  divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE g14a1fff  -1='(-1) not applicable' 0='(00) UNDOCUMENTED CODE' 1='(01) hypertension'
                2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) uterine tumor'
                22='(22) hepatitis' 23='(23) other'
                66='(66) natural senescence without reporting any disease' 88='(88) don''t know'
                99='(99) missing';
VALUE f92a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE f103a5ff  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE ra51ffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d11contf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE g1ffffff  1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see'
                4='(4) blind' 8='(8) don''t know' 9='(9) missing';
VALUE f64affff  0='(0) no' 1='(1) yes' 9='(9) missing';
VALUE e62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE f27_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) not worth'
                2='(2) not necessary' 3='(3) cannot afford to the payment' 8='(8) do not know'
                9='(9) missing';
VALUE f41a12_f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) do not know'
                99='(99) missing';
VALUE g23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) do not brush'
                1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE c32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) can''t use pen to draw the figure' 9='(9) not able to do this (disabled)';
VALUE d14hypef  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a54b_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE f103a2ff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
                8='(8) don''t know' 9='(9) missing';
VALUE monthinf  99='(99) missing';
VALUE a540_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE re65_14f  3='(3) without proxy';
VALUE f141ffff  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE f25b1_1_1f  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE d14g106f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE c22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE g511_11f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) don''t know'
                999='(999) missing';
VALUE d34fffff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE d11retpf  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE c16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) not able to answer'
                99='(99) missing';
VALUE g1063_1_1f  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000' 3='(3) elder first interviewed in 2002'
                4='(4) elder first interviewed in 2005'
                5='(5) elder first interviewed in 2008 to replace those lost to fol'
                6='(6) newly added elder in 2008' 7='(7) sibling of 1,2,3,4,5' 9='(9) missing';
VALUE g14b1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) uterine tumor'
                22='(22) hepatitis' 23='(23) other' 24='(24) UNDOCUMENTED CODE'
                25='(25) UNDOCUMENTED CODE' 66='(66) natural senescence without reporting any disease'
                88='(88) don''t know' 99='(99) missing';
VALUE c31d_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to do' 9='(9) missing';
VALUE d11a53af  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE f111afff  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE a51fffff  1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution'
                9='(9) missing';
VALUE f64a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 9='(9) missing';
VALUE f43a2_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d6a_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE d14livaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home'
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE b28_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE g15a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE d11vyeaf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors';
VALUE d11g4fff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE c22fffff  -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE g14a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
VALUE d14smokf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE e1bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 100000 days' 9999='(9999) missing';
VALUE f62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) didn''t answer' 9='(9) missing';
VALUE f64e1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a53a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE c16fffff  88='(88) not able to answer' 99='(99) missing';
VALUE g01_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE g7_11fff  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                999='(999) missing';
VALUE re14_14f  12='(12) without proxy';
VALUE h71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE b121ffff  1='(1) much better' 2='(2) a little better' 3='(3) no change'
                4='(4) a little worse' 5='(5) much worse' 8='(8) not able to answer' 9='(9)  missing';
VALUE b210_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) all day long'
                2='(2) most of the day' 3='(3) about half of the day' 4='(4) less than half of the day'
                8='(8) not able to answer' 9='(9) missing';
VALUE f901b1_f  -9='(-09) lost to follow-up in the 2011 survey'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE e64fffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children and their spouses' 4='(4) grandchildren and their spouses'
                5='(5) public and collectives' 6='(6) others' 8='(8) not able to answer' 9='(9) missing';
VALUE d6afffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE d76_14ff  1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE e1b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 100000 days'
                9999='(9999) missing';
VALUE d11g106f  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE d11payif  -9='(-0009) lost to follow-up in the 2011 survey'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                8888='(08888) don''t know' 9998='(09998) more than 10000' 9999='(09999) missing'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f46_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE d11cargf  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body ' 9='(9) do not need care';
VALUE f5ffffff  1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchildren'
                8='(08) other relatives' 9='(09) friends and neighbors' 10='(10) social services'
                11='(11) live-in care giver' 12='(12) nobody' 88='(88) don''t know' 99='(99) missing';
VALUE f84fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d77_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) at much less risk'
                2='(2) at less risk' 3='(3) at the same risk' 4='(4) at higher risk'
                5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE re9_14ff  7='(7) without proxy';
VALUE d14genef  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no' 3='(3) UNDOCUMENTED CODE' 8='(8) didn''t answer'
                9='(9) missing';
VALUE ra41ffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                9='(9) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0005;
INFILE "&VERSION\DS0005\36692-0005-Data.txt" LRECL=6111;
INPUT
       ID 1-8                  YEARIN 9-12
        MONTHIN 13-14           DAYIN 15-16             V_BTHYR 17-20
        V_BTHMON 21-22          PROV 23-24              TYPE 25
        RESIDENC 26             TRUEAGE 27-29           A1 30
        A2 31                   RA41 32-33              A41 34-35
        RA42 36-37              A42 38                  RA43 39-40
        A43 41                  RA51 42                 A51 43
        RA52 44-45              A52 46-47               RA53A 48-49
        A53A1 50-51             A53A3 52-53             A53A2 54-56
        A53A4 57-58             RA53B 59-60             A53B1 61-62
        A53B3 63-64             A53B2 65-67             A53B4 68-69
        RA53C 70-71             A53C1 72-73             A53C3 74-75
        A53C2 76-78             A53C4 79-80             RA53D 81-82
        A53D1 83-84             A53D3 85-86             A53D2 87-89
        A53D4 90-91             RA53E 92-93             A53E1 94-95
        A53E3 96-97             A53E2 98-100            A53E4 101-102
        RA53F 103-104           A53F1 105-106           A53F3 107-108
        A53F2 109-111           A53F4 112-113           RA53G 114-115
        A53G1 116-117           A53G3 118-119           A53G2 120-122
        A53G4 123-124           RA53H 125-126           A53H1 127-128
        A53H3 129-130           A53H2 131-133           A53H4 134-135
        RA53I 136-137           A53I1 138-139           A53I3 140-141
        A53I2 142-144           A53I4 145-146           RA53J 147-148
        A53J1 149-150           A53J3 151-152           A53J2 153-155
        A53J4 156-157           RA53K 158-159           A53K1 160-161
        A53K11 $162             A53K3 163-164           A53K2 165-167
        A53K4 168-169           RA53L 170-171           A53L1 172-173
        A53L11 $174             A53L3 175-176           A53L2 177-179
        A53L4 180-181           RA530 182-183           A530 184-185
        RA531 186-187           A531 188-189            RA532 190-191
        A532 192-193            RA541 194-195           A541 196-199
        RA542 200-201           A542 202-203            RA54 204-205
        A54A 206-209            A54B 210-211            B11 212
        B12 213                 B121 214                B21 215
        B22 216                 B23 217                 B24 218
        B25 219                 B26 220                 B27 221
        C11 222                 C12 223                 C13 224
        C14 225                 C15 226                 C16 227-228
        C21A 229                C21B 230                C21C 231
        C22 232-233             C31A 234                C31B 235
        C31C 236                C31D 237                C31E 238
        C32 239                 C41A 240                C41B 241
        C41C 242                C51A 243                C51B 244
        C52 245                 C52X1 246               C52X2 247
        C53A 248                C53B 249                C53C 250
        C54 251                 C55 252-253             RD1 254
        D1 255                  RD2 256                 D2 257-258
        RD31 259                D31 260                 RD32 261
        D32 262                 RD33 263                D33 264
        RD34 265                D34 266                 RD4MEAT 267
        D4MEAT2 268             D4MEAT1 269             RD4FISH 270
        D4FISH2 271             D4FISH1 272             RD4EGG 273
        D4EGG2 274              D4EGG1 275              RD4BEAN 276
        D4BEAN2 277             D4BEAN1 278             RD4VEG 279
        D4VEG2 280              D4VEG1 281              RD4SUGA 282
        D4SUGA2 283             D4SUGA1 284             RD4TEA 285
        D4TEA2 286              D4TEA1 287              RD4GARL 288
        D4GARL2 289             D4GARL1 290             RDEMILK 291
        D4MILK1 292             D4MILK2 293             RD4NUT 294
        D4NUT1 295              D4NUT2 296              RD4ALGA 297
        D4ALGA1 298             D4ALGA2 299             RD4VIT 300
        D4VIT1 301              D4VIT2 302              RD4DRUG 303
        D4DRUG1 304             D4DRUG2 305             RD5 306
        D5 307                  RD6 308                 D6A 309
        D6B 310                 D6C 311                 RD71 312
        D71 313                 RD72 314                D72 315
        RD73 316-317            D73 318-320             RD74 321-322
        D74 323-325             RD75 326-327            D75 328-329
        RD81 330                D81 331                 RD82 332
        D82 333                 RD83 334-335            D83 336-338
        RD84 339-340            D84 341-343             RD85 344-345
        D85 346-347             RD86 348                D86 349-350
        RD91 351                D91 352                 RD92 353-354
        D92 355                 RD93 356-357            D93 358-360
        RD94 361-362            D94 363-365             RD101 366
        D101 367                RD102 368-369           D102 370-372
        RD103 373-374           D103 375-377            RD11A 378
        D11A 379                RD11B 380               D11B 381
        RD11C 382               D11C 383                RD11D 384
        D11D 385                RD11E 386               D11E 387
        RD11F 388               D11F 389                RD11G 390
        D11G 391                RD11H 392               D11H 393
        RD12 394                D12 395-396             RE6 397
        E6 398                  RE6B 399                E6B 400-403
        RE1 404                 E1 405                  RE1B 406
        E1B 407-410             RE2 411                 E2 412
        RE2B 413                E2B 414-417             RE3 418
        E3 419                  RE3B 420                E3B 421-424
        RE4 425                 E4 426                  RE4B 427
        E4B 428-431             RE5 432                 E5 433
        RE5B 434                E5B 435-438             RE610 439
        E610 440-441            RE62 442                E62 443-444
        RE63 445                E63 446-450             RE64 451
        E64 452-453             RE65 454                E65 455-456
        RE67 457                E67 458-460             RE7 461
        E7 462                  RE8 463                 E8 464
        RE9 465                 E9 466                  RE10 467
        E10 468                 RE11 469                E11 470
        RE12 471                E12 472                 RE13 473
        E13 474                 RE14 475                E14 476
        RF1 477-478             F1 479-480              RF2 481-482
        F2 483-484              RF21 485-486            F21 487-488
        RF211 489-490           F211 491-492            RF22 493-494
        F22 495-498             RF23 499-500            F23 501-502
        RF31 503                F31 504-505             RF32 506
        F32A 507-508            F32B 509-510            F32C 511-512
        F32D 513-514            F32E 515-516            RF33 517
        F33 518-519             RF340 520               F340 521
        RF34 522                F34 523                 RF35 524
        F35 525-529             RF41 530                F41 531
        RF42 532-533            F42 534-535             RF43A 536-537
        F43A1 538-540           F43A2 541-542           F43A3 543-545
        F43A4 546-547           RF43B 548-549           F43B1 550-552
        F43B2 553-554           F43B3 555-557           F43B4 558-559
        RF43C 560-561           F43C1 562-564           F43C2 565-566
        F43C3 567-569           F43C4 570-571           RF43D 572-573
        F43D1 574-576           F43D2 577-578           F43D3 579-581
        F43D4 582-583           RF44 584-585            F44 586-587
        RF45 588-589            F45 590-591             RF46 592-593
        F46 594-595             RF47 596                F47 597
        RF5 598                 F5 599-600              RF61 601
        F61 602                 RF610 603               F610 604-605
        RF62 606                F62 607                 RF63 608
        F63 609                 RF64 610                F64A 611
        F64B 612                F64C 613                F64D 614
        F64E 615                F64F 616                F64G 617
        F64H 618                F64I 619                RF651A 620
        F651A 621-625           RF651B 626              F651B 627-631
        RF652 632               F652 633-634            RF66 635-636
        F66 637                 RF71 638-639            F71 640
        RF721 641-642           F721 643-645            RF722 646-647
        F722 648-650            RF73 651-652            F73 653-655
        RF74 656                F74 657-658             RF81 659-660
        F81 661                 RF821 662-663           F821 664-666
        RF822 667-668           F822 669-671            RF83 672-673
        F83 674-676             RF84 677                F84 678-679
        RF85 680                F85 681-682             RF86 683
        F86 684-685             RF9 686-687             F9 688-689
        F9A 690-691             RF91 692-693            F91 694-695
        RF92A 696-697           F92A1 698-699           F92A2 700-701
        F92A3 702-703           F92A4 704-706           F92A5 707-708
        F92A6 709-710           RF92B 711-712           F92B1 713-714
        F92B2 715-716           F92B3 717-718           F92B4 719-721
        F92B5 722-723           F92B6 724-725           RF92C 726-727
        F92C1 728-729           F92C2 730-731           F92C3 732-733
        F92C4 734-736           F92C5 737-738           F92C6 739-740
        RF92D 741-742           F92D1 743-744           F92D2 745-746
        F92D3 747-748           F92D4 749-751           F92D5 752-753
        F92D6 754-755           RF92E 756-757           F92E1 758-759
        F92E2 760-761           F92E3 762-763           F92E4 764-766
        F92E5 767-768           F92E6 769-770           RF92F 771-772
        F92F1 773-774           F92F2 775-776           F92F3 777-778
        F92F4 779-781           F92F5 782-783           F92F6 784-785
        RF92G 786-787           F92G1 788-789           F92G2 790-791
        F92G3 792-793           F92G4 794-796           F92G5 797-798
        F92G6 799-800           RF92H 801-802           F92H1 803-804
        F92H2 805-806           F92H3 807-808           F92H4 809-811
        F92H5 812-813           F92H6 814-815           RF92I 816-817
        F92I1 818-819           F92I2 820-821           F92I3 822-823
        F92I4 824-826           F92I5 827-828           F92I6 829-830
        RF92J 831-832           F92J1 833-834           F92J2 835-836
        F92J3 837-838           F92J4 839-841           F92J5 842-843
        F92J6 844-845           JIGE 846-847            RF10 848-849
        F10 850-851             F10A 852-853            RF101 854-855
        F101 856-857            RF102 858-859           F102 860-861
        F103 862-863            RF103A 864-865          F103A8 866-867
        F103A1 868-869          F103A2 870-871          F103A3 872-873
        F103A4 874-875          F103A7 876-877          F103A5 878-879
        RF103B 880-881          F103B8 882-883          F103B1 884-885
        F103B2 886-887          F103B3 888-889          F103B4 890-891
        F103B7 892-893          F103B5 894-895          RF103C 896-897
        F103C8 898-899          F103C1 900-901          F103C2 902-903
        F103C3 904-905          F103C4 906-907          F103C7 908-909
        F103C5 910-911          RF103D 912-913          F103D8 914-915
        F103D1 916-917          F103D2 918-919          F103D3 920-921
        F103D4 922-923          F103D7 924-925          F103D5 926-927
        RF103E 928-929          F103E8 930-931          F103E1 932-933
        F103E2 934-935          F103E3 936-937          F103E4 938-939
        F103E7 940-941          F103E5 942-943          RF103F 944-945
        F103F8 946-947          F103F1 948-949          F103F2 950-951
        F103F3 952-953          F103F4 954-955          F103F7 956-957
        F103F5 958-959          RF103G 960-961          F103G8 962-963
        F103G1 964-965          F103G2 966-967          F103G3 968-969
        F103G4 970-971          F103G7 972-973          F103G5 974-975
        RF103H 976-977          F103H8 978-979          F103H1 980-981
        F103H2 982-983          F103H3 984-985          F103H4 986-987
        F103H7 988-989          F103H5 990-991          RF103I 992-993
        F103I8 994-995          F103I1 996-997          F103I2 998-999
        F103I3 1000-1001        F103I4 1002-1003        F103I7 1004-1005
        F103I5 1006-1007        RF103J 1008-1009        F103J8 1010-1011
        F103J1 1012-1013        F103J2 1014-1015        F103J3 1016-1017
        F103J4 1018-1019        F103J7 1020-1021        F103J5 1022-1023
        RF103K 1024-1025        F103K8 1026-1027        F103K1 1028-1029
        F103K2 1030-1031        F103K3 1032-1033        F103K4 1034-1035
        F103K7 1036-1037        F103K5 1038-1039        RF103L 1040-1041
        F103L8 1042-1043        F103L1 1044-1045        F103L2 1046-1047
        F103L3 1048-1049        F103L4 1050-1051        F103L7 1052-1053
        F103L5 1054-1055        RF103M 1056-1057        F103M8 1058-1059
        F103M1 1060-1061        F103M2 1062-1063        F103M3 1064-1065
        F103M4 1066-1067        F103M7 1068-1069        F103M5 1070-1071
        RF111 1072              F111A 1073-1074         F111B 1075-1076
        F111C 1077-1078         RF112 1079              F112A 1080-1081
        F112B 1082-1083         F112C 1084-1085         RF113 1086
        F113A 1087-1088         F113B 1089-1090         F113C 1091-1092
        RF12 1093-1094          F12A 1095-1099          F12B 1100-1104
        F12C 1105-1109          RF13 1110-1111          F13A 1112-1116
        F13B 1117-1121          F13C 1122-1126          RF14 1127
        F141 1128               F142 1129               F143 1130
        F144 1131               F145 1132               F146 1133
        F147 1134               F148 1135               F149 1136
        RF15 1137               F151 1138               F152 1139
        F153 1140               F154 1141               F155 1142
        F156 1143               F157 1144               F158 1145
        F159 1146               F16 1147                G01 1148
        RG02 1149               G02 1150-1151           G1 1152
        RG21 1153               G21 1154-1155           RG22 1156
        G22 1157                RG3 1158                G3 1159
        RG4 1160                G4 1161                 RG51 1162
        G511 1163-1165          G512 1166-1168          RG52 1169
        G521 1170-1172          G522 1173-1175          G71 1176-1178
        G72 1179-1181           G81 1182                G82 1183
        G83 1184                G9 1185                 RG101 1186
        G101 1187-1189          RG102 1190              G1021 1191-1193
        G122 1194-1196          G123 1197-1199          G11 1200
        G12 1201-1202           G130 1203               RG13 1204
        G131 1205-1206          G132 1207-1208          RG14A 1209
        G14A1 1210-1211         G14A2 1212-1214         RG14B 1215
        G14B1 1216-1217         G14B2 1218-1220         RG14C 1221
        G14C1 1222-1223         G14C2 1224-1226         RG15A 1227
        G15A1 1228              G15A2 1229              G15A3 1230-1231
        RG15B 1232              G15B1 1233              G15B2 1234
        G15B3 1235-1236         RG15C 1237              G15C1 1238
        G15C2 1239              G15C3 1240-1241         RG15D 1242
        G15D1 1243              G15D2 1244              G15D3 1245-1246
        RG15E 1247              G15E1 1248              G15E2 1249
        G15E3 1250-1251         RG15F 1252              G15F1 1253
        G15F2 1254              G15F3 1255-1256         RG15G 1257
        G15G1 1258              G15G2 1259              G15G3 1260-1261
        RG15H 1262              G15H1 1263              G15H2 1264
        G15H3 1265-1266         RG15I 1267              G15I1 1268
        G15I2 1269              G15I3 1270-1271         RG15J 1272
        G15J1 1273              G15J2 1274              G15J3 1275-1276
        RG15K 1277              G15K1 1278              G15K2 1279
        G15K3 1280-1281         RG15L 1282              G15L1 1283
        G15L2 1284              G15L3 1285-1286         RG15M 1287
        G15M1 1288              G15M2 1289              G15M3 1290-1291
        RG15N 1292              G15N1 1293              G15N2 1294
        G15N3 1295-1296         RG15O 1297              G15O1 1298
        G15O2 1299              G15O3 1300-1301         RG15P 1302
        G15P1 1303              G15P2 1304              G15P3 1305-1306
        RG15Q 1307              G15Q1 1308              G15Q2 1309
        G15Q3 1310-1311         RG15R 1312              G15R1 1313
        G15R2 1314              G15R3 1315-1316         RG15S 1317
        G15S1 1318              G15S2 1319              G15S3 1320-1321
        RG15T 1322              G15T1 1323              G15T2 1324
        G15T3 1325-1326         RG15U 1327              G15U1 1328
        G15U2 1329              G15U3 1330-1331         RG15V 1332
        G15V1 1333              G15V2 1334              G15V3 1335-1336
        H1 1337                 H21 1338                H22 1339-1340
        H3 1341                 H6 1342                 H7 1343
        H71 1344-1345           W_2008 1346-1360 .13    DTH08_11 1361-1362
        YEARIN_11 1363-1366     MONTHIN_11 1367-1368    DAYIN_11 1369-1370
        RESID_11 1371-1372      VAGE_11 1373-1375       RA51_11 1376-1377
        A51_11 1378-1379        RA52_11 1380-1381       A52_11 1382-1383
        RA53A_11 1384-1385      A53A1_11 1386-1387      A53A3_11 1388-1389
        A53A2_11 1390-1392      A53A4_11 1393-1394      A53A5_11 1395-1396
        RA53B_11 1397-1398      A53B1_11 1399-1400      A53B3_11 1401-1402
        A53B2_11 1403-1405      A53B4_11 1406-1407      A53B5_11 1408-1409
        RA53C_11 1410-1411      A53C1_11 1412-1413      A53C3_11 1414-1415
        A53C2_11 1416-1418      A53C4_11 1419-1420      A53C5_11 1421-1422
        RA53D_11 1423-1424      A53D1_11 1425-1426      A53D3_11 1427-1428
        A53D2_11 1429-1431      A53D4_11 1432-1433      A53D5_11 1434-1435
        RA53E_11 1436-1437      A53E1_11 1438-1439      A53E3_11 1440-1441
        A53E2_11 1442-1444      A53E4_11 1445-1446      A53E5_11 1447-1448
        RA53F_11 1449-1450      A53F1_11 1451-1452      A53F3_11 1453-1454
        A53F2_11 1455-1457      A53F4_11 1458-1459      A53F5_11 1460-1461
        RA53G_11 1462-1463      A53G1_11 1464-1465      A53G3_11 1466-1467
        A53G2_11 1468-1472 .1   A53G4_11 1473-1474      A53G5_11 1475-1476
        RA53H_11 1477-1478      A53H1_11 1479-1480      A53H3_11 1481-1482
        A53H2_11 1483-1485      A53H4_11 1486-1487      A53H5_11 1488-1489
        RA53I_11 1490-1491      A53I1_11 1492-1493      A53I3_11 1494-1495
        A53I2_11 1496-1498      A53I4_11 1499-1500      A53I5_11 1501-1502
        RA53J_11 1503-1504      A53J1_11 1505-1506      A53J11_11 $1507
        A53J3_11 1508-1509      A53J2_11 1510-1512      A53J4_11 1513-1514
        A53J5_11 1515-1516      RA530_11 1517-1518      A530_11 1519-1520
        RA531_11 1521-1522      A531_11 1523-1524       RA532_11 1525-1526
        A532_11 1527-1528       RA533_11 1529-1530      A533_11 1531-1532
        A533A_11 $1533          RA534_11 1534-1535      A534_11 1536-1539
        RA535_11 1540-1541      A535_11 1542-1543       RA536_11 1544-1545
        A536_11 1546-1547       RA537_11 1548-1549      A537_11 1550-1551
        RA540_11 1552-1553      A540_11 1554-1555       RA541_11 1556-1557
        A541_11 1558-1561       RA542_11 1562-1563      A542_11 1564-1565
        A542A_11 $1566          RA54_11 1567-1568       A54A_11 1569-1572
        A54B_11 1573-1574       B11_11 1575-1576        B12_11 1577-1578
        B121_11 1579-1580       B21_11 1581-1582        B22_11 1583-1584
        B23_11 1585-1586        B24_11 1587-1588        B25_11 1589-1590
        B26_11 1591-1592        B27_11 1593-1594        B28_11 1595-1596
        B29_11 1597-1598        B210_11 1599-1600       C11_11 1601-1602
        C12_11 1603-1604        C13_11 1605-1606        C14_11 1607-1608
        C15_11 1609-1610        C16_11 1611-1612        C21A_11 1613-1614
        C21B_11 1615-1616       C21C_11 1617-1618       C22_11 1619-1620
        C31A_11 1621-1622       C31B_11 1623-1624       C31C_11 1625-1626
        C31D_11 1627-1628       C31E_11 1629-1630       C32_11 1631-1632
        C41A_11 1633-1634       C41B_11 1635-1636       C41C_11 1637-1638
        C51A_11 1639-1640       C51B_11 1641-1642       C52_11 1643-1644
        C52X1_11 1645-1646      C52X2_11 1647-1648      C53A_11 1649-1650
        C53B_11 1651-1652       C53C_11 1653-1654       C54_11 1655-1656
        C55_11 1657-1658        RD1_11 1659-1660        D1_11 1661-1662
        RD2_11 1663-1664        D2_11 1665-1668 .1      RD31_11 1669-1670
        D31_11 1671-1672        RD32_11 1673-1674       D32_11 1675-1676
        RD33_11 1677-1678       D33_11 1679-1680        D33A_11 $1681
        RD34_11 1682-1683       D34_11 1684-1685        RD4MEAT_11 1686-1687
        D4MEAT2_11 1688-1689    D4MEAT1_11 1690-1691    RD4FISH_11 1692-1693
        D4FISH2_11 1694-1695    D4FISH1_11 1696-1697    RD4EGG_11 1698-1699
        D4EGG2_11 1700-1701     D4EGG1_11 1702-1703     RD4BEAN_11 1704-1705
        D4BEAN2_11 1706-1707    D4BEAN1_11 1708-1709    RD4VEG_11 1710-1711
        D4VEG2_11 1712-1713     D4VEG1_11 1714-1715     RD4SUGA_11 1716-1717
        D4SUGA2_11 1718-1719    D4SUGA1_11 1720-1721    RD4TEA_11 1722-1723
        D4TEA2_11 1724-1725     D4TEA1_11 1726-1727     RD4GARL_11 1728-1729
        D4GARL2_11 1730-1731    D4GARL1_11 1732-1733    RDEMILK_11 1734-1735
        D4MILK1_11 1736-1737    D4MILK2_11 1738-1739    RD4NUT_11 1740-1741
        D4NUT1_11 1742-1743     D4NUT2_11 1744-1745     RD4ALGA_11 1746-1747
        D4ALGA1_11 1748-1749    D4ALGA2_11 1750-1751    RD4VIT_11 1752-1753
        D4VIT1_11 1754-1755     D4VIT2_11 1756-1757     RD4DRUG_11 1758-1759
        D4DRUG1_11 1760-1761    D4DRUG2_11 1762-1763    RD5_11 1764-1765
        D5_11 1766-1767         RD6_11 1768-1769        D6A_11 1770-1771
        D6B_11 1772-1773        D6C_11 1774-1775        RD71_11 1776-1777
        D71_11 1778-1779        RD72_11 1780-1781       D72_11 1782-1783
        RD73_11 1784-1785       D73_11 1786-1788        RD74_11 1789-1790
        D74_11 1791-1793        RD75_11 1794-1795       D75_11 1796-1797
        RD76_11 1798-1799       D76_11 1800-1801        RD77_11 1802-1803
        D77_11 1804-1805        RD78_11 1806-1807       D78_11 1808-1809
        D78A_11 1810-1813 .1    D78B_11 1814-1815       RD79_11 1816-1817
        D79_11 1818-1819        D79A_11 1820-1823 .1    D79B_11 1824-1825
        RD710_11 1826-1827      D710_11 1828-1829       D710A_11 1830-1831
        D710B_11 1832-1833      RD81_11 1834-1835       D81_11 1836-1837
        RD82_11 1838-1839       D82_11 1840-1841        RD83_11 1842-1843
        D83_11 1844-1846        RD84_11 1847-1848       D84_11 1849-1851
        RD85_11 1852-1853       D85_11 1854-1855        RD86_11 1856-1857
        D86_11 1858-1872 .12    RD87_11 1873-1874       D87_11 1875-1876
        RD91_11 1877-1878       D91_11 1879-1880        RD92_11 1881-1882
        D92_11 1883-1884        RD93_11 1885-1886       D93_11 1887-1889
        RD94_11 1890-1891       D94_11 1892-1894        RD101_11 1895-1896
        D101_11 1897-1898       RD102_11 1899-1900      D102_11 1901-1903
        RD103_11 1904-1905      D103_11 1906-1908       RD11A_11 1909-1910
        D11A_11 1911-1912       RD11B_11 1913-1914      D11B_11 1915-1916
        RD11C_11 1917-1918      D11C_11 1919-1920       RD11D_11 1921-1922
        D11D_11 1923-1924       RD11E_11 1925-1926      D11E_11 1927-1928
        RD11F_11 1929-1930      D11F_11 1931-1932       RD11G_11 1933-1934
        D11G_11 1935-1936       RD11H_11 1937-1938      D11H_11 1939-1940
        RD12_11 1941-1942       D12_11 1943-1944        RE0_11 1945-1946
        E0_11 1947-1948         RE1_11 1949-1950        E1_11 1951-1952
        RE1B_11 1953-1954       E1B_11 1955-1958        RE2_11 1959-1960
        E2_11 1961-1962         RE2B_11 1963-1964       E2B_11 1965-1968
        RE3_11 1969-1970        E3_11 1971-1972         RE3B_11 1973-1974
        E3B_11 1975-1978        RE4_11 1979-1980        E4_11 1981-1982
        RE4B_11 1983-1984       E4B_11 1985-1988        RE5_11 1989-1990
        E5_11 1991-1992         RE5B_11 1993-1994       E5B_11 1995-1998
        RE6_11 1999-2000        E6_11 2001-2002         RE6B_11 2003-2004
        E6B_11 2005-2008        RE610_11 2009-2010      E610_11 2011-2012
        RE62_11 2013-2014       E62_11 2015-2016        RE63_11 2017-2018
        E63_11 2019-2023        RE64_11 2024-2025       E64_11 2026-2027
        E64A_11 $2028           RE65_11 2029-2030       E65_11 2031-2032
        RE67_11 2033-2034       E67_11 2035-2037        RE7_11 2038-2039
        E7_11 2040-2041         RE8_11 2042-2043        E8_11 2044-2045
        RE9_11 2046-2047        E9_11 2048-2049         RE10_11 2050-2051
        E10_11 2052-2053        RE11_11 2054-2055       E11_11 2056-2057
        RE12_11 2058-2059       E12_11 2060-2061        RE13_11 2062-2063
        E13_11 2064-2065        RE14_11 2066-2067       E14_11 2068-2069
        RF21_11 2070-2071       F21_11 2072-2073        RF211_11 2074-2075
        F211_11 2076-2077       RF22_11 2078-2079       F22_11 2080-2083
        RF221_11 2084-2085      F221_11 2086-2090       RF23_11 2091-2092
        F23_11 2093-2094        RF24_11 2095-2096       F24_11 2097-2098
        RF25_11 2099-2100       F251_11 2101-2105       F252_11 2106-2110
        RF25B_11 2111-2112      F25B1_11 2113-2116      F25B2_11 2117-2118
        RF26_11 2119-2120       F26_11 2121-2124        RF27_11 2125-2126
        F27_11 2127-2128        RF31_11 2129-2130       F31_11 2131-2132
        RF32_11 2133-2134       F32A_11 2135-2136       F32B_11 2137-2138
        F32C_11 2139-2140       F32D_11 2141-2142       F32E_11 2143-2144
        RF33_11 2145-2146       F33_11 2147-2148        RF340_11 2149-2150
        F340_11 2151-2152       RF34_11 2153-2154       F34_11 2155-2156
        RF35_11 2157-2158       F35_11 2159-2163        RF41_11 2164-2165
        F41_11 2166-2167        RF41A_11 2168-2169      F41A1_11 2170-2171
        F41A11_11 2172-2175     F41A12_11 2176-2177     F41A2_11 2178-2179
        F41A21_11 2180-2183     F41A22_11 2184-2185     F41A3_11 2186-2187
        F41A31_11 2188-2191     F41A32_11 2192-2193     RF41B_11 2194-2195
        F41B_11 2196-2197       F41B1_11 2198-2201      F41B2_11 2202-2203
        RF42_11 2204-2205       F42_11 2206-2207        RF43A_11 2208-2209
        F43A1_11 2210-2212      F43A2_11 2213-2214      F43A3_11 2215-2217
        F43A4_11 2218-2219      RF43B_11 2220-2221      F43B1_11 2222-2224
        F43B2_11 2225-2226      F43B3_11 2227-2229      F43B4_11 2230-2231
        RF43C_11 2232-2233      F43C1_11 2234-2236      F43C2_11 2237-2238
        F43C3_11 2239-2241      F43C4_11 2242-2243      RF43D_11 2244-2245
        F43D1_11 2246-2248      F43D2_11 2249-2250      F43D3_11 2251-2253
        F43D4_11 2254-2255      RF44_11 2256-2257       F44_11 2258-2259
        RF45_11 2260-2261       F45_11 2262-2263        RF46_11 2264-2265
        F46_11 2266-2267        RF47_11 2268-2269       F47_11 2270-2271
        RF5_11 2272-2273        F5_11 2274-2275         RF61_11 2276-2277
        F61_11 2278-2279        RF610_11 2280-2281      F610_11 2282-2283
        RF62_11 2284-2285       F62_11 2286-2287        RF63_11 2288-2289
        F63_11 2290-2291        RF64_11 2292-2293       F64A_11 2294-2295
        F64B_11 2296-2297       F64C_11 2298-2299       F64D_11 2300-2301
        F64E1_11 2302-2303      F64F1_11 2304-2305      F64G1_11 2306-2307
        F64H1_11 2308-2309      F64I_11 2310-2311       RF651A1_11 2312-2313
        F651A1_11 2314-2318     RF651B1_11 2319-2320    F651B1_11 2321-2325
        RF651A2_11 2326-2327    F651A2_11 2328-2332     RF651B2_11 2333-2334
        F651B2_11 2335-2339     RF6521_11 2340-2341     F6521_11 2342-2343
        RF652A_11 2344-2345     F652A_11 2346-2360 .11  RF652B_11 2361-2362
        F652B_11 2363-2364      RF66_11 2365-2366       F66_11 2367-2368
        RF71_11 2369-2370       F71_11 2371-2372        RF721_11 2373-2374
        F721_11 2375-2377       RF722_11 2378-2379      F722_11 2380-2382
        F722A_11 2383-2384      RF73_11 2385-2386       F73_11 2387-2389
        RF74_11 2390-2391       F74_11 2392-2393        RF81_11 2394-2395
        F81_11 2396-2397        RF821_11 2398-2399      F821_11 2400-2402
        RF822_11 2403-2404      F822_11 2405-2407       F822A_11 2408-2409
        RF83_11 2410-2411       F83_11 2412-2414        RF84_11 2415-2416
        F84_11 2417-2418        RF85_11 2419-2420       F85_11 2421-2422
        RF86_11 2423-2424       F86_11 2425-2426        RF9_11 2427-2428
        F9_11 2429-2430         F9A_11 2431-2432        RF901_11 2433-2434
        F901_11 2435-2436       RF901A_11 2437-2438     F901A_11 2439-2440
        F901B1_11 2441-2443     F901B2_11 2444-2446     F901B3_11 2447-2449
        RF902_11 2450-2451      F902_11 2452-2453       RF902A_11 2454-2455
        F902A_11 2456-2457      F902B1_11 2458-2460     F902B2_11 2461-2463
        F902B3_11 2464-2466     RF91_11 2467-2468       F91_11 2469-2470
        RF92A_11 2471-2472      F92A1_11 2473-2474      F92A2_11 2475-2476
        F92A3_11 2477-2478      F92A4_11 2479-2481      F92A5_11 2482-2483
        F92A6_11 2484-2485      F92A7_11 2486-2487      RF92B_11 2488-2489
        F92B1_11 2490-2491      F92B2_11 2492-2493      F92B3_11 2494-2495
        F92B4_11 2496-2498      F92B5_11 2499-2500      F92B6_11 2501-2502
        F92B7_11 2503-2504      RF92C_11 2505-2506      F92C1_11 2507-2508
        F92C2_11 2509-2510      F92C3_11 2511-2512      F92C4_11 2513-2515
        F92C5_11 2516-2517      F92C6_11 2518-2519      F92C7_11 2520-2521
        RF92D_11 2522-2523      F92D1_11 2524-2525      F92D2_11 2526-2527
        F92D3_11 2528-2529      F92D4_11 2530-2532      F92D5_11 2533-2534
        F92D6_11 2535-2536      F92D7_11 2537-2538      RF92E_11 2539-2540
        F92E1_11 2541-2542      F92E2_11 2543-2544      F92E3_11 2545-2546
        F92E4_11 2547-2549      F92E5_11 2550-2551      F92E6_11 2552-2553
        F92E7_11 2554-2555      RF92F_11 2556-2557      F92F1_11 2558-2559
        F92F2_11 2560-2561      F92F3_11 2562-2563      F92F4_11 2564-2566
        F92F5_11 2567-2568      F92F6_11 2569-2570      F92F7_11 2571-2572
        RF92G_11 2573-2574      F92G1_11 2575-2576      F92G2_11 2577-2578
        F92G3_11 2579-2580      F92G4_11 2581-2583      F92G5_11 2584-2585
        F92G6_11 2586-2587      F92G7_11 2588-2589      RF92H_11 2590-2591
        F92H1_11 2592-2593      F92H2_11 2594-2595      F92H3_11 2596-2597
        F92H4_11 2598-2600      F92H5_11 2601-2602      F92H6_11 2603-2604
        F92H7_11 2605-2606      RF92I_11 2607-2608      F92I1_11 2609-2610
        F92I2_11 2611-2612      F92I3_11 2613-2614      F92I4_11 2615-2617
        F92I5_11 2618-2619      F92I6_11 2620-2621      F92I7_11 2622-2623
        RF92J_11 2624-2625      F92J1_11 2626-2627      F92J2_11 2628-2629
        F92J3_11 2630-2631      F92J4_11 2632-2634      F92J5_11 2635-2636
        F92J6_11 2637-2638      F92J7_11 2639-2640      JIGE_11 2641-2642
        RF10_11 2643-2644       F10_11 2645-2646        F10A_11 2647-2648
        RF101_11 2649-2650      F101_11 2651-2652       RF102_11 2653-2654
        F102_11 2655-2656       F103_11 2657-2658       RF1030_11 2659-2660
        F1030_11 2661-2662      RF1030A_11 2663-2664    F1030A_11 2665-2666
        F1030B1_11 2667-2669    F1030B2_11 2670-2672    F1030B3_11 2673-2675
        RF1031_11 2676-2677     F1031_11 2678-2679      RF1031A_11 2680-2681
        F1031A_11 2682-2683     F1031B1_11 2684-2686    F1031B2_11 2687-2689
        F1031B3_11 2690-2692    RF103A_11 2693-2694     F103A8_11 2695-2696
        F103A1_11 2697-2698     F103A2_11 2699-2700     F103A3_11 2701-2702
        F103A4_11 2703-2704     F103A7_11 2705-2706     F103A5_11 2707-2708
        RF103B_11 2709-2710     F103B8_11 2711-2712     F103B1_11 2713-2714
        F103B2_11 2715-2716     F103B3_11 2717-2718     F103B4_11 2719-2720
        F103B7_11 2721-2722     F103B5_11 2723-2724     RF103C_11 2725-2726
        F103C8_11 2727-2728     F103C1_11 2729-2730     F103C2_11 2731-2732
        F103C3_11 2733-2734     F103C4_11 2735-2736     F103C7_11 2737-2738
        F103C5_11 2739-2740     RF103D_11 2741-2742     F103D8_11 2743-2744
        F103D1_11 2745-2746     F103D2_11 2747-2748     F103D3_11 2749-2750
        F103D4_11 2751-2752     F103D7_11 2753-2754     F103D5_11 2755-2756
        RF103E_11 2757-2758     F103E8_11 2759-2760     F103E1_11 2761-2762
        F103E2_11 2763-2764     F103E3_11 2765-2766     F103E4_11 2767-2768
        F103E7_11 2769-2770     F103E5_11 2771-2772     RF103F_11 2773-2774
        F103F8_11 2775-2776     F103F1_11 2777-2778     F103F2_11 2779-2780
        F103F3_11 2781-2782     F103F4_11 2783-2784     F103F7_11 2785-2786
        F103F5_11 2787-2788     RF103G_11 2789-2790     F103G8_11 2791-2792
        F103G1_11 2793-2794     F103G2_11 2795-2796     F103G3_11 2797-2798
        F103G4_11 2799-2800     F103G7_11 2801-2802     F103G5_11 2803-2804
        RF103H_11 2805-2806     F103H8_11 2807-2808     F103H1_11 2809-2810
        F103H2_11 2811-2812     F103H3_11 2813-2814     F103H4_11 2815-2816
        F103H7_11 2817-2818     F103H5_11 2819-2820     RF103I_11 2821-2822
        F103I8_11 2823-2824     F103I1_11 2825-2826     F103I2_11 2827-2828
        F103I3_11 2829-2830     F103I4_11 2831-2832     F103I7_11 2833-2834
        F103I5_11 2835-2836     RF103J_11 2837-2838     F103J8_11 2839-2840
        F103J1_11 2841-2842     F103J2_11 2843-2844     F103J3_11 2845-2846
        F103J4_11 2847-2848     F103J7_11 2849-2850     F103J5_11 2851-2852
        RF103K_11 2853-2854     F103K8_11 2855-2856     F103K1_11 2857-2858
        F103K2_11 2859-2860     F103K3_11 2861-2862     F103K4_11 2863-2864
        F103K7_11 2865-2866     F103K5_11 2867-2868     RF103L_11 2869-2870
        F103L8_11 2871-2872     F103L1_11 2873-2874     F103L2_11 2875-2876
        F103L3_11 2877-2878     F103L4_11 2879-2880     F103L7_11 2881-2882
        F103L5_11 2883-2884     RF103M_11 2885-2886     F103M8_11 2887-2888
        F103M1_11 2889-2890     F103M2_11 2891-2892     F103M3_11 2893-2894
        F103M4_11 2895-2896     F103M7_11 2897-2898     F103M5_11 2899-2900
        RF1032_11 2901-2902     F1032_11 2903-2904      RF1033_11 2905-2906
        F1033_11 2907-2908      F111A_11 2909-2910      F111B_11 2911-2912
        F111C_11 2913-2914      F112A_11 2915-2916      F112B_11 2917-2918
        F112C_11 2919-2920      F113A_11 2921-2922      F113B_11 2923-2924
        F113C_11 2925-2926      RF12_11 2927-2928       F12A_11 2929-2933
        F12B_11 2934-2938       F12C_11 2939-2943       RF13_11 2944-2945
        F13A_11 2946-2950       F13B_11 2951-2955       F13C_11 2956-2960
        RF14_11 2961-2962       F141_11 2963-2964       F142_11 2965-2966
        F143_11 2967-2968       F144_11 2969-2970       F145_11 2971-2972
        F146_11 2973-2974       F147_11 2975-2976       F148_11 2977-2978
        F149_11 2979-2980       F14T_11 $2981           RF15_11 2982-2983
        F151_11 2984-2985       F152_11 2986-2987       F153_11 2988-2989
        F154_11 2990-2991       F155_11 2992-2993       F156_11 2994-2995
        F157_11 2996-2997       F158_11 2998-2999       F159_11 3000-3001
        F15T_11 $3002           F16_11 3003-3004        RG01_11 3005-3006
        G01_11 3007-3008        RG02_11 3009-3010       G02_11 3011-3025 .12
        RG1_11 3026-3027        G1_11 3028-3029         G1A_11 $3030
        RG21_11 3031-3032       G21_11 3033-3034        RG22_11 3035-3036
        G22_11 3037-3038        RG23_11 3039-3040       G23_11 3041-3042
        RG24_11 3043-3044       G24_11 3045-3046        RG24A_11 3047-3048
        G24A_11 3049-3050       RG25_11 3051-3052       G25_11 3053-3054
        RG25A_11 3055-3056      G25A_11 3057-3058       RG3_11 3059-3060
        G3_11 3061-3062         RG4_11 3063-3064        G4_11 3065-3066
        RG4A_11 3067-3068       G4A_11 3069-3070        RG4B_11 3071-3072
        G4B_11 3073-3074        RG5_11 3075-3076        G511_11 3077-3079
        G512_11 3080-3082       G521_11 3083-3085       G522_11 3086-3088
        G6_11 3089-3090         G7_11 3091-3093         G81_11 3094-3095
        G82_11 3096-3097        G83_11 3098-3099        G9_11 3100-3101
        G101_11 3102-3116 .11   G1011_11 3117-3118      G102_11 3119-3120
        G1021_11 3121-3123      G122_11 3124-3126       G123_11 3127-3129
        G102B_11 3130-3132      G102C_11 3133-3135      RG106_11 3136-3137
        G106_11 3138-3139       RG1061_11 3140-3141     G1061_11 3142-3143
        RG1062_11 3144-3145     G1062_11 3146-3147      RG1063_11 3148-3149
        G1063_11 3150-3151      G11_11 3152-3153        G12_11 3154-3155
        RG130_11 3156-3157      G130_11 3158-3159       RG13_11 3160-3161
        G131_11 3162-3163       G132_11 3164-3165       RG14A_11 3166-3167
        G14A1_11 3168-3169      G14A2_11 3170-3172      RG14B_11 3173-3174
        G14B1_11 3175-3176      G14B2_11 3177-3179      RG14C_11 3180-3181
        G14C1_11 3182-3183      G14C2_11 3184-3186      G15A1_11 3187-3188
        G15A2_11 3189-3190      G15A3_11 3191-3192      G15B1_11 3193-3194
        G15B2_11 3195-3196      G15B3_11 3197-3198      G15C1_11 3199-3200
        G15C2_11 3201-3202      G15C3_11 3203-3204      G15D1_11 3205-3206
        G15D2_11 3207-3208      G15D3_11 3209-3210      G15E1_11 3211-3212
        G15E2_11 3213-3214      G15E3_11 3215-3216      G15F1_11 3217-3218
        G15F2_11 3219-3220      G15F3_11 3221-3222      G15G1_11 3223-3224
        G15G2_11 3225-3226      G15G3_11 3227-3228      G15H1_11 3229-3230
        G15H2_11 3231-3232      G15H3_11 3233-3234      G15I1_11 3235-3236
        G15I2_11 3237-3238      G15I3_11 3239-3240      G15J1_11 3241-3242
        G15J2_11 3243-3244      G15J3_11 3245-3246      G15K1_11 3247-3248
        G15K2_11 3249-3250      G15K3_11 3251-3252      G15L1_11 3253-3254
        G15L2_11 3255-3256      G15L3_11 3257-3258      G15M1_11 3259-3260
        G15M2_11 3261-3262      G15M3_11 3263-3264      G15N1_11 3265-3266
        G15N2_11 3267-3268      G15N3_11 3269-3270      G15O1_11 3271-3272
        G15O2_11 3273-3274      G15O3_11 3275-3276      G15P1_11 3277-3278
        G15P2_11 3279-3280      G15P3_11 3281-3282      G15Q1_11 3283-3284
        G15Q2_11 3285-3286      G15Q3_11 3287-3288      G15R1_11 3289-3290
        G15R2_11 3291-3292      G15R3_11 3293-3294      G15N1A_11 3295-3296
        G15N2A_11 3297-3298     G15N3A_11 3299-3300     G15S1_11 3301-3302
        G15S2_11 3303-3304      G15S3_11 3305-3306      G15T1_11 3307-3308
        G15T2_11 3309-3310      G15T3_11 3311-3312      G15U1_11 3313-3314
        G15U2_11 3315-3316      G15U3_11 3317-3318      G15J1A_11 3319-3320
        G15J2A_11 3321-3322     G15J3A_11 3323-3324     G15V1_11 3325-3326
        G15V2_11 3327-3328      G15V3_11 3329-3330      G15Y2_11 3331-3332
        G15Y3_11 3333-3334      H1_11 3335-3336         H21_11 3337-3338
        H22_11 3339-3340        H3_11 3341-3342         H6_11 3343-3344
        H7_11 3345-3346         H71_11 3347-3348        D11VYEAR 3349-3352
        D11VMONTH 3353-3354     D11VDAY 3355-3356       D11RESID 3357-3358
        D11AGE 3359-3361        D11MARRY 3362-3363      D11MARRY1 3364-3365
        D11YR1 3366-3369        D11MON1 3370-3371       D11RETIRE 3372-3373
        D11RETYR 3374-3377      D11RETPEN 3378-3381     D11INSUR 3382-3383
        D11PAYIND 3384-3388     D11PAYGOV 3389-3393     D11INSPEN 3394-3397
        D11NOINSU 3398-3399     D11A53A1 3400-3401      D11A53A3 3402-3403
        D11A53A4 3404-3406      D11A53A5 3407-3408      D11A53A6 3409-3410
        D11A53B1 3411-3412      D11A53B3 3413-3414      D11A53B4 3415-3417
        D11A53B5 3418-3419      D11A53B6 3420-3421      D11A53C1 3422-3423
        D11A53C3 3424-3425      D11A53C4 3426-3428      D11A53C5 3429-3430
        D11A53C6 3431-3432      D11A53D1 3433-3434      D11A53D3 3435-3436
        D11A53D4 3437-3439      D11A53D5 3440-3441      D11A53D6 3442-3443
        D11A53E1 3444-3445      D11A53E3 3446-3447      D11A53E4 3448-3450
        D11A53E5 3451-3452      D11A53E6 3453-3454      D11A53F1 3455-3456
        D11A53F3 3457-3458      D11A53F4 3459-3461      D11A53F5 3462-3463
        D11A53F6 3464-3465      D11A53G1 3466-3467      D11A53G3 3468-3469
        D11A53G4 3470-3472      D11A53G5 3473-3474      D11A53G6 3475-3476
        D11A53H1 3477-3478      D11A53H3 3479-3480      D11A53H4 3481-3483
        D11A53H5 3484-3485      D11A53H6 3486-3487      D11A53I1 3488-3489
        D11A53I3 3490-3491      D11A53I4 3492-3494      D11A53I5 3495-3496
        D11A53I6 3497-3498      D11A53J1 3499-3500      D11A53J3 3501-3502
        D11A53J4 3503-3505      D11A53J5 3506-3507      D11A53J6 3508-3509
        D11LIVARR 3510-3511     D11PERSON 3512-3513     D11GENER 3514-3515
        D11DPLACE 3516-3517     D11CARGIV 3518-3519     D11PCGDAY 3520-3524 .1
        D11BEDRID 3525-3526     D11BEDDAY 3527-3530     D11ILL 3531-3532
        D11DISEA1 3533-3534     D11DIDAY1 3535-3538     D11DISEA2 3539-3540
        D11DIDAY2 3541-3544     D11DISEA3 3545-3546     D11DIDAY3 3547-3550
        D11HYPERT 3551-3552     D11DIABET 3553-3554     D11HEART 3555-3556
        D11CVD 3557-3558        D11PNEUM 3559-3560      D11TUBERC 3561-3562
        D11CANCER 3563-3564     D11GLAUCO 3565-3566     D11PROSTA 3567-3568
        D11GYNECO 3569-3570     D11GASTRI 3571-3572     D11PARKIN 3573-3574
        D11BEDSOR 3575-3576     D11DEMENT 3577-3578     D11PSYCHO 3579-3580
        D11NEUROS 3581-3582     D11ARTHRI 3583-3584     D11OTHERS 3585-3586
        D11MEDICA 3587-3588     D11FINANC 3589-3590     D11INCOME 3591-3595
        D11WCFACI 3596-3597     D11TAPWAT 3598-3599     D11BATHFA 3600-3601
        D11HEATER 3602-3603     D11TVSET 3604-3605      D11WASHMA 3606-3607
        D11PHONE 3608-3609      D11DOCTOR 3610-3611     D11LICDOC 3612-3613
        D11WHOPAY 3614-3615     D11MEDCOS 3616-3620     D11POCKET 3621-3625
        D11BATHFU 3626-3627     D11BATDAY 3628-3631     D11BATDAY1 3632-3635
        D11BATDAY2 3636-3639    D11DRESFU 3640-3641     D11DREDAY 3642-3645
        D11DREDAY1 3646-3649    D11DREDAY2 3650-3653    D11TOILFU 3654-3655
        D11TOIDAY 3656-3659     D11TOIDAY1 3660-3663    D11TOIDAY2 3664-3667
        D11MOVEFU 3668-3669     D11MOVDAY 3670-3673     D11MOVDAY1 3674-3677
        D11MOVDAY2 3678-3681    D11CONTFU 3682-3683     D11CONDAY 3684-3687
        D11CONDAY1 3688-3691    D11CONDAY2 3692-3695    D11FEEDFU 3696-3697
        D11FEEDAY 3698-3701     D11FEEDAY1 3702-3705    D11FEEDAY2 3706-3709
        D11FULLDA 3710-3713     D11CARCST 3714-3718     D11DIRCST 3719-3723
        D11CARPAY 3724-3725     D11OUTDOR 3726-3731 .1  D11ACTDAY 3732-3737 .1
        D11SMOKE 3738-3739      D11SMKTIM 3740-3741     D11D21B 3742-3743
        D11DRINK 3744-3745      D11KNDDRK 3746-3747     D11DRKMCH 3748-3762 .12
        D11ADVDIR 3763-3764     D11DIRDAY 3765-3768     D11DREAM 3769-3770
        D11PAIN 3771-3772       D11UNCONS 3773-3774     D11UNCDAY 3775-3778
        D11A533 3779-3780       D11A534 3781-3784       D11A535 3785-3786
        D11A536 3787-3788       D11A537 3789-3790       D11G23 3791-3792
        D11G24 3793-3794        D11G24A 3795-3796       D11G25 3797-3798
        D11G25A 3799-3800       D11G4 3801-3802         D11G4A 3803-3804
        D11G4B 3805-3806        D11G102 3807-3809       D11G106 3810-3811
        D11G1061 3812-3813      D11G1062 3814-3815      D11G1063 3816-3817
        DTH11_14 3818-3819      YEARIN_14 3820-3823     MONTHIN_14 3824-3825
        DAYIN_14 3826-3827      V_BTHYR_14 3828-3831    V_BTHMON_14 3832-3833
        RESIDENC_14 3834        TRUEAGE_14 3835-3837    RA41_14 3838-3839
        A41_14 3840-3841        RA42_14 3842-3843       A42_14 3844
        RA43_14 3845-3846       A43_14 3847             RA51_14 3848
        A51_14 3849             RA52_14 3850-3851       A52_14 3852-3853
        RA53A_14 3854-3855      A53A1_14 3856-3857      A53A11_14 3858
        A53A2_14 3859-3861      A53A3_14 3862-3864      A53A4_14 3865-3866
        A53A5_14 3867-3868      RA53B_14 3869-3870      A53B1_14 3871-3872
        A53B11_14 3873          A53B2_14 3874-3876      A53B3_14 3877-3879
        A53B4_14 3880-3881      A53B5_14 3882-3883      RA53C_14 3884-3885
        A53C1_14 3886-3887      A53C11_14 3888          A53C2_14 3889-3891
        A53C3_14 3892-3896 .1   A53C4_14 3897-3898      A53C5_14 3899-3900
        RA53D_14 3901-3902      A53D1_14 3903-3904      A53D11_14 3905
        A53D2_14 3906-3908      A53D3_14 3909-3923 .11  A53D4_14 3924-3925
        A53D5_14 3926-3927      RA53E_14 3928-3929      A53E1_14 3930-3931
        A53E11_14 3932          A53E2_14 3933-3935      A53E3_14 3936-3938
        A53E4_14 3939-3940      A53E5_14 3941-3942      RA53F_14 3943-3944
        A53F1_14 3945-3946      A53F11_14 3947          A53F2_14 3948-3950
        A53F3_14 3951-3955 .1   A53F4_14 3956-3957      A53F5_14 3958-3959
        RA53G_14 3960-3961      A53G1_14 3962-3963      A53G11_14 3964
        A53G2_14 3965-3967      A53G3_14 3968-3970      A53G4_14 3971-3972
        A53G5_14 3973-3974      RA53H_14 3975-3976      A53H1_14 3977-3978
        A53H11_14 3979          A53H2_14 3980-3982      A53H3_14 3983-3985
        A53H4_14 3986-3987      A53H5_14 3988-3989      RA53I_14 3990-3991
        A53I1_14 3992-3993      A53I11_14 3994          A53I2_14 3995-3997
        A53I3_14 3998-4000      A53I4_14 4001-4002      A53I5_14 4003-4004
        RA53J_14 4005-4006      A53J1_14 4007-4008      A53J11_14 4009
        A53J2_14 4010-4012      A53J3_14 4013-4015      A53J4_14 4016-4017
        A53J5_14 4018-4019      RA530_14 4020-4021      A530_14 4022-4023
        A530A_14 4024           RA531_14 4025-4026      A531_14 4027-4028
        A531A_14 4029           RA532_14 4030-4031      A532_14 4032-4033
        RA533_14 4034-4035      A533_14 4036            A533A_14 4037
        RA534_14 4038-4039      A534_14 4040-4043       RA535_14 4044-4045
        A535_14 4046            RA536_14 4047-4048      A536_14 4049
        RA537_14 4050-4051      A537_14 4052            A537A_14 4053
        RA540_14 4054-4055      A540_14 4056            RA541_14 4057-4058
        A541_14 4059-4062       RA542_14 4063-4064      A542_14 4065-4066
        A542A_14 4067           RA54_14 4068-4069       A54A_14 4070-4073
        A54B_14 4074-4075       B11_14 4076             B12_14 4077
        B121_14 4078            B21_14 4079             B22_14 4080
        B23_14 4081             B24_14 4082             B25_14 4083
        B26_14 4084             B27_14 4085             B28_14 4086
        B29_14 4087             B210_14 4088            C11_14 4089
        C12_14 4090             C13_14 4091             C14_14 4092
        C15_14 4093             C16_14 4094-4095        C21A_14 4096
        C21B_14 4097            C21C_14 4098            C22_14 4099-4100
        C31A_14 4101            C31B_14 4102            C31C_14 4103
        C31D_14 4104            C31E_14 4105            C32_14 4106
        C41A_14 4107            C41B_14 4108            C41C_14 4109
        C51A_14 4110            C51B_14 4111            C52_14 4112
        C53A_14 4113            C53B_14 4114            C53C_14 4115
        C54_14 4116             C55_14 4117-4118        RD1_14 4119
        D1_14 4120              RD2_14 4121             D2_14 4122-4125 .1
        RD31_14 4126            D31_14 4127             RD32_14 4128
        D32_14 4129             RD33_14 4130            D33_14 4131
        D33A_14 4132            RD34_14 4133            D34_14 4134
        RD4MEAT_14 4135         D4MEAT2_14 4136         D4MEAT1_14 4137
        RD4FISH_14 4138         D4FISH2_14 4139         D4FISH1_14 4140
        RD4EGG_14 4141          D4EGG2_14 4142          D4EGG1_14 4143
        RD4BEAN_14 4144         D4BEAN2_14 4145         D4BEAN1_14 4146
        RD4VEG_14 4147          D4VEG2_14 4148          D4VEG1_14 4149
        RD4SUGA_14 4150         D4SUGA2_14 4151         D4SUGA1_14 4152
        RD4TEA_14 4153          D4TEA2_14 4154          D4TEA1_14 4155
        RD4GARL_14 4156         D4GARL2_14 4157         D4GARL1_14 4158
        RD4MILK_14 4159         D4MILK1_14 4160         D4MILK2_14 4161
        RD4NUT_14 4162          D4NUT1_14 4163          D4NUT2_14 4164
        RD4ALGA_14 4165         D4ALGA1_14 4166         D4ALGA2_14 4167
        RD4VIT_14 4168          D4VIT1_14 4169          D4VIT2_14 4170
        RD4DRUG_14 4171         D4DRUG1_14 4172         D4DRUG2_14 4173
        D4A_14 4174             D4B_14 4175             RD5_14 4176
        D5_14 4177              RD6_14 4178             D6A_14 4179
        D6B_14 4180             D6C_14 4181             RD71_14 4182
        D71_14 4183             RD72_14 4184            D72_14 4185
        RD73_14 4186-4187       D73_14 4188-4190        RD74_14 4191-4192
        D74_14 4193-4195        RD75_14 4196-4197       D75_14 4198-4199
        RD76_14 4200-4201       D76_14 4202             RD77_14 4203-4204
        D77_14 4205             RD78_14 4206-4207       D78_14 4208
        D78A_14 4209-4212 .1    D78B_14 4213-4214       RD79_14 4215-4216
        D79_14 4217             D79A_14 4218-4221 .1    D79B_14 4222-4223
        RD710_14 4224-4225      D710_14 4226            D710A_14 4227-4230 .1
        D710B_14 4231-4232      RD81_14 4233            D81_14 4234
        RD82_14 4235            D82_14 4236             RD83_14 4237-4238
        D83_14 4239-4241        RD84_14 4242-4243       D84_14 4244-4246
        RD85_14 4247-4248       D85_14 4249-4250        D85A_14 4251
        RD86_14 4252            D86_14 4253-4267 .12    RD87_14 4268-4269
        D87_14 4270             RD91_14 4271            D91_14 4272
        RD92_14 4273-4274       D92_14 4275             RD93_14 4276-4277
        D93_14 4278-4280        RD94_14 4281-4282       D94_14 4283-4285
        RD101_14 4286           D101_14 4287            RD102_14 4288-4289
        D102_14 4290-4292       RD103_14 4293-4294      D103_14 4295-4297
        RD11A_14 4298           D11A_14 4299            RD11B_14 4300
        D11B_14 4301            RD11C_14 4302           D11C_14 4303
        RD11D_14 4304           D11D_14 4305            RD11E_14 4306
        D11E_14 4307            RD11F_14 4308           D11F_14 4309
        RD11G_14 4310           D11G_14 4311            RD11H_14 4312
        D11H_14 4313            RD12_14 4314            D12_14 4315-4316
        RE0_14 4317-4318        E0_14 4319              RE1_14 4320
        E1_14 4321              RE1B_14 4322            E1B_14 4323-4326
        RE2_14 4327             E2_14 4328              RE2B_14 4329
        E2B_14 4330-4333        RE3_14 4334             E3_14 4335
        RE3B_14 4336            E3B_14 4337-4340        RE4_14 4341
        E4_14 4342              RE4B_14 4343            E4B_14 4344-4347
        RE5_14 4348             E5_14 4349              RE5B_14 4350
        E5B_14 4351-4354        RE6_14 4355             E6_14 4356
        RE6B_14 4357            E6B_14 4358-4361        RE610_14 4362
        E610_14 4363-4364       RE62_14 4365            E62_14 4366-4367
        RE63_14 4368            E63_14 4369-4373        RE64_14 4374
        E64_14 4375-4376        E64A_14 4377            RE65_14 4378
        E65_14 4379-4380        RE67_14 4381            E67_14 4382-4384
        RE7_14 4385             E7_14 4386              RE8_14 4387
        E8_14 4388              RE9_14 4389             E9_14 4390
        RE10_14 4391            E10_14 4392             RE11_14 4393
        E11_14 4394             RE12_14 4395-4396       E12_14 4397
        RE13_14 4398-4399       E13_14 4400             RE14_14 4401-4402
        E14_14 4403             RF1_14 4404-4405        F1_14 4406-4407
        RF2_14 4408-4409        F2_14 4410-4411         RF21_14 4412-4413
        F21_14 4414-4415        RF211_14 4416-4417      F211_14 4418-4419
        RF22_14 4420-4421       F22_14 4422-4425        RF221_14 4426-4427
        F221_14 4428-4432       RF23_14 4433-4434       F23_14 4435-4436
        RF24_14 4437-4438       F24_14 4439             RF25A_14 4440-4441
        F25A1_14 4442-4446      F25A2_14 4447-4452      RF25B_14 4453-4454
        F25B1_14 4455-4458      F25B2_14 4459-4460      RF26_14 4461-4462
        F26_14 4463-4465        RF27_14 4466-4467       F27_14 4468
        RF31_14 4469            F31_14 4470-4471        RF32_14 4472
        F32A_14 4473-4474       F32B_14 4475-4476       F32C_14 4477-4478
        F32D_14 4479-4480       F32E_14 4481-4482       RF33_14 4483
        F33_14 4484-4485        RF340_14 4486           F340_14 4487
        RF34_14 4488            F34_14 4489             RF35_14 4490
        F35_14 4491-4495        RF41_14 4496            F41_14 4497
        RF41A_14 4498-4499      F41A1_14 4500           F41A11_14 4501-4504
        F41A12_14 4505-4506     F41A2_14 4507           F41A21_14 4508-4511
        F41A22_14 4512-4513     F41A3_14 4514           F41A31_14 4515-4518
        F41A32_14 4519-4520     RF41B_14 4521-4522      F41B_14 4523
        F41B1_14 4524-4527      F41B2_14 4528-4529      RF42_14 4530-4531
        F42_14 4532-4533        RF43A_14 4534-4535      F43A1_14 4536-4538
        F43A2_14 4539-4540      F43A3_14 4541-4543      F43A4_14 4544-4545
        RF43B_14 4546-4547      F43B1_14 4548-4550      F43B2_14 4551-4552
        F43B3_14 4553-4555      F43B4_14 4556-4557      RF43C_14 4558-4559
        F43C1_14 4560-4562      F43C2_14 4563-4564      F43C3_14 4565-4567
        F43C4_14 4568-4569      RF43D_14 4570-4571      F43D1_14 4572-4574
        F43D2_14 4575-4576      F43D3_14 4577-4579      F43D4_14 4580-4581
        RF44_14 4582-4583       F44_14 4584-4585        RF45_14 4586-4587
        F45_14 4588-4589        RF46_14 4590-4591       F46_14 4592-4593
        RF47_14 4594            F47_14 4595             RF5_14 4596
        F5_11_14 4597-4598      RF61_14 4599            F61_14 4600
        RF610_14 4601           F610_14 4602-4603       RF62_14 4604
        F62_14 4605             RF63_14 4606            F63_14 4607
        RF64_14 4608            F64A_14 4609            F64B_14 4610
        F64C_14 4611            F64D_14 4612            F64E_14 4613
        F64F_14 4614            F64G_14 4615            F64H_14 4616
        F64I_14 4617            RF651A1_14 4618-4619    F651A1_14 4620-4624
        RF651B1_14 4625-4626    F651B1_14 4627-4631     RF651A2_14 4632-4633
        F651A2_14 4634-4639     RF651B2_14 4640-4641    F651B2_14 4642-4646
        RF6521_14 4647-4648     F6521_14 4649           F6521T_14 4650
        RF652A_14 4651-4652     F652A_14 4653-4667 .11  RF652B_14 4668-4669
        F652B_14 4670           RF66_14 4671-4672       F66_14 4673
        RF71_14 4674-4675       F71_14 4676             RF721_14 4677-4678
        F721_14 4679-4681       RF722_14 4682-4683      F722_14 4684-4686
        RF73_14 4687-4688       F73_14 4689-4691        RF74_14 4692
        F74_14 4693-4696 .1     RF81_14 4697-4698       F81_14 4699
        RF821_14 4700-4701      F821_14 4702-4704       RF822_14 4705-4706
        F822_14 4707-4709       RF83_14 4710-4711       F83_14 4712-4726 .11
        RF84_14 4727            F84_14 4728-4729        RF85_14 4730
        F85_14 4731-4732        RF86_14 4733            F86_14 4734-4735
        RF91_14 4736-4737       F91_14 4738-4739        RF92A_14 4740-4741
        F92A1_14 4742-4743      F92A2_14 4744-4745      F92A3_14 4746-4747
        F92A4_14 4748-4750      F92A5_14 4751-4752      F92A6_14 4753-4754
        F92A7_14 4755-4756      RF92B_14 4757-4758      F92B1_14 4759-4760
        F92B2_14 4761-4762      F92B3_14 4763-4764      F92B4_14 4765-4767
        F92B5_14 4768-4769      F92B6_14 4770-4771      F92B7_14 4772-4773
        RF92C_14 4774-4775      F92C1_14 4776-4777      F92C2_14 4778-4779
        F92C3_14 4780-4781      F92C4_14 4782-4784      F92C5_14 4785-4786
        F92C6_14 4787-4788      F92C7_14 4789-4790      RF92D_14 4791-4792
        F92D1_14 4793-4794      F92D2_14 4795-4796      F92D3_14 4797-4798
        F92D4_14 4799-4801      F92D5_14 4802-4803      F92D6_14 4804-4805
        F92D7_14 4806-4807      RF92E_14 4808-4809      F92E1_14 4810-4811
        F92E2_14 4812-4813      F92E3_14 4814-4815      F92E4_14 4816-4818
        F92E5_14 4819-4820      F92E6_14 4821-4822      F92E7_14 4823-4824
        RF92F_14 4825-4826      F92F1_14 4827-4828      F92F2_14 4829-4830
        F92F3_14 4831-4832      F92F4_14 4833-4835      F92F5_14 4836-4837
        F92F6_14 4838-4839      F92F7_14 4840-4841      RF92G_14 4842-4843
        F92G1_14 4844-4845      F92G2_14 4846-4847      F92G3_14 4848-4849
        F92G4_14 4850-4852      F92G5_14 4853-4854      F92G6_14 4855-4856
        F92G7_14 4857-4858      RF92H_14 4859-4860      F92H1_14 4861-4862
        F92H2_14 4863-4864      F92H3_14 4865-4866      F92H4_14 4867-4869
        F92H5_14 4870-4871      F92H6_14 4872-4873      F92H7_14 4874-4875
        RF92I_14 4876-4877      F92I1_14 4878-4879      F92I2_14 4880-4881
        F92I3_14 4882-4883      F92I4_14 4884-4886      F92I5_14 4887-4888
        F92I6_14 4889-4890      F92I7_14 4891-4892      RF92J_14 4893-4894
        F92J1_14 4895-4896      F92J2_14 4897-4898      F92J3_14 4899-4900
        F92J4_14 4901-4903      F92J5_14 4904-4905      F92J6_14 4906-4907
        F92J7_14 4908-4909      JIGE_14 4910-4911       RF10_14 4912-4913
        F10_14 4914-4915        F10A_14 4916-4917       RF101_14 4918-4919
        F101_14 4920-4921       RF102_14 4922-4923      F102_14 4924-4925
        RF103A_14 4926-4927     F103A8_14 4928-4929     F103A1_14 4930-4931
        F103A2_14 4932-4933     F103A3_14 4934-4948 .12 F103A4_14 4949-4950
        F103A7_14 4951-4952     F103A5_14 4953-4954     RF103B_14 4955-4956
        F103B8_14 4957-4958     F103B1_14 4959-4960     F103B2_14 4961-4962
        F103B3_14 4963-4977 .12 F103B4_14 4978-4979     F103B7_14 4980-4981
        F103B5_14 4982-4983     RF103C_14 4984-4985     F103C8_14 4986-4987
        F103C1_14 4988-4989     F103C2_14 4990-4991     F103C3_14 4992-5006 .12
        F103C4_14 5007-5008     F103C7_14 5009-5010     F103C5_14 5011-5012
        RF103D_14 5013-5014     F103D8_14 5015-5016     F103D1_14 5017-5018
        F103D2_14 5019-5020     F103D3_14 5021-5035 .12 F103D4_14 5036-5037
        F103D7_14 5038-5039     F103D5_14 5040-5041     RF103E_14 5042-5043
        F103E8_14 5044-5045     F103E1_14 5046-5047     F103E2_14 5048-5049
        F103E3_14 5050-5051     F103E4_14 5052-5053     F103E7_14 5054-5055
        F103E5_14 5056-5057     RF103F_14 5058-5059     F103F8_14 5060-5061
        F103F1_14 5062-5063     F103F2_14 5064-5065     F103F3_14 5066-5067
        F103F4_14 5068-5069     F103F7_14 5070-5071     F103F5_14 5072-5073
        RF103G_14 5074-5075     F103G8_14 5076-5077     F103G1_14 5078-5079
        F103G2_14 5080-5081     F103G3_14 5082-5083     F103G4_14 5084-5085
        F103G7_14 5086-5087     F103G5_14 5088-5089     RF103H_14 5090-5091
        F103H8_14 5092-5093     F103H1_14 5094-5095     F103H2_14 5096-5097
        F103H3_14 5098-5099     F103H4_14 5100-5101     F103H7_14 5102-5103
        F103H5_14 5104-5105     RF103I_14 5106-5107     F103I8_14 5108-5109
        F103I1_14 5110-5111     F103I2_14 5112-5113     F103I3_14 5114-5115
        F103I4_14 5116-5117     F103I7_14 5118-5119     F103I5_14 5120-5121
        RF103J_14 5122-5123     F103J8_14 5124-5125     F103J1_14 5126-5127
        F103J2_14 5128-5129     F103J3_14 5130-5131     F103J4_14 5132-5133
        F103J7_14 5134-5135     F103J5_14 5136-5137     RF103K_14 5138-5139
        F103K8_14 5140-5141     F103K1_14 5142-5143     F103K2_14 5144-5145
        F103K3_14 5146-5147     F103K4_14 5148-5149     F103K7_14 5150-5151
        F103K5_14 5152-5153     RF103L_14 5154-5155     F103L8_14 5156-5157
        F103L1_14 5158-5159     F103L2_14 5160-5161     F103L3_14 5162-5163
        F103L4_14 5164-5165     F103L7_14 5166-5167     F103L5_14 5168-5169
        RF103M_14 5170-5171     F103M8_14 5172-5173     F103M1_14 5174-5175
        F103M2_14 5176-5177     F103M3_14 5178-5179     F103M4_14 5180-5181
        F103M7_14 5182-5183     F103M5_14 5184-5185     RF104_14 5186-5187
        F104_14 5188-5190       RF105_14 5191-5192      F105_14 5193-5195
        F111A_14 5196-5197      F111B_14 5198-5199      F111C_14 5200-5201
        F112A_14 5202-5203      F112B_14 5204-5205      F112C_14 5206-5207
        F113A_14 5208-5209      F113B_14 5210-5211      F113C_14 5212-5213
        RF12_14 5214-5215       F12A_14 5216-5220       F12B_14 5221-5225
        F12C_14 5226-5230       RF13_14 5231-5232       F13A_14 5233-5237
        F13B_14 5238-5242       F13C_14 5243-5247       RF14_14 5248
        F141_14 5249            F142_14 5250            F143_14 5251
        F144_14 5252            F145_14 5253            F146_14 5254
        F147_14 5255            F148_14 5256            F149_14 5257
        F14T_14 5258            RF15_14 5259            F151_14 5260
        F152_14 5261            F153_14 5262            F154_14 5263
        F155_14 5264            F156_14 5265            F157_14 5266
        F158_14 5267            F159_14 5268            F15T_14 5269
        F16_14 5270             RG01_14 5271-5272       G01_14 5273
        RG02_14 5274            G02_14 5275-5276        RG1_14 5277-5278
        G1_14 5279              G1A_14 5280             RG21_14 5281
        G21_14 5282-5283        RG22_14 5284            G22_14 5285
        RG23_14 5286-5287       G23_14 5288             RG24_14 5289-5290
        G24_14 5291             RG24A_14 5292-5293      G24A_14 5294-5295
        RG25_14 5296-5297       G25_14 5298             RG25A_14 5299-5300
        G25A_14 5301-5302       RG3_14 5303             G3_14 5304
        RG4_14 5305             G4_14 5306              RG4A_14 5307-5308
        G4A_14 5309             RG4B_14 5310-5311       G4B_14 5312
        RG5_14 5313-5314        G511_14 5315-5317       G512_14 5318-5320
        G521_14 5321-5323       G522_14 5324-5326       G6_14 5327
        G7_14 5328-5330         G81_14 5331             G82_14 5332
        G83_14 5333             G9_14 5334              G101_14 5335-5349 .11
        G1011_14 5350-5351      G102_14 5352            G1021_14 5353-5355
        G122_14 5356-5358       G123_14 5359-5361       G102C_14 5362-5364
        RG106_14 5365-5366      G106_14 5367            RG1061_14 5368-5369
        G1061_14 5370           RG1062_14 5371-5372     G1062_14 5373
        RG1063_14 5374-5375     G1063_14 5376           G11_14 5377
        G12_14 5378-5379        RG130_14 5380-5381      G130_14 5382
        RG13_14 5383            G131_14 5384-5385       G132_14 5386-5387
        RG14A_14 5388           G14A1_14 5389-5390      G14A2_14 5391-5394
        G141T_14 5395           RG14B_14 5396           G14B1_14 5397-5398
        G14B2_14 5399-5401      G142T_14 5402           RG14C_14 5403
        G14C1_14 5404-5405      G14C2_14 5406-5408      G143T_14 5409
        G15A1_14 5410           G15A2_14 5411           G15A3_14 5412-5413
        G15B1_14 5414           G15B2_14 5415           G15B3_14 5416-5417
        G15C1_14 5418           G15C2_14 5419           G15C3_14 5420-5421
        G15D1_14 5422           G15D2_14 5423           G15D3_14 5424-5425
        G15E1_14 5426           G15E2_14 5427           G15E3_14 5428-5429
        G15F1_14 5430           G15F2_14 5431           G15F3_14 5432-5433
        G15G1_14 5434           G15G2_14 5435           G15G3_14 5436-5437
        G15H1_14 5438           G15H2_14 5439           G15H3_14 5440-5441
        G15I1_14 5442           G15I2_14 5443           G15I3_14 5444-5445
        G15J1_14 5446-5447      G15J2_14 5448           G15J3_14 5449-5450
        G15K1_14 5451           G15K2_14 5452           G15K3_14 5453-5454
        G15L1_14 5455           G15L2_14 5456           G15L3_14 5457-5458
        G15M1_14 5459           G15M2_14 5460           G15M3_14 5461-5462
        G15N1_14 5463           G15N2_14 5464           G15N3_14 5465-5466
        G15O1_14 5467           G15O2_14 5468           G15O3_14 5469-5470
        G15P1_14 5471           G15P2_14 5472           G15P3_14 5473-5474
        G15Q1_14 5475           G15Q2_14 5476           G15Q3_14 5477-5478
        G15R1_14 5479           G15R2_14 5480           G15R3_14 5481-5482
        G15N1A_14 5483          G15N2A_14 5484          G15N3A_14 5485-5486
        G15S1_14 5487           G15S2_14 5488           G15S3_14 5489-5490
        G15T1_14 5491           G15T2_14 5492           G15T3_14 5493-5494
        G15U1_14 5495-5496      G15U2_14 5497-5498      G15U3_14 5499-5500
        G15J1A_14 5501          G15J2A_14 5502          G15J3A_14 5503-5504
        G15V1_14 5505           G15V2_14 5506           G15V3_14 5507-5508
        G15Y1_14 $5509-5517     G15Y2_14 5518-5520      G15Y3_14 5521-5522
        G15YT_14 5523           H1_14 5524              H21_14 5525
        H22_14 5526-5527        H3_14 5528              H5_14 5529-5531
        H6_14 5532              H7_14 5533              H71_14 5534-5535
        D14VYEAR 5536-5539      D14VMONTH 5540-5541     D14VDAY 5542-5543
        D14AGE 5544-5546        D14MARRY 5547-5548      D14MARRY1 5549-5550
        D14YR1 $5551-5554       D14MON1 $5555-5556      D14D22 5557-5558
        D14D231 $5559-5567      D14D232 $5568-5576      D14D233 $5577-5585
        D14D234 $5586-5594      D14D24 $5595-5603       D14D25 5604-5606
        D14D26A1 5607-5609      D14D26A2 5610-5611      D14D26A3 $5612-5620
        D14D26A4 $5621-5629     D14D26A5 5630-5632      D14D26A6 5633-5634
        D14D26A61 $5635-5639    D14D26B1 5640-5641      D14D26B2 5642-5643
        D14D26B3 5644-5646      D14D26B4 5647-5649      D14D26B5 5650-5652
        D14D26B6 5653-5654      D14D26B61 $5655-5657    D14D26C1 5658-5659
        D14D26C2 5660-5661      D14D26C3 5662-5664      D14D26C4 5665-5667
        D14D26C5 5668-5670      D14D26C6 5671-5672      D14D26C61 5673-5674
        D14D26D1 5675-5676      D14D26D2 5677-5678      D14D26D3 5679-5681
        D14D26D4 5682-5684      D14D26D5 5685-5687      D14D26D6 5688-5689
        D14D26D61 5690-5692     D14D26E1 5693-5694      D14D26E2 5695-5696
        D14D26E3 $5697-5699     D14D26E4 $5700-5708     D14D26E5 5709-5711
        D14D26E6 5712-5713      D14D26E61 5714-5715     D14D26F1 5716-5717
        D14D26F2 5718-5719      D14D26F3 5720-5722      D14D26F4 $5723-5731
        D14D26F5 5732           D14D26F6 5733-5734      D14D26F61 5735-5736
        D14D26G1 5737-5738      D14D26G11 5739          D14D26G2 5740-5741
        D14D26G3 5742-5744      D14D26G4 5745           D14D26G5 5746
        D14D26G6 5747-5748      D14D26G61 5749-5750     D14D26H1 5751-5752
        D14D26H11 5753          D14D26H2 5754-5755      D14D26H3 5756-5758
        D14D26H4 $5759-5767     D14D26H5 5768           D14D26H6 5769-5770
        D14D26H61 5771-5772     D14D26I1 5773-5774      D14D26I11 5775
        D14D26I2 5776-5777      D14D26I3 5778-5779      D14D26I4 5780
        D14D26I5 5781           D14D26I6 5782-5783      D14D26I61 5784-5785
        D14D26J1 5786-5787      D14D26J11 5788          D14D26J2 5789-5790
        D14D26J3 5791-5792      D14D26J4 5793           D14D26J5 5794
        D14D26J51 5795          D14D26J6 5796-5797      D14D26J61 $5798-5800
        D14LIVARR 5801-5802     D14PERSON 5803-5805     D14GENER 5806-5808
        D14DPLACE 5809-5810     D14CARGIV 5811-5812     D14PCGDAY $5813-5816
        D14BEDRID 5817-5818     D14BEDDAY $5819-5827    D14ILL 5828-5829
        D14DISEA1 $5830-5838    D14DIDAY1 $5839-5847    D14DISEA2 $5848-5856
        D14DIDAY2 $5857-5865    D14DISEA3 $5866-5874    D14DIDAY3 $5875-5878
        D14HYPERT 5879-5880     D14DIABET 5881-5882     D14HEART 5883-5884
        D14CVD 5885-5886        D14PNEUM 5887-5888      D14TUBERC 5889-5890
        D14CANCER 5891-5892     D14GLAUCO 5893-5894     D14PROSTA 5895-5896
        D14GYNECO 5897-5898     D14GASTRI 5899-5900     D14PARKIN 5901-5902
        D14BEDSOR 5903-5904     D14DEMENT 5905-5906     D14PSYCHO 5907-5908
        D14NEUROS 5909-5910     D14ARTHRI 5911-5912     D14OTHERS 5913-5914
        D14INCOME $5915-5923    D14WCFACI 5924-5925     D14TAPWAT 5926-5927
        D14BATHFA 5928-5929     D14HEATER 5930-5931     D14TVSET 5932-5933
        D14WASHMA 5934-5935     D14PHONE 5936-5937      D14DOCTOR 5938-5940
        D14LICDOC 5941-5942     D14WHOPAY $5943-5945    D14MEDCOS $5946-5954
        D14POCKET $5955-5959    D14BATHFU 5960-5961     D14BATDAY $5962-5965
        D14DRESFU 5966-5967     D14DREDAY $5968-5971    D14TOILFU 5972-5973
        D14TOIDAY $5974-5977    D14MOVEFU 5978-5979     D14MOVDAY $5980-5983
        D14CONTFU 5984-5985     D14CONDAY $5986-5989    D14FEEDFU 5990-5991
        D14FEEDAY $5992-5995    D14FULLDA $5996-6004    D14CARCST $6005-6013
        D14DIRCST $6014-6020    D14CARPAY 6021-6023     D14OUTDOR 6024-6027
        D14ACTDAY $6028-6031    D14SMOKE 6032-6033      D14SMKTIM 6034-6035
        D14D21B 6036-6037       D14DRINK 6038-6039      D14KNDDRK 6040-6041
        D14DRKMCH $6042-6044    D14ADVDIR 6045-6046     D14DIRDAY 6047-6050
        D14DREAM 6051-6052      D14PAIN 6053-6054       D14UNCONS 6055-6056
        D14UNCDAY $6057-6059    D14A533 6060-6061       D14A534 $6062-6065
        D14A535 6066-6067       D14A536 6068-6069       D14A537 6070-6072
        D14G23 $6073-6074       D14G24 6075-6076        D14G24A 6077-6078
        D14G25 6079-6080        D14G25A 6081-6082       D14G4 6083-6084
        D14G4A 6085-6086        D14G4B 6087-6088        D14G102 6089-6091
        D14G106 6092-6093       D14G1061 6094-6095      D14G1062 6096-6097
        D14G1063 6098-6099      D14D45 6100-6101        D14D46 $6102-6110
        D14D47 6111             ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id id, province code +given no. + year of the wave of the very first interview' 
   YEARIN  = 'yearin year of the 2008-09 interview' 
   MONTHIN = 'monthin month of the 2008 interview' 
   DAYIN   = 'dayin day of the 2008 interview' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'prov national code for provinces sampled' 
   TYPE    = 'type category of the interviewed respondent' 
   RESIDENC= 'residenc category of residence of the interviewee in 2008' 
   TRUEAGE = 'trueage validated age' 
   A1      = 'a1 sex' 
   A2      = 'a2 ethnic group' 
   RA41    = 'ra41 proxy or not for a41' 
   A41     = 'a41 which province were you born in?' 
   RA42    = 'ra42 proxy or not for a42' 
   A42     = 'a42 was the country (city) you born in the same as current address?' 
   RA43    = 'ra43 proxy or not for a43' 
   A43     = 'a43 was the place of birth an urban area or a rural area at time of birth' 
   RA51    = 'ra51 proxy or not for a51' 
   A51     = 'a51 co-residence of interviewee' 
   RA52    = 'ra52 proxy or not for a52' 
   A52     = 'a52 how many people are living with you?' 
   RA53A   = 'ra53a proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4' 
   A53A1   = 'a53a1 relationship between you and 1st person you living with currently' 
   A53A3   = 'a53a3 sex of 1st person living with you currently' 
   A53A2   = 'a53a2 age of 1st person living with you currently' 
   A53A4   = 'a53a4 education level of 1st person living with you currently' 
   RA53B   = 'ra53b proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4' 
   A53B1   = 'a53b1 relationship between you and 2nd person living with you currently' 
   A53B3   = 'a53b3 age of 2nd person living with you currently' 
   A53B2   = 'a53b2 age of 2nd person living with you currently' 
   A53B4   = 'a53b4 education level of 2nd person living with you currently' 
   RA53C   = 'ra53c proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4' 
   A53C1   = 'a53c1 relationship between you and 3rd person living with you currently' 
   A53C3   = 'a53c3 sex of 3rd person living with you currently' 
   A53C2   = 'a53c2 age of 3rd person living with you currently' 
   A53C4   = 'a53c4 education level of 3rd person living with you currently' 
   RA53D   = 'ra53d proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4' 
   A53D1   = 'a53d1 relationship between you and 4th person living with you currently' 
   A53D3   = 'a53d3 sex of 4th person living with you currently' 
   A53D2   = 'a53d2 age of 4th person living with you currently' 
   A53D4   = 'a53d4 education level of 4th person living with you currently' 
   RA53E   = 'ra53e proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4' 
   A53E1   = 'a53e1 relationship between you and 5th person living with you currently' 
   A53E3   = 'a53e3 sex of 5th person living with you currently' 
   A53E2   = 'a53e2 age of 5th person living with you currently' 
   A53E4   = 'a53e4 education level of 5th person living with you currently' 
   RA53F   = 'ra53f proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4' 
   A53F1   = 'a53f1 relationship between you and 6th person living with you currently' 
   A53F3   = 'a53f3 sex of 6th person living with you currently' 
   A53F2   = 'a53f2 age of 6th person living with you currently' 
   A53F4   = 'a53f4 education level of 6th person living with you currently' 
   RA53G   = 'ra53g proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4' 
   A53G1   = 'a53g1 relationship between you and 7th person living with you currently' 
   A53G3   = 'a53g3 sex of 7th person living with you currently' 
   A53G2   = 'a53g2 age of 7th person living with you currently' 
   A53G4   = 'a53g4 education level of 7th person living with you currently' 
   RA53H   = 'ra53h proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4' 
   A53H1   = 'a53h1 relationship between you and 8th person living with you currently' 
   A53H3   = 'a53h3 sex of 8th person living with you currently' 
   A53H2   = 'a53h2 age of 8th person living with you currently' 
   A53H4   = 'a53h4 education level of 8th person living with you currently' 
   RA53I   = 'ra53i proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4' 
   A53I1   = 'a53i1 relationship between you and 9th person living with you currently' 
   A53I3   = 'a53i3 sex of 9th person living with you currently' 
   A53I2   = 'a53i2 age of 9th person living with you currently' 
   A53I4   = 'a53i4 education level of 9th person living with you currently' 
   RA53J   = 'ra53j proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4' 
   A53J1   = 'a53j1 relationship between you and 10th person living with you currently' 
   A53J3   = 'a53j3 sex of 10th person living with you currently' 
   A53J2   = 'a53j2 age of 10th person living with you currently' 
   A53J4   = 'a53j4 education level of 10th person living with you currently' 
   RA53K   = 'ra53k proxy or not for a53k1, a53k11, a53k2, a53k3, a53k4' 
   A53K1   = 'a53k1 relationship between you and 11th person living with you currently' 
   A53K11  = 'a53k11 other relationship between you and 11th person living with you currently' 
   A53K3   = 'a53k3 sex of 11th person living with you currently' 
   A53K2   = 'a53k2 age of 11th person living with you currently' 
   A53K4   = 'a53k4 education level of 11th person living with you currently' 
   RA53L   = 'ra53l proxy or not for a53l1, a53l11, a53l2, a53l3,a53l4' 
   A53L1   = 'a53l1 relationship between you and 12th person living with you currently' 
   A53L11  = 'a53l11 other relationship between you and 12th person living with you currently' 
   A53L3   = 'a53l3 sex of 12th person living with you currently' 
   A53L2   = 'a53l2 age of 12th person living with you currently' 
   A53L4   = 'a53l4 education level of 12th person living with you currently' 
   RA530   = 'ra530 proxy or not for a530' 
   A530    = 'a530 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531   = 'ra531 proxy or not for a531' 
   A531    = 'a531 under whose name your current house/apartment purchased or rented' 
   RA532   = 'ra532 proxy or not for a532' 
   A532    = 'a532 do you (and your spouse) have your own bedroom?' 
   RA541   = 'ra541 proxy or not for a541' 
   A541    = 'a541 the average monthly cost for the elder living in an institution' 
   RA542   = 'ra542 proxy or not for a542' 
   A542    = 'a542 who mainly paid for the cost?' 
   RA54    = 'ra54 proxy or not for a54a a54b' 
   A54A    = 'a54a year of being admitted to the institution or living alone' 
   A54B    = 'a54b month of being admitted to the institution or living alone' 
   B11     = 'b11 self-reported quality of life' 
   B12     = 'b12 self-reported health' 
   B121    = 'b121 do you feel any change of your health since last year' 
   B21     = 'b21 look on the bright side of things' 
   B22     = 'b22 keep my belongings neat and clean' 
   B23     = 'b23 feel fearful or anxious' 
   B24     = 'b24 feel lonely and isolated' 
   B25     = 'b25 make own decision' 
   B26     = 'b26 feel useless with age' 
   B27     = 'b27 be happy as younger' 
   C11     = 'c11 what time of day is it right now?' 
   C12     = 'c12 what is the animal year of this year?' 
   C13     = 'c13 what is the date of the mid-autumn festival?' 
   C14     = 'c14 what is the season right now?' 
   C15     = 'c15 what is the name of this county or district?' 
   C16     = 'c16 # of kinds of food named in one minute' 
   C21A    = 'c21a repeat the name of ''table'' at first attempt' 
   C21B    = 'c21b repeat the name of ''apple'' at first attempt' 
   C21C    = 'c21c repeat the name of ''clothes'' at first attempt' 
   C22     = 'c22 attempts to repeat the names of three objects correctly' 
   C31A    = 'c31a $20-$3=?' 
   C31B    = 'c31b $20-$3-$3=?' 
   C31C    = 'c31c $20-$3-$3-$3=?' 
   C31D    = 'c31d $20-$3-$3-$3-$3=?' 
   C31E    = 'c31e $20-$3-$3-$3-$3-$3=?' 
   C32     = 'c32 draw the figure following the example' 
   C41A    = 'c41a repeat the name of ''table'' a while later' 
   C41B    = 'c41b repeat the name of ''apple'' a while later' 
   C41C    = 'c41c repeat the name of ''clothes'' a while later' 
   C51A    = 'c51a name ''pen''' 
   C51B    = 'c51b name ''watch''' 
   C52     = 'c52 repeat a sentence' 
   C52X1   = 'c52x1 act as the meaning of a sentence' 
   C52X2   = 'c52x2 write a complete sentence' 
   C53A    = 'c53a taking paper using right hand' 
   C53B    = 'c53b fold paper' 
   C53C    = 'c53c put paper on the floor' 
   C54     = 'c54 was the interviewee able to answer sections b and c?' 
   C55     = 'c55 what is the main reason unable to answer questions?' 
   RD1     = 'rd1 proxy or not for d1' 
   D1      = 'd1 staple food' 
   RD2     = 'rd2  proxy or not for d2' 
   D2      = 'd2 amount of staple food per day (liang)' 
   RD31    = 'rd31 proxy or not for d31' 
   D31     = 'd31 how often eat fresh fruit?' 
   RD32    = 'rd32 proxy or not for d32' 
   D32     = 'd32 how often eat vegetables?' 
   RD33    = 'rd33 proxy or not for d33' 
   D33     = 'd33 what kind of grease do you mainly use for cooking?' 
   RD34    = 'rd34 proxy or not for d34' 
   D34     = 'd34 main flavor you have' 
   RD4MEAT = 'rd4meat proxy or not for d4meat1 and d4meat2' 
   D4MEAT2 = 'd4meat2 how often eat meat at present?' 
   D4MEAT1 = 'd4meat1 how often ate meat at around age 60?' 
   RD4FISH = 'rd4fish proxy or not for d4fish1 and d4fish2' 
   D4FISH2 = 'd4fish2 how often eat fish at present?' 
   D4FISH1 = 'd4fish1 how often ate fish at around age 60?' 
   RD4EGG  = 'rd4egg proxy or not for d4egg1 and d4egg2' 
   D4EGG2  = 'd4egg2 how often eat eggs at present?' 
   D4EGG1  = 'd4egg1 how often ate eggs at around age 60?' 
   RD4BEAN = 'rd4bean proxy or not for d4bean1 and d4bean2' 
   D4BEAN2 = 'd4bean2 how often eat food made from beans at present?' 
   D4BEAN1 = 'd4bean1 how often ate food made from beans at around age 60?' 
   RD4VEG  = 'rd4veg proxy or not for d4veg1 and d4veg2' 
   D4VEG2  = 'd4veg2 how often eat salt-preserved vegetables at present' 
   D4VEG1  = 'd4veg1 how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA = 'rd4suga proxy or not for d4suga1 and d4suga2' 
   D4SUGA2 = 'd4suga2 how often eat sugar at present' 
   D4SUGA1 = 'd4suga1 how often ate sugar at around age 60' 
   RD4TEA  = 'rd4tea proxy or not for d4tea1 and d4tea2' 
   D4TEA2  = 'd4tea2 how often drink tea at present' 
   D4TEA1  = 'd4tea1 how often drank tea at around age 60' 
   RD4GARL = 'rd4garl proxy or not for d4garl1 and d4garl2' 
   D4GARL2 = 'd4garl2 how often eat garlic at present' 
   D4GARL1 = 'd4garl1 how often ate garlic at around age 60' 
   RDEMILK = 'rdemilk proxy or not for d4milk1 and d4milk2' 
   D4MILK1 = 'd4milk1 how often eat milk products at present' 
   D4MILK2 = 'd4milk2 how often ate milk products at around age 60' 
   RD4NUT  = 'rd4nut proxy or not for d4nut1 and d4nut2' 
   D4NUT1  = 'd4nut1 how often eat nut products at present' 
   D4NUT2  = 'd4nut2 how often ate nut products at around age 60' 
   RD4ALGA = 'rd4alga proxy or not for d4alga1 and d4alga2' 
   D4ALGA1 = 'd4alga1 how often eat mushroom or algae at present' 
   D4ALGA2 = 'd4alga2 how often ate mushroom or algae at around age 60' 
   RD4VIT  = 'rd4vit proxy or not for d4vit1 and d4vit2' 
   D4VIT1  = 'd4vit1 how often eat vitamins (a/c/e) at present' 
   D4VIT2  = 'd4vit2 how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG = 'rd4drug proxy or not for d4drug1 and d4drug2' 
   D4DRUG1 = 'd4drug1 how often eat medicinal plants at present' 
   D4DRUG2 = 'd4drug2 how often ate medicinal plants at around age 60' 
   RD5     = 'rd5 proxy or not for d5' 
   D5      = 'd5 what kind of water usually drink?' 
   RD6     = 'rd6 proxy or not for d6a d6b d6c' 
   D6A     = 'd6a main source of water drank during childhood' 
   D6B     = 'd6b main source of water drank at around age 60' 
   D6C     = 'd6c main source of drinking water at present' 
   RD71    = 'rd71 proxy or not for d71' 
   D71     = 'd71 smoke or not at present?' 
   RD72    = 'rd72 proxy or not for d72' 
   D72     = 'd72 smoked or not in the past?' 
   RD73    = 'rd73 proxy or not for d73' 
   D73     = 'd73 age when began smoking' 
   RD74    = 'rd74 proxy or not for d74' 
   D74     = 'd74 age when quit smoking if not smoking at present' 
   RD75    = 'rd75 proxy or not for d75' 
   D75     = 'd75 number of times smoke (or smoked) per day' 
   RD81    = 'rd81 proxy or not for d81' 
   D81     = 'd81 drink or not at present?' 
   RD82    = 'rd82 proxy or not for d82' 
   D82     = 'd82 drank or not in the past?' 
   RD83    = 'rd83 proxy or not for d83' 
   D83     = 'd83 age when began drinking' 
   RD84    = 'rd84 proxy or not for d84' 
   D84     = 'd84 age when quit drinking if not drinking at present' 
   RD85    = 'rd85 proxy or not for d85' 
   D85     = 'd85 kind of alcohol you drink (drank) ?' 
   RD86    = 'rd86 proxy or not for d86' 
   D86     = 'd86 how much per day do you drink (or drank)?' 
   RD91    = 'rd91 proxy or not for d91' 
   D91     = 'd91 exercise or not at present?' 
   RD92    = 'rd92 proxy or not for d92' 
   D92     = 'd92 exercised or not in the past?' 
   RD93    = 'rd93 proxy or not for d93' 
   D93     = 'd93 age when started to exercise' 
   RD94    = 'rd94 proxy or not for d94' 
   D94     = 'd94 age when quit exercise if not exercising at present' 
   RD101   = 'rd101 proxy or not for d101' 
   D101    = 'd101 have you done physical labor regularly?' 
   RD102   = 'rd102 proxy or not for d102' 
   D102    = 'd102 age when began doing physical labor' 
   RD103   = 'rd103 proxy or not for d103' 
   D103    = 'd103 age when stopped doing physical labor' 
   RD11A   = 'rd11a proxy or not for d11a' 
   D11A    = 'd11a do you do house work at present?' 
   RD11B   = 'rd11b proxy or not for d11b' 
   D11B    = 'd11b do you grow vegetables & do other field work at present?' 
   RD11C   = 'rd11c proxy or not for d11c' 
   D11C    = 'd11c do you do garden work' 
   RD11D   = 'rd11d proxy or not for d11d' 
   D11D    = 'd11d do you read newspapers/books at present?' 
   RD11E   = 'rd11e proxy or not for d11e' 
   D11E    = 'd11e do you raise domestic animals/pets at present?' 
   RD11F   = 'rd11f proxy or not for d11f' 
   D11F    = 'd11f do you play cards/mah-jongg at present?' 
   RD11G   = 'rd11g proxy or not for d11g' 
   D11G    = 'd11g do you watch tv or listen to radio at present ?' 
   RD11H   = 'rd11h proxy or not for d11h' 
   D11H    = 'd11h do you take part in some social activities at present?' 
   RD12    = 'rd12 proxy or not for d12' 
   D12     = 'd12 # of times traveling beyond home county/city in the past two years' 
   RE6     = 're6 proxy or not for e6' 
   E6      = 'e6 feeding' 
   RE6B    = 're6b proxy or not for e6b' 
   E6B     = 'e6b # of days needing assistance in feeding' 
   RE1     = 're1 proxy or not for e1' 
   E1      = 'e1 bathing' 
   RE1B    = 're1b proxy or not for e1b' 
   E1B     = 'e1b # of days needing assistance in bathing' 
   RE2     = 're2 proxy or not for e2' 
   E2      = 'e2 dressing' 
   RE2B    = 're2b proxy or not for e2b' 
   E2B     = 'e2b # of days needing assistance in dressing' 
   RE3     = 're3 proxy or not for e3' 
   E3      = 'e3 toileting' 
   RE3B    = 're3b proxy or not for e3b' 
   E3B     = 'e3b # of days needing assistance in toileting' 
   RE4     = 're4 proxy or not for e4' 
   E4      = 'e4 indoor transferring' 
   RE4B    = 're4b proxy or not for e4b' 
   E4B     = 'e4b # of days needing assistance in indoor transferring' 
   RE5     = 're5 proxy or not for e5' 
   E5      = 'e5 continence' 
   RE5B    = 're5b proxy or not for e5b' 
   E5B     = 'e5b # of days needing assistance in continence' 
   RE610   = 're610 proxy or not for e610' 
   E610    = 'e610 primary caregiver when the elder need assistance in above six tasks' 
   RE62    = 're62 proxy or not for e62' 
   E62     = 'e62 the willingness of the primary caregiver when providing such care' 
   RE63    = 're63 proxy or not for e63' 
   E63     = 'e63 the total direct cost paid for caregiving last week' 
   RE64    = 're64 proxy or not for e64' 
   E64     = 'e64 who mainly pays the above cost?' 
   RE65    = 're65 proxy or not for e65' 
   E65     = 'e65 does the help received for the six above tasks meet his/her needs?' 
   RE67    = 're67 proxy or not for e67' 
   E67     = 'e67 how many hours did the (grand)children help the elder last week?' 
   RE7     = 're7 proxy or not for e7' 
   E7      = 'e7 able to go outside to visit neighbors?' 
   RE8     = 're8 proxy or not for e8' 
   E8      = 'e8 able to go shopping by yourself?' 
   RE9     = 're9 proxy or not for e9' 
   E9      = 'e9 able to make food by yourself?' 
   RE10    = 're10 proxy or not for e10' 
   E10     = 'e10 able to wash clothes by yourself?' 
   RE11    = 're11 proxy or not for e11' 
   E11     = 'e11 able to walk one kilometer?' 
   RE12    = 're12 proxy or not for e12' 
   E12     = 'e12 able to carry 5kg weight?' 
   RE13    = 're13 proxy or not for e13' 
   E13     = 'e13 able to crouch and stand three times?' 
   RE14    = 're14 proxy or not for e14' 
   E14     = 'e14 able to take public transportation?' 
   RF1     = 'rf1 proxy or not for f1' 
   F1      = 'f1 years of schooling' 
   RF2     = 'rf2 proxy or not for f2' 
   F2      = 'f2 main occupation before age 60' 
   RF21    = 'rf21 proxy or not for f21' 
   F21     = 'f21 do you have a pension?' 
   RF211   = 'rf211 proxy or not for f211' 
   F211    = 'f211 are you retired?' 
   RF22    = 'rf22 proxy or not for f22' 
   F22     = 'f22 which year did you retire?' 
   RF23    = 'rf23 proxy or not for f23' 
   F23     = 'f23 are you still engaged in paid jobs now?' 
   RF31    = 'rf31 proxy or not for f31' 
   F31     = 'f31 main source of financial support' 
   RF32    = 'rf32 proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A    = 'f32a first of other financial support sources' 
   F32B    = 'f32b second of other financial support sources' 
   F32C    = 'f32c third of other financial support sources' 
   F32D    = 'f32d fourth of other financial support sources' 
   F32E    = 'f32e fifth of other financial support sources' 
   RF33    = 'rf33 proxy or not for f33' 
   F33     = 'f33 is all of the financial support sufficient to pay for daily expenses?' 
   RF340   = 'rf340 proxy or not for f340' 
   F340    = 'f340 your power in decision-making on financial spending in the household' 
   RF34    = 'rf34 proxy or not for f34' 
   F34     = 'f34 how do you rate your economic status compared with other local people?' 
   RF35    = 'rf35 proxy or not for f35' 
   F35     = 'f35 total income of your household last year' 
   RF41    = 'rf41 proxy or not for f41' 
   F41     = 'f41 current marital status' 
   RF42    = 'rf42 proxy or not for f42' 
   F42     = 'f42 how many times have you been married?' 
   RF43A   = 'rf43a proxy or not for f43a1 to f43a4' 
   F43A1   = 'f43a1 age at the 1st marriage' 
   F43A2   = 'f43a2 current status of the 1st marriage' 
   F43A3   = 'f43a3 age at the 1st marriage dissolution' 
   F43A4   = 'f43a4 quality of the 1st marriage' 
   RF43B   = 'rf43b proxy or not for f43b1 to f43b4' 
   F43B1   = 'f43b1 age at the 2nd marriage' 
   F43B2   = 'f43b2 current status of the 2nd marriage' 
   F43B3   = 'f43b3 age at the 2nd marriage dissolution' 
   F43B4   = 'f43b4 quality of the 2nd marriage' 
   RF43C   = 'rf43c proxy or not for f43c1 to f43c4' 
   F43C1   = 'f43c1 age at the 3rd marriage' 
   F43C2   = 'f43c2 current status of the 3rd marriage' 
   F43C3   = 'f43c3 age at the 3rd marriage dissolution' 
   F43C4   = 'f43c4 quality of the 3rd marriage' 
   RF43D   = 'rf43d proxy or not for f43d1 to f43d4' 
   F43D1   = 'f43d1 age at the latest marriage' 
   F43D2   = 'f43d2 current status of the latest marriage' 
   F43D3   = 'f43d3 age at the latest marriage dissolution' 
   F43D4   = 'f43d4 quality of the latest marriage' 
   RF44    = 'rf44 proxy or not for f44' 
   F44     = 'f44 years of schooling of the latest spouse' 
   RF45    = 'rf45 proxy or not for f45' 
   F45     = 'f45 main occupation of the latest spouse before age 60' 
   RF46    = 'rf46 proxy or not for f46' 
   F46     = 'f46 does your spouse have a paid job at present?' 
   RF47    = 'rf47 proxy or not for f47' 
   F47     = 'f47 current health status of your spouse' 
   RF5     = 'rf5 proxy or not for f5' 
   F5      = 'f5 who take care of you when you are sick?' 
   RF61    = 'rf61 proxy or not for f61' 
   F61     = 'f61 get adequate medical service at present' 
   RF610   = 'rf610 proxy or not for f610' 
   F610    = 'f610 main reason not to visit doctor when necessary' 
   RF62    = 'rf62 proxy or not for f62' 
   F62     = 'f62 got adequate medical treatment at around age 60' 
   RF63    = 'rf63 proxy or not for 63' 
   F63     = 'f63 got adequate medical treatment in childhood' 
   RF64    = 'rf64 proxy or not for f64' 
   F64A    = 'f64a do you have retirement pension at present' 
   F64B    = 'f64b do you have public old-age insurance at present' 
   F64C    = 'f64c do you have private old-age insurance at present' 
   F64D    = 'f64d do you have public free medical services at present' 
   F64E    = 'f64e do you have collective medical services at present' 
   F64F    = 'f64f do you have basic medical insurance at present' 
   F64G    = 'f64g do you have severe disease insurance at present' 
   F64H    = 'f64h do you have life insurance at present' 
   F64I    = 'f64i do you have other social security or private insurance at present' 
   RF651A  = 'rf651a proxy or not for f651a' 
   F651A   = 'f651a how much money did you spend on medical care last year?' 
   RF651B  = 'rf651b proxy or not for f651b' 
   F651B   = 'f651b how much money did your family pay for your medical care last year?' 
   RF652   = 'rf652 proxy or not for f652' 
   F652    = 'f652 who mainly paid the cost?' 
   RF66    = 'rf66 proxy or not for f66' 
   F66     = 'f66 often went to bed hungry as a child' 
   RF71    = 'rf71 proxy or not for f71' 
   F71     = 'f71 mother alive or not' 
   RF721   = 'rf721 proxy or not for f721' 
   F721    = 'f721 mother''s age if alive' 
   RF722   = 'rf722 proxy or not for f722' 
   F722    = 'f722 mother''s age at death' 
   RF73    = 'rf73 proxy or not for f73' 
   F73     = 'f73 respondent''s age at mother''s death' 
   RF74    = 'rf74 proxy or not for f74' 
   F74     = 'f74 how many years did your mother attend school?' 
   RF81    = 'rf81 proxy or not for f81' 
   F81     = 'f81 father alive or not' 
   RF821   = 'rf821 proxy or not for f821' 
   F821    = 'f821 father''s age if alive' 
   RF822   = 'rf822 proxy or not for f822' 
   F822    = 'f822 father''s age at death' 
   RF83    = 'rf83 proxy or not for f83' 
   F83     = 'f83 respondent''s age at father''s death' 
   RF84    = 'rf84 proxy or not for f84' 
   F84     = 'f84 father''s main occupation before age 60' 
   RF85    = 'rf85 proxy or not for f85' 
   F85     = 'f85 father''s main occupation in your childhood' 
   RF86    = 'rf86 proxy or not for f86' 
   F86     = 'f86 years of schooling your father received' 
   RF9     = 'rf9 proxy or not for f9' 
   F9      = 'f9 number of biological siblings' 
   F9A     = 'f9a number of biological siblings alive' 
   RF91    = 'rf91 proxy or not for f91' 
   F91     = 'f91 birth order of respondent' 
   RF92A   = 'rf92a proxy or not for f92a1 to f92a6' 
   F92A1   = 'f92a1 birth order of the sibling' 
   F92A2   = 'f92a2 sex of the sibling' 
   F92A3   = 'f92a3 sibling alive' 
   F92A4   = 'f92a4 sibling''s age at present if alive, or age at death if died' 
   F92A5   = 'f92a5 residence distance' 
   F92A6   = 'f92a6 frequent visits' 
   RF92B   = 'rf92b proxy or not for f92b1 to f92b6' 
   F92B1   = 'f92b1 birth order of the sibling' 
   F92B2   = 'f92b2 sex of the sibling' 
   F92B3   = 'f92b3 sibling alive' 
   F92B4   = 'f92b4 sibling''s age at present if alive, or age at death if died' 
   F92B5   = 'f92b5 residence distance' 
   F92B6   = 'f92b6 frequent visits' 
   RF92C   = 'rf92c proxy or not for f92c1 to f92c6' 
   F92C1   = 'f92c1 birth order of the sibling' 
   F92C2   = 'f92c2 sex of the sibling' 
   F92C3   = 'f92c3 sibling alive' 
   F92C4   = 'f92c4 sibling''s age at present if alive, or age at death if died' 
   F92C5   = 'f92c5 residence distance' 
   F92C6   = 'f92c6 frequent visits' 
   RF92D   = 'rf92d proxy or not for f92d1 to f92d6' 
   F92D1   = 'f92d1 birth order of the sibling' 
   F92D2   = 'f92d2 sex of the sibling' 
   F92D3   = 'f92d3 sibling alive' 
   F92D4   = 'f92d4 sibling''s age at present if alive, or age at death if died' 
   F92D5   = 'f92d5 residence distance' 
   F92D6   = 'f92d6 frequent visits' 
   RF92E   = 'rf92e proxy or not for f92e1 to f92e6' 
   F92E1   = 'f92e1 birth order of the sibling' 
   F92E2   = 'f92e2 sex of the sibling' 
   F92E3   = 'f92e3 sibling alive' 
   F92E4   = 'f92e4 sibling''s age at present if alive, or age at death if died' 
   F92E5   = 'f92e5 residence distance' 
   F92E6   = 'f92e6 frequent visits' 
   RF92F   = 'rf92f proxy or not for f92f1 to f92f6' 
   F92F1   = 'f92f1 birth order of the sibling' 
   F92F2   = 'f92f2 sex of the sibling' 
   F92F3   = 'f92f3 sibling alive' 
   F92F4   = 'f92f4 sibling''s age at present if alive, or age at death if died' 
   F92F5   = 'f92f5 residence distance' 
   F92F6   = 'f92f6 frequent visits' 
   RF92G   = 'rf92g proxy or not for f92g1 to f92g6' 
   F92G1   = 'f92g1 birth order of the sibling' 
   F92G2   = 'f92g2 sex of the sibling' 
   F92G3   = 'f92g3 sibling alive' 
   F92G4   = 'f92g4 sibling''s age at present if alive, or age at death if died' 
   F92G5   = 'f92g5 residence distance' 
   F92G6   = 'f92g6 frequent visits' 
   RF92H   = 'rf92h proxy or not for f92h1 to f92h6' 
   F92H1   = 'f92h1 birth order of the sibling' 
   F92H2   = 'f92h2 sex of the sibling' 
   F92H3   = 'f92h3 sibling alive' 
   F92H4   = 'f92h4 sibling''s age at present if alive, or age at death if died' 
   F92H5   = 'f92h5 residence distance' 
   F92H6   = 'f92h6 frequent visits' 
   RF92I   = 'rf92i proxy or not for f92i1 to f92i6' 
   F92I1   = 'f92i1 birth order of the sibling' 
   F92I2   = 'f92i2 sex of the sibling' 
   F92I3   = 'f92i3 sibling alive' 
   F92I4   = 'f92i4 sibling''s age at present if alive, or age at death if died' 
   F92I5   = 'f92i5 residence distance' 
   F92I6   = 'f92i6 frequent visits' 
   RF92J   = 'rf92j proxy or not for f92j1 to f92j6' 
   F92J1   = 'f92j1 birth order of the sibling' 
   F92J2   = 'f92j2 sex of the sibling' 
   F92J3   = 'f92j3 sibling alive' 
   F92J4   = 'f92j4 sibling''s age at present if alive, or age at death if died' 
   F92J5   = 'f92j5 residence distance' 
   F92J6   = 'f92j6 frequent visits' 
   JIGE    = 'jige number of siblings alive who are 80+ years old' 
   RF10    = 'rf10 proxy or not for f10 and f10a' 
   F10     = 'f10 number of children ever born' 
   F10A    = 'f10a number of male children ever born' 
   RF101   = 'rf101 proxy or not for f101' 
   F101    = 'f101 age at first birth' 
   RF102   = 'rf102 proxy or not for f102' 
   F102    = 'f102 age at last birth' 
   F103    = 'f103 number of children, including deceased and non-biological children' 
   RF103A  = 'rf103a proxy or not for f103a1 to f103a8' 
   F103A8  = 'f103a8 1st child is biological or not?' 
   F103A1  = 'f103a1 sex of the 1st child' 
   F103A2  = 'f103a2 the 1st child alive or not' 
   F103A3  = 'f103a3 the 1st child''s age at present if alive, or the age the child would be if s/he w' 
   F103A4  = 'f103a4 frequent visits of the 1st child' 
   F103A7  = 'f103a7 contact with the 1st child' 
   F103A5  = 'f103a5 residence distance of the 1st child' 
   RF103B  = 'rf103b proxy or not for f103b1 to f103b8' 
   F103B8  = 'f103b8 2nd child is biological or not?' 
   F103B1  = 'f103b1 sex of the 2nd child' 
   F103B2  = 'f103b2 the 2nd child alive or not' 
   F103B3  = 'f103b3 the 2nd child''s age at present if alive, or the age the child would be if s/he w' 
   F103B4  = 'f103b4 frequent visits of the 2nd child' 
   F103B7  = 'f103b7 contact with the 2nd child' 
   F103B5  = 'f103b5 residence distance of the 2nd child' 
   RF103C  = 'rf103c proxy or not for f103c1 to f103c8' 
   F103C8  = 'f103c8 3rd child is biological or not?' 
   F103C1  = 'f103c1 sex of the 3rd child' 
   F103C2  = 'f103c2 the 3rd child alive or not' 
   F103C3  = 'f103c3 the 3rd child''s age at present if alive, or the age the child would be if s/he w' 
   F103C4  = 'f103c4 frequent visits of the 3rd child' 
   F103C7  = 'f103c7 contact with the 3rd child' 
   F103C5  = 'f103c5 residence distance of the 3rd child' 
   RF103D  = 'rf103d proxy or not for f103d1 to f103d8' 
   F103D8  = 'f103d8 4th child is biological or not?' 
   F103D1  = 'f103d1 sex of the 4th child' 
   F103D2  = 'f103d2 the 4th child alive or not' 
   F103D3  = 'f103d3 the 4th child''s age at present if alive, or the age the child would be if s/he w' 
   F103D4  = 'f103d4 frequent visits of the 4th child' 
   F103D7  = 'f103d7 contact with the 4th child' 
   F103D5  = 'f103d5 residence distance of the 4th child' 
   RF103E  = 'rf103e proxy or not for f103e1 to f103e8' 
   F103E8  = 'f103e8 5th child is biological or not?' 
   F103E1  = 'f103e1 sex of the 5th child' 
   F103E2  = 'f103e2 the 5th child alive or not' 
   F103E3  = 'f103e3 the 5th child''s age at present if alive, or the age the child would be if s/he w' 
   F103E4  = 'f103e4 frequent visits of the 5th child' 
   F103E7  = 'f103e7 contact with the 5th child' 
   F103E5  = 'f103e5 residence distance of the 5th child' 
   RF103F  = 'rf103f proxy or not for f103f1 to f103f8' 
   F103F8  = 'f103f8 6th child is biological or not?' 
   F103F1  = 'f103f1 sex of the 6th child' 
   F103F2  = 'f103f2 the 6th child alive or not' 
   F103F3  = 'f103f3 the 6th child''s age at present if alive, or the age the child would be if s/he w' 
   F103F4  = 'f103f4 frequent visits of the 6th child' 
   F103F7  = 'f103f7 contact with the 6th child' 
   F103F5  = 'f103f5 residence distance of the 6th child' 
   RF103G  = 'rf103g proxy or not for f103g1 to f103g8' 
   F103G8  = 'f103g8 7th child is biological or not?' 
   F103G1  = 'f103g1 sex of the 7th child' 
   F103G2  = 'f103g2 the 7th child alive or not' 
   F103G3  = 'f103g3 the 7th child''s age at present if alive, or the age the child would be if s/he w' 
   F103G4  = 'f103g4 frequent visits of the 7th child' 
   F103G7  = 'f103g7 contact with the 7th child' 
   F103G5  = 'f103g5 residence distance of the 7th child' 
   RF103H  = 'rf103h proxy or not for f103h1 to f103h8' 
   F103H8  = 'f103h8 8th child is biological or not?' 
   F103H1  = 'f103h1 sex of the 8th child' 
   F103H2  = 'f103h2 the 8th child alive or not' 
   F103H3  = 'f103h3 the 8th child''s age at present if alive, or the age the child would be if s/he w' 
   F103H4  = 'f103h4 frequent visits of the 8th child' 
   F103H7  = 'f103h7 contact with the 8th child' 
   F103H5  = 'f103h5 residence distance of the 8th child' 
   RF103I  = 'rf103i proxy or not for f103i1 to f103i8' 
   F103I8  = 'f103i8 9th child is biological or not?' 
   F103I1  = 'f103i1 sex of the 9th child' 
   F103I2  = 'f103i2 the 9th child alive or not' 
   F103I3  = 'f103i3 the 9th child''s age at present if alive, or the age the child would be if s/he w' 
   F103I4  = 'f103i4 frequent visits of the 9th child' 
   F103I7  = 'f103i7 contact with the 9th child' 
   F103I5  = 'f103i5 residence distance of the 9th child' 
   RF103J  = 'rf103j proxy or not for f103j1 to f103j8' 
   F103J8  = 'f103j8 10th child is biological or not?' 
   F103J1  = 'f103j1 sex of the 10th child' 
   F103J2  = 'f103j2 the 10th child alive or not' 
   F103J3  = 'f103j3 the 10th child''s age at present if alive, or the age the child would be if s/he' 
   F103J4  = 'f103j4 frequent visits of the 10th child' 
   F103J7  = 'f103j7 contact with the 10th child' 
   F103J5  = 'f103j5 residence distance of the 10th child' 
   RF103K  = 'rf103k proxy or not for f103k1 to f103k8' 
   F103K8  = 'f103k8 11th child is biological or not?' 
   F103K1  = 'f103k1 sex of the 11th child' 
   F103K2  = 'f103k2 the 11th child alive or not' 
   F103K3  = 'f103k3 the 11th child''s age at present if alive, or the age the child would be if s/he' 
   F103K4  = 'f103k4 frequent visits of the 11th child' 
   F103K7  = 'f103k7 contact with the 11th child' 
   F103K5  = 'f103k5 residence distance of the 11th child' 
   RF103L  = 'rf103l proxy or not for f103l1 to f103l8' 
   F103L8  = 'f103l8 12th child is biological or not?' 
   F103L1  = 'f103l1 sex of the 12th child' 
   F103L2  = 'f103l2 the 12th child alive or not' 
   F103L3  = 'f103l3 the 12th child''s age at present if alive, or the age the child would be if s/he' 
   F103L4  = 'f103l4 frequent visits of the 12th child' 
   F103L7  = 'f103l7 contact with the 12th child' 
   F103L5  = 'f103l5 residence distance of the 12th child' 
   RF103M  = 'rf103m proxy or not for f103m1 to f103m8' 
   F103M8  = 'f103m8 13th child is biological or not?' 
   F103M1  = 'f103m1 sex of the 13th child' 
   F103M2  = 'f103m2 the 13th child alive or not' 
   F103M3  = 'f103m3 the 13th child''s age at present if alive, or the age the child would be if s/he' 
   F103M4  = 'f103m4 frequent visits of the 13th child' 
   F103M7  = 'f103m7 contact with the 13th child' 
   F103M5  = 'f103m5 residence distance of the 13th child' 
   RF111   = 'rf111 proxy or not for f111a to f111c' 
   F111A   = 'f111a the first person to whom you usually talk frequently in daily life' 
   F111B   = 'f111b the second person to whom you usually talk frequently in daily life' 
   F111C   = 'f111c the third person to whom you usually talk frequently in daily life' 
   RF112   = 'rf112 proxy or not for f112a to f112c' 
   F112A   = 'f112a 1st person to whom you talk first when you need to share some of your thoughts' 
   F112B   = 'f112b 2nd person to whom you talk first when you need to share some of your thoughts' 
   F112C   = 'f112c 3rd person to whom you talk first when you need to share some of your thoughts' 
   RF113   = 'rf113 proxy or not for f113a to f113c' 
   F113A   = 'f113a 1st person you ask for help when you have problem/difficulties' 
   F113B   = 'f113b 2nd person you ask for help when you have problem/difficulties' 
   F113C   = 'f113c 3rd person you ask for help when you have problem/difficulties' 
   RF12    = 'rf12 proxy or not for f12a to f12c' 
   F12A    = 'f12a how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B    = 'f12b how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C    = 'f12c how much did you receive from your grandchild(ren) last year?' 
   RF13    = 'rf13 proxy or not for f13a to f13c' 
   F13A    = 'f13a how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B    = 'f13b how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C    = 'f13c how much did you give to your grandchild(ren)in last year?' 
   RF14    = 'rf14 proxy or not for f14' 
   F141    = 'f141 are personal care services available in your community?' 
   F142    = 'f142 are home visit services available in your community?' 
   F143    = 'f143 are psychological consulting services available in your community?' 
   F144    = 'f144 are daily shopping services available in your community?' 
   F145    = 'f145 are social and recreation services available in your community?' 
   F146    = 'f146 are legal aid services available in your community?' 
   F147    = 'f147 are healthcare education services available in your community?' 
   F148    = 'f148 are neighborhood-relation services available in your community?' 
   F149    = 'f149 are any other social services available in your community?' 
   RF15    = 'rf15 proxy or not for f15' 
   F151    = 'f151 do you expect your community to provide personal care services?' 
   F152    = 'f152 do you expect your community to provide home visit services?' 
   F153    = 'f153 do you expect your community to provide psychological consulting services?' 
   F154    = 'f154 do you expect your community to provide daily shopping services?' 
   F155    = 'f155 do you expect your community to provide social and recreation activities?' 
   F156    = 'f156 do you expect your community provide legal aid services?' 
   F157    = 'f157 do you expect your community to provide healthcare education service?' 
   F158    = 'f158 do you expect your community to provide neighborhood-relation services?' 
   F159    = 'f159 do you expect your community to provide other social services?' 
   F16     = 'f16 what kind of living arrangement do you like best?' 
   G01     = 'g01 how about the quality of your sleep?' 
   RG02    = 'rg02 proxy or not for g02' 
   G02     = 'g02 how long do you sleep normally?' 
   G1      = 'g1 visual function' 
   RG21    = 'rg21 proxy or not for g21' 
   G21     = 'g21 number of natural teeth' 
   RG22    = 'rg22 proxy or not for g22' 
   G22     = 'g22 have false teeth?' 
   RG3     = 'rg3 proxy or not for g3' 
   G3      = 'g3 able to use chopsticks to eat?' 
   RG4     = 'rg4 proxy or not for g4' 
   G4      = 'g4 which hand do you normally use for eating?' 
   RG51    = 'rg51 proxy or not for g511-g512' 
   G511    = 'g511 systolic' 
   G512    = 'g512 systolic' 
   RG52    = 'rg52 proxy or not for g521-g522' 
   G521    = 'g521 diastolic' 
   G522    = 'g522 diastolic' 
   G71     = 'g71 heart rate' 
   G72     = 'g72 heart rate' 
   G81     = 'g81 hand behind neck' 
   G82     = 'g82 hand behind lower back' 
   G83     = 'g83 hold-up arms' 
   G9      = 'g9 able to stand up from sitting in a chair?' 
   RG101   = 'rg101 proxy or not for g101' 
   G101    = 'g101 weight' 
   RG102   = 'rg102 proxy or not for g1021-g123' 
   G1021   = 'g1021 directly measured height of the interviewee' 
   G122    = 'g122 height measured from the top of the right arm bone to the top of the right shoul' 
   G123    = 'g123 height measured from the right knee joint to the ground' 
   G11     = 'g11 able to pick up a book from the floor?' 
   G12     = 'g12 steps used to turn around 360 with help?' 
   G130    = 'g130 feel not-well within the past two weeks?' 
   RG13    = 'rg13 with proxy or not for g131' 
   G131    = 'g131 # of times suffering from serious illness within the past two years' 
   G132    = 'g132 # of times in hospitals' 
   RG14A   = 'rg14a with proxy or not for g14a1 and g14a2' 
   G14A1   = 'g14a1 name of disease suffered at 1st hospital visit' 
   G14A2   = 'g14a2 1st time, number of days in hospital or bedridden' 
   RG14B   = 'rg14b with proxy or not for g14b1 and g14b2' 
   G14B1   = 'g14b1 name of disease suffered at 2nd hospital visit' 
   G14B2   = 'g14b2 2nd time, number of days in hospital or bedridden' 
   RG14C   = 'rg14c with proxy or not for g14c1 and g14c2' 
   G14C1   = 'g14c1 name of disease suffered at the last hospital visit' 
   G14C2   = 'g14c2 last time, days in hospital or bedridden' 
   RG15A   = 'rg15a with proxy or not for g15a1-g15a3' 
   G15A1   = 'g15a1 suffering from hypertension?' 
   G15A2   = 'g15a2 diagnosed by hospital?' 
   G15A3   = 'g15a3 disability in daily life' 
   RG15B   = 'rg15b with proxy or not for g15b1-g15b3' 
   G15B1   = 'g15b1 suffering from diabetes?' 
   G15B2   = 'g15b2 diagnosed by hospital?' 
   G15B3   = 'g15b3 disability in daily life' 
   RG15C   = 'rg15c with proxy or not for g15c1-g15c3' 
   G15C1   = 'g15c1 suffering from heart disease?' 
   G15C2   = 'g15c2 diagnosed by hospital?' 
   G15C3   = 'g15c3 disability in daily life' 
   RG15D   = 'rg15d with proxy or not for g15d1-g15d3' 
   G15D1   = 'g15d1 suffering from stroke or cvd?' 
   G15D2   = 'g15d2 diagnosed by hospital?' 
   G15D3   = 'g15d3 disability in daily life' 
   RG15E   = 'rg15e with proxy or not for g15e1-g15e3' 
   G15E1   = 'g15e1 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2   = 'g15e2 diagnosed by hospital?' 
   G15E3   = 'g15e3 disability in daily life' 
   RG15F   = 'rg15f with proxy or not for g15f1-g15f3' 
   G15F1   = 'g15f1 suffering from tuberculosis?' 
   G15F2   = 'g15f2 diagnosed by hospital?' 
   G15F3   = 'g15f3 disability in daily life' 
   RG15G   = 'rg15g with proxy or not for g15g1-g15g3' 
   G15G1   = 'g15g1 suffering from cataract?' 
   G15G2   = 'g15g2 diagnosed by hospital?' 
   G15G3   = 'g15g3 disability in daily life' 
   RG15H   = 'rg15h with proxy or not for g15h1-g15h3' 
   G15H1   = 'g15h1 suffering from glaucoma?' 
   G15H2   = 'g15h2 diagnosed by hospital?' 
   G15H3   = 'g15h3 disability in daily life' 
   RG15I   = 'rg15i with proxy or not for g15i1-g15i3' 
   G15I1   = 'g15i1 suffering from cancer?' 
   G15I2   = 'g15i2 diagnosed by hospital?' 
   G15I3   = 'g15i3 disability in daily life' 
   RG15J   = 'rg15j with proxy or not for g15j1-g15j3' 
   G15J1   = 'g15j1 suffering from prostate tumor?' 
   G15J2   = 'g15j2 diagnosed by hospital?' 
   G15J3   = 'g15j3 disability in daily life' 
   RG15K   = 'rg15k with proxy or not for g15k1-g15k3' 
   G15K1   = 'g15k1 suffering from gastric or duodenal ulcer?' 
   G15K2   = 'g15k2 diagnosed by hospital?' 
   G15K3   = 'g15k3 disability in daily life' 
   RG15L   = 'rg15l with proxy or not for g15l1-g15l3' 
   G15L1   = 'g15l1 suffering from parkinson''s disease?' 
   G15L2   = 'g15l2 diagnosed by hospital?' 
   G15L3   = 'g15l3 disability in daily life' 
   RG15M   = 'rg15m with proxy or not for g15m1-g15m3' 
   G15M1   = 'g15m1 suffering from bedsore?' 
   G15M2   = 'g15m2 diagnosed by hospital?' 
   G15M3   = 'g15m3 disability in daily life' 
   RG15N   = 'rg15n with proxy or not for g15n1-g15n3' 
   G15N1   = 'g15n1 suffering from arthritis?' 
   G15N2   = 'g15n2 diagnosed by hospital?' 
   G15N3   = 'g15n3 disability in daily life' 
   RG15O   = 'rg15o with proxy or not for g15o1-g15o3' 
   G15O1   = 'g15o1 suffering from dementia?' 
   G15O2   = 'g15o2 diagnosed by hospital?' 
   G15O3   = 'g15o3 disability in daily life' 
   RG15P   = 'rg15p with proxy or not for g15p1-g15p3' 
   G15P1   = 'g15p1 suffering from epilepsy?' 
   G15P2   = 'g15p2 diagnosed by hospital?' 
   G15P3   = 'g15p3 disability in daily life' 
   RG15Q   = 'rg15q with proxy or not for g15q1-g15q3' 
   G15Q1   = 'g15q1 suffering from cholecystitis, cholelith disease?' 
   G15Q2   = 'g15q2 diagnosed by hospital?' 
   G15Q3   = 'g15q3 disability in daily life' 
   RG15R   = 'rg15r with proxy or not for g15r1-g15r3' 
   G15R1   = 'g15r1 suffering from blood disease?' 
   G15R2   = 'g15r2 diagnosed by hospital?' 
   G15R3   = 'g15r3 disability in daily life' 
   RG15S   = 'rg15s with proxy or not for g15s1-g15s3' 
   G15S1   = 'g15s1 suffering from chronic nephritis?' 
   G15S2   = 'g15s2 diagnosed by hospital?' 
   G15S3   = 'g15s3 disability in daily life' 
   RG15T   = 'rg15t with proxy or not for g15t1-g15t3' 
   G15T1   = 'g15t1 suffering from galactophore disease?' 
   G15T2   = 'g15t2 diagnosed by hospital?' 
   G15T3   = 'g15t3 disability in daily life' 
   RG15U   = 'rg15u with proxy or not for g15u1-g15u3' 
   G15U1   = 'g15u1 suffering from uterine tumor?' 
   G15U2   = 'g15u2 diagnosed by hospital?' 
   G15U3   = 'g15u3 disability in daily life' 
   RG15V   = 'rg15v with proxy or not for g15v1-g15v3' 
   G15V1   = 'g15v1 suffering from hepatitis?' 
   G15V2   = 'g15v2 diagnosed by hospital?' 
   G15V3   = 'g15v3 disability in daily life' 
   H1      = 'h1 was interviewee able to hear?' 
   H21     = 'h21 did interviewee able to participate in physical check?' 
   H22     = 'h22 the reason for inability to participate in physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H6      = 'h6 has interviewer checked for failure to ask a question?' 
   H7      = 'h7 did anyone help the interviewee to answer question' 
   H71     = 'h71 who helped the interviewee to answer questions?' 
   W_2008  = 'w_2008 weight variable, estimated based on 100% age-sex-residence-specific distribution' 
   DTH08_11= 'dth08_11 status of survival, death, or lost to follow-up from 2008 to 2011 waves' 
   YEARIN_11= 'yearin_11 year of the 2011/2012 interview' 
   MONTHIN_11= 'monthin_11 month of the 2011/2012 interview' 
   DAYIN_11= 'dayin_11 day of the 2011/2012 interview' 
   RESID_11= 'resid_11 category of residence of the interviewee in 2011' 
   VAGE_11 = 'vage_11 validated age' 
   RA51_11 = 'ra51_11 proxy or not for a51' 
   A51_11  = 'a51_11 co-residence of interviewee' 
   RA52_11 = 'ra52_11 proxy or not for a52' 
   A52_11  = 'a52_11 how many people are living with you?' 
   RA53A_11= 'ra53a_11 proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4, a53a5' 
   A53A1_11= 'a53a1_11 relationship between you and 1st person you living with currently' 
   A53A3_11= 'a53a3_11 sex of 1st person living with you currently' 
   A53A2_11= 'a53a2_11 age of 1st person living with you currently' 
   A53A4_11= 'a53a4_11 education level of 1st person living with you currently' 
   A53A5_11= 'a53a5_11 # of cigarettes 1st person usuallysmoke per day inside home' 
   RA53B_11= 'ra53b_11 proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4, a53b5' 
   A53B1_11= 'a53b1_11 relationship between you and 2nd person living with you currently' 
   A53B3_11= 'a53b3_11 sex of 2nd person living with you currently' 
   A53B2_11= 'a53b2_11 age of 2nd person living with you currently' 
   A53B4_11= 'a53b4_11 education level of 2nd person living with you currently' 
   A53B5_11= 'a53b5_11 # of cigarettes 2nd person usuallysmoke per day inside home' 
   RA53C_11= 'ra53c_11 proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4, a53c5' 
   A53C1_11= 'a53c1_11 relationship between you and 3rd person living with you currently' 
   A53C3_11= 'a53c3_11 sex of 3rd person living with you currently' 
   A53C2_11= 'a53c2_11 age of 3rd person living with you currently' 
   A53C4_11= 'a53c4_11 education level of 3rd person living with you currently' 
   A53C5_11= 'a53c5_11 # of cigarettes 3rd person usuallysmoke per day inside home' 
   RA53D_11= 'ra53d_11 proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4, a53d5' 
   A53D1_11= 'a53d1_11 relationship between you and 4th person living with you currently' 
   A53D3_11= 'a53d3_11 sex of 4th person living with you currently' 
   A53D2_11= 'a53d2_11 age of 4th person living with you currently' 
   A53D4_11= 'a53d4_11 education level of 4th person living with you currently' 
   A53D5_11= 'a53d5_11 # of cigarettes 4th person usuallysmoke per day inside home' 
   RA53E_11= 'ra53e_11 proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4, a53e5' 
   A53E1_11= 'a53e1_11 relationship between you and 5th person living with you currently' 
   A53E3_11= 'a53e3_11 sex of 5th person living with you currently' 
   A53E2_11= 'a53e2_11 age of 5th person living with you currently' 
   A53E4_11= 'a53e4_11 education level of 5th person living with you currently' 
   A53E5_11= 'a53e5_11 # of cigarettes 5th person usuallysmoke per day inside home' 
   RA53F_11= 'ra53f_11 proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4, a53f5' 
   A53F1_11= 'a53f1_11 relationship between you and 6th person living with you currently' 
   A53F3_11= 'a53f3_11 sex of 6th person living with you currently' 
   A53F2_11= 'a53f2_11 age of 6th person living with you currently' 
   A53F4_11= 'a53f4_11 education level of 6th person living with you currently' 
   A53F5_11= 'a53f5_11 # of cigarettes 6th person usuallysmoke per day inside home' 
   RA53G_11= 'ra53g_11 proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4, a53g5' 
   A53G1_11= 'a53g1_11 relationship between you and 7th person living with you currently' 
   A53G3_11= 'a53g3_11 sex of 7th person living with you currently' 
   A53G2_11= 'a53g2_11 age of 7th person living with you currently' 
   A53G4_11= 'a53g4_11 education level of 7th person living with you currently' 
   A53G5_11= 'a53g5_11 # of cigarettes 7th person usuallysmoke per day inside home' 
   RA53H_11= 'ra53h_11 proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4, a53h5' 
   A53H1_11= 'a53h1_11 relationship between you and 8th person living with you currently' 
   A53H3_11= 'a53h3_11 sex of 8th person living with you currently' 
   A53H2_11= 'a53h2_11 age of 8th person living with you currently' 
   A53H4_11= 'a53h4_11 education level of 8th person living with you currently' 
   A53H5_11= 'a53h5_11 # of cigarettes 8th person usuallysmoke per day inside home' 
   RA53I_11= 'ra53i_11 proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4, a53i5' 
   A53I1_11= 'a53i1_11 relationship between you and 9th person living with you currently' 
   A53I3_11= 'a53i3_11 sex of 9th person living with you currently' 
   A53I2_11= 'a53i2_11 age of 9th person living with you currently' 
   A53I4_11= 'a53i4_11 education level of 9th person living with you currently' 
   A53I5_11= 'a53i5_11 # of cigarettes 9th person usuallysmoke per day inside home' 
   RA53J_11= 'ra53j_11 proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4, a53j5' 
   A53J1_11= 'a53j1_11 relationship between you and 10th person living with you currently' 
   A53J11_11= 'a53j11_11 other relationship between you and 10th person living with you currently' 
   A53J3_11= 'a53j3_11 sex of 10th person living with you currently' 
   A53J2_11= 'a53j2_11 age of 10th person living with you currently' 
   A53J4_11= 'a53j4_11 education level of 10th person living with you currently' 
   A53J5_11= 'a53j5_11 # of cigarettes 10th person usuallysmoke per day inside home' 
   RA530_11= 'ra530_11 proxy or not for a530' 
   A530_11 = 'a530_11 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531_11= 'ra531_11 proxy or not for a531' 
   A531_11 = 'a531_11 under whose name your current house/apartment purchased or rented' 
   RA532_11= 'ra532_11 proxy or not for a532' 
   A532_11 = 'a532_11 do you (and your spouse) have your own bedroom?' 
   RA533_11= 'ra533_11 proxy or not for a533' 
   A533_11 = 'a533_11 what type of dwelling is your home?' 
   A533A_11= 'a533a_11 other type of dwelling' 
   RA534_11= 'ra534_11 proxy or not for a534' 
   A534_11 = 'a534_11 what is the approximate year your home was built?' 
   RA535_11= 'ra535_11 proxy or not for a535' 
   A535_11 = 'a535_11 during past 1 year, was your home damaged from broken pipes or heavy rain?' 
   RA536_11= 'ra536_11 proxy or not for a536' 
   A536_11 = 'a536_11 does your home frequently have a mildew odor or musty smell?' 
   RA537_11= 'ra537_11 proxy or not for a537' 
   A537_11 = 'a537_11 which fuels are normally used for cooking in your home?' 
   RA540_11= 'ra540_11 proxy or not for a540' 
   A540_11 = 'a540_11 the primary reason that you live in an institution (elderly center, elderly home' 
   RA541_11= 'ra541_11 proxy or not for a541' 
   A541_11 = 'a541_11 the average monthly cost for the elder living in an institution' 
   RA542_11= 'ra542_11 proxy or not for a542' 
   A542_11 = 'a542_11 who mainly paid for the cost?' 
   A542A_11= 'a542a_11 other people mainly paid for the cost' 
   RA54_11 = 'ra54_11 proxy or not for a54a a54b' 
   A54A_11 = 'a54a_11 year of being admitted to the institution or living alone' 
   A54B_11 = 'a54b_11 month of being admitted to the institution or living alone' 
   B11_11  = 'b11_11 self-reported quality of life' 
   B12_11  = 'b12_11 self-reported health' 
   B121_11 = 'b121_11 do you feel any change of your health since last year' 
   B21_11  = 'b21_11 look on the bright side of things' 
   B22_11  = 'b22_11 keep my belongings neat and clean' 
   B23_11  = 'b23_11 feel fearful or anxious' 
   B24_11  = 'b24_11 feel lonely and isolated' 
   B25_11  = 'b25_11 make own decision' 
   B26_11  = 'b26_11 feel useless with age' 
   B27_11  = 'b27_11 be happy as younger' 
   B28_11  = 'b28_11 have you felt sad, blue, or depressed for two weeks or more in last 12 months?' 
   B29_11  = 'b29_11 have you lost interest in most things like hobbies, work, or similar activities' 
   B210_11 = 'b210_11 how much of the day did these feelings usually last?' 
   C11_11  = 'c11_11 what time of day is it right now?' 
   C12_11  = 'c12_11 what is the animal year of this year?' 
   C13_11  = 'c13_11 what is the date of the mid-autumn festival?' 
   C14_11  = 'c14_11 what is the season right now?' 
   C15_11  = 'c15_11 what is the name of this county or district?' 
   C16_11  = 'c16_11 # of kinds of food named in one minute' 
   C21A_11 = 'c21a_11 repeat the name of ''table'' at first attempt' 
   C21B_11 = 'c21b_11 repeat the name of ''apple'' at first attempt' 
   C21C_11 = 'c21c_11 repeat the name of ''clothes'' at first attempt' 
   C22_11  = 'c22_11 attempts to repeat the names of three objects correctly' 
   C31A_11 = 'c31a_11 $20-$3=?' 
   C31B_11 = 'c31b_11 $20-$3-$3=?' 
   C31C_11 = 'c31c_11 $20-$3-$3-$3=?' 
   C31D_11 = 'c31d_11 $20-$3-$3-$3-$3=?' 
   C31E_11 = 'c31e_11 $20-$3-$3-$3-$3-$3=?' 
   C32_11  = 'c32_11 draw the figure following the example' 
   C41A_11 = 'c41a_11 repeat the name of ''table'' a while later' 
   C41B_11 = 'c41b_11 repeat the name of ''apple'' a while later' 
   C41C_11 = 'c41c_11 repeat the name of ''clothes'' a while later' 
   C51A_11 = 'c51a_11 name ''pen''' 
   C51B_11 = 'c51b_11 name ''watch''' 
   C52_11  = 'c52_11 repeat a sentence' 
   C52X1_11= 'c52x1_11 act as the meaning of a sentence' 
   C52X2_11= 'c52x2_11 write a complete sentence' 
   C53A_11 = 'c53a_11 taking paper using right hand' 
   C53B_11 = 'c53b_11 fold paper' 
   C53C_11 = 'c53c_11 put paper on the floor' 
   C54_11  = 'c54_11 was the interviewee able to answer sections b and c?' 
   C55_11  = 'c55_11 what is the main reason unable to answer questions?' 
   RD1_11  = 'rd1_11 proxy or not for d1' 
   D1_11   = 'd1_11 staple food' 
   RD2_11  = 'rd2_11  proxy or not for d2' 
   D2_11   = 'd2_11 amount of staple food per day (liang)' 
   RD31_11 = 'rd31_11 proxy or not for d31' 
   D31_11  = 'd31_11 how often eat fresh fruit?' 
   RD32_11 = 'rd32_11 proxy or not for d32' 
   D32_11  = 'd32_11 how often eat vegetables?' 
   RD33_11 = 'rd33_11 proxy or not for d33' 
   D33_11  = 'd33_11 what kind of grease do you mainly use for cooking?' 
   D33A_11 = 'd33a_11 other kind of grease you mainly use' 
   RD34_11 = 'rd34_11 proxy or not for d34' 
   D34_11  = 'd34_11 main flavor you have' 
   RD4MEAT_11= 'rd4meat_11 proxy or not for d4meat1 and d4meat2' 
   D4MEAT2_11= 'd4meat2_11 how often eat meat at present?' 
   D4MEAT1_11= 'd4meat1_11 how often ate meat at around age 60?' 
   RD4FISH_11= 'rd4fish_11 proxy or not for d4fish1 and d4fish2' 
   D4FISH2_11= 'd4fish2_11 how often eat fish at present?' 
   D4FISH1_11= 'd4fish1_11 how often ate fish at around age 60?' 
   RD4EGG_11= 'rd4egg_11 proxy or not for d4egg1 and d4egg2' 
   D4EGG2_11= 'd4egg2_11 how often eat eggs at present?' 
   D4EGG1_11= 'd4egg1_11 how often ate eggs at around age 60?' 
   RD4BEAN_11= 'rd4bean_11 proxy or not for d4bean1 and d4bean2' 
   D4BEAN2_11= 'd4bean2_11 how often eat food made from beans at present?' 
   D4BEAN1_11= 'd4bean1_11 how often ate food made from beans at around age 60?' 
   RD4VEG_11= 'rd4veg_11 proxy or not for d4veg1 and d4veg2' 
   D4VEG2_11= 'd4veg2_11 how often eat salt-preserved vegetables at present' 
   D4VEG1_11= 'd4veg1_11 how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA_11= 'rd4suga_11 proxy or not for d4suga1 and d4suga2' 
   D4SUGA2_11= 'd4suga2_11 how often eat sugar at present' 
   D4SUGA1_11= 'd4suga1_11 how often ate sugar at around age 60' 
   RD4TEA_11= 'rd4tea_11 proxy or not for d4tea1 and d4tea2' 
   D4TEA2_11= 'd4tea2_11 how often drink tea at present' 
   D4TEA1_11= 'd4tea1_11 how often drank tea at around age 60' 
   RD4GARL_11= 'rd4garl_11 proxy or not for d4garl1 and d4garl2' 
   D4GARL2_11= 'd4garl2_11 how often eat garlic at present' 
   D4GARL1_11= 'd4garl1_11 how often ate garlic at around age 60' 
   RDEMILK_11= 'rdemilk_11 proxy or not for d4milk1 and d4milk2' 
   D4MILK1_11= 'd4milk1_11 how often eat milk products at present' 
   D4MILK2_11= 'd4milk2_11 how often ate milk products at around age 60' 
   RD4NUT_11= 'rd4nut_11 proxy or not for d4nut1 and d4nut2' 
   D4NUT1_11= 'd4nut1_11 how often eat nut products at present' 
   D4NUT2_11= 'd4nut2_11 how often ate nut products at around age 60' 
   RD4ALGA_11= 'rd4alga_11 proxy or not for d4alga1 and d4alga2' 
   D4ALGA1_11= 'd4alga1_11 how often eat mushroom or algae at present' 
   D4ALGA2_11= 'd4alga2_11 how often ate mushroom or algae at around age 60' 
   RD4VIT_11= 'rd4vit_11 proxy or not for d4vit1 and d4vit2' 
   D4VIT1_11= 'd4vit1_11 how often eat vitamins (a/c/e) at present' 
   D4VIT2_11= 'd4vit2_11 how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG_11= 'rd4drug_11 proxy or not for d4drug1 and d4drug2' 
   D4DRUG1_11= 'd4drug1_11 how often eat medicinal plants at present' 
   D4DRUG2_11= 'd4drug2_11 how often ate medicinal plants at around age 60' 
   RD5_11  = 'rd5_11 proxy or not for d5' 
   D5_11   = 'd5_11 what kind of water usually drink?' 
   RD6_11  = 'rd6_11 proxy or not for d6a d6b d6c' 
   D6A_11  = 'd6a_11 main source of water drank during childhood' 
   D6B_11  = 'd6b_11 main source of water drank at around age 60' 
   D6C_11  = 'd6c_11 main source of drinking water at present' 
   RD71_11 = 'rd71_11 proxy or not for d71' 
   D71_11  = 'd71_11 smoke or not at present?' 
   RD72_11 = 'rd72_11 proxy or not for d72' 
   D72_11  = 'd72_11 smoked or not in the past?' 
   RD73_11 = 'rd73_11 proxy or not for d73' 
   D73_11  = 'd73_11 age when began smoking' 
   RD74_11 = 'rd74_11 proxy or not for d74' 
   D74_11  = 'd74_11 age when quit smoking if not smoking at present' 
   RD75_11 = 'rd75_11 proxy or not for d75' 
   D75_11  = 'd75_11 number of times smoke (or smoked) per day' 
   RD76_11 = 'rd76_11 proxy or not for d76' 
   D76_11  = 'd76_11 how soon after you wake up do you smoke your first cigarette?' 
   RD77_11 = 'rd77_11 proxy or not for d77' 
   D77_11  = 'd77_11 what do you think about your chances of being diagnosed with lung cancer?' 
   RD78_11 = 'rd78_11 proxy or not for d78' 
   D78_11  = 'd78_11 during childhood, were you exposed to smoke from other people at home?' 
   D78A_11 = 'd78a_11 if yes, for how many hours per day?' 
   D78B_11 = 'd78b_11 if yes, for how many years?' 
   RD79_11 = 'rd79_11 proxy or not for d79' 
   D79_11  = 'd79_11 during young/middle-ages, were you exposed to smoke from others at home?' 
   D79A_11 = 'd79a_11 if yes, for how many hours per day?' 
   D79B_11 = 'd79b_11 if yes, for how many years?' 
   RD710_11= 'rd710_11 proxy or not for d710' 
   D710_11 = 'd710_11 in social settings such as restaurant, were you exposed to smoke from others?' 
   D710A_11= 'd710a_11 if yes, for how many hours per day?' 
   D710B_11= 'd710b_11 if yes, for how many years?' 
   RD81_11 = 'rd81_11 proxy or not for d81' 
   D81_11  = 'd81_11 drink or not at present?' 
   RD82_11 = 'rd82_11 proxy or not for d82' 
   D82_11  = 'd82_11 drank or not in the past?' 
   RD83_11 = 'rd83_11 proxy or not for d83' 
   D83_11  = 'd83_11 age when began drinking' 
   RD84_11 = 'rd84_11 proxy or not for d84' 
   D84_11  = 'd84_11 age when quit drinking if not drinking at present' 
   RD85_11 = 'rd85_11 proxy or not for d85' 
   D85_11  = 'd85_11 what kind of alcohol you drink (drank) ?' 
   RD86_11 = 'rd86_11 proxy or not for d86' 
   D86_11  = 'd86_11 how much per day do you drink (or drank)?' 
   RD87_11 = 'rd87_11 proxy or not for d87' 
   D87_11  = 'd87_11 when stop drinking, do you feel anxious for most of the day for at least 2 days?' 
   RD91_11 = 'rd91_11 proxy or not for d91' 
   D91_11  = 'd91_11 exercise or not at present?' 
   RD92_11 = 'rd92_11 proxy or not for d92' 
   D92_11  = 'd92_11 exercised or not in the past?' 
   RD93_11 = 'rd93_11 proxy or not for d93' 
   D93_11  = 'd93_11 age when started to exercise' 
   RD94_11 = 'rd94_11 proxy or not for d94' 
   D94_11  = 'd94_11 age when quit exercise if not exercising at present' 
   RD101_11= 'rd101_11 proxy or not for d101' 
   D101_11 = 'd101_11 have you done physical labor regularly?' 
   RD102_11= 'rd102_11 proxy or not for d102' 
   D102_11 = 'd102_11 age when began doing physical labor' 
   RD103_11= 'rd103_11 proxy or not for d103' 
   D103_11 = 'd103_11 age when stopped doing physical labor' 
   RD11A_11= 'rd11a_11 proxy or not for d11a' 
   D11A_11 = 'd11a_11 do you do house work at present?' 
   RD11B_11= 'rd11b_11 proxy or not for d11b' 
   D11B_11 = 'd11b_11 do you grow vegetables & do other field work at present?' 
   RD11C_11= 'rd11c_11 proxy or not for d11c' 
   D11C_11 = 'd11c_11 do you do garden work' 
   RD11D_11= 'rd11d_11 proxy or not for d11d' 
   D11D_11 = 'd11d_11 do you read newspapers/books at present?' 
   RD11E_11= 'rd11e_11 proxy or not for d11e' 
   D11E_11 = 'd11e_11 do you raise domestic animals/pets at present?' 
   RD11F_11= 'rd11f_11 proxy or not for d11f' 
   D11F_11 = 'd11f_11 do you play cards/mah-jongg at present?' 
   RD11G_11= 'rd11g_11 proxy or not for d11g' 
   D11G_11 = 'd11g_11 do you watch tv or listen to radio at present ?' 
   RD11H_11= 'rd11h_11 proxy or not for d11h' 
   D11H_11 = 'd11h_11 do you take part in some social activities at present?' 
   RD12_11 = 'rd12_11 proxy or not for d12' 
   D12_11  = 'd12_11 # of times traveling beyond home county/city in the past two years' 
   RE0_11  = 're0_11 proxy or not for e0' 
   E0_11   = 'e0_11 for the last 6 months, were you limited in activities because of health problem?' 
   RE1_11  = 're1_11 proxy or not for e1' 
   E1_11   = 'e1_11 bathing' 
   RE1B_11 = 're1b_11 proxy or not for e1b' 
   E1B_11  = 'e1b_11 # of days needing assistance in bathing' 
   RE2_11  = 're2_11 proxy or not for e2' 
   E2_11   = 'e2_11 dressing' 
   RE2B_11 = 're2b_11 proxy or not for e2b' 
   E2B_11  = 'e2b_11 # of days needing assistance in dressing' 
   RE3_11  = 're3_11 proxy or not for e3' 
   E3_11   = 'e3_11 toileting' 
   RE3B_11 = 're3b_11 proxy or not for e3b' 
   E3B_11  = 'e3b_11 # of days needing assistance in toileting' 
   RE4_11  = 're4_11 proxy or not for e4' 
   E4_11   = 'e4_11 indoor transferring' 
   RE4B_11 = 're4b_11 proxy or not for e4b' 
   E4B_11  = 'e4b_11 # of days needing assistance in indoor transferring' 
   RE5_11  = 're5_11 proxy or not for e5' 
   E5_11   = 'e5_11 continence' 
   RE5B_11 = 're5b_11 proxy or not for e5b' 
   E5B_11  = 'e5b_11 # of days needing assistance in continence' 
   RE6_11  = 're6_11 proxy or not for e6' 
   E6_11   = 'e6_11 feeding' 
   RE6B_11 = 're6b_11 proxy or not for e6b' 
   E6B_11  = 'e6b_11 # of days needing assistance in feeding' 
   RE610_11= 're610_11 proxy or not for e610' 
   E610_11 = 'e610_11 primary caregiver when the elder need assistance in above six tasks' 
   RE62_11 = 're62_11 proxy or not for e62' 
   E62_11  = 'e62_11 the willingness of the primary caregiver when providing such care' 
   RE63_11 = 're63_11 proxy or not for e63' 
   E63_11  = 'e63_11 the total direct cost paid for caregiving last week' 
   RE64_11 = 're64_11 proxy or not for e64' 
   E64_11  = 'e64_11 who mainly pays the above cost?' 
   E64A_11 = 'e64a_11 othe people who pays the above cost' 
   RE65_11 = 're65_11 proxy or not for e65' 
   E65_11  = 'e65_11 does the help received for the six above tasks meet his/her needs?' 
   RE67_11 = 're67_11 proxy or not for e67' 
   E67_11  = 'e67_11 how many hours did the (grand)children help the elder last week?' 
   RE7_11  = 're7_11 proxy or not for e7' 
   E7_11   = 'e7_11 able to go outside to visit neighbors?' 
   RE8_11  = 're8_11 proxy or not for e8' 
   E8_11   = 'e8_11 able to go shopping by yourself?' 
   RE9_11  = 're9_11 proxy or not for e9' 
   E9_11   = 'e9_11 able to make food by yourself?' 
   RE10_11 = 're10_11 proxy or not for e10' 
   E10_11  = 'e10_11 able to wash clothes by yourself?' 
   RE11_11 = 're11_11 proxy or not for e11' 
   E11_11  = 'e11_11 able to walk one kilometer?' 
   RE12_11 = 're12_11 proxy or not for e12' 
   E12_11  = 'e12_11 able to carry 5kg weight?' 
   RE13_11 = 're13_11 proxy or not for e13' 
   E13_11  = 'e13_11 able to crouch and stand three times?' 
   RE14_11 = 're14_11 proxy or not for e14' 
   E14_11  = 'e14_11 able to take public transportation?' 
   RF21_11 = 'rf21_11 proxy or not for f21' 
   F21_11  = 'f21_11 do you have a retirement pension?' 
   RF211_11= 'rf211_11 proxy or not for f211' 
   F211_11 = 'f211_11 are you retired?' 
   RF22_11 = 'rf22_11 proxy or not for f22' 
   F22_11  = 'f22_11 which year did you retire?' 
   RF221_11= 'rf221_11 proxy or not for f221' 
   F221_11 = 'f221_11 if retired, what is your monthly retirement pension?' 
   RF23_11 = 'rf23_11 proxy or not for f23' 
   F23_11  = 'f23_11 are you still engaged in paid jobs after retirement?' 
   RF24_11 = 'rf24_11 proxy or not for f24' 
   F24_11  = 'f24_11 do you have public old age insurance?' 
   RF25_11 = 'rf25_11 proxy or not for f25a' 
   F251_11 = 'f251_11 what is the annual payment by individual if taking part in old age insurance?' 
   F252_11 = 'f252_11 what is the annual subsidy by government if taking part in old age insurance?' 
   RF25B_11= 'rf25b_11 proxy or not for f25b' 
   F25B1_11= 'f25b1_11 which year did you take part in public old age insurance?' 
   F25B2_11= 'f25b2_11 which month did you take part in public old age insurance?' 
   RF26_11 = 'rf26_11 proxy or not for f26' 
   F26_11  = 'f26_11 what is your monthly pension from old age insurance at present?' 
   RF27_11 = 'rf27_11 proxy or not for f27' 
   F27_11  = 'f27_11 what''s the reason that you did not take part in old age insurance?' 
   RF31_11 = 'rf31_11 proxy or not for f31' 
   F31_11  = 'f31_11 main source of financial support' 
   RF32_11 = 'rf32_11 proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A_11 = 'f32a_11 first of other financial support sources' 
   F32B_11 = 'f32b_11 second of other financial support sources' 
   F32C_11 = 'f32c_11 third of other financial support sources' 
   F32D_11 = 'f32d_11 fourth of other financial support sources' 
   F32E_11 = 'f32e_11 fifth of other financial support sources' 
   RF33_11 = 'rf33_11 proxy or not for f33' 
   F33_11  = 'f33_11 is all of the financial support sufficient to pay for daily expenses?' 
   RF340_11= 'rf340_11 proxy or not for f340' 
   F340_11 = 'f340_11 your power in decision-making on financial spending in the household' 
   RF34_11 = 'rf34_11 proxy or not for f34' 
   F34_11  = 'f34_11 how do you rate your economic status compared with other local people?' 
   RF35_11 = 'rf35_11 proxy or not for f35' 
   F35_11  = 'f35_11 total income of your household last year' 
   RF41_11 = 'rf41_11 proxy or not for f41' 
   F41_11  = 'f41_11 current marital status' 
   RF41A_11= 'rf41a_11 proxy or not for f41a' 
   F41A1_11= 'f41a1_11 did you experience the event of spouse passing-away after 2008 survey?' 
   F41A11_11= 'f41a11_11 if yes, which year to be widowed?' 
   F41A12_11= 'f41a12_11 if yes, which month to be widowed?' 
   F41A2_11= 'f41a2_11 did you experience the event of divorcement after 2008 survey?' 
   F41A21_11= 'f41a21_11 if yes, which year to be divorced?' 
   F41A22_11= 'f41a22_11 if yes, which month to be divorced?' 
   F41A3_11= 'f41a3_11 did you experience the event of remarriage after 2008 survey?' 
   F41A31_11= 'f41a31_11 if yes, which year to be remarried?' 
   F41A32_11= 'f41a32_11 if yes, which month to be remarried?' 
   RF41B_11= 'rf41b_11 proxy or not for f41b' 
   F41B_11 = 'f41b_11 do you have cohabited partner but not formally married at present?' 
   F41B1_11= 'f41b1_11 if yes, which year to be cohabited?' 
   F41B2_11= 'f41b2_11 if yes, which month to be cohabited?' 
   RF42_11 = 'rf42_11 proxy or not for f42' 
   F42_11  = 'f42_11 how many times have you been married?' 
   RF43A_11= 'rf43a_11 proxy or not for f43a1 to f43a4' 
   F43A1_11= 'f43a1_11 age at the 1st marriage' 
   F43A2_11= 'f43a2_11 current status of the 1st marriage' 
   F43A3_11= 'f43a3_11 age at the 1st marriage dissolution' 
   F43A4_11= 'f43a4_11 quality of the 1st marriage' 
   RF43B_11= 'rf43b_11 proxy or not for f43b1 to f43b4' 
   F43B1_11= 'f43b1_11 age at the 2nd marriage' 
   F43B2_11= 'f43b2_11 current status of the 2nd marriage' 
   F43B3_11= 'f43b3_11 age at the 2nd marriage dissolution' 
   F43B4_11= 'f43b4_11 quality of the 2nd marriage' 
   RF43C_11= 'rf43c_11 proxy or not for f43c1 to f43c4' 
   F43C1_11= 'f43c1_11 age at the 3rd marriage' 
   F43C2_11= 'f43c2_11 current status of the 3rd marriage' 
   F43C3_11= 'f43c3_11 age at the 3rd marriage dissolution' 
   F43C4_11= 'f43c4_11 quality of the 3rd marriage' 
   RF43D_11= 'rf43d_11 proxy or not for f43d1 to f43d4' 
   F43D1_11= 'f43d1_11 age at the latest marriage' 
   F43D2_11= 'f43d2_11 current status of the latest marriage' 
   F43D3_11= 'f43d3_11 age at the latest marriage dissolution' 
   F43D4_11= 'f43d4_11 quality of the latest marriage' 
   RF44_11 = 'rf44_11 proxy or not for f44' 
   F44_11  = 'f44_11 years of schooling of the latest spouse' 
   RF45_11 = 'rf45_11 proxy or not for f45' 
   F45_11  = 'f45_11 main occupation of the latest spouse before age 60' 
   RF46_11 = 'rf46_11 proxy or not for f46' 
   F46_11  = 'f46_11 does your spouse have a paid job at present?' 
   RF47_11 = 'rf47_11 proxy or not for f47' 
   F47_11  = 'f47_11 current health status of your spouse' 
   RF5_11  = 'rf5_11 proxy or not for f5' 
   F5_11   = 'f5_11 who take care of you when you are sick?' 
   RF61_11 = 'rf61_11 proxy or not for f61' 
   F61_11  = 'f61_11 get adequate medical service at present' 
   RF610_11= 'rf610_11 proxy or not for f610' 
   F610_11 = 'f610_11 main reason not to visit doctor when necessary' 
   RF62_11 = 'rf62_11 proxy or not for f62' 
   F62_11  = 'f62_11 got adequate medical treatment at around age 60' 
   RF63_11 = 'rf63_11 proxy or not for 63' 
   F63_11  = 'f63_11 got adequate medical treatment in childhood' 
   RF64_11 = 'rf64_11 proxy or not for f64a-f64t' 
   F64A_11 = 'f64a_11 do you have retirement pension at present' 
   F64B_11 = 'f64b_11 do you have public old-age insurance at present' 
   F64C_11 = 'f64c_11 do you have private or commercial old-age insurance at present' 
   F64D_11 = 'f64d_11 do you have public free medical services at present' 
   F64E1_11= 'f64e1_11 do you have medical insurance for urban workers at present' 
   F64F1_11= 'f64f1_11 do you have collective medical insurance for urban residents at present' 
   F64G1_11= 'f64g1_11 do you have the new rural cooperative medical insurance at present' 
   F64H1_11= 'f64h1_11 do you have commercial medical insurance at present' 
   F64I_11 = 'f64i_11 do you have other social security or private insurance at present' 
   RF651A1_11= 'rf651a1_11 proxy or not for f651a1' 
   F651A1_11= 'f651a1_11 how much money did you spend on outpatient costs last year?' 
   RF651B1_11= 'rf651b1_11 proxy or not for f651b1' 
   F651B1_11= 'f651b1_11 how much money did your family pay for outpatient costs last year?' 
   RF651A2_11= 'rf651a2_11 proxy or not for f651a2' 
   F651A2_11= 'f651a2_11 how much money did you spend on inpatient costs last year?' 
   RF651B2_11= 'rf651b2_11 proxy or not for f651b2' 
   F651B2_11= 'f651b2_11 how much money did your family pay for inpatient costs last year?' 
   RF6521_11= 'rf6521_11 proxy or not for f6521' 
   F6521_11= 'f6521_11 who mainly paid the cost?' 
   RF652A_11= 'rf652a_11 proxy or not for f652a' 
   F652A_11= 'f652a_11 how far from your home to the nearest hospital (in kilometres)?' 
   RF652B_11= 'rf652b_11 proxy or not for f652b' 
   F652B_11= 'f652b_11 do you have regular phycial examination once every year?' 
   RF66_11 = 'rf66_11 proxy or not for f66' 
   F66_11  = 'f66_11 often went to bed hungry as a child' 
   RF71_11 = 'rf71_11 proxy or not for f71' 
   F71_11  = 'f71_11 mother alive or not' 
   RF721_11= 'rf721_11 proxy or not for f721' 
   F721_11 = 'f721_11 mother''s age if alive' 
   RF722_11= 'rf722_11 proxy or not for f722' 
   F722_11 = 'f722_11 mother''s age at death' 
   F722A_11= 'f722a_11 if passed away, did she pass away after the date of 2008/2009 survey?' 
   RF73_11 = 'rf73_11 proxy or not for f73' 
   F73_11  = 'f73_11 respondent''s age at mother''s death' 
   RF74_11 = 'rf74_11 proxy or not for f74' 
   F74_11  = 'f74_11 how many years did your mother attend school?' 
   RF81_11 = 'rf81_11 proxy or not for f81' 
   F81_11  = 'f81_11 father alive or not' 
   RF821_11= 'rf821_11 proxy or not for f821' 
   F821_11 = 'f821_11 father''s age if alive' 
   RF822_11= 'rf822_11 proxy or not for f822' 
   F822_11 = 'f822_11 father''s age at death' 
   F822A_11= 'f822a_11 if passed away, did he pass away after the date of 2008/2009 survey?' 
   RF83_11 = 'rf83_11 proxy or not for f83' 
   F83_11  = 'f83_11 respondent''s age at father''s death' 
   RF84_11 = 'rf84_11 proxy or not for f84' 
   F84_11  = 'f84_11 father''s main occupation before age 60' 
   RF85_11 = 'rf85_11 proxy or not for f85' 
   F85_11  = 'f85_11 father''s main occupation in your childhood' 
   RF86_11 = 'rf86_11 proxy or not for f86' 
   F86_11  = 'f86_11 years of schooling your father received' 
   RF9_11  = 'rf9_11 proxy or not for f9' 
   F9_11   = 'f9_11 number of biological siblings' 
   F9A_11  = 'f9a_11 number of biological siblings alive' 
   RF901_11= 'rf901_11 proxy or not for f901' 
   F901_11 = 'f901_11 number of biological brothers alive at present' 
   RF901A_11= 'rf901a_11 proxy or not for f901a-f901b3' 
   F901A_11= 'f901a_11 are there any biological brothers aged 80+ alive at present?' 
   F901B1_11= 'f901b1_11 age of the oldest biological brother alive at present' 
   F901B2_11= 'f901b2_11 age of the second oldest biological brother alive at present' 
   F901B3_11= 'f901b3_11 age of the third oldest biological brother alive at present' 
   RF902_11= 'rf902_11 proxy or not for f902' 
   F902_11 = 'f902_11 number of biological sisters alive at present' 
   RF902A_11= 'rf902a_11 proxy or not for f902a-f902b3' 
   F902A_11= 'f902a_11 are there any biological sisters aged 80+ alive at present?' 
   F902B1_11= 'f902b1_11 age of the oldest biological sister alive at present' 
   F902B2_11= 'f902b2_11 age of the second oldest biological sister alive at present' 
   F902B3_11= 'f902b3_11 age of the third oldest biological sister alive at present' 
   RF91_11 = 'rf91_11 proxy or not for f91' 
   F91_11  = 'f91_11 birth order of respondent' 
   RF92A_11= 'rf92a_11 proxy or not for f92a1 to f92a7' 
   F92A1_11= 'f92a1_11 birth order of the 1st sibling' 
   F92A2_11= 'f92a2_11 sex of the 1st sibling' 
   F92A3_11= 'f92a3_11 the 1st sibling alive or not' 
   F92A4_11= 'f92a4_11 sibling''s age at present if alive, or age at death if died' 
   F92A5_11= 'f92a5_11 residence distance' 
   F92A6_11= 'f92a6_11 frequent visits' 
   F92A7_11= 'f92a7_11 contact with the 1st sibling' 
   RF92B_11= 'rf92b_11 proxy or not for f92b1 to f92b7' 
   F92B1_11= 'f92b1_11 birth order of the 2nd sibling' 
   F92B2_11= 'f92b2_11 sex of the 2nd sibling' 
   F92B3_11= 'f92b3_11 the 2nd sibling alive or not' 
   F92B4_11= 'f92b4_11 sibling''s age at present if alive, or age at death if died' 
   F92B5_11= 'f92b5_11 residence distance' 
   F92B6_11= 'f92b6_11 frequent visits' 
   F92B7_11= 'f92b7_11 contact with the 2nd sibling' 
   RF92C_11= 'rf92c_11 proxy or not for f92c1 to f92c7' 
   F92C1_11= 'f92c1_11 birth order of the 3rd sibling' 
   F92C2_11= 'f92c2_11 sex of the 3rd sibling' 
   F92C3_11= 'f92c3_11 the 3rd sibling alive or not' 
   F92C4_11= 'f92c4_11 sibling''s age at present if alive, or age at death if died' 
   F92C5_11= 'f92c5_11 residence distance' 
   F92C6_11= 'f92c6_11 frequent visits' 
   F92C7_11= 'f92c7_11 contact with the 3rd sibling' 
   RF92D_11= 'rf92d_11 proxy or not for f92d1 to f92d7' 
   F92D1_11= 'f92d1_11 birth order of the 4th sibling' 
   F92D2_11= 'f92d2_11 sex of the 4th sibling' 
   F92D3_11= 'f92d3_11 the 4th sibling alive or not' 
   F92D4_11= 'f92d4_11 sibling''s age at present if alive, or age at death if died' 
   F92D5_11= 'f92d5_11 residence distance' 
   F92D6_11= 'f92d6_11 frequent visits' 
   F92D7_11= 'f92d7_11 contact with the 4th sibling' 
   RF92E_11= 'rf92e_11 proxy or not for f92e1 to f92e7' 
   F92E1_11= 'f92e1_11 birth order of the 5th sibling' 
   F92E2_11= 'f92e2_11 sex of the 5th sibling' 
   F92E3_11= 'f92e3_11 the 5th sibling alive or not' 
   F92E4_11= 'f92e4_11 sibling''s age at present if alive, or age at death if died' 
   F92E5_11= 'f92e5_11 residence distance' 
   F92E6_11= 'f92e6_11 frequent visits' 
   F92E7_11= 'f92e7_11 contact with the 5th sibling' 
   RF92F_11= 'rf92f_11 proxy or not for f92f1 to f92f7' 
   F92F1_11= 'f92f1_11 birth order of the 6th sibling' 
   F92F2_11= 'f92f2_11 sex of the 6th sibling' 
   F92F3_11= 'f92f3_11 the 6th sibling alive or not' 
   F92F4_11= 'f92f4_11 sibling''s age at present if alive, or age at death if died' 
   F92F5_11= 'f92f5_11 residence distance' 
   F92F6_11= 'f92f6_11 frequent visits' 
   F92F7_11= 'f92f7_11 contact with the 6th sibling' 
   RF92G_11= 'rf92g_11 proxy or not for f92g1 to f92g7' 
   F92G1_11= 'f92g1_11 birth order of the 7th sibling' 
   F92G2_11= 'f92g2_11 sex of the 7th sibling' 
   F92G3_11= 'f92g3_11 the 7th sibling alive or not' 
   F92G4_11= 'f92g4_11 sibling''s age at present if alive, or age at death if died' 
   F92G5_11= 'f92g5_11 residence distance' 
   F92G6_11= 'f92g6_11 frequent visits' 
   F92G7_11= 'f92g7_11 contact with the 7th sibling' 
   RF92H_11= 'rf92h_11 proxy or not for f92h1 to f92h7' 
   F92H1_11= 'f92h1_11 birth order of the 8th sibling' 
   F92H2_11= 'f92h2_11 sex of the 8th sibling' 
   F92H3_11= 'f92h3_11 the 8th sibling alive or not' 
   F92H4_11= 'f92h4_11 sibling''s age at present if alive, or age at death if died' 
   F92H5_11= 'f92h5_11 residence distance' 
   F92H6_11= 'f92h6_11 frequent visits' 
   F92H7_11= 'f92h7_11 contact with the 8th sibling' 
   RF92I_11= 'rf92i_11 proxy or not for f92i1 to f92i7' 
   F92I1_11= 'f92i1_11 birth order of the 9th sibling' 
   F92I2_11= 'f92i2_11 sex of the 9th sibling' 
   F92I3_11= 'f92i3_11 the 9th sibling alive or not' 
   F92I4_11= 'f92i4_11 sibling''s age at present if alive, or age at death if died' 
   F92I5_11= 'f92i5_11 residence distance' 
   F92I6_11= 'f92i6_11 frequent visits' 
   F92I7_11= 'f92i7_11 contact with the 9th sibling' 
   RF92J_11= 'rf92j_11 proxy or not for f92j1 to f92j7' 
   F92J1_11= 'f92j1_11 birth order of the 10th sibling' 
   F92J2_11= 'f92j2_11 sex of the 10th sibling' 
   F92J3_11= 'f92j3_11 the 10th sibling alive or not' 
   F92J4_11= 'f92j4_11 sibling''s age at present if alive, or age at death if died' 
   F92J5_11= 'f92j5_11 residence distance' 
   F92J6_11= 'f92j6_11 frequent visits' 
   F92J7_11= 'f92j7_11 contact with the 10th sibling' 
   JIGE_11 = 'jige_11 number of siblings alive who are 80+ years old' 
   RF10_11 = 'rf10_11 proxy or not for f10 and f10a' 
   F10_11  = 'f10_11 number of children ever born' 
   F10A_11 = 'f10a_11 number of male children ever born' 
   RF101_11= 'rf101_11 proxy or not for f101' 
   F101_11 = 'f101_11 age at first birth' 
   RF102_11= 'rf102_11 proxy or not for f102' 
   F102_11 = 'f102_11 age at last birth' 
   F103_11 = 'f103_11 number of children, including deceased and non-biological children' 
   RF1030_11= 'rf1030_11 proxy or not for f1030' 
   F1030_11= 'f1030_11 number of sons alive at present' 
   RF1030A_11= 'rf1030a_11 proxy or not for f1030a-f1030b3' 
   F1030A_11= 'f1030a_11 are there any sons aged 80+ alive at present?' 
   F1030B1_11= 'f1030b1_11 age of the oldest son alive at present' 
   F1030B2_11= 'f1030b2_11 age of the second oldest son alive at present' 
   F1030B3_11= 'f1030b3_11 age of the third oldest son alive at present' 
   RF1031_11= 'rf1031_11 proxy or not for f1031' 
   F1031_11= 'f1031_11 number of daughters alive at present' 
   RF1031A_11= 'rf1031a_11 proxy or not for f1031a-f1031b3' 
   F1031A_11= 'f1031a_11 are there any daughters aged 80+ alive at present?' 
   F1031B1_11= 'f1031b1_11 age of the oldest daughter alive at present' 
   F1031B2_11= 'f1031b2_11 age of the second oldest daughter alive at present' 
   F1031B3_11= 'f1031b3_11 age of the third oldest daughter alive at present' 
   RF103A_11= 'rf103a_11 proxy or not for f103a1 to f103a8' 
   F103A8_11= 'f103a8_11 1st child is biological or not?' 
   F103A1_11= 'f103a1_11 sex of the 1st child' 
   F103A2_11= 'f103a2_11 the 1st child alive or not' 
   F103A3_11= 'f103a3_11 the 1st child''s age at present if alive, or age the child would be if s/he alive' 
   F103A4_11= 'f103a4_11 frequent visits of the 1st child' 
   F103A7_11= 'f103a7_11 contact with the 1st child' 
   F103A5_11= 'f103a5_11 residence distance of the 1st child' 
   RF103B_11= 'rf103b_11 proxy or not for f103b1 to f103b8' 
   F103B8_11= 'f103b8_11 2nd child is biological or not?' 
   F103B1_11= 'f103b1_11 sex of the 2nd child' 
   F103B2_11= 'f103b2_11 the 2nd child alive or not' 
   F103B3_11= 'f103b3_11 the 2nd child''s age at present if alive, or age the child would be if s/he alive' 
   F103B4_11= 'f103b4_11 frequent visits of the 2nd child' 
   F103B7_11= 'f103b7_11 contact with the 2nd child' 
   F103B5_11= 'f103b5_11 residence distance of the 2nd child' 
   RF103C_11= 'rf103c_11 proxy or not for f103c1 to f103c8' 
   F103C8_11= 'f103c8_11 3rd child is biological or not?' 
   F103C1_11= 'f103c1_11 sex of the 3rd child' 
   F103C2_11= 'f103c2_11 the 3rd child alive or not' 
   F103C3_11= 'f103c3_11 the 3rd child''s age at present if alive, or age the child would be if s/he alive' 
   F103C4_11= 'f103c4_11 frequent visits of the 3rd child' 
   F103C7_11= 'f103c7_11 contact with the 3rd child' 
   F103C5_11= 'f103c5_11 residence distance of the 3rd child' 
   RF103D_11= 'rf103d_11 proxy or not for f103d1 to f103d8' 
   F103D8_11= 'f103d8_11 4th child is biological or not?' 
   F103D1_11= 'f103d1_11 sex of the 4th child' 
   F103D2_11= 'f103d2_11 the 4th child alive or not' 
   F103D3_11= 'f103d3_11 the 4th child''s age at present if alive, or age the child would be if s/he alive' 
   F103D4_11= 'f103d4_11 frequent visits of the 4th child' 
   F103D7_11= 'f103d7_11 contact with the 4th child' 
   F103D5_11= 'f103d5_11 residence distance of the 4th child' 
   RF103E_11= 'rf103e_11 proxy or not for f103e1 to f103e8' 
   F103E8_11= 'f103e8_11 5th child is biological or not?' 
   F103E1_11= 'f103e1_11 sex of the 5th child' 
   F103E2_11= 'f103e2_11 the 5th child alive or not' 
   F103E3_11= 'f103e3_11 the 5th child''s age at present if alive, or age the child would be if s/he alive' 
   F103E4_11= 'f103e4_11 frequent visits of the 5th child' 
   F103E7_11= 'f103e7_11 contact with the 5th child' 
   F103E5_11= 'f103e5_11 residence distance of the 5th child' 
   RF103F_11= 'rf103f_11 proxy or not for f103f1 to f103f8' 
   F103F8_11= 'f103f8_11 6th child is biological or not?' 
   F103F1_11= 'f103f1_11 sex of the 6th child' 
   F103F2_11= 'f103f2_11 the 6th child alive or not' 
   F103F3_11= 'f103f3_11 the 6th child''s age at present if alive, or age the child would be if s/he alive' 
   F103F4_11= 'f103f4_11 frequent visits of the 6th child' 
   F103F7_11= 'f103f7_11 contact with the 6th child' 
   F103F5_11= 'f103f5_11 residence distance of the 6th child' 
   RF103G_11= 'rf103g_11 proxy or not for f103g1 to f103g8' 
   F103G8_11= 'f103g8_11 7th child is biological or not?' 
   F103G1_11= 'f103g1_11 sex of the 7th child' 
   F103G2_11= 'f103g2_11 the 7th child alive or not' 
   F103G3_11= 'f103g3_11 the 7th child''s age at present if alive, or age the child would be if s/he alive' 
   F103G4_11= 'f103g4_11 frequent visits of the 7th child' 
   F103G7_11= 'f103g7_11 contact with the 7th child' 
   F103G5_11= 'f103g5_11 residence distance of the 7th child' 
   RF103H_11= 'rf103h_11 proxy or not for f103h1 to f103h8' 
   F103H8_11= 'f103h8_11 8th child is biological or not?' 
   F103H1_11= 'f103h1_11 sex of the 8th child' 
   F103H2_11= 'f103h2_11 the 8th child alive or not' 
   F103H3_11= 'f103h3_11 the 8th child''s age at present if alive, or age the child would be if s/he alive' 
   F103H4_11= 'f103h4_11 frequent visits of the 8th child' 
   F103H7_11= 'f103h7_11 contact with the 8th child' 
   F103H5_11= 'f103h5_11 residence distance of the 8th child' 
   RF103I_11= 'rf103i_11 proxy or not for f103i1 to f103i8' 
   F103I8_11= 'f103i8_11 9th child is biological or not?' 
   F103I1_11= 'f103i1_11 sex of the 9th child' 
   F103I2_11= 'f103i2_11 the 9th child alive or not' 
   F103I3_11= 'f103i3_11 the 9th child''s age at present if alive, or age the child would be if s/he alive' 
   F103I4_11= 'f103i4_11 frequent visits of the 9th child' 
   F103I7_11= 'f103i7_11 contact with the 9th child' 
   F103I5_11= 'f103i5_11 residence distance of the 9th child' 
   RF103J_11= 'rf103j_11 proxy or not for f103j1 to f103j8' 
   F103J8_11= 'f103j8_11 10th child is biological or not?' 
   F103J1_11= 'f103j1_11 sex of the 10th child' 
   F103J2_11= 'f103j2_11 the 10th child alive or not' 
   F103J3_11= 'f103j3_11 the 10th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103J4_11= 'f103j4_11 frequent visits of the 10th child' 
   F103J7_11= 'f103j7_11 contact with the 10th child' 
   F103J5_11= 'f103j5_11 residence distance of the 10th child' 
   RF103K_11= 'rf103k_11 proxy or not for f103k1 to f103k8' 
   F103K8_11= 'f103k8_11 11th child is biological or not?' 
   F103K1_11= 'f103k1_11 sex of the 11th child' 
   F103K2_11= 'f103k2_11 the 11th child alive or not' 
   F103K3_11= 'f103k3_11 the 11th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103K4_11= 'f103k4_11 frequent visits of the 11th child' 
   F103K7_11= 'f103k7_11 contact with the 11th child' 
   F103K5_11= 'f103k5_11 residence distance of the 11th child' 
   RF103L_11= 'rf103l_11 proxy or not for f103l1 to f103l8' 
   F103L8_11= 'f103l8_11 12th child is biological or not?' 
   F103L1_11= 'f103l1_11 sex of the 12th child' 
   F103L2_11= 'f103l2_11 the 12th child alive or not' 
   F103L3_11= 'f103l3_11 the 12th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103L4_11= 'f103l4_11 frequent visits of the 12th child' 
   F103L7_11= 'f103l7_11 contact with the 12th child' 
   F103L5_11= 'f103l5_11 residence distance of the 12th child' 
   RF103M_11= 'rf103m_11 proxy or not for f103m1 to f103m8' 
   F103M8_11= 'f103m8_11 13th child is biological or not?' 
   F103M1_11= 'f103m1_11 sex of the 13th child' 
   F103M2_11= 'f103m2_11 the 13th child alive or not' 
   F103M3_11= 'f103m3_11 the 13th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103M4_11= 'f103m4_11 frequent visits of the 13th child' 
   F103M7_11= 'f103m7_11 contact with the 13th child' 
   F103M5_11= 'f103m5_11 residence distance of the 13th child' 
   RF1032_11= 'rf1032_11 proxy or not for f1032' 
   F1032_11= 'f1032_11 do children who live in same village but not in coresidence frequently visit you' 
   RF1033_11= 'rf1033_11 proxy or not for f1033' 
   F1033_11= 'f1033_11 do your children who live in other village/district/city frequently visit you?' 
   F111A_11= 'f111a_11 the first person to whom you usually talk frequently in daily life' 
   F111B_11= 'f111b_11 the second person to whom you usually talk frequently in daily life' 
   F111C_11= 'f111c_11 the third person to whom you usually talk frequently in daily life' 
   F112A_11= 'f112a_11 1st person to whom you talk first when you need to share your thoughts' 
   F112B_11= 'f112b_11 2nd person to whom you talk first when you need to share your thoughts' 
   F112C_11= 'f112c_11 3rd person to whom you talk first when you need to share your thoughts' 
   F113A_11= 'f113a_11 1st person you ask for help when you have problem/difficulties' 
   F113B_11= 'f113b_11 2nd person you ask for help when you have problem/difficulties' 
   F113C_11= 'f113c_11 3rd person you ask for help when you have problem/difficulties' 
   RF12_11 = 'rf12_11 proxy or not for f12a to f12c' 
   F12A_11 = 'f12a_11 how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_11 = 'f12b_11 how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C_11 = 'f12c_11 how much did you receive from your grandchild(ren) last year?' 
   RF13_11 = 'rf13_11 proxy or not for f13a to f13c' 
   F13A_11 = 'f13a_11 how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_11 = 'f13b_11 how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C_11 = 'f13c_11 how much did you give to your grandchild(ren)in last year?' 
   RF14_11 = 'rf14_11 proxy or not for f14' 
   F141_11 = 'f141_11 are personal care services available in your community?' 
   F142_11 = 'f142_11 are home visit services available in your community?' 
   F143_11 = 'f143_11 are psychological consulting services available in your community?' 
   F144_11 = 'f144_11 are daily shopping services available in your community?' 
   F145_11 = 'f145_11 are social and recreation services available in your community?' 
   F146_11 = 'f146_11 are legal aid services available in your community?' 
   F147_11 = 'f147_11 are healthcare education services available in your community?' 
   F148_11 = 'f148_11 are neighborhood-relation services available in your community?' 
   F149_11 = 'f149_11 are any other social services available in your community?' 
   F14T_11 = 'f14t_11 other service beyond f141-f149' 
   RF15_11 = 'rf15_11 proxy or not for f15' 
   F151_11 = 'f151_11 do you expect your community to provide personal care services?' 
   F152_11 = 'f152_11 do you expect your community to provide home visit services?' 
   F153_11 = 'f153_11 do you expect your community to provide psychological consulting services?' 
   F154_11 = 'f154_11 do you expect your community to provide daily shopping services?' 
   F155_11 = 'f155_11 do you expect your community to provide social and recreation activities?' 
   F156_11 = 'f156_11 do you expect your community provide legal aid services?' 
   F157_11 = 'f157_11 do you expect your community to provide healthcare education service?' 
   F158_11 = 'f158_11 do you expect your community to provide neighborhood-relation services?' 
   F159_11 = 'f159_11 do you expect your community to provide other social services?' 
   F15T_11 = 'f15t_11 other service beyond f151-f159' 
   F16_11  = 'f16_11 what kind of living arrangement do you like best?' 
   RG01_11 = 'rg01_11 proxy or not for g01' 
   G01_11  = 'g01_11 how about the quality of your sleep?' 
   RG02_11 = 'rg02_11 proxy or not for g02' 
   G02_11  = 'g02_11 how long do you sleep normally?' 
   RG1_11  = 'rg1_11 proxy or not for g1' 
   G1_11   = 'g1_11 visual function: can you see the break in the circle?' 
   G1A_11  = 'g1a_11 if so, where is the break located?' 
   RG21_11 = 'rg21_11 proxy or not for g21' 
   G21_11  = 'g21_11 number of natural teeth' 
   RG22_11 = 'rg22_11 proxy or not for g22' 
   G22_11  = 'g22_11 have false teeth?' 
   RG23_11 = 'rg23_11 proxy or not for g23' 
   G23_11  = 'g23_11 how often do you brush your teeth every day?' 
   RG24_11 = 'rg24_11 proxy or not for g24' 
   G24_11  = 'g24_11 during the past 6 months, did you have a toothache more than once?' 
   RG24A_11= 'rg24a_11 proxy or not for g24a' 
   G24A_11 = 'g24a_11 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG25_11 = 'rg25_11 proxy or not for g25' 
   G25_11  = 'g25_11 during the past 6 months, did you have pain in jaw joint or so more than once?' 
   RG25A_11= 'rg25a_11 proxy or not for g25a' 
   G25A_11 = 'g25a_11 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG3_11  = 'rg3_11 proxy or not for g3' 
   G3_11   = 'g3_11 able to use chopsticks to eat?' 
   RG4_11  = 'rg4_11 proxy or not for g4' 
   G4_11   = 'g4_11 which hand do you normally use for eating?' 
   RG4A_11 = 'rg4a_11 proxy or not for g4a' 
   G4A_11  = 'g4a_11 which hand do you normally use for writing?' 
   RG4B_11 = 'rg4b_11 proxy or not for g4b' 
   G4B_11  = 'g4b_11 which hand do you normally use for brushing your teeth?' 
   RG5_11  = 'rg5_11 proxy or not for g5' 
   G511_11 = 'g511_11 blood pressure test for the 1st time: systolic' 
   G512_11 = 'g512_11 blood pressure test for the 1st time: diastolic' 
   G521_11 = 'g521_11 blood pressure test for the 2nd time: systolic' 
   G522_11 = 'g522_11 blood pressure test for the 2nd time: diastolic' 
   G6_11   = 'g6_11 rhythm of heart' 
   G7_11   = 'g7_11 heart rate (in beats/min)' 
   G81_11  = 'g81_11 hand behind neck' 
   G82_11  = 'g82_11 hand behind lower back' 
   G83_11  = 'g83_11 hold-up arms' 
   G9_11   = 'g9_11 able to stand up from sitting in a chair?' 
   G101_11 = 'g101_11 weight (kilograms)' 
   G1011_11= 'g1011_11 calf curcumference (cm)' 
   G102_11 = 'g102_11 is the participant hunchbacked?' 
   G1021_11= 'g1021_11 directly measured height of the interviewee' 
   G122_11 = 'g122_11 height measured from top of the right arm bone to top of the right shoulder' 
   G123_11 = 'g123_11 height measured from the right knee joint to the ground' 
   G102B_11= 'g102b_11 self-reported height' 
   G102C_11= 'g102c_11 waist circumference' 
   RG106_11= 'rg106_11 proxy or not for g106' 
   G106_11 = 'g106_11 do you have any difficulty with your hearing?' 
   RG1061_11= 'rg1061_11 proxy or not for g1061' 
   G1061_11= 'g1061_11 in which ear(s) do you have a hearing difficulty?' 
   RG1062_11= 'rg1062_11 proxy or not for g1062' 
   G1062_11= 'g1062_11 at what age did you first notice a hearing difficulty?' 
   RG1063_11= 'rg1063_11 proxy or not for g1063' 
   G1063_11= 'g1063_11 how quickly did your hearing difficulty develop?' 
   G11_11  = 'g11_11 able to pick up a book from the floor?' 
   G12_11  = 'g12_11 steps used to turn around 360 with help?' 
   RG130_11= 'rg130_11 proxy or not for g130' 
   G130_11 = 'g130_11 feel not-well within the past two weeks?' 
   RG13_11 = 'rg13_11 with proxy or not for g131' 
   G131_11 = 'g131_11 # of times suffering from serious illness within the past two years' 
   G132_11 = 'g132_11 # of times in hospitals' 
   RG14A_11= 'rg14a_11 with proxy or not for g14a1 and g14a2' 
   G14A1_11= 'g14a1_11 name of disease suffered at 1st hospital visit' 
   G14A2_11= 'g14a2_11 1st time, number of days in hospital or bedridden' 
   RG14B_11= 'rg14b_11 with proxy or not for g14b1 and g14b2' 
   G14B1_11= 'g14b1_11 name of disease suffered at 2nd hospital visit' 
   G14B2_11= 'g14b2_11 2nd time, number of days in hospital or bedridden' 
   RG14C_11= 'rg14c_11 with proxy or not for g14c1 and g14c2' 
   G14C1_11= 'g14c1_11 name of disease suffered at the last hospital visit' 
   G14C2_11= 'g14c2_11 last time, days in hospital or bedridden' 
   G15A1_11= 'g15a1_11 suffering from hypertension?' 
   G15A2_11= 'g15a2_11 diagnosed by hospital?' 
   G15A3_11= 'g15a3_11 disability in daily life' 
   G15B1_11= 'g15b1_11 suffering from diabetes?' 
   G15B2_11= 'g15b2_11 diagnosed by hospital?' 
   G15B3_11= 'g15b3_11 disability in daily life' 
   G15C1_11= 'g15c1_11 suffering from heart disease?' 
   G15C2_11= 'g15c2_11 diagnosed by hospital?' 
   G15C3_11= 'g15c3_11 disability in daily life' 
   G15D1_11= 'g15d1_11 suffering from stroke or cvd?' 
   G15D2_11= 'g15d2_11 diagnosed by hospital?' 
   G15D3_11= 'g15d3_11 disability in daily life' 
   G15E1_11= 'g15e1_11 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_11= 'g15e2_11 diagnosed by hospital?' 
   G15E3_11= 'g15e3_11 disability in daily life' 
   G15F1_11= 'g15f1_11 suffering from tuberculosis?' 
   G15F2_11= 'g15f2_11 diagnosed by hospital?' 
   G15F3_11= 'g15f3_11 disability in daily life' 
   G15G1_11= 'g15g1_11 suffering from cataract?' 
   G15G2_11= 'g15g2_11 diagnosed by hospital?' 
   G15G3_11= 'g15g3_11 disability in daily life' 
   G15H1_11= 'g15h1_11 suffering from glaucoma?' 
   G15H2_11= 'g15h2_11 diagnosed by hospital?' 
   G15H3_11= 'g15h3_11 disability in daily life' 
   G15I1_11= 'g15i1_11 suffering from cancer?' 
   G15I2_11= 'g15i2_11 diagnosed by hospital?' 
   G15I3_11= 'g15i3_11 disability in daily life' 
   G15J1_11= 'g15j1_11 suffering from prostate tumor?' 
   G15J2_11= 'g15j2_11 diagnosed by hospital?' 
   G15J3_11= 'g15j3_11 disability in daily life' 
   G15K1_11= 'g15k1_11 suffering from gastric or duodenal ulcer?' 
   G15K2_11= 'g15k2_11 diagnosed by hospital?' 
   G15K3_11= 'g15k3_11 disability in daily life' 
   G15L1_11= 'g15l1_11 suffering from parkinson''s disease?' 
   G15L2_11= 'g15l2_11 diagnosed by hospital?' 
   G15L3_11= 'g15l3_11 disability in daily life' 
   G15M1_11= 'g15m1_11 suffering from bedsore?' 
   G15M2_11= 'g15m2_11 diagnosed by hospital?' 
   G15M3_11= 'g15m3_11 disability in daily life' 
   G15N1_11= 'g15n1_11 suffering from arthritis?' 
   G15N2_11= 'g15n2_11 diagnosed by hospital?' 
   G15N3_11= 'g15n3_11 disability in daily life' 
   G15O1_11= 'g15o1_11 suffering from dementia?' 
   G15O2_11= 'g15o2_11 diagnosed by hospital?' 
   G15O3_11= 'g15o3_11 disability in daily life' 
   G15P1_11= 'g15p1_11 suffering from epilepsy?' 
   G15P2_11= 'g15p2_11 diagnosed by hospital?' 
   G15P3_11= 'g15p3_11 disability in daily life' 
   G15Q1_11= 'g15q1_11 suffering from cholecystitis, cholelith disease?' 
   G15Q2_11= 'g15q2_11 diagnosed by hospital?' 
   G15Q3_11= 'g15q3_11 disability in daily life' 
   G15R1_11= 'g15r1_11 suffering from blood disease?' 
   G15R2_11= 'g15r2_11 diagnosed by hospital?' 
   G15R3_11= 'g15r3_11 disability in daily life' 
   G15N1A_11= 'g15n1a_11 suffering from rheumatism or rheumatoid disease?' 
   G15N2A_11= 'g15n2a_11 diagnosed by hospital?' 
   G15N3A_11= 'g15n3a_11 disability in daily life' 
   G15S1_11= 'g15s1_11 suffering from chronic nephritis?' 
   G15S2_11= 'g15s2_11 diagnosed by hospital?' 
   G15S3_11= 'g15s3_11 disability in daily life' 
   G15T1_11= 'g15t1_11 suffering from galactophore disease?' 
   G15T2_11= 'g15t2_11 diagnosed by hospital?' 
   G15T3_11= 'g15t3_11 disability in daily life' 
   G15U1_11= 'g15u1_11 suffering from uterine tumor?' 
   G15U2_11= 'g15u2_11 diagnosed by hospital?' 
   G15U3_11= 'g15u3_11 disability in daily life' 
   G15J1A_11= 'g15j1a_11 suffering from hyperplasia of prostate gland?' 
   G15J2A_11= 'g15j2a_11 diagnosed by hospital?' 
   G15J3A_11= 'g15j3a_11 disability in daily life' 
   G15V1_11= 'g15v1_11 suffering from hepatitis?' 
   G15V2_11= 'g15v2_11 diagnosed by hospital?' 
   G15V3_11= 'g15v3_11 disability in daily life' 
   G15Y2_11= 'g15y2_11 diagnosed by hospital?' 
   G15Y3_11= 'g15y3_11 disability in daily life' 
   H1_11   = 'h1_11 was interviewee able to hear?' 
   H21_11  = 'h21_11 did interviewee able to participate in physical check?' 
   H22_11  = 'h22_11 the reason for inability to participate in physical check' 
   H3_11   = 'h3_11 the health of interviewee rated by interviewer' 
   H6_11   = 'h6_11 has interviewer checked for failure to ask a question?' 
   H7_11   = 'h7_11 did anyone help the interviewee to answer question' 
   H71_11  = 'h71_11 who helped the interviewee to answer questions?' 
   D11VYEAR= 'd11vyear validated year of death of the sampled person' 
   D11VMONTH= 'd11vmonth validated month of death of the sampled person' 
   D11VDAY = 'd11vday validated day of death of the sampled person' 
   D11RESID= 'd11resid category of residence of the deceased elder at the 2005 survey' 
   D11AGE  = 'd11age validated age at death' 
   D11MARRY= 'd11marry marital status of the deceased elder prior to death' 
   D11MARRY1= 'd11marry1 did the elder have a cohabiting partner but not officially married?' 
   D11YR1  = 'd11yr1 if yes, since which year began to live together' 
   D11MON1 = 'd11mon1 if yes, since which month began to live together' 
   D11RETIRE= 'd11retire was the elder retired prior to death?' 
   D11RETYR= 'd11retyr which year did the deceased elder retire if he/she retired?' 
   D11RETPEN= 'd11retpen if retired, what was his/her monthly retirement pension?' 
   D11INSUR= 'd11insur did the deceased elder have public old age insurance prior to death?' 
   D11PAYIND= 'd11payind if yes, what was the annual payment by individual for old age insurance?' 
   D11PAYGOV= 'd11paygov if yes, what was the annual subsidy by government for old age insurance?' 
   D11INSPEN= 'd11inspen what was the monthly pension from old age insurance prior to death?' 
   D11NOINSU= 'd11noinsu what''s the reason that the elder did not take part in old age insurance?' 
   D11A53A1= 'd11a53a1 relationship of 1st person living with deceased elder in last year of life' 
   D11A53A3= 'd11a53a3 sex of the 1st person living with the deceased elder' 
   D11A53A4= 'd11a53a4 age of the 1st person living with the deceased elder' 
   D11A53A5= 'd11a53a5 education level of the 1st person living with the deceased elder' 
   D11A53A6= 'd11a53a6 # of cigarettes the 1st person usually smoke per day inside home' 
   D11A53B1= 'd11a53b1 relationship of 2nd person living with deceased elder in last year of life' 
   D11A53B3= 'd11a53b3 sex of the 2nd person living with the deceased elder' 
   D11A53B4= 'd11a53b4 age of the 2nd person living with the deceased elder' 
   D11A53B5= 'd11a53b5 education level of the 2nd person living with the deceased elder' 
   D11A53B6= 'd11a53b6 # of cigarettes the 2nd person usually smoke per day inside home' 
   D11A53C1= 'd11a53c1 relationship of 3rd person living with deceased elder in last year of life' 
   D11A53C3= 'd11a53c3 sex of the 3rd person living with the deceased elder' 
   D11A53C4= 'd11a53c4 age of the 3rd person living with the deceased elder' 
   D11A53C5= 'd11a53c5 education level of the 3rd person living with the deceased elder' 
   D11A53C6= 'd11a53c6 # of cigarettes the 3rd person usually smoke per day inside home' 
   D11A53D1= 'd11a53d1 relationship of 4th person living with deceased elder in last year of life' 
   D11A53D3= 'd11a53d3 sex of the 4th person living with the deceased elder' 
   D11A53D4= 'd11a53d4 age of the 4th person living with the deceased elder' 
   D11A53D5= 'd11a53d5 education level of the 4th person living with the deceased elder' 
   D11A53D6= 'd11a53d6 # of cigarettes the 4th person usually smoke per day inside home' 
   D11A53E1= 'd11a53e1 relationship of 5th person living with deceased elder in last year of life' 
   D11A53E3= 'd11a53e3 sex of the 5th person living with the deceased elder' 
   D11A53E4= 'd11a53e4 age of the 5th person living with the deceased elder' 
   D11A53E5= 'd11a53e5 education level of the 5th person living with the deceased elder' 
   D11A53E6= 'd11a53e6 # of cigarettes the 5th person usually smoke per day inside home' 
   D11A53F1= 'd11a53f1 relationship of 6th person living with deceased elder in last year of life' 
   D11A53F3= 'd11a53f3 sex of the 6th person living with the deceased elder' 
   D11A53F4= 'd11a53f4 age of the 6th person living with the deceased elder' 
   D11A53F5= 'd11a53f5 education level of the 6th person living with the deceased elder' 
   D11A53F6= 'd11a53f6 # of cigarettes the 6th person usually smoke per day inside home' 
   D11A53G1= 'd11a53g1 relationship of 7th person living with deceased elder in last year of life' 
   D11A53G3= 'd11a53g3 sex of the 7th person living with the deceased elder' 
   D11A53G4= 'd11a53g4 age of the 7th person living with the deceased elder' 
   D11A53G5= 'd11a53g5 education level of the 7th person living with the deceased elder' 
   D11A53G6= 'd11a53g6 # of cigarettes the 7th person usually smoke per day inside home' 
   D11A53H1= 'd11a53h1 relationship of 8th person living with deceased elder in last year of life' 
   D11A53H3= 'd11a53h3 sex of the 8th person living with the deceased elder' 
   D11A53H4= 'd11a53h4 age of the 8th person living with the deceased elder' 
   D11A53H5= 'd11a53h5 education level of the 8th person living with the deceased elder' 
   D11A53H6= 'd11a53h6 # of cigarettes the 8th person usually smoke per day inside home' 
   D11A53I1= 'd11a53i1 relationship of 9th person living with deceased elder in last year of life' 
   D11A53I3= 'd11a53i3 sex of the 9th person living with the deceased elder' 
   D11A53I4= 'd11a53i4 age of the 9th person living with the deceased elder' 
   D11A53I5= 'd11a53i5 education level of the 9th person living with the deceased elder' 
   D11A53I6= 'd11a53i6 # of cigarettes the 9th person usually smoke per day inside home' 
   D11A53J1= 'd11a53j1 relationship of 10th person living with deceasedelder in last year of life' 
   D11A53J3= 'd11a53j3 sex of the 10th person living with the deceased elder' 
   D11A53J4= 'd11a53j4 age of the 10th person living with the deceased elder' 
   D11A53J5= 'd11a53j5 education level of the 10th person living with the deceased elder' 
   D11A53J6= 'd11a53j6 # of cigarettes the 10th person usually smoke per day inside home' 
   D11LIVARR= 'd11livarr primary living arrangement of the deceased elder in the last year of life' 
   D11PERSON= 'd11person number of people who living with the respondent prior to death' 
   D11GENER= 'd11gener number of generations living in the household when the elderly died' 
   D11DPLACE= 'd11dplace place of death' 
   D11CARGIV= 'd11cargiv primary caregiver prior to death' 
   D11PCGDAY= 'd11pcgday # of days cared for the deceased by primary caregiver in last month of life' 
   D11BEDRID= 'd11bedrid bedridden or not prior to death' 
   D11BEDDAY= 'd11bedday days of being bedridden prior to death' 
   D11ILL  = 'd11ill number of times suffering from serious illness since previous survey' 
   D11DISEA1= 'd11disea1 name of disease suffering from at the first time' 
   D11DIDAY1= 'd11diday1 days suffering from such disease at the first time' 
   D11DISEA2= 'd11disea2 name of disease suffering from at the second time' 
   D11DIDAY2= 'd11diday2 days suffering from such disease at the second time' 
   D11DISEA3= 'd11disea3 name of disease suffering from at the last time' 
   D11DIDAY3= 'd11diday3 days suffering from such disease at the last time' 
   D11HYPERT= 'd11hypert suffering from hypertension prior to death?' 
   D11DIABET= 'd11diabet suffering from diabetes prior to death?' 
   D11HEART= 'd11heart suffering from heart disease prior to death' 
   D11CVD  = 'd11cvd suffering from stroke or cvd prior to death?' 
   D11PNEUM= 'd11pneum suffering from bronchitis, emphysema, pneumonia prior to death?' 
   D11TUBERC= 'd11tuberc suffering from tuberculosis prior to death?' 
   D11CANCER= 'd11cancer suffering from cancer prior to death?' 
   D11GLAUCO= 'd11glauco suffering from glaucoma or cataract prior to death?' 
   D11PROSTA= 'd11prosta suffering from prostate tumor prior to death?' 
   D11GYNECO= 'd11gyneco suffering from gynecological disease prior to death?' 
   D11GASTRI= 'd11gastri suffering from gastric or duodenal ulcer prior to death?' 
   D11PARKIN= 'd11parkin suffering from parkinson''s disease prior to death?' 
   D11BEDSOR= 'd11bedsor suffering from bedsore prior to death?' 
   D11DEMENT= 'd11dement suffering from dementia prior to death?' 
   D11PSYCHO= 'd11psycho suffering from psychosis prior to death?' 
   D11NEUROS= 'd11neuros suffering from neurosis disease?' 
   D11ARTHRI= 'd11arthri suffering from arthritis prior to death?' 
   D11OTHERS= 'd11others suffering from other chronic disease prior to death?' 
   D11MEDICA= 'd11medica got timely medication prior to death' 
   D11FINANC= 'd11financ main financial source prior to death' 
   D11INCOME= 'd11income yearly total income of the family of the deceased elder' 
   D11WCFACI= 'd11wcfaci family had toilet facility prior to death' 
   D11TAPWAT= 'd11tapwat family had tap water facility prior to death' 
   D11BATHFA= 'd11bathfa family had bath facility prior to death' 
   D11HEATER= 'd11heater family had heater prior to death' 
   D11TVSET= 'd11tvset family had tv prior to death' 
   D11WASHMA= 'd11washma family had washing machine prior to death' 
   D11PHONE= 'd11phone family had telephone prior to death' 
   D11DOCTOR= 'd11doctor if the deceased elder lived in rural, was there a doctor in the village?' 
   D11LICDOC= 'd11licdoc did the village doctor have a license?' 
   D11WHOPAY= 'd11whopay who mainly paid the medical cost for the deceased elder?' 
   D11MEDCOS= 'd11medcos total medical cost (in yuan, rmb) in the last year of the life' 
   D11POCKET= 'd11pocket total amount of out-of-pocket' 
   D11BATHFU= 'd11bathfu functioning of bathing prior to death' 
   D11BATDAY= 'd11batday days lasted if bathing functioning disabled or partially disabled' 
   D11BATDAY1= 'd11batday1 days lasted if bathing functioning partially disabled' 
   D11BATDAY2= 'd11batday2 days lasted if bathing functioning fully disabled' 
   D11DRESFU= 'd11dresfu functioning of dressing prior to death' 
   D11DREDAY= 'd11dreday days lasted if dressing functioning disabled or partially disabled' 
   D11DREDAY1= 'd11dreday1 days lasted if dressing functioning partially disabled' 
   D11DREDAY2= 'd11dreday2 days lasted if dressing functioning fully disabled' 
   D11TOILFU= 'd11toilfu functioning of toileting prior to death' 
   D11TOIDAY= 'd11toiday days lasted if toileting functioning disabled or partially disabled' 
   D11TOIDAY1= 'd11toiday1 days lasted if toileting functioning partially disabled' 
   D11TOIDAY2= 'd11toiday2 days lasted if toileting functioning fully disabled' 
   D11MOVEFU= 'd11movefu functioning of indoor transferring prior to death' 
   D11MOVDAY= 'd11movday days lasted if indoor transferring functioning disabled or partially disabled' 
   D11MOVDAY1= 'd11movday1 days lasted if indoor functioning partially disabled' 
   D11MOVDAY2= 'd11movday2 days lasted if indoor functioning fully disabled' 
   D11CONTFU= 'd11contfu functioning of continence prior to death' 
   D11CONDAY= 'd11conday days lasted in incontinence' 
   D11CONDAY1= 'd11conday1 days lasted if incontinence occasionally' 
   D11CONDAY2= 'd11conday2 days lasted if incontinence all the time with catheter used' 
   D11FEEDFU= 'd11feedfu functioning of self-feeding prior to death' 
   D11FEEDAY= 'd11feeday days lasted if can''t feed self' 
   D11FEEDAY1= 'd11feeday1 days lasted if can''t feed self occasionally' 
   D11FEEDAY2= 'd11feeday2 days lasted if can''t feed self all the time' 
   D11FULLDA= 'd11fullda days in fully dependent functioning prior to death' 
   D11CARCST= 'd11carcst total cost for full care in daily life' 
   D11DIRCST= 'd11dircst total direct cost for caregiving in the last month of life' 
   D11CARPAY= 'd11carpay who mainly paid the care serivces prior to death?' 
   D11OUTDOR= 'd11outdor days that the elder could not get outdoor to chat with others prior to death' 
   D11ACTDAY= 'd11actday days that the elder stayed in bed longer than be out of bed in the daytime' 
   D11SMOKE= 'd11smoke smoked or not since the last interview' 
   D11SMKTIM= 'd11smktim number of times smoked a day on average' 
   D11D21B = 'd11d21b how soon after waking up did the elder smoke first cigarette prior to death?' 
   D11DRINK= 'd11drink did the deceased elder drink since the last interview?' 
   D11KNDDRK= 'd11knddrk what kind of alcohol did the elder drink?' 
   D11DRKMCH= 'd11drkmch how much (liang) did the elder drink every day since last interview?' 
   D11ADVDIR= 'd11advdir whether did the deceased elderly tell the family about his/her death or not?' 
   D11DIRDAY= 'd11dirday if yes, how many days did she/he tell the family before her/his death' 
   D11DREAM= 'd11dream whether did the deceased elder have dreams about the death prior to death?' 
   D11PAIN = 'd11pain whether was the deceased elderly painful prior to death?' 
   D11UNCONS= 'd11uncons was the deceased elderly unconscious prior to death?' 
   D11UNCDAY= 'd11uncday if yes, how many days lasted prior to death' 
   D11A533 = 'd11a533 what type of dwelling was the elder''s home prior to death?' 
   D11A534 = 'd11a534 what is the approximate year the elder''s home was built?' 
   D11A535 = 'd11a535 was the house damaged from broken pipes or heavy rain during the last year befor' 
   D11A536 = 'd11a536 did the house frequently have a mildew odor or musty smell prior to death?' 
   D11A537 = 'd11a537 which fuels were normally used for cooking prior to death?' 
   D11G23  = 'd11g23 how often did the deceased elder brush teeth every day prior to death?' 
   D11G24  = 'd11g24 during the last 6 months before death, did the elder have toothache more than on' 
   D11G24A = 'd11g24a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   D11G25  = 'd11g25 during the last 6 months before death, did the elder have pain in jaw joint or s' 
   D11G25A = 'd11g25a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   D11G4   = 'd11g4 which hand did the deceased elder normally use for eating?' 
   D11G4A  = 'd11g4a which hand did the deceased elder normally use for writing?' 
   D11G4B  = 'd11g4b which hand did the deceased elder normally use for brushing teeth?' 
   D11G102 = 'd11g102 height of the deceased elder' 
   D11G106 = 'd11g106 during the last 6 months before death, did the elder have difficulty with hearin' 
   D11G1061= 'd11g1061 in which ear(s) did the elder have a hearing difficulty?' 
   D11G1062= 'd11g1062 at what age did the elder first notice hearing difficulty?' 
   D11G1063= 'd11g1063 how quickly did the elder''s hearing difficulty develop?' 
   DTH11_14= 'status of survival, death, or lost to follow-up from 2011/2012 to 2014 waves' 
   YEARIN_14= 'year of the 2014 interview' 
   MONTHIN_14= 'month of the 2014 interview' 
   DAYIN_14= 'day of the 2014 interview' 
   V_BTHYR_14= 'validated birth year' 
   V_BTHMON_14= 'validated birth month' 
   RESIDENC_14= 'category of residence of the interviewee in 2014' 
   TRUEAGE_14= 'validated age' 
   RA41_14 = 'proxy or not for a41' 
   A41_14  = 'which province were you born in?' 
   RA42_14 = 'proxy or not for a42' 
   A42_14  = 'was the country (city) you born in the same as current address?' 
   RA43_14 = 'proxy or not for a43' 
   A43_14  = 'was the place of birth an urban area or a rural area at time of birth' 
   RA51_14 = 'proxy or not for a51' 
   A51_14  = 'co-residence of interviewee' 
   RA52_14 = 'proxy or not for a52' 
   A52_14  = 'how many people are living with you?' 
   RA53A_14= 'proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4, a53a5' 
   A53A1_14= 'relationship between you and 1st person you living with currently' 
   A53A11_14= 'other relationship between you and 1st person you living with currently' 
   A53A2_14= 'sex of 1st person living with you currently' 
   A53A3_14= 'age of 1st person living with you currently' 
   A53A4_14= 'education level of 1st person living with you currently' 
   A53A5_14= '# of cigarettes 1st person usuallysmoke per day inside home' 
   RA53B_14= 'proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4, a53b5' 
   A53B1_14= 'relationship between you and 2nd person living with you currently' 
   A53B11_14= 'other relationship between you and 2nd person living with you currently' 
   A53B2_14= 'sex of 2nd person living with you currently' 
   A53B3_14= 'age of 2nd person living with you currently' 
   A53B4_14= 'education level of 2nd person living with you currently' 
   A53B5_14= '# of cigarettes 2nd person usuallysmoke per day inside home' 
   RA53C_14= 'proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4, a53c5' 
   A53C1_14= 'relationship between you and 3rd person living with you currently' 
   A53C11_14= 'other relationship between you and 3rd person living with you currently' 
   A53C2_14= 'sex of 3rd person living with you currently' 
   A53C3_14= 'age of 3rd person living with you currently' 
   A53C4_14= 'education level of 3rd person living with you currently' 
   A53C5_14= '# of cigarettes 3rd person usuallysmoke per day inside home' 
   RA53D_14= 'proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4, a53d5' 
   A53D1_14= 'relationship between you and 4th person living with you currently' 
   A53D11_14= 'other relationship between you and 4th person living with you currently' 
   A53D2_14= 'sex of 4th person living with you currently' 
   A53D3_14= 'age of 4th person living with you currently' 
   A53D4_14= 'education level of 4th person living with you currently' 
   A53D5_14= '# of cigarettes 4th person usuallysmoke per day inside home' 
   RA53E_14= 'proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4, a53e5' 
   A53E1_14= 'relationship between you and 5th person living with you currently' 
   A53E11_14= 'other relationship between you and 5th person living with you currently' 
   A53E2_14= 'sex of 5th person living with you currently' 
   A53E3_14= 'age of 5th person living with you currently' 
   A53E4_14= 'education level of 5th person living with you currently' 
   A53E5_14= '# of cigarettes 5th person usuallysmoke per day inside home' 
   RA53F_14= 'proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4, a53f5' 
   A53F1_14= 'relationship between you and 6th person living with you currently' 
   A53F11_14= 'other relationship between you and 6th person living with you currently' 
   A53F2_14= 'sex of 6th person living with you currently' 
   A53F3_14= 'age of 6th person living with you currently' 
   A53F4_14= 'education level of 6th person living with you currently' 
   A53F5_14= '# of cigarettes 6th person usuallysmoke per day inside home' 
   RA53G_14= 'proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4, a53g5' 
   A53G1_14= 'relationship between you and 7th person living with you currently' 
   A53G11_14= 'other relationship between you and 7th person living with you currently' 
   A53G2_14= 'sex of 7th person living with you currently' 
   A53G3_14= 'age of 7th person living with you currently' 
   A53G4_14= 'education level of 7th person living with you currently' 
   A53G5_14= '# of cigarettes 7th person usuallysmoke per day inside home' 
   RA53H_14= 'proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4, a53h5' 
   A53H1_14= 'relationship between you and 8th person living with you currently' 
   A53H11_14= 'other relationship between you and 8th person living with you currently' 
   A53H2_14= 'sex of 8th person living with you currently' 
   A53H3_14= 'age of 8th person living with you currently' 
   A53H4_14= 'education level of 8th person living with you currently' 
   A53H5_14= '# of cigarettes 8th person usuallysmoke per day inside home' 
   RA53I_14= 'proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4, a53i5' 
   A53I1_14= 'relationship between you and 9th person living with you currently' 
   A53I11_14= 'other relationship between you and 9th person living with you currently' 
   A53I2_14= 'sex of 9th person living with you currently' 
   A53I3_14= 'age of 9th person living with you currently' 
   A53I4_14= 'education level of 9th person living with you currently' 
   A53I5_14= '# of cigarettes 9th person usuallysmoke per day inside home' 
   RA53J_14= 'proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4, a53j5' 
   A53J1_14= 'relationship between you and 10th person living with you currently' 
   A53J11_14= 'other relationship between you and 10th person living with you currently' 
   A53J2_14= 'sex of 10th person living with you currently' 
   A53J3_14= 'age of 10th person living with you currently' 
   A53J4_14= 'education level of 10th person living with you currently' 
   A53J5_14= '# of cigarettes 10th person usuallysmoke per day inside home' 
   RA530_14= 'proxy or not for a530' 
   A530_14 = 'is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   A530A_14= 'other types for your owing the house/apartment' 
   RA531_14= 'proxy or not for a531' 
   A531_14 = 'under whose name your current house/apartment purchased or rented' 
   A531A_14= 'other name for your the house/apartment purchased or rented' 
   RA532_14= 'proxy or not for a532' 
   A532_14 = 'do you (and your spouse) have your own bedroom?' 
   RA533_14= 'proxy or not for a533' 
   A533_14 = 'what type of dwelling is your home?' 
   A533A_14= 'other type of dwelling' 
   RA534_14= 'proxy or not for a534' 
   A534_14 = 'what is the approximate year your home was built?' 
   RA535_14= 'proxy or not for a535' 
   A535_14 = 'during past 1 year, was your home damaged from broken pipes or heavy rain?' 
   RA536_14= 'proxy or not for a536' 
   A536_14 = 'does your home frequently have a mildew odor or musty smell?' 
   RA537_14= 'proxy or not for a537' 
   A537_14 = 'which fuels are normally used for cooking in your home?' 
   A537A_14= 'a537a_14 other kinds beyond a537' 
   RA540_14= 'proxy or not for a540' 
   A540_14 = 'the primary reason that you live in an institution (elderly center, elderly home' 
   RA541_14= 'proxy or not for a541' 
   A541_14 = 'the average monthly cost for the elder living in an institution' 
   RA542_14= 'proxy or not for a542' 
   A542_14 = 'who mainly paid for the cost?' 
   A542A_14= 'other people mainly paid for the cost' 
   RA54_14 = 'proxy or not for a54a a54b' 
   A54A_14 = 'year of being admitted to the institution or living alone' 
   A54B_14 = 'month of being admitted to the institution or living alone' 
   B11_14  = 'self-reported quality of life' 
   B12_14  = 'self-reported health' 
   B121_14 = 'do you feel any change of your health since last year' 
   B21_14  = 'look on the bright side of things' 
   B22_14  = 'keep my belongings neat and clean' 
   B23_14  = 'feel fearful or anxious' 
   B24_14  = 'feel lonely and isolated' 
   B25_14  = 'make own decision' 
   B26_14  = 'feel useless with age' 
   B27_14  = 'be happy as younger' 
   B28_14  = 'have you felt sad, blue, or depressed for two weeks or more in last 12 months?' 
   B29_14  = 'have you lost interest in most things like hobbies, work, or similar activities' 
   B210_14 = 'how much of the day did these feelings usually last?' 
   C11_14  = 'what time of day is it right now?' 
   C12_14  = 'what is the animal year of this year?' 
   C13_14  = 'what is the date of the mid-autumn festival?' 
   C14_14  = 'what is the season right now?' 
   C15_14  = 'what is the name of this county or district?' 
   C16_14  = '# of kinds of food named in one minute' 
   C21A_14 = 'repeat the name of "table" at first attempt' 
   C21B_14 = 'repeat the name of "apple" at first attempt' 
   C21C_14 = 'repeat the name of "clothes" at first attempt' 
   C22_14  = 'attempts to repeat the names of three objects correctly' 
   C31A_14 = '$20-$3=?' 
   C31B_14 = '$20-$3-$3=?' 
   C31C_14 = '$20-$3-$3-$3=?' 
   C31D_14 = '$20-$3-$3-$3-$3=?' 
   C31E_14 = '$20-$3-$3-$3-$3-$3=?' 
   C32_14  = 'draw the figure following the example' 
   C41A_14 = 'repeat the name of "table" a while later' 
   C41B_14 = 'repeat the name of "apple" a while later' 
   C41C_14 = 'repeat the name of "clothes" a while later' 
   C51A_14 = 'name "pen"' 
   C51B_14 = 'name "watch"' 
   C52_14  = 'repeat a sentence' 
   C53A_14 = 'taking paper using right hand' 
   C53B_14 = 'fold paper' 
   C53C_14 = 'put paper on the floor' 
   C54_14  = 'was the interviewee able to answer sections b and c?' 
   C55_14  = 'what is the main reason unable to answer questions?' 
   RD1_14  = 'proxy or not for d1' 
   D1_14   = 'staple food' 
   RD2_14  = 'proxy or not for d2' 
   D2_14   = 'amount of staple food per day (liang)' 
   RD31_14 = 'proxy or not for d31' 
   D31_14  = 'how often eat fresh fruit?' 
   RD32_14 = 'proxy or not for d32' 
   D32_14  = 'how often eat vegetables?' 
   RD33_14 = 'proxy or not for d33' 
   D33_14  = 'what kind of grease do you mainly use for cooking?' 
   D33A_14 = 'other kind of grease you mainly use' 
   RD34_14 = 'proxy or not for d34' 
   D34_14  = 'main flavor you have' 
   RD4MEAT_14= 'proxy or not for d4meat1 and d4meat2' 
   D4MEAT2_14= 'how often eat meat at present?' 
   D4MEAT1_14= 'how often ate meat at around age 60?' 
   RD4FISH_14= 'proxy or not for d4fish1 and d4fish2' 
   D4FISH2_14= 'how often eat fish at present?' 
   D4FISH1_14= 'how often ate fish at around age 60?' 
   RD4EGG_14= 'proxy or not for d4egg1 and d4egg2' 
   D4EGG2_14= 'how often eat eggs at present?' 
   D4EGG1_14= 'how often ate eggs at around age 60?' 
   RD4BEAN_14= 'proxy or not for d4bean1 and d4bean2' 
   D4BEAN2_14= 'how often eat food made from beans at present?' 
   D4BEAN1_14= 'how often ate food made from beans at around age 60?' 
   RD4VEG_14= 'proxy or not for d4veg1 and d4veg2' 
   D4VEG2_14= 'how often eat salt-preserved vegetables at present' 
   D4VEG1_14= 'how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA_14= 'proxy or not for d4suga1 and d4suga2' 
   D4SUGA2_14= 'how often eat sugar at present' 
   D4SUGA1_14= 'how often ate sugar at around age 60' 
   RD4TEA_14= 'proxy or not for d4tea1 and d4tea2' 
   D4TEA2_14= 'how often drink tea at present' 
   D4TEA1_14= 'how often drank tea at around age 60' 
   RD4GARL_14= 'proxy or not for d4garl1 and d4garl2' 
   D4GARL2_14= 'how often eat garlic at present' 
   D4GARL1_14= 'how often ate garlic at around age 60' 
   RD4MILK_14= 'proxy or not for d4milk1 and d4milk2' 
   D4MILK1_14= 'how often eat milk products at present' 
   D4MILK2_14= 'how often ate milk products at around age 60' 
   RD4NUT_14= 'proxy or not for d4nut1 and d4nut2' 
   D4NUT1_14= 'how often eat nut products at present' 
   D4NUT2_14= 'how often ate nut products at around age 60' 
   RD4ALGA_14= 'proxy or not for d4alga1 and d4alga2' 
   D4ALGA1_14= 'how often eat mushroom or algae at present' 
   D4ALGA2_14= 'how often ate mushroom or algae at around age 60' 
   RD4VIT_14= 'proxy or not for d4vit1 and d4vit2' 
   D4VIT1_14= 'how often eat vitamins (a/c/e) at present' 
   D4VIT2_14= 'how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG_14= 'proxy or not for d4drug1 and d4drug2' 
   D4DRUG1_14= 'how often eat medicinal plants at present' 
   D4DRUG2_14= 'how often ate medicinal plants at around age 60' 
   D4A_14  = 'what kind of tea usually drink at present?' 
   D4B_14  = 'what kind of tea usually drink at around age 60?' 
   RD5_14  = 'proxy or not for d5' 
   D5_14   = 'what kind of water usually drink?' 
   RD6_14  = 'proxy or not for d6a d6b d6c' 
   D6A_14  = 'main source of water drank during childhood' 
   D6B_14  = 'main source of water drank at around age 60' 
   D6C_14  = 'main source of drinking water at present' 
   RD71_14 = 'proxy or not for d71' 
   D71_14  = 'smoke or not at present?' 
   RD72_14 = 'proxy or not for d72' 
   D72_14  = 'smoked or not in the past?' 
   RD73_14 = 'proxy or not for d73' 
   D73_14  = 'age when began smoking' 
   RD74_14 = 'proxy or not for d74' 
   D74_14  = 'age when quit smoking if not smoking at present' 
   RD75_14 = 'proxy or not for d75' 
   D75_14  = 'number of times smoke (or smoked) per day' 
   RD76_14 = 'proxy or not for d76' 
   D76_14  = 'how soon after you wake up do you smoke your first cigarette?' 
   RD77_14 = 'proxy or not for d77' 
   D77_14  = 'what do you think about your chances of being diagnosed with lung cancer?' 
   RD78_14 = 'proxy or not for d78' 
   D78_14  = 'during childhood, were you exposed to smoke from other people at home?' 
   D78A_14 = 'd78a_14 if yes, for how many hours per day?' 
   D78B_14 = 'd78b_14 if yes, for how many years?' 
   RD79_14 = 'proxy or not for d79' 
   D79_14  = 'during young/middle-ages, were you exposed to smoke from others at home?' 
   D79A_14 = 'd79a_14 if yes, for how many hours per day?' 
   D79B_14 = 'd79b_14 if yes, for how many years?' 
   RD710_14= 'proxy or not for d710' 
   D710_14 = 'in social settings such as restaurant, were you exposed to smoke from others?' 
   D710A_14= 'd710a_14 if yes, for how many hours per day?' 
   D710B_14= 'd710b_14 if yes, for how many years?' 
   RD81_14 = 'proxy or not for d81' 
   D81_14  = 'drink or not at present?' 
   RD82_14 = 'proxy or not for d82' 
   D82_14  = 'drank or not in the past?' 
   RD83_14 = 'proxy or not for d83' 
   D83_14  = 'age when began drinking' 
   RD84_14 = 'proxy or not for d84' 
   D84_14  = 'age when quit drinking if not drinking at present' 
   RD85_14 = 'proxy or not for d85' 
   D85_14  = 'what kind of alcohol you drink (drank) ?' 
   D85A_14 = 'other kind of alcohol' 
   RD86_14 = 'proxy or not for d86' 
   D86_14  = 'how much per day do you drink (or drank)?' 
   RD87_14 = 'proxy or not for d87' 
   D87_14  = 'when stop drinking, do you feel anxious for most of the day for at least 2 days?' 
   RD91_14 = 'proxy or not for d91' 
   D91_14  = 'exercise or not at present?' 
   RD92_14 = 'proxy or not for d92' 
   D92_14  = 'exercised or not in the past?' 
   RD93_14 = 'proxy or not for d93' 
   D93_14  = 'age when started to exercise' 
   RD94_14 = 'proxy or not for d94' 
   D94_14  = 'age when quit exercise if not exercising at present' 
   RD101_14= 'proxy or not for d101' 
   D101_14 = 'have you done physical labor regularly?' 
   RD102_14= 'proxy or not for d102' 
   D102_14 = 'age when began doing physical labor' 
   RD103_14= 'proxy or not for d103' 
   D103_14 = 'age when stopped doing physical labor' 
   RD11A_14= 'proxy or not for d11a' 
   D11A_14 = 'do you do house work at present?' 
   RD11B_14= 'proxy or not for d11b' 
   D11B_14 = 'do you grow vegetables & do other field work at present?' 
   RD11C_14= 'proxy or not for d11c' 
   D11C_14 = 'do you do garden work' 
   RD11D_14= 'proxy or not for d11d' 
   D11D_14 = 'do you read newspapers/books at present?' 
   RD11E_14= 'proxy or not for d11e' 
   D11E_14 = 'do you raise domestic animals/pets at present?' 
   RD11F_14= 'proxy or not for d11f' 
   D11F_14 = 'do you play cards/mah-jongg at present?' 
   RD11G_14= 'proxy or not for d11g' 
   D11G_14 = 'do you watch tv or listen to radio at present ?' 
   RD11H_14= 'proxy or not for d11h' 
   D11H_14 = 'do you take part in some social activities at present?' 
   RD12_14 = 'proxy or not for d12' 
   D12_14  = '# of times traveling beyond home county/city in the past two years' 
   RE0_14  = 'proxy or not for e0' 
   E0_14   = 'for the last 6 months, were you limited in activities because of health problem?' 
   RE1_14  = 'proxy or not for e1' 
   E1_14   = 'bathing' 
   RE1B_14 = 'proxy or not for e1b' 
   E1B_14  = '# of days needing assistance in bathing' 
   RE2_14  = 'proxy or not for e2' 
   E2_14   = 'dressing' 
   RE2B_14 = 'proxy or not for e2b' 
   E2B_14  = '# of days needing assistance in dressing' 
   RE3_14  = 'proxy or not for e3' 
   E3_14   = 'toileting' 
   RE3B_14 = 'proxy or not for e3b' 
   E3B_14  = '# of days needing assistance in toileting' 
   RE4_14  = 'proxy or not for e4' 
   E4_14   = 'indoor transferring' 
   RE4B_14 = 'proxy or not for e4b' 
   E4B_14  = '# of days needing assistance in indoor transferring' 
   RE5_14  = 'proxy or not for e5' 
   E5_14   = 'continence' 
   RE5B_14 = 'proxy or not for e5b' 
   E5B_14  = '# of days needing assistance in continence' 
   RE6_14  = 'proxy or not for e6' 
   E6_14   = 'feeding' 
   RE6B_14 = 'proxy or not for e6b' 
   E6B_14  = '# of days needing assistance in feeding' 
   RE610_14= 'proxy or not for e610' 
   E610_14 = 'primary caregiver when the elder need assistance in above six tasks' 
   RE62_14 = 'proxy or not for e62' 
   E62_14  = 'the willingness of the primary caregiver when providing such care' 
   RE63_14 = 'proxy or not for e63' 
   E63_14  = 'the total direct cost paid for caregiving last week' 
   RE64_14 = 'proxy or not for e64' 
   E64_14  = 'who mainly pays the above cost?' 
   E64A_14 = 'othe people who pays the above cost' 
   RE65_14 = 'proxy or not for e65' 
   E65_14  = 'does the help received for the six above tasks meet his/her needs?' 
   RE67_14 = 'proxy or not for e67' 
   E67_14  = 'how many hours did the (grand)children help the elder last week?' 
   RE7_14  = 'proxy or not for e7' 
   E7_14   = 'able to go outside to visit neighbors?' 
   RE8_14  = 'proxy or not for e8' 
   E8_14   = 'able to go shopping by yourself?' 
   RE9_14  = 'proxy or not for e9' 
   E9_14   = 'able to make food by yourself?' 
   RE10_14 = 'proxy or not for e10' 
   E10_14  = 'able to wash clothes by yourself?' 
   RE11_14 = 'proxy or not for e11' 
   E11_14  = 'able to walk one kilometer?' 
   RE12_14 = 'proxy or not for e12' 
   E12_14  = 'able to carry 5kg weight?' 
   RE13_14 = 'proxy or not for e13' 
   E13_14  = 'able to crouch and stand three times?' 
   RE14_14 = 'proxy or not for e14' 
   E14_14  = 'able to take public transportation?' 
   RF1_14  = 'proxy or not for f1' 
   F1_14   = 'years of schooling' 
   RF2_14  = 'proxy or not for f2' 
   F2_14   = 'main occupation before age 60' 
   RF21_14 = 'proxy or not for f21' 
   F21_14  = 'do you have a retirement pension?' 
   RF211_14= 'proxy or not for f211' 
   F211_14 = 'are you retired?' 
   RF22_14 = 'proxy or not for f22' 
   F22_14  = 'which year did you retire?' 
   RF221_14= 'proxy or not for f221' 
   F221_14 = 'if retired, what is your monthly retirement pension?' 
   RF23_14 = 'proxy or not for f23' 
   F23_14  = 'are you still engaged in paid jobs after retirement?' 
   RF24_14 = 'proxy or not for f24' 
   F24_14  = 'do you have public old age insurance?' 
   RF25A_14= 'proxy or not for f25a' 
   F25A1_14= 'what is the annual payment by individual if taking part in old age insurance?' 
   F25A2_14= 'what is the annual subsidy by government if taking part in old age insurance?' 
   RF25B_14= 'proxy or not for f25b' 
   F25B1_14= 'which year did you take part in public old age insurance?' 
   F25B2_14= 'which month did you take part in public old age insurance?' 
   RF26_14 = 'proxy or not for f26' 
   F26_14  = 'what is your monthly pension from old age insurance at present?' 
   RF27_14 = 'proxy or not for f27' 
   F27_14  = 'what''s the reason that you did not take part in old age insurance?' 
   RF31_14 = 'proxy or not for f31' 
   F31_14  = 'main source of financial support' 
   RF32_14 = 'proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A_14 = 'first of other financial support sources' 
   F32B_14 = 'second of other financial support sources' 
   F32C_14 = 'third of other financial support sources' 
   F32D_14 = 'fourth of other financial support sources' 
   F32E_14 = 'fifth of other financial support sources' 
   RF33_14 = 'proxy or not for f33' 
   F33_14  = 'is all of the financial support sufficient to pay for daily expenses?' 
   RF340_14= 'proxy or not for f340' 
   F340_14 = 'your power in decision-making on financial spending in the household' 
   RF34_14 = 'proxy or not for f34' 
   F34_14  = 'how do you rate your economic status compared with other local people?' 
   RF35_14 = 'proxy or not for f35' 
   F35_14  = 'total income of your household last year' 
   RF41_14 = 'proxy or not for f41' 
   F41_14  = 'current marital status' 
   RF41A_14= 'proxy or not for f41a' 
   F41A1_14= 'did you experience the event of spouse passing-away after 2008 survey?' 
   F41A11_14= 'if yes, which year to be widowed?' 
   F41A12_14= 'if yes, which month to be widowed?' 
   F41A2_14= 'did you experience the event of divorcement after 2008 survey?' 
   F41A21_14= 'if yes, which year to be divorced?' 
   F41A22_14= 'if yes, which month to be divorced?' 
   F41A3_14= 'did you experience the event of remarriage after 2008 survey?' 
   F41A31_14= 'if yes, which year to be remarried?' 
   F41A32_14= 'if yes, which month to be remarried?' 
   RF41B_14= 'proxy or not for f41b' 
   F41B_14 = 'do you have cohabited partner but not formally married at present?' 
   F41B1_14= 'if yes, which year to be cohabited?' 
   F41B2_14= 'if yes, which month to be cohabited?' 
   RF42_14 = 'proxy or not for f42' 
   F42_14  = 'how many times have you been married?' 
   RF43A_14= 'proxy or not for f43a1 to f43a4' 
   F43A1_14= 'age at the 1st marriage' 
   F43A2_14= 'current status of the 1st marriage' 
   F43A3_14= 'age at the 1st marriage dissolution' 
   F43A4_14= 'quality of the 1st marriage' 
   RF43B_14= 'proxy or not for f43b1 to f43b4' 
   F43B1_14= 'age at the 2nd marriage' 
   F43B2_14= 'current status of the 2nd marriage' 
   F43B3_14= 'age at the 2nd marriage dissolution' 
   F43B4_14= 'quality of the 2nd marriage' 
   RF43C_14= 'proxy or not for f43c1 to f43c4' 
   F43C1_14= 'age at the 3rd marriage' 
   F43C2_14= 'current status of the 3rd marriage' 
   F43C3_14= 'age at the 3rd marriage dissolution' 
   F43C4_14= 'quality of the 3rd marriage' 
   RF43D_14= 'proxy or not for f43d1 to f43d4' 
   F43D1_14= 'age at the latest marriage' 
   F43D2_14= 'current status of the latest marriage' 
   F43D3_14= 'age at the latest marriage dissolution' 
   F43D4_14= 'quality of the latest marriage' 
   RF44_14 = 'proxy or not for f44' 
   F44_14  = 'years of schooling of the latest spouse' 
   RF45_14 = 'proxy or not for f45' 
   F45_14  = 'main occupation of the latest spouse before age 60' 
   RF46_14 = 'proxy or not for f46' 
   F46_14  = 'does your spouse have a paid job at present?' 
   RF47_14 = 'proxy or not for f47' 
   F47_14  = 'current health status of your spouse' 
   RF5_14  = 'proxy or not for f5' 
   F5_11_14= 'who take care of you when you are sick?' 
   RF61_14 = 'proxy or not for f61' 
   F61_14  = 'get adequate medical service at present' 
   RF610_14= 'proxy or not for f610' 
   F610_14 = 'main reason not to visit doctor when necessary' 
   RF62_14 = 'proxy or not for f62' 
   F62_14  = 'got adequate medical treatment at around age 60' 
   RF63_14 = 'proxy or not for 63' 
   F63_14  = 'got adequate medical treatment in childhood' 
   RF64_14 = 'proxy or not for f64a-f64t' 
   F64A_14 = 'do you have retirement pension at present' 
   F64B_14 = 'do you have public old-age insurance at present' 
   F64C_14 = 'do you have private or commercial old-age insurance at present' 
   F64D_14 = 'do you have public free medical services at present' 
   F64E_14 = 'do you have medical insurance for urban workers at present' 
   F64F_14 = 'do you have collective medical insurance for urban residents at present' 
   F64G_14 = 'do you have the new rural cooperative medical insurance at present' 
   F64H_14 = 'do you have commercial medical insurance at present' 
   F64I_14 = 'do you have other social security or private insurance at present' 
   RF651A1_14= 'proxy or not for f651a1' 
   F651A1_14= 'how much money did you spend on outpatient costs last year?' 
   RF651B1_14= 'proxy or not for f651b1' 
   F651B1_14= 'how much money did your family pay for outpatient costs last year?' 
   RF651A2_14= 'proxy or not for f651a2' 
   F651A2_14= 'how much money did you spend on inpatient costs last year?' 
   RF651B2_14= 'proxy or not for f651b2' 
   F651B2_14= 'how much money did your family pay for inpatient costs last year?' 
   RF6521_14= 'proxy or not for f6521' 
   F6521_14= 'who mainly paid the cost?' 
   F6521T_14= 'other people who mainly paid the cost' 
   RF652A_14= 'proxy or not for f652a' 
   F652A_14= 'how far from your home to the nearest hospital (in kilometres)?' 
   RF652B_14= 'proxy or not for f652b' 
   F652B_14= 'do you have regular phycial examination once every year?' 
   RF66_14 = 'proxy or not for f66' 
   F66_14  = 'often went to bed hungry as a child' 
   RF71_14 = 'proxy or not for f71' 
   F71_14  = 'mother alive or not' 
   RF721_14= 'proxy or not for f721' 
   F721_14 = 'mother''s age if alive' 
   RF722_14= 'proxy or not for f722' 
   F722_14 = 'mother''s age at death' 
   RF73_14 = 'proxy or not for f73' 
   F73_14  = 'respondent''s age at mother''s death' 
   RF74_14 = 'proxy or not for f74' 
   F74_14  = 'how many years did your mother attend school?' 
   RF81_14 = 'proxy or not for f81' 
   F81_14  = 'father alive or not' 
   RF821_14= 'proxy or not for f821' 
   F821_14 = 'father''s age if alive' 
   RF822_14= 'proxy or not for f822' 
   F822_14 = 'father''s age at death' 
   RF83_14 = 'proxy or not for f83' 
   F83_14  = 'respondent''s age at father''s death' 
   RF84_14 = 'proxy or not for f84' 
   F84_14  = 'father''s main occupation before age 60' 
   RF85_14 = 'proxy or not for f85' 
   F85_14  = 'father''s main occupation in your childhood' 
   RF86_14 = 'proxy or not for f86' 
   F86_14  = 'years of schooling your father received' 
   RF91_14 = 'proxy or not for f91' 
   F91_14  = 'Birth order of respondent' 
   RF92A_14= 'proxy or not for f92a1 to f92a7' 
   F92A1_14= 'birth order of the 1st sibling' 
   F92A2_14= 'sex of the 1st sibling' 
   F92A3_14= 'the 1st sibling alive or not' 
   F92A4_14= 'f92a4_14 sibling''s age at present if alive, or age at death if died' 
   F92A5_14= 'f92a5_14 residence distance' 
   F92A6_14= 'f92a6_14 frequent visits' 
   F92A7_14= 'contact with the 1st sibling' 
   RF92B_14= 'proxy or not for f92b1 to f92b7' 
   F92B1_14= 'birth order of the 2nd sibling' 
   F92B2_14= 'sex of the 2nd sibling' 
   F92B3_14= 'the 2nd sibling alive or not' 
   F92B4_14= 'f92b4_14 sibling''s age at present if alive, or age at death if died' 
   F92B5_14= 'f92b5_14 residence distance' 
   F92B6_14= 'f92b6_14 frequent visits' 
   F92B7_14= 'contact with the 2nd sibling' 
   RF92C_14= 'proxy or not for f92c1 to f92c7' 
   F92C1_14= 'birth order of the 3rd sibling' 
   F92C2_14= 'sex of the 3rd sibling' 
   F92C3_14= 'the 3rd sibling alive or not' 
   F92C4_14= 'f92c4_14 sibling''s age at present if alive, or age at death if died' 
   F92C5_14= 'f92c5_14 residence distance' 
   F92C6_14= 'f92c6_14 frequent visits' 
   F92C7_14= 'contact with the 3rd sibling' 
   RF92D_14= 'proxy or not for f92d1 to f92d7' 
   F92D1_14= 'birth order of the 4th sibling' 
   F92D2_14= 'sex of the 4th sibling' 
   F92D3_14= 'the 4th sibling alive or not' 
   F92D4_14= 'f92d4_14 sibling''s age at present if alive, or age at death if died' 
   F92D5_14= 'f92d5_14 residence distance' 
   F92D6_14= 'f92d6_14 frequent visits' 
   F92D7_14= 'contact with the 4th sibling' 
   RF92E_14= 'proxy or not for f92e1 to f92e7' 
   F92E1_14= 'birth order of the 5th sibling' 
   F92E2_14= 'sex of the 5th sibling' 
   F92E3_14= 'the 5th sibling alive or not' 
   F92E4_14= 'f92e4_14 sibling''s age at present if alive, or age at death if died' 
   F92E5_14= 'f92e5_14 residence distance' 
   F92E6_14= 'f92e6_14 frequent visits' 
   F92E7_14= 'contact with the 5th sibling' 
   RF92F_14= 'proxy or not for f92f1 to f92f7' 
   F92F1_14= 'birth order of the 6th sibling' 
   F92F2_14= 'sex of the 6th sibling' 
   F92F3_14= 'the 6th sibling alive or not' 
   F92F4_14= 'f92f4_14 sibling''s age at present if alive, or age at death if died' 
   F92F5_14= 'f92f5_14 residence distance' 
   F92F6_14= 'f92f6_14 frequent visits' 
   F92F7_14= 'contact with the 6th sibling' 
   RF92G_14= 'proxy or not for f92g1 to f92g7' 
   F92G1_14= 'birth order of the 7th sibling' 
   F92G2_14= 'sex of the 7th sibling' 
   F92G3_14= 'the 7th sibling alive or not' 
   F92G4_14= 'f92g4_14 sibling''s age at present if alive, or age at death if died' 
   F92G5_14= 'f92g5_14 residence distance' 
   F92G6_14= 'f92g6_14 frequent visits' 
   F92G7_14= 'contact with the 7th sibling' 
   RF92H_14= 'proxy or not for f92h1 to f92h7' 
   F92H1_14= 'birth order of the 8th sibling' 
   F92H2_14= 'sex of the 8th sibling' 
   F92H3_14= 'the 8th sibling alive or not' 
   F92H4_14= 'f92h4_14 sibling''s age at present if alive, or age at death if died' 
   F92H5_14= 'f92h5_14 residence distance' 
   F92H6_14= 'f92h6_14 frequent visits' 
   F92H7_14= 'contact with the 8th sibling' 
   RF92I_14= 'proxy or not for f92i1 to f92i7' 
   F92I1_14= 'birth order of the 9th sibling' 
   F92I2_14= 'sex of the 9th sibling' 
   F92I3_14= 'the 9th sibling alive or not' 
   F92I4_14= 'f92i4_14 sibling''s age at present if alive, or age at death if died' 
   F92I5_14= 'f92i5_14 residence distance' 
   F92I6_14= 'f92i6_14 frequent visits' 
   F92I7_14= 'contact with the 9th sibling' 
   RF92J_14= 'proxy or not for f92j1 to f92j7' 
   F92J1_14= 'birth order of the 10th sibling' 
   F92J2_14= 'sex of the 10th sibling' 
   F92J3_14= 'the 10th sibling alive or not' 
   F92J4_14= 'f92j4_14 sibling''s age at present if alive, or age at death if died' 
   F92J5_14= 'f92j5_14 residence distance' 
   F92J6_14= 'f92j6_14 frequent visits' 
   F92J7_14= 'contact with the 10th sibling' 
   JIGE_14 = 'number of siblings alive who are 80+ years old' 
   RF10_14 = 'proxy or not for f10 and f10a' 
   F10_14  = 'number of children ever born' 
   F10A_14 = 'number of male children ever born' 
   RF101_14= 'proxy or not for f101' 
   F101_14 = 'age at first birth' 
   RF102_14= 'proxy or not for f102' 
   F102_14 = 'age at last birth' 
   RF103A_14= 'proxy or not for f103a1 to f103a8' 
   F103A8_14= '1st child is biological or not?' 
   F103A1_14= 'sex of the 1st child' 
   F103A2_14= 'the 1st child alive or not' 
   F103A3_14= 'the 1st child''s age at present if alive, or age the child would be if s/he alive' 
   F103A4_14= 'frequent visits of the 1st child' 
   F103A7_14= 'contact with the 1st child' 
   F103A5_14= 'residence distance of the 1st child' 
   RF103B_14= 'proxy or not for f103b1 to f103b8' 
   F103B8_14= '2nd child is biological or not?' 
   F103B1_14= 'sex of the 2nd child' 
   F103B2_14= 'the 2nd child alive or not' 
   F103B3_14= 'the 2nd child''s age at present if alive, or age the child would be if s/he alive' 
   F103B4_14= 'frequent visits of the 2nd child' 
   F103B7_14= 'contact with the 2nd child' 
   F103B5_14= 'residence distance of the 2nd child' 
   RF103C_14= 'proxy or not for f103c1 to f103c8' 
   F103C8_14= '3rd child is biological or not?' 
   F103C1_14= 'sex of the 3rd child' 
   F103C2_14= 'the 3rd child alive or not' 
   F103C3_14= 'the 3rd child''s age at present if alive, or age the child would be if s/he alive' 
   F103C4_14= 'frequent visits of the 3rd child' 
   F103C7_14= 'contact with the 3rd child' 
   F103C5_14= 'residence distance of the 3rd child' 
   RF103D_14= 'proxy or not for f103d1 to f103d8' 
   F103D8_14= '4th child is biological or not?' 
   F103D1_14= 'sex of the 4th child' 
   F103D2_14= 'the 4th child alive or not' 
   F103D3_14= 'the 4th child''s age at present if alive, or age the child would be if s/he alive' 
   F103D4_14= 'frequent visits of the 4th child' 
   F103D7_14= 'contact with the 4th child' 
   F103D5_14= 'residence distance of the 4th child' 
   RF103E_14= 'proxy or not for f103e1 to f103e8' 
   F103E8_14= '5th child is biological or not?' 
   F103E1_14= 'sex of the 5th child' 
   F103E2_14= 'the 5th child alive or not' 
   F103E3_14= 'the 5th child''s age at present if alive, or age the child would be if s/he alive' 
   F103E4_14= 'frequent visits of the 5th child' 
   F103E7_14= 'contact with the 5th child' 
   F103E5_14= 'residence distance of the 5th child' 
   RF103F_14= 'proxy or not for f103f1 to f103f8' 
   F103F8_14= '6th child is biological or not?' 
   F103F1_14= 'sex of the 6th child' 
   F103F2_14= 'the 6th child alive or not' 
   F103F3_14= 'the 6th child''s age at present if alive, or age the child would be if s/he alive' 
   F103F4_14= 'frequent visits of the 6th child' 
   F103F7_14= 'contact with the 6th child' 
   F103F5_14= 'residence distance of the 6th child' 
   RF103G_14= 'proxy or not for f103g1 to f103g8' 
   F103G8_14= '7th child is biological or not?' 
   F103G1_14= 'sex of the 7th child' 
   F103G2_14= 'the 7th child alive or not' 
   F103G3_14= 'the 7th child''s age at present if alive, or age the child would be if s/he alive' 
   F103G4_14= 'frequent visits of the 7th child' 
   F103G7_14= 'contact with the 7th child' 
   F103G5_14= 'residence distance of the 7th child' 
   RF103H_14= 'proxy or not for f103h1 to f103h8' 
   F103H8_14= '8th child is biological or not?' 
   F103H1_14= 'sex of the 8th child' 
   F103H2_14= 'the 8th child alive or not' 
   F103H3_14= 'the 8th child''s age at present if alive, or age the child would be if s/he alive' 
   F103H4_14= 'frequent visits of the 8th child' 
   F103H7_14= 'contact with the 8th child' 
   F103H5_14= 'residence distance of the 8th child' 
   RF103I_14= 'proxy or not for f103i1 to f103i8' 
   F103I8_14= '9th child is biological or not?' 
   F103I1_14= 'sex of the 9th child' 
   F103I2_14= 'the 9th child alive or not' 
   F103I3_14= 'the 9th child''s age at present if alive, or age the child would be if s/he alive' 
   F103I4_14= 'frequent visits of the 9th child' 
   F103I7_14= 'contact with the 9th child' 
   F103I5_14= 'residence distance of the 9th child' 
   RF103J_14= 'proxy or not for f103j1 to f103j8' 
   F103J8_14= '10th child is biological or not?' 
   F103J1_14= 'sex of the 10th child' 
   F103J2_14= 'the 10th child alive or not' 
   F103J3_14= 'the 10th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103J4_14= 'frequent visits of the 10th child' 
   F103J7_14= 'contact with the 10th child' 
   F103J5_14= 'residence distance of the 10th child' 
   RF103K_14= 'proxy or not for f103k1 to f103k8' 
   F103K8_14= '11th child is biological or not?' 
   F103K1_14= 'sex of the 11th child' 
   F103K2_14= 'the 11th child alive or not' 
   F103K3_14= 'the 11th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103K4_14= 'frequent visits of the 11th child' 
   F103K7_14= 'contact with the 11th child' 
   F103K5_14= 'residence distance of the 11th child' 
   RF103L_14= 'proxy or not for f103l1 to f103l8' 
   F103L8_14= '12th child is biological or not?' 
   F103L1_14= 'sex of the 12th child' 
   F103L2_14= 'the 12th child alive or not' 
   F103L3_14= 'the 12th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103L4_14= 'frequent visits of the 12th child' 
   F103L7_14= 'contact with the 12th child' 
   F103L5_14= 'residence distance of the 12th child' 
   RF103M_14= 'proxy or not for f103m1 to f103m8' 
   F103M8_14= '13th child is biological or not?' 
   F103M1_14= 'sex of the 13th child' 
   F103M2_14= 'the 13th child alive or not' 
   F103M3_14= 'the 13th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103M4_14= 'frequent visits of the 13th child' 
   F103M7_14= 'contact with the 13th child' 
   F103M5_14= 'residence distance of the 13th child' 
   RF104_14= 'proxy or not for f104' 
   F104_14 = 'age of the oldest son alive at present' 
   RF105_14= 'proxy or not for f105' 
   F105_14 = 'age of the youngest son alive at present' 
   F111A_14= 'the first person to whom you usually talk frequently in daily life' 
   F111B_14= 'the second person to whom you usually talk frequently in daily life' 
   F111C_14= 'the third person to whom you usually talk frequently in daily life' 
   F112A_14= '1st person to whom you talk first when you need to share your thoughts' 
   F112B_14= '2nd person to whom you talk first when you need to share your thoughts' 
   F112C_14= '3rd person to whom you talk first when you need to share your thoughts' 
   F113A_14= '1st person you ask for help when you have problem/difficulties' 
   F113B_14= '2nd person you ask for help when you have problem/difficulties' 
   F113C_14= '3rd person you ask for help when you have problem/difficulties' 
   RF12_14 = 'proxy or not for f12a to f12c' 
   F12A_14 = 'how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_14 = 'how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C_14 = 'how much did you receive from your grandchild(ren) last year?' 
   RF13_14 = 'proxy or not for f13a to f13c' 
   F13A_14 = 'how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_14 = 'how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C_14 = 'how much did you give to your grandchild(ren)in last year?' 
   RF14_14 = 'proxy or not for f14' 
   F141_14 = 'are personal care services available in your community?' 
   F142_14 = 'are home visit services available in your community?' 
   F143_14 = 'are psychological consulting services available in your community?' 
   F144_14 = 'are daily shopping services available in your community?' 
   F145_14 = 'are social and recreation services available in your community?' 
   F146_14 = 'are legal aid services available in your community?' 
   F147_14 = 'are healthcare education services available in your community?' 
   F148_14 = 'are neighborhood-relation services available in your community?' 
   F149_14 = 'are any other social services available in your community?' 
   F14T_14 = 'other service beyond f141-f149' 
   RF15_14 = 'proxy or not for f15' 
   F151_14 = 'do you expect your community to provide personal care services?' 
   F152_14 = 'do you expect your community to provide home visit services?' 
   F153_14 = 'do you expect your community to provide psychological consulting services?' 
   F154_14 = 'do you expect your community to provide daily shopping services?' 
   F155_14 = 'do you expect your community to provide social and recreation activities?' 
   F156_14 = 'do you expect your community provide legal aid services?' 
   F157_14 = 'do you expect your community to provide healthcare education service?' 
   F158_14 = 'do you expect your community to provide neighborhood-relation services?' 
   F159_14 = 'do you expect your community to provide other social services?' 
   F15T_14 = 'other service beyond f151-f159' 
   F16_14  = 'what kind of living arrangement do you like best?' 
   RG01_14 = 'proxy or not for g01' 
   G01_14  = 'how about the quality of your sleep?' 
   RG02_14 = 'proxy or not for g02' 
   G02_14  = 'how long do you sleep normally?' 
   RG1_14  = 'proxy or not for g1' 
   G1_14   = 'visual function: can you see the break in the circle?' 
   G1A_14  = 'if so, where is the break located?' 
   RG21_14 = 'proxy or not for g21' 
   G21_14  = 'number of natural teeth' 
   RG22_14 = 'proxy or not for g22' 
   G22_14  = 'have false teeth?' 
   RG23_14 = 'proxy or not for g23' 
   G23_14  = 'how often do you brush your teeth every day?' 
   RG24_14 = 'proxy or not for g24' 
   G24_14  = 'during the past 6 months, did you have a toothache more than once?' 
   RG24A_14= 'proxy or not for g24a' 
   G24A_14 = 'g24a_14 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG25_14 = 'proxy or not for g25' 
   G25_14  = 'during the past 6 months, did you have pain in jaw joint or so more than once?' 
   RG25A_14= 'proxy or not for g25a' 
   G25A_14 = 'g25a_14 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG3_14  = 'proxy or not for g3' 
   G3_14   = 'able to use chopsticks to eat?' 
   RG4_14  = 'proxy or not for g4' 
   G4_14   = 'which hand do you normally use for eating?' 
   RG4A_14 = 'proxy or not for g4a' 
   G4A_14  = 'which hand do you normally use for writing?' 
   RG4B_14 = 'proxy or not for g4b' 
   G4B_14  = 'which hand do you normally use for brushing your teeth?' 
   RG5_14  = 'proxy or not for g5' 
   G511_14 = 'blood pressure test for the 1st time: systolic' 
   G512_14 = 'blood pressure test for the 1st time: diastolic' 
   G521_14 = 'blood pressure test for the 2nd time: systolic' 
   G522_14 = 'blood pressure test for the 2nd time: diastolic' 
   G6_14   = 'rhythm of heart' 
   G7_14   = 'heart rate (in beats/min)' 
   G81_14  = 'hand behind neck' 
   G82_14  = 'hand behind lower back' 
   G83_14  = 'hold-up arms' 
   G9_14   = 'able to stand up from sitting in a chair?' 
   G101_14 = 'weight (kilograms)' 
   G1011_14= 'calf curcumference (cm)' 
   G102_14 = 'is the participant hunchbacked?' 
   G1021_14= 'directly measured height of the interviewee' 
   G122_14 = 'height measured from top of the right arm bone to top of the right shoulder' 
   G123_14 = 'height measured from the right knee joint to the ground' 
   G102C_14= 'waist circumference' 
   RG106_14= 'proxy or not for g106' 
   G106_14 = 'do you have any difficulty with your hearing?' 
   RG1061_14= 'proxy or not for g1061' 
   G1061_14= 'in which ear(s) do you have a hearing difficulty?' 
   RG1062_14= 'proxy or not for g1062' 
   G1062_14= 'at what age did you first notice a hearing difficulty?' 
   RG1063_14= 'proxy or not for g1063' 
   G1063_14= 'how quickly did your hearing difficulty develop?' 
   G11_14  = 'able to pick up a book from the floor?' 
   G12_14  = 'steps used to turn around 360 with help?' 
   RG130_14= 'proxy or not for g130' 
   G130_14 = 'feel not-well within the past two weeks?' 
   RG13_14 = 'with proxy or not for g131' 
   G131_14 = '# of times suffering from serious illness within the past two years' 
   G132_14 = '# of times in hospitals' 
   RG14A_14= 'with proxy or not for g14a1 and g14a2' 
   G14A1_14= 'name of disease suffered at 1st hospital visit' 
   G14A2_14= '1st time, number of days in hospital or bedridden' 
   G141T_14= 'the name of other diseases beyond g14a1 at the first time' 
   RG14B_14= 'with proxy or not for g14b1 and g14b2' 
   G14B1_14= 'name of disease suffered at 2nd hospital visit' 
   G14B2_14= '2nd time, number of days in hospital or bedridden' 
   G142T_14= 'the name of other diseases beyond g14b1 at the second time' 
   RG14C_14= 'with proxy or not for g14c1 and g14c2' 
   G14C1_14= 'name of disease suffered at the last hospital visit' 
   G14C2_14= 'last time, days in hospital or bedridden' 
   G143T_14= 'the name of other diseases beyond g14c1 at the last time' 
   G15A1_14= 'suffering from hypertension?' 
   G15A2_14= 'g15a2_14 diagnosed by hospital?' 
   G15A3_14= 'g15a3_14 disability in daily life' 
   G15B1_14= 'suffering from diabetes?' 
   G15B2_14= 'g15b2_14 diagnosed by hospital?' 
   G15B3_14= 'g15b3_14 disability in daily life' 
   G15C1_14= 'suffering from heart disease?' 
   G15C2_14= 'g15c2_14 diagnosed by hospital?' 
   G15C3_14= 'g15c3_14 disability in daily life' 
   G15D1_14= 'suffering from stroke or cvd?' 
   G15D2_14= 'g15d2_14 diagnosed by hospital?' 
   G15D3_14= 'g15d3_14 disability in daily life' 
   G15E1_14= 'suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_14= 'g15e2_14 diagnosed by hospital?' 
   G15E3_14= 'g15e3_14 disability in daily life' 
   G15F1_14= 'suffering from tuberculosis?' 
   G15F2_14= 'g15f2_14 diagnosed by hospital?' 
   G15F3_14= 'g15f3_14 disability in daily life' 
   G15G1_14= 'suffering from cataract?' 
   G15G2_14= 'g15g2_14 diagnosed by hospital?' 
   G15G3_14= 'g15g3_14 disability in daily life' 
   G15H1_14= 'suffering from glaucoma?' 
   G15H2_14= 'g15h2_14 diagnosed by hospital?' 
   G15H3_14= 'g15h3_14 disability in daily life' 
   G15I1_14= 'suffering from cancer?' 
   G15I2_14= 'g15i2_14 diagnosed by hospital?' 
   G15I3_14= 'g15i3_14 disability in daily life' 
   G15J1_14= 'suffering from prostate tumor?' 
   G15J2_14= 'g15j2_14 diagnosed by hospital?' 
   G15J3_14= 'g15j3_14 disability in daily life' 
   G15K1_14= 'suffering from gastric or duodenal ulcer?' 
   G15K2_14= 'g15k2_14 diagnosed by hospital?' 
   G15K3_14= 'g15k3_14 disability in daily life' 
   G15L1_14= 'suffering from parkinson''s disease?' 
   G15L2_14= 'g15l2_14 diagnosed by hospital?' 
   G15L3_14= 'g15l3_14 disability in daily life' 
   G15M1_14= 'suffering from bedsore?' 
   G15M2_14= 'g15m2_14 diagnosed by hospital?' 
   G15M3_14= 'g15m3_14 disability in daily life' 
   G15N1_14= 'suffering from arthritis?' 
   G15N2_14= 'g15n2_14 diagnosed by hospital?' 
   G15N3_14= 'g15n3_14 disability in daily life' 
   G15O1_14= 'suffering from dementia?' 
   G15O2_14= 'g15o2_14 diagnosed by hospital?' 
   G15O3_14= 'g15o3_14 disability in daily life' 
   G15P1_14= 'suffering from epilepsy?' 
   G15P2_14= 'g15p2_14 diagnosed by hospital?' 
   G15P3_14= 'g15p3_14 disability in daily life' 
   G15Q1_14= 'suffering from cholecystitis, cholelith disease?' 
   G15Q2_14= 'g15q2_14 diagnosed by hospital?' 
   G15Q3_14= 'g15q3_14 disability in daily life' 
   G15R1_14= 'suffering from blood disease?' 
   G15R2_14= 'g15r2_14 diagnosed by hospital?' 
   G15R3_14= 'g15r3_14 disability in daily life' 
   G15N1A_14= 'suffering from rheumatism or rheumatoid disease?' 
   G15N2A_14= 'g15n2a_14 diagnosed by hospital?' 
   G15N3A_14= 'g15n3a_14 disability in daily life' 
   G15S1_14= 'suffering from chronic nephritis?' 
   G15S2_14= 'g15s2_14 diagnosed by hospital?' 
   G15S3_14= 'g15s3_14 disability in daily life' 
   G15T1_14= 'suffering from galactophore disease?' 
   G15T2_14= 'g15t2_14 diagnosed by hospital?' 
   G15T3_14= 'g15t3_14 disability in daily life' 
   G15U1_14= 'suffering from uterine tumor?' 
   G15U2_14= 'g15u2_14 diagnosed by hospital?' 
   G15U3_14= 'g15u3_14 disability in daily life' 
   G15J1A_14= 'suffering from hyperplasia of prostate gland?' 
   G15J2A_14= 'g15j2a_14 diagnosed by hospital?' 
   G15J3A_14= 'g15j3a_14 disability in daily life' 
   G15V1_14= 'suffering from hepatitis?' 
   G15V2_14= 'g15v2_14 diagnosed by hospital?' 
   G15V3_14= 'g15v3_14 disability in daily life' 
   G15Y1_14= 'other diseases beyond g15a-g15v?' 
   G15Y2_14= 'g15y2_14 diagnosed by hospital?' 
   G15Y3_14= 'g15y3_14 disability in daily life' 
   G15YT_14= 'other disease specified in g15y' 
   H1_14   = 'was interviewee able to hear?' 
   H21_14  = 'did interviewee able to participate in physical check?' 
   H22_14  = 'the reason for inability to participate in physical check' 
   H3_14   = 'the health of interviewee rated by interviewer' 
   H5_14   = 'confirm the age and copy to the 1st page' 
   H6_14   = 'has interviewer checked for failure to ask a question?' 
   H7_14   = 'did anyone help the interviewee to answer question' 
   H71_14  = 'who helped the interviewee to answer questions?' 
   D14VYEAR= 'd14vyear validated year of death of the sampled person|d14vyear' 
   D14VMONTH= 'validated month of death of the sampled person' 
   D14VDAY = 'd14vday validated year of death of the sampled person|d14vyear' 
   D14AGE  = 'validated age at death' 
   D14MARRY= 'marital status of the deceased elder prior to death' 
   D14MARRY1= 'did the elder have a cohabiting partner but not officially married?' 
   D14YR1  = 'if yes, since which year began to live together' 
   D14MON1 = 'if yes, since which month began to live together' 
   D14D22  = 'did the elder have public old-age insurance prior to death?' 
   D14D231 = 'how much money paid by the family?' 
   D14D232 = 'how much money paid as subsidy by the affiliation or community?' 
   D14D233 = 'how much money paid as subsidy by the government?' 
   D14D234 = 'as an employee in the public sector, no need to pay' 
   D14D24  = 'monthly income from public old-age insurance prior to death' 
   D14D25  = 'reason that not attending public old-age insurance prior to death' 
   D14D26A1= 'relationship of 1st person living with deceased elder in last year of life' 
   D14D26A2= 'sex of the 1st person living with the deceased elder' 
   D14D26A3= 'age of the 1st person living with the deceased elder' 
   D14D26A4= 'education level of the 1st person living with the deceased elder' 
   D14D26A5= 'occupation of the 1st person living with the deceased elder' 
   D14D26A6= '# of cigarettes the 1st person usually smoke per day inside home' 
   D14D26A61= 'details of cigarettes the 1st person usually smoke per day inside home' 
   D14D26B1= 'relationship of  2nd person living with deceased elder in last year of life' 
   D14D26B2= 'sex of the  2nd person living with the deceased elder' 
   D14D26B3= 'age of the 2nd person living with the deceased elder' 
   D14D26B4= 'education level of the 2nd person living with the deceased elder' 
   D14D26B5= 'occupation of the 2nd person living with the deceased elder' 
   D14D26B6= '# of cigarettes the 2nd person usually smoke per day inside home' 
   D14D26B61= 'details of cigarettes the 2nd person usually smoke per day inside home' 
   D14D26C1= 'relationship of  3rd person living with deceased elder in last year of life' 
   D14D26C2= 'sex of the 3rd person living with the deceased elder' 
   D14D26C3= 'age of the 3rd person living with the deceased elder' 
   D14D26C4= 'education level of the 3rd person living with the deceased elder' 
   D14D26C5= 'occupation of the 3rd person living with the deceased elder' 
   D14D26C6= '# of cigarettes the 3rd person usually smoke per day inside home' 
   D14D26C61= 'details of cigarettes the 3rd person usually smoke per day inside home' 
   D14D26D1= 'relationship of  4th person living with deceased elder in last year of life' 
   D14D26D2= 'sex of the 4th person living with the deceased elder' 
   D14D26D3= 'age of the 4th person living with the deceased elder' 
   D14D26D4= 'education level of the 4th person living with the deceased elder' 
   D14D26D5= 'occupation of the 4th person living with the deceased elder' 
   D14D26D6= '# of cigarettes the 4th person usually smoke per day inside home' 
   D14D26D61= 'details of cigarettes the 4th person usually smoke per day inside home' 
   D14D26E1= 'relationship of  5th person living with deceased elder in last year of life' 
   D14D26E2= 'sex of the 5th person living with the deceased elder' 
   D14D26E3= 'age of the 5th person living with the deceased elder' 
   D14D26E4= 'education level of the 5th person living with the deceased elder' 
   D14D26E5= 'occupation of the 5th person living with the deceased elder' 
   D14D26E6= '# of cigarettes the 5th person usually smoke per day inside home' 
   D14D26E61= 'details of cigarettes the 5th person usually smoke per day inside home' 
   D14D26F1= 'relationship of  6th person living with deceased elder in last year of life' 
   D14D26F2= 'sex of the 6th person living with the deceased elder' 
   D14D26F3= 'age of the 6th person living with the deceased elder' 
   D14D26F4= 'education level of the 6th person living with the deceased elder' 
   D14D26F5= 'occupation of the 6th person living with the deceased elder' 
   D14D26F6= '# of cigarettes the 6th person usually smoke per day inside home' 
   D14D26F61= 'details of cigarettes the 6th person usually smoke per day inside home' 
   D14D26G1= 'relationship of  7th person living with deceased elder in last year of life' 
   D14D26G11= 'other relationship beyond d1126g1' 
   D14D26G2= 'sex of the 7th person living with the deceased elder' 
   D14D26G3= 'age of the 7th person living with the deceased elder' 
   D14D26G4= 'education level of the 7th person living with the deceased elder' 
   D14D26G5= 'occupation of the 7th person living with the deceased elder' 
   D14D26G6= '# of cigarettes the 7th person usually smoke per day inside home' 
   D14D26G61= 'details of cigarettes the 7th person usually smoke per day inside home' 
   D14D26H1= 'relationship of  8th person living with deceased elder in last year of life' 
   D14D26H11= 'other relationship beyond d1126h1' 
   D14D26H2= 'sex of the 8th person living with the deceased elder' 
   D14D26H3= 'age of the 8th person living with the deceased elder' 
   D14D26H4= 'education level of the 8th person living with the deceased elder' 
   D14D26H5= 'occupation of the 8th person living with the deceased elder' 
   D14D26H6= '# of cigarettes the 8th person usually smoke per day inside home' 
   D14D26H61= 'details of cigarettes the 8th person usually smoke per day inside home' 
   D14D26I1= 'relationship of  9th person living with deceased elder in last year of life' 
   D14D26I11= 'other relationship beyond d1126i1' 
   D14D26I2= 'sex of the 9th person living with the deceased elder' 
   D14D26I3= 'age of the 9th person living with the deceased elder' 
   D14D26I4= 'education level of the 9th person living with the deceased elder' 
   D14D26I5= 'occupation of the 9th person living with the deceased elder' 
   D14D26I6= '# of cigarettes the 9th person usually smoke per day inside home' 
   D14D26I61= 'details of cigarettes the 9th person usually smoke per day inside home' 
   D14D26J1= 'relationship of  10th person living with deceased elder in last year of life' 
   D14D26J11= 'other relationship beyond d1126j1' 
   D14D26J2= 'sex of the 10th person living with the deceased elder' 
   D14D26J3= 'age of the 10th person living with the deceased elder' 
   D14D26J4= 'education level of the 10th person living with the deceased elder' 
   D14D26J5= 'occupation of the 10th person living with the deceased elder' 
   D14D26J51= 'other occupation beyond d14a53j7' 
   D14D26J6= '# of cigarettes the 10th person usually smoke per day inside home' 
   D14D26J61= 'details of cigarettes the 10th person usually smoke per day inside home' 
   D14LIVARR= 'primary living arrangement of the deceased elder in the last year of life' 
   D14PERSON= 'number of people who living with the respondent prior to death' 
   D14GENER= 'number of generations living in the household when the elderly died' 
   D14DPLACE= 'place of death' 
   D14CARGIV= 'primary caregiver prior to death' 
   D14PCGDAY= '# of days cared for the deceased by primary caregiver in last month of life' 
   D14BEDRID= 'bedridden or not prior to death' 
   D14BEDDAY= 'days of being bedridden prior to death' 
   D14ILL  = 'number of times suffering from serious illness since previous survey' 
   D14DISEA1= 'name of disease suffering from at the first time' 
   D14DIDAY1= 'days suffering from such disease at the first time' 
   D14DISEA2= 'name of disease suffering from at the second time' 
   D14DIDAY2= 'days suffering from such disease at the second time' 
   D14DISEA3= 'name of disease suffering from at the last time' 
   D14DIDAY3= 'days suffering from such disease at the last time' 
   D14HYPERT= 'suffering from hypertension prior to death?' 
   D14DIABET= 'suffering from diabetes prior to death?' 
   D14HEART= 'suffering from heart disease prior to death' 
   D14CVD  = 'suffering from stroke or cvd prior to death?' 
   D14PNEUM= 'suffering from bronchitis, emphysema, pneumonia prior to death?' 
   D14TUBERC= 'suffering from tuberculosis prior to death?' 
   D14CANCER= 'suffering from cancer prior to death?' 
   D14GLAUCO= 'suffering from glaucoma or cataract prior to death?' 
   D14PROSTA= 'suffering from prostate tumor prior to death?' 
   D14GYNECO= 'suffering from gynecological disease prior to death?' 
   D14GASTRI= 'suffering from gastric or duodenal ulcer prior to death?' 
   D14PARKIN= 'suffering from parkinson''s disease prior to death?' 
   D14BEDSOR= 'suffering from bedsore prior to death?' 
   D14DEMENT= 'suffering from dementia prior to death?' 
   D14PSYCHO= 'suffering from psychosis prior to death?' 
   D14NEUROS= 'suffering from neurosis disease?' 
   D14ARTHRI= 'suffering from arthritis prior to death?' 
   D14OTHERS= 'suffering from other chronic disease prior to death?' 
   D14INCOME= 'yearly total income of the family of the deceased elder' 
   D14WCFACI= 'family had toilet facility prior to death' 
   D14TAPWAT= 'family had tap water facility prior to death' 
   D14BATHFA= 'family had bath facility prior to death' 
   D14HEATER= 'family had heater prior to death' 
   D14TVSET= 'family had tv prior to death' 
   D14WASHMA= 'family had washing machine prior to death' 
   D14PHONE= 'family had telephone prior to death' 
   D14DOCTOR= 'if the deceased elder lived in rural, was there a doctor in the village?' 
   D14LICDOC= 'did the village doctor have a license?' 
   D14WHOPAY= 'who mainly paid the medical cost for the deceased elder?' 
   D14MEDCOS= 'total medical cost (in yuan, rmb) in the last year of the life' 
   D14POCKET= 'total amount of out-of-pocket' 
   D14BATHFU= 'functioning of bathing prior to death' 
   D14BATDAY= 'days lasted if bathing functioning disabled or partially disabled' 
   D14DRESFU= 'functioning of dressing prior to death' 
   D14DREDAY= 'days lasted if dressing functioning disabled or partially disabled' 
   D14TOILFU= 'functioning of toileting prior to death' 
   D14TOIDAY= 'days lasted if toileting functioning disabled or partially disabled' 
   D14MOVEFU= 'functioning of indoor transferring prior to death' 
   D14MOVDAY= 'days lasted if indoor transferring functioning disabled or partially disabled' 
   D14CONTFU= 'functioning of continence prior to death' 
   D14CONDAY= 'days lasted in incontinence' 
   D14FEEDFU= 'functioning of self-feeding prior to death' 
   D14FEEDAY= 'days lasted if can''t feed self' 
   D14FULLDA= 'days in fully dependent functioning prior to death' 
   D14CARCST= 'total cost for full care in daily life' 
   D14DIRCST= 'total direct cost for caregiving in the last month of life' 
   D14CARPAY= 'who mainly paid the care serivces prior to death?' 
   D14OUTDOR= 'days that the elder could not get outdoor to chat with others prior to death' 
   D14ACTDAY= 'days that the elder stayed in bed longer than be out of bed in the daytime' 
   D14SMOKE= 'smoked or not since the last interview' 
   D14SMKTIM= 'number of times smoked a day on average' 
   D14D21B = 'how soon after waking up did the elder smoke first cigarette prior to death?' 
   D14DRINK= 'did the deceased elder drink since the last interview?' 
   D14KNDDRK= 'what kind of alcohol did the elder drink?' 
   D14DRKMCH= 'how much (liang) did the elder drink every day since last interview?' 
   D14ADVDIR= 'whether did the deceased elderly tell the family about his/her death or not?' 
   D14DIRDAY= 'if yes, how many days did she/he tell the family before her/his death' 
   D14DREAM= 'whether did the deceased elder have dreams about the death prior to death?' 
   D14PAIN = 'whether was the deceased elderly painful prior to death?' 
   D14UNCONS= 'was the deceased elderly unconscious prior to death?' 
   D14UNCDAY= 'if yes, how many days lasted prior to death' 
   D14A533 = 'what type of dwelling was the elder''s home prior to death?' 
   D14A534 = 'what is the approximate year the elder''s home was built?' 
   D14A535 = 'was the house damaged from broken pipes or heavy rain during the last year befor' 
   D14A536 = 'did the house frequently have a mildew odor or musty smell prior to death?' 
   D14A537 = 'which fuels were normally used for cooking prior to death?' 
   D14G23  = 'how often did the deceased elder brush teeth every day prior to death?' 
   D14G24  = 'during the last 6 months before death, did the elder have toothache more than on' 
   D14G24A = 'd14g24a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   D14G25  = 'during the last 6 months before death, did the elder have pain in jaw joint or s' 
   D14G25A = 'd14g25a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   D14G4   = 'which hand did the deceased elder normally use for eating?' 
   D14G4A  = 'which hand did the deceased elder normally use for writing?' 
   D14G4B  = 'which hand did the deceased elder normally use for brushing teeth?' 
   D14G102 = 'height of the deceased elder' 
   D14G106 = 'during the last 6 months before death, did the elder have difficulty with hearin' 
   D14G1061= 'in which ear(s) did the elder have a hearing difficulty?' 
   D14G1062= 'at what age did the elder first notice hearing difficulty?' 
   D14G1063= 'how quickly did the elder''s hearing difficulty develop?' 
   D14D45  = 'did the elder fall to ground in the last year prior to death?' 
   D14D46  = 'how many times did the elder fall to ground in the last year?' 
   D14D47  = 'was it serious enough that needed therapy in hospital?' 
        ; 


* SAS FORMAT STATEMENT;

/*
   FORMAT
         A1 a1ffffff. A2 a2ffffff. A41 a41fffff.
         A41_14 a41_14ff. A42 a42fffff. A42_14 a42fffff.
         A43 a43fffff. A43_14 a43fffff. A51 a51fffff.
         A51_11 a51_11ff. A51_14 a51fffff. A52 a52fffff.
         A52_11 a52_11ff. A52_14 a52fffff. A530 a530ffff.
         A530_11 a530_11f. A530_14 a530ffff. A531 a531ffff.
         A531_11 a531_11f. A531_14 a531ffff. A532 a532ffff.
         A532_11 a532_11f. A532_14 a532ffff. A533_11 a533_11f.
         A533_14 a533_14f. A534_11 a534_11f. A534_14 a534_14f.
         A535_11 a535_11f. A535_14 a535_14f. A536_11 a535_11f.
         A536_14 a535_14f. A537_11 a537_11f. A537_14 a537_14f.
         A53A1 a53a1fff. A53A1_11 a53a1_1f. A53A1_14 a53a1fff.
         A53A2 a53a2fff. A53A2_11 a53a2_1f. A53A2_14 a53a2fff.
         A53A3 a53a3fff. A53A3_11 a53a3_1f. A53A3_14 a53a3fff.
         A53A4 a53a4fff. A53A4_11 a53a4_1f. A53A4_14 a53a4fff.
         A53A5_11 a53a5_1f. A53A5_14 d75fffff. A53B1 a53a1fff.
         A53B1_11 a53a1_1f. A53B1_14 a53a1fff. A53B2 a53a2fff.
         A53B2_11 a53a2_1f. A53B2_14 a53a2fff. A53B3 a53b3fff.
         A53B3_11 a53b3_1f. A53B3_14 a53b3fff. A53B4 a53a4fff.
         A53B4_11 a53a4_1f. A53B4_14 a53a4fff. A53B5_11 a53a5_1f.
         A53B5_14 d75fffff. A53C1 a53a1fff. A53C1_11 a53a1_1f.
         A53C1_14 a53a1fff. A53C2 a53a2fff. A53C2_11 a53a2_1f.
         A53C2_14 a53a2fff. A53C3 a53b3fff. A53C3_11 a53b3_1f.
         A53C3_14 a53b3fff. A53C4 a53a4fff. A53C4_11 a53a4_1f.
         A53C4_14 a53a4fff. A53C5_11 a53a5_1f. A53C5_14 d75fffff.
         A53D1 a53a1fff. A53D1_11 a53a1_1f. A53D1_14 a53a1fff.
         A53D2 a53a2fff. A53D2_11 a53a2_1f. A53D2_14 a53a2fff.
         A53D3 a53b3fff. A53D3_11 a53b3_1f. A53D3_14 a53b3fff.
         A53D4 a53a4fff. A53D4_11 a53a4_1f. A53D4_14 a53a4fff.
         A53D5_11 a53a5_1f. A53D5_14 d75fffff. A53E1 a53a1fff.
         A53E1_11 a53a1_1f. A53E1_14 a53a1fff. A53E2 a53a2fff.
         A53E2_11 a53a2_1f. A53E2_14 a53a2fff. A53E3 a53b3fff.
         A53E3_11 a53b3_1f. A53E3_14 a53b3fff. A53E4 a53a4fff.
         A53E4_11 a53a4_1f. A53E4_14 a53a4fff. A53E5_11 a53a5_1f.
         A53E5_14 d75fffff. A53F1 a53a1fff. A53F1_11 a53a1_1f.
         A53F1_14 a53a1fff. A53F2 a53a2fff. A53F2_11 a53a2_1f.
         A53F2_14 a53a2fff. A53F3 a53b3fff. A53F3_11 a53b3_1f.
         A53F3_14 a53b3fff. A53F4 a53a4fff. A53F4_11 a53a4_1f.
         A53F4_14 a53a4fff. A53F5_11 a53a5_1f. A53F5_14 d75fffff.
         A53G1 a53a1fff. A53G1_11 a53a1_1f. A53G1_14 a53a1fff.
         A53G2 a53a2fff. A53G2_11 a53a2_1f. A53G2_14 a53a2fff.
         A53G3 a53b3fff. A53G3_11 a53b3_1f. A53G3_14 a53b3fff.
         A53G4 a53a4fff. A53G4_11 a53a4_1f. A53G4_14 a53a4fff.
         A53G5_11 a53a5_1f. A53G5_14 d75fffff. A53H1 a53a1fff.
         A53H1_11 a53a1_1f. A53H1_14 a53a1fff. A53H2 a53a2fff.
         A53H2_11 a53a2_1f. A53H2_14 a53a2fff. A53H3 a53b3fff.
         A53H3_11 a53b3_1f. A53H3_14 a53b3fff. A53H4 a53a4fff.
         A53H4_11 a53a4_1f. A53H4_14 a53a4fff. A53H5_11 a53a5_1f.
         A53H5_14 d75fffff. A53I1 a53a1fff. A53I1_11 a53a1_1f.
         A53I1_14 a53a1fff. A53I2 a53a2fff. A53I2_11 a53a2_1f.
         A53I2_14 a53a2fff. A53I3 a53b3fff. A53I3_11 a53b3_1f.
         A53I3_14 a53b3fff. A53I4 a53a4fff. A53I4_11 a53a4_1f.
         A53I4_14 a53a4fff. A53I5_11 a53a5_1f. A53I5_14 d75fffff.
         A53J1 a53a1fff. A53J1_11 a53a1_1f. A53J1_14 a53a1fff.
         A53J2 a53a2fff. A53J2_11 a53a2_1f. A53J2_14 a53a2fff.
         A53J3 a53b3fff. A53J3_11 a53b3_1f. A53J3_14 a53b3fff.
         A53J4 a53a4fff. A53J4_11 a53a4_1f. A53J4_14 a53a4fff.
         A53J5_11 a53a5_1f. A53J5_14 d75fffff. A53K1 a53a1fff.
         A53K2 a53a2fff. A53K3 a53b3fff. A53K4 a53a4fff.
         A53L1 a53a1fff. A53L2 a53a2fff. A53L3 a53b3fff.
         A53L4 a53a4fff. A540_11 a540_11f. A540_14 a540_14f.
         A541 a541ffff. A541_11 a541_11f. A541_14 a541ffff.
         A542 a542ffff. A542_11 a542_11f. A542_14 a542ffff.
         A54A a54affff. A54A_11 a54a_11f. A54A_14 a54affff.
         A54B a54bffff. A54B_11 a54b_11f. A54B_14 a54bffff.
         B11 b11fffff. B11_11 b11_11ff. B11_14 b11fffff.
         B12 b11fffff. B121 b121ffff. B121_11 b121_11f.
         B121_14 b121ffff. B12_11 b11_11ff. B12_14 b11fffff.
         B21 b21fffff. B210_11 b210_11f. B210_14 b210_14f.
         B21_11 b21_11ff. B21_14 b21fffff. B22 b21fffff.
         B22_11 b21_11ff. B22_14 b21fffff. B23 b21fffff.
         B23_11 b21_11ff. B23_14 b21fffff. B24 b21fffff.
         B24_11 b21_11ff. B24_14 b21fffff. B25 b21fffff.
         B25_11 b21_11ff. B25_14 b21fffff. B26 b21fffff.
         B26_11 b21_11ff. B26_14 b21fffff. B27 b21fffff.
         B27_11 b21_11ff. B27_14 b21fffff. B28_11 b28_11ff.
         B28_14 f151ffff. B29_11 b28_11ff. B29_14 f151ffff.
         C11 c11fffff. C11_11 c11_11ff. C11_14 c11fffff.
         C12 c11fffff. C12_11 c11_11ff. C12_14 c11fffff.
         C13 c11fffff. C13_11 c11_11ff. C13_14 c11fffff.
         C14 c11fffff. C14_11 c11_11ff. C14_14 c11fffff.
         C15 c11fffff. C15_11 c11_11ff. C15_14 c11fffff.
         C16 c16fffff. C16_11 c16_11ff. C16_14 c16fffff.
         C21A c11fffff. C21A_11 c11_11ff. C21A_14 c11fffff.
         C21B c11fffff. C21B_11 c11_11ff. C21B_14 c11fffff.
         C21C c11fffff. C21C_11 c11_11ff. C21C_14 c11fffff.
         C22 c22fffff. C22_11 c22_11ff. C22_14 c22fffff.
         C31A c11fffff. C31A_11 c11_11ff. C31A_14 c11fffff.
         C31B c11fffff. C31B_11 c11_11ff. C31B_14 c11fffff.
         C31C c11fffff. C31C_11 c11_11ff. C31C_14 c11fffff.
         C31D c31dffff. C31D_11 c31d_11f. C31D_14 c31dffff.
         C31E c11fffff. C31E_11 c11_11ff. C31E_14 c11fffff.
         C32 c32fffff. C32_11 c32_11ff. C32_14 c32fffff.
         C41A c11fffff. C41A_11 c11_11ff. C41A_14 c11fffff.
         C41B c11fffff. C41B_11 c11_11ff. C41B_14 c11fffff.
         C41C c11fffff. C41C_11 c11_11ff. C41C_14 c11fffff.
         C51A c11fffff. C51A_11 c11_11ff. C51A_14 c11fffff.
         C51B c11fffff. C51B_11 c11_11ff. C51B_14 c11fffff.
         C52 c11fffff. C52X1 c11fffff. C52X1_11 c11_11ff.
         C52X2 c11fffff. C52X2_11 c11_11ff. C52_11 c11_11ff.
         C52_14 c11fffff. C53A c53affff. C53A_11 c53a_11f.
         C53A_14 c53affff. C53B c53affff. C53B_11 c53a_11f.
         C53B_14 c53affff. C53C c53affff. C53C_11 c53a_11f.
         C53C_14 c53affff. C54 c54fffff. C54_11 c54_11ff.
         C54_14 c54fffff. C55 c55fffff. C55_11 c55_11ff.
         C55_14 c55fffff. D1 d1ffffff. D101 d91fffff.
         D101_11 d91_11ff. D101_14 d91fffff. D102 a53a2fff.
         D102_11 a53a2_1f. D102_14 a53a2fff. D103 a53a2fff.
         D103_11 a53a2_1f. D103_14 a53a2fff. D11A d11affff.
         D11A533 d11a533f. D11A534 d11yr1ff. D11A535 d11a535f.
         D11A536 d11a535f. D11A537 d11a537f. D11A53A1 d11a53af.
         D11A53A3 d11a53a_1f. D11A53A4 d11a53a_2f. D11A53A5 d11a53a_3f.
         D11A53A6 d11mon1f. D11A53B1 d11a53af. D11A53B3 d11a53a_1f.
         D11A53B4 d11a53a_2f. D11A53B5 d11a53a_3f. D11A53B6 d11mon1f.
         D11A53C1 d11a53af. D11A53C3 d11a53a_1f. D11A53C4 d11a53a_2f.
         D11A53C5 d11a53a_3f. D11A53C6 d11mon1f. D11A53D1 d11a53af.
         D11A53D3 d11a53a_1f. D11A53D4 d11a53a_2f. D11A53D5 d11a53a_3f.
         D11A53D6 d11mon1f. D11A53E1 d11a53af. D11A53E3 d11a53a_1f.
         D11A53E4 d11a53a_2f. D11A53E5 d11a53ef. D11A53E6 d11mon1f.
         D11A53F1 d11a53af. D11A53F3 d11a53a_1f. D11A53F4 d11a53a_2f.
         D11A53F5 d11a53a_3f. D11A53F6 d11mon1f. D11A53G1 d11a53af.
         D11A53G3 d11a53a_1f. D11A53G4 d11a53a_2f. D11A53G5 d11a53a_3f.
         D11A53G6 d11mon1f. D11A53H1 d11a53af. D11A53H3 d11a53a_1f.
         D11A53H4 d11a53a_2f. D11A53H5 d11a53a_3f. D11A53H6 d11mon1f.
         D11A53I1 d11a53af. D11A53I3 d11a53a_1f. D11A53I4 d11a53a_2f.
         D11A53I5 d11a53a_3f. D11A53I6 d11mon1f. D11A53J1 d11a53af.
         D11A53J3 d11a53a_1f. D11A53J4 d11a53a_2f. D11A53J5 d11a53a_3f.
         D11A53J6 d11mon1f. D11ACTDAY d11beddf. D11ADVDIR d11doctf.
         D11AGE d11vyeaf. D11ARTHRI d11hypef. D11A_11 d11a_11f.
         D11A_14 d11affff. D11B d11affff. D11BATDAY d11beddf.
         D11BATDAY1 d11beddf. D11BATDAY2 d11batdf. D11BATHFA d11wcfaf.
         D11BATHFU d11bathf. D11BEDDAY d11beddf. D11BEDRID d11bedrf.
         D11BEDSOR d11hypef. D11B_11 d11a_11f. D11B_14 d11affff.
         D11C d11affff. D11CANCER d11hypef. D11CARCST d11medcf.
         D11CARGIV d11cargf. D11CARPAY d11carpf. D11CONDAY d11beddf.
         D11CONDAY1 d11batdf. D11CONDAY2 d11batdf. D11CONTFU d11contf.
         D11CVD d11hypef. D11C_11 d11a_11f. D11C_14 d11affff.
         D11D d11affff. D11D21B d11d21bf. D11DEMENT d11hypef.
         D11DIABET d11hypef. D11DIDAY1 d11didaf. D11DIDAY2 d11didaf.
         D11DIDAY3 d11didaf. D11DIRCST d11medcf. D11DIRDAY d11yr1ff.
         D11DISEA1 d11disef. D11DISEA2 d11disef. D11DISEA3 d11disef.
         D11DOCTOR d11doctf. D11DPLACE d11dplaf. D11DREAM d11dreaf.
         D11DREDAY d11beddf. D11DREDAY1 d11batdf. D11DREDAY2 d11batdf.
         D11DRESFU d11bathf. D11DRINK d11doctf. D11DRKMCH d11mon1f.
         D11D_11 d11a_11f. D11D_14 d11affff. D11E d11affff.
         D11E_11 d11a_11f. D11E_14 d11affff. D11F d11affff.
         D11FEEDAY d11beddf. D11FEEDAY1 d11batdf. D11FEEDAY2 d11batdf.
         D11FEEDFU d11bathf. D11FINANC d11finaf. D11FULLDA d11beddf.
         D11F_11 d11a_11f. D11F_14 d11affff. D11G d11affff.
         D11G102 d11g102f. D11G106 d11a535f. D11G1061 d11g106f.
         D11G1062 d11g106_1f. D11G1063 d11g106_2f. D11G23 d11g23ff.
         D11G24 d11a535f. D11G24A d11illff. D11G25 d11a535f.
         D11G25A d11illff. D11G4 d11g4fff. D11G4A d11g4aff.
         D11G4B d11g4bff. D11GASTRI d11hypef. D11GENER d11genef.
         D11GLAUCO d11hypef. D11GYNECO d11hypef. D11G_11 d11a_11f.
         D11G_14 d11affff. D11H d11affff. D11HEART d11hypef.
         D11HEATER d11wcfaf. D11HYPERT d11hypef. D11H_11 d11a_11f.
         D11H_14 d11affff. D11ILL d11illff. D11INCOME d11incof.
         D11INSPEN d11inspf. D11INSUR d11insuf. D11KNDDRK d11knddf.
         D11LICDOC d11licdf. D11LIVARR d11livaf. D11MARRY d11marrf.
         D11MARRY1 d11marr_1f. D11MEDCOS d11medcf. D11MEDICA d11medif.
         D11MON1 d11mon1f. D11MOVDAY d11beddf. D11MOVDAY1 d11batdf.
         D11MOVDAY2 d11batdf. D11MOVEFU d11bathf. D11NEUROS d11hypef.
         D11NOINSU d11noinf. D11OTHERS d11hypef. D11OUTDOR d11beddf.
         D11PAIN d11painf. D11PARKIN d11hypef. D11PAYGOV d11payif.
         D11PAYIND d11payif. D11PCGDAY d11vyeaf. D11PERSON d11vdayf.
         D11PHONE d11wcfaf. D11PNEUM d11hypef. D11POCKET d11medcf.
         D11PROSTA d11hypef. D11PSYCHO d11hypef. D11RESID d11resif.
         D11RETIRE d11retif. D11RETPEN d11retpf. D11RETYR d11yr1ff.
         D11SMKTIM d11mon1f. D11SMOKE d11doctf. D11TAPWAT d11wcfaf.
         D11TOIDAY d11beddf. D11TOIDAY1 d11batdf. D11TOIDAY2 d11batdf.
         D11TOILFU d11bathf. D11TUBERC d11hypef. D11TVSET d11wcfaf.
         D11UNCDAY d11yr1ff. D11UNCONS d11doctf. D11VDAY d11vdayf.
         D11VMONTH d11vyeaf. D11VYEAR d11vyeaf. D11WASHMA d11wcfaf.
         D11WCFACI d11wcfaf. D11WHOPAY d11whopf. D11YR1 d11yr1ff.
         D12 a54bffff. D12_11 a54b_11f. D12_14 a54bffff.
         D14A533 d14a533f. D14A535 d14a535f. D14A536 d14a535f.
         D14A537 d14a537f. D14ADVDIR d14doctf. D14AGE d14vyeaf.
         D14ARTHRI d14hypef. D14BATHFA d14wcfaf. D14BATHFU d14bathf.
         D14BEDRID d14bedrf. D14BEDSOR d14hypef. D14CANCER d14hypef.
         D14CARGIV d14cargf. D14CARPAY d14carpf. D14CONTFU d14contf.
         D14CVD d14hypef. D14D21B d14d21bf. D14D22 d14marr_1f.
         D14D26A1 d14d26af. D14D26A2 d14d26a_1f. D14D26A6 d14d26a_2f.
         D14D26B1 d14d26af. D14D26B2 d14d26a_1f. D14D26B6 d14d26a_2f.
         D14D26C1 d14d26af. D14D26C2 d14d26a_1f. D14D26C6 d14d26a_2f.
         D14D26D1 d14d26af. D14D26D2 d14d26a_1f. D14D26D6 d14d26a_2f.
         D14D26E1 d14d26af. D14D26E2 d14d26a_1f. D14D26E6 d14d26a_2f.
         D14D26F1 d14d26af. D14D26F2 d14d26a_1f. D14D26F6 d14d26a_2f.
         D14D26G1 d14d26af. D14D26G2 d14d26a_1f. D14D26G6 d14d26a_2f.
         D14D26H1 d14d26af. D14D26H2 d14d26a_1f. D14D26H6 d14d26a_2f.
         D14D26I1 d14d26af. D14D26I2 d14d26a_1f. D14D26I6 d14d26a_2f.
         D14D26J1 d14d26af. D14D26J2 d14d26a_1f. D14D26J6 d14d26a_2f.
         D14D45 d14g106f. D14DEMENT d14hypef. D14DIABET d14hypef.
         D14DIRDAY d14dirdf. D14DOCTOR d14doctf. D14DPLACE d14dplaf.
         D14DREAM d14dreaf. D14DRESFU d14dresf. D14DRINK d14doctf.
         D14FEEDFU d14dresf. D14G102 d14g102f. D14G106 d14g106f.
         D14G1061 d14g106_1f. D14G1062 d14g106_2f. D14G1063 d14g106_3f.
         D14G24 d14a535f. D14G24A d14illff. D14G25 d14a535f.
         D14G25A d14illff. D14G4 d14g4fff. D14G4A d14g4aff.
         D14G4B d14g4bff. D14GASTRI d14hypef. D14GENER d14genef.
         D14GLAUCO d14hypef. D14GYNECO d14hypef. D14HEART d14hypef.
         D14HEATER d14wcfaf. D14HYPERT d14hypef. D14ILL d14illff.
         D14KNDDRK d14knddf. D14LICDOC d14licdf. D14LIVARR d14livaf.
         D14MARRY d14marrf. D14MARRY1 d14marr_1f. D14MOVEFU d14bathf.
         D14NEUROS d14hypef. D14OTHERS d14hypef. D14OUTDOR d14outdf.
         D14PAIN d14painf. D14PARKIN d14hypef. D14PERSON d14vdayf.
         D14PHONE d14tapwf. D14PNEUM d14hypef. D14PROSTA d14hypef.
         D14PSYCHO d14hypef. D14SMKTIM d14d26a_2f. D14SMOKE d14smokf.
         D14TAPWAT d14tapwf. D14TOILFU d14dresf. D14TUBERC d14hypef.
         D14TVSET d14tapwf. D14UNCONS d14doctf. D14VDAY d14vdayf.
         D14VMONTH d14vyeaf. D14VYEAR d14vyeaf. D14WASHMA d14tapwf.
         D14WCFACI d14wcfaf. D1_11 d1_11fff. D1_14 d1ffffff.
         D2 a54bffff. D2_11 a54b_11f. D31 d31fffff.
         D31_11 d31_11ff. D31_14 d31fffff. D32 d32fffff.
         D32_11 d32_11ff. D32_14 d32fffff. D33 d33fffff.
         D33_11 d33_11ff. D33_14 d33fffff. D34 d34fffff.
         D34_11 d34_11ff. D34_14 d34fffff. D4ALGA1 d4meat2f.
         D4ALGA1_11 d4meat2_1f. D4ALGA1_14 d4meat2f. D4ALGA2 d4meat2f.
         D4ALGA2_11 d4meat2_1f. D4ALGA2_14 d4meat2f. D4A_14 d4a_14ff.
         D4BEAN1 d4meat2f. D4BEAN1_11 d4meat2_1f. D4BEAN1_14 d4meat2f.
         D4BEAN2 d4meat2f. D4BEAN2_11 d4meat2_1f. D4BEAN2_14 d4meat2f.
         D4B_14 d4b_14ff. D4DRUG1 d4drug1f. D4DRUG1_11 d4drug1_1f.
         D4DRUG1_14 d4drug1f. D4DRUG2 d4drug1f. D4DRUG2_11 d4drug1_1f.
         D4DRUG2_14 d4drug1f. D4EGG1 d4meat2f. D4EGG1_11 d4meat2_1f.
         D4EGG1_14 d4meat2f. D4EGG2 d4meat2f. D4EGG2_11 d4meat2_1f.
         D4EGG2_14 d4meat2f. D4FISH1 d4meat2f. D4FISH1_11 d4meat2_1f.
         D4FISH1_14 d4meat2f. D4FISH2 d4meat2f. D4FISH2_11 d4meat2_1f.
         D4FISH2_14 d4meat2f. D4GARL1 d4meat2f. D4GARL1_11 d4meat2_1f.
         D4GARL1_14 d4meat2f. D4GARL2 d4meat2f. D4GARL2_11 d4meat2_1f.
         D4GARL2_14 d4meat2f. D4MEAT1 d4meat2f. D4MEAT1_11 d4meat2_1f.
         D4MEAT1_14 d4meat2f. D4MEAT2 d4meat2f. D4MEAT2_11 d4meat2_1f.
         D4MEAT2_14 d4meat2f. D4MILK1 d4meat2f. D4MILK1_11 d4meat2_1f.
         D4MILK1_14 d4meat2f. D4MILK2 d4meat2f. D4MILK2_11 d4meat2_1f.
         D4MILK2_14 d4meat2f. D4NUT1 d4meat2f. D4NUT1_11 d4meat2_1f.
         D4NUT1_14 d4meat2f. D4NUT2 d4meat2f. D4NUT2_11 d4meat2_1f.
         D4NUT2_14 d4meat2f. D4SUGA1 d4meat2f. D4SUGA1_11 d4meat2_1f.
         D4SUGA1_14 d4meat2f. D4SUGA2 d4meat2f. D4SUGA2_11 d4meat2_1f.
         D4SUGA2_14 d4meat2f. D4TEA1 d4meat2f. D4TEA1_11 d4meat2_1f.
         D4TEA1_14 d4meat2f. D4TEA2 d4meat2f. D4TEA2_11 d4meat2_1f.
         D4TEA2_14 d4meat2f. D4VEG1 d4meat2f. D4VEG1_11 d4meat2_1f.
         D4VEG1_14 d4meat2f. D4VEG2 d4meat2f. D4VEG2_11 d4meat2_1f.
         D4VEG2_14 d4meat2f. D4VIT1 d4meat2f. D4VIT1_11 d4meat2_1f.
         D4VIT1_14 d4meat2f. D4VIT2 d4meat2f. D4VIT2_11 d4meat2_1f.
         D4VIT2_14 d4meat2f. D5 d5ffffff. D5_11 d5_11fff.
         D5_14 d5ffffff. D6A d6afffff. D6A_11 d6a_11ff.
         D6A_14 d6afffff. D6B d6afffff. D6B_11 d6a_11ff.
         D6B_14 d6afffff. D6C d6afffff. D6C_11 d6a_11ff.
         D6C_14 d6afffff. D71 d71fffff. D710A_11 d78a_11f.
         D710A_14 d78a_14f. D710B_11 d78a_11f. D710B_14 d78a_14f.
         D710_11 a535_11f. D710_14 a535_14f. D71_11 d71_11ff.
         D71_14 d71fffff. D72 d71fffff. D72_11 d71_11ff.
         D72_14 d71fffff. D73 a53a2fff. D73_11 a53a2_1f.
         D73_14 a53a2fff. D74 a53a2fff. D74_11 a53a2_1f.
         D74_14 a53a2fff. D75 d75fffff. D75_11 a53a5_1f.
         D75_14 d75fffff. D76_11 d76_11ff. D76_14 d76_14ff.
         D77_11 d77_11ff. D77_14 d77_14ff. D78A_11 d78a_11f.
         D78A_14 d78a_14f. D78B_11 d78a_11f. D78B_14 d78a_14f.
         D78_11 a535_11f. D78_14 a535_14f. D79A_11 d78a_11f.
         D79A_14 d78a_14f. D79B_11 d78a_11f. D79B_14 d78a_14f.
         D79_11 a535_11f. D79_14 a535_14f. D81 d71fffff.
         D81_11 d71_11ff. D81_14 d71fffff. D82 d71fffff.
         D82_11 d71_11ff. D82_14 d71fffff. D83 a53a2fff.
         D83_11 a53a2_1f. D83_14 a53a2fff. D84 a53a2fff.
         D84_11 a53a2_1f. D84_14 a53a2fff. D85 d85fffff.
         D85_11 d85_11ff. D85_14 d85fffff. D86 d75fffff.
         D86_11 a53a5_1f. D86_14 d75fffff. D87_11 a535_11f.
         D87_14 a535_14f. D91 d91fffff. D91_11 d91_11ff.
         D91_14 d91fffff. D92 d91fffff. D92_11 d91_11ff.
         D92_14 d91fffff. D93 a53a2fff. D93_11 a53a2_1f.
         D93_14 a53a2fff. D94 a53a2fff. D94_11 a53a2_1f.
         D94_14 a53a2fff. DAYIN monthinf. DAYIN_11 monthin_1f.
         DTH08_11 dth08_1f. DTH11_14 dth11_1f. E0_11 e0_11fff.
         E0_14 e0_14fff. E1 e1ffffff. E10 e7ffffff.
         E10_11 e7_11fff. E10_14 e7ffffff. E11 e7ffffff.
         E11_11 e7_11fff. E11_14 e7ffffff. E12 e7ffffff.
         E12_11 e7_11fff. E12_14 e7ffffff. E13 e7ffffff.
         E13_11 e7_11fff. E13_14 e7ffffff. E14 e7ffffff.
         E14_11 e7_11fff. E14_14 e7ffffff. E1B e1bfffff.
         E1B_11 e1b_11ff. E1B_14 e1bfffff. E1_11 e1_11fff.
         E1_14 e1ffffff. E2 e2ffffff. E2B e1bfffff.
         E2B_11 e1b_11ff. E2B_14 e1bfffff. E2_11 e2_11fff.
         E2_14 e2ffffff. E3 e3ffffff. E3B e1bfffff.
         E3B_11 e1b_11ff. E3B_14 e1bfffff. E3_11 e3_11fff.
         E3_14 e3ffffff. E4 e4ffffff. E4B e1bfffff.
         E4B_11 e1b_11ff. E4B_14 e1bfffff. E4_11 e4_11fff.
         E4_14 e4ffffff. E5 e5ffffff. E5B e1bfffff.
         E5B_11 e1b_11ff. E5B_14 e1bfffff. E5_11 e5_11fff.
         E5_14 e5ffffff. E6 e6ffffff. E610 e610ffff.
         E610_11 e610_11f. E610_14 e610ffff. E62 e62fffff.
         E62_11 e62_11ff. E62_14 e62fffff. E63 e63fffff.
         E63_11 e63_11ff. E63_14 e63fffff. E64 e64fffff.
         E64_11 e64_11ff. E64_14 e64fffff. E65 e65fffff.
         E65_11 e65_11ff. E65_14 e65fffff. E67 e67fffff.
         E67_11 e67_11ff. E67_14 e67fffff. E6B e6bfffff.
         E6B_11 e6b_11ff. E6B_14 e6bfffff. E6_11 e6_11fff.
         E6_14 e6ffffff. E7 e7ffffff. E7_11 e7_11fff.
         E7_14 e7ffffff. E8 e7ffffff. E8_11 e7_11fff.
         E8_14 e7ffffff. E9 e7ffffff. E9_11 e7_11fff.
         E9_14 e7ffffff. F1 a54bffff. F10 a54bffff.
         F101 d75fffff. F101_11 a53a5_1f. F101_14 d75fffff.
         F102 d75fffff. F102_11 a53a5_1f. F102_14 d75fffff.
         F103 a54bffff. F1030A_11 a535_11f. F1030B1_11 f901b1_f.
         F1030B2_11 f901b1_f. F1030B3_11 f901b1_f. F1030_11 f41a12_f.
         F1031A_11 a535_11f. F1031B1_11 f901b1_f. F1031B2_11 f901b1_f.
         F1031B3_11 f1031b3f. F1031_11 f41a12_f. F1032_11 f1032_1f.
         F1033_11 f1033_1f. F103A1 a53a3fff. F103A1_11 a53a3_1f.
         F103A1_14 a53a3fff. F103A2 f103a2ff. F103A2_11 f103a2_f.
         F103A2_14 f103a2ff. F103A3 d75fffff. F103A3_11 a53a5_1f.
         F103A3_14 d75fffff. F103A4 f92a3fff. F103A4_11 f92a3_1f.
         F103A4_14 f92a3fff. F103A5 f103a5ff. F103A5_11 f103a5_f.
         F103A5_14 f103a5ff. F103A7 f92a3fff. F103A7_11 f92a3_1f.
         F103A7_14 f92a3fff. F103A8 f92a3fff. F103A8_11 f92a3_1f.
         F103A8_14 f92a3fff. F103B1 a53a3fff. F103B1_11 a53a3_1f.
         F103B1_14 a53a3fff. F103B2 f103a2ff. F103B2_11 f103a2_f.
         F103B2_14 f103a2ff. F103B3 d75fffff. F103B3_11 a53a5_1f.
         F103B3_14 d75fffff. F103B4 f92a3fff. F103B4_11 f92a3_1f.
         F103B4_14 f92a3fff. F103B5 f103a5ff. F103B5_11 f103a5_f.
         F103B5_14 f103a5ff. F103B7 f92a3fff. F103B7_11 f92a3_1f.
         F103B7_14 f92a3fff. F103B8 f92a3fff. F103B8_11 f92a3_1f.
         F103B8_14 f92a3fff. F103C1 a53a3fff. F103C1_11 a53a3_1f.
         F103C1_14 a53a3fff. F103C2 f103a2ff. F103C2_11 f103a2_f.
         F103C2_14 f103a2ff. F103C3 d75fffff. F103C3_11 a53a5_1f.
         F103C3_14 d75fffff. F103C4 f92a3fff. F103C4_11 f92a3_1f.
         F103C4_14 f92a3fff. F103C5 f103a5ff. F103C5_11 f103a5_f.
         F103C5_14 f103a5ff. F103C7 f92a3fff. F103C7_11 f92a3_1f.
         F103C7_14 f92a3fff. F103C8 f92a3fff. F103C8_11 f92a3_1f.
         F103C8_14 f92a3fff. F103D1 a53a3fff. F103D1_11 a53a3_1f.
         F103D1_14 a53a3fff. F103D2 f103a2ff. F103D2_11 f103a2_f.
         F103D2_14 f103a2ff. F103D3 d75fffff. F103D3_11 a53a5_1f.
         F103D3_14 d75fffff. F103D4 f92a3fff. F103D4_11 f92a3_1f.
         F103D4_14 f92a3fff. F103D5 f103a5ff. F103D5_11 f103a5_f.
         F103D5_14 f103a5ff. F103D7 f92a3fff. F103D7_11 f92a3_1f.
         F103D7_14 f92a3fff. F103D8 f92a3fff. F103D8_11 f92a3_1f.
         F103D8_14 f92a3fff. F103E1 a53a3fff. F103E1_11 a53a3_1f.
         F103E1_14 a53a3fff. F103E2 f103a2ff. F103E2_11 f103a2_f.
         F103E2_14 f103a2ff. F103E3 d75fffff. F103E3_11 a53a5_1f.
         F103E3_14 d75fffff. F103E4 f92a3fff. F103E4_11 f92a3_1f.
         F103E4_14 f92a3fff. F103E5 f103a5ff. F103E5_11 f103a5_f.
         F103E5_14 f103a5ff. F103E7 f92a3fff. F103E7_11 f92a3_1f.
         F103E7_14 f92a3fff. F103E8 f92a3fff. F103E8_11 f92a3_1f.
         F103E8_14 f92a3fff. F103F1 a53a3fff. F103F1_11 a53a3_1f.
         F103F1_14 a53a3fff. F103F2 f103a2ff. F103F2_11 f103a2_f.
         F103F2_14 f103a2ff. F103F3 d75fffff. F103F3_11 a53a5_1f.
         F103F3_14 d75fffff. F103F4 f92a3fff. F103F4_11 f92a3_1f.
         F103F4_14 f92a3fff. F103F5 f103a5ff. F103F5_11 f103a5_f.
         F103F5_14 f103a5ff. F103F7 f92a3fff. F103F7_11 f92a3_1f.
         F103F7_14 f92a3fff. F103F8 f92a3fff. F103F8_11 f92a3_1f.
         F103F8_14 f92a3fff. F103G1 a53a3fff. F103G1_11 a53a3_1f.
         F103G1_14 a53a3fff. F103G2 f103a2ff. F103G2_11 f103a2_f.
         F103G2_14 f103a2ff. F103G3 d75fffff. F103G3_11 a53a5_1f.
         F103G3_14 d75fffff. F103G4 f92a3fff. F103G4_11 f92a3_1f.
         F103G4_14 f92a3fff. F103G5 f103a5ff. F103G5_11 f103a5_f.
         F103G5_14 f103a5ff. F103G7 f92a3fff. F103G7_11 f92a3_1f.
         F103G7_14 f92a3fff. F103G8 f92a3fff. F103G8_11 f92a3_1f.
         F103G8_14 f92a3fff. F103H1 a53a3fff. F103H1_11 a53a3_1f.
         F103H1_14 a53a3fff. F103H2 f103a2ff. F103H2_11 f103a2_f.
         F103H2_14 f103a2ff. F103H3 d75fffff. F103H3_11 a53a5_1f.
         F103H3_14 d75fffff. F103H4 f92a3fff. F103H4_11 f92a3_1f.
         F103H4_14 f92a3fff. F103H5 f103a5ff. F103H5_11 f103a5_f.
         F103H5_14 f103a5ff. F103H7 f92a3fff. F103H7_11 f92a3_1f.
         F103H7_14 f92a3fff. F103H8 f92a3fff. F103H8_11 f92a3_1f.
         F103H8_14 f92a3fff. F103I1 a53a3fff. F103I1_11 a53a3_1f.
         F103I1_14 a53a3fff. F103I2 f103a2ff. F103I2_11 f103a2_f.
         F103I2_14 f103a2ff. F103I3 d75fffff. F103I3_11 a53a5_1f.
         F103I3_14 d75fffff. F103I4 f92a3fff. F103I4_11 f92a3_1f.
         F103I4_14 f92a3fff. F103I5 f103a5ff. F103I5_11 f103a5_f.
         F103I5_14 f103a5ff. F103I7 f92a3fff. F103I7_11 f92a3_1f.
         F103I7_14 f92a3fff. F103I8 f92a3fff. F103I8_11 f92a3_1f.
         F103I8_14 f92a3fff. F103J1 a53a3fff. F103J1_11 a53a3_1f.
         F103J1_14 a53a3fff. F103J2 f103a2ff. F103J2_11 f103a2_f.
         F103J2_14 f103a2ff. F103J3 d75fffff. F103J3_11 a53a5_1f.
         F103J3_14 d75fffff. F103J4 f92a3fff. F103J4_11 f92a3_1f.
         F103J4_14 f92a3fff. F103J5 f103a5ff. F103J5_11 f103a5_f.
         F103J5_14 f103a5ff. F103J7 f92a3fff. F103J7_11 f92a3_1f.
         F103J7_14 f92a3fff. F103J8 f92a3fff. F103J8_11 f92a3_1f.
         F103J8_14 f92a3fff. F103K1 a53a3fff. F103K1_11 a53a3_1f.
         F103K1_14 a53a3fff. F103K2 f103a2ff. F103K2_11 f103a2_f.
         F103K2_14 f103a2ff. F103K3 d75fffff. F103K3_11 a53a5_1f.
         F103K3_14 d75fffff. F103K4 f92a3fff. F103K4_11 f92a3_1f.
         F103K4_14 f92a3fff. F103K5 f103a5ff. F103K5_11 f103a5_f.
         F103K5_14 f103a5ff. F103K7 f92a3fff. F103K7_11 f92a3_1f.
         F103K7_14 f92a3fff. F103K8 f92a3fff. F103K8_11 f92a3_1f.
         F103K8_14 f92a3fff. F103L1 a53a3fff. F103L1_11 a53a3_1f.
         F103L1_14 a53a3fff. F103L2 f103a2ff. F103L2_11 f103a2_f.
         F103L2_14 f103a2ff. F103L3 d75fffff. F103L3_11 a53a5_1f.
         F103L3_14 d75fffff. F103L4 f92a3fff. F103L4_11 f92a3_1f.
         F103L4_14 f92a3fff. F103L5 f103a5ff. F103L5_11 f103a5_f.
         F103L5_14 f103a5ff. F103L7 f92a3fff. F103L7_11 f92a3_1f.
         F103L7_14 f92a3fff. F103L8 f92a3fff. F103L8_11 f92a3_1f.
         F103L8_14 f92a3fff. F103M1 a53a3fff. F103M1_11 a53a3_1f.
         F103M1_14 a53a3fff. F103M2 f103a2ff. F103M2_11 f103a2_f.
         F103M2_14 f103a2ff. F103M3 d75fffff. F103M3_11 a53a5_1f.
         F103M3_14 d75fffff. F103M4 f92a3fff. F103M4_11 f92a3_1f.
         F103M4_14 f92a3fff. F103M5 f103a5ff. F103M5_11 f103a5_f.
         F103M5_14 f103a5ff. F103M7 f92a3fff. F103M7_11 f92a3_1f.
         F103M7_14 f92a3fff. F103M8 f92a3fff. F103M8_11 f92a3_1f.
         F103M8_14 f92a3fff. F103_11 a54b_11f. F104_14 f104_14f.
         F105_14 f104_14f. F10A a54bffff. F10A_11 a54b_11f.
         F10A_14 a54bffff. F10_11 a54b_11f. F10_14 a54bffff.
         F111A f111afff. F111A_11 f111a_1f. F111A_14 f111afff.
         F111B f111afff. F111B_11 f111a_1f. F111B_14 f111afff.
         F111C f111afff. F111C_11 f111a_1f. F111C_14 f111afff.
         F112A f111afff. F112A_11 f111a_1f. F112A_14 f111afff.
         F112B f111afff. F112B_11 f111a_1f. F112B_14 f111afff.
         F112C f111afff. F112C_11 f111a_1f. F112C_14 f111afff.
         F113A f111afff. F113A_11 f111a_1f. F113A_14 f111afff.
         F113B f111afff. F113B_11 f111a_1f. F113B_14 f111afff.
         F113C f111afff. F113C_11 f111a_1f. F113C_14 f111afff.
         F12A f12affff. F12A_11 f12a_11f. F12A_14 f12affff.
         F12B f12affff. F12B_11 f12a_11f. F12B_14 f12affff.
         F12C f12affff. F12C_11 f12a_11f. F12C_14 f12affff.
         F13A f12affff. F13A_11 f12a_11f. F13A_14 f12affff.
         F13B f12affff. F13B_11 f12a_11f. F13B_14 f12affff.
         F13C f12affff. F13C_11 f12a_11f. F13C_14 f12affff.
         F141 f141ffff. F141_11 f141_11f. F141_14 f141ffff.
         F142 f141ffff. F142_11 f141_11f. F142_14 f141ffff.
         F143 f141ffff. F143_11 f141_11f. F143_14 f141ffff.
         F144 f141ffff. F144_11 f141_11f. F144_14 f141ffff.
         F145 f141ffff. F145_11 f141_11f. F145_14 f141ffff.
         F146 f141ffff. F146_11 f141_11f. F146_14 f141ffff.
         F147 f141ffff. F147_11 f141_11f. F147_14 f141ffff.
         F148 f141ffff. F148_11 f141_11f. F148_14 f141ffff.
         F149 f141ffff. F149_11 f141_11f. F149_14 f141ffff.
         F151 f151ffff. F151_11 b28_11ff. F151_14 f151ffff.
         F152 f151ffff. F152_11 b28_11ff. F152_14 f151ffff.
         F153 f151ffff. F153_11 b28_11ff. F153_14 f151ffff.
         F154 f151ffff. F154_11 b28_11ff. F154_14 f151ffff.
         F155 f151ffff. F155_11 b28_11ff. F155_14 f151ffff.
         F156 f151ffff. F156_11 b28_11ff. F156_14 f151ffff.
         F157 f151ffff. F157_11 b28_11ff. F157_14 f151ffff.
         F158 f151ffff. F158_11 b28_11ff. F158_14 f151ffff.
         F159 f151ffff. F159_11 b28_11ff. F159_14 f151ffff.
         F16 f16fffff. F16_11 f16_11ff. F16_14 f16fffff.
         F1_14 a54bffff. F2 f2ffffff. F21 f21fffff.
         F211 f21fffff. F211_11 f21_11ff. F211_14 f21fffff.
         F21_11 f21_11ff. F21_14 f21fffff. F22 a541ffff.
         F221_11 f221_11f. F221_14 f221_14f. F22_11 a541_11f.
         F22_14 a541ffff. F23 f23fffff. F23_11 f23_11ff.
         F23_14 f23fffff. F24_11 a535_11f. F24_14 a535_14f.
         F251_11 f251_11f. F252_11 f251_11f. F25A1_14 f25a1_1f.
         F25A2_14 f25a1_1f. F25B1_11 f25b1_1f. F25B1_14 f25b1_1_1f.
         F25B2_11 d78a_11f. F25B2_14 d78a_14f. F26_11 f25b1_1f.
         F26_14 f26_14ff. F27_11 f27_11ff. F27_14 f27_14ff.
         F2_14 f2ffffff. F31 f31fffff. F31_11 f31_11ff.
         F31_14 f31fffff. F32A f31fffff. F32A_11 f31_11ff.
         F32A_14 f31fffff. F32B f31fffff. F32B_11 f31_11ff.
         F32B_14 f31fffff. F32C f31fffff. F32C_11 f31_11ff.
         F32C_14 f31fffff. F32D f31fffff. F32D_11 f31_11ff.
         F32D_14 f31fffff. F32E f31fffff. F32E_11 f31_11ff.
         F32E_14 f31fffff. F33 f23fffff. F33_11 f23_11ff.
         F33_14 f23fffff. F34 f34fffff. F340 f340ffff.
         F340_11 f340_11f. F340_14 f340ffff. F34_11 f34_11ff.
         F34_14 f34fffff. F35 f35fffff. F35_11 f35_11ff.
         F35_14 f35fffff. F41 f41fffff. F41A11_11 a534_11f.
         F41A11_14 a534_14f. F41A12_11 f41a12_f. F41A12_14 f41a12__1f.
         F41A1_11 a535_11f. F41A1_14 a535_14f. F41A21_11 a534_11f.
         F41A21_14 a534_14f. F41A22_11 f41a12_f. F41A22_14 f41a12__1f.
         F41A2_11 a535_11f. F41A2_14 a535_14f. F41A31_11 a534_11f.
         F41A31_14 a534_14f. F41A32_11 f41a12_f. F41A32_14 f41a12__1f.
         F41A3_11 a535_11f. F41A3_14 a535_14f. F41B1_11 a534_11f.
         F41B1_14 a534_14f. F41B2_11 f41a12_f. F41B2_14 f41a12__1f.
         F41B_11 a535_11f. F41B_14 a535_14f. F41_11 f41_11ff.
         F41_14 f41fffff. F42 d75fffff. F42_11 a53a5_1f.
         F42_14 d75fffff. F43A1 a53a2fff. F43A1_11 a53a2_1f.
         F43A1_14 a53a2fff. F43A2 f43a2fff. F43A2_11 f43a2_1f.
         F43A2_14 f43a2fff. F43A3 a53a2fff. F43A3_11 a53a2_1f.
         F43A3_14 a53a2fff. F43A4 f43a4fff. F43A4_11 f43a4_1f.
         F43A4_14 f43a4fff. F43B1 a53a2fff. F43B1_11 a53a2_1f.
         F43B1_14 a53a2fff. F43B2 f43a2fff. F43B2_11 f43a2_1f.
         F43B2_14 f43a2fff. F43B3 a53a2fff. F43B3_11 a53a2_1f.
         F43B3_14 a53a2fff. F43B4 f43a4fff. F43B4_11 f43a4_1f.
         F43B4_14 f43a4fff. F43C1 a53a2fff. F43C1_11 a53a2_1f.
         F43C1_14 a53a2fff. F43C2 f43a2fff. F43C2_11 f43a2_1f.
         F43C2_14 f43a2fff. F43C3 a53a2fff. F43C3_11 a53a2_1f.
         F43C3_14 a53a2fff. F43C4 f43a4fff. F43C4_11 f43a4_1f.
         F43C4_14 f43a4fff. F43D1 a53a2fff. F43D1_11 a53a2_1f.
         F43D1_14 a53a2fff. F43D2 f43a2fff. F43D2_11 f43a2_1f.
         F43D2_14 f43a2fff. F43D3 a53a2fff. F43D3_11 a53a2_1f.
         F43D3_14 a53a2fff. F43D4 f43a4fff. F43D4_11 f43a4_1f.
         F43D4_14 f43a4fff. F44 d75fffff. F44_11 a53a5_1f.
         F44_14 d75fffff. F45 f45fffff. F45_11 f45_11ff.
         F45_14 f45fffff. F46 f46fffff. F46_11 f46_11ff.
         F46_14 f46fffff. F47 f47fffff. F47_11 f47_11ff.
         F47_14 f47fffff. F5 f5ffffff. F5_11 f5_11fff.
         F5_11_14 f5ffffff. F61 d71fffff. F610 f610ffff.
         F610_11 f610_11f. F610_14 f610ffff. F61_11 d71_11ff.
         F61_14 d71fffff. F62 f62fffff. F62_11 f62_11ff.
         F62_14 f62_14ff. F63 f62fffff. F63_11 f62_11ff.
         F63_14 f62_14ff. F64A f64affff. F64A_11 f64a_11f.
         F64A_14 f64affff. F64B f64affff. F64B_11 f64a_11f.
         F64B_14 f64affff. F64C f64affff. F64C_11 f64a_11f.
         F64C_14 f64affff. F64D f64affff. F64D_11 f64a_11f.
         F64D_14 f64affff. F64E f64affff. F64E1_11 f64e1_1f.
         F64E_14 f64affff. F64F f64affff. F64F1_11 f64e1_1f.
         F64F_14 f64affff. F64G f64affff. F64G1_11 f64e1_1f.
         F64G_14 f64affff. F64H f64affff. F64H1_11 f64e1_1f.
         F64H_14 f64affff. F64I f64iffff. F64I_11 f64i_11f.
         F64I_14 f64iffff. F651A f651afff. F651A1_11 f651a1_f.
         F651A1_14 f651a1__1f. F651A2_11 f651a1_f. F651A2_14 f651a1__1f.
         F651B f651afff. F651B1_11 f651a1_f. F651B1_14 f651a1__1f.
         F651B2_11 f651a1_f. F651B2_14 f651a1__1f. F652 f652ffff.
         F6521_11 f6521_1f. F6521_14 f6521_1_1f. F652A_11 yearin_f.
         F652B_11 a535_11f. F652B_14 a535_14f. F66 d91fffff.
         F66_11 d91_11ff. F66_14 d91fffff. F71 d91fffff.
         F71_11 d91_11ff. F71_14 d91fffff. F721 a53a2fff.
         F721_11 a53a2_1f. F721_14 a53a2fff. F722 a53a2fff.
         F722A_11 d91_11ff. F722_11 a53a2_1f. F722_14 a53a2fff.
         F73 a53a2fff. F73_11 a53a2_1f. F73_14 a53a2fff.
         F74 a54bffff. F74_11 a54b_11f. F74_14 a54bffff.
         F81 d91fffff. F81_11 d91_11ff. F81_14 d91fffff.
         F821 a53a2fff. F821_11 a53a2_1f. F821_14 a53a2fff.
         F822 a53a2fff. F822A_11 d91_11ff. F822_11 a53a2_1f.
         F822_14 a53a2fff. F83 a53a2fff. F83_11 a53a2_1f.
         F83_14 a53a2fff. F84 f84fffff. F84_11 f84_11ff.
         F84_14 f84fffff. F85 f84fffff. F85_11 f84_11ff.
         F85_14 f84fffff. F86 a54bffff. F86_11 a54b_11f.
         F86_14 a54bffff. F9 a54bffff. F901A_11 a535_11f.
         F901B1_11 f901b1_f. F901B2_11 f901b1_f. F901B3_11 f901b1_f.
         F901_11 f41a12_f. F902A_11 a535_11f. F902B1_11 f901b1_f.
         F902B2_11 f901b1_f. F902B3_11 f901b1_f. F902_11 f41a12_f.
         F91 a54bffff. F91_11 a54b_11f. F91_14 a54bffff.
         F92A1 d75fffff. F92A1_11 a53a5_1f. F92A1_14 d75fffff.
         F92A2 a53a3fff. F92A2_11 a53a3_1f. F92A2_14 a53a3fff.
         F92A3 f92a3fff. F92A3_11 f92a3_1f. F92A3_14 f92a3fff.
         F92A4 a53a2fff. F92A4_11 a53a2_1f. F92A4_14 a53a2fff.
         F92A5 f92a5fff. F92A5_11 f92a5_1f. F92A5_14 f92a5fff.
         F92A6 f92a3fff. F92A6_11 f92a3_1f. F92A6_14 f92a3fff.
         F92A7_11 f92a3_1f. F92A7_14 f92a3fff. F92B1 d75fffff.
         F92B1_11 a53a5_1f. F92B1_14 d75fffff. F92B2 a53a3fff.
         F92B2_11 a53a3_1f. F92B2_14 a53a3fff. F92B3 f92a3fff.
         F92B3_11 f92a3_1f. F92B3_14 f92a3fff. F92B4 a53a2fff.
         F92B4_11 a53a2_1f. F92B4_14 a53a2fff. F92B5 f92a5fff.
         F92B5_11 f92a5_1f. F92B5_14 f92a5fff. F92B6 f92a3fff.
         F92B6_11 f92a3_1f. F92B6_14 f92a3fff. F92B7_11 f92a3_1f.
         F92B7_14 f92a3fff. F92C1 d75fffff. F92C1_11 a53a5_1f.
         F92C1_14 d75fffff. F92C2 a53a3fff. F92C2_11 a53a3_1f.
         F92C2_14 a53a3fff. F92C3 f92a3fff. F92C3_11 f92a3_1f.
         F92C3_14 f92a3fff. F92C4 a53a2fff. F92C4_11 a53a2_1f.
         F92C4_14 a53a2fff. F92C5 f92a5fff. F92C5_11 f92a5_1f.
         F92C5_14 f92a5fff. F92C6 f92a3fff. F92C6_11 f92a3_1f.
         F92C6_14 f92a3fff. F92C7_11 f92a3_1f. F92C7_14 f92a3fff.
         F92D1 d75fffff. F92D1_11 a53a5_1f. F92D1_14 d75fffff.
         F92D2 a53a3fff. F92D2_11 a53a3_1f. F92D2_14 a53a3fff.
         F92D3 f92a3fff. F92D3_11 f92a3_1f. F92D3_14 f92a3fff.
         F92D4 a53a2fff. F92D4_11 a53a2_1f. F92D4_14 a53a2fff.
         F92D5 f92a5fff. F92D5_11 f92a5_1f. F92D5_14 f92a5fff.
         F92D6 f92a3fff. F92D6_11 f92a3_1f. F92D6_14 f92a3fff.
         F92D7_11 f92a3_1f. F92D7_14 f92a3fff. F92E1 d75fffff.
         F92E1_11 a53a5_1f. F92E1_14 d75fffff. F92E2 a53a3fff.
         F92E2_11 a53a3_1f. F92E2_14 a53a3fff. F92E3 f92a3fff.
         F92E3_11 f92a3_1f. F92E3_14 f92a3fff. F92E4 a53a2fff.
         F92E4_11 a53a2_1f. F92E4_14 a53a2fff. F92E5 f92a5fff.
         F92E5_11 f92a5_1f. F92E5_14 f92a5fff. F92E6 f92a3fff.
         F92E6_11 f92a3_1f. F92E6_14 f92a3fff. F92E7_11 f92a3_1f.
         F92E7_14 f92a3fff. F92F1 d75fffff. F92F1_11 a53a5_1f.
         F92F1_14 d75fffff. F92F2 a53a3fff. F92F2_11 a53a3_1f.
         F92F2_14 a53a3fff. F92F3 f92a3fff. F92F3_11 f92a3_1f.
         F92F3_14 f92a3fff. F92F4 a53a2fff. F92F4_11 a53a2_1f.
         F92F4_14 a53a2fff. F92F5 f92a5fff. F92F5_11 f92a5_1f.
         F92F5_14 f92a5fff. F92F6 f92a3fff. F92F6_11 f92a3_1f.
         F92F6_14 f92a3fff. F92F7_11 f92a3_1f. F92F7_14 f92a3fff.
         F92G1 d75fffff. F92G1_11 a53a5_1f. F92G1_14 d75fffff.
         F92G2 a53a3fff. F92G2_11 a53a3_1f. F92G2_14 a53a3fff.
         F92G3 f92a3fff. F92G3_11 f92a3_1f. F92G3_14 f92a3fff.
         F92G4 a53a2fff. F92G4_11 a53a2_1f. F92G4_14 a53a2fff.
         F92G5 f92a5fff. F92G5_11 f92a5_1f. F92G5_14 f92a5fff.
         F92G6 f92a3fff. F92G6_11 f92a3_1f. F92G6_14 f92a3fff.
         F92G7_11 f92a3_1f. F92G7_14 f92a3fff. F92H1 d75fffff.
         F92H1_11 a53a5_1f. F92H1_14 d75fffff. F92H2 a53a3fff.
         F92H2_11 a53a3_1f. F92H2_14 a53a3fff. F92H3 f92a3fff.
         F92H3_11 f92a3_1f. F92H3_14 f92a3fff. F92H4 a53a2fff.
         F92H4_11 a53a2_1f. F92H4_14 a53a2fff. F92H5 f92a5fff.
         F92H5_11 f92a5_1f. F92H5_14 f92a5fff. F92H6 f92a3fff.
         F92H6_11 f92a3_1f. F92H6_14 f92a3fff. F92H7_11 f92a3_1f.
         F92H7_14 f92a3fff. F92I1 d75fffff. F92I1_11 a53a5_1f.
         F92I1_14 d75fffff. F92I2 a53a3fff. F92I2_11 a53a3_1f.
         F92I2_14 a53a3fff. F92I3 f92a3fff. F92I3_11 f92a3_1f.
         F92I3_14 f92a3fff. F92I4 a53a2fff. F92I4_11 a53a2_1f.
         F92I4_14 a53a2fff. F92I5 f92a5fff. F92I5_11 f92a5_1f.
         F92I5_14 f92a5fff. F92I6 f92a3fff. F92I6_11 f92a3_1f.
         F92I6_14 f92a3fff. F92I7_11 f92a3_1f. F92I7_14 f92a3fff.
         F92J1 d75fffff. F92J1_11 a53a5_1f. F92J1_14 d75fffff.
         F92J2 a53a3fff. F92J2_11 a53a3_1f. F92J2_14 a53a3fff.
         F92J3 f92a3fff. F92J3_11 f92a3_1f. F92J3_14 f92a3fff.
         F92J4 a53a2fff. F92J4_11 a53a2_1f. F92J4_14 a53a2fff.
         F92J5 f92a5fff. F92J5_11 f92a5_1f. F92J5_14 f92a5fff.
         F92J6 f92a3fff. F92J6_11 f92a3_1f. F92J6_14 f92a3fff.
         F92J7_11 f92a3_1f. F92J7_14 f92a3fff. F9A a54bffff.
         F9A_11 a54b_11f. F9_11 a54b_11f. G01 g01fffff.
         G01_11 g01_11ff. G01_14 g01fffff. G02 a54bffff.
         G02_11 a54b_11f. G02_14 a54bffff. G1 g1ffffff.
         G101 g511ffff. G1011_11 a54b_11f. G1011_14 a54bffff.
         G101_11 g511_11f. G101_14 g511ffff. G1021 g511ffff.
         G1021_11 g511_11f. G1021_14 g511ffff. G102B_11 g7_11fff.
         G102C_11 g102c_1f. G102C_14 g102c_1_1f. G102_11 d91_11ff.
         G102_14 d91fffff. G1061_11 g1061_1f. G1061_14 g1061_1_1f.
         G1062_11 g1062_1f. G1062_14 g1062_1_1f. G1063_11 g1063_1f.
         G1063_14 g1063_1_1f. G106_11 d91_11ff. G106_14 d91fffff.
         G11 g11fffff. G11_11 g11_11ff. G11_14 g11fffff.
         G12 g12fffff. G122 g511ffff. G122_11 g511_11f.
         G122_14 g511ffff. G123 g511ffff. G123_11 g511_11f.
         G123_14 g511ffff. G12_11 g12_11ff. G12_14 g12fffff.
         G130 d91fffff. G130_11 d91_11ff. G130_14 d91fffff.
         G131 g131ffff. G131_11 g131_11f. G131_14 g131ffff.
         G132 g132ffff. G132_11 g132_11f. G132_14 g132ffff.
         G14A1 g14a1fff. G14A1_11 g14a1_1f. G14A1_14 g14b1fff.
         G14A2 g14a2fff. G14A2_11 g14a2_1f. G14A2_14 g14a2fff.
         G14B1 g14b1fff. G14B1_11 g14b1_1f. G14B1_14 g14b1fff.
         G14B2 g14a2fff. G14B2_11 g14a2_1f. G14B2_14 g14a2fff.
         G14C1 g14b1fff. G14C1_11 g14b1_1f. G14C1_14 g14b1fff.
         G14C2 g14a2fff. G14C2_11 g14a2_1f. G14C2_14 g14a2fff.
         G15A1 g15a1fff. G15A1_11 g15a1_1f. G15A1_14 g15a1fff.
         G15A2 d71fffff. G15A2_11 d71_11ff. G15A2_14 d71fffff.
         G15A3 g15a3fff. G15A3_11 g15a3_1f. G15A3_14 g15a3fff.
         G15B1 g15a1fff. G15B1_11 g15a1_1f. G15B1_14 g15a1fff.
         G15B2 d71fffff. G15B2_11 d71_11ff. G15B2_14 d71fffff.
         G15B3 g15a3fff. G15B3_11 g15a3_1f. G15B3_14 g15a3fff.
         G15C1 g15a1fff. G15C1_11 g15a1_1f. G15C1_14 g15a1fff.
         G15C2 d71fffff. G15C2_11 d71_11ff. G15C2_14 d71fffff.
         G15C3 g15a3fff. G15C3_11 g15a3_1f. G15C3_14 g15a3fff.
         G15D1 g15a1fff. G15D1_11 g15a1_1f. G15D1_14 g15a1fff.
         G15D2 d71fffff. G15D2_11 d71_11ff. G15D2_14 d71fffff.
         G15D3 g15a3fff. G15D3_11 g15a3_1f. G15D3_14 g15a3fff.
         G15E1 g15a1fff. G15E1_11 g15a1_1f. G15E1_14 g15a1fff.
         G15E2 d71fffff. G15E2_11 d71_11ff. G15E2_14 d71fffff.
         G15E3 g15a3fff. G15E3_11 g15a3_1f. G15E3_14 g15a3fff.
         G15F1 g15a1fff. G15F1_11 g15a1_1f. G15F1_14 g15a1fff.
         G15F2 d91fffff. G15F2_11 d91_11ff. G15F2_14 d91fffff.
         G15F3 g15f3fff. G15F3_11 g15f3_1f. G15F3_14 g15f3fff.
         G15G1 g15a1fff. G15G1_11 g15a1_1f. G15G1_14 g15a1fff.
         G15G2 d71fffff. G15G2_11 d71_11ff. G15G2_14 d71fffff.
         G15G3 g15a3fff. G15G3_11 g15a3_1f. G15G3_14 g15a3fff.
         G15H1 g15a1fff. G15H1_11 g15a1_1f. G15H1_14 g15a1fff.
         G15H2 d71fffff. G15H2_11 d71_11ff. G15H2_14 d71fffff.
         G15H3 g15a3fff. G15H3_11 g15a3_1f. G15H3_14 g15a3fff.
         G15I1 g15a1fff. G15I1_11 g15a1_1f. G15I1_14 g15a1fff.
         G15I2 d71fffff. G15I2_11 d71_11ff. G15I2_14 d71fffff.
         G15I3 g15a3fff. G15I3_11 g15a3_1f. G15I3_14 g15a3fff.
         G15J1 g15a1fff. G15J1A_11 g15n1a_f. G15J1A_14 g15n1a__1f.
         G15J1_11 g15a1_1f. G15J1_14 g15a1fff. G15J2 d71fffff.
         G15J2A_11 g15n1a_f. G15J2A_14 g15n1a__1f. G15J2_11 d71_11ff.
         G15J2_14 d71fffff. G15J3 g15a3fff. G15J3A_11 g15n3a_f.
         G15J3A_14 g15n3a__1f. G15J3_11 g15a3_1f. G15J3_14 g15a3fff.
         G15K1 g15a1fff. G15K1_11 g15a1_1f. G15K1_14 g15a1fff.
         G15K2 d71fffff. G15K2_11 d71_11ff. G15K2_14 d71fffff.
         G15K3 g15f3fff. G15K3_11 g15f3_1f. G15K3_14 g15f3fff.
         G15L1 g15a1fff. G15L1_11 g15a1_1f. G15L1_14 g15a1fff.
         G15L2 d71fffff. G15L2_11 d71_11ff. G15L2_14 d71fffff.
         G15L3 g15a3fff. G15L3_11 g15a3_1f. G15L3_14 g15a3fff.
         G15M1 g15a1fff. G15M1_11 g15a1_1f. G15M1_14 g15a1fff.
         G15M2 d71fffff. G15M2_11 d71_11ff. G15M2_14 d71fffff.
         G15M3 g15a3fff. G15M3_11 g15a3_1f. G15M3_14 g15a3fff.
         G15N1 g15a1fff. G15N1A_11 g15n1a_f. G15N1A_14 g15n1a__1f.
         G15N1_11 g15a1_1f. G15N1_14 g15a1fff. G15N2 d71fffff.
         G15N2A_11 g15n1a_f. G15N2A_14 g15n1a__1f. G15N2_11 d71_11ff.
         G15N2_14 d71fffff. G15N3 g15a3fff. G15N3A_11 g15n3a_f.
         G15N3A_14 g15n3a__1f. G15N3_11 g15a3_1f. G15N3_14 g15a3fff.
         G15O1 g15a1fff. G15O1_11 g15a1_1f. G15O1_14 g15a1fff.
         G15O2 d71fffff. G15O2_11 d71_11ff. G15O2_14 d71fffff.
         G15O3 g15a3fff. G15O3_11 g15a3_1f. G15O3_14 g15a3fff.
         G15P1 g15a1fff. G15P1_11 g15a1_1f. G15P1_14 g15a1fff.
         G15P2 d71fffff. G15P2_11 d71_11ff. G15P2_14 d71fffff.
         G15P3 g15a3fff. G15P3_11 g15a3_1f. G15P3_14 g15a3fff.
         G15Q1 g15a1fff. G15Q1_11 g15a1_1f. G15Q1_14 g15a1fff.
         G15Q2 d71fffff. G15Q2_11 d71_11ff. G15Q2_14 d71fffff.
         G15Q3 g15a3fff. G15Q3_11 g15a3_1f. G15Q3_14 g15a3fff.
         G15R1 g15a1fff. G15R1_11 g15a1_1f. G15R1_14 g15a1fff.
         G15R2 d71fffff. G15R2_11 d71_11ff. G15R2_14 d71fffff.
         G15R3 g15a3fff. G15R3_11 g15a3_1f. G15R3_14 g15a3fff.
         G15S1 g15a1fff. G15S1_11 g15a1_1f. G15S1_14 g15a1fff.
         G15S2 d71fffff. G15S2_11 d71_11ff. G15S2_14 d71fffff.
         G15S3 g15a3fff. G15S3_11 g15a3_1f. G15S3_14 g15a3fff.
         G15T1 g15a1fff. G15T1_11 g15a1_1f. G15T1_14 g15a1fff.
         G15T2 d71fffff. G15T2_11 d71_11ff. G15T2_14 d71fffff.
         G15T3 g15a3fff. G15T3_11 g15a3_1f. G15T3_14 g15a3fff.
         G15U1 g15a1fff. G15U1_11 g15a1_1f. G15U1_14 g15a1fff.
         G15U2 d71fffff. G15U2_11 d71_11ff. G15U2_14 d71fffff.
         G15U3 g15a3fff. G15U3_11 g15a3_1f. G15U3_14 g15a3fff.
         G15V1 g15a1fff. G15V1_11 g15a1_1f. G15V1_14 g15a1fff.
         G15V2 d91fffff. G15V2_11 d91_11ff. G15V2_14 d91fffff.
         G15V3 g15f3fff. G15V3_11 g15f3_1f. G15V3_14 g15f3fff.
         G15Y2_11 g15n1a_f. G15Y2_14 f26_14ff. G15Y3_11 g15n3a_f.
         G15Y3_14 g15n3a__1f. G1_11 g1_11fff. G1_14 g1ffffff.
         G21 a54bffff. G21_11 a54b_11f. G21_14 a54bffff.
         G22 d91fffff. G22_11 d91_11ff. G22_14 d91fffff.
         G23_11 g23_11ff. G23_14 g23_14ff. G24A_11 f41a12_f.
         G24A_14 f41a12__1f. G24_11 a535_11f. G24_14 a535_14f.
         G25A_11 f41a12_f. G25A_14 f41a12__1f. G25_11 a535_11f.
         G25_14 a535_14f. G3 d91fffff. G3_11 d91_11ff.
         G3_14 d91fffff. G4 g4ffffff. G4A_11 g4a_11ff.
         G4A_14 g4a_14ff. G4B_11 g4b_11ff. G4B_14 g4b_14ff.
         G4_11 g4_11fff. G4_14 g4ffffff. G511 g511ffff.
         G511_11 g511_11f. G511_14 g511ffff. G512 g511ffff.
         G512_11 g511_11f. G512_14 g511ffff. G521 g511ffff.
         G521_11 g511_11f. G521_14 g511ffff. G522 g511ffff.
         G522_11 g511_11f. G522_14 g511ffff. G6_11 g6_11fff.
         G6_14 g6_14fff. G71 g511ffff. G72 g511ffff.
         G7_11 g7_11fff. G7_14 g7_14fff. G81 g81fffff.
         G81_11 g81_11ff. G81_14 g81fffff. G82 g81fffff.
         G82_11 g81_11ff. G82_14 g81fffff. G83 g83fffff.
         G83_11 g83_11ff. G83_14 g83fffff. G9 g9ffffff.
         G9_11 g9_11fff. G9_14 g9ffffff. H1 h1ffffff.
         H1_11 h1_11fff. H1_14 h1ffffff. H21 h21fffff.
         H21_11 h21_11ff. H21_14 h21fffff. H22 h22fffff.
         H22_11 h22_11ff. H22_14 h22fffff. H3 h3ffffff.
         H3_11 h3_11fff. H3_14 h3ffffff. H5_14 h5_14fff.
         H6 d71fffff. H6_11 d71_11ff. H6_14 d71fffff.
         H7 d71fffff. H71 h71fffff. H71_11 h71_11ff.
         H71_14 h71fffff. H7_11 d71_11ff. H7_14 d71fffff.
         JIGE a54bffff. JIGE_11 a54b_11f. JIGE_14 a54bffff.
         MONTHIN monthinf. MONTHIN_11 monthin_1f. PROV provffff.
         RA41 ra41ffff. RA41_14 ra41ffff. RA42 ra41ffff.
         RA42_14 ra41ffff. RA43 ra41ffff. RA43_14 ra41ffff.
         RA51 ra51ffff. RA51_11 ra51_11f. RA51_14 ra51ffff.
         RA52 ra41ffff. RA52_11 ra52_11f. RA52_14 ra41ffff.
         RA530 ra41ffff. RA530_11 ra52_11f. RA530_14 ra41ffff.
         RA531 ra41ffff. RA531_11 ra52_11f. RA531_14 ra41ffff.
         RA532 ra41ffff. RA532_11 ra52_11f. RA532_14 ra41ffff.
         RA533_11 ra52_11f. RA533_14 ra41ffff. RA534_11 ra52_11f.
         RA534_14 ra41ffff. RA535_11 ra52_11f. RA535_14 ra41ffff.
         RA536_11 ra52_11f. RA536_14 ra41ffff. RA537_11 ra52_11f.
         RA537_14 ra41ffff. RA53A ra41ffff. RA53A_11 ra52_11f.
         RA53A_14 ra41ffff. RA53B ra41ffff. RA53B_11 ra52_11f.
         RA53B_14 ra41ffff. RA53C ra41ffff. RA53C_11 ra52_11f.
         RA53C_14 ra41ffff. RA53D ra41ffff. RA53D_11 ra52_11f.
         RA53D_14 ra41ffff. RA53E ra41ffff. RA53E_11 ra52_11f.
         RA53E_14 ra41ffff. RA53F ra41ffff. RA53F_11 ra52_11f.
         RA53F_14 ra41ffff. RA53G ra41ffff. RA53G_11 ra52_11f.
         RA53G_14 ra41ffff. RA53H ra41ffff. RA53H_11 ra52_11f.
         RA53H_14 ra41ffff. RA53I ra41ffff. RA53I_11 ra52_11f.
         RA53I_14 ra41ffff. RA53J ra41ffff. RA53J_11 ra52_11f.
         RA53J_14 ra41ffff. RA53K ra41ffff. RA53L ra41ffff.
         RA54 ra41ffff. RA540_11 ra52_11f. RA540_14 ra41ffff.
         RA541 ra41ffff. RA541_11 ra52_11f. RA541_14 ra41ffff.
         RA542 ra41ffff. RA542_11 ra52_11f. RA542_14 ra41ffff.
         RA54_11 ra52_11f. RA54_14 ra41ffff. RD1 rd1fffff.
         RD101 ra51ffff. RD101_11 ra51_11f. RD101_14 ra51ffff.
         RD102 ra41ffff. RD102_11 ra52_11f. RD102_14 ra41ffff.
         RD103 ra41ffff. RD103_11 ra52_11f. RD103_14 ra41ffff.
         RD11A ra51ffff. RD11A_11 ra51_11f. RD11A_14 ra51ffff.
         RD11B ra51ffff. RD11B_11 ra51_11f. RD11B_14 ra51ffff.
         RD11C ra51ffff. RD11C_11 ra51_11f. RD11C_14 ra51ffff.
         RD11D ra51ffff. RD11D_11 ra51_11f. RD11D_14 ra51ffff.
         RD11E ra51ffff. RD11E_11 ra51_11f. RD11E_14 ra51ffff.
         RD11F ra51ffff. RD11F_11 ra51_11f. RD11F_14 ra51ffff.
         RD11G ra51ffff. RD11G_11 ra51_11f. RD11G_14 ra51ffff.
         RD11H ra51ffff. RD11H_11 ra51_11f. RD11H_14 ra51ffff.
         RD12 rd12ffff. RD12_11 rd12_11f. RD12_14 rd12ffff.
         RD1_11 rd1_11ff. RD1_14 rd1fffff. RD2 ra51ffff.
         RD2_11 ra51_11f. RD2_14 ra51ffff. RD31 ra51ffff.
         RD31_11 ra51_11f. RD31_14 ra51ffff. RD32 ra51ffff.
         RD32_11 ra51_11f. RD32_14 ra51ffff. RD33 ra51ffff.
         RD33_11 ra51_11f. RD33_14 ra51ffff. RD34 ra51ffff.
         RD34_11 ra51_11f. RD34_14 ra51ffff. RD4ALGA ra51ffff.
         RD4ALGA_11 ra51_11f. RD4ALGA_14 ra51ffff. RD4BEAN ra51ffff.
         RD4BEAN_11 ra51_11f. RD4BEAN_14 ra51ffff. RD4DRUG ra51ffff.
         RD4DRUG_11 ra51_11f. RD4DRUG_14 ra51ffff. RD4EGG ra51ffff.
         RD4EGG_11 ra51_11f. RD4EGG_14 ra51ffff. RD4FISH ra51ffff.
         RD4FISH_11 ra51_11f. RD4FISH_14 ra51ffff. RD4GARL ra51ffff.
         RD4GARL_11 ra51_11f. RD4GARL_14 ra51ffff. RD4MEAT ra51ffff.
         RD4MEAT_11 ra51_11f. RD4MEAT_14 ra51ffff. RD4MILK_14 ra51ffff.
         RD4NUT ra51ffff. RD4NUT_11 ra51_11f. RD4NUT_14 ra51ffff.
         RD4SUGA ra51ffff. RD4SUGA_11 ra51_11f. RD4SUGA_14 ra51ffff.
         RD4TEA ra51ffff. RD4TEA_11 ra51_11f. RD4TEA_14 ra51ffff.
         RD4VEG ra51ffff. RD4VEG_11 ra51_11f. RD4VEG_14 ra51ffff.
         RD4VIT ra51ffff. RD4VIT_11 ra51_11f. RD4VIT_14 ra51ffff.
         RD5 ra51ffff. RD5_11 ra51_11f. RD5_14 ra51ffff.
         RD6 ra51ffff. RD6_11 ra51_11f. RD6_14 ra51ffff.
         RD71 ra51ffff. RD710_11 ra52_11f. RD710_14 ra41ffff.
         RD71_11 ra51_11f. RD71_14 ra51ffff. RD72 ra51ffff.
         RD72_11 ra51_11f. RD72_14 ra51ffff. RD73 ra41ffff.
         RD73_11 ra52_11f. RD73_14 ra41ffff. RD74 ra41ffff.
         RD74_11 ra52_11f. RD74_14 ra41ffff. RD75 ra41ffff.
         RD75_11 ra52_11f. RD75_14 ra41ffff. RD76_11 ra52_11f.
         RD76_14 ra41ffff. RD77_11 ra52_11f. RD77_14 ra41ffff.
         RD78_11 ra52_11f. RD78_14 ra41ffff. RD79_11 ra52_11f.
         RD79_14 ra41ffff. RD81 ra51ffff. RD81_11 ra51_11f.
         RD81_14 ra51ffff. RD82 ra51ffff. RD82_11 ra51_11f.
         RD82_14 ra51ffff. RD83 ra41ffff. RD83_11 ra52_11f.
         RD83_14 ra41ffff. RD84 ra41ffff. RD84_11 ra52_11f.
         RD84_14 ra41ffff. RD85 ra41ffff. RD85_11 ra52_11f.
         RD85_14 ra41ffff. RD86 ra51ffff. RD86_11 ra51_11f.
         RD86_14 ra51ffff. RD87_11 ra52_11f. RD87_14 ra41ffff.
         RD91 ra51ffff. RD91_11 ra51_11f. RD91_14 ra51ffff.
         RD92 ra41ffff. RD92_11 ra52_11f. RD92_14 ra41ffff.
         RD93 ra41ffff. RD93_11 ra52_11f. RD93_14 ra41ffff.
         RD94 ra41ffff. RD94_11 ra52_11f. RD94_14 ra41ffff.
         RDEMILK ra51ffff. RDEMILK_11 ra51_11f. RE0_11 ra52_11f.
         RE0_14 ra41ffff. RE1 ra51ffff. RE10 ra51ffff.
         RE10_11 ra51_11f. RE10_14 re10_14f. RE11 ra51ffff.
         RE11_11 ra51_11f. RE11_14 re11_14f. RE12 ra51ffff.
         RE12_11 ra51_11f. RE12_14 re12_14f. RE13 ra51ffff.
         RE13_11 ra51_11f. RE13_14 re13_14f. RE14 ra51ffff.
         RE14_11 ra51_11f. RE14_14 re14_14f. RE1B ra51ffff.
         RE1B_11 ra51_11f. RE1B_14 ra51ffff. RE1_11 ra51_11f.
         RE1_14 re1_14ff. RE2 ra51ffff. RE2B ra51ffff.
         RE2B_11 ra51_11f. RE2B_14 re1_14ff. RE2_11 ra51_11f.
         RE2_14 re1_14ff. RE3 ra51ffff. RE3B ra51ffff.
         RE3B_11 ra51_11f. RE3B_14 re1_14ff. RE3_11 ra51_11f.
         RE3_14 re1_14ff. RE4 ra51ffff. RE4B ra51ffff.
         RE4B_11 ra51_11f. RE4B_14 re1_14ff. RE4_11 ra51_11f.
         RE4_14 re1_14ff. RE5 ra51ffff. RE5B ra51ffff.
         RE5B_11 ra51_11f. RE5B_14 re1_14ff. RE5_11 ra51_11f.
         RE5_14 re1_14ff. RE6 ra51ffff. RE610 ra51ffff.
         RE610_11 ra51_11f. RE610_14 re1_14ff. RE62 ra51ffff.
         RE62_11 ra51_11f. RE62_14 re1_14ff. RE63 ra51ffff.
         RE63_11 ra51_11f. RE63_14 re63_14f. RE64 ra51ffff.
         RE64_11 ra51_11f. RE64_14 re64_14f. RE65 ra51ffff.
         RE65_11 ra51_11f. RE65_14 re65_14f. RE67 ra51ffff.
         RE67_11 ra51_11f. RE67_14 re67_14f. RE6B ra51ffff.
         RE6B_11 ra51_11f. RE6B_14 ra51ffff. RE6_11 ra51_11f.
         RE6_14 re1_14ff. RE7 ra51ffff. RE7_11 ra51_11f.
         RE7_14 re7_14ff. RE8 ra51ffff. RE8_11 ra51_11f.
         RE8_14 re8_14ff. RE9 ra51ffff. RE9_11 ra51_11f.
         RE9_14 re9_14ff. RESIDENC residenf. RESIDENC_14 residenf.
         RESID_11 resid_1f. RF1 ra41ffff. RF10 ra41ffff.
         RF101 ra41ffff. RF101_11 ra52_11f. RF101_14 ra41ffff.
         RF102 ra41ffff. RF102_11 ra52_11f. RF102_14 ra41ffff.
         RF1030A_11 ra52_11f. RF1030_11 ra52_11f. RF1031A_11 ra52_11f.
         RF1031_11 ra52_11f. RF1032_11 ra52_11f. RF1033_11 ra52_11f.
         RF103A ra41ffff. RF103A_11 ra52_11f. RF103A_14 ra41ffff.
         RF103B ra41ffff. RF103B_11 ra52_11f. RF103B_14 ra41ffff.
         RF103C ra41ffff. RF103C_11 ra52_11f. RF103C_14 ra41ffff.
         RF103D ra41ffff. RF103D_11 ra52_11f. RF103D_14 ra41ffff.
         RF103E ra41ffff. RF103E_11 ra52_11f. RF103E_14 ra41ffff.
         RF103F ra41ffff. RF103F_11 ra52_11f. RF103F_14 ra41ffff.
         RF103G ra41ffff. RF103G_11 ra52_11f. RF103G_14 ra41ffff.
         RF103H ra41ffff. RF103H_11 ra52_11f. RF103H_14 ra41ffff.
         RF103I ra41ffff. RF103I_11 ra52_11f. RF103I_14 ra41ffff.
         RF103J ra41ffff. RF103J_11 ra52_11f. RF103J_14 ra41ffff.
         RF103K ra41ffff. RF103K_11 ra52_11f. RF103K_14 ra41ffff.
         RF103L ra41ffff. RF103L_11 ra52_11f. RF103L_14 ra41ffff.
         RF103M ra41ffff. RF103M_11 ra52_11f. RF103M_14 ra41ffff.
         RF104_14 ra41ffff. RF105_14 ra41ffff. RF10_11 ra52_11f.
         RF10_14 ra41ffff. RF111 ra51ffff. RF112 ra51ffff.
         RF113 ra51ffff. RF12 ra41ffff. RF12_11 ra52_11f.
         RF12_14 ra41ffff. RF13 ra41ffff. RF13_11 ra52_11f.
         RF13_14 ra41ffff. RF14 ra51ffff. RF14_11 ra51_11f.
         RF14_14 ra51ffff. RF15 ra51ffff. RF15_11 ra51_11f.
         RF15_14 ra51ffff. RF1_14 ra41ffff. RF2 ra41ffff.
         RF21 ra41ffff. RF211 ra41ffff. RF211_11 ra52_11f.
         RF211_14 ra41ffff. RF21_11 ra52_11f. RF21_14 ra41ffff.
         RF22 ra41ffff. RF221_11 ra52_11f. RF221_14 ra41ffff.
         RF22_11 ra52_11f. RF22_14 ra41ffff. RF23 ra41ffff.
         RF23_11 ra52_11f. RF23_14 ra41ffff. RF24_11 ra52_11f.
         RF24_14 ra41ffff. RF25A_14 ra41ffff. RF25B_11 ra52_11f.
         RF25B_14 ra41ffff. RF25_11 ra52_11f. RF26_11 ra52_11f.
         RF26_14 ra41ffff. RF27_11 ra52_11f. RF27_14 ra41ffff.
         RF2_14 ra41ffff. RF31 ra51ffff. RF31_11 ra51_11f.
         RF31_14 ra51ffff. RF32 ra51ffff. RF32_11 ra51_11f.
         RF32_14 ra51ffff. RF33 ra51ffff. RF33_11 ra51_11f.
         RF33_14 ra51ffff. RF34 ra51ffff. RF340 ra51ffff.
         RF340_11 ra51_11f. RF340_14 ra51ffff. RF34_11 ra51_11f.
         RF34_14 ra51ffff. RF35 ra51ffff. RF35_11 ra51_11f.
         RF35_14 ra51ffff. RF41 ra51ffff. RF41A_11 ra52_11f.
         RF41A_14 ra41ffff. RF41B_11 ra52_11f. RF41B_14 ra41ffff.
         RF41_11 ra51_11f. RF41_14 ra51ffff. RF42 ra41ffff.
         RF42_11 ra52_11f. RF42_14 ra41ffff. RF43A ra41ffff.
         RF43A_11 ra52_11f. RF43A_14 ra41ffff. RF43B ra41ffff.
         RF43B_11 ra52_11f. RF43B_14 ra41ffff. RF43C ra41ffff.
         RF43C_11 ra52_11f. RF43C_14 ra41ffff. RF43D ra41ffff.
         RF43D_11 ra52_11f. RF43D_14 ra41ffff. RF44 ra41ffff.
         RF44_11 ra52_11f. RF44_14 ra41ffff. RF45 ra41ffff.
         RF45_11 ra52_11f. RF45_14 ra41ffff. RF46 ra41ffff.
         RF46_11 ra52_11f. RF46_14 ra41ffff. RF47 rd1fffff.
         RF47_11 rd1_11ff. RF47_14 rd1fffff. RF5 ra51ffff.
         RF5_11 ra51_11f. RF5_14 ra51ffff. RF61 ra51ffff.
         RF610 ra51ffff. RF610_11 ra51_11f. RF610_14 ra51ffff.
         RF61_11 ra51_11f. RF61_14 ra51ffff. RF62 ra51ffff.
         RF62_11 ra51_11f. RF62_14 ra51ffff. RF63 ra51ffff.
         RF63_11 ra51_11f. RF63_14 ra51ffff. RF64 ra51ffff.
         RF64_11 ra51_11f. RF64_14 ra51ffff. RF651A ra51ffff.
         RF651A1_11 ra52_11f. RF651A1_14 ra41ffff. RF651A2_11 ra52_11f.
         RF651A2_14 ra41ffff. RF651B ra51ffff. RF651B1_11 ra52_11f.
         RF651B1_14 ra41ffff. RF651B2_11 ra52_11f. RF651B2_14 ra41ffff.
         RF652 ra51ffff. RF6521_11 ra52_11f. RF6521_14 ra41ffff.
         RF652A_11 ra52_11f. RF652A_14 ra41ffff. RF652B_11 ra52_11f.
         RF652B_14 ra41ffff. RF66 ra41ffff. RF66_11 ra52_11f.
         RF66_14 ra41ffff. RF71 ra41ffff. RF71_11 ra52_11f.
         RF71_14 ra41ffff. RF721 ra41ffff. RF721_11 ra52_11f.
         RF721_14 ra41ffff. RF722 ra41ffff. RF722_11 ra52_11f.
         RF722_14 ra41ffff. RF73 ra41ffff. RF73_11 ra52_11f.
         RF73_14 ra41ffff. RF74 ra51ffff. RF74_11 ra51_11f.
         RF74_14 ra51ffff. RF81 ra41ffff. RF81_11 ra52_11f.
         RF81_14 ra41ffff. RF821 ra41ffff. RF821_11 ra52_11f.
         RF821_14 ra41ffff. RF822 ra41ffff. RF822_11 ra52_11f.
         RF822_14 ra41ffff. RF83 ra41ffff. RF83_11 ra52_11f.
         RF83_14 ra41ffff. RF84 ra51ffff. RF84_11 ra51_11f.
         RF84_14 ra51ffff. RF85 ra51ffff. RF85_11 ra51_11f.
         RF85_14 ra51ffff. RF86 ra51ffff. RF86_11 ra51_11f.
         RF86_14 ra51ffff. RF9 ra41ffff. RF901A_11 ra52_11f.
         RF901_11 ra52_11f. RF902A_11 ra52_11f. RF902_11 ra52_11f.
         RF91 ra41ffff. RF91_11 ra52_11f. RF91_14 ra41ffff.
         RF92A ra41ffff. RF92A_11 ra52_11f. RF92A_14 ra41ffff.
         RF92B ra41ffff. RF92B_11 ra52_11f. RF92B_14 ra41ffff.
         RF92C ra41ffff. RF92C_11 ra52_11f. RF92C_14 ra41ffff.
         RF92D ra41ffff. RF92D_11 ra52_11f. RF92D_14 ra41ffff.
         RF92E ra41ffff. RF92E_11 ra52_11f. RF92E_14 ra41ffff.
         RF92F ra41ffff. RF92F_11 ra52_11f. RF92F_14 ra41ffff.
         RF92G ra41ffff. RF92G_11 ra52_11f. RF92G_14 ra41ffff.
         RF92H ra41ffff. RF92H_11 ra52_11f. RF92H_14 ra41ffff.
         RF92I ra41ffff. RF92I_11 ra52_11f. RF92I_14 ra41ffff.
         RF92J ra41ffff. RF92J_11 ra52_11f. RF92J_14 ra41ffff.
         RF9_11 ra52_11f. RG01_11 ra52_11f. RG01_14 ra41ffff.
         RG02 ra51ffff. RG02_11 ra51_11f. RG02_14 ra51ffff.
         RG101 ra51ffff. RG102 ra51ffff. RG1061_11 ra52_11f.
         RG1061_14 ra41ffff. RG1062_11 ra52_11f. RG1062_14 ra41ffff.
         RG1063_11 ra52_11f. RG1063_14 ra41ffff. RG106_11 ra52_11f.
         RG106_14 ra41ffff. RG13 ra51ffff. RG130_11 ra52_11f.
         RG130_14 ra41ffff. RG13_11 ra52_11f. RG13_14 ra51ffff.
         RG14A ra51ffff. RG14A_11 ra51_11f. RG14A_14 ra51ffff.
         RG14B ra51ffff. RG14B_11 ra51_11f. RG14B_14 ra51ffff.
         RG14C ra51ffff. RG14C_11 ra51_11f. RG14C_14 ra51ffff.
         RG15A ra51ffff. RG15B ra51ffff. RG15C ra51ffff.
         RG15D ra51ffff. RG15E ra51ffff. RG15F ra51ffff.
         RG15G ra51ffff. RG15H ra51ffff. RG15I ra51ffff.
         RG15J ra51ffff. RG15K ra51ffff. RG15L ra51ffff.
         RG15M ra51ffff. RG15N ra51ffff. RG15O ra51ffff.
         RG15P ra51ffff. RG15Q ra51ffff. RG15R ra51ffff.
         RG15S ra51ffff. RG15T ra51ffff. RG15U ra51ffff.
         RG15V ra51ffff. RG1_11 ra52_11f. RG1_14 ra41ffff.
         RG21 ra51ffff. RG21_11 ra51_11f. RG21_14 ra51ffff.
         RG22 ra51ffff. RG22_11 ra51_11f. RG22_14 ra51ffff.
         RG23_11 ra52_11f. RG23_14 ra41ffff. RG24A_11 ra52_11f.
         RG24A_14 ra41ffff. RG24_11 ra52_11f. RG24_14 ra41ffff.
         RG25A_11 ra52_11f. RG25A_14 ra41ffff. RG25_11 ra52_11f.
         RG25_14 ra41ffff. RG3 ra51ffff. RG3_11 ra51_11f.
         RG3_14 ra51ffff. RG4 ra51ffff. RG4A_11 ra52_11f.
         RG4A_14 ra41ffff. RG4B_11 ra52_11f. RG4B_14 ra41ffff.
         RG4_11 ra51_11f. RG4_14 ra51ffff. RG51 ra51ffff.
         RG52 ra51ffff. RG5_11 ra52_11f. RG5_14 ra41ffff.
         TYPE typeffff. VAGE_11 yearin_f. YEARIN_11 yearin_f.
    ;
*/

RUN ;
