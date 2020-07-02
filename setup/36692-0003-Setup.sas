/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0003: 2002-2014 LONGITUDINAL DATA, VERSION 1)
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
 | "c:\temp\36692-0003-data.txt").
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
VALUE d11hypef  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d11disef  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(00) no'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cancer' 8='(08) glaucoma, cataracts' 9='(09) prostate tumor'
                10='(10) gynecological diseases' 11='(11) gastric or duodenal ulcer'
                12='(12) parkinson''s disease' 13='(13) bedsore' 14='(14) dementia' 15='(15) psychosis'
                16='(16) neuropathy' 17='(17) arthritis' 18='(18) other' 88='(88) don''t know'
                99='(99) missing';
VALUE d8marryf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 8='(8) don''t know' 9='(9) missing';
VALUE d14licdf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE g15a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE a53a3fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 9='(9) missing';
VALUE g14a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
VALUE c32fffff  0='(0) wrong' 1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE f5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchildren' 8='(08) other relatives' 9='(09) friends and neighbors'
                10='(10) social services' 11='(11) live-in care giver' 12='(12) nobody'
                88='(88) don''t know' 99='(99) missing';
VALUE c22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE e6_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE h21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE f25a1_1f  -1='(-0001) not applicable' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE b11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE a531ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 8='(8) don''t know'
                9='(9) missing';
VALUE g1021_1f  888='(888) don''t know' 999='(999) missing';
VALUE d14carpf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE b121_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE f92a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE f610_14f  -1='(-1) not applicable (not sick)' 1='(1) no money'
                2='(2) far from hospital' 3='(3) inconvenience to travel' 4='(4) nobody to go with'
                5='(5) didn''t want to go' 6='(6) other' 8='(8) do not know' 9='(9) missing';
VALUE f340_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE f103a2_f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE d5painff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) very painful'
                2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful' 5='(5) peaceful'
                6='(6) difficult to say' 9='(9) missing';
VALUE d11contf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE e2_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE d11a53a_2f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE dth08_1f  -9='(-9) lost to follow-up in the 2011/2012 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2011/2012 survey' 1='(1) died before the 2011/2012 survey'
                2='(2) surviving at 2011 survey but died before 2012 survey';
VALUE d5cargif  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children/their spouses' 2='(2) grandchildren/their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social service providers'
                6='(6) nurse/maid' 7='(7) no body ' 8='(8) do not need care' 9='(9) missing';
VALUE d8dplacf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE d11d21bf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE d6a_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE a53a4_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no education' 2='(2) primary school' 3='(3) middle school' 4='(4) high school'
                5='(5) collage or above' 9='(9) missing';
VALUE f64fffff  1='(1) public medicare' 2='(2) self' 3='(3) family and children'
                4='(4) others' 9='(9) missing';
VALUE resid_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) city'
                2='(2) town' 3='(3) rural';
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
VALUE d5incomf  -9='(-0009) lost to follow-up in the 2005 survey'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                99999='(99999) missing';
VALUE a52fffff  -1='(-1) not applicable' 99='(99) missing';
VALUE e67_14ff  -1='(-01) not applicable' 888='(888) not able to answer'
                998='(998) more than 1000' 999='(999) missing';
VALUE d4drug1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE e1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE c31d_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE a537_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) never cooking'
                1='(1) gas: from underground pipes' 2='(2) gas: bottled, tank, or lp' 3='(3) electricity'
                4='(4) fuel oil, kerosene, etc' 5='(5) coal or coke' 6='(6) charcoal'
                7='(7) solar energy' 8='(8) firewood or straw' 9='(9) other';
VALUE b21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE c53a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE d4drug1_2f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE h1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE f64a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE e63_14ff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE c52fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE e1b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 100000 days'
                9999='(9999) missing';
VALUE c54_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE g23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) do not brush'
                1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE h3_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) surprisingly healthy'
                2='(2) relatively healthy' 3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE d14d21bf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know' 9='(9) missing';
VALUE d11g106_2f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) suddenly (over a few days)' 2='(2) over a few months' 3='(3) over a few years'
                8='(8) do not know' 9='(9) missing';
VALUE f35_11ff  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g12_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) can''t turn around'
                99='(99) missing';
VALUE d11vyeaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors';
VALUE d1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) rice' 2='(2) corn(maize)'
                3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat' 5='(5) other'
                9='(9) missing';
VALUE g83_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE a41fffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian'
                36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) henan'
                44='(44) guangdong' 45='(45) guangxi' 46='(46) hainan' 50='(50) chongqing'
                51='(51) sichuan' 52='(52) guizhou' 53='(53) yunnan' 54='(54) tibet' 61='(61) shaanxi'
                62='(62) gansu' 63='(63) qinghai' 64='(64) ningxia' 65='(65) xinjiang' 71='(71) taiwan'
                81='(81) hong kong' 90='(90) north korea' 91='(91) south korea' 92='(92) berman'
                93='(93) indonesia' 94='(94) japan' 95='(95) vietnam' 96='(96) others'
                98='(98) don''t know' 99='(99) missing';
VALUE c55fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE e6b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d14g4aff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE d14vyeaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors';
VALUE d11g102f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE d11mon1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE f46_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE d5contff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in continence' 2='(2) partially independent in continence'
                3='(3) fully dependent in continence' 9='(9) missing';
VALUE a54affff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE e4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d8uncdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE f12affff  -1='(-0001) not applicable' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g1062_1_1f  1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE d11bedrf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE f64i_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE d5dirdaf  -9='(-09) lost to follow-up in the 2005 survey'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 999='(999) missing';
VALUE d11vdayf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE f5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchildren' 8='(08) other relatives' 9='(09) friends and neighbors'
                10='(10) social services' 11='(11) live-in care giver' 12='(12) nobody'
                88='(88) don''t know' 99='(99) missing';
VALUE d5sexfff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
VALUE f31_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE g13fffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE d5dreamf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                3='(3) do not know' 9='(9) missing';
VALUE d11g23ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE d5causef  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) malignant tumor (cancer)' 2='(02) cardiovascular disease (cvd)'
                3='(03) heart disease' 4='(04) respiratory diseases' 5='(05) injury or poison'
                6='(06) endocrine, nutritional, metabolic, or immune'
                7='(07) urinary or reproductive diseases' 8='(08) dementia or psychosis'
                9='(09) neuropathy' 10='(10) tuberculosis (tb)' 11='(11) infectious diseases (except tb)'
                12='(12) accident' 13='(13) digestive disease' 14='(14) other' 88='(88) do not know'
                99='(99) missing';
VALUE d5vmontf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 99='(99) missing';
VALUE h22_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE d11a535f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE b28_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE a54b_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE d5medicf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 9='(9) missing';
VALUE d11painf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE f31fffff  1='(1) pension' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relatives' 6='(6) local government' 7='(7) work by self' 8='(8) others';
VALUE d11inspf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE d5generf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 9='(9) missing';
VALUE f103a5__1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE a530_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                8='(8) don''t know' 9='(9) missing';
VALUE d31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) quite often' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f92a2fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
                9='(9) missing';
VALUE d5didayf  -9='(-009) lost to follow-up in the 2005 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 9999='(9999) missing';
VALUE g11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE h22fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE v_bthyrf  9999='(9999) missing';
VALUE a52_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE a54a_5ff  -9='(-009) lost to follow-up in the 2005 survey'
                -6='(-006) survivors only, not applicable to the deceased persons'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g83_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE g1063_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) suddenly (over a few days)'
                2='(2) over a few months' 3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d5batdaf  -9='(-009) lost to follow-up in the 2005 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE e1ffffff  1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE d8painff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) very painful'
                2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful' 5='(5) peaceful'
                6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE g6ffffff  1='(1) regular' 2='(2) irregular' 9='(9) missing';
VALUE d11beddf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE g1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see' 4='(4) blind'
                8='(8) don''t know' 9='(9) missing';
VALUE f652_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(00) UNDOCUMENTED CODE'
                1='(01) public free medical services' 2='(02) collective medical services'
                3='(03) state and collective subsidies' 4='(04) medical insurance' 5='(05) self'
                6='(06) spouse' 7='(07) children' 8='(08) no money to pay' 9='(09) others'
                99='(99) missing';
VALUE g15v2fff  -1='(-1) not applicable (male)' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE g83fffff  1='(1) only left arm' 2='(2) only right arm' 3='(3) two arms'
                4='(4) neither left nor right arm' 9='(9) missing';
VALUE c54_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE f31_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE g102c_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                998='(998) more than 1000' 999='(999) missing';
VALUE d91_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE g4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 9='(9) missing';
VALUE f5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(01) spouse'
                2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law'
                6='(06) son and daughter' 7='(07) grandchildren' 8='(08) other relatives'
                9='(09) friends and neighbors' 10='(10) social services' 11='(11) live-in care giver'
                12='(12) nobody' 99='(99) missing';
VALUE g12_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) can''t turn around' 99='(99) missing';
VALUE d14g4fff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f41a12_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) do not know'
                99='(99) missing';
VALUE g01_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE c55_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE a532_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE e1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
VALUE f22fffff  -1='(-001) not applicable' 9999='(9999) missing';
VALUE d11retif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) retired (worker) '
                2='(2) retired (cadre) ' 3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE b21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE d8wcfacf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE d31fffff  1='(1) almost everyday' 2='(2) except winter' 3='(3) occasionally'
                4='(4) rarely or never' 9='(9) missing';
VALUE f111a_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(00) spouse'
                1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) do not know' 99='(99) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE f46_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE d8generf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 9='(9) missing';
VALUE g15a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE f16_14ff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                8='(8) do not know' 9='(9) missing';
VALUE e66_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE e1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
VALUE re1_14ff  0='(0) without proxy';
VALUE e62_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 5='(5) don''t know' 9='(9) missing';
VALUE d14doctf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE d8whopaf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE d85_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 9='(9) missing';
VALUE d5whopaf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE f43a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE f64i_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE f61fffff  1='(1) yes' 2='(2) no' 3='(3)  not sick recently' 9='(9) missing';
VALUE h5_14fff  888='(888) don''t know';
VALUE d77_14ff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE d5dresff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in dressing' 2='(2) partially independent in dressing'
                3='(3) fully dependent in dressing' 9='(9) missing';
VALUE a53a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE e3_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE d31_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) quite often' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE e5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2)  occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE f1031b3f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                0='(000) UNDOCUMENTED CODE' 888='(888) do not know' 999='(999) missing';
VALUE a53a2_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE h3_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
VALUE f92a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g511_14f  888='(888) do not know' 999='(999) missing';
VALUE f12a_5ff  -9='(-0009) lost to follow-up in the 2005 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE e7ffffff  1='(1) yes' 2='(2) a little difficult' 3='(3) not able to do so'
                9='(9) missing';
VALUE relatypf  -1='(-1) not applicable' 1='(1) full sibling' 2='(2) half sibling'
                3='(3) adopted sibling' 4='(4) others' 9='(9) missing';
VALUE d8didayf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) do not know' 9998='(9998) more than 10000 days'
                9999='(9999) missing';
VALUE f47_14ff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) do not know' 9='(9) missing';
VALUE f47_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE d11yr1ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE a542_14f  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) rice and wheat' 5='(5) other';
VALUE d11g4fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f1033_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who live in other village/district/city' 8='(8) not able to answer'
                9='(9) missing';
VALUE c32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) can''t use pen to draw the figure'
                9='(9) not able to do this (disabled)';
VALUE a535_14f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE g9ffffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                9='(9) missing';
VALUE h1ffffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite using hearing aid' 4='(4) no' 9='(9) missing';
VALUE c22_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                -1='(-1) not applicable, i.e.,repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE d14a533f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE e62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE rd1_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) without proxy'
                1='(1) with proxy';
VALUE f64a_14f  0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 9='(9) missing';
VALUE d5vyearf  -9='(-009) lost to follow-up in the 2005 survey'
                -7='(-007) the deceased persons only, not applicable to survivors' 9999='(9999) missing';
VALUE g81_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE a54a_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE f21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE g7_11fff  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                999='(999) missing';
VALUE a2ffffff  1='(1) han' 2='(2) hui' 3='(3) zhuang' 4='(4) yao' 5='(5) korea'
                6='(6) man' 7='(7) mongolia' 8='(8) others' 9='(9) missing';
VALUE d4meat2f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                9='(9) missing';
VALUE d91_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE f103a7ff  -2='(-2) 1998 or 2000 interviewees, not asked in 2002'
                -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE c16_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) not able to answer' 99='(99) missing';
VALUE b210_14f  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE d11whopf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE f2ffffff  0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) staff/service workers/industrial workers' 3='(3) self-employed '
                4='(4) personnel in agriculture fishery forestry animal husbandry' 5='(5) housework'
                6='(6) military personnel' 7='(7) unemployed' 8='(8) others' 9='(9) missing';
VALUE a53a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE f46_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE g4a_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e2_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE b21_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) always'
                2='(2) often' 3='(3) sometimes' 4='(4) seldom' 5='(5) never' 8='(8) not able to answer'
                9='(9) missing';
VALUE d14dplaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE f221_14f  88888='(88888) do not know' 99999='(99999) missing';
VALUE d4b_14ff  1='(1) Green tea' 2='(2) Red tea (black tea)' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE d11a53a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d5marryf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer';
VALUE dth05_0f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2008 survey' 1='(1) died before the 2008 survey';
VALUE d11dplaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE f340_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) make decisions on almost all spending in household'
                2='(2) make decisions on own and small other spending in household'
                3='(3) make decisions on almost all spending in household'
                4='(4) can''t make decisions on any spending ' 5='(5) don''t know' 9='(9) missing';
VALUE g15c1_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9) missing';
VALUE f12c_14f  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE c31d_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to do' 9='(9) missing';
VALUE g9_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
VALUE d1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat'
                5='(5) other' 9='(9) missing';
VALUE e610_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) do not know' 99='(99) missing';
VALUE f45_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE ra51_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE f64e1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d11carpf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE d14d26a_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE g23_14ff  0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day'
                3='(3) twice a day' 4='(4) three or more times a day ' 8='(8) do not know'
                9='(9) not applicable (no teeth)';
VALUE d11a53af  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g15a3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 9='(9) missing';
VALUE a532_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE f47_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no'
                3='(3) not sick (only for the elderly from 1998 & 2000  waves)'
                8='(8) did not answer (only for the 2002 new-added)' 9='(9) missing';
VALUE d5bedrif  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                9='(9) missing';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d8dirdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE f151_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE e1b_8fff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 100000 days'
                9999='(9999) missing';
VALUE d11a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE a54b_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE d4a_14ff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE g4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f103a5ff  -1='(-1) not applicable' 0='(0) coresident with the elderly'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d14knddf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE e62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE c16fffff  88='(88) not able to answer';
VALUE f41_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE a52_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                99='(99) missing';
VALUE a53a1_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) died or lost to follow-up in previous waves' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d6c_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 9='(9) missing';
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE b121_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE e6b_8fff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE rd1_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) without proxy'
                1='(1) with proxy';
VALUE a542_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE d14g4bff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE g6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) regular' 2='(2) irregular'
                8='(8) do not know' 9='(9) missing';
VALUE g1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) can see and distinguish'
                2='(2) can see only' 3='(3) can''t see' 4='(4) blind' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE e2_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE e64_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) do not know' 9='(9) missing';
VALUE d14contf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE d11batdf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE f1032_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who is not in corsidence with me but live in the sa'
                8='(8) not able to answer' 9='(9) missing';
VALUE a532ffff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE h21_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE g14a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(00) UNDOCUMENTED CODE' 1='(01) hypertension' 2='(02) diabetes'
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
VALUE d12_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 99='(99) missing';
VALUE f92a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE f2_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture, forestry, animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE f41_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d11a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE d5residf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE e64_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE e1b_5fff  -9='(-009) lost to follow-up in the 2005 survey'
                -6='(-006) survivors only, not applicable to the deceased persons'
                -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE g511_11f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) don''t know'
                999='(999) missing';
VALUE g1062_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4) seldom'
                5='(5) never' 8='(8) not able to answer';
VALUE d5beddaf  -9='(-009) lost to follow-up in the 2005 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE e62_14ff  -1='(-1) not applicable' 1='(1) willing to do' 2='(2) without patience'
                3='(3) need respite care' 4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE a53a1fff  -1='(-1) not applicable' 0='(0) spouse' 1='(1) child'
                2='(2) spouse of child' 3='(3) grandchild' 4='(4) spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE a537_14f  0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE e3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE d85_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f41fffff  1='(1) currently married and living with spouse' 2='(2) separated'
                3='(3)  divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE f25b1_1f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE ra2fffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d14hypef  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a53a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE f103l2_f  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
                8='(8) don''t know' 9='(9) missing';
VALUE b210_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) all day long'
                2='(2) most of the day' 3='(3) about half of the day' 4='(4) less than half of the day'
                8='(8) not able to answer' 9='(9) missing';
VALUE a53a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d8cargif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children/their spouses' 2='(2) grandchildren/their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social service providers'
                6='(6) nurse/maid' 7='(7) no body ' 8='(8) do not need care' 9='(9) missing';
VALUE f6521_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE h1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE f111a_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(00) spouse' 1='(01) son'
                2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d71_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE d8contff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE e3_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
VALUE a531_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE e63_8fff  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g14a1_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 1='(001) hypertension' 2='(002) diabetes'
                3='(003) heart diseases' 4='(004) stroke, cvd'
                5='(005)  bronchitis, emphysema, asthma, pneumonia' 6='(006) pulmonary tuberculosis'
                7='(007) cataract' 8='(008) glaucoma' 9='(009) cancer' 10='(010) prostate tumor'
                11='(011)  gastric or duodenal ulcer' 12='(012) parkinson''s disease' 13='(013) bedsore'
                14='(014) arthritis' 15='(015) dementia' 160='(160) other'
                161='(161) diseases difficult to classify' 164='(164) psychosis' 165='(165) orthopedic'
                166='(166) internal medical disease' 167='(167) dermatosis'
                168='(168) five organs disease' 169='(169) gynecological disease' 888='(888) don''t know'
                999='(999) missing';
VALUE g1063_1_1f  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE g132_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE g131_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE d5licdof  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 9='(9) missing';
VALUE f111a_1_1f  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE e610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) not able to answer' 99='(99) missing';
VALUE d33_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) vegetable grease'
                2='(2) gingili grease' 3='(3) lard' 4='(4) other animal''s fat' 8='(8) don''t know'
                9='(9) missing';
VALUE f66fffff  1='(1) yes' 2='(2) no'
                3='(3) not sick (only for the elderly from previous waves)'
                8='(8) did not answer (only for the 2002 new-added)' 9='(9) missing';
VALUE a53a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE a51fffff  1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution'
                9='(9) missing';
VALUE f85_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d8batdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE f32a_14f  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 88='(88) do not know' 99='(99) missing';
VALUE f103a2__1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE a533_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d14smokf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE e1b_14ff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 100000 days' 9999='(9999) missing';
VALUE c55_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE resid_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) city' 2='(2) town'
                3='(3) rural';
VALUE d11incof  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d5dplacf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE f43a2_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a53a4_1_1f  -1='(-1) not applicable' 0='(0) no education'
                1='(1) attend school but not graduated from primary school' 2='(2) primary school'
                3='(3) middle school' 4='(4) high school' 5='(5) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE f21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE d8persof  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE c53a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to do' 9='(9) missing';
VALUE f221_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' 88888='(88888) do not know'
                99999='(99999) missing';
VALUE rd12_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0)  without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d75_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d6afffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE d76_14ff  1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE g1061_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) left' 2='(2) right'
                3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE d8hyperf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE dth02_0f  -9='(-9) lost to follow-up at the 2005 wave'
                0='(0) surviving at the 2005 survey' 1='(1) died before the 2005 survey';
VALUE f16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE h71_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE d11retpf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE f85_14ff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE g15n3a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) do not know'
                9='(9) missing';
VALUE f45_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE ra52ffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                9='(9) missing';
VALUE f43a4_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE f6521_1_1f  1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE f27_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) not worth'
                2='(2) not necessary' 3='(3) cannot afford to the payment' 8='(8) do not know'
                9='(9) missing';
VALUE d11finaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relative''s' 6='(6) state/local govenments or collectives' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE f35_8fff  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE e64_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE f64a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE e63_11ff  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) not able to answer' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE a53b3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE a542_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                9='(9) missing';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
VALUE a51_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE f27_14ff  1='(1) not worth' 2='(2) not necessary'
                3='(3) cannot afford to the payment' 8='(8) do not know' 9='(9) missing';
VALUE e610_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) not able to answer' 99='(99) missing';
VALUE a535_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9) missing';
VALUE g102c_1_1f  888='(888) do not know' 998='(998) more than 1000' 999='(999) missing';
VALUE f901b1_f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE a540_14f  1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE provffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang' 31='(31) shanghai'
                32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi'
                37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) henan' 44='(44) guangdong'
                45='(45) guangxi' 50='(50) chongqing' 51='(51) sichuan' 61='(61) shaanxi';
VALUE d11a53a_3f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE g4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE rd1fffff  0='(0) without proxy' 1='(1) with proxy';
VALUE g9_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without using hands'
                2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d14g102f  -9='(-09) lost to follow-up in the 2014 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE d5carpaf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 9='(9) missing';
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse'
                2='(2) child or spouse of children' 3='(3) grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver' 8='(8) others' 9='(9) missing';
VALUE d14bedrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d2ffffff  88='(88) don''t know' 99='(99) missing';
VALUE d6cfffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 9='(9) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                9='(9) missing';
VALUE a541_5ff  -9='(-009) lost to follow-up in the 2005 survey'
                -6='(-006) survivors only, not applicable to the deceased persons'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE g11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11insuf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE a52_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE g14a2_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden all the year around' 999='(999) missing';
VALUE e0_14fff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE d75_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE f43a4fff  -1='(-1) not applicable' 1='(1) good' 2='(2) so so' 3='(3) bad'
                8='(8) don''t know' 9='(9) missing';
VALUE d14cargf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body' 9='(9) do not need care';
VALUE d4milk1f  1='(1) almost everyday' 2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d8knddrf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE g1061_1_1f  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE e5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE f45_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE c22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE b28_14ff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d5bathff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
VALUE f251_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d14bathf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE d14wcfaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE a534_14f  8888='(8888) do not know' 9999='(9999) missing';
VALUE g4a_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE d14a535f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE e6ffffff  1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding'
                9='(9) missing';
VALUE month_5f  -9='(-9) lost to follow-up at the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons';
VALUE f651a_5f  -9='(-0009) lost to follow-up in the 2005 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g15c3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE b11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE f35fffff  99998='(99998) more than 100000' 99999='(99999) missing';
VALUE h21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE f71fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE yearin_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased';
VALUE e67_8fff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE d5respof  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) parent'
                1='(1) spouse' 2='(2) child' 3='(3) spouse of a child'
                4='(4) grandchild or spouse of a grandchild' 5='(5) relative' 6='(6) neighbor'
                7='(7) social worker' 8='(8) other' 9='(9) missing';
VALUE f62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) UNDOCUMENTED CODE' 8='(8) didn''t answer' 9='(9) missing';
VALUE g51fffff  999='(999) missing';
VALUE f84_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE e610_14f  -1='(-1) not applicable' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchild(ren)' 8='(08) other relative(s)' 9='(09) neighbors'
                10='(10) social services' 11='(11) housekeeper' 12='(12) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE h1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without hearing aid'
                2='(2) yes, but needs hearing aid' 3='(3) partly, despite hearing aid' 4='(4) no'
                9='(9) missing';
VALUE d8doctof  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE ra52_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE g511_8ff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' 888='(888) don''t know'
                999='(999) missing';
VALUE d14g106_1f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE g4b_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE d11g4aff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE f651a1__1f  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g9_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE h22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE c11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to answer' 9='(9) missing';
VALUE f141_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE d8illfff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d8vdayff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE d14a537f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE f41a12__1f  88='(88) do not know' 99='(99) missing';
VALUE d8carpaf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) medical insurance' 2='(02) self' 3='(03) spouse' 4='(04) children/grandchildren'
                5='(05) state or collectives' 6='(06) others' 88='(88) don''t know' 99='(99) missing';
VALUE f141_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE d11marrf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d8sexfff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
VALUE h71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE c521ffff  -1='(-1) not applicable' 9='(9) missing';
VALUE d5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE resic_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural';
VALUE f43a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE f103a6ff  -2='(-2) 1998 or 2000 interviewees, not asked in 2002'
                -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE f652_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) public free medical services' 2='(02) cooperative medical scheme'
                3='(03) state and collective subsidies' 4='(04) medical insurance' 5='(05) self'
                6='(06) spouse' 7='(07) children' 8='(08) no money to pay' 9='(09) others'
                99='(99) missing';
VALUE d34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) insipidity' 2='(2) salty'
                3='(3) sweet' 4='(4) hot' 5='(5) crude' 6='(6) do not have all the above tastes'
                8='(8) don''t know' 9='(9) missing';
VALUE a533_14f  1='(1) detached house' 2='(2) duplex/triplex'
                3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d8medcof  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE e67_11ff  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE d14marrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE g132_14f  88='(88) bedridden all the year around' 99='(99) missing';
VALUE a51_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) with household member(s)'
                2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE d78a_14f  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE d8bedrif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE f41_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE d33_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) vegetable grease'
                2='(2) gingili grease' 3='(3) lard' 4='(4) other animal''s fat' 8='(8) don''t know'
                9='(9) missing';
VALUE g11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE f610_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                -1='(-1) not applicable (not sick)' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience in movement' 4='(4) nobody to go with' 5='(5) didn''t want to go'
                6='(6) other' 9='(9) missing';
VALUE f651a1_f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE a534_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) do not know'
                9999='(9999) missing';
VALUE d14d26af  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4) spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d8livarf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and/or grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and/or offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE f34fffff  1='(1) very rich' 2='(2) richer' 3='(3) fair' 4='(4) poorer'
                5='(5) very poor' 8='(8) didn''t answer' 9='(9) missing';
VALUE e67_5fff  -9='(-09) lost to follow-up in the 2005 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE a53a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d8incomf  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f92a5_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE g14a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
VALUE d14painf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE f16_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (/with spouse)and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE e7_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE f34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
VALUE d5toilff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in toileting' 2='(2) partially independent in toileting'
                3='(3) fully dependent in toileting' 9='(9) missing';
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g131_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE a531_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 9='(9) missing';
VALUE ra51_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE g14a2fff  -1='(-01) not applicable' 888='(888) bedridden all the year around'
                999='(999) missing';
VALUE d78a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d11genef  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE f610_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                -1='(-1) not applicable (not sick)' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience to travel' 4='(4) nobody to go with' 5='(5) didn''t want to go'
                6='(6) other' 9='(9) missing';
VALUE g15c2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE d4meat2_1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f12a_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE h3ffffff  1='(1) surprisingly healthy' 2='(2) relatively healthy'
                3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE f31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE d5feedff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in eating' 2='(2) partially independent in eating'
                3='(3) fully dependent in eating' 9='(9) missing';
VALUE d5doctof  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 9='(9) missing';
VALUE a54bffff  -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE d76_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) within 5 minutes'
                2='(2) 6-30 minutes' 3='(3) 31-60 minutes' 4='(4) after 60 minutes' 8='(8) do not know '
                9='(9) missing';
VALUE a530_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                9='(9) missing';
VALUE g15a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE f65fffff  -1='(-1) not applicable' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience in movement' 4='(4) nobody to go with'
                5='(5) don''t want to go to hospital (2002)' 6='(6) others' 9='(9) missing';
VALUE c32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) can''t use pen to draw the figure' 9='(9) not able to do this (disabled)';
VALUE f103c6_f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(00) UNDOCUMENTED CODE' 88='(88) don''t know' 99='(99) missing';
VALUE d11bathf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE c22fffff  -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three objects correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE a540_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE e63_5fff  -9='(-0009) lost to follow-up in the 2005 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) do not know' 99999='(99999) missing';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer';
VALUE g15n1a__1f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
VALUE b121ffff  1='(1) much better' 2='(2) a little better' 3='(3) no change'
                4='(4) a little worse' 5='(5) much worse' 6='(6) not able to answer'
                8='(8) not able to answer' 9='(9) missing';
VALUE d85_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE g6_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) regular'
                2='(2) irregular' 9='(9) missing';
VALUE d14tapwf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE d11a537f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE f5ffffff  0='(00) spouse' 1='(01) son and his spouse'
                2='(02) daughter and her spouse' 3='(03) son and daughter'
                4='(04) grandchildren and their spouses' 5='(05) other relatives'
                6='(06) friends/neighbors' 7='(07) social service' 8='(08) matron' 9='(09) nobody'
                99='(99) missing';
VALUE a541_14f  -1='(-001) not applicable' 8888='(8888) don''t know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE d5medcof  -9='(-0009) lost to follow-up in the 2005 survey'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) do not know' 99999='(99999) missing';
VALUE ra52_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d31_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 9='(9) missing';
VALUE f340_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE g01_14ff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE d5moveff  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in indoor transferring'
                2='(2) partially independent in indoor transferring'
                3='(3) fully dependent in indoor transferring' 9='(9) missing';
VALUE d11g106_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE e7_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE f141_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE d11didaf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d14vdayf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE ra52_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d4meat1f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                8='(8) don''t know' 9='(9) missing';
VALUE d5smktif  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                99='(99) missing';
VALUE d11knddf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE a542_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE c11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE a54a_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE g01_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE f111ffff  0='(0) spouse' 1='(1) sons and their spouses'
                2='(2) daughters and their spouse' 3='(3) son and daughter'
                4='(4) grandchildren and their spouse' 5='(5) other relatives' 6='(6) friends/neighbors'
                7='(7) social workers' 8='(8) matron' 9='(9) no';
VALUE d8smktif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE g15a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d8bathff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE f92a2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d11a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE e6b_14ff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE f103a8_f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE g14b1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) uterine tumor'
                22='(22) hepatitis' 23='(23) other'
                66='(66) natural senescence without reporting any disease' 88='(88) don''t know'
                99='(99) missing';
VALUE a532_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) missing';
VALUE a53a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE g15a1_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9) missing';
VALUE d11doctf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE g13_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(00) no serious illness' 88='(88) bedridden all the year around' 99='(99) missing';
VALUE f64a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE g51_5fff  -9='(-09) lost to follow-up in the 2005 survey'
                -6='(-06) survivors only, not applicable to the deceased persons' 999='(999) missing';
VALUE rd12_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0)  without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE g11fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE d34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) insipidity'
                2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE d14dresf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000'
                3='(3) elder first interviewed in 2002  to replace those lost to fo'
                4='(4) newly added elder in 2002' 5='(5) siblings age 80+ of 1,2,3,4';
VALUE d77_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) at much less risk'
                2='(2) at less risk' 3='(3) at the same risk' 4='(4) at higher risk'
                5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE g81fffff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 9='(9) missing';
VALUE d11livaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home '
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE f62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) didn''t answer' 9='(9) missing';
VALUE a53a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) UNDOCUMENTED CODE' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE e65_14ff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) not able to answer' 9='(9) missing';
VALUE e65_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE g15n1a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9)  missing';
VALUE e4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE h3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) surprisingly healthy'
                2='(2) relatively healthy' 3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE d11affff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE f84_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d11illff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE a51_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE d5wcfacf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 9='(9) missing';
VALUE f92a5fff  -1='(-1) not applicable' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE g15f3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE month_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 99='(99) missing';
VALUE d11licdf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE d8beddaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE a54b_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE g4b_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE d8finanf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE g15n3a__1f  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE h71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE a530_14f  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 8='(8) don''t know' 9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE f34_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
VALUE f45fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) staff/service workers/industrial workers' 3='(3) self-employed '
                4='(4) personnel in agriculture fishery forestry animal husbandry' 5='(5) housework'
                6='(6) military personnel' 7='(7) unemployed' 8='(8) others' 9='(9) missing';
VALUE f103a5_f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) co-reside with the sampled elder' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE g4ffffff  1='(1) right hand' 2='(2) left hand' 9='(9) missing';
VALUE f43a2fff  -1='(-1) not applicable' 1='(1) married' 2='(2) divorced' 3='(3) widowed'
                8='(8) don''t know' 9='(9) missing';
VALUE d33_14ff  1='(1) vegetable grease' 2='(2) gingili grease' 3='(3) lard'
                4='(4) other animal''s fat' 8='(8) don''t know' 9='(9) missing';
VALUE c55_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE d14g106_3f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) suddenly (over a few days)' 2='(2) over a few months' 3='(3) over a few years'
                8='(8) do not know' 9='(9) missing';
VALUE d5finanf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE d71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE dth11_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2014 survey' 1='(1) died before the 2014 survey';
VALUE d11payif  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                8888='(08888) don''t know' 9998='(09998) more than 10000' 9999='(09999) missing'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d11wcfaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE d5knddrf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 9='(9) missing';
VALUE a540_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) don''t own house/apartment but want to separate from children'
                4='(4) easy contact with other older persons' 5='(5) others' 9='(9) missing';
VALUE f23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE d11resif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE h22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE d4mt2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
VALUE e4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d14dreaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE d5livarf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE f23_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE e65_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE d11marr_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE f12a_8ff  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                -1='(-0001) not applicable' 88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g12_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) can''t turn around'
                99='(99) missing';
VALUE d5pcgdaf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE a531_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE b121_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE e3ffffff  1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE d11dreaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE f92a5_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE f35_5fff  -9='(-0009) lost to follow-up in the 2005 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE c54_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE g15a1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know' 9='(9)  missing';
VALUE d5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE d1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat'
                5='(5) other' 9='(9) missing';
VALUE e6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE a541_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE e1afffff  -1='(-1) not applicable' 1='(01) spouse' 2='(02) son'
                3='(03) spouse of son' 4='(04) daughter' 5='(05) spouse of daughter'
                6='(06) son and daughter together' 7='(07) grandchildren' 8='(08) other family members'
                9='(09) social services' 10='(10) matron' 11='(11) none' 99='(99) missing';
VALUE d11g4bff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE monthinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 99='(99) missing';
VALUE g15p1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know';
VALUE f103l5_f  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d11g106f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE c11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE f211_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, retired as a normally retiree' 2='(2) yes, retired as a high officer'
                3='(3) no' 9='(9) missing';
VALUE g14a1fff  -1='(-01) not applicable' 1='(001) hypertension' 2='(002) diabetes'
                3='(003) heart diseases' 4='(004) stroke, cvd'
                5='(005) bronchitis, emphysema, asthma, pneumonia' 6='(006) pulmonary tuberculosis'
                7='(007) cataract' 8='(008) glaucoma' 9='(009) cancer' 10='(010) prostate tumor'
                11='(011) gastric or duodenal ulcer' 12='(012) parkinson''s disease' 13='(013) bedsore'
                14='(014) arthritis' 15='(015) dementia' 16='(016) other'
                66='(066) natural senescence without reporting any disease' 89='(089) don''t know'
                99='(099) missing' 160='(160) other' 161='(161) disease difficult to classify'
                164='(164) mental disease' 165='(165) orthopedic disease'
                166='(166) internal medical disease' 167='(167) dermatosis'
                168='(168) five organs diseases' 169='(169) gynecological disease';
VALUE f92a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE a43fffff  1='(1) urban' 2='(2) rural' 9='(9) missing';
VALUE e0_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, strongly limited'
                2='(2) yes, limited' 3='(3) not limited' 8='(8) do not know' 9='(9) missing';
VALUE e5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE v_bthmof  99='(99) missing';
VALUE f141_14f  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE f25b1_1_1f  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE g1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see' 4='(4) blind'
                9='(9) missing';
VALUE vage_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons';
VALUE d14g106f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE g14a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
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
VALUE d8licdof  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE f610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable (not sick)'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconvenience to travel'
                4='(4) nobody to go with' 5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE f103a5__2f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE g83_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                9='(9) missing';
VALUE d34_14ff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE f34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very rich' 2='(2) rich'
                3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE a53b3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE g15a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE f46_14ff  -1='(-1) not applicable' 1='(1) yes full time' 2='(2) yes part time'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE d4drug1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a53a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE d5diseaf  -9='(-9) lost to follow-up in the 2005 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05) bronchitis, emphysema, asthma,  pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cancer' 8='(08) cataract or glaucoma' 9='(09) prostate tumor'
                10='(10) gynecological disease' 11='(11) gastric or duodenal ulcer'
                12='(12) parkinson''s disease' 13='(13) bedsore' 14='(14) dementia' 15='(15) psychosis'
                16='(16) neurosis' 17='(17) arthritis' 18='(18) other' 88='(88) don''t know'
                99='(99) missing';
VALUE a53a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 9='(9) missing';
VALUE f71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d14livaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home'
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE g01_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE d71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE f651a_8f  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g132_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE f43a2_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE e7_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE d11medcf  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f340_14f  0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 8='(8) do not know' 9='(9) missing';
VALUE g15f3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d11a533f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE ra51_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE d8residf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE a541_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE e64_14ff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children and their spouses' 4='(4) grandchildren and their spouses'
                5='(5) public and collectives' 6='(6) others' 8='(8) not able to answer' 9='(9) missing';
VALUE f43a2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE e6_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE g81_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know'
                9='(9) missing';
VALUE c16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) not able to answer'
                99='(99) missing';
VALUE g81_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right hand' 2='(2) left hand'
                3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE d11medif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) was not sick' 8='(8) do not know' 9='(9) missing';
VALUE a530_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                8='(8) don''t know' 9='(9) missing';
VALUE d4meat2_2f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d8dreamf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                3='(3) do not know' 8='(8) don''t know' 9='(9) missing';
VALUE g15v1fff  -1='(-1) not applicable (male)' 1='(1) yes' 2='(2) no' 3='(3) don''t know';
VALUE d11noinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) not worth' 2='(2) not necessary' 3='(3) cannot afford to pay' 4='(4) not sure'
                8='(8) do not know' 9='(9) missing';
VALUE d6a_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE e65_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) do not know'
                9='(9) missing';
VALUE g1ffffff  1='(1) can see and distinguish the break in the circle'
                2='(2) can see but not distinguish the break in the circle' 3='(3) cannot see'
                4='(4) blind' 9='(9) missing';
VALUE d11cargf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body ' 9='(9) do not need care';
VALUE d8diseaf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                0='(00) no' 1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases'
                4='(04) stroke, cvd' 5='(05)  bronchitis, emphysema, asthma, pneumonia'
                6='(06) pulmonary tuberculosis' 7='(07) cancer' 8='(08) glaucoma, cataracts'
                9='(09) prostate tumor' 10='(10) gynecological diseases'
                11='(11) gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) dementia' 15='(15) psychosis' 16='(16) neuropathy' 17='(17) arthritis'
                18='(18) other' 88='(88) don''t know' 99='(99) missing';
VALUE d8medicf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 8='(8) don''t know' 9='(9) missing';
VALUE f111a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) spouse' 1='(01) son'
                2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d14genef  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE b11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE c16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) not able to answer'
                99='(99) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0003;
INFILE "&VERSION\DS0003\36692-0003-Data.txt" LRECL=9262;
INPUT
       ID 1-8                  MONTH02 9-10
        DAY02 11-12             V_BTHYR 13-16           V_BTHMON 17-18
        PROV 19-20              TYPE 21                 RELATYPE 22-23
        RESIDENC 24             TRUEAGE 25-27           A1 28
        RA2 29                  A2 30                   RA41 31
        A41 32-33               RA42 34                 A42 35
        RA43 36                 A43 37                  RA51 38
        A51 39                  RA52 40-41              A52 42-43
        RA53A 44-45             A53A1 46-47             A53A2 48-50
        A53A3 51-52             RA53B 53-54             A53B1 55-56
        A53B2 57-59             A53B3 60-61             RA53C 62-63
        A53C1 64-65             A53C2 66-68             A53C3 69-70
        RA53D 71-72             A53D1 73-74             A53D2 75-77
        A53D3 78-79             RA53E 80-81             A53E1 82-83
        A53E2 84-86             A53E3 87-88             RA53F 89-90
        A53F1 91-92             A53F2 93-95             A53F3 96-97
        RA53G 98-99             A53G1 100-101           A53G2 102-104
        A53G3 105-106           RA53H 107-108           A53H1 109-110
        A53H2 111-113           A53H3 114-115           RA53I 116-117
        A53I1 118-119           A53I2 120-122           A53I3 123-124
        RA53J 125-126           A53J1 127-128           A53J2 129-131
        A53J3 132-133           RA53K 134-135           A53K1 136-137
        A53K2 138-140           A53K3 141-142           RA53L 143-144
        A53L1 145-146           A53L2 147-149           A53L3 150-151
        RA531 152-153           A531 154-155            RA532 156-157
        A532 158-159            RA54 160-161            A54A 162-165
        A54B 166-167            B11 168                 B12 169
        B121 170                B21 171                 B22 172
        B23 173                 B24 174                 B25 175
        B26 176                 B27 177                 C11 178
        C12 179                 C13 180                 C131 181
        C14 182                 C15 183                 C16 184-185
        C161 186                C162 187                C163 188
        C21A 189                C21B 190                C21C 191
        C22 192-193             C31A 194                C31B 195
        C31C 196                C31D 197                C31E 198
        C32 199                 C41A 200                C41B 201
        C41C 202                C51A 203                C51B 204
        C52 205                 C521 206-207            C53A 208
        C53B 209                C53C 210                C54 211
        C55 212-213             RD1 214                 D1 215
        RD2 216                 D2 217-218              RD31 219
        D31 220                 RD32 221                D32 222
        RD4MEAT 223             D4MEAT1 224             D4MEAT2 225
        RD4FISH 226             D4FISH1 227             D4FISH2 228
        RD4EGG 229              D4EGG1 230              D4EGG2 231
        RD4BEAN 232             D4BEAN1 233             D4BEAN2 234
        RD4VEG 235              D4VEG1 236              D4VEG2 237
        RD4SUGA 238             D4SUGA1 239             D4SUGA2 240
        RD4TEA 241              D4TEA1 242              D4TEA2 243
        RD4GARL 244             D4GARL1 245             D4GARL2 246
        RD5 247                 D5 248                  RD6 249
        D6A 250                 D6B 251                 D6C 252
        RD71 253                D71 254                 RD72 255
        D72 256                 RD73 257-258            D73 259-261
        RD74 262-263            D74 264-266             RD75 267-268
        D75 269-270             RD81 271                D81 272
        RD82 273                D82 274                 RD83 275-276
        D83 277-279             RD84 280-281            D84 282-284
        RD85 285-286            D85 287-288             RD86 289-290
        D86 291-292             RD91 293                D91 294
        RD92 295-296            D92 297                 RD93 298-299
        D93 300-302             RD94 303-304            D94 305-307
        RD101 308               D101 309                RD102 310-311
        D102 312-314            RD103 315-316           D103 317-319
        RD11A 320               D11A 321                RD11B 322
        D11B 323                RD11C 324               D11C 325
        RD11D 326               D11D 327                RD11E 328
        D11E 329                RD11F 330               D11F 331
        RD11G 332               D11G 333                RD11H 334
        D11H 335                RD11I 336               D11I 337
        RD12 338                D12 339-340             RE1 341
        E1 342                  RE1A 343-344            E1A 345-346
        RE2 347                 E2 348                  RE2A 349-350
        E2A 351-352             RE3 353                 E3 354
        RE3A 355-356            E3A 357-358             RE4 359
        E4 360                  RE4A 361-362            E4A 363-364
        RE5 365                 E5 366                  RE5A 367-368
        E5A 369-370             RE6 371                 E6 372
        RE6A 373-374            E6A 375-376             RE7 377
        E7 378                  RE8 379                 E8 380
        RE9 381                 E9 382                  RE10 383
        E10 384                 RE11 385                E11 386
        RE12 387                E12 388                 RE13 389
        E13 390                 RE14 391                E14 392
        RF1 393                 F1 394-395              RF2 396
        F2 397                  RF21 398-399            F21 400
        RF211 401-402           F211 403-404            RF22 405-406
        F22 407-410             RF23 411-412            F23 413-414
        RF31 415                F31 416                 RF32 417
        F32 418-422             RF33 423                F33 424
        RF34 425                F34 426                 RF35 427
        F35 428-432             RF41 433                F41 434
        RF42 435-436            F42 437-438             RF43A 439-440
        F43A1 441-443           F43A2 444-445           F43A3 446-448
        F43A4 449-450           RF43B 451-452           F43B1 453-455
        F43B2 456-457           F43B3 458-460           F43B4 461-462
        RF43C 463-464           F43C1 465-467           F43C2 468-469
        F43C3 470-472           F43C4 473-474           RF43D 475-476
        F43D1 477-479           F43D2 480-481           F43D3 482-484
        F43D4 485-486           RF44 487-488            F44 489-490
        RF45 491-492            F45 493-494             RF5 495
        F5 496-497              RF61 498                F61 499
        RF62 500                F62 501                 RF63 502
        F63 503                 RF64 504                F64 505
        RF65 506-507            F65 508-509             RF66 510-511
        F66 512                 RF71 513-514            F71 515
        RF721 516-517           F721 518-521            RF722 522-523
        F722 524-526            RF73 527-528            F73 529-531
        RF81 532                F81 533                 RF821 534-535
        F821 536-538            RF822 539-540           F822 541-543
        RF83 544-545            F83 546-548             RF84 549
        F84 550                 RF9 551                 F9 552-553
        RF91 554                F91 555-556             RF92A 557-558
        F92A1 559-560           F92A2 561-562           F92A3 563-564
        F92A4 565-567           F92A5 568-569           F92A6 570-571
        RF92B 572-573           F92B1 574-575           F92B2 576-577
        F92B3 578-579           F92B4 580-582           F92B5 583-584
        F92B6 585-586           RF92C 587-588           F92C1 589-590
        F92C2 591-592           F92C3 593-594           F92C4 595-597
        F92C5 598-599           F92C6 600-601           RF92D 602-603
        F92D1 604-605           F92D2 606-607           F92D3 608-609
        F92D4 610-612           F92D5 613-614           F92D6 615-616
        RF92E 617-618           F92E1 619-620           F92E2 621-622
        F92E3 623-624           F92E4 625-627           F92E5 628-629
        F92E6 630-631           RF92F 632-633           F92F1 634-635
        F92F2 636-637           F92F3 638-639           F92F4 640-642
        F92F5 643-644           F92F6 645-646           RF92G 647-648
        F92G1 649-650           F92G2 651-652           F92G3 653-654
        F92G4 655-657           F92G5 658-659           F92G6 660-661
        RF92H 662-663           F92H1 664-665           F92H2 666-667
        F92H3 668-669           F92H4 670-672           F92H5 673-674
        F92H6 675-676           RF92I 677-678           F92I1 679-680
        F92I2 681-682           F92I3 683-684           F92I4 685-687
        F92I5 688-689           F92I6 690-691           RF92J 692-693
        F92J1 694-695           F92J2 696-697           F92J3 698-699
        F92J4 700-702           F92J5 703-704           F92J6 705-706
        RF92K 707-708           F92K1 709-710           F92K2 711-712
        F92K3 713-714           F92K4 715-717           F92K5 718-719
        F92K6 720-721           RF10 722                F10 723-724
        RF101 725-726           F101 727-728            RF102 729-730
        F102 731-732            RF103A 733-734          F103A1 735-736
        F103A2 737-738          F103A3 739-741          F103A4 742-743
        F103A7 744-745          F103A6 746-747          F103A5 748-749
        RF103B 750-751          F103B1 752-753          F103B2 754-755
        F103B3 756-758          F103B4 759-760          F103B7 761-762
        F103B6 763-764          F103B5 765-766          RF103C 767-768
        F103C1 769-770          F103C2 771-772          F103C3 773-775
        F103C4 776-777          F103C7 778-779          F103C6 780-781
        F103C5 782-783          RF103D 784-785          F103D1 786-787
        F103D2 788-789          F103D3 790-792          F103D4 793-794
        F103D7 795-796          F103D6 797-798          F103D5 799-800
        RF103E 801-802          F103E1 803-804          F103E2 805-806
        F103E3 807-809          F103E4 810-811          F103E7 812-813
        F103E6 814-815          F103E5 816-817          RF103F 818-819
        F103F1 820-821          F103F2 822-823          F103F3 824-826
        F103F4 827-828          F103F7 829-830          F103F6 831-832
        F103F5 833-834          RF103G 835-836          F103G1 837-838
        F103G2 839-840          F103G3 841-843          F103G4 844-845
        F103G7 846-847          F103G6 848-849          F103G5 850-851
        RF103H 852-853          F103H1 854-855          F103H2 856-857
        F103H3 858-860          F103H4 861-862          F103H7 863-864
        F103H6 865-866          F103H5 867-868          RF103I 869-870
        F103I1 871-872          F103I2 873-874          F103I3 875-877
        F103I4 878-879          F103I7 880-881          F103I6 882-883
        F103I5 884-885          RF103J 886-887          F103J1 888-889
        F103J2 890-891          F103J3 892-894          F103J4 895-896
        F103J7 897-898          F103J6 899-900          F103J5 901-902
        RF103K 903-904          F103K1 905-906          F103K2 907-908
        F103K3 909-911          F103K4 912-913          F103K7 914-915
        F103K6 916-917          F103K5 918-919          RF104 920-921
        F104 922-924            RF105 925-926           F105 927-929
        RF111 930               F111 931                RF112 932
        F112 933                RF113 934               F113 935
        RF12 936-937            F12A 938-942            F12B 943-947
        RF13 948-949            F13A 950-954            F13B 955-959
        G1 960                  G21 961-962             G22 963
        G3 964                  G4 965                  G51 966-968
        G52 969-971             G6 972                  G7 973-975
        G81 976                 G82 977                 G83 978
        G9 979                  RG101 980               G101 981-983
        G102A 984-986           G102B 987-989           G11 990
        G12 991-992             RG13 993                G13 994-995
        G14A1 996-998           G14A2 999-1001          G14B1 1002-1004
        G14B2 1005-1007         G14C1 1008-1010         G14C2 1011-1013
        G15A1 1014              G15A2 1015              G15A3 1016-1017
        G15B1 1018              G15B2 1019              G15B3 1020-1021
        G15C1 1022              G15C2 1023              G15C3 1024-1025
        G15D1 1026              G15D2 1027              G15D3 1028-1029
        G15E1 1030              G15E2 1031              G15E3 1032-1033
        G15F1 1034              G15F2 1035              G15F3 1036-1037
        G15G1 1038              G15G2 1039              G15G3 1040-1041
        G15H1 1042              G15H2 1043              G15H3 1044-1045
        G15I1 1046              G15I2 1047              G15I3 1048-1049
        G15J1 1050              G15J2 1051              G15J3 1052-1053
        G15K1 1054              G15K2 1055              G15K3 1056-1057
        G15L1 1058              G15L2 1059              G15L3 1060-1061
        G15M1 1062              G15M2 1063              G15M3 1064-1065
        G15N1 1066              G15N2 1067              G15N3 1068-1069
        G15O1 1070              G15O2 1071              G15O3 1072-1073
        G15P1 1074              G15P2 1075              G15P3 1076-1077
        G15Q1 1078              G15Q2 1079              G15Q3 1080-1081
        G15R1 1082              G15R2 1083              G15R3 1084-1085
        G15S1 1086              G15S2 1087              G15S3 1088-1089
        G15T1 1090              G15T2 1091              G15T3 1092-1093
        G15U1 1094              G15U2 1095              G15U3 1096-1097
        G15V1 1098-1099         G15V2 1100-1101         G15V3 1102-1103
        G15W1 1104              G15W2 1105              G15W3 1106-1107
        H1 1108                 H21 1109                H22 1110-1111
        H3 1112                 H6 1113                 H7 1114
        H71 1115-1116           H8 1117                 W_2002 1118-1132 .13
        DTH02_05 1133-1134      MONTH_5 1135-1136       DAY_5 1137-1138
        RESID_5 1139-1140       VAGE_5 1141-1143        RA51_5 1144-1145
        A51_5 1146-1147         RA52_5 1148-1149        A52_5 1150-1151
        RA53A_5 1152-1153       A53A1_5 1154-1155       A53A2_5 1156-1158
        A53A3_5 1159-1160       A53A4_5 1161-1162       RA53B_5 1163-1164
        A53B1_5 1165-1166       A53B2_5 1167-1169       A53B3_5 1170-1171
        A53B4_5 1172-1173       RA53C_5 1174-1175       A53C1_5 1176-1177
        A53C2_5 1178-1180       A53C3_5 1181-1182       A53C4_5 1183-1184
        RA53D_5 1185-1186       A53D1_5 1187-1188       A53D2_5 1189-1191
        A53D3_5 1192-1193       A53D4_5 1194-1195       RA53E_5 1196-1197
        A53E1_5 1198-1199       A53E2_5 1200-1202       A53E3_5 1203-1204
        A53E4_5 1205-1206       RA53F_5 1207-1208       A53F1_5 1209-1210
        A53F2_5 1211-1213       A53F3_5 1214-1215       A53F4_5 1216-1217
        RA53G_5 1218-1219       A53G1_5 1220-1221       A53G2_5 1222-1224
        A53G3_5 1225-1226       A53G4_5 1227-1228       RA53H_5 1229-1230
        A53H1_5 1231-1232       A53H2_5 1233-1235       A53H3_5 1236-1237
        A53H4_5 1238-1239       RA53I_5 1240-1241       A53I1_5 1242-1243
        A53I2_5 1244-1246       A53I3_5 1247-1248       A53I4_5 1249-1250
        RA53J_5 1251-1252       A53J1_5 1253-1254       A53J2_5 1255-1257
        A53J3_5 1258-1259       A53J4_5 1260-1261       RA53K_5 1262-1263
        A53K1_5 1264-1265       A53K2_5 1266-1268       A53K3_5 1269-1270
        A53K4_5 1271-1272       RA53L_5 1273-1274       A53L1_5 1275-1276
        A53L2_5 1277-1279       A53L3_5 1280-1281       A53L4_5 1282-1283
        RA530_5 1284-1285       A530_5 1286-1287        RA531_5 1288-1289
        A531_5 1290-1291        RA532_5 1292-1293       A532_5 1294-1295
        RA540_5 1296-1297       A540_5 1298-1299        RA541_5 1300-1301
        A541_5 1302-1305        RA542_5 1306-1307       A542_5 1308-1309
        RA54_5 1310-1311        A54A_5 1312-1315        A54B_5 1316-1317
        B11_5 1318-1319         B12_5 1320-1321         B121_5 1322-1323
        B21_5 1324-1325         B22_5 1326-1327         B23_5 1328-1329
        B24_5 1330-1331         B25_5 1332-1333         B26_5 1334-1335
        B27_5 1336-1337         C11_5 1338-1339         C12_5 1340-1341
        C13_5 1342-1343         C14_5 1344-1345         C15_5 1346-1347
        C16_5 1348-1349         C21A_5 1350-1351        C21B_5 1352-1353
        C21C_5 1354-1355        C22_5 1356-1357         C31A_5 1358-1359
        C31B_5 1360-1361        C31C_5 1362-1363        C31D_5 1364-1365
        C31E_5 1366-1367        C32_5 1368-1369         C41A_5 1370-1371
        C41B_5 1372-1373        C41C_5 1374-1375        C51A_5 1376-1377
        C51B_5 1378-1379        C52_5 1380-1381         C53A_5 1382-1383
        C53B_5 1384-1385        C53C_5 1386-1387        C54_5 1388-1389
        C55_5 1390-1391         RD1_5 1392-1393         D1_5 1394-1395
        RD2_5 1396-1397         D2_5 1398-1399          RD31_5 1400-1401
        D31_5 1402-1403         RD32_5 1404-1405        D32_5 1406-1407
        RD4MT_5 1408-1409       D4MT2_5 1410-1411       RD4FSH_5 1412-1413
        D4FSH2_5 1414-1415      RD4EGG_5 1416-1417      D4EGG2_5 1418-1419
        RD4BEN_5 1420-1421      D4BEN2_5 1422-1423      RD4VEG_5 1424-1425
        D4VEG2_5 1426-1427      RD4SUG_5 1428-1429      D4SUG2_5 1430-1431
        RD4TEA_5 1432-1433      D4TEA2_5 1434-1435      RD4GAR_5 1436-1437
        D4GAR2_5 1438-1439      RD5_5 1440-1441         D5_5 1442-1443
        RD6_5 1444-1445         D6C_5 1446-1447         RD71_5 1448-1449
        D71_5 1450-1451         RD72_5 1452-1453        D72_5 1454-1455
        RD73_5 1456-1457        D73_5 1458-1460         RD74_5 1461-1462
        D74_5 1463-1465         RD75_5 1466-1467        D75_5 1468-1469
        RD81_5 1470-1471        D81_5 1472-1473         RD82_5 1474-1475
        D82_5 1476-1477         RD83_5 1478-1479        D83_5 1480-1482
        RD84_5 1483-1484        D84_5 1485-1487         RD85_5 1488-1489
        D85_5 1490-1491         RD86_5 1492-1493        D86_5 1494-1495
        RD91_5 1496-1497        D91_5 1498-1499         RD92_5 1500-1501
        D92_5 1502-1503         RD93_5 1504-1505        D93_5 1506-1508
        RD94_5 1509-1510        D94_5 1511-1513         RD101_5 1514-1515
        D101_5 1516-1517        RD102_5 1518-1519       D102_5 1520-1522
        RD103_5 1523-1524       D103_5 1525-1527        RD11A_5 1528-1529
        D11A_5 1530-1531        RD11B_5 1532-1533       D11B_5 1534-1535
        RD11C_5 1536-1537       D11C_5 1538-1539        RD11D_5 1540-1541
        D11D_5 1542-1543        RD11E_5 1544-1545       D11E_5 1546-1547
        RD11F_5 1548-1549       D11F_5 1550-1551        RD11G_5 1552-1553
        D11G_5 1554-1555        RD11H_5 1556-1557       D11H_5 1558-1559
        RD12_5 1560-1561        D12_5 1562-1563         RE1_5 1564-1565
        E1_5 1566-1567          RE1B_5 1568-1569        E1B_5 1570-1573
        RE2_5 1574-1575         E2_5 1576-1577          RE2B_5 1578-1579
        E2B_5 1580-1583         RE3_5 1584-1585         E3_5 1586-1587
        RE3B_5 1588-1589        E3B_5 1590-1593         RE4_5 1594-1595
        E4_5 1596-1597          RE4B_5 1598-1599        E4B_5 1600-1603
        RE5_5 1604-1605         E5_5 1606-1607          RE5B_5 1608-1609
        E5B_5 1610-1613         RE6_5 1614-1615         E6_5 1616-1617
        RE6B_5 1618-1619        E6B_5 1620-1623         RE610_5 1624-1625
        E610_5 1626-1627        RE62_5 1628-1629        E62_5 1630-1631
        RE63_5 1632-1633        E63_5 1634-1638         RE64_5 1639-1640
        E64_5 1641-1642         RE65_5 1643-1644        E65_5 1645-1646
        RE66_5 1647-1648        E66_5 1649-1650         RE67_5 1651-1652
        E67_5 1653-1655         RE7_5 1656-1657         E7_5 1658-1659
        RE8_5 1660-1661         E8_5 1662-1663          RE9_5 1664-1665
        E9_5 1666-1667          RE10_5 1668-1669        E10_5 1670-1671
        RE11_5 1672-1673        E11_5 1674-1675         RE12_5 1676-1677
        E12_5 1678-1679         RE13_5 1680-1681        E13_5 1682-1683
        RE14_5 1684-1685        E14_5 1686-1687         RF211_5 1688-1689
        F211_5 1690-1691        RF22_5 1692-1693        F22_5 1694-1697
        RF23_5 1698-1699        F23_5 1700-1701         RF31_5 1702-1703
        F31_5 1704-1705         RF32_5 1706-1707        F32A_5 1708-1709
        F32B_5 1710-1711        F32C_5 1712-1713        F32D_5 1714-1715
        F32E_5 1716-1717        RF33_5 1718-1719        F33_5 1720-1721
        RF340_5 1722-1723       F340_5 1724-1725        RF34_5 1726-1727
        F34_5 1728-1729         RF35_5 1730-1731        F35_5 1732-1736
        RF41_5 1737-1738        F41_5 1739-1740         RF42_5 1741-1742
        F42_5 1743-1744         RF43A_5 1745-1746       F43A1_5 1747-1749
        F43A2_5 1750-1751       F43A3_5 1752-1754       F43A4_5 1755-1756
        RF43B_5 1757-1758       F43B1_5 1759-1761       F43B2_5 1762-1763
        F43B3_5 1764-1766       F43B4_5 1767-1768       RF43C_5 1769-1770
        F43C1_5 1771-1773       F43C2_5 1774-1775       F43C3_5 1776-1778
        F43C4_5 1779-1780       RF43D_5 1781-1782       F43D1_5 1783-1785
        F43D2_5 1786-1787       F43D3_5 1788-1790       F43D4_5 1791-1792
        RF44_5 1793-1794        F44_5 1795-1796         RF45_5 1797-1798
        F45_5 1799-1800         RF46_5 1801-1802        F46_5 1803-1804
        RF5_5 1805-1806         F5_5 1807-1808          RF61_5 1809-1810
        F61_5 1811-1812         RF610_5 1813-1814       F610_5 1815-1816
        RF64_5 1817-1818        F64A_5 1819-1820        F64B_5 1821-1822
        F64C_5 1823-1824        F64D_5 1825-1826        F64E_5 1827-1828
        F64F_5 1829-1830        F64G_5 1831-1832        F64H_5 1833-1834
        F64I_5 1835-1836        RF651A_5 1837-1838      F651A_5 1839-1843
        RF651B_5 1844-1845      F651B_5 1846-1850       RF652_5 1851-1852
        F652_5 1853-1854        RF71_5 1855-1856        F71_5 1857-1858
        RF721_5 1859-1860       F721_5 1861-1863        RF722_5 1864-1865
        F722_5 1866-1868        RF73_5 1869-1870        F73_5 1871-1873
        RF74_5 1874-1875        F74_5 1876-1877         RF81_5 1878-1879
        F81_5 1880-1881         RF821_5 1882-1883       F821_5 1884-1886
        RF822_5 1887-1888       F822_5 1889-1891        RF83_5 1892-1893
        F83_5 1894-1896         RF85_5 1897-1898        F85_5 1899-1900
        RF86_5 1901-1902        F86_5 1903-1904         RF9_5 1905-1906
        F9A_5 1907-1908         RF92A_5 1909-1910       F92A1_5 1911-1912
        F92A2_5 1913-1914       F92A3_5 1915-1916       F92A4_5 1917-1919
        F92A5_5 1920-1921       F92A6_5 1922-1923       RF92B_5 1924-1925
        F92B1_5 1926-1927       F92B2_5 1928-1929       F92B3_5 1930-1931
        F92B4_5 1932-1934       F92B5_5 1935-1936       F92B6_5 1937-1938
        RF92C_5 1939-1940       F92C1_5 1941-1942       F92C2_5 1943-1944
        F92C3_5 1945-1946       F92C4_5 1947-1949       F92C5_5 1950-1951
        F92C6_5 1952-1953       RF92D_5 1954-1955       F92D1_5 1956-1957
        F92D2_5 1958-1959       F92D3_5 1960-1961       F92D4_5 1962-1964
        F92D5_5 1965-1966       F92D6_5 1967-1968       RF92E_5 1969-1970
        F92E1_5 1971-1972       F92E2_5 1973-1974       F92E3_5 1975-1976
        F92E4_5 1977-1979       F92E5_5 1980-1981       F92E6_5 1982-1983
        RF92F_5 1984-1985       F92F1_5 1986-1987       F92F2_5 1988-1989
        F92F3_5 1990-1991       F92F4_5 1992-1994       F92F5_5 1995-1996
        F92F6_5 1997-1998       RF92G_5 1999-2000       F92G1_5 2001-2002
        F92G2_5 2003-2004       F92G3_5 2005-2006       F92G4_5 2007-2009
        F92G5_5 2010-2011       F92G6_5 2012-2013       RF92H_5 2014-2015
        F92H1_5 2016-2017       F92H2_5 2018-2019       F92H3_5 2020-2021
        F92H4_5 2022-2024       F92H5_5 2025-2026       F92H6_5 2027-2028
        RF92I_5 2029-2030       F92I1_5 2031-2032       F92I2_5 2033-2034
        F92I3_5 2035-2036       F92I4_5 2037-2039       F92I5_5 2040-2041
        F92I6_5 2042-2043       RF92J_5 2044-2045       F92J1_5 2046-2047
        F92J2_5 2048-2049       F92J3_5 2050-2051       F92J4_5 2052-2054
        F92J5_5 2055-2056       F92J6_5 2057-2058       RF92K_5 2059-2060
        F92K1_5 2061-2062       F92K2_5 2063-2064       F92K3_5 2065-2066
        F92K4_5 2067-2069       F92K5_5 2070-2071       F92K6_5 2072-2073
        RF103A_5 2074-2075      F103A6_5 2076-2077      F103A8_5 2078-2079
        F103A1_5 2080-2081      F103A2_5 2082-2083      F103A3_5 2084-2086
        F103A4_5 2087-2088      F103A7_5 2089-2090      F103A5_5 2091-2092
        RF103B_5 2093-2094      F103B6_5 2095-2096      F103B8_5 2097-2098
        F103B1_5 2099-2100      F103B2_5 2101-2102      F103B3_5 2103-2105
        F103B4_5 2106-2107      F103B7_5 2108-2109      F103B5_5 2110-2111
        RF103C_5 2112-2113      F103C6_5 2114-2115      F103C8_5 2116-2117
        F103C1_5 2118-2119      F103C2_5 2120-2121      F103C3_5 2122-2124
        F103C4_5 2125-2126      F103C7_5 2127-2128      F103C5_5 2129-2130
        RF103D_5 2131-2132      F103D6_5 2133-2134      F103D8_5 2135-2136
        F103D1_5 2137-2138      F103D2_5 2139-2140      F103D3_5 2141-2143
        F103D4_5 2144-2145      F103D7_5 2146-2147      F103D5_5 2148-2149
        RF103E_5 2150-2151      F103E6_5 2152-2153      F103E8_5 2154-2155
        F103E1_5 2156-2157      F103E2_5 2158-2159      F103E3_5 2160-2162
        F103E4_5 2163-2164      F103E7_5 2165-2166      F103E5_5 2167-2168
        RF103F_5 2169-2170      F103F6_5 2171-2172      F103F8_5 2173-2174
        F103F1_5 2175-2176      F103F2_5 2177-2178      F103F3_5 2179-2181
        F103F4_5 2182-2183      F103F7_5 2184-2185      F103F5_5 2186-2187
        RF103G_5 2188-2189      F103G6_5 2190-2191      F103G8_5 2192-2193
        F103G1_5 2194-2195      F103G2_5 2196-2197      F103G3_5 2198-2200
        F103G4_5 2201-2202      F103G7_5 2203-2204      F103G5_5 2205-2206
        RF103H_5 2207-2208      F103H6_5 2209-2210      F103H8_5 2211-2212
        F103H1_5 2213-2214      F103H2_5 2215-2216      F103H3_5 2217-2219
        F103H4_5 2220-2221      F103H7_5 2222-2223      F103H5_5 2224-2225
        RF103I_5 2226-2227      F103I6_5 2228-2229      F103I8_5 2230-2231
        F103I1_5 2232-2233      F103I2_5 2234-2235      F103I3_5 2236-2238
        F103I4_5 2239-2240      F103I7_5 2241-2242      F103I5_5 2243-2244
        RF103J_5 2245-2246      F103J6_5 2247-2248      F103J8_5 2249-2250
        F103J1_5 2251-2252      F103J2_5 2253-2254      F103J3_5 2255-2257
        F103J4_5 2258-2259      F103J7_5 2260-2261      F103J5_5 2262-2263
        RF103K_5 2264-2265      F103K6_5 2266-2267      F103K8_5 2268-2269
        F103K1_5 2270-2271      F103K2_5 2272-2273      F103K3_5 2274-2276
        F103K4_5 2277-2278      F103K7_5 2279-2280      F103K5_5 2281-2282
        RF103L_5 2283-2284      F103L6_5 2285-2286      F103L8_5 2287-2288
        F103L1_5 2289-2290      F103L2_5 2291-2292      F103L3_5 2293-2295
        F103L4_5 2296-2297      F103L7_5 2298-2299      F103L5_5 2300-2301
        RF103M_5 2302-2303      F103M6_5 2304-2305      F103M8_5 2306-2307
        F103M1_5 2308-2309      F103M2_5 2310-2311      F103M3_5 2312-2314
        F103M4_5 2315-2316      F103M7_5 2317-2318      F103M5_5 2319-2320
        RF111_5 2321-2322       F111A_5 2323-2324       F111B_5 2325-2326
        F111C_5 2327-2328       RF112_5 2329-2330       F112A_5 2331-2332
        F112B_5 2333-2334       F112C_5 2335-2336       RF113_5 2337-2338
        F113A_5 2339-2340       F113B_5 2341-2342       F113C_5 2343-2344
        RF12_5 2345-2346        F12A_5 2347-2351        F12B_5 2352-2356
        F12C_5 2357-2361        RF13_5 2362-2363        F13A_5 2364-2368
        F13B_5 2369-2373        F13C_5 2374-2378        RF14_5 2379-2380
        F141_5 2381-2382        F142_5 2383-2384        F143_5 2385-2386
        F144_5 2387-2388        F145_5 2389-2390        F146_5 2391-2392
        F147_5 2393-2394        F148_5 2395-2396        F149_5 2397-2398
        RF15_5 2399-2400        F151_5 2401-2402        F152_5 2403-2404
        F153_5 2405-2406        F154_5 2407-2408        F155_5 2409-2410
        F156_5 2411-2412        F157_5 2413-2414        F158_5 2415-2416
        F159_5 2417-2418        F16_5 2419-2420         RG01_5 2421-2422
        G01_5 2423-2424         RG02_5 2425-2426        G02_5 2427-2428
        G1_5 2429-2430          G21_5 2431-2432         G22_5 2433-2434
        G3_5 2435-2436          G4_5 2437-2438          G51_5 2439-2441
        G52_5 2442-2444         G6_5 2445-2446          G7_5 2447-2449
        G81_5 2450-2451         G82_5 2452-2453         G83_5 2454-2455
        G9_5 2456-2457          G101_5 2458-2460        G102_5 2461-2463
        G11_5 2464-2465         G12_5 2466-2467         RG130_5 2468-2469
        G130_5 2470-2471        RG13_5 2472-2473        G13_5 2474-2475
        RG14A_5 2476-2477       G14A1_5 2478-2480       G14A2_5 2481-2483
        RG14B_5 2484-2485       G14B1_5 2486-2488       G14B2_5 2489-2491
        RG14C_5 2492-2493       G14C1_5 2494-2496       G14C2_5 2497-2499
        G15A1_5 2500-2501       G15A2_5 2502-2503       G15A3_5 2504-2505
        G15B1_5 2506-2507       G15B2_5 2508-2509       G15B3_5 2510-2511
        G15C1_5 2512-2513       G15C2_5 2514-2515       G15C3_5 2516-2517
        G15D1_5 2518-2519       G15D2_5 2520-2521       G15D3_5 2522-2523
        G15E1_5 2524-2525       G15E2_5 2526-2527       G15E3_5 2528-2529
        G15F1_5 2530-2531       G15F2_5 2532-2533       G15F3_5 2534-2535
        G15G1_5 2536-2537       G15G2_5 2538-2539       G15G3_5 2540-2541
        G15H1_5 2542-2543       G15H2_5 2544-2545       G15H3_5 2546-2547
        G15I1_5 2548-2549       G15I2_5 2550-2551       G15I3_5 2552-2553
        G15J1_5 2554-2555       G15J2_5 2556-2557       G15J3_5 2558-2559
        G15K1_5 2560-2561       G15K2_5 2562-2563       G15K3_5 2564-2565
        G15L1_5 2566-2567       G15L2_5 2568-2569       G15L3_5 2570-2571
        G15M1_5 2572-2573       G15M2_5 2574-2575       G15M3_5 2576-2577
        G15N1_5 2578-2579       G15N2_5 2580-2581       G15N3_5 2582-2583
        G15O1_5 2584-2585       G15O2_5 2586-2587       G15O3_5 2588-2589
        G15P1_5 2590-2591       G15P2_5 2592-2593       G15P3_5 2594-2595
        G15Q1_5 2596-2597       G15Q2_5 2598-2599       G15Q3_5 2600-2601
        G15R1_5 2602-2603       G15R2_5 2604-2605       G15R3_5 2606-2607
        G15S1_5 2608-2609       G15S2_5 2610-2611       G15S3_5 2612-2613
        G15T1_5 2614-2615       G15T2_5 2616-2617       G15T3_5 2618-2619
        G15U1_5 2620-2621       G15U2_5 2622-2623       G15U3_5 2624-2625
        G15V1_5 2626-2627       G15V2_5 2628-2629       G15V3_5 2630-2631
        G15W1_5 2632-2633       G15W2_5 2634-2635       G15W3_5 2636-2637
        H1_5 2638-2639          H21_5 2640-2641         H22_5 2642-2643
        H3_5 2644-2645          H6_5 2646-2647          H7_5 2648-2649
        H71_5 2650-2651         D5VYEAR 2652-2655       D5VMONTH 2656-2657
        D5VDAY 2658-2659        D5MTHIN 2660-2661       D5DAYIN 2662-2663
        D5SEX 2664-2665         D5RESID 2666-2667       D5RESPON 2668-2669
        D5MARRY 2670-2671       D5LIVARR 2672-2673      D5PERSON 2674-2675
        D5GENER 2676-2677       D5DPLACE 2678-2679      D5CAUSE 2680-2681
        D5CARGIV 2682-2683      D5PCGDAY 2684-2685      D5BEDRID 2686-2687
        D5BEDDAY 2688-2691      D5ILL 2692-2693         D5DISEA1 2694-2695
        D5DIDAY1 2696-2699      D5DISEA2 2700-2701      D5DIDAY2 2702-2705
        D5DISEA3 2706-2707      D5DIDAY3 2708-2711      D5MEDICA 2712-2713
        D5FINANC 2714-2715      D5INCOME 2716-2720      D5WCFACI 2721-2722
        D5TAPWAT 2723-2724      D5BATHFA 2725-2726      D5HEATER 2727-2728
        D5TVSET 2729-2730       D5WASHMA 2731-2732      D5PHONE 2733-2734
        D5DOCTOR 2735-2736      D5LICDOC 2737-2738      D5WHOPAY 2739-2740
        D5MEDCOS 2741-2745      D5POCKET 2746-2750      D5BATHFU 2751-2752
        D5BATDAY 2753-2756      D5DRESFU 2757-2758      D5DREDAY 2759-2762
        D5TOILFU 2763-2764      D5TOIDAY 2765-2768      D5MOVEFU 2769-2770
        D5MOVDAY 2771-2774      D5CONTFU 2775-2776      D5CONDAY 2777-2780
        D5FEEDFU 2781-2782      D5FEEDAY 2783-2786      D5FULLDA 2787-2790
        D5CARCST 2791-2795      D5DIRCST 2796-2800      D5CARPAY 2801-2802
        D5OUTDOR 2803-2806      D5ACTDAY 2807-2810      D5SMOKE 2811-2812
        D5SMKTIM 2813-2814      D5DRINK 2815-2816       D5KNDDRK 2817-2818
        D5DRKMCH 2819-2820      D5ADVDIR 2821-2822      D5DIRDAY 2823-2825
        D5DREAM 2826-2827       D5PAIN 2828-2829        D5UNCONS 2830-2831
        D5UNCDAY 2832-2834      DTH05_08 2835-2836      YEAR_8 2837-2840
        MONTH_8 2841-2842       DAY_8 2843-2844         RESID_8 2845-2846
        VAGE_8 2847-2849        RA51_8 2850-2851        A51_8 2852-2853
        RA52_8 2854-2855        A52_8 2856-2857         RA53A_8 2858-2859
        A53A1_8 2860-2861       A53A3_8 2862-2863       A53A2_8 2864-2866
        A53A4_8 2867-2868       RA53B_8 2869-2870       A53B1_8 2871-2872
        A53B3_8 2873-2874       A53B2_8 2875-2877       A53B4_8 2878-2879
        RA53C_8 2880-2881       A53C1_8 2882-2883       A53C3_8 2884-2885
        A53C2_8 2886-2888       A53C4_8 2889-2890       RA53D_8 2891-2892
        A53D1_8 2893-2894       A53D3_8 2895-2896       A53D2_8 2897-2899
        A53D4_8 2900-2901       RA53E_8 2902-2903       A53E1_8 2904-2905
        A53E3_8 2906-2907       A53E2_8 2908-2910       A53E4_8 2911-2912
        RA53F_8 2913-2914       A53F1_8 2915-2916       A53F3_8 2917-2918
        A53F2_8 2919-2921       A53F4_8 2922-2923       RA53G_8 2924-2925
        A53G1_8 2926-2927       A53G3_8 2928-2929       A53G2_8 2930-2932
        A53G4_8 2933-2934       RA53H_8 2935-2936       A53H1_8 2937-2938
        A53H3_8 2939-2940       A53H2_8 2941-2943       A53H4_8 2944-2945
        RA53I_8 2946-2947       A53I1_8 2948-2949       A53I3_8 2950-2951
        A53I2_8 2952-2954       A53I4_8 2955-2956       RA53J_8 2957-2958
        A53J1_8 2959-2960       A53J11_8 $2961          A53J3_8 2962-2963
        A53J2_8 2964-2966       A53J4_8 2967-2968       RA53K_8 2969-2970
        A53K1_8 2971-2972       A53K11_8 $2973          A53K3_8 2974-2975
        A53K2_8 2976-2978       A53K4_8 2979-2980       RA53L_8 2981-2982
        A53L1_8 2983-2984       A53L11_8 $2985          A53L3_8 2986-2987
        A53L2_8 2988-2990       A53L4_8 2991-2992       RA530_8 2993-2994
        A530_8 2995-2996        RA531_8 2997-2998       A531_8 2999-3000
        RA532_8 3001-3002       A532_8 3003-3004        RA541_8 3005-3006
        A541_8 3007-3010        RA542_8 3011-3012       A542_8 3013-3014
        RA54_8 3015-3016        A54A_8 3017-3020        A54B_8 3021-3022
        B11_8 3023-3024         B12_8 3025-3026         B121_8 3027-3028
        B21_8 3029-3030         B22_8 3031-3032         B23_8 3033-3034
        B24_8 3035-3036         B25_8 3037-3038         B26_8 3039-3040
        B27_8 3041-3042         C11_8 3043-3044         C12_8 3045-3046
        C13_8 3047-3048         C14_8 3049-3050         C15_8 3051-3052
        C16_8 3053-3054         C21A_8 3055-3056        C21B_8 3057-3058
        C21C_8 3059-3060        C22_8 3061-3062         C31A_8 3063-3064
        C31B_8 3065-3066        C31C_8 3067-3068        C31D_8 3069-3070
        C31E_8 3071-3072        C32_8 3073-3074         C41A_8 3075-3076
        C41B_8 3077-3078        C41C_8 3079-3080        C51A_8 3081-3082
        C51B_8 3083-3084        C52_8 3085-3086         C52X1_8 3087-3088
        C52X2_8 3089-3090       C53A_8 3091-3092        C53B_8 3093-3094
        C53C_8 3095-3096        C54_8 3097-3098         C55_8 3099-3100
        RD1_8 3101-3102         D1_8 3103-3104          RD2_8 3105-3106
        D2_8 3107-3108          RD31_8 3109-3110        D31_8 3111-3112
        RD32_8 3113-3114        D32_8 3115-3116         RD33_8 3117-3118
        D33_8 3119-3120         RD34_8 3121-3122        D34_8 3123-3124
        RD4MEAT_8 3125-3126     D4MEAT2_8 3127-3128     D4MEAT1_8 3129-3130
        RD4FISH_8 3131-3132     D4FISH2_8 3133-3134     D4FISH1_8 3135-3136
        RD4EGG_8 3137-3138      D4EGG2_8 3139-3140      D4EGG1_8 3141-3142
        RD4BEAN_8 3143-3144     D4BEAN2_8 3145-3146     D4BEAN1_8 3147-3148
        RD4VEG_8 3149-3150      D4VEG2_8 3151-3152      D4VEG1_8 3153-3154
        RD4SUGA_8 3155-3156     D4SUGA2_8 3157-3158     D4SUGA1_8 3159-3160
        RD4TEA_8 3161-3162      D4TEA2_8 3163-3164      D4TEA1_8 3165-3166
        RD4GARL_8 3167-3168     D4GARL2_8 3169-3170     D4GARL1_8 3171-3172
        RDEMILK_8 3173-3174     D4MILK1_8 3175-3176     D4MILK2_8 3177-3178
        RD4NUT_8 3179-3180      D4NUT1_8 3181-3182      D4NUT2_8 3183-3184
        RD4ALGA_8 3185-3186     D4ALGA1_8 3187-3188     D4ALGA2_8 3189-3190
        RD4VIT_8 3191-3192      D4VIT1_8 3193-3194      D4VIT2_8 3195-3196
        RD4DRUG_8 3197-3198     D4DRUG1_8 3199-3200     D4DRUG2_8 3201-3202
        RD5_8 3203-3204         D5_8 3205-3206          RD6_8 3207-3208
        D6A_8 3209-3210         D6B_8 3211-3212         D6C_8 3213-3214
        RD71_8 3215-3216        D71_8 3217-3218         RD72_8 3219-3220
        D72_8 3221-3222         RD73_8 3223-3224        D73_8 3225-3227
        RD74_8 3228-3229        D74_8 3230-3232         RD75_8 3233-3234
        D75_8 3235-3236         RD81_8 3237-3238        D81_8 3239-3240
        RD82_8 3241-3242        D82_8 3243-3244         RD83_8 3245-3246
        D83_8 3247-3249         RD84_8 3250-3251        D84_8 3252-3254
        RD85_8 3255-3256        D85_8 3257-3258         RD86_8 3259-3260
        D86_8 3261-3262         RD91_8 3263-3264        D91_8 3265-3266
        RD92_8 3267-3268        D92_8 3269-3270         RD93_8 3271-3272
        D93_8 3273-3275         RD94_8 3276-3277        D94_8 3278-3280
        RD101_8 3281-3282       D101_8 3283-3284        RD102_8 3285-3286
        D102_8 3287-3289        RD103_8 3290-3291       D103_8 3292-3294
        RD11A_8 3295-3296       D11A_8 3297-3298        RD11B_8 3299-3300
        D11B_8 3301-3302        RD11C_8 3303-3304       D11C_8 3305-3306
        RD11D_8 3307-3308       D11D_8 3309-3310        RD11E_8 3311-3312
        D11E_8 3313-3314        RD11F_8 3315-3316       D11F_8 3317-3318
        RD11G_8 3319-3320       D11G_8 3321-3322        RD11H_8 3323-3324
        D11H_8 3325-3326        RD12_8 3327-3328        D12_8 3329-3330
        RE6_8 3331-3332         E6_8 3333-3334          RE6B_8 3335-3336
        E6B_8 3337-3340         RE1_8 3341-3342         E1_8 3343-3344
        RE1B_8 3345-3346        E1B_8 3347-3350         RE2_8 3351-3352
        E2_8 3353-3354          RE2B_8 3355-3356        E2B_8 3357-3360
        RE3_8 3361-3362         E3_8 3363-3364          RE3B_8 3365-3366
        E3B_8 3367-3370         RE4_8 3371-3372         E4_8 3373-3374
        RE4B_8 3375-3376        E4B_8 3377-3380         RE5_8 3381-3382
        E5_8 3383-3384          RE5B_8 3385-3386        E5B_8 3387-3390
        RE610_8 3391-3392       E610_8 3393-3394        RE62_8 3395-3396
        E62_8 3397-3398         RE63_8 3399-3400        E63_8 3401-3405
        RE64_8 3406-3407        E64_8 3408-3409         RE65_8 3410-3411
        E65_8 3412-3413         RE67_8 3414-3415        E67_8 3416-3418
        RE7_8 3419-3420         E7_8 3421-3422          RE8_8 3423-3424
        E8_8 3425-3426          RE9_8 3427-3428         E9_8 3429-3430
        RE10_8 3431-3432        E10_8 3433-3434         RE11_8 3435-3436
        E11_8 3437-3438         RE12_8 3439-3440        E12_8 3441-3442
        RE13_8 3443-3444        E13_8 3445-3446         RE14_8 3447-3448
        E14_8 3449-3450         RF1_8 3451-3452         F1_8 3453-3454
        RF2_8 3455-3456         F2_8 3457-3458          F2T_8 $3459
        RF21_8 3460-3461        F21_8 3462-3463         RF211_8 3464-3465
        F211_8 3466-3467        RF22_8 3468-3469        F22_8 3470-3473
        RF23_8 3474-3475        F23_8 3476-3477         RF31_8 3478-3479
        F31_8 3480-3481         RF32_8 3482-3483        F32A_8 3484-3485
        F32B_8 3486-3487        F32C_8 3488-3489        F32D_8 3490-3491
        F32E_8 3492-3493        RF33_8 3494-3495        F33_8 3496-3497
        RF340_8 3498-3499       F340_8 3500-3501        RF34_8 3502-3503
        F34_8 3504-3505         RF35_8 3506-3507        F35_8 3508-3512
        RF41_8 3513-3514        F41_8 3515-3516         RF42_8 3517-3518
        F42_8 3519-3520         RF43A_8 3521-3522       F43A1_8 3523-3525
        F43A2_8 3526-3527       F43A3_8 3528-3530       F43A4_8 3531-3532
        RF43B_8 3533-3534       F43B1_8 3535-3537       F43B2_8 3538-3539
        F43B3_8 3540-3542       F43B4_8 3543-3544       RF43C_8 3545-3546
        F43C1_8 3547-3549       F43C2_8 3550-3551       F43C3_8 3552-3554
        F43C4_8 3555-3556       RF43D_8 3557-3558       F43D1_8 3559-3561
        F43D2_8 3562-3563       F43D3_8 3564-3566       F43D4_8 3567-3568
        RF44_8 3569-3570        F44_8 3571-3572         RF45_8 3573-3574
        F45_8 3575-3576         RF46_8 3577-3578        F46_8 3579-3580
        RF47_8 3581-3582        F47_8 3583-3584         RF5_8 3585-3586
        F5_8 3587-3588          RF61_8 3589-3590        F61_8 3591-3592
        RF610_8 3593-3594       F610_8 3595-3596        RF62_8 3597-3598
        F62_8 3599-3600         RF63_8 3601-3602        F63_8 3603-3604
        RF64_8 3605-3606        F64A_8 3607-3608        F64B_8 3609-3610
        F64C_8 3611-3612        F64D_8 3613-3614        F64E_8 3615-3616
        F64F_8 3617-3618        F64G_8 3619-3620        F64H_8 3621-3622
        F64I_8 3623-3624        RF651A_8 3625-3626      F651A_8 3627-3631
        RF651B_8 3632-3633      F651B_8 3634-3638       RF652_8 3639-3640
        F652_8 3641-3642        RF66_8 3643-3644        F66_8 3645-3646
        RF71_8 3647-3648        F71_8 3649-3650         RF721_8 3651-3652
        F721_8 3653-3655        RF722_8 3656-3657       F722_8 3658-3660
        RF73_8 3661-3662        F73_8 3663-3665         RF74_8 3666-3667
        F74_8 3668-3669         RF81_8 3670-3671        F81_8 3672-3673
        RF821_8 3674-3675       F821_8 3676-3678        RF822_8 3679-3680
        F822_8 3681-3683        RF83_8 3684-3685        F83_8 3686-3688
        RF84_8 3689-3690        F84_8 3691-3692         RF85_8 3693-3694
        F85_8 3695-3696         RF86_8 3697-3698        F86_8 3699-3700
        RF9_8 3701-3702         F9_8 3703-3704          F9A_8 3705-3706
        RF91_8 3707-3708        F91_8 3709-3710         RF92A_8 3711-3712
        F92A1_8 3713-3714       F92A2_8 3715-3716       F92A3_8 3717-3718
        F92A4_8 3719-3721       F92A5_8 3722-3723       F92A6_8 3724-3725
        RF92B_8 3726-3727       F92B1_8 3728-3729       F92B2_8 3730-3731
        F92B3_8 3732-3733       F92B4_8 3734-3736       F92B5_8 3737-3738
        F92B6_8 3739-3740       RF92C_8 3741-3742       F92C1_8 3743-3744
        F92C2_8 3745-3746       F92C3_8 3747-3748       F92C4_8 3749-3751
        F92C5_8 3752-3753       F92C6_8 3754-3755       RF92D_8 3756-3757
        F92D1_8 3758-3759       F92D2_8 3760-3761       F92D3_8 3762-3763
        F92D4_8 3764-3766       F92D5_8 3767-3768       F92D6_8 3769-3770
        RF92E_8 3771-3772       F92E1_8 3773-3774       F92E2_8 3775-3776
        F92E3_8 3777-3778       F92E4_8 3779-3781       F92E5_8 3782-3783
        F92E6_8 3784-3785       RF92F_8 3786-3787       F92F1_8 3788-3789
        F92F2_8 3790-3791       F92F3_8 3792-3793       F92F4_8 3794-3796
        F92F5_8 3797-3798       F92F6_8 3799-3800       RF92G_8 3801-3802
        F92G1_8 3803-3804       F92G2_8 3805-3806       F92G3_8 3807-3808
        F92G4_8 3809-3811       F92G5_8 3812-3813       F92G6_8 3814-3815
        RF92H_8 3816-3817       F92H1_8 3818-3819       F92H2_8 3820-3821
        F92H3_8 3822-3823       F92H4_8 3824-3826       F92H5_8 3827-3828
        F92H6_8 3829-3830       RF92I_8 3831-3832       F92I1_8 3833-3834
        F92I2_8 3835-3836       F92I3_8 3837-3838       F92I4_8 3839-3841
        F92I5_8 3842-3843       F92I6_8 3844-3845       RF92J_8 3846-3847
        F92J1_8 3848-3849       F92J2_8 3850-3851       F92J3_8 3852-3853
        F92J4_8 3854-3856       F92J5_8 3857-3858       F92J6_8 3859-3860
        JIGE_8 3861-3862        RF10_8 3863-3864        F10_8 3865-3866
        F10A_8 3867-3868        RF101_8 3869-3870       F101_8 3871-3872
        RF102_8 3873-3874       F102_8 3875-3876        F103_8 3877-3878
        RF103A_8 3879-3880      F103A8_8 3881-3882      F103A1_8 3883-3884
        F103A2_8 3885-3886      F103A3_8 3887-3888      F103A4_8 3889-3890
        F103A7_8 3891-3892      F103A5_8 3893-3894      RF103B_8 3895-3896
        F103B8_8 3897-3898      F103B1_8 3899-3900      F103B2_8 3901-3902
        F103B3_8 3903-3904      F103B4_8 3905-3906      F103B7_8 3907-3908
        F103B5_8 3909-3910      RF103C_8 3911-3912      F103C8_8 3913-3914
        F103C1_8 3915-3916      F103C2_8 3917-3918      F103C3_8 3919-3920
        F103C4_8 3921-3922      F103C7_8 3923-3924      F103C5_8 3925-3926
        RF103D_8 3927-3928      F103D8_8 3929-3930      F103D1_8 3931-3932
        F103D2_8 3933-3934      F103D3_8 3935-3936      F103D4_8 3937-3938
        F103D7_8 3939-3940      F103D5_8 3941-3942      RF103E_8 3943-3944
        F103E8_8 3945-3946      F103E1_8 3947-3948      F103E2_8 3949-3950
        F103E3_8 3951-3952      F103E4_8 3953-3954      F103E7_8 3955-3956
        F103E5_8 3957-3958      RF103F_8 3959-3960      F103F8_8 3961-3962
        F103F1_8 3963-3964      F103F2_8 3965-3966      F103F3_8 3967-3968
        F103F4_8 3969-3970      F103F7_8 3971-3972      F103F5_8 3973-3974
        RF103G_8 3975-3976      F103G8_8 3977-3978      F103G1_8 3979-3980
        F103G2_8 3981-3982      F103G3_8 3983-3984      F103G4_8 3985-3986
        F103G7_8 3987-3988      F103G5_8 3989-3990      RF103H_8 3991-3992
        F103H8_8 3993-3994      F103H1_8 3995-3996      F103H2_8 3997-3998
        F103H3_8 3999-4000      F103H4_8 4001-4002      F103H7_8 4003-4004
        F103H5_8 4005-4006      RF103I_8 4007-4008      F103I8_8 4009-4010
        F103I1_8 4011-4012      F103I2_8 4013-4014      F103I3_8 4015-4016
        F103I4_8 4017-4018      F103I7_8 4019-4020      F103I5_8 4021-4022
        RF103J_8 4023-4024      F103J8_8 4025-4026      F103J1_8 4027-4028
        F103J2_8 4029-4030      F103J3_8 4031-4032      F103J4_8 4033-4034
        F103J7_8 4035-4036      F103J5_8 4037-4038      RF103K_8 4039-4040
        F103K8_8 4041-4042      F103K1_8 4043-4044      F103K2_8 4045-4046
        F103K3_8 4047-4048      F103K4_8 4049-4050      F103K7_8 4051-4052
        F103K5_8 4053-4054      RF103L_8 4055-4056      F103L8_8 4057-4058
        F103L1_8 4059-4060      F103L2_8 4061-4062      F103L3_8 4063-4064
        F103L4_8 4065-4066      F103L7_8 4067-4068      F103L5_8 4069-4070
        RF103M_8 4071-4072      F103M8_8 4073-4074      F103M1_8 4075-4076
        F103M2_8 4077-4078      F103M3_8 4079-4080      F103M4_8 4081-4082
        F103M7_8 4083-4084      F103M5_8 4085-4086      RF111_8 4087-4088
        F111A_8 4089-4090       F111B_8 4091-4092       F111C_8 4093-4094
        RF112_8 4095-4096       F112A_8 4097-4098       F112B_8 4099-4100
        F112C_8 4101-4102       RF113_8 4103-4104       F113A_8 4105-4106
        F113B_8 4107-4108       F113C_8 4109-4110       RF12_8 4111-4112
        F12A_8 4113-4117        F12B_8 4118-4122        F12C_8 4123-4127
        RF13_8 4128-4129        F13A_8 4130-4134        F13B_8 4135-4139
        F13C_8 4140-4144        RF14_8 4145-4146        F141_8 4147-4148
        F142_8 4149-4150        F143_8 4151-4152        F144_8 4153-4154
        F145_8 4155-4156        F146_8 4157-4158        F147_8 4159-4160
        F148_8 4161-4162        F149_8 4163-4164        RF15_8 4165-4166
        F151_8 4167-4168        F152_8 4169-4170        F153_8 4171-4172
        F154_8 4173-4174        F155_8 4175-4176        F156_8 4177-4178
        F157_8 4179-4180        F158_8 4181-4182        F159_8 4183-4184
        F16_8 4185-4186         G01_8 4187-4188         RG02_8 4189-4190
        G02_8 4191-4192         G1_8 4193-4194          RG21_8 4195-4196
        G21_8 4197-4198         RG22_8 4199-4200        G22_8 4201-4202
        RG3_8 4203-4204         G3_8 4205-4206          RG4_8 4207-4208
        G4_8 4209-4210          RG51_8 4211-4212        G511_8 4213-4215
        G512_8 4216-4218        RG52_8 4219-4220        G521_8 4221-4223
        G522_8 4224-4226        G71_8 4227-4229         G72_8 4230-4232
        G81_8 4233-4234         G82_8 4235-4236         G83_8 4237-4238
        G9_8 4239-4240          RG101_8 4241-4242       G101_8 4243-4245
        RG102_8 4246-4247       G1021_8 4248-4250       G122_8 4251-4253
        G123_8 4254-4256        G11_8 4257-4258         G12_8 4259-4260
        G130_8 4261-4262        RG13_8 4263-4264        G131_8 4265-4266
        G132_8 4267-4268        RG14A_8 4269-4270       G14A1_8 4271-4272
        G14A2_8 4273-4275       RG14B_8 4276-4277       G14B1_8 4278-4279
        G14B2_8 4280-4282       RG14C_8 4283-4284       G14C1_8 4285-4286
        G14C2_8 4287-4289       RG15A_8 4290-4291       G15A1_8 4292-4293
        G15A2_8 4294-4295       G15A3_8 4296-4297       RG15B_8 4298-4299
        G15B1_8 4300-4301       G15B2_8 4302-4303       G15B3_8 4304-4305
        RG15C_8 4306-4307       G15C1_8 4308-4309       G15C2_8 4310-4311
        G15C3_8 4312-4313       RG15D_8 4314-4315       G15D1_8 4316-4317
        G15D2_8 4318-4319       G15D3_8 4320-4321       RG15E_8 4322-4323
        G15E1_8 4324-4325       G15E2_8 4326-4327       G15E3_8 4328-4329
        RG15F_8 4330-4331       G15F1_8 4332-4333       G15F2_8 4334-4335
        G15F3_8 4336-4337       RG15G_8 4338-4339       G15G1_8 4340-4341
        G15G2_8 4342-4343       G15G3_8 4344-4345       RG15H_8 4346-4347
        G15H1_8 4348-4349       G15H2_8 4350-4351       G15H3_8 4352-4353
        RG15I_8 4354-4355       G15I1_8 4356-4357       G15I2_8 4358-4359
        G15I3_8 4360-4361       RG15J_8 4362-4363       G15J1_8 4364-4365
        G15J2_8 4366-4367       G15J3_8 4368-4369       RG15K_8 4370-4371
        G15K1_8 4372-4373       G15K2_8 4374-4375       G15K3_8 4376-4377
        RG15L_8 4378-4379       G15L1_8 4380-4381       G15L2_8 4382-4383
        G15L3_8 4384-4385       RG15M_8 4386-4387       G15M1_8 4388-4389
        G15M2_8 4390-4391       G15M3_8 4392-4393       RG15N_8 4394-4395
        G15N1_8 4396-4397       G15N2_8 4398-4399       G15N3_8 4400-4401
        RG15O_8 4402-4403       G15O1_8 4404-4405       G15O2_8 4406-4407
        G15O3_8 4408-4409       RG15P_8 4410-4411       G15P1_8 4412-4413
        G15P2_8 4414-4415       G15P3_8 4416-4417       RG15Q_8 4418-4419
        G15Q1_8 4420-4421       G15Q2_8 4422-4423       G15Q3_8 4424-4425
        RG15R_8 4426-4427       G15R1_8 4428-4429       G15R2_8 4430-4431
        G15R3_8 4432-4433       RG15S_8 4434-4435       G15S1_8 4436-4437
        G15S2_8 4438-4439       G15S3_8 4440-4441       RG15T_8 4442-4443
        G15T1_8 4444-4445       G15T2_8 4446-4447       G15T3_8 4448-4449
        RG15U_8 4450-4451       G15U1_8 4452-4453       G15U2_8 4454-4455
        G15U3_8 4456-4457       RG15V_8 4458-4459       G15V1_8 4460-4461
        G15V2_8 4462-4463       G15V3_8 4464-4465       H1_8 4466-4467
        H21_8 4468-4469         H22_8 4470-4471         H3_8 4472-4473
        H6_8 4474-4475          H7_8 4476-4477          H71_8 4478-4479
        D8VYEAR 4480-4483       D8VMONTH 4484-4485      D8VDAY 4486-4487
        D8RESID 4488-4489       D8SEX 4490-4491         D8MARRY 4492-4493
        D8LIVARR 4494-4495      D8PERSON 4496-4497      D8GENER 4498-4499
        D8DPLACE 4500-4501      D8CARGIV 4502-4503      D8PCGDAY 4504-4505
        D8BEDRID 4506-4507      D8BEDDAY 4508-4511      D8ILL 4512-4513
        D8DISEA1 4514-4515      D8DIDAY1 4516-4519      D8DISEA2 4520-4521
        D8DIDAY2 4522-4525      D8DISEA3 4526-4527      D8DIDAY3 4528-4531
        D8HYPERT 4532-4533      D8DIABET 4534-4535      D8HEART 4536-4537
        D8CVD 4538-4539         D8PNEUM 4540-4541       D8TUBERC 4542-4543
        D8CANCER 4544-4545      D8GLAUCO 4546-4547      D8PROSTA 4548-4549
        D8GYNECO 4550-4551      D8GASTRI 4552-4553      D8PARKIN 4554-4555
        D8BEDSOR 4556-4557      D8DEMENT 4558-4559      D8PSYCHO 4560-4561
        D8NEUROS 4562-4563      D8ARTHRI 4564-4565      D8OTHERS 4566-4567
        D8MEDICA 4568-4569      D8FINANC 4570-4571      D8INCOME 4572-4576
        D8WCFACI 4577-4578      D8TAPWAT 4579-4580      D8BATHFA 4581-4582
        D8HEATER 4583-4584      D8TVSET 4585-4586       D8WASHMA 4587-4588
        D8PHONE 4589-4590       D8DOCTOR 4591-4592      D8LICDOC 4593-4594
        D8WHOPAY 4595-4596      D8MEDCOS 4597-4601      D8POCKET 4602-4606
        D8BATHFU 4607-4608      D8BATDAY 4609-4612      D8DRESFU 4613-4614
        D8DREDAY 4615-4618      D8TOILFU 4619-4620      D8TOIDAY 4621-4624
        D8MOVEFU 4625-4626      D8MOVDAY 4627-4630      D8CONTFU 4631-4632
        D8CONDAY 4633-4636      D8FEEDFU 4637-4638      D8FEEDAY 4639-4642
        D8FULLDA 4643-4646      D8CARCST 4647-4651      D8DIRCST 4652-4656
        D8CARPAY 4657-4658      D8OUTDOR 4659-4662      D8ACTDAY 4663-4666
        D8SMOKE 4667-4668       D8SMKTIM 4669-4670      D8DRINK 4671-4672
        D8KNDDRK 4673-4674      D8DRKMCH 4675-4676      D8ADVDIR 4677-4678
        D8DIRDAY 4679-4682      D8DREAM 4683-4684       D8PAIN 4685-4686
        D8UNCONS 4687-4688      D8UNCDAY 4689-4692      DTH08_11 4693-4694
        YEARIN_11 4695-4698     MONTHIN_11 4699-4700    DAYIN_11 4701-4702
        RESIC_11 4703-4704      VAGE_11 4705-4707       RA51_11 4708-4709
        A51_11 4710-4711        RA52_11 4712-4713       A52_11 4714-4715
        RA53A_11 4716-4717      A53A1_11 4718-4719      A53A3_11 4720-4721
        A53A2_11 4722-4724      A53A4_11 4725-4726      A53A5_11 4727-4728
        RA53B_11 4729-4730      A53B1_11 4731-4732      A53B3_11 4733-4734
        A53B2_11 4735-4737      A53B4_11 4738-4739      A53B5_11 4740-4741
        RA53C_11 4742-4743      A53C1_11 4744-4745      A53C3_11 4746-4747
        A53C2_11 4748-4750      A53C4_11 4751-4752      A53C5_11 4753-4754
        RA53D_11 4755-4756      A53D1_11 4757-4758      A53D3_11 4759-4760
        A53D2_11 4761-4763      A53D4_11 4764-4765      A53D5_11 4766-4767
        RA53E_11 4768-4769      A53E1_11 4770-4771      A53E3_11 4772-4773
        A53E2_11 4774-4776      A53E4_11 4777-4778      A53E5_11 4779-4780
        RA53F_11 4781-4782      A53F1_11 4783-4784      A53F3_11 4785-4786
        A53F2_11 4787-4789      A53F4_11 4790-4791      A53F5_11 4792-4793
        RA53G_11 4794-4795      A53G1_11 4796-4797      A53G3_11 4798-4799
        A53G2_11 4800-4802      A53G4_11 4803-4804      A53G5_11 4805-4806
        RA53H_11 4807-4808      A53H1_11 4809-4810      A53H3_11 4811-4812
        A53H2_11 4813-4815      A53H4_11 4816-4817      A53H5_11 4818-4819
        RA53I_11 4820-4821      A53I1_11 4822-4823      A53I3_11 4824-4825
        A53I2_11 4826-4828      A53I4_11 4829-4830      A53I5_11 4831-4832
        RA53J_11 4833-4834      A53J1_11 4835-4836      A53J11_11 $4837
        A53J3_11 4838-4839      A53J2_11 4840-4842      A53J4_11 4843-4844
        A53J5_11 4845-4846      RA530_11 4847-4848      A530_11 4849-4850
        RA531_11 4851-4852      A531_11 4853-4854       RA532_11 4855-4856
        A532_11 4857-4858       RA533_11 4859-4860      A533_11 4861-4862
        A533A_11 $4863          RA534_11 4864-4865      A534_11 4866-4869
        RA535_11 4870-4871      A535_11 4872-4873       RA536_11 4874-4875
        A536_11 4876-4877       RA537_11 4878-4879      A537_11 4880-4881
        RA540_11 4882-4883      A540_11 4884-4885       RA541_11 4886-4887
        A541_11 4888-4891       RA542_11 4892-4893      A542_11 4894-4895
        A542A_11 $4896          RA54_11 4897-4898       A54A_11 4899-4902
        A54B_11 4903-4904       B11_11 4905-4906        B12_11 4907-4908
        B121_11 4909-4910       B21_11 4911-4912        B22_11 4913-4914
        B23_11 4915-4916        B24_11 4917-4918        B25_11 4919-4920
        B26_11 4921-4922        B27_11 4923-4924        B28_11 4925-4926
        B29_11 4927-4928        B210_11 4929-4930       C11_11 4931-4932
        C12_11 4933-4934        C13_11 4935-4936        C14_11 4937-4938
        C15_11 4939-4940        C16_11 4941-4942        C21A_11 4943-4944
        C21B_11 4945-4946       C21C_11 4947-4948       C22_11 4949-4950
        C31A_11 4951-4952       C31B_11 4953-4954       C31C_11 4955-4956
        C31D_11 4957-4958       C31E_11 4959-4960       C32_11 4961-4962
        C41A_11 4963-4964       C41B_11 4965-4966       C41C_11 4967-4968
        C51A_11 4969-4970       C51B_11 4971-4972       C52_11 4973-4974
        C52X1_11 4975-4976      C52X2_11 4977-4978      C53A_11 4979-4980
        C53B_11 4981-4982       C53C_11 4983-4984       C54_11 4985-4986
        C55_11 4987-4988        RD1_11 4989-4990        D1_11 4991-4992
        RD2_11 4993-4994        D2_11 4995-4996         RD31_11 4997-4998
        D31_11 4999-5000        RD32_11 5001-5002       D32_11 5003-5004
        RD33_11 5005-5006       D33_11 5007-5008        D33A_11 $5009
        RD34_11 5010-5011       D34_11 5012-5013        RD4MEAT_11 5014-5015
        D4MEAT2_11 5016-5017    D4MEAT1_11 5018-5019    RD4FISH_11 5020-5021
        D4FISH2_11 5022-5023    D4FISH1_11 5024-5025    RD4EGG_11 5026-5027
        D4EGG2_11 5028-5029     D4EGG1_11 5030-5031     RD4BEAN_11 5032-5033
        D4BEAN2_11 5034-5035    D4BEAN1_11 5036-5037    RD4VEG_11 5038-5039
        D4VEG2_11 5040-5041     D4VEG1_11 5042-5043     RD4SUGA_11 5044-5045
        D4SUGA2_11 5046-5047    D4SUGA1_11 5048-5049    RD4TEA_11 5050-5051
        D4TEA2_11 5052-5053     D4TEA1_11 5054-5055     RD4GARL_11 5056-5057
        D4GARL2_11 5058-5059    D4GARL1_11 5060-5061    RDEMILK_11 5062-5063
        D4MILK1_11 5064-5065    D4MILK2_11 5066-5067    RD4NUT_11 5068-5069
        D4NUT1_11 5070-5071     D4NUT2_11 5072-5073     RD4ALGA_11 5074-5075
        D4ALGA1_11 5076-5077    D4ALGA2_11 5078-5079    RD4VIT_11 5080-5081
        D4VIT1_11 5082-5083     D4VIT2_11 5084-5085     RD4DRUG_11 5086-5087
        D4DRUG1_11 5088-5089    D4DRUG2_11 5090-5091    RD5_11 5092-5093
        D5_11 5094-5095         RD6_11 5096-5097        D6A_11 5098-5099
        D6B_11 5100-5101        D6C_11 5102-5103        RD71_11 5104-5105
        D71_11 5106-5107        RD72_11 5108-5109       D72_11 5110-5111
        RD73_11 5112-5113       D73_11 5114-5116        RD74_11 5117-5118
        D74_11 5119-5121        RD75_11 5122-5123       D75_11 5124-5125
        RD76_11 5126-5127       D76_11 5128-5129        RD77_11 5130-5131
        D77_11 5132-5133        RD78_11 5134-5135       D78_11 5136-5137
        D78A_11 5138-5139       D78B_11 5140-5141       RD79_11 5142-5143
        D79_11 5144-5145        D79A_11 5146-5147       D79B_11 5148-5149
        RD710_11 5150-5151      D710_11 5152-5153       D710A_11 5154-5155
        D710B_11 5156-5157      RD81_11 5158-5159       D81_11 5160-5161
        RD82_11 5162-5163       D82_11 5164-5165        RD83_11 5166-5167
        D83_11 5168-5170        RD84_11 5171-5172       D84_11 5173-5175
        RD85_11 5176-5177       D85_11 5178-5179        RD86_11 5180-5181
        D86_11 5182-5183        RD87_11 5184-5185       D87_11 5186-5187
        RD91_11 5188-5189       D91_11 5190-5191        RD92_11 5192-5193
        D92_11 5194-5195        RD93_11 5196-5197       D93_11 5198-5200
        RD94_11 5201-5202       D94_11 5203-5205        RD101_11 5206-5207
        D101_11 5208-5209       RD102_11 5210-5211      D102_11 5212-5214
        RD103_11 5215-5216      D103_11 5217-5219       RD11A_11 5220-5221
        D11A_11 5222-5223       RD11B_11 5224-5225      D11B_11 5226-5227
        RD11C_11 5228-5229      D11C_11 5230-5231       RD11D_11 5232-5233
        D11D_11 5234-5235       RD11E_11 5236-5237      D11E_11 5238-5239
        RD11F_11 5240-5241      D11F_11 5242-5243       RD11G_11 5244-5245
        D11G_11 5246-5247       RD11H_11 5248-5249      D11H_11 5250-5251
        RD12_11 5252-5253       D12_11 5254-5255        RE0_11 5256-5257
        E0_11 5258-5259         RE1_11 5260-5261        E1_11 5262-5263
        RE1B_11 5264-5265       E1B_11 5266-5269        RE2_11 5270-5271
        E2_11 5272-5273         RE2B_11 5274-5275       E2B_11 5276-5279
        RE3_11 5280-5281        E3_11 5282-5283         RE3B_11 5284-5285
        E3B_11 5286-5289        RE4_11 5290-5291        E4_11 5292-5293
        RE4B_11 5294-5295       E4B_11 5296-5299        RE5_11 5300-5301
        E5_11 5302-5303         RE5B_11 5304-5305       E5B_11 5306-5309
        RE6_11 5310-5311        E6_11 5312-5313         RE6B_11 5314-5315
        E6B_11 5316-5319        RE610_11 5320-5321      E610_11 5322-5323
        RE62_11 5324-5325       E62_11 5326-5327        RE63_11 5328-5329
        E63_11 5330-5334        RE64_11 5335-5336       E64_11 5337-5338
        E64A_11 $5339           RE65_11 5340-5341       E65_11 5342-5343
        RE67_11 5344-5345       E67_11 5346-5348        RE7_11 5349-5350
        E7_11 5351-5352         RE8_11 5353-5354        E8_11 5355-5356
        RE9_11 5357-5358        E9_11 5359-5360         RE10_11 5361-5362
        E10_11 5363-5364        RE11_11 5365-5366       E11_11 5367-5368
        RE12_11 5369-5370       E12_11 5371-5372        RE13_11 5373-5374
        E13_11 5375-5376        RE14_11 5377-5378       E14_11 5379-5380
        RF21_11 5381-5382       F21_11 5383-5384        RF211_11 5385-5386
        F211_11 5387-5388       RF22_11 5389-5390       F22_11 5391-5394
        RF221_11 5395-5396      F221_11 5397-5401       RF23_11 5402-5403
        F23_11 5404-5405        RF24_11 5406-5407       F24_11 5408-5409
        RF25_11 5410-5411       F251_11 5412-5416       F252_11 5417-5421
        RF25B_11 5422-5423      F25B1_11 5424-5427      F25B2_11 5428-5429
        RF26_11 5430-5431       F26_11 5432-5435        RF27_11 5436-5437
        F27_11 5438-5439        RF31_11 5440-5441       F31_11 5442-5443
        RF32_11 5444-5445       F32A_11 5446-5447       F32B_11 5448-5449
        F32C_11 5450-5451       F32D_11 5452-5453       F32E_11 5454-5455
        RF33_11 5456-5457       F33_11 5458-5459        RF340_11 5460-5461
        F340_11 5462-5463       RF34_11 5464-5465       F34_11 5466-5467
        RF35_11 5468-5469       F35_11 5470-5474        RF41_11 5475-5476
        F41_11 5477-5478        RF41A_11 5479-5480      F41A1_11 5481-5482
        F41A11_11 5483-5486     F41A12_11 5487-5488     F41A2_11 5489-5490
        F41A21_11 5491-5494     F41A22_11 5495-5496     F41A3_11 5497-5498
        F41A31_11 5499-5502     F41A32_11 5503-5504     RF41B_11 5505-5506
        F41B_11 5507-5508       F41B1_11 5509-5512      F41B2_11 5513-5514
        RF42_11 5515-5516       F42_11 5517-5518        RF43A_11 5519-5520
        F43A1_11 5521-5523      F43A2_11 5524-5525      F43A3_11 5526-5528
        F43A4_11 5529-5530      RF43B_11 5531-5532      F43B1_11 5533-5535
        F43B2_11 5536-5537      F43B3_11 5538-5540      F43B4_11 5541-5542
        RF43C_11 5543-5544      F43C1_11 5545-5547      F43C2_11 5548-5549
        F43C3_11 5550-5552      F43C4_11 5553-5554      RF43D_11 5555-5556
        F43D1_11 5557-5559      F43D2_11 5560-5561      F43D3_11 5562-5564
        F43D4_11 5565-5566      RF44_11 5567-5568       F44_11 5569-5570
        RF45_11 5571-5572       F45_11 5573-5574        RF46_11 5575-5576
        F46_11 5577-5578        RF47_11 5579-5580       F47_11 5581-5582
        RF5_11 5583-5584        F5_11 5585-5586         RF61_11 5587-5588
        F61_11 5589-5590        RF610_11 5591-5592      F610_11 5593-5594
        RF62_11 5595-5596       F62_11 5597-5598        RF63_11 5599-5600
        F63_11 5601-5602        RF64_11 5603-5604       F64A_11 5605-5606
        F64B_11 5607-5608       F64C_11 5609-5610       F64D_11 5611-5612
        F64E1_11 5613-5614      F64F1_11 5615-5616      F64G1_11 5617-5618
        F64H1_11 5619-5620      F64I_11 5621-5622       RF651A1_11 5623-5624
        F651A1_11 5625-5629     RF651B1_11 5630-5631    F651B1_11 5632-5636
        RF651A2_11 5637-5638    F651A2_11 5639-5643     RF651B2_11 5644-5645
        F651B2_11 5646-5650     RF6521_11 5651-5652     F6521_11 5653-5654
        RF652A_11 5655-5656     F652A_11 5657-5671 .12  RF652B_11 5672-5673
        F652B_11 5674-5675      RF66_11 5676-5677       F66_11 5678-5679
        RF71_11 5680-5681       F71_11 5682-5683        RF721_11 5684-5685
        F721_11 5686-5688       RF722_11 5689-5690      F722_11 5691-5693
        F722A_11 5694-5695      RF73_11 5696-5697       F73_11 5698-5700
        RF74_11 5701-5702       F74_11 5703-5704        RF81_11 5705-5706
        F81_11 5707-5708        RF821_11 5709-5710      F821_11 5711-5713
        RF822_11 5714-5715      F822_11 5716-5718       F822A_11 5719-5720
        RF83_11 5721-5722       F83_11 5723-5725        RF84_11 5726-5727
        F84_11 5728-5729        RF85_11 5730-5731       F85_11 5732-5733
        RF86_11 5734-5735       F86_11 5736-5737        RF9_11 5738-5739
        F9_11 5740-5741         F9A_11 5742-5743        RF901_11 5744-5745
        F901_11 5746-5747       RF901A_11 5748-5749     F901A_11 5750-5751
        F901B1_11 5752-5754     F901B2_11 5755-5757     F901B3_11 5758-5760
        RF902_11 5761-5762      F902_11 5763-5764       RF902A_11 5765-5766
        F902A_11 5767-5768      F902B1_11 5769-5771     F902B2_11 5772-5774
        F902B3_11 5775-5777     RF91_11 5778-5779       F91_11 5780-5781
        RF92A_11 5782-5783      F92A1_11 5784-5785      F92A2_11 5786-5787
        F92A3_11 5788-5789      F92A4_11 5790-5792      F92A5_11 5793-5794
        F92A6_11 5795-5796      F92A7_11 5797-5798      RF92B_11 5799-5800
        F92B1_11 5801-5802      F92B2_11 5803-5804      F92B3_11 5805-5806
        F92B4_11 5807-5809      F92B5_11 5810-5811      F92B6_11 5812-5813
        F92B7_11 5814-5815      RF92C_11 5816-5817      F92C1_11 5818-5819
        F92C2_11 5820-5821      F92C3_11 5822-5823      F92C4_11 5824-5826
        F92C5_11 5827-5828      F92C6_11 5829-5830      F92C7_11 5831-5832
        RF92D_11 5833-5834      F92D1_11 5835-5836      F92D2_11 5837-5838
        F92D3_11 5839-5840      F92D4_11 5841-5843      F92D5_11 5844-5845
        F92D6_11 5846-5847      F92D7_11 5848-5849      RF92E_11 5850-5851
        F92E1_11 5852-5853      F92E2_11 5854-5855      F92E3_11 5856-5857
        F92E4_11 5858-5860      F92E5_11 5861-5862      F92E6_11 5863-5864
        F92E7_11 5865-5866      RF92F_11 5867-5868      F92F1_11 5869-5870
        F92F2_11 5871-5872      F92F3_11 5873-5874      F92F4_11 5875-5877
        F92F5_11 5878-5879      F92F6_11 5880-5881      F92F7_11 5882-5883
        RF92G_11 5884-5885      F92G1_11 5886-5887      F92G2_11 5888-5889
        F92G3_11 5890-5891      F92G4_11 5892-5894      F92G5_11 5895-5896
        F92G6_11 5897-5898      F92G7_11 5899-5900      RF92H_11 5901-5902
        F92H1_11 5903-5904      F92H2_11 5905-5906      F92H3_11 5907-5908
        F92H4_11 5909-5911      F92H5_11 5912-5913      F92H6_11 5914-5915
        F92H7_11 5916-5917      RF92I_11 5918-5919      F92I1_11 5920-5921
        F92I2_11 5922-5923      F92I3_11 5924-5925      F92I4_11 5926-5928
        F92I5_11 5929-5930      F92I6_11 5931-5932      F92I7_11 5933-5934
        RF92J_11 5935-5936      F92J1_11 5937-5938      F92J2_11 5939-5940
        F92J3_11 5941-5942      F92J4_11 5943-5945      F92J5_11 5946-5947
        F92J6_11 5948-5949      F92J7_11 5950-5951      JIGE_11 5952-5953
        RF10_11 5954-5955       F10_11 5956-5957        F10A_11 5958-5959
        RF101_11 5960-5961      F101_11 5962-5963       RF102_11 5964-5965
        F102_11 5966-5967       F103_11 5968-5969       RF1030_11 5970-5971
        F1030_11 5972-5973      RF1030A_11 5974-5975    F1030A_11 5976-5977
        F1030B1_11 5978-5980    F1030B2_11 5981-5983    F1030B3_11 5984-5986
        RF1031_11 5987-5988     F1031_11 5989-5990      RF1031A_11 5991-5992
        F1031A_11 5993-5994     F1031B1_11 5995-5997    F1031B2_11 5998-6000
        F1031B3_11 6001-6003    RF103A_11 6004-6005     F103A8_11 6006-6007
        F103A1_11 6008-6009     F103A2_11 6010-6011     F103A3_11 6012-6013
        F103A4_11 6014-6015     F103A7_11 6016-6017     F103A5_11 6018-6019
        RF103B_11 6020-6021     F103B8_11 6022-6023     F103B1_11 6024-6025
        F103B2_11 6026-6027     F103B3_11 6028-6029     F103B4_11 6030-6031
        F103B7_11 6032-6033     F103B5_11 6034-6035     RF103C_11 6036-6037
        F103C8_11 6038-6039     F103C1_11 6040-6041     F103C2_11 6042-6043
        F103C3_11 6044-6045     F103C4_11 6046-6047     F103C7_11 6048-6049
        F103C5_11 6050-6051     RF103D_11 6052-6053     F103D8_11 6054-6055
        F103D1_11 6056-6057     F103D2_11 6058-6059     F103D3_11 6060-6061
        F103D4_11 6062-6063     F103D7_11 6064-6065     F103D5_11 6066-6067
        RF103E_11 6068-6069     F103E8_11 6070-6071     F103E1_11 6072-6073
        F103E2_11 6074-6075     F103E3_11 6076-6077     F103E4_11 6078-6079
        F103E7_11 6080-6081     F103E5_11 6082-6083     RF103F_11 6084-6085
        F103F8_11 6086-6087     F103F1_11 6088-6089     F103F2_11 6090-6091
        F103F3_11 6092-6093     F103F4_11 6094-6095     F103F7_11 6096-6097
        F103F5_11 6098-6099     RF103G_11 6100-6101     F103G8_11 6102-6103
        F103G1_11 6104-6105     F103G2_11 6106-6107     F103G3_11 6108-6109
        F103G4_11 6110-6111     F103G7_11 6112-6113     F103G5_11 6114-6115
        RF103H_11 6116-6117     F103H8_11 6118-6119     F103H1_11 6120-6121
        F103H2_11 6122-6123     F103H3_11 6124-6125     F103H4_11 6126-6127
        F103H7_11 6128-6129     F103H5_11 6130-6131     RF103I_11 6132-6133
        F103I8_11 6134-6135     F103I1_11 6136-6137     F103I2_11 6138-6139
        F103I3_11 6140-6141     F103I4_11 6142-6143     F103I7_11 6144-6145
        F103I5_11 6146-6147     RF103J_11 6148-6149     F103J8_11 6150-6151
        F103J1_11 6152-6153     F103J2_11 6154-6155     F103J3_11 6156-6157
        F103J4_11 6158-6159     F103J7_11 6160-6161     F103J5_11 6162-6163
        RF103K_11 6164-6165     F103K8_11 6166-6167     F103K1_11 6168-6169
        F103K2_11 6170-6171     F103K3_11 6172-6173     F103K4_11 6174-6175
        F103K7_11 6176-6177     F103K5_11 6178-6179     RF103L_11 6180-6181
        F103L8_11 6182-6183     F103L1_11 6184-6185     F103L2_11 6186-6187
        F103L3_11 6188-6189     F103L4_11 6190-6191     F103L7_11 6192-6193
        F103L5_11 6194-6195     RF103M_11 6196-6197     F103M8_11 6198-6199
        F103M1_11 6200-6201     F103M2_11 6202-6203     F103M3_11 6204-6205
        F103M4_11 6206-6207     F103M7_11 6208-6209     F103M5_11 6210-6211
        RF1032_11 6212-6213     F1032_11 6214-6215      RF1033_11 6216-6217
        F1033_11 6218-6219      F111A_11 6220-6221      F111B_11 6222-6223
        F111C_11 6224-6225      F112A_11 6226-6227      F112B_11 6228-6229
        F112C_11 6230-6231      F113A_11 6232-6233      F113B_11 6234-6235
        F113C_11 6236-6237      RF12_11 6238-6239       F12A_11 6240-6244
        F12B_11 6245-6249       F12C_11 6250-6254       RF13_11 6255-6256
        F13A_11 6257-6261       F13B_11 6262-6266       F13C_11 6267-6271
        RF14_11 6272-6273       F141_11 6274-6275       F142_11 6276-6277
        F143_11 6278-6279       F144_11 6280-6281       F145_11 6282-6283
        F146_11 6284-6285       F147_11 6286-6287       F148_11 6288-6289
        F149_11 6290-6291       F14T_11 $6292           RF15_11 6293-6294
        F151_11 6295-6296       F152_11 6297-6298       F153_11 6299-6300
        F154_11 6301-6302       F155_11 6303-6304       F156_11 6305-6306
        F157_11 6307-6308       F158_11 6309-6310       F159_11 6311-6312
        F15T_11 $6313           F16_11 6314-6315        RG01_11 6316-6317
        G01_11 6318-6319        RG02_11 6320-6321       G02_11 6322-6336 .12
        RG1_11 6337-6338        G1_11 6339-6340         G1A_11 $6341
        RG21_11 6342-6343       G21_11 6344-6345        RG22_11 6346-6347
        G22_11 6348-6349        RG23_11 6350-6351       G23_11 6352-6353
        RG24_11 6354-6355       G24_11 6356-6357        RG24A_11 6358-6359
        G24A_11 6360-6361       RG25_11 6362-6363       G25_11 6364-6365
        RG25A_11 6366-6367      G25A_11 6368-6369       RG3_11 6370-6371
        G3_11 6372-6373         RG4_11 6374-6375        G4_11 6376-6377
        RG4A_11 6378-6379       G4A_11 6380-6381        RG4B_11 6382-6383
        G4B_11 6384-6385        RG5_11 6386-6387        G511_11 6388-6390
        G512_11 6391-6393       G521_11 6394-6396       G522_11 6397-6399
        G6_11 6400-6401         G7_11 6402-6404         G81_11 6405-6406
        G82_11 6407-6408        G83_11 6409-6410        G9_11 6411-6412
        G101_11 6413-6415       G1011_11 6416-6417      G102_11 6418-6419
        G1021_11 6420-6422      G122_11 6423-6425       G123_11 6426-6428
        G102B_11 6429-6431      G102C_11 6432-6434      RG106_11 6435-6436
        G106_11 6437-6438       RG1061_11 6439-6440     G1061_11 6441-6442
        RG1062_11 6443-6444     G1062_11 6445-6446      RG1063_11 6447-6448
        G1063_11 6449-6450      G11_11 6451-6452        G12_11 6453-6454
        RG130_11 6455-6456      G130_11 6457-6458       RG13_11 6459-6460
        G131_11 6461-6462       G132_11 6463-6464       RG14A_11 6465-6466
        G14A1_11 6467-6468      G14A2_11 6469-6471      RG14B_11 6472-6473
        G14B1_11 6474-6475      G14B2_11 6476-6478      RG14C_11 6479-6480
        G14C1_11 6481-6482      G14C2_11 6483-6485      G15A1_11 6486-6487
        G15A2_11 6488-6489      G15A3_11 6490-6491      G15B1_11 6492-6493
        G15B2_11 6494-6495      G15B3_11 6496-6497      G15C1_11 6498-6499
        G15C2_11 6500-6501      G15C3_11 6502-6503      G15D1_11 6504-6505
        G15D2_11 6506-6507      G15D3_11 6508-6509      G15E1_11 6510-6511
        G15E2_11 6512-6513      G15E3_11 6514-6515      G15F1_11 6516-6517
        G15F2_11 6518-6519      G15F3_11 6520-6521      G15G1_11 6522-6523
        G15G2_11 6524-6525      G15G3_11 6526-6527      G15H1_11 6528-6529
        G15H2_11 6530-6531      G15H3_11 6532-6533      G15I1_11 6534-6535
        G15I2_11 6536-6537      G15I3_11 6538-6539      G15J1_11 6540-6541
        G15J2_11 6542-6543      G15J3_11 6544-6545      G15K1_11 6546-6547
        G15K2_11 6548-6549      G15K3_11 6550-6551      G15L1_11 6552-6553
        G15L2_11 6554-6555      G15L3_11 6556-6557      G15M1_11 6558-6559
        G15M2_11 6560-6561      G15M3_11 6562-6563      G15N1_11 6564-6565
        G15N2_11 6566-6567      G15N3_11 6568-6569      G15O1_11 6570-6571
        G15O2_11 6572-6573      G15O3_11 6574-6575      G15P1_11 6576-6577
        G15P2_11 6578-6579      G15P3_11 6580-6581      G15Q1_11 6582-6583
        G15Q2_11 6584-6585      G15Q3_11 6586-6587      G15R1_11 6588-6589
        G15R2_11 6590-6591      G15R3_11 6592-6593      G15N1A_11 6594-6595
        G15N2A_11 6596-6597     G15N3A_11 6598-6599     G15S1_11 6600-6601
        G15S2_11 6602-6603      G15S3_11 6604-6605      G15T1_11 6606-6607
        G15T2_11 6608-6609      G15T3_11 6610-6611      G15U1_11 6612-6613
        G15U2_11 6614-6615      G15U3_11 6616-6617      G15J1A_11 6618-6619
        G15J2A_11 6620-6621     G15J3A_11 6622-6623     G15V1_11 6624-6625
        G15V2_11 6626-6627      G15V3_11 6628-6629      G15Y2_11 6630-6631
        G15Y3_11 6632-6633      H1_11 6634-6635         H21_11 6636-6637
        H22_11 6638-6639        H3_11 6640-6641         H6_11 6642-6643
        H7_11 6644-6645         H71_11 6646-6647        D11VYEAR 6648-6651
        D11VMONTH 6652-6653     D11VDAY 6654-6655       D11RESID 6656-6657
        D11AGE 6658-6660        D11MARRY 6661-6662      D11MARRY1 6663-6664
        D11YR1 6665-6668        D11MON1 6669-6670       D11RETIRE 6671-6672
        D11RETYR 6673-6676      D11RETPEN 6677-6680     D11INSUR 6681-6682
        D11PAYIND 6683-6687     D11PAYGOV 6688-6692     D11INSPEN 6693-6696
        D11NOINSU 6697-6698     D11A53A1 6699-6700      D11A53A3 6701-6702
        D11A53A4 6703-6705      D11A53A5 6706-6707      D11A53A6 6708-6709
        D11A53B1 6710-6711      D11A53B3 6712-6713      D11A53B4 6714-6716
        D11A53B5 6717-6718      D11A53B6 6719-6720      D11A53C1 6721-6722
        D11A53C3 6723-6724      D11A53C4 6725-6727      D11A53C5 6728-6729
        D11A53C6 6730-6731      D11A53D1 6732-6733      D11A53D3 6734-6735
        D11A53D4 6736-6738      D11A53D5 6739-6740      D11A53D6 6741-6742
        D11A53E1 6743-6744      D11A53E3 6745-6746      D11A53E4 6747-6749
        D11A53E5 6750-6751      D11A53E6 6752-6753      D11A53F1 6754-6755
        D11A53F3 6756-6757      D11A53F4 6758-6760      D11A53F5 6761-6762
        D11A53F6 6763-6764      D11A53G1 6765-6766      D11A53G3 6767-6768
        D11A53G4 6769-6771      D11A53G5 6772-6773      D11A53G6 6774-6775
        D11A53H1 6776-6777      D11A53H3 6778-6779      D11A53H4 6780-6782
        D11A53H5 6783-6784      D11A53H6 6785-6786      D11A53I1 6787-6788
        D11A53I3 6789-6790      D11A53I4 6791-6793      D11A53I5 6794-6795
        D11A53I6 6796-6797      D11A53J1 6798-6799      D11A53J3 6800-6801
        D11A53J4 6802-6804      D11A53J5 6805-6806      D11A53J6 6807-6808
        D11LIVARR 6809-6810     D11PERSON 6811-6812     D11GENER 6813-6814
        D11DPLACE 6815-6816     D11CARGIV 6817-6818     D11PCGDAY 6819-6820
        D11BEDRID 6821-6822     D11BEDDAY 6823-6826     D11ILL 6827-6828
        D11DISEA1 6829-6830     D11DIDAY1 6831-6834     D11DISEA2 6835-6836
        D11DIDAY2 6837-6840     D11DISEA3 6841-6842     D11DIDAY3 6843-6846
        D11HYPERT 6847-6848     D11DIABET 6849-6850     D11HEART 6851-6852
        D11CVD 6853-6854        D11PNEUM 6855-6856      D11TUBERC 6857-6858
        D11CANCER 6859-6860     D11GLAUCO 6861-6862     D11PROSTA 6863-6864
        D11GYNECO 6865-6866     D11GASTRI 6867-6868     D11PARKIN 6869-6870
        D11BEDSOR 6871-6872     D11DEMENT 6873-6874     D11PSYCHO 6875-6876
        D11NEUROS 6877-6878     D11ARTHRI 6879-6880     D11OTHERS 6881-6882
        D11MEDICA 6883-6884     D11FINANC 6885-6886     D11INCOME 6887-6891
        D11WCFACI 6892-6893     D11TAPWAT 6894-6895     D11BATHFA 6896-6897
        D11HEATER 6898-6899     D11TVSET 6900-6901      D11WASHMA 6902-6903
        D11PHONE 6904-6905      D11DOCTOR 6906-6907     D11LICDOC 6908-6909
        D11WHOPAY 6910-6911     D11MEDCOS 6912-6916     D11POCKET 6917-6921
        D11BATHFU 6922-6923     D11BATDAY 6924-6927     D11BATDAY1 6928-6931
        D11BATDAY2 6932-6935    D11DRESFU 6936-6937     D11DREDAY 6938-6941
        D11DREDAY1 6942-6945    D11DREDAY2 6946-6949    D11TOILFU 6950-6951
        D11TOIDAY 6952-6955     D11TOIDAY1 6956-6959    D11TOIDAY2 6960-6963
        D11MOVEFU 6964-6965     D11MOVDAY 6966-6969     D11MOVDAY1 6970-6973
        D11MOVDAY2 6974-6977    D11CONTFU 6978-6979     D11CONDAY 6980-6983
        D11CONDAY1 6984-6987    D11CONDAY2 6988-6991    D11FEEDFU 6992-6993
        D11FEEDAY 6994-6997     D11FEEDAY1 6998-7001    D11FEEDAY2 7002-7005
        D11FULLDA 7006-7009     D11CARCST 7010-7014     D11DIRCST 7015-7019
        D11CARPAY 7020-7021     D11OUTDOR 7022-7025     D11ACTDAY 7026-7029
        D11SMOKE 7030-7031      D11SMKTIM 7032-7033     D11D21B 7034-7035
        D11DRINK 7036-7037      D11KNDDRK 7038-7039     D11DRKMCH 7040-7043 .1
        D11ADVDIR 7044-7045     D11DIRDAY 7046-7049     D11DREAM 7050-7051
        D11PAIN 7052-7053       D11UNCONS 7054-7055     D11UNCDAY 7056-7059
        D11A533 7060-7061       D11A534 7062-7065       D11A535 7066-7067
        D11A536 7068-7069       D11A537 7070-7071       D11G23 7072-7073
        D11G24 7074-7075        D11G24A 7076-7077       D11G25 7078-7079
        D11G25A 7080-7081       D11G4 7082-7083         D11G4A 7084-7085
        D11G4B 7086-7087        D11G102 7088-7090       D11G106 7091-7092
        D11G1061 7093-7094      D11G1062 7095-7096      D11G1063 7097-7098
        DTH11_14 7099-7100      YEARIN_14 7101-7104     MONTHIN_14 7105-7106
        DAYIN_14 7107-7108      V_BTHYR_14 7109-7112    V_BTHMON_14 7113-7114
        RESIDENC_14 7115        TRUEAGE_14 7116-7118    RA41_14 7119
        A41_14 7120-7121        RA42_14 7122            A42_14 7123
        RA43_14 7124            A43_14 7125             RA51_14 7126
        A51_14 7127             RA52_14 7128-7129       A52_14 7130-7131
        RA53A_14 7132-7133      A53A1_14 7134-7135      A53A11_14 7136
        A53A2_14 7137-7139      A53A3_14 7140-7142      A53A4_14 7143-7144
        A53A5_14 7145-7146      RA53B_14 7147-7148      A53B1_14 7149-7150
        A53B11_14 7151          A53B2_14 7152-7154      A53B3_14 7155-7157
        A53B4_14 7158-7159      A53B5_14 7160-7161      RA53C_14 7162-7163
        A53C1_14 7164-7165      A53C11_14 7166          A53C2_14 7167-7169
        A53C3_14 7170-7174 .1   A53C4_14 7175-7176      A53C5_14 7177-7178
        RA53D_14 7179-7180      A53D1_14 7181-7182      A53D11_14 7183
        A53D2_14 7184-7186      A53D3_14 7187-7189      A53D4_14 7190-7191
        A53D5_14 7192-7193      RA53E_14 7194-7195      A53E1_14 7196-7197
        A53E11_14 7198          A53E2_14 7199-7201      A53E3_14 7202-7204
        A53E4_14 7205-7206      A53E5_14 7207-7208      RA53F_14 7209-7210
        A53F1_14 7211-7212      A53F11_14 7213          A53F2_14 7214-7216
        A53F3_14 7217-7221 .1   A53F4_14 7222-7223      A53F5_14 7224-7225
        RA53G_14 7226-7227      A53G1_14 7228-7229      A53G11_14 7230
        A53G2_14 7231-7233      A53G3_14 7234-7236      A53G4_14 7237-7238
        A53G5_14 7239-7240      RA53H_14 7241-7242      A53H1_14 7243-7244
        A53H11_14 7245          A53H2_14 7246-7248      A53H3_14 7249-7251
        A53H4_14 7252-7253      A53H5_14 7254-7255      RA53I_14 7256-7257
        A53I1_14 7258-7259      A53I11_14 7260          A53I2_14 7261-7263
        A53I3_14 7264-7266      A53I4_14 7267-7268      A53I5_14 7269-7270
        RA53J_14 7271-7272      A53J1_14 7273-7274      A53J11_14 7275
        A53J2_14 7276-7278      A53J3_14 7279-7281      A53J4_14 7282-7283
        A53J5_14 7284-7285      RA530_14 7286-7287      A530_14 7288-7289
        A530A_14 7290           RA531_14 7291-7292      A531_14 7293-7294
        A531A_14 7295           RA532_14 7296-7297      A532_14 7298-7299
        RA533_14 7300-7301      A533_14 7302            A533A_14 7303
        RA534_14 7304-7305      A534_14 7306-7309       RA535_14 7310-7311
        A535_14 7312            RA536_14 7313-7314      A536_14 7315
        RA537_14 7316-7317      A537_14 7318            A537A_14 7319
        RA540_14 7320-7321      A540_14 7322            RA541_14 7323-7324
        A541_14 7325-7328       RA542_14 7329-7330      A542_14 7331-7332
        A542A_14 7333           RA54_14 7334-7335       A54A_14 7336-7339
        A54B_14 7340-7341       B11_14 7342             B12_14 7343
        B121_14 7344            B21_14 7345             B22_14 7346
        B23_14 7347             B24_14 7348             B25_14 7349
        B26_14 7350             B27_14 7351             B28_14 7352
        B29_14 7353             B210_14 7354            C11_14 7355
        C12_14 7356             C13_14 7357             C14_14 7358
        C15_14 7359             C16_14 7360-7361        C21A_14 7362
        C21B_14 7363            C21C_14 7364            C22_14 7365-7366
        C31A_14 7367            C31B_14 7368            C31C_14 7369
        C31D_14 7370            C31E_14 7371            C32_14 7372
        C41A_14 7373            C41B_14 7374            C41C_14 7375
        C51A_14 7376            C51B_14 7377            C52_14 7378
        C53A_14 7379            C53B_14 7380            C53C_14 7381
        C54_14 7382             C55_14 7383-7384        RD1_14 7385
        D1_14 7386              RD2_14 7387             D2_14 7388-7391 .1
        RD31_14 7392            D31_14 7393             RD32_14 7394
        D32_14 7395             RD33_14 7396-7397       D33_14 7398
        D33A_14 7399            RD34_14 7400-7401       D34_14 7402
        RD4MEAT_14 7403         D4MEAT2_14 7404         D4MEAT1_14 7405
        RD4FISH_14 7406         D4FISH2_14 7407         D4FISH1_14 7408
        RD4EGG_14 7409          D4EGG2_14 7410          D4EGG1_14 7411
        RD4BEAN_14 7412         D4BEAN2_14 7413         D4BEAN1_14 7414
        RD4VEG_14 7415          D4VEG2_14 7416          D4VEG1_14 7417
        RD4SUGA_14 7418         D4SUGA2_14 7419         D4SUGA1_14 7420
        RD4TEA_14 7421          D4TEA2_14 7422          D4TEA1_14 7423
        RD4GARL_14 7424         D4GARL2_14 7425         D4GARL1_14 7426
        RD4MILK_14 7427-7428    D4MILK1_14 7429         D4MILK2_14 7430
        RD4NUT_14 7431-7432     D4NUT1_14 7433          D4NUT2_14 7434
        RD4ALGA_14 7435-7436    D4ALGA1_14 7437         D4ALGA2_14 7438
        RD4VIT_14 7439-7440     D4VIT1_14 7441          D4VIT2_14 7442
        RD4DRUG_14 7443-7444    D4DRUG1_14 7445         D4DRUG2_14 7446
        D4A_14 7447             D4B_14 7448             RD5_14 7449
        D5_14 7450              RD6_14 7451             D6A_14 7452
        D6B_14 7453             D6C_14 7454             RD71_14 7455
        D71_14 7456             RD72_14 7457            D72_14 7458
        RD73_14 7459-7460       D73_14 7461-7463        RD74_14 7464-7465
        D74_14 7466-7468        RD75_14 7469-7470       D75_14 7471-7472
        RD76_14 7473-7474       D76_14 7475             RD77_14 7476-7477
        D77_14 7478             RD78_14 7479-7480       D78_14 7481
        D78A_14 7482-7485 .1    D78B_14 7486-7487       RD79_14 7488-7489
        D79_14 7490             D79A_14 7491-7492       D79B_14 7493-7494
        RD710_14 7495-7496      D710_14 7497            D710A_14 7498-7501 .1
        D710B_14 7502-7503      RD81_14 7504            D81_14 7505
        RD82_14 7506            D82_14 7507             RD83_14 7508-7509
        D83_14 7510-7512        RD84_14 7513-7514       D84_14 7515-7517
        RD85_14 7518-7519       D85_14 7520-7521        D85A_14 7522
        RD86_14 7523-7524       D86_14 7525-7528 .1     RD87_14 7529-7530
        D87_14 7531             RD91_14 7532            D91_14 7533
        RD92_14 7534-7535       D92_14 7536             RD93_14 7537-7538
        D93_14 7539-7541        RD94_14 7542-7543       D94_14 7544-7546
        RD101_14 7547           D101_14 7548            RD102_14 7549-7550
        D102_14 7551-7553       RD103_14 7554-7555      D103_14 7556-7558
        RD11A_14 7559           D11A_14 7560            RD11B_14 7561
        D11B_14 7562            RD11C_14 7563           D11C_14 7564
        RD11D_14 7565           D11D_14 7566            RD11E_14 7567
        D11E_14 7568            RD11F_14 7569           D11F_14 7570
        RD11G_14 7571           D11G_14 7572            RD11H_14 7573
        D11H_14 7574            RD12_14 7575            D12_14 7576-7577
        RE0_14 7578-7579        E0_14 7580              RE1_14 7581
        E1_14 7582              RE1B_14 7583-7584       E1B_14 7585-7588
        RE2_14 7589             E2_14 7590              RE2B_14 7591-7592
        E2B_14 7593-7596        RE3_14 7597             E3_14 7598
        RE3B_14 7599-7600       E3B_14 7601-7604        RE4_14 7605
        E4_14 7606              RE4B_14 7607-7608       E4B_14 7609-7612
        RE5_14 7613             E5_14 7614              RE5B_14 7615-7616
        E5B_14 7617-7620        RE6_14 7621             E6_14 7622
        RE6B_14 7623-7624       E6B_14 7625-7628        RE610_14 7629-7630
        E610_14 7631-7632       RE62_14 7633-7634       E62_14 7635-7636
        RE63_14 7637-7638       E63_14 7639-7643        RE64_14 7644-7645
        E64_14 7646-7647        E64A_14 7648            RE65_14 7649-7650
        E65_14 7651-7652        RE67_14 7653-7654       E67_14 7655-7657
        RE7_14 7658             E7_14 7659              RE8_14 7660
        E8_14 7661              RE9_14 7662             E9_14 7663
        RE10_14 7664            E10_14 7665             RE11_14 7666
        E11_14 7667             RE12_14 7668            E12_14 7669
        RE13_14 7670            E13_14 7671             RE14_14 7672
        E14_14 7673             RF1_14 7674             F1_14 7675-7676
        RF2_14 7677             F2_14 7678              RF21_14 7679-7680
        F21_14 7681             RF211_14 7682-7683      F211_14 7684-7685
        RF22_14 7686-7687       F22_14 7688-7691        RF221_14 7692-7693
        F221_14 7694-7698       RF23_14 7699-7700       F23_14 7701-7702
        RF24_14 7703-7704       F24_14 7705             RF25A_14 7706-7707
        F25A1_14 7708-7712      F25A2_14 7713-7717      RF25B_14 7718-7719
        F25B1_14 7720-7723      F25B2_14 7724-7725      RF26_14 7726-7727
        F26_14 7728-7730        RF27_14 7731-7732       F27_14 7733
        RF31_14 7734            F31_14 7735             RF32_14 7736
        F32A_14 7737-7738       F32B_14 7739-7740       F32C_14 7741-7742
        F32D_14 7743-7744       F32E_14 7745-7746       RF33_14 7747
        F33_14 7748             RF340_14 7749-7750      F340_14 7751
        RF34_14 7752            F34_14 7753             RF35_14 7754
        F35_14 7755-7759        RF41_14 7760            F41_14 7761
        RF41A_14 7762-7763      F41A1_14 7764           F41A11_14 7765-7768
        F41A12_14 7769-7770     F41A2_14 7771           F41A21_14 7772-7775
        F41A22_14 7776-7777     F41A3_14 7778           F41A31_14 7779-7782
        F41A32_14 7783-7784     RF41B_14 7785-7786      F41B_14 7787
        F41B1_14 7788-7791      F41B2_14 7792-7793      RF42_14 7794-7795
        F42_14 7796-7797        RF43A_14 7798-7799      F43A1_14 7800-7802
        F43A2_14 7803-7804      F43A3_14 7805-7807      F43A4_14 7808-7809
        RF43B_14 7810-7811      F43B1_14 7812-7814      F43B2_14 7815-7816
        F43B3_14 7817-7819      F43B4_14 7820-7821      RF43C_14 7822-7823
        F43C1_14 7824-7826      F43C2_14 7827-7828      F43C3_14 7829-7831
        F43C4_14 7832-7833      RF43D_14 7834-7835      F43D1_14 7836-7838
        F43D2_14 7839-7840      F43D3_14 7841-7843      F43D4_14 7844-7845
        RF44_14 7846-7847       F44_14 7848-7849        RF45_14 7850-7851
        F45_14 7852-7853        RF46_14 7854-7855       F46_14 7856-7857
        RF47_14 7858-7859       F47_14 7860             RF5_14 7861
        F5_11_14 7862-7863      RF61_14 7864            F61_14 7865
        RF610_14 7866-7867      F610_14 7868-7869       RF62_14 7870
        F62_14 7871             RF63_14 7872            F63_14 7873
        RF64_14 7874            F64A_14 7875            F64B_14 7876
        F64C_14 7877            F64D_14 7878            F64E_14 7879
        F64F_14 7880            F64G_14 7881            F64H_14 7882
        F64I_14 7883            RF651A1_14 7884-7885    F651A1_14 7886-7890
        RF651B1_14 7891-7892    F651B1_14 7893-7897     RF651A2_14 7898-7899
        F651A2_14 7900-7904     RF651B2_14 7905-7906    F651B2_14 7907-7911
        RF6521_14 7912-7913     F6521_14 7914           F6521T_14 7915
        RF652A_14 7916-7917     F652A_14 7918-7932 .12  RF652B_14 7933-7934
        F652B_14 7935           RF66_14 7936-7937       F66_14 7938
        RF71_14 7939-7940       F71_14 7941             RF721_14 7942-7943
        F721_14 7944-7946       RF722_14 7947-7948      F722_14 7949-7951
        RF73_14 7952-7953       F73_14 7954-7956        RF74_14 7957
        F74_14 7958-7959        RF81_14 7960            F81_14 7961
        RF821_14 7962-7963      F821_14 7964-7966       RF822_14 7967-7968
        F822_14 7969-7971       RF83_14 7972-7973       F83_14 7974-7988 .11
        RF84_14 7989            F84_14 7990             RF85_14 7991
        F85_14 7992-7993        RF86_14 7994            F86_14 7995-7996
        RF91_14 7997            F91_14 7998-7999        RF92A_14 8000-8001
        F92A1_14 8002-8003      F92A2_14 8004-8005      F92A3_14 8006-8007
        F92A4_14 8008-8010      F92A5_14 8011-8012      F92A6_14 8013-8014
        F92A7_14 8015-8016      RF92B_14 8017-8018      F92B1_14 8019-8020
        F92B2_14 8021-8022      F92B3_14 8023-8024      F92B4_14 8025-8027
        F92B5_14 8028-8029      F92B6_14 8030-8031      F92B7_14 8032-8033
        RF92C_14 8034-8035      F92C1_14 8036-8037      F92C2_14 8038-8039
        F92C3_14 8040-8041      F92C4_14 8042-8044      F92C5_14 8045-8046
        F92C6_14 8047-8048      F92C7_14 8049-8050      RF92D_14 8051-8052
        F92D1_14 8053-8054      F92D2_14 8055-8056      F92D3_14 8057-8058
        F92D4_14 8059-8061      F92D5_14 8062-8063      F92D6_14 8064-8065
        F92D7_14 8066-8067      RF92E_14 8068-8069      F92E1_14 8070-8071
        F92E2_14 8072-8073      F92E3_14 8074-8075      F92E4_14 8076-8078
        F92E5_14 8079-8080      F92E6_14 8081-8082      F92E7_14 8083-8084
        RF92F_14 8085-8086      F92F1_14 8087-8088      F92F2_14 8089-8090
        F92F3_14 8091-8092      F92F4_14 8093-8095      F92F5_14 8096-8097
        F92F6_14 8098-8099      F92F7_14 8100-8101      RF92G_14 8102-8103
        F92G1_14 8104-8105      F92G2_14 8106-8107      F92G3_14 8108-8109
        F92G4_14 8110-8112      F92G5_14 8113-8114      F92G6_14 8115-8116
        F92G7_14 8117-8118      RF92H_14 8119-8120      F92H1_14 8121-8122
        F92H2_14 8123-8124      F92H3_14 8125-8126      F92H4_14 8127-8129
        F92H5_14 8130-8131      F92H6_14 8132-8133      F92H7_14 8134-8135
        RF92I_14 8136-8137      F92I1_14 8138-8139      F92I2_14 8140-8141
        F92I3_14 8142-8143      F92I4_14 8144-8146      F92I5_14 8147-8148
        F92I6_14 8149-8150      F92I7_14 8151-8152      RF92J_14 8153-8154
        F92J1_14 8155-8156      F92J2_14 8157-8158      F92J3_14 8159-8160
        F92J4_14 8161-8163      F92J5_14 8164-8165      F92J6_14 8166-8167
        F92J7_14 8168-8169      JIGE_14 8170-8171       RF10_14 8172
        F10_14 8173-8174        F10A_14 8175-8176       RF101_14 8177-8178
        F101_14 8179-8180       RF102_14 8181-8182      F102_14 8183-8184
        RF103A_14 8185-8186     F103A8_14 8187-8188     F103A1_14 8189-8190
        F103A2_14 8191-8192     F103A3_14 8193-8195     F103A4_14 8196-8197
        F103A7_14 8198-8199     F103A5_14 8200-8201     RF103B_14 8202-8203
        F103B8_14 8204-8205     F103B1_14 8206-8207     F103B2_14 8208-8209
        F103B3_14 8210-8212     F103B4_14 8213-8214     F103B7_14 8215-8216
        F103B5_14 8217-8218     RF103C_14 8219-8220     F103C8_14 8221-8222
        F103C1_14 8223-8224     F103C2_14 8225-8226     F103C3_14 8227-8229
        F103C4_14 8230-8231     F103C7_14 8232-8233     F103C5_14 8234-8235
        RF103D_14 8236-8237     F103D8_14 8238-8239     F103D1_14 8240-8241
        F103D2_14 8242-8243     F103D3_14 8244-8246     F103D4_14 8247-8248
        F103D7_14 8249-8250     F103D5_14 8251-8252     RF103E_14 8253-8254
        F103E8_14 8255-8256     F103E1_14 8257-8258     F103E2_14 8259-8260
        F103E3_14 8261-8263     F103E4_14 8264-8265     F103E7_14 8266-8267
        F103E5_14 8268-8269     RF103F_14 8270-8271     F103F8_14 8272-8273
        F103F1_14 8274-8275     F103F2_14 8276-8277     F103F3_14 8278-8280
        F103F4_14 8281-8282     F103F7_14 8283-8284     F103F5_14 8285-8286
        RF103G_14 8287-8288     F103G8_14 8289-8290     F103G1_14 8291-8292
        F103G2_14 8293-8294     F103G3_14 8295-8297     F103G4_14 8298-8299
        F103G7_14 8300-8301     F103G5_14 8302-8303     RF103H_14 8304-8305
        F103H8_14 8306-8307     F103H1_14 8308-8309     F103H2_14 8310-8311
        F103H3_14 8312-8314     F103H4_14 8315-8316     F103H7_14 8317-8318
        F103H5_14 8319-8320     RF103I_14 8321-8322     F103I8_14 8323-8324
        F103I1_14 8325-8326     F103I2_14 8327-8328     F103I3_14 8329-8331
        F103I4_14 8332-8333     F103I7_14 8334-8335     F103I5_14 8336-8337
        RF103J_14 8338-8339     F103J8_14 8340-8341     F103J1_14 8342-8343
        F103J2_14 8344-8345     F103J3_14 8346-8348     F103J4_14 8349-8350
        F103J7_14 8351-8352     F103J5_14 8353-8354     RF103K_14 8355-8356
        F103K8_14 8357-8358     F103K1_14 8359-8360     F103K2_14 8361-8362
        F103K3_14 8363-8365     F103K4_14 8366-8367     F103K7_14 8368-8369
        F103K5_14 8370-8371     RF103L_14 8372-8373     F103L8_14 8374-8375
        F103L1_14 8376-8377     F103L2_14 8378-8379     F103L3_14 8380-8382
        F103L4_14 8383-8384     F103L7_14 8385-8386     F103L5_14 8387-8388
        RF103M_14 8389-8390     F103M8_14 8391-8392     F103M1_14 8393-8394
        F103M2_14 8395-8396     F103M3_14 8397-8399     F103M4_14 8400-8401
        F103M7_14 8402-8403     F103M5_14 8404-8405     RF104_14 8406-8407
        F104_14 8408-8410       RF105_14 8411-8412      F105_14 8413-8415
        F111A_14 8416-8417      F111B_14 8418-8419      F111C_14 8420-8421
        F112A_14 8422-8423      F112B_14 8424-8425      F112C_14 8426-8427
        F113A_14 8428-8429      F113B_14 8430-8431      F113C_14 8432-8433
        RF12_14 8434-8435       F12A_14 8436-8440       F12B_14 8441-8445
        F12C_14 8446-8450       RF13_14 8451-8452       F13A_14 8453-8457
        F13B_14 8458-8462       F13C_14 8463-8467       RF14_14 8468-8469
        F141_14 8470            F142_14 8471            F143_14 8472
        F144_14 8473            F145_14 8474            F146_14 8475
        F147_14 8476            F148_14 8477            F149_14 8478
        F14T_14 8479            RF15_14 8480-8481       F151_14 8482
        F152_14 8483            F153_14 8484            F154_14 8485
        F155_14 8486            F156_14 8487            F157_14 8488
        F158_14 8489            F159_14 8490            F15T_14 8491
        F16_14 8492             RG01_14 8493-8494       G01_14 8495
        RG02_14 8496-8497       G02_14 8498-8499        RG1_14 8500-8501
        G1_14 8502              G1A_14 8503             RG21_14 8504-8505
        G21_14 8506-8507        RG22_14 8508-8509       G22_14 8510
        RG23_14 8511-8512       G23_14 8513             RG24_14 8514-8515
        G24_14 8516             RG24A_14 8517-8518      G24A_14 8519-8520
        RG25_14 8521-8522       G25_14 8523             RG25A_14 8524-8525
        G25A_14 8526-8527       RG3_14 8528-8529        G3_14 8530
        RG4_14 8531-8532        G4_14 8533              RG4A_14 8534-8535
        G4A_14 8536             RG4B_14 8537-8538       G4B_14 8539
        RG5_14 8540-8541        G511_14 8542-8544       G512_14 8545-8547
        G521_14 8548-8550       G522_14 8551-8553       G6_14 8554
        G7_14 8555-8557         G81_14 8558             G82_14 8559
        G83_14 8560             G9_14 8561              G101_14 8562-8564
        G1011_14 8565-8566      G102_14 8567            G1021_14 8568-8570
        G122_14 8571-8572       G123_14 8573-8574       G102C_14 8575-8577
        RG106_14 8578-8579      G106_14 8580            RG1061_14 8581-8582
        G1061_14 8583           RG1062_14 8584-8585     G1062_14 8586
        RG1063_14 8587-8588     G1063_14 8589           G11_14 8590
        G12_14 8591-8592        RG130_14 8593-8594      G130_14 8595
        RG13_14 8596            G131_14 8597-8598       G132_14 8599-8600
        RG14A_14 8601-8602      G14A1_14 8603-8605      G14A2_14 8606-8609
        G141T_14 8610           RG14B_14 8611-8612      G14B1_14 8613-8615
        G14B2_14 8616-8618      G142T_14 8619           RG14C_14 8620-8621
        G14C1_14 8622-8624      G14C2_14 8625-8627      G143T_14 8628
        G15A1_14 8629           G15A2_14 8630           G15A3_14 8631-8632
        G15B1_14 8633           G15B2_14 8634           G15B3_14 8635-8636
        G15C1_14 8637           G15C2_14 8638           G15C3_14 8639-8640
        G15D1_14 8641           G15D2_14 8642           G15D3_14 8643-8644
        G15E1_14 8645           G15E2_14 8646           G15E3_14 8647-8648
        G15F1_14 8649           G15F2_14 8650           G15F3_14 8651-8652
        G15G1_14 8653           G15G2_14 8654           G15G3_14 8655-8656
        G15H1_14 8657           G15H2_14 8658           G15H3_14 8659-8660
        G15I1_14 8661           G15I2_14 8662           G15I3_14 8663-8664
        G15J1_14 8665-8666      G15J2_14 8667           G15J3_14 8668-8669
        G15K1_14 8670           G15K2_14 8671           G15K3_14 8672-8673
        G15L1_14 8674           G15L2_14 8675           G15L3_14 8676-8677
        G15M1_14 8678           G15M2_14 8679           G15M3_14 8680-8681
        G15N1_14 8682           G15N2_14 8683           G15N3_14 8684-8685
        G15O1_14 8686           G15O2_14 8687           G15O3_14 8688-8689
        G15P1_14 8690           G15P2_14 8691           G15P3_14 8692-8693
        G15Q1_14 8694           G15Q2_14 8695           G15Q3_14 8696-8697
        G15R1_14 8698           G15R2_14 8699           G15R3_14 8700-8701
        G15N1A_14 8702          G15N2A_14 8703          G15N3A_14 8704-8705
        G15S1_14 8706           G15S2_14 8707           G15S3_14 8708-8709
        G15T1_14 8710           G15T2_14 8711           G15T3_14 8712-8713
        G15U1_14 8714-8715      G15U2_14 8716-8717      G15U3_14 8718-8719
        G15J1A_14 8720          G15J2A_14 8721          G15J3A_14 8722-8723
        G15V1_14 8724-8725      G15V2_14 8726-8727      G15V3_14 8728-8729
        G15Y1_14 $8730-8738     G15Y2_14 8739-8741      G15Y3_14 8742-8743
        G15YT_14 8744           H1_14 8745              H21_14 8746
        H22_14 8747-8748        H3_14 8749              H5_14 8750-8752
        H6_14 8753              H7_14 8754              H71_14 8755-8756
        D14VYEAR 8757-8760      D14VMONTH 8761-8762     D14VDAY 8763-8764
        D14AGE 8765-8767        D14MARRY 8768-8769      D14MARRY1 8770-8771
        D14YR1 $8772-8775       D14MON1 $8776-8777      D14D22 8778-8779
        D14D231 $8780-8788      D14D232 $8789-8797      D14D233 $8798-8806
        D14D234 $8807-8815      D14D24 $8816-8824       D14D25 8825-8827
        D14D26A1 8828-8829      D14D26A2 8830-8831      D14D26A3 $8832-8840
        D14D26A4 $8841-8849     D14D26A5 8850           D14D26A6 8851-8852
        D14D26A61 $8853-8854    D14D26B1 8855-8856      D14D26B2 8857-8858
        D14D26B3 8859-8861      D14D26B4 8862           D14D26B5 8863
        D14D26B6 8864-8865      D14D26B61 $8866-8867    D14D26C1 8868-8869
        D14D26C2 8870-8871      D14D26C3 8872-8874      D14D26C4 8875
        D14D26C5 8876           D14D26C6 8877-8878      D14D26C61 8879-8880
        D14D26D1 8881-8882      D14D26D2 8883-8884      D14D26D3 8885-8887
        D14D26D4 8888           D14D26D5 8889           D14D26D6 8890-8891
        D14D26D61 8892-8893     D14D26E1 8894-8895      D14D26E2 8896-8897
        D14D26E3 $8898-8900     D14D26E4 $8901-8909     D14D26E5 8910
        D14D26E6 8911-8912      D14D26E61 8913          D14D26F1 8914-8915
        D14D26F2 8916-8917      D14D26F3 8918-8919      D14D26F4 $8920
        D14D26F5 8921           D14D26F6 8922-8923      D14D26F61 8924
        D14D26G1 8925-8926      D14D26G11 8927          D14D26G2 8928-8929
        D14D26G3 8930-8931      D14D26G4 8932           D14D26G5 8933
        D14D26G6 8934-8935      D14D26G61 8936-8937     D14D26H1 8938-8939
        D14D26H11 8940          D14D26H2 8941-8942      D14D26H3 8943-8944
        D14D26H4 $8945          D14D26H5 8946           D14D26H6 8947-8948
        D14D26H61 8949-8950     D14D26I1 8951-8952      D14D26I11 8953
        D14D26I2 8954-8955      D14D26I3 8956-8957      D14D26I4 8958
        D14D26I5 8959           D14D26I6 8960-8961      D14D26I61 8962-8963
        D14D26J1 8964-8965      D14D26J11 8966          D14D26J2 8967-8968
        D14D26J3 8969-8970      D14D26J4 8971           D14D26J5 8972
        D14D26J51 8973          D14D26J6 8974-8975      D14D26J61 $8976-8977
        D14LIVARR 8978-8979     D14PERSON 8980-8982     D14GENER 8983-8985
        D14DPLACE 8986-8987     D14CARGIV 8988-8989     D14PCGDAY $8990-8993
        D14BEDRID 8994-8995     D14BEDDAY $8996-9004    D14ILL 9005-9006
        D14DISEA1 $9007-9015    D14DIDAY1 $9016-9019    D14DISEA2 $9020-9028
        D14DIDAY2 $9029-9032    D14DISEA3 $9033-9041    D14DIDAY3 $9042-9045
        D14HYPERT 9046-9047     D14DIABET 9048-9049     D14HEART 9050-9051
        D14CVD 9052-9053        D14PNEUM 9054-9055      D14TUBERC 9056-9057
        D14CANCER 9058-9059     D14GLAUCO 9060-9061     D14PROSTA 9062-9063
        D14GYNECO 9064-9065     D14GASTRI 9066-9067     D14PARKIN 9068-9069
        D14BEDSOR 9070-9071     D14DEMENT 9072-9073     D14PSYCHO 9074-9075
        D14NEUROS 9076-9077     D14ARTHRI 9078-9079     D14OTHERS 9080-9081
        D14INCOME $9082-9090    D14WCFACI 9091-9092     D14TAPWAT 9093-9094
        D14BATHFA 9095-9096     D14HEATER 9097-9098     D14TVSET 9099-9100
        D14WASHMA 9101-9102     D14PHONE 9103-9104      D14DOCTOR 9105-9106
        D14LICDOC 9107-9108     D14WHOPAY $9109-9110    D14MEDCOS $9111-9119
        D14POCKET $9120-9124    D14BATHFU 9125-9126     D14BATDAY $9127-9130
        D14DRESFU 9131-9132     D14DREDAY $9133-9136    D14TOILFU 9137-9138
        D14TOIDAY $9139-9142    D14MOVEFU 9143-9144     D14MOVDAY $9145-9148
        D14CONTFU 9149-9150     D14CONDAY $9151-9154    D14FEEDFU 9155-9156
        D14FEEDAY $9157-9160    D14FULLDA $9161-9169    D14CARCST $9170-9174
        D14DIRCST $9175-9180    D14CARPAY 9181-9182     D14OUTDOR 9183-9186
        D14ACTDAY $9187-9190    D14SMOKE 9191-9192      D14SMKTIM 9193-9194
        D14D21B 9195-9196       D14DRINK 9197-9198      D14KNDDRK 9199-9200
        D14DRKMCH $9201-9203    D14ADVDIR 9204-9205     D14DIRDAY 9206-9209
        D14DREAM 9210-9211      D14PAIN 9212-9213       D14UNCONS 9214-9215
        D14UNCDAY $9216-9218    D14A533 9219-9220       D14A534 $9221-9224
        D14A535 9225-9226       D14A536 9227-9228       D14A537 9229-9231
        D14G23 $9232-9233       D14G24 9234-9235        D14G24A 9236-9237
        D14G25 9238-9239        D14G25A 9240-9241       D14G4 9242-9243
        D14G4A 9244-9245        D14G4B 9246-9247        D14G102 9248-9250
        D14G106 9251-9252       D14G1061 9253-9254      D14G1062 9255-9256
        D14G1063 9257-9258      D14D45 9259-9260        D14D46 $9261
        D14D47 9262             ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id id, province code +given no. + year of the wave of the very first interview' 
   MONTH02 = 'month02 month of the interview in 2002' 
   DAY02   = 'day02 day of the interview in 2002' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'prov national code for provinces sampled' 
   TYPE    = 'type category of the interviewed respondent' 
   RELATYPE= 'relatype what kind of sibling?' 
   RESIDENC= 'residenc category of residence of the interviewee at the 2002 survey' 
   TRUEAGE = 'trueage age confirmed' 
   A1      = 'a1 sex' 
   RA2     = 'ra2 proxy or not for a2' 
   A2      = 'a2 ethnic group' 
   RA41    = 'ra41 proxy or not for a41' 
   A41     = 'a41 which province were you born in?' 
   RA42    = 'ra42 proxy or not for a42' 
   A42     = 'a42 was the county (city) you born in the same as current address?' 
   RA43    = 'ra43 proxy or not for a43' 
   A43     = 'a43 was the place of birth an urban area or a rural area at time of birth' 
   RA51    = 'ra51 proxy or not for a51' 
   A51     = 'a51 co-residence of interviewee' 
   RA52    = 'ra52 proxy or not for a52' 
   A52     = 'a52 how many people are living with you?' 
   RA53A   = 'ra53a proxy or not for a53a1, a53a2, a53a3' 
   A53A1   = 'a53a1 relationship between you and 1st person you living with currently' 
   A53A2   = 'a53a2 age of 1st person you living with currently' 
   A53A3   = 'a53a3 sex of 1st person you living with currently' 
   RA53B   = 'ra53b proxy or not for a53b1, a53b2, a53b3' 
   A53B1   = 'a53b1 relationship between you and 2nd person you living with currently' 
   A53B2   = 'a53b2 age of 2nd person you living with currently' 
   A53B3   = 'a53b3 sex of 2nd person you living with currently' 
   RA53C   = 'ra53c proxy or not for a53c1, a53c2, a53c3' 
   A53C1   = 'a53c1 relationship between you and 3rd person you living with currently' 
   A53C2   = 'a53c2 age of 3rd person you living with currently' 
   A53C3   = 'a53c3 sex of 3rd person you living with currently' 
   RA53D   = 'ra53d proxy or not for a53d1, a53d2, a53d3' 
   A53D1   = 'a53d1 relationship between you and 4th person you living with currently' 
   A53D2   = 'a53d2 age of 4th person you living with currently' 
   A53D3   = 'a53d3 sex of 4th person you living with currently' 
   RA53E   = 'ra53e proxy or not for a53e1, a53e2, a53e3' 
   A53E1   = 'a53e1 relationship between you and 5th person you living with currently' 
   A53E2   = 'a53e2 age of 5th person you living with currently' 
   A53E3   = 'a53e3 sex of 5th person you living with currently' 
   RA53F   = 'ra53f proxy or not for a53f1, a53f2, a53f3' 
   A53F1   = 'a53f1 relationship between you and 6th person you living with currently' 
   A53F2   = 'a53f2 age of 6th person you living with currently' 
   A53F3   = 'a53f3 sex of 6th person you living with currently' 
   RA53G   = 'ra53g proxy or not for a53g1, a53g2, a53g3' 
   A53G1   = 'a53g1 relationship between you and 7th person you living with currently' 
   A53G2   = 'a53g2 age of 7th person you living with currently' 
   A53G3   = 'a53g3 sex of 7th person you living with currently' 
   RA53H   = 'ra53h proxy or not for a53h1, a53h2, a53h3' 
   A53H1   = 'a53h1 relationship between you and 8th person you living with currently' 
   A53H2   = 'a53h2 age of 8th person you living with currently' 
   A53H3   = 'a53h3 sex of 8th person you living with currently' 
   RA53I   = 'ra53i proxy or not for a53i1, a53i2, a53i3' 
   A53I1   = 'a53i1 relationship between you and 9th person you living with currently' 
   A53I2   = 'a53i2 age of 9th person you living with currently' 
   A53I3   = 'a53i3 sex of 9th person you living with currently' 
   RA53J   = 'ra53j proxy or not for a53j1, a53j2, a53j3' 
   A53J1   = 'a53j1 relationship between you and 10th person you living with currently' 
   A53J2   = 'a53j2 age of 10th person you living with currently' 
   A53J3   = 'a53j3 sex of 10th person you living with currently' 
   RA53K   = 'ra53k proxy or not for a53k1, a53k2, a53k3' 
   A53K1   = 'a53k1 relationship between you and 11th person you living with currently' 
   A53K2   = 'a53k2 age of 11th person you living with currently' 
   A53K3   = 'a53k3 sex of 11th person you living with currently' 
   RA53L   = 'ra53l proxy or not for a53l1, a53l2, a53l3' 
   A53L1   = 'a53l1 relationship between you and 12th person you living with currently' 
   A53L2   = 'a53l2 age of 12th person you living with currently' 
   A53L3   = 'a53l3 sex of 12th person you living with currently' 
   RA531   = 'ra531 proxy or not for a531' 
   A531    = 'a531 under whose name your current house/apartment purchased or rented' 
   RA532   = 'ra532 proxy or not for a532' 
   A532    = 'a532 do you (and your spouse) have your own bedroom?' 
   RA54    = 'ra54 proxy or not for a54a a54b' 
   A54A    = 'a54a year of being admitted to the nursing home' 
   A54B    = 'a54b month of being admitted to the nursing home' 
   B11     = 'b11 self-reported quality of life' 
   B12     = 'b12 self-reported health' 
   B121    = 'b121 do you feel any change of your health since last year?' 
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
   C131    = 'c131 name four leaders since the new republic' 
   C14     = 'c14 what is the season right now?' 
   C15     = 'c15 what is the name of this county or district?' 
   C16     = 'c16 # of kinds of food named in one minute' 
   C161    = 'c161 # of jie qi in a year?' 
   C162    = 'c162 name four province capital or big city' 
   C163    = 'c163 when we succeed in anti-japanese war?' 
   C21A    = 'c21a repeat the name of ''table'' at the first time' 
   C21B    = 'c21b repeat the name of ''apple'' at the first time' 
   C21C    = 'c21c repeat the name of ''clothes'' at the first time' 
   C22     = 'c22 attempts to repeat the names of three objects correctly' 
   C31A    = 'c31a $20-$3=?' 
   C31B    = 'c31b $20-$3-$3=?' 
   C31C    = 'c31c $20-$3-$3-$3=?' 
   C31D    = 'c31d $20-$3-$3-$3-$3=?' 
   C31E    = 'c31e $20-$3-$3-$3-$3-$3=?' 
   C32     = 'c32 draw the figure following the sample' 
   C41A    = 'c41a repeat the name of ''table'' a while later' 
   C41B    = 'c41b repeat the name of ''apple'' a while later' 
   C41C    = 'c41c repeat the name of ''clothes'' a while later' 
   C51A    = 'c51a naming ''pen''' 
   C51B    = 'c51b naming ''watch''' 
   C52     = 'c52 repeat a sentence' 
   C521    = 'c521 number of words correctly repeated' 
   C53A    = 'c53a taking paper using right hand' 
   C53B    = 'c53b folding paper' 
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
   RD4MEAT = 'rd4meat proxy or not for d4meat1 and d4meat2' 
   D4MEAT1 = 'd4meat1 how often ate meat at around age 60?' 
   D4MEAT2 = 'd4meat2 how often eat meat at present?' 
   RD4FISH = 'rd4fish proxy or not for d4fish1 and d4fish2' 
   D4FISH1 = 'd4fish1 how often ate fish at around age 60?' 
   D4FISH2 = 'd4fish2 how often eat fish at present?' 
   RD4EGG  = 'rd4egg proxy or not for d4egg1 and d4egg2' 
   D4EGG1  = 'd4egg1 how often ate eggs at around age 60?' 
   D4EGG2  = 'd4egg2 how often eat eggs at present?' 
   RD4BEAN = 'rd4bean proxy or not for d4bean1 and d4bean2' 
   D4BEAN1 = 'd4bean1 how often ate food made from bean at around age 60?' 
   D4BEAN2 = 'd4bean2 how often eat bean at present?' 
   RD4VEG  = 'rd4veg proxy or not for d4veg1 and d4veg2' 
   D4VEG1  = 'd4veg1 how often ate salt-preserved vegetables at around age 60?' 
   D4VEG2  = 'd4veg2 how often eat salt-preserved vegetables at present?' 
   RD4SUGA = 'rd4suga proxy or not for d4suga1 and d4suga2' 
   D4SUGA1 = 'd4suga1 how often ate sugar around at age 60?' 
   D4SUGA2 = 'd4suga2 how often eat sugar at present?' 
   RD4TEA  = 'rd4tea proxy or not for d4tea1 and d4tea2' 
   D4TEA1  = 'd4tea1 how often drank tea at around age 60?' 
   D4TEA2  = 'd4tea2 how often drink tea at present?' 
   RD4GARL = 'rd4garl proxy or not for d4gal1 and d4gal2' 
   D4GARL1 = 'd4garl1 how often ate garlic at around age 60?' 
   D4GARL2 = 'd4garl2 how often eat garlic at present?' 
   RD5     = 'rd5 proxy or not for d5' 
   D5      = 'd5 what kind of water usually drink?' 
   RD6     = 'rd6 proxy or not for d6a d6b d6c' 
   D6A     = 'd6a water you drank at childhood was mainly from' 
   D6B     = 'd6b water you drank at around age 60 was mainly from' 
   D6C     = 'd6c water you drink at present is mainly from' 
   RD71    = 'rd71 proxy or not for d71' 
   D71     = 'd71 smoke or not at present?' 
   RD72    = 'rd72 proxy or not for d72' 
   D72     = 'd72 smoked or not in the past?' 
   RD73    = 'rd73 proxy or not for d73' 
   D73     = 'd73 age when starting to smoke' 
   RD74    = 'rd74 proxy or not for d74' 
   D74     = 'd74 age when quitting smoking if not smoke at present' 
   RD75    = 'rd75 proxy or not for d75' 
   D75     = 'd75 times smoke (or smoked) per day' 
   RD81    = 'rd81 proxy or not for d81' 
   D81     = 'd81 drink or not at present?' 
   RD82    = 'rd82 proxy or not for d82' 
   D82     = 'd82 drank or not in the past?' 
   RD83    = 'rd83 proxy or not for d83' 
   D83     = 'd83 age when starting to drink' 
   RD84    = 'rd84 proxy or not for d84' 
   D84     = 'd84 age when quitting drinking if not drink at present' 
   RD85    = 'rd85 proxy or not for d85' 
   D85     = 'd85 what kind of drink if drink (drank)?' 
   RD86    = 'rd86 proxy or not for d86' 
   D86     = 'd86 how much per day if drink( or drank)?' 
   RD91    = 'rd91 proxy or not for d91' 
   D91     = 'd91 exercise or not at present?' 
   RD92    = 'rd92 proxy or not for d92' 
   D92     = 'd92 exercised or not in the past?' 
   RD93    = 'rd93 proxy or not for d93' 
   D93     = 'd93 age when starting to exercise' 
   RD94    = 'rd94 proxy or not for d94' 
   D94     = 'd94 age when quitting exercising if not exercise at present' 
   RD101   = 'rd101 proxy or not for d101' 
   D101    = 'd101 have you done physical labor regularly?' 
   RD102   = 'rd102 proxy or not for d102' 
   D102    = 'd102 age when starting to do physical labor' 
   RD103   = 'rd103 proxy or not for d103' 
   D103    = 'd103 age when stopping doing physical labor' 
   RD11A   = 'rd11a proxy or not for d11a' 
   D11A    = 'd11a do you do house work at present?' 
   RD11B   = 'rd11b proxy or not for d11b' 
   D11B    = 'd11b do you do any personal outdoor activities at present?' 
   RD11C   = 'rd11c proxy or not for d11c' 
   D11C    = 'd11c do you do garden work' 
   RD11D   = 'rd11d proxy or not for d11d' 
   D11D    = 'd11d do you read newspapers/books at present?' 
   RD11E   = 'rd11e proxy or not for d11e' 
   D11E    = 'd11e do you raise domestic animals/pets at present?' 
   RD11F   = 'rd11f proxy or not for d11f' 
   D11F    = 'd11f do you play cards/mah-jong at present?' 
   RD11G   = 'rd11g proxy or not for d11g' 
   D11G    = 'd11g do you watch tv or listen radio at present?' 
   RD11H   = 'rd11h proxy or not for d11h' 
   D11H    = 'd11h do you take part in some social activities?' 
   RD11I   = 'rd11i proxy or not for d11i' 
   D11I    = 'd11i do you participate religious activities at present?' 
   RD12    = 'rd12 proxy or not for d12' 
   D12     = 'd12 # of traveling beyond home city/county in the past two years' 
   RE1     = 're1 proxy or not for e1' 
   E1      = 'e1 bathing' 
   RE1A    = 're1a proxy or not for e1a' 
   E1A     = 'e1a if needed, who helped you?' 
   RE2     = 're2 proxy or not for e2' 
   E2      = 'e2 dressing' 
   RE2A    = 're2a proxy or not for e2a' 
   E2A     = 'e2a if needed, who helped you?' 
   RE3     = 're3 proxy or not for e3' 
   E3      = 'e3 toileting' 
   RE3A    = 're3a proxy or not for e3a' 
   E3A     = 'e3a if needed, who helped you?' 
   RE4     = 're4 proxy or not for e4' 
   E4      = 'e4 transferring' 
   RE4A    = 're4a proxy or not for e41' 
   E4A     = 'e4a if needed, who helped you?' 
   RE5     = 're5 proxy or not for e5' 
   E5      = 'e5 continence' 
   RE5A    = 're5a proxy or not for e51' 
   E5A     = 'e5a if needed, who helped you?' 
   RE6     = 're6 proxy or not for e6' 
   E6      = 'e6 feeding' 
   RE6A    = 're6a proxy or not for e61' 
   E6A     = 'e6a if needed, who helped you?' 
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
   E13     = 'e13 able to crouch and stand for three times?' 
   RE14    = 're14 proxy or not for e14' 
   E14     = 'e14 able to take public transport?' 
   RF1     = 'rf1 proxy or not for f1' 
   F1      = 'f1 years of schooling' 
   RF2     = 'rf2 proxy or not for f2' 
   F2      = 'f2 main occupation before age 60' 
   RF21    = 'rf21 proxy or not for f21' 
   F21     = 'f21 do you have pension?' 
   RF211   = 'rf211 proxy or not for f211' 
   F211    = 'f211 did you retire?' 
   RF22    = 'rf22 proxy or not for f22' 
   F22     = 'f22 which year did you retire?' 
   RF23    = 'rf23 proxy or not for f23' 
   F23     = 'f23 did you do something paid after retirement?' 
   RF31    = 'rf31 proxy or not for f31' 
   F31     = 'f31 main financial source' 
   RF32    = 'rf32 proxy or not for f32' 
   F32     = 'f32 other financial sources' 
   RF33    = 'rf33 proxy or not for f33' 
   F33     = 'f33 are all financial sources enough for your life?' 
   RF34    = 'rf34 proxy or not for f34' 
   F34     = 'f34 how about your life compared with other local people?' 
   RF35    = 'rf35 proxy or not for f35' 
   F35     = 'f35 what''s your family per capital income last year?' 
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
   RF5     = 'rf5 proxy or not for f5' 
   F5      = 'f5 who take care of you when you are sick?' 
   RF61    = 'rf61 proxy or not for f61' 
   F61     = 'f61 get adequate medical service at present' 
   RF62    = 'rf62 proxy or not for f62' 
   F62     = 'f62 got adequate medical service at around age 60' 
   RF63    = 'rf63 proxy or not for 63' 
   F63     = 'f63 got adequate medical service in childhood' 
   RF64    = 'rf64 proxy or not for f64' 
   F64     = 'f64 who mainly pay for your medical cost?' 
   RF65    = 'rf65 proxy or not for f65' 
   F65     = 'f65 main reason not visit doctor when necessary' 
   RF66    = 'rf66 proxy or not for f66' 
   F66     = 'f66 often went to bed hungry as a child' 
   RF71    = 'rf71 proxy or not for f71' 
   F71     = 'f71 mother alive or not?' 
   RF721   = 'rf721 proxy or not for f721' 
   F721    = 'f721 if alive, how old is she?' 
   RF722   = 'rf722 proxy or not for f722' 
   F722    = 'f722 if not, how old did she die?' 
   RF73    = 'rf73 proxy or not for f73' 
   F73     = 'f73 respondent''s age at mother''s death' 
   RF81    = 'rf81 proxy or not for f81' 
   F81     = 'f81 father alive or not?' 
   RF821   = 'rf821 proxy or not for f821' 
   F821    = 'f821 if alive, how old is he?' 
   RF822   = 'rf822 proxy or not for f822' 
   F822    = 'f822 if not, how old was he when he died?' 
   RF83    = 'rf83 proxy or not for f83' 
   F83     = 'f83 respondent''s age at father''s death' 
   RF84    = 'rf84 proxy or not for f84' 
   F84     = 'f84 father''s main occupation before age 60' 
   RF9     = 'rf9 proxy or not for f9' 
   F9      = 'f9 number of siblings' 
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
   F92I3   = 'f92i3 sibling alive?' 
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
   RF92K   = 'rf92k proxy or not for j92k1 to f92k6' 
   F92K1   = 'f92k1 birth order of the sibling' 
   F92K2   = 'f92k2 sex of the sibling' 
   F92K3   = 'f92k3 sibling alive' 
   F92K4   = 'f92k4 sibling''s age at present if alive, or age at death if died' 
   F92K5   = 'f92k5 residence distance' 
   F92K6   = 'f92k6 frequent visits' 
   RF10    = 'rf10 proxy or not for f10' 
   F10     = 'f10 number of children ever born' 
   RF101   = 'rf101 proxy or not for f101' 
   F101    = 'f101 age when gave the first birth' 
   RF102   = 'rf102 proxy or not for f102' 
   F102    = 'f102 age when gave the last birth' 
   RF103A  = 'rf103a proxy or not for f103a1 to f103a6' 
   F103A1  = 'f103a1 sex of the child' 
   F103A2  = 'f103a2 child alive' 
   F103A3  = 'f103a3 child''s age at present if alive, or age at death if died' 
   F103A4  = 'f103a4 frequent visits' 
   F103A7  = 'f103a7 contact' 
   F103A6  = 'f103a6 birth order of child' 
   F103A5  = 'f103a5 residence distance' 
   RF103B  = 'rf103b proxy or not for f103b1 to f103b6' 
   F103B1  = 'f103b1 sex of the child' 
   F103B2  = 'f103b2 child alive' 
   F103B3  = 'f103b3 child''s age at present if alive, or age at death if died' 
   F103B4  = 'f103b4 frequent visits' 
   F103B7  = 'f103b7 contact' 
   F103B6  = 'f103b6 birth order of child' 
   F103B5  = 'f103b5 residence distance' 
   RF103C  = 'rf103c proxy or not for f103c1 to f103c6' 
   F103C1  = 'f103c1 sex of the child' 
   F103C2  = 'f103c2 child alive' 
   F103C3  = 'f103c3 child''s age at present if alive, or age at death if died' 
   F103C4  = 'f103c4 frequent visits' 
   F103C7  = 'f103c7 contact' 
   F103C6  = 'f103c6 birth order of child' 
   F103C5  = 'f103c5 residence distance' 
   RF103D  = 'rf103d proxy or not for f103d1 to f103d6' 
   F103D1  = 'f103d1 sex of the child' 
   F103D2  = 'f103d2 child alive' 
   F103D3  = 'f103d3 child''s age at present if alive, or age at death if died' 
   F103D4  = 'f103d4 frequent visits' 
   F103D7  = 'f103d7 contact' 
   F103D6  = 'f103d6 birth order of child' 
   F103D5  = 'f103d5 residence distance' 
   RF103E  = 'rf103e proxy or not for f103e1 to f103e6' 
   F103E1  = 'f103e1 sex of the child' 
   F103E2  = 'f103e2 child alive' 
   F103E3  = 'f103e3 child''s age at present if alive, or age at death if died' 
   F103E4  = 'f103e4 frequent visits' 
   F103E7  = 'f103e7 contact' 
   F103E6  = 'f103e6 birth order of child' 
   F103E5  = 'f103e5 residence distance' 
   RF103F  = 'rf103f proxy or not for f103f1 to f103f6' 
   F103F1  = 'f103f1 sex of the child' 
   F103F2  = 'f103f2 child alive' 
   F103F3  = 'f103f3 child''s age at present if alive, or age at death if died' 
   F103F4  = 'f103f4 frequent visits' 
   F103F7  = 'f103f7 contact' 
   F103F6  = 'f103f6 birth order of child' 
   F103F5  = 'f103f5 residence distance' 
   RF103G  = 'rf103g proxy or not for f103g1 to f103g6' 
   F103G1  = 'f103g1 sex of the child' 
   F103G2  = 'f103g2 child alive' 
   F103G3  = 'f103g3 child''s age at present if alive, or age at death if died' 
   F103G4  = 'f103g4 frequent visits' 
   F103G7  = 'f103g7 contact' 
   F103G6  = 'f103g6 birth order of child' 
   F103G5  = 'f103g5 residence distance' 
   RF103H  = 'rf103h proxy or not for f103h1 to f103h6' 
   F103H1  = 'f103h1 sex of the child' 
   F103H2  = 'f103h2 child alive' 
   F103H3  = 'f103h3 child''s age at present if alive, or age at death if died' 
   F103H4  = 'f103h4 frequent visits' 
   F103H7  = 'f103h7 contact' 
   F103H6  = 'f103h6 birth order of child' 
   F103H5  = 'f103h5 residence distance' 
   RF103I  = 'rf103i proxy or not for f103i1 to f103i6' 
   F103I1  = 'f103i1 sex of the child' 
   F103I2  = 'f103i2 child alive' 
   F103I3  = 'f103i3 child''s age at present if alive, or age at death if died' 
   F103I4  = 'f103i4 frequent visits' 
   F103I7  = 'f103i7 contact' 
   F103I6  = 'f103i6 birth order of child' 
   F103I5  = 'f103i5 residence distance' 
   RF103J  = 'rf103j proxy or not for f103j1 to f103j6' 
   F103J1  = 'f103j1 sex of the child' 
   F103J2  = 'f103j2 child alive' 
   F103J3  = 'f103j3 child''s age at present if alive, or age at death if died' 
   F103J4  = 'f103j4 frequent visits' 
   F103J7  = 'f103j7 contact' 
   F103J6  = 'f103j6 birth order of child' 
   F103J5  = 'f103j5 residence distance' 
   RF103K  = 'rf103k proxy or not for f103k1 to f103k6' 
   F103K1  = 'f103k1 sex of the child' 
   F103K2  = 'f103k2 child alive' 
   F103K3  = 'f103k3 child age at present if alive, or age at death if died' 
   F103K4  = 'f103k4 frequent visits' 
   F103K7  = 'f103k7 contact' 
   F103K6  = 'f103k6 birth order of child' 
   F103K5  = 'f103k5 residence distance' 
   RF104   = 'rf104 proxy or not for f104' 
   F104    = 'f104 if your 1st child died, what would his/her age be at present if she/he were aliv' 
   RF105   = 'rf105 proxy or not for f105' 
   F105    = 'f105 if your last child died, what would his/her age be at present if she/he were ali' 
   RF111   = 'rf111 proxy or not for f111' 
   F111    = 'f111 to whom do you usually talk most frequently in daily life?' 
   RF112   = 'rf112 proxy or not for f112' 
   F112    = 'f112 to whom do you talk first when you need to tell something of your thoughts?' 
   RF113   = 'rf113 proxy or not for f113' 
   F113    = 'f113 who do you ask first for help when you have problems/difficulties?' 
   RF12    = 'rf12 proxy or not for f12 to f12b' 
   F12A    = 'f12a how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B    = 'f12b how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   RF13    = 'rf13 proxy or not for f12 to f13b' 
   F13A    = 'f13a how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B    = 'f13b how much did you give to your daughter(s) or son(s)-in-law last year?' 
   G1      = 'g1 visual function' 
   G21     = 'g21 number of natural teeth have' 
   G22     = 'g22 have false teeth' 
   G3      = 'g3 able to use chopsticks to eat?' 
   G4      = 'g4 which hand do you normally use for eating?' 
   G51     = 'g51 systolic' 
   G52     = 'g52 diastolic' 
   G6      = 'g6 rhythm of heart' 
   G7      = 'g7 heart rate' 
   G81     = 'g81 hand behind neck' 
   G82     = 'g82 hand behind lower back' 
   G83     = 'g83 raise arms upright' 
   G9      = 'g9 able to stand up from sitting in a chair' 
   RG101   = 'rg101 proxy or not for g101' 
   G101    = 'g101 weight' 
   G102A   = 'g102a length from wrist to shoulder' 
   G102B   = 'g102b length from kneel to floor' 
   G11     = 'g11 able to pick up a book from the floor' 
   G12     = 'g12 steps used to turn around 360 degree without help' 
   RG13    = 'rg13 with proxy or not for g13' 
   G13     = 'g13 # of times suffering from serious illness in the past two years' 
   G14A1   = 'g14a1 name of disease suffering at the first time' 
   G14A2   = 'g14a2 days lasted for the first time' 
   G14B1   = 'g14b1 name of disease suffering at the second time' 
   G14B2   = 'g14b2 days lasted for the second time' 
   G14C1   = 'g14c1 name of disease suffering at the last time' 
   G14C2   = 'g14c2 days lasted for the last time' 
   G15A1   = 'g15a1 suffering from hypertension?' 
   G15A2   = 'g15a2 diagnosed by hospital?' 
   G15A3   = 'g15a3 disability in daily life' 
   G15B1   = 'g15b1 suffering from diabetes?' 
   G15B2   = 'g15b2 diagnosed by hospital?' 
   G15B3   = 'g15b3 disability in daily life' 
   G15C1   = 'g15c1 suffering from hear disease?' 
   G15C2   = 'g15c2 diagnosed by hospital?' 
   G15C3   = 'g15c3 disability in daily life' 
   G15D1   = 'g15d1 suffering from stroke or cvd?' 
   G15D2   = 'g15d2 diagnosed by hospital?' 
   G15D3   = 'g15d3 disability in daily life' 
   G15E1   = 'g15e1 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2   = 'g15e2 diagnosed by hospital?' 
   G15E3   = 'g15e3 disability in daily life' 
   G15F1   = 'g15f1 suffering from tuberculosis?' 
   G15F2   = 'g15f2 diagnosed by hospital?' 
   G15F3   = 'g15f3 disability in daily life' 
   G15G1   = 'g15g1 suffering from cataract?' 
   G15G2   = 'g15g2 diagnosed by hospital?' 
   G15G3   = 'g15g3 disability in daily life' 
   G15H1   = 'g15h1 suffering from glaucoma?' 
   G15H2   = 'g15h2 diagnosed by hospital?' 
   G15H3   = 'g15h3 disability in daily life' 
   G15I1   = 'g15i1 suffering from cancer?' 
   G15I2   = 'g15i2 diagnosed by hospital?' 
   G15I3   = 'g15i3 disability in daily life' 
   G15J1   = 'g15j1 suffering from prostate tumor?' 
   G15J2   = 'g15j2 diagnosed by hospital?' 
   G15J3   = 'g15j3 disability in daily life' 
   G15K1   = 'g15k1 suffering from gastric or duodenal ulcer?' 
   G15K2   = 'g15k2 diagnosed by hospital?' 
   G15K3   = 'g15k3 disability in daily life' 
   G15L1   = 'g15l1 suffering from parkinson''s disease?' 
   G15L2   = 'g15l2 diagnosed by hospital?' 
   G15L3   = 'g15l3 disability in daily life' 
   G15M1   = 'g15m1 suffering from bedsore?' 
   G15M2   = 'g15m2 diagnosed by hospital?' 
   G15M3   = 'g15m3 disability in daily life' 
   G15N1   = 'g15n1 suffering from arthritis?' 
   G15N2   = 'g15n2 diagnosed by hospital?' 
   G15N3   = 'g15n3 disability in daily life' 
   G15O1   = 'g15o1 suffering from dementia?' 
   G15O2   = 'g15o2 diagnosed by hospital?' 
   G15O3   = 'g15o3 disability in daily life' 
   G15P1   = 'g15p1 suffering from disease difficult to classify' 
   G15P2   = 'g15p2 diagnosed by hospital' 
   G15P3   = 'g15p3 disability in daily life' 
   G15Q1   = 'g15q1 suffering from mental disease' 
   G15Q2   = 'g15q2 diagnosed by hospital' 
   G15Q3   = 'g15q3 disability in daily life' 
   G15R1   = 'g15r1 suffering from orthopedic disease' 
   G15R2   = 'g15r2 diagnosed by hospital' 
   G15R3   = 'g15r3 disability in daily life' 
   G15S1   = 'g15s1 suffering from internal medical disease' 
   G15S2   = 'g15s2 diagnosed by hospital' 
   G15S3   = 'g15s3 disability in daily life' 
   G15T1   = 'g15t1 suffering from dermatosis' 
   G15T2   = 'g15t2 diagnosed by hospital' 
   G15T3   = 'g15t3 disability in daily life' 
   G15U1   = 'g15u1 suffering from five organs diseases' 
   G15U2   = 'g15u2 diagnosed by hospital' 
   G15U3   = 'g15u3 disability in daily life' 
   G15V1   = 'g15v1 suffering from gynecological disease' 
   G15V2   = 'g15v2 diagnosed by hospital' 
   G15V3   = 'g15v3 disability in daily life' 
   G15W1   = 'g15w1 suffering from others' 
   G15W2   = 'g15w2 diagnosed by hospital' 
   G15W3   = 'g15w3 disability in daily life' 
   H1      = 'h1 was interviewee able to hear?' 
   H21     = 'h21 did interviewee able to participate physical check?' 
   H22     = 'h22 the reason of unable to participate physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H6      = 'h6 has interviewer checked whether failing to ask a question?' 
   H7      = 'h7 did anyone help the interviewee to answer question?' 
   H71     = 'h71 who helped interviewee to answer question?' 
   H8      = 'h8 did interviewer take a photo for interviewee?' 
   W_2002  = 'w_2002 weight variable, estimated based on 100% age-sex-residence-specific distribution' 
   DTH02_05= 'dth02_05 status of survival, death, or lost to follow-up from the 2002 to 2005 waves' 
   MONTH_5 = 'month_5 month of the 2005 interview' 
   DAY_5   = 'day_5 day of the 2005 interview' 
   RESID_5 = 'resid_5 category of residence of the interviewee in 2005' 
   VAGE_5  = 'vage_5 validated age' 
   RA51_5  = 'ra51_5 proxy or not for a51' 
   A51_5   = 'a51_5 co-residence of interviewee' 
   RA52_5  = 'ra52_5 proxy or not for a52_5' 
   A52_5   = 'a52_5 how many people are living with you?' 
   RA53A_5 = 'ra53a_5 proxy or not for a53a1_5, a53a2_5, a53a3_5, a53a4_5' 
   A53A1_5 = 'a53a1_5 relationship between you and 1st person you living with currently' 
   A53A2_5 = 'a53a2_5 age of 1st person you living with currently' 
   A53A3_5 = 'a53a3_5 sex of 1st person you living with currently' 
   A53A4_5 = 'a53a4_5 educational attainment of 1st person you living with currently' 
   RA53B_5 = 'ra53b_5 proxy or not for a53b1_5, a53b2_5, a53b3_5, a53b4_5' 
   A53B1_5 = 'a53b1_5 relationship between you and 2nd person you living with currently' 
   A53B2_5 = 'a53b2_5 age of 2nd person you living with currently' 
   A53B3_5 = 'a53b3_5 sex of 2nd person you living with currently' 
   A53B4_5 = 'a53b4_5 educational attainment of 2nd person you living with currently' 
   RA53C_5 = 'ra53c_5 proxy or not for a53c1_5, a53c2_5, a53c3_5, a53c4_5' 
   A53C1_5 = 'a53c1_5 relationship between you and 3rd person you living with currently' 
   A53C2_5 = 'a53c2_5 age of 3rd person you living with currently' 
   A53C3_5 = 'a53c3_5 sex of 3rd person you living with currently' 
   A53C4_5 = 'a53c4_5 educational attainment of 3rd person you living with currently' 
   RA53D_5 = 'ra53d_5 proxy or not for a53d1_5, a53d2_5, a53d3_5, a53d4_5' 
   A53D1_5 = 'a53d1_5 relationship between you and 4th person you living with currently' 
   A53D2_5 = 'a53d2_5 age of 4th person you living with currently' 
   A53D3_5 = 'a53d3_5 sex of 4th person you living with currently' 
   A53D4_5 = 'a53d4_5 educational attainment of 4th person you living with currently' 
   RA53E_5 = 'ra53e_5 proxy or not for a53e1_5, a53e2_5, a53e3_5, a53e4_5' 
   A53E1_5 = 'a53e1_5 relationship between you and 5th person you living with currently' 
   A53E2_5 = 'a53e2_5 age of 5th person you living with currently' 
   A53E3_5 = 'a53e3_5 sex of 5th person you living with currently' 
   A53E4_5 = 'a53e4_5 educational attainment of 5th person you living with currently' 
   RA53F_5 = 'ra53f_5 proxy or not for a53f1_5, a53f2_5, a53f3_5, a53f4_5' 
   A53F1_5 = 'a53f1_5 relationship between you and 6th person you living with currently' 
   A53F2_5 = 'a53f2_5 age of 6th person you living with currently' 
   A53F3_5 = 'a53f3_5 sex of 6th person you living with currently' 
   A53F4_5 = 'a53f4_5 educational attainment of 6th person you living with currently' 
   RA53G_5 = 'ra53g_5 proxy or not for a53g1_5, a53g2_5, a53g3_5, a53g4_5' 
   A53G1_5 = 'a53g1_5 relationship between you and 7th person you living with currently' 
   A53G2_5 = 'a53g2_5 age of 7th person you living with currently' 
   A53G3_5 = 'a53g3_5 sex of 7th person you living with currently' 
   A53G4_5 = 'a53g4_5 educational attainment of 7th person you living with currently' 
   RA53H_5 = 'ra53h_5 proxy or not for a53h1_5, a53h2_5, a53h3_5, a53h4_5' 
   A53H1_5 = 'a53h1_5 relationship between you and 8th person you living with currently' 
   A53H2_5 = 'a53h2_5 age of 8th person you living with currently' 
   A53H3_5 = 'a53h3_5 sex of 8th person you living with currently' 
   A53H4_5 = 'a53h4_5 educational attainment of 8th person you living with currently' 
   RA53I_5 = 'ra53i_5 proxy or not for a53i1_5, a53i2_5, a53i3_5, a53i4_5' 
   A53I1_5 = 'a53i1_5 relationship between you and 9th person you living with currently' 
   A53I2_5 = 'a53i2_5 age of 9th person you living with currently' 
   A53I3_5 = 'a53i3_5 sex of 9th person you living with currently' 
   A53I4_5 = 'a53i4_5 educational attainment of 9th person you living with currently' 
   RA53J_5 = 'ra53j_5 proxy or not for a53j1_5, a53j2_5, a53j3_5, a53j4_5' 
   A53J1_5 = 'a53j1_5 relationship between you and 10th person you living with currently' 
   A53J2_5 = 'a53j2_5 age of 10th person you living with currently' 
   A53J3_5 = 'a53j3_5 sex of 10th person you living with currently' 
   A53J4_5 = 'a53j4_5 educational attainment of 10th person you living with currently' 
   RA53K_5 = 'ra53k_5 proxy or not for a53k1_5, a53k2_5, a53k3_5, a53k4_5' 
   A53K1_5 = 'a53k1_5 relationship between you and 11th person you living with currently' 
   A53K2_5 = 'a53k2_5 age of 11th person you living with currently' 
   A53K3_5 = 'a53k3_5 sex of 11th person you living with currently' 
   A53K4_5 = 'a53k4_5 educational attainment of 11th person you living with currently' 
   RA53L_5 = 'ra53l_5 proxy or not for a53l1_5, a53l2_5, a53l3_5,a53l4_5' 
   A53L1_5 = 'a53l1_5 relationship between you and 12th person you living with currently' 
   A53L2_5 = 'a53l2_5 age of 12th person you living with currently' 
   A53L3_5 = 'a53l3_5 sex of 12th person you living with currently' 
   A53L4_5 = 'a53l4_5 educational attainment of 12th person you living with currently' 
   RA530_5 = 'ra530_5 proxy or not for a530_5' 
   A530_5  = 'a530_5 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531_5 = 'ra531_5 proxy or not for a531_5' 
   A531_5  = 'a531_5 under whose name your current house/apartment purchased or rented' 
   RA532_5 = 'ra532_5 proxy or not for a532_5' 
   A532_5  = 'a532_5 do you (and your spouse) have your own bedroom?' 
   RA540_5 = 'ra540_5 proxy or not for a540_5' 
   A540_5  = 'a540_5 the primary reason that the elder live in an institution' 
   RA541_5 = 'ra541_5 proxy or not for a541_5' 
   A541_5  = 'a541_5 the average monthly cost for the elder living in an institution' 
   RA542_5 = 'ra542_5 proxy or not for a542_5' 
   A542_5  = 'a542_5 who mainly paid for the cost?' 
   RA54_5  = 'ra54_5 proxy or not for a54a a54b_5' 
   A54A_5  = 'a54a_5 year of being admitted to an institution or living alone' 
   A54B_5  = 'a54b_5 month of being admitted to an institution or living alone' 
   B11_5   = 'b11_5 self-rated quality of life' 
   B12_5   = 'b12_5 self-rated health' 
   B121_5  = 'b121_5 do you feel any change of your health since last year' 
   B21_5   = 'b21_5 look on the bright side of things' 
   B22_5   = 'b22_5 keep my belongings neat and clean' 
   B23_5   = 'b23_5 feel fearful or anxious' 
   B24_5   = 'b24_5 feel lonely and isolated' 
   B25_5   = 'b25_5 make own decision' 
   B26_5   = 'b26_5 feel useless with age' 
   B27_5   = 'b27_5 be happy as younger' 
   C11_5   = 'c11_5 what time of day is it right now?' 
   C12_5   = 'c12_5 what is the animal year of this year?' 
   C13_5   = 'c13_5 what is the date of the mid-autumn festival?' 
   C14_5   = 'c14_5 what is the season right now?' 
   C15_5   = 'c15_5 what is the name of this county or district?' 
   C16_5   = 'c16_5 # of kinds of food named in one minute' 
   C21A_5  = 'c21a_5 repeat the name of ''table'' at the first time' 
   C21B_5  = 'c21b_5 repeat the name of ''apple'' at the first time' 
   C21C_5  = 'c21c_5 repeat the name of ''clothes'' at the first time' 
   C22_5   = 'c22_5 attempts to repeat the names of three objects correctly' 
   C31A_5  = 'c31a_5 $20-$3=?' 
   C31B_5  = 'c31b_5 $20-$3-$3=?' 
   C31C_5  = 'c31c_5 $20-$3-$3-$3=?' 
   C31D_5  = 'c31d_5 $20-$3-$3-$3-$3=?' 
   C31E_5  = 'c31e_5 $20-$3-$3-$3-$3-$3=?' 
   C32_5   = 'c32_5 draw the figure following the sample' 
   C41A_5  = 'c41a_5 repeat the name of ''table'' a while later' 
   C41B_5  = 'c41b_5 repeat the name of ''apple'' a while later' 
   C41C_5  = 'c41c_5 repeat the name of ''clothes'' a while later' 
   C51A_5  = 'c51a_5 naming ''pen''' 
   C51B_5  = 'c51b_5 naming ''watch''' 
   C52_5   = 'c52_5 repeat a sentence' 
   C53A_5  = 'c53a_5 taking paper using right hand' 
   C53B_5  = 'c53b_5 folding paper' 
   C53C_5  = 'c53c_5 put paper on the floor' 
   C54_5   = 'c54_5 was the interviewee able to answer sections b and c?' 
   C55_5   = 'c55_5 what is the main reason unable to answer questions?' 
   RD1_5   = 'rd1_5 proxy or not for d1_5' 
   D1_5    = 'd1_5 staple food' 
   RD2_5   = 'rd2_5 proxy or not for d2_5' 
   D2_5    = 'd2_5 amount of staple food per day (liang) (1 liang=50g)' 
   RD31_5  = 'rd31_5 proxy or not for d31_5' 
   D31_5   = 'd31_5 how often eat fresh fruit?' 
   RD32_5  = 'rd32_5 proxy or not for d32_5' 
   D32_5   = 'd32_5 how often eat vegetables?' 
   RD4MT_5 = 'rd4mt_5 proxy or not for d4mt2_5' 
   D4MT2_5 = 'd4mt2_5 how often eat meat at present?' 
   RD4FSH_5= 'rd4fsh_5 proxy or not for d4fsh2_5' 
   D4FSH2_5= 'd4fsh2_5 how often eat fish at present?' 
   RD4EGG_5= 'rd4egg_5 proxy or not for d4egg2_5' 
   D4EGG2_5= 'd4egg2_5 how often eat eggs at present?' 
   RD4BEN_5= 'rd4ben_5 proxy or not for d4ben2_5' 
   D4BEN2_5= 'd4ben2_5 how often eat food made from bean at present?' 
   RD4VEG_5= 'rd4veg_5 proxy or not for d4veg2_5' 
   D4VEG2_5= 'd4veg2_5 how often eat salt-preserved vegetables at present' 
   RD4SUG_5= 'rd4sug_5 proxy or not for d4sug2_5' 
   D4SUG2_5= 'd4sug2_5 how often eat sugar at present' 
   RD4TEA_5= 'rd4tea_5 proxy or not for d4tea2_5' 
   D4TEA2_5= 'd4tea2_5 how often drink tea at present' 
   RD4GAR_5= 'rd4gar_5 proxy or not for d4gar2_5' 
   D4GAR2_5= 'd4gar2_5 how often eat garlic at present' 
   RD5_5   = 'rd5_5 proxy or not for d5_5' 
   D5_5    = 'd5_5 what kind of water usually drink?' 
   RD6_5   = 'rd6_5 proxy or not for d6c_5' 
   D6C_5   = 'd6c_5 water you drink at present is mainly from' 
   RD71_5  = 'rd71_5 proxy or not for d71_5' 
   D71_5   = 'd71_5 smoke or not at present?' 
   RD72_5  = 'rd72_5 proxy or not for d72_5' 
   D72_5   = 'd72_5 smoked or not in the past?' 
   RD73_5  = 'rd73_5 proxy or not for d73_5' 
   D73_5   = 'd73_5 age when starting to smoke' 
   RD74_5  = 'rd74_5 proxy or not for d74_5' 
   D74_5   = 'd74_5 age when quitting smoking if not smoke at present' 
   RD75_5  = 'rd75_5 proxy or not for d75_5' 
   D75_5   = 'd75_5 times smoke (or smoked) per day' 
   RD81_5  = 'rd81_5 proxy or not for d81_5' 
   D81_5   = 'd81_5 drink or not at present?' 
   RD82_5  = 'rd82_5 proxy or not for d82_5' 
   D82_5   = 'd82_5 drank or not in the past?' 
   RD83_5  = 'rd83_5 proxy or not for d83_5' 
   D83_5   = 'd83_5 age when starting to drink' 
   RD84_5  = 'rd84_5 proxy or not for d84_5' 
   D84_5   = 'd84_5 age when quitting drinking if not drink at present' 
   RD85_5  = 'rd85_5 proxy or not for d85_5' 
   D85_5   = 'd85_5 what kind of drink if drink (drank)?' 
   RD86_5  = 'rd86_5 proxy or not for d86_5' 
   D86_5   = 'd86_5 how much per day if drink (or drank)?' 
   RD91_5  = 'rd91_5 proxy or not for d91_5' 
   D91_5   = 'd91_5 exercise or not at present?' 
   RD92_5  = 'rd92_5 proxy or not for d92_5' 
   D92_5   = 'd92_5 exercised or not in the past?' 
   RD93_5  = 'rd93_5 proxy or not for d93_5' 
   D93_5   = 'd93_5 age when starting to exercise' 
   RD94_5  = 'rd94_5 proxy or not for d94_5' 
   D94_5   = 'd94_5 age when quitting exercising if not exercise at present' 
   RD101_5 = 'rd101_5 proxy or not for d101_5' 
   D101_5  = 'd101_5 have you done physical labor regularly?' 
   RD102_5 = 'rd102_5 proxy or not for d102_5' 
   D102_5  = 'd102_5 age when starting to do physical labor' 
   RD103_5 = 'rd103_5 proxy or not for d103_5' 
   D103_5  = 'd103_5 age when quitting doing physical labor' 
   RD11A_5 = 'rd11a_5 proxy or not for d11a_5' 
   D11A_5  = 'd11a_5 do you do house work at present?' 
   RD11B_5 = 'rd11b_5 proxy or not for d11b_5' 
   D11B_5  = 'd11b_5 do you any outdoor activities at present?' 
   RD11C_5 = 'rd11c_5 proxy or not for d11c_5' 
   D11C_5  = 'd11c_5 do you do garden work' 
   RD11D_5 = 'rd11d_5 proxy or not for d11d_5' 
   D11D_5  = 'd11d_5 do you read newspapers/books at present?' 
   RD11E_5 = 'rd11e_5 proxy or not for d11e_5' 
   D11E_5  = 'd11e_5 do you raise domestic animals/pets at present?' 
   RD11F_5 = 'rd11f_5 proxy or not for d11f_5' 
   D11F_5  = 'd11f_5 do you play cards/mah-jong at present?' 
   RD11G_5 = 'rd11g_5 proxy or not for d11g_5' 
   D11G_5  = 'd11g_5 do you watch tv or listen to radio at present ?' 
   RD11H_5 = 'rd11h_5 proxy or not for d11h_5' 
   D11H_5  = 'd11h_5 do you take part in some social activities at present?' 
   RD12_5  = 'rd12_5 proxy or not for d12_5' 
   D12_5   = 'd12_5 # of traveling beyond home county/city in the past two years' 
   RE1_5   = 're1_5 proxy or not for e1_5' 
   E1_5    = 'e1_5 bathing' 
   RE1B_5  = 're1b_5 proxy or not for e1b_5' 
   E1B_5   = 'e1b_5 # of days needing assistance in bathing' 
   RE2_5   = 're2_5 proxy or not for e2_5' 
   E2_5    = 'e2_5 dressing' 
   RE2B_5  = 're2b_5 proxy or not for e2b_5' 
   E2B_5   = 'e2b_5 # of days needing assistance in dressing' 
   RE3_5   = 're3_5 proxy or not for e3_5' 
   E3_5    = 'e3_5 toileting' 
   RE3B_5  = 're3b_5 proxy or not for e3b_5' 
   E3B_5   = 'e3b_5 # of days needing assistance in toileting' 
   RE4_5   = 're4_5 proxy or not for e4_5' 
   E4_5    = 'e4_5 indoor transferring' 
   RE4B_5  = 're4b_5 proxy or not for e4b_5' 
   E4B_5   = 'e4b_5 # of days needing assistance in indoor transferring' 
   RE5_5   = 're5_5 proxy or not for e5_5' 
   E5_5    = 'e5_5 continence' 
   RE5B_5  = 're5b_5 proxy or not for e5b_5' 
   E5B_5   = 'e5b_5 # of days needing assistance in continence' 
   RE6_5   = 're6_5 proxy or not for e6_5' 
   E6_5    = 'e6_5 feeding' 
   RE6B_5  = 're6b_5 proxy or not for e6b_5' 
   E6B_5   = 'e6b_5 # of days needing assistance in feeding' 
   RE610_5 = 're610_5 proxy or not for e610_5' 
   E610_5  = 'e610_5 primary caregiver when the elder needs assistance in above six tasks' 
   RE62_5  = 're62_5 proxy or not for e62-5' 
   E62_5   = 'e62_5 willingness of the primary caregiver when he/she provided such cares' 
   RE63_5  = 're63_5 proxy or not for e63_5' 
   E63_5   = 'e63_5 total direct cost paid for caregiving last week' 
   RE64_5  = 're64_5 proxy or not for e64_5' 
   E64_5   = 'e64_5 who mainly pay for the cost?' 
   RE65_5  = 're65_5 proxy or not for e65-5' 
   E65_5   = 'e65_5 does the elderly think that helps in six tasks he/she received could meet his/he' 
   RE66_5  = 're66_5 proxy or not for e66_5' 
   E66_5   = 'e66_5 how many children, grandchildren and their spouses helped the elder in above six' 
   RE67_5  = 're67_5 proxy or not for e67_5' 
   E67_5   = 'e67_5 how many hours did the (grand)children and their spouses help the elder last wee' 
   RE7_5   = 're7_5 proxy or not for e7_5' 
   E7_5    = 'e7_5 able to go outside to visit neighbors?' 
   RE8_5   = 're8_5 proxy or not for e8_5' 
   E8_5    = 'e8_5 able to go shopping by yourself?' 
   RE9_5   = 're9_5 proxy or not for e9_5' 
   E9_5    = 'e9_5 able to make food by yourself?' 
   RE10_5  = 're10_5 proxy or not for e10_5' 
   E10_5   = 'e10_5 able to wash clothes by yourself?' 
   RE11_5  = 're11_5 proxy or not for e11_5' 
   E11_5   = 'e11_5 able to walk one kilometer?' 
   RE12_5  = 're12_5 proxy or not for e12_5' 
   E12_5   = 'e12_5 able to carry 5kg weight?' 
   RE13_5  = 're13_5 proxy or not for e13_5' 
   E13_5   = 'e13_5 able to crouch and stand for three times?' 
   RE14_5  = 're14_5 proxy or not for e14_5' 
   E14_5   = 'e14_5 able to take public transport?' 
   RF211_5 = 'rf211_5 proxy or not for f211_5' 
   F211_5  = 'f211_5 did you retire?' 
   RF22_5  = 'rf22_5 proxy or not for f22_5' 
   F22_5   = 'f22_5 which year did you retire?' 
   RF23_5  = 'rf23_5 proxy or not for f23_5' 
   F23_5   = 'f23_5 are you still engaged in paid jobs now?' 
   RF31_5  = 'rf31_5 proxy or not for f31_5' 
   F31_5   = 'f31_5 main source of financial support' 
   RF32_5  = 'rf32_5 proxy or not for f32a_5, f32b_5,f32c_5,f32d_5,f32e_5' 
   F32A_5  = 'f32a_5 first of other financial support sources' 
   F32B_5  = 'f32b_5 second of other financial support sources' 
   F32C_5  = 'f32c_5 third of other financial support sources' 
   F32D_5  = 'f32d_5 forth of other financial support sources' 
   F32E_5  = 'f32e_5 fifth of other financial support sources' 
   RF33_5  = 'rf33_5 proxy or not for f33_5' 
   F33_5   = 'f33_5 does all financial support sufficiently pay your daily cost?' 
   RF340_5 = 'rf340_5 proxy or not for f340_5' 
   F340_5  = 'f340_5 your power in decision-making on financial spending in the household' 
   RF34_5  = 'rf34_5 proxy or not for f34_5' 
   F34_5   = 'f34_5 how do you rate your economic status compared with other local people?' 
   RF35_5  = 'rf35_5 proxy or not for f35_5' 
   F35_5   = 'f35_5 income per capita of your household last year' 
   RF41_5  = 'rf41_5 proxy or not for f41_5' 
   F41_5   = 'f41_5 current marital status' 
   RF42_5  = 'rf42_5 proxy or not for f42_5' 
   F42_5   = 'f42_5 how many times have you been married?' 
   RF43A_5 = 'rf43a_5 proxy or not for f43a1_5 to f43a4_5' 
   F43A1_5 = 'f43a1_5 age at the 1st marriage' 
   F43A2_5 = 'f43a2_5 current status of the 1st marriage' 
   F43A3_5 = 'f43a3_5 age at the 1st marriage dissolution' 
   F43A4_5 = 'f43a4_5 quality of the 1st marriage' 
   RF43B_5 = 'rf43b_5 proxy or not for f43b1_5 to f43b4_5' 
   F43B1_5 = 'f43b1_5 age at the 2nd marriage' 
   F43B2_5 = 'f43b2_5 current status of the 2nd marriage' 
   F43B3_5 = 'f43b3_5 age at the 2nd marriage dissolution' 
   F43B4_5 = 'f43b4_5 quality of the 2nd marriage' 
   RF43C_5 = 'rf43c_5 proxy or not for f43c1_5 to f43c4_5' 
   F43C1_5 = 'f43c1_5 age at the 3rd marriage' 
   F43C2_5 = 'f43c2_5 current status of the 3rd marriage' 
   F43C3_5 = 'f43c3_5 age at the 3rd marriage dissolution' 
   F43C4_5 = 'f43c4_5 quality of the 3rd marriage' 
   RF43D_5 = 'rf43d_5 proxy or not for f43d1_5 to f43d4_5' 
   F43D1_5 = 'f43d1_5 age at the latest marriage' 
   F43D2_5 = 'f43d2_5 current status of the latest marriage' 
   F43D3_5 = 'f43d3_5 age at the latest marriage dissolution' 
   F43D4_5 = 'f43d4_5 quality of the latest marriage' 
   RF44_5  = 'rf44_5 proxy or not for f44_5' 
   F44_5   = 'f44_5 years of schooling of the latest spouse' 
   RF45_5  = 'rf45_5 proxy or not for f45_5' 
   F45_5   = 'f45_5 main occupation of the latest spouse before age 60' 
   RF46_5  = 'rf46_5 proxy or not for f46_5' 
   F46_5   = 'f46_5 dose your spouse has paid job at present?' 
   RF5_5   = 'rf5_5 proxy or not for f5_5' 
   F5_5    = 'f5_5 who take care of you when you are sick?' 
   RF61_5  = 'rf61_5 proxy or not for f61_5' 
   F61_5   = 'f61_5 get adequate medical service at present when in serious illness' 
   RF610_5 = 'rf610_5 proxy or not for f610_5' 
   F610_5  = 'f610_5 main reason not visit doctor when necessary' 
   RF64_5  = 'rf64_5 proxy or not for f64_5a to f64_5i' 
   F64A_5  = 'f64a_5 do you have retirment wage at present?' 
   F64B_5  = 'f64b_5 do you have pension at present?' 
   F64C_5  = 'f64c_5 do you have private old age insurance at present?' 
   F64D_5  = 'f64d_5 can you access to public free medical services at present?' 
   F64E_5  = 'f64e_5 can you access to the cooperative medical scheme at present?' 
   F64F_5  = 'f64f_5 do you have basic medical insurance at present?' 
   F64G_5  = 'f64g_5 do you have severe disease insurance at present?' 
   F64H_5  = 'f64h_5 do you have life insurance at present?' 
   F64I_5  = 'f64i_5 do you other social security or private insurance at present?' 
   RF651A_5= 'rf651a_5 proxy or not for f651a_5' 
   F651A_5 = 'f651a_5 how much did you spend on medical care services last year?' 
   RF651B_5= 'rf651b_5 proxy or not for f651b_5' 
   F651B_5 = 'f651b_5 how much did your family pay for your medical care services last year?' 
   RF652_5 = 'rf652_5 proxy or not for f652_5' 
   F652_5  = 'f652_5 who mainly paid for the cost?' 
   RF71_5  = 'rf71_5 proxy or not for f71_5' 
   F71_5   = 'f71_5 mother alive or not' 
   RF721_5 = 'rf721_5 proxy or not for f721_5' 
   F721_5  = 'f721_5 mother''s age if alive' 
   RF722_5 = 'rf722_5 proxy or not for f722_5' 
   F722_5  = 'f722_5 mother''s age at death' 
   RF73_5  = 'rf73_5 proxy or not for f73_5' 
   F73_5   = 'f73_5 respondent''s age at mother''s death' 
   RF74_5  = 'rf74_5 proxy or not for f74_5' 
   F74_5   = 'f74_5 how many years did your mother attend school?' 
   RF81_5  = 'rf81_5 proxy or not for f81_5' 
   F81_5   = 'f81_5 father alive or not' 
   RF821_5 = 'rf821_5 proxy or not for f821_5' 
   F821_5  = 'f821_5 father''s age if alive' 
   RF822_5 = 'rf822_5 proxy or not for f822_5' 
   F822_5  = 'f822_5 father''s age at death' 
   RF83_5  = 'rf83_5 proxy or not for f83_5' 
   F83_5   = 'f83_5 respondent''s age at father''s death' 
   RF85_5  = 'rf85_5 proxy or not for f85_5' 
   F85_5   = 'f85_5 father''s main occupation in your childhood' 
   RF86_5  = 'rf86_5 proxy or not for f86_5' 
   F86_5   = 'f86_5 years of schooling your father received' 
   RF9_5   = 'rf9_5 proxy or not for f9a_5' 
   F9A_5   = 'f9a_5 number of siblings alive' 
   RF92A_5 = 'rf92a_5 proxy or not for f92a1_5 to f92a6_5' 
   F92A1_5 = 'f92a1_5 birth order of the sibling' 
   F92A2_5 = 'f92a2_5 sex of the sibling' 
   F92A3_5 = 'f92a3_5 sibling alive' 
   F92A4_5 = 'f92a4_5 sibling''s age at present if alive, or age at death if died' 
   F92A5_5 = 'f92a5_5 residence distance' 
   F92A6_5 = 'f92a6_5 frequent visits' 
   RF92B_5 = 'rf92b_5 proxy or not for f92b1_5 to f92b6_5' 
   F92B1_5 = 'f92b1_5 birth order of the sibling' 
   F92B2_5 = 'f92b2_5 sex of the sibling' 
   F92B3_5 = 'f92b3_5 sibling alive' 
   F92B4_5 = 'f92b4_5 sibling''s age at present if alive, or age at death if died' 
   F92B5_5 = 'f92b5_5 residence distance' 
   F92B6_5 = 'f92b6_5 frequent visits' 
   RF92C_5 = 'rf92c_5 proxy or not for f92c1_5 to f92c6_5' 
   F92C1_5 = 'f92c1_5 birth order of the sibling' 
   F92C2_5 = 'f92c2_5 sex of the sibling' 
   F92C3_5 = 'f92c3_5 sibling alive' 
   F92C4_5 = 'f92c4_5 sibling''s age at present if alive, or age at death if died' 
   F92C5_5 = 'f92c5_5 residence distance' 
   F92C6_5 = 'f92c6_5 frequent visits' 
   RF92D_5 = 'rf92d_5 proxy or not for f92d1_5 to f92d6_5' 
   F92D1_5 = 'f92d1_5 birth order of the sibling' 
   F92D2_5 = 'f92d2_5 sex of the sibling' 
   F92D3_5 = 'f92d3_5 sibling alive' 
   F92D4_5 = 'f92d4_5 sibling''s age at present if alive, or age at death if died' 
   F92D5_5 = 'f92d5_5 residence distance' 
   F92D6_5 = 'f92d6_5 frequent visits' 
   RF92E_5 = 'rf92e_5 proxy or not for f92e1_5 to f92e6_5' 
   F92E1_5 = 'f92e1_5 birth order of the sibling' 
   F92E2_5 = 'f92e2_5 sex of the sibling' 
   F92E3_5 = 'f92e3_5 sibling alive' 
   F92E4_5 = 'f92e4_5 sibling''s age at present if alive, or age at death if died' 
   F92E5_5 = 'f92e5_5 residence distance' 
   F92E6_5 = 'f92e6_5 frequent visits' 
   RF92F_5 = 'rf92f_5 proxy or not for f92f1_5 to f92f6_5' 
   F92F1_5 = 'f92f1_5 birth order of the sibling' 
   F92F2_5 = 'f92f2_5 sex of the sibling' 
   F92F3_5 = 'f92f3_5 sibling alive' 
   F92F4_5 = 'f92f4_5 sibling''s age at present if alive, or age at death if died' 
   F92F5_5 = 'f92f5_5 residence distance' 
   F92F6_5 = 'f92f6_5 frequent visits' 
   RF92G_5 = 'rf92g_5 proxy or not for f92g1_5 to f92g6_5' 
   F92G1_5 = 'f92g1_5 birth order of the sibling' 
   F92G2_5 = 'f92g2_5 sex of the sibling' 
   F92G3_5 = 'f92g3_5 sibling alive' 
   F92G4_5 = 'f92g4_5 sibling''s age at present if alive, or age at death if died' 
   F92G5_5 = 'f92g5_5 residence distance' 
   F92G6_5 = 'f92g6_5 frequent visits' 
   RF92H_5 = 'rf92h_5 proxy or not for f92h1_5 to f92h6_5' 
   F92H1_5 = 'f92h1_5 birth order of the sibling' 
   F92H2_5 = 'f92h2_5 sex of the sibling' 
   F92H3_5 = 'f92h3_5 sibling alive' 
   F92H4_5 = 'f92h4_5 sibling''s age at present if alive, or age at death if died' 
   F92H5_5 = 'f92h5_5 residence distance' 
   F92H6_5 = 'f92h6_5 frequent visits' 
   RF92I_5 = 'rf92i_5 proxy or not for f92i1_5 to f92i6_5' 
   F92I1_5 = 'f92i1_5 birth order of the sibling' 
   F92I2_5 = 'f92i2_5 sex of the sibling' 
   F92I3_5 = 'f92i3_5 sibling alive' 
   F92I4_5 = 'f92i4_5 sibling''s age at present if alive, or age at death if died' 
   F92I5_5 = 'f92i5_5 residence distance' 
   F92I6_5 = 'f92i6_5 frequent visits' 
   RF92J_5 = 'rf92j_5 proxy or not for f92j1_5 to f92j6_5' 
   F92J1_5 = 'f92j1_5 birth order of the sibling' 
   F92J2_5 = 'f92j2_5 sex of the sibling' 
   F92J3_5 = 'f92j3_5 sibling alive' 
   F92J4_5 = 'f92j4_5 sibling''s age at present if alive, or age at death if died' 
   F92J5_5 = 'f92j5_5 residence distance' 
   F92J6_5 = 'f92j6_5 frequent visits' 
   RF92K_5 = 'rf92k_5 proxy or not for f92k1_5 to f92k6_5' 
   F92K1_5 = 'f92k1_5 birth order of the sibling' 
   F92K2_5 = 'f92k2_5 sex of the sibling' 
   F92K3_5 = 'f92k3_5 sibling alive' 
   F92K4_5 = 'f92k4_5 sibling''s age at present if alive, or age at death if died' 
   F92K5_5 = 'f92k5_5 residence distance' 
   F92K6_5 = 'f92k6_5 frequent visits' 
   RF103A_5= 'rf103a_5 proxy or not for f103a1_5 to f103a8_5' 
   F103A6_5= 'f103a6_5 birth order of the child' 
   F103A8_5= 'f103a8_5 biological child' 
   F103A1_5= 'f103a1_5 sex of the child' 
   F103A2_5= 'f103a2_5 child alive or not' 
   F103A3_5= 'f103a3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103A4_5= 'f103a4_5 frequent visits' 
   F103A7_5= 'f103a7_5 contact' 
   F103A5_5= 'f103a5_5 residence distance' 
   RF103B_5= 'rf103b_5 proxy or not for f103b1_5 to f103b8_5' 
   F103B6_5= 'f103b6_5 birth order of the child' 
   F103B8_5= 'f103b8_5 biological child' 
   F103B1_5= 'f103b1_5 sex of the child' 
   F103B2_5= 'f103b2_5 child alive or not' 
   F103B3_5= 'f103b3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103B4_5= 'f103b4_5 frequent visits' 
   F103B7_5= 'f103b7_5 contact' 
   F103B5_5= 'f103b5_5 residence distance' 
   RF103C_5= 'rf103c_5 proxy or not for f103c1_5 to f103c8_5' 
   F103C6_5= 'f103c6_5 birth order of the child' 
   F103C8_5= 'f103c8_5 biological child' 
   F103C1_5= 'f103c1_5 sex of the child' 
   F103C2_5= 'f103c2_5 child alive or not' 
   F103C3_5= 'f103c3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103C4_5= 'f103c4_5 frequent visits' 
   F103C7_5= 'f103c7_5 contact' 
   F103C5_5= 'f103c5_5 residence distance' 
   RF103D_5= 'rf103d_5 proxy or not for f103d1_5 to f103d8_5' 
   F103D6_5= 'f103d6_5 birth order of the child' 
   F103D8_5= 'f103d8_5 biological child' 
   F103D1_5= 'f103d1_5 sex of the child' 
   F103D2_5= 'f103d2_5 child alive or not' 
   F103D3_5= 'f103d3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103D4_5= 'f103d4_5 frequent visits' 
   F103D7_5= 'f103d7_5 contact' 
   F103D5_5= 'f103d5_5 residence distance' 
   RF103E_5= 'rf103e_5 proxy or not for f103e1_5 to f103e8_5' 
   F103E6_5= 'f103e6_5 birth order of the child' 
   F103E8_5= 'f103e8_5 biological child' 
   F103E1_5= 'f103e1_5 sex of the child' 
   F103E2_5= 'f103e2_5 child alive or not' 
   F103E3_5= 'f103e3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103E4_5= 'f103e4_5 frequent visits' 
   F103E7_5= 'f103e7_5 contact' 
   F103E5_5= 'f103e5_5 residence distance' 
   RF103F_5= 'rf103f_5 proxy or not for f103f1_5 to f103f8_5' 
   F103F6_5= 'f103f6_5 birth order of the child' 
   F103F8_5= 'f103f8_5 biological child' 
   F103F1_5= 'f103f1_5 sex of the child' 
   F103F2_5= 'f103f2_5 child alive or not' 
   F103F3_5= 'f103f3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103F4_5= 'f103f4_5 frequent visits' 
   F103F7_5= 'f103f7_5 contact' 
   F103F5_5= 'f103f5_5 residence distance' 
   RF103G_5= 'rf103g_5 proxy or not for f103g1_5 to f103g8_5' 
   F103G6_5= 'f103g6_5 birth order of the child' 
   F103G8_5= 'f103g8_5 biological child' 
   F103G1_5= 'f103g1_5 sex of the child' 
   F103G2_5= 'f103g2_5 child alive or not' 
   F103G3_5= 'f103g3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103G4_5= 'f103g4_5 frequent visits' 
   F103G7_5= 'f103g7_5 contact' 
   F103G5_5= 'f103g5_5 residence distance' 
   RF103H_5= 'rf103h_5 proxy or not for f103h1_5 to f103h8_5' 
   F103H6_5= 'f103h6_5 birth order of the child' 
   F103H8_5= 'f103h8_5 biological child' 
   F103H1_5= 'f103h1_5 sex of the child' 
   F103H2_5= 'f103h2_5 child alive or not' 
   F103H3_5= 'f103h3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103H4_5= 'f103h4_5 frequent visits' 
   F103H7_5= 'f103h7_5 contact' 
   F103H5_5= 'f103h5_5 residence distance' 
   RF103I_5= 'rf103i_5 proxy or not for f103i1_5 to f103i8_5' 
   F103I6_5= 'f103i6_5 birth order of the child' 
   F103I8_5= 'f103i8_5 biological child' 
   F103I1_5= 'f103i1_5 sex of the child' 
   F103I2_5= 'f103i2_5 child alive or not' 
   F103I3_5= 'f103i3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103I4_5= 'f103i4_5 frequent visits' 
   F103I7_5= 'f103i7_5 contact' 
   F103I5_5= 'f103i5_5 residence distance' 
   RF103J_5= 'rf103j_5 proxy or not for f103j1_5 to f103j8_5' 
   F103J6_5= 'f103j6_5 birth order of the child' 
   F103J8_5= 'f103j8_5 biological child' 
   F103J1_5= 'f103j1_5 sex of the child' 
   F103J2_5= 'f103j2_5 child alive or not' 
   F103J3_5= 'f103j3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103J4_5= 'f103j4_5 frequent visits' 
   F103J7_5= 'f103j7_5 contact' 
   F103J5_5= 'f103j5_5 residence distance' 
   RF103K_5= 'rf103k_5 proxy or not for f103k1_5 to f103k8_5' 
   F103K6_5= 'f103k6_5 birth order of the child' 
   F103K8_5= 'f103k8_5 biological child' 
   F103K1_5= 'f103k1_5 sex of the child' 
   F103K2_5= 'f103k2_5 child alive or not' 
   F103K3_5= 'f103k3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103K4_5= 'f103k4_5 frequent visits' 
   F103K7_5= 'f103k7_5 contact' 
   F103K5_5= 'f103k5_5 residence distance' 
   RF103L_5= 'rf103l_5 proxy or not for f103l1_5 to f103l8_5' 
   F103L6_5= 'f103l6_5 birth order of the child' 
   F103L8_5= 'f103l8_5 biological child' 
   F103L1_5= 'f103l1_5 sex of the child' 
   F103L2_5= 'f103l2_5 child alive or not' 
   F103L3_5= 'f103l3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103L4_5= 'f103l4_5 frequent visits' 
   F103L7_5= 'f103l7_5 contact' 
   F103L5_5= 'f103l5_5 residence distance' 
   RF103M_5= 'rf103m_5 proxy or not for f103m1_5 to f103m8_5' 
   F103M6_5= 'f103m6_5 birth order of the child' 
   F103M8_5= 'f103m8_5 biological child' 
   F103M1_5= 'f103m1_5 sex of the child' 
   F103M2_5= 'f103m2_5 child alive or not' 
   F103M3_5= 'f103m3_5 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103M4_5= 'f103m4_5 frequent visits' 
   F103M7_5= 'f103m7_5 contact' 
   F103M5_5= 'f103m5_5 residence distance' 
   RF111_5 = 'rf111_5 proxy or not for f111a_5 to f111c_5' 
   F111A_5 = 'f111a_5 the first person to whom you usurally talk frequently in daily life' 
   F111B_5 = 'f111b_5 the second person to whom you usurally talk frequently in daily life' 
   F111C_5 = 'f111c_5 the third person to whom you usurally talk frequently in daily life' 
   RF112_5 = 'rf112_5 proxy or not for f112a_5 to f112c_5' 
   F112A_5 = 'f112a_5 the first person to whom you talk first when you need to tell something of your' 
   F112B_5 = 'f112b_5 the second person to whom you talk first when you need to tell something of your' 
   F112C_5 = 'f112c_5 the third person to whom you talk first when you need to tell something of your' 
   RF113_5 = 'rf113_5 proxy or not for f113a_5 to f113c_5' 
   F113A_5 = 'f113a_5 the first person you asking first for help when you have problem/difficulties' 
   F113B_5 = 'f113b_5 the second person you asking first for help when you have problem/difficulties' 
   F113C_5 = 'f113c_5 the third person you asking first for help when you have problem/difficulties' 
   RF12_5  = 'rf12_5 proxy or not for f12a_5 to f12c_5' 
   F12A_5  = 'f12a_5 how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_5  = 'f12b_5 how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C_5  = 'f12c_5 how much did you receive from your grandchild(ren) last year?' 
   RF13_5  = 'rf13_5 proxy or not for f13a_5 to f13c_5' 
   F13A_5  = 'f13a_5 how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_5  = 'f13b_5 how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C_5  = 'f13c_5 how much did you give to your grandchild(ren)in last year?' 
   RF14_5  = 'rf14_5 proxy or not for f141_5 to f149_5' 
   F141_5  = 'f141_5 is personal care service available in your community?' 
   F142_5  = 'f142_5 is home visit service available in your community?' 
   F143_5  = 'f143_5 is psychological consulting service available in your community?' 
   F144_5  = 'f144_5 is daily shopping service available in your community?' 
   F145_5  = 'f145_5 is social and recreation service available in your community?' 
   F146_5  = 'f146_5 is human rights consulting service available in your community?' 
   F147_5  = 'f147_5 is healthcare education service available in your community?' 
   F148_5  = 'f148_5 is neighborhood-relation service available in your community?' 
   F149_5  = 'f149_5 is any other social service available in your community?' 
   RF15_5  = 'rf15_5 proxy or not for f151_5 to f159_5' 
   F151_5  = 'f151_5 do you expect your community provide personal care services?' 
   F152_5  = 'f152_5 do you expect your community provide home visit services?' 
   F153_5  = 'f153_5 do you expect your community provide psychological consulting services?' 
   F154_5  = 'f154_5 do you expect your community provide daily shopping services?' 
   F155_5  = 'f155_5 do you expect your community provide social and recreation activities?' 
   F156_5  = 'f156_5 do you expect your community provide human rights consulting services?' 
   F157_5  = 'f157_5 do you expect your community provide healthcare education service?' 
   F158_5  = 'f158_5 do you expect your community provide neighborhood-relation services?' 
   F159_5  = 'f159_5 do you expect your community provide other social services?' 
   F16_5   = 'f16_5 what kind of living arrangement do you like best?' 
   RG01_5  = 'rg01_5 proxy or not for g01_5' 
   G01_5   = 'g01_5 how about the quality of your sleep?' 
   RG02_5  = 'rg02_5 proxy or not for g02_5' 
   G02_5   = 'g02_5 how long do you sleep normally?' 
   G1_5    = 'g1_5 visual function' 
   G21_5   = 'g21_5 number of natural teeth' 
   G22_5   = 'g22_5 have false teeth?' 
   G3_5    = 'g3_5 able to use chopsticks to eat?' 
   G4_5    = 'g4_5 hemisphere dominance' 
   G51_5   = 'g51_5 systolic' 
   G52_5   = 'g52_5 diastolic' 
   G6_5    = 'g6_5 rhythm of heart' 
   G7_5    = 'g7_5 heart rate' 
   G81_5   = 'g81_5 hand behind neck' 
   G82_5   = 'g82_5 hand behind lower back' 
   G83_5   = 'g83_5 hold-up arms' 
   G9_5    = 'g9_5 able to stand up from sitting in a chair?' 
   G101_5  = 'g101_5 weight' 
   G102_5  = 'g102_5 stature when the elder was young' 
   G11_5   = 'g11_5 able to pick up a book from the floor?' 
   G12_5   = 'g12_5 steps used to turn around 360 degree without help?' 
   RG130_5 = 'rg130_5 with proxy or not for g13_5' 
   G130_5  = 'g130_5 feel not-well in the past two weeks?' 
   RG13_5  = 'rg13_5 with proxy or not for g13_5' 
   G13_5   = 'g13_5 # of times suffering from serious illness in the past two years' 
   RG14A_5 = 'rg14a_5 with proxy or not for g14a1_5 and g14a2_5' 
   G14A1_5 = 'g14a1_5 name of disease suffering at the first time' 
   G14A2_5 = 'g14a2_5 days lasted for the first time' 
   RG14B_5 = 'rg14b_5 with proxy or not for g14b1_5 and g14b2_5' 
   G14B1_5 = 'g14b1_5 name of disease suffering at the second time' 
   G14B2_5 = 'g14b2_5 days lasted for the second time' 
   RG14C_5 = 'rg14c_5 with proxy or not for g14c1_5 and g14c2_5' 
   G14C1_5 = 'g14c1_5 name of disease suffering at the last time' 
   G14C2_5 = 'g14c2_5 days lasted for the last time' 
   G15A1_5 = 'g15a1_5 suffering from hypertension?' 
   G15A2_5 = 'g15a2_5 diagnosed by hospital?' 
   G15A3_5 = 'g15a3_5 disability in daily life' 
   G15B1_5 = 'g15b1_5 suffering from diabetes?' 
   G15B2_5 = 'g15b2_5 diagnosed by hospital?' 
   G15B3_5 = 'g15b3_5 disability in daily life' 
   G15C1_5 = 'g15c1_5 suffering from heart disease?' 
   G15C2_5 = 'g15c2_5 diagnosed by hospital?' 
   G15C3_5 = 'g15c3_5 disability in daily life' 
   G15D1_5 = 'g15d1_5 suffering from stroke or cvd?' 
   G15D2_5 = 'g15d2_5 diagnosed by hospital?' 
   G15D3_5 = 'g15d3_5 disability in daily life' 
   G15E1_5 = 'g15e1_5 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_5 = 'g15e2_5 diagnosed by hospital?' 
   G15E3_5 = 'g15e3_5 disability in daily life' 
   G15F1_5 = 'g15f1_5 suffering from tuberculosis?' 
   G15F2_5 = 'g15f2_5 diagnosed by hospital?' 
   G15F3_5 = 'g15f3_5 disability in daily life' 
   G15G1_5 = 'g15g1_5 suffering from cataract?' 
   G15G2_5 = 'g15g2_5 diagnosed by hospital?' 
   G15G3_5 = 'g15g3_5 disability in daily life' 
   G15H1_5 = 'g15h1_5 suffering from glaucoma?' 
   G15H2_5 = 'g15h2_5 diagnosed by hospital?' 
   G15H3_5 = 'g15h3_5 disability in daily life' 
   G15I1_5 = 'g15i1_5 suffering from cancer?' 
   G15I2_5 = 'g15i2_5 diagnosed by hospital?' 
   G15I3_5 = 'g15i3_5 disability in daily life' 
   G15J1_5 = 'g15j1_5 suffering from prostate tumor?' 
   G15J2_5 = 'g15j2_5 diagnosed by hospital?' 
   G15J3_5 = 'g15j3_5 disability in daily life' 
   G15K1_5 = 'g15k1_5 suffering from gastric or duodenal ulcer?' 
   G15K2_5 = 'g15k2_5 diagnosed by hospital?' 
   G15K3_5 = 'g15k3_5 disability in daily life' 
   G15L1_5 = 'g15l1_5 suffering from parkinson''s disease?' 
   G15L2_5 = 'g15l2_5 diagnosed by hospital?' 
   G15L3_5 = 'g15l3_5 disability in daily life' 
   G15M1_5 = 'g15m1_5 suffering from bedsore?' 
   G15M2_5 = 'g15m2_5 diagnosed by hospital?' 
   G15M3_5 = 'g15m3_5 disability in daily life' 
   G15N1_5 = 'g15n1_5 suffering from arthritis?' 
   G15N2_5 = 'g15n2_5 diagnosed by hospital?' 
   G15N3_5 = 'g15n3_5 disability in daily life' 
   G15O1_5 = 'g15o1_5 suffering from dementia?' 
   G15O2_5 = 'g15o2_5 diagnosed by hospital?' 
   G15O3_5 = 'g15o3_5 disability in daily life' 
   G15P1_5 = 'g15p1_5 suffering from other disease difficult to classify?' 
   G15P2_5 = 'g15p2_5 diagnosed by hospital?' 
   G15P3_5 = 'g15p3_5 disability in daily life' 
   G15Q1_5 = 'g15q1_5 suffering from psychosis?' 
   G15Q2_5 = 'g15q2_5 diagnosed by hospital?' 
   G15Q3_5 = 'g15q3_5 disability in daily life' 
   G15R1_5 = 'g15r1_5 suffering from orthopedic disease?' 
   G15R2_5 = 'g15r2_5 diagnosed by hospital?' 
   G15R3_5 = 'g15r3_5 disability in daily life' 
   G15S1_5 = 'g15s1_5 suffering from internal medical disease?' 
   G15S2_5 = 'g15s2_5 diagnosed by hospital?' 
   G15S3_5 = 'g15s3_5 disability in daily life' 
   G15T1_5 = 'g15t1_5 suffering from dermatosis?' 
   G15T2_5 = 'g15t2_5 diagnosed by hospital?' 
   G15T3_5 = 'g15t3_5 disability in daily life' 
   G15U1_5 = 'g15u1_5 suffering from five organs diseases?' 
   G15U2_5 = 'g15u2_5 diagnosed by hospital?' 
   G15U3_5 = 'g15u3_5 disability in daily life' 
   G15V1_5 = 'g15v1_5 suffering from gynecological disease?' 
   G15V2_5 = 'g15v2_5 diagnosed by hospital?' 
   G15V3_5 = 'g15v3_5 disability in daily life' 
   G15W1_5 = 'g15w1_5 suffering from other diseases?' 
   G15W2_5 = 'g15w2_5 diagnosed by hospital?' 
   G15W3_5 = 'g15w3_5 disability in daily life' 
   H1_5    = 'h1_5 was interviewee able to hear?' 
   H21_5   = 'h21_5 did interviewee able to participate physical check?' 
   H22_5   = 'h22_5 the reason of unable to participate physical check' 
   H3_5    = 'h3_5 the health of interviewee rated by interviewer' 
   H6_5    = 'h6_5 has interviewer checked if  failing to ask a question?' 
   H7_5    = 'h7_5 did anyone help the interviewee to answer question' 
   H71_5   = 'h71_5 who helped interviewee to answer question?' 
   D5VYEAR = 'd5vyear validated year of death of the sampled person' 
   D5VMONTH= 'd5vmonth validated month of death of the sampled person' 
   D5VDAY  = 'd5vday validated day of death of the sampled person' 
   D5MTHIN = 'd5mthin month of the interivew conducted in 2005' 
   D5DAYIN = 'd5dayin day of the interivew conducted in 2005' 
   D5SEX   = 'd5sex sex of the deceased person' 
   D5RESID = 'd5resid place of residence at death' 
   D5RESPON= 'd5respon who asnwered the questionnaire' 
   D5MARRY = 'd5marry marital status of the deceased elder at death' 
   D5LIVARR= 'd5livarr primary living arrangement of the deceased elder in the last year of life' 
   D5PERSON= 'd5person number of people who living with the respondent before dying' 
   D5GENER = 'd5gener number of generations living in the household when the elderly died' 
   D5DPLACE= 'd5dplace place of death' 
   D5CAUSE = 'd5cause main cause of death' 
   D5CARGIV= 'd5cargiv primary caregiver before dying' 
   D5PCGDAY= 'd5pcgday number of days cared for the deceased by primary caregiver in the last month of' 
   D5BEDRID= 'd5bedrid bedridden or nor before dying' 
   D5BEDDAY= 'd5bedday days of being bedridden before dying' 
   D5ILL   = 'd5ill number of times suffering from serious illness' 
   D5DISEA1= 'd5disea1 name of disease suffering from at the first time' 
   D5DIDAY1= 'd5diday1 days suffering from such disease at the first time' 
   D5DISEA2= 'd5disea2 name of disease suffering from at the second time' 
   D5DIDAY2= 'd5diday2 days suffering from such disease at the second time' 
   D5DISEA3= 'd5disea3 name of disease suffering from at the last time' 
   D5DIDAY3= 'd5diday3 days suffering from such disease at the last time' 
   D5MEDICA= 'd5medica got timely medication before dying' 
   D5FINANC= 'd5financ main financial source before dying' 
   D5INCOME= 'd5income yearly per capita income of the family of the deceased elder' 
   D5WCFACI= 'd5wcfaci family had toilet facility before the elder died' 
   D5TAPWAT= 'd5tapwat family had tap water facility before the elder died' 
   D5BATHFA= 'd5bathfa family had bath facility before the elder died' 
   D5HEATER= 'd5heater family had heater before the elder died' 
   D5TVSET = 'd5tvset family had tv before the elder died' 
   D5WASHMA= 'd5washma family had washing machine before elder died' 
   D5PHONE = 'd5phone family had telephone before the elder died' 
   D5DOCTOR= 'd5doctor if the deceased elder lived in rural, was there a doctor in the village?' 
   D5LICDOC= 'd5licdoc did the village doctor have a license?' 
   D5WHOPAY= 'd5whopay who mainly paid the medical cost for the deceased elder?' 
   D5MEDCOS= 'd5medcos total medical cost (in yuan, rmb) in the last year of the life' 
   D5POCKET= 'd5pocket total amount of out-of-pocket' 
   D5BATHFU= 'd5bathfu functioning of bathing before dying' 
   D5BATDAY= 'd5batday days lasted if bathing functioning disabled or partially disabled' 
   D5DRESFU= 'd5dresfu functioning of dressing before dying' 
   D5DREDAY= 'd5dreday days lasted if dressing functioning disabled or partially disabled' 
   D5TOILFU= 'd5toilfu functioning of toileting before dying' 
   D5TOIDAY= 'd5toiday days lasted if toileting functioning disabled or partially disabled' 
   D5MOVEFU= 'd5movefu functioning of indoor transferring before dying' 
   D5MOVDAY= 'd5movday days lasted if indoor transferring functioning disabled or partially disabled' 
   D5CONTFU= 'd5contfu functioning of continence before dying' 
   D5CONDAY= 'd5conday days lasted in incontinence' 
   D5FEEDFU= 'd5feedfu functioning of self-feeding before dying' 
   D5FEEDAY= 'd5feeday days lasted if can''t feed self' 
   D5FULLDA= 'd5fullda days the deceased perosn needing full care before dying' 
   D5CARCST= 'd5carcst total cost for full care in daily life' 
   D5DIRCST= 'd5dircst total direct cost for caregiving in the last month of life' 
   D5CARPAY= 'd5carpay who mainly paid the care serivces before dying?' 
   D5OUTDOR= 'd5outdor days the elder could not get outdoor to chat before dying' 
   D5ACTDAY= 'd5actday number of days being bedridden longer than that of activities before dying' 
   D5SMOKE = 'd5smoke smoked or not since the last interview' 
   D5SMKTIM= 'd5smktim number of times smoked a day on average' 
   D5DRINK = 'd5drink did the deceased elder drink since the last interview?' 
   D5KNDDRK= 'd5knddrk what kind of drink if the elder drank?' 
   D5DRKMCH= 'd5drkmch how much (liang) did the elder drink every day since last interview?' 
   D5ADVDIR= 'd5advdir whether did the deceased elderly tell the family about his/her death and related' 
   D5DIRDAY= 'd5dirday if yes, how many days did she/he tell the family before her/his death' 
   D5DREAM = 'd5dream whether did the deceased elderly have some dreams about the death before dying?' 
   D5PAIN  = 'd5pain whether was the deceased elderly painful before dying?' 
   D5UNCONS= 'd5uncons was the deceased elderly unconscious before death?' 
   D5UNCDAY= 'd5uncday if yes, how many days lasted before death' 
   DTH05_08= 'dth05_08 status of survival, death, or lost to follow-up from the 2005 to 2008 waves' 
   YEAR_8  = 'year_8 year of the 2008-09 interview' 
   MONTH_8 = 'month_8 month of the 2008 interview' 
   DAY_8   = 'day_8 day of the 2008 interview' 
   RESID_8 = 'resid_8 category of residence of the interviewee in 2008' 
   VAGE_8  = 'vage_8 validated age' 
   RA51_8  = 'ra51_8 proxy or not for a51' 
   A51_8   = 'a51_8 co-residence of interviewee' 
   RA52_8  = 'ra52_8 proxy or not for a52' 
   A52_8   = 'a52_8 how many people are living with you?' 
   RA53A_8 = 'ra53a_8 proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4' 
   A53A1_8 = 'a53a1_8 relationship between you and 1st person you living with currently' 
   A53A3_8 = 'a53a3_8 sex of 1st person living with you currently' 
   A53A2_8 = 'a53a2_8 age of 1st person living with you currently' 
   A53A4_8 = 'a53a4_8 education level of 1st person living with you currently' 
   RA53B_8 = 'ra53b_8 proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4' 
   A53B1_8 = 'a53b1_8 relationship between you and 2nd person living with you currently' 
   A53B3_8 = 'a53b3_8 age of 2nd person living with you currently' 
   A53B2_8 = 'a53b2_8 age of 2nd person living with you currently' 
   A53B4_8 = 'a53b4_8 education level of 2nd person living with you currently' 
   RA53C_8 = 'ra53c_8 proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4' 
   A53C1_8 = 'a53c1_8 relationship between you and 3rd person living with you currently' 
   A53C3_8 = 'a53c3_8 sex of 3rd person living with you currently' 
   A53C2_8 = 'a53c2_8 age of 3rd person living with you currently' 
   A53C4_8 = 'a53c4_8 education level of 3rd person living with you currently' 
   RA53D_8 = 'ra53d_8 proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4' 
   A53D1_8 = 'a53d1_8 relationship between you and 4th person living with you currently' 
   A53D3_8 = 'a53d3_8 sex of 4th person living with you currently' 
   A53D2_8 = 'a53d2_8 age of 4th person living with you currently' 
   A53D4_8 = 'a53d4_8 education level of 4th person living with you currently' 
   RA53E_8 = 'ra53e_8 proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4' 
   A53E1_8 = 'a53e1_8 relationship between you and 5th person living with you currently' 
   A53E3_8 = 'a53e3_8 sex of 5th person living with you currently' 
   A53E2_8 = 'a53e2_8 age of 5th person living with you currently' 
   A53E4_8 = 'a53e4_8 education level of 5th person living with you currently' 
   RA53F_8 = 'ra53f_8 proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4' 
   A53F1_8 = 'a53f1_8 relationship between you and 6th person living with you currently' 
   A53F3_8 = 'a53f3_8 sex of 6th person living with you currently' 
   A53F2_8 = 'a53f2_8 age of 6th person living with you currently' 
   A53F4_8 = 'a53f4_8 education level of 6th person living with you currently' 
   RA53G_8 = 'ra53g_8 proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4' 
   A53G1_8 = 'a53g1_8 relationship between you and 7th person living with you currently' 
   A53G3_8 = 'a53g3_8 sex of 7th person living with you currently' 
   A53G2_8 = 'a53g2_8 age of 7th person living with you currently' 
   A53G4_8 = 'a53g4_8 education level of 7th person living with you currently' 
   RA53H_8 = 'ra53h_8 proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4' 
   A53H1_8 = 'a53h1_8 relationship between you and 8th person living with you currently' 
   A53H3_8 = 'a53h3_8 sex of 8th person living with you currently' 
   A53H2_8 = 'a53h2_8 age of 8th person living with you currently' 
   A53H4_8 = 'a53h4_8 education level of 8th person living with you currently' 
   RA53I_8 = 'ra53i_8 proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4' 
   A53I1_8 = 'a53i1_8 relationship between you and 9th person living with you currently' 
   A53I3_8 = 'a53i3_8 sex of 9th person living with you currently' 
   A53I2_8 = 'a53i2_8 age of 9th person living with you currently' 
   A53I4_8 = 'a53i4_8 education level of 9th person living with you currently' 
   RA53J_8 = 'ra53j_8 proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4' 
   A53J1_8 = 'a53j1_8 relationship between you and 10th person living with you currently' 
   A53J11_8= 'a53j11_8 other relationship between you and 10th person living with you currently' 
   A53J3_8 = 'a53j3_8 sex of 10th person living with you currently' 
   A53J2_8 = 'a53j2_8 age of 10th person living with you currently' 
   A53J4_8 = 'a53j4_8 education level of 10th person living with you currently' 
   RA53K_8 = 'ra53k_8 proxy or not for a53k1, a53k11, a53k2, a53k3, a53k4' 
   A53K1_8 = 'a53k1_8 relationship between you and 11th person living with you currently' 
   A53K11_8= 'a53k11_8 other relationship between you and 11th person living with you currently' 
   A53K3_8 = 'a53k3_8 sex of 11th person living with you currently' 
   A53K2_8 = 'a53k2_8 age of 11th person living with you currently' 
   A53K4_8 = 'a53k4_8 education level of 11th person living with you currently' 
   RA53L_8 = 'ra53l_8 proxy or not for a53l1, a53l11, a53l2, a53l3,a53l4' 
   A53L1_8 = 'a53l1_8 relationship between you and 12th person living with you currently' 
   A53L11_8= 'a53l11_8 other relationship between you and 12th person living with you currently' 
   A53L3_8 = 'a53l3_8 sex of 12th person living with you currently' 
   A53L2_8 = 'a53l2_8 age of 12th person living with you currently' 
   A53L4_8 = 'a53l4_8 education level of 12th person living with you currently' 
   RA530_8 = 'ra530_8 proxy or not for a530' 
   A530_8  = 'a530_8 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531_8 = 'ra531_8 proxy or not for a531' 
   A531_8  = 'a531_8 under whose name your current house/apartment purchased or rented' 
   RA532_8 = 'ra532_8 proxy or not for a532' 
   A532_8  = 'a532_8 do you (and your spouse) have your own bedroom?' 
   RA541_8 = 'ra541_8 proxy or not for a541' 
   A541_8  = 'a541_8 the average monthly cost for the elder living in an institution' 
   RA542_8 = 'ra542_8 proxy or not for a542' 
   A542_8  = 'a542_8 who mainly paid for the cost?' 
   RA54_8  = 'ra54_8 proxy or not for a54a a54b' 
   A54A_8  = 'a54a_8 year of being admitted to the institution or living alone' 
   A54B_8  = 'a54b_8 month of being admitted to the institution or living alone' 
   B11_8   = 'b11_8 self-reported quality of life' 
   B12_8   = 'b12_8 self-reported health' 
   B121_8  = 'b121_8 do you feel any change of your health since last year' 
   B21_8   = 'b21_8 look on the bright side of things' 
   B22_8   = 'b22_8 keep my belongings neat and clean' 
   B23_8   = 'b23_8 feel fearful or anxious' 
   B24_8   = 'b24_8 feel lonely and isolated' 
   B25_8   = 'b25_8 make own decision' 
   B26_8   = 'b26_8 feel useless with age' 
   B27_8   = 'b27_8 be happy as younger' 
   C11_8   = 'c11_8 what time of day is it right now?' 
   C12_8   = 'c12_8 what is the animal year of this year?' 
   C13_8   = 'c13_8 what is the date of the mid-autumn festival?' 
   C14_8   = 'c14_8 what is the season right now?' 
   C15_8   = 'c15_8 what is the name of this county or district?' 
   C16_8   = 'c16_8 # of kinds of food named in one minute' 
   C21A_8  = 'c21a_8 repeat the name of ''table'' at first attempt' 
   C21B_8  = 'c21b_8 repeat the name of ''apple'' at first attempt' 
   C21C_8  = 'c21c_8 repeat the name of ''clothes'' at first attempt' 
   C22_8   = 'c22_8 attempts to repeat the names of three objects correctly' 
   C31A_8  = 'c31a_8 $20-$3=?' 
   C31B_8  = 'c31b_8 $20-$3-$3=?' 
   C31C_8  = 'c31c_8 $20-$3-$3-$3=?' 
   C31D_8  = 'c31d_8 $20-$3-$3-$3-$3=?' 
   C31E_8  = 'c31e_8 $20-$3-$3-$3-$3-$3=?' 
   C32_8   = 'c32_8 draw the figure following the example' 
   C41A_8  = 'c41a_8 repeat the name of ''table'' a while later' 
   C41B_8  = 'c41b_8 repeat the name of ''apple'' a while later' 
   C41C_8  = 'c41c_8 repeat the name of ''clothes'' a while later' 
   C51A_8  = 'c51a_8 name ''pen''' 
   C51B_8  = 'c51b_8 name ''watch''' 
   C52_8   = 'c52_8 repeat a sentence' 
   C52X1_8 = 'c52x1_8 act as the meaning of a sentence' 
   C52X2_8 = 'c52x2_8 write a complete sentence' 
   C53A_8  = 'c53a_8 taking paper using right hand' 
   C53B_8  = 'c53b_8 fold paper' 
   C53C_8  = 'c53c_8 put paper on the floor' 
   C54_8   = 'c54_8 was the interviewee able to answer sections b and c?' 
   C55_8   = 'c55_8 what is the main reason unable to answer questions?' 
   RD1_8   = 'rd1_8 proxy or not for d1' 
   D1_8    = 'd1_8 staple food' 
   RD2_8   = 'rd2_8  proxy or not for d2' 
   D2_8    = 'd2_8 amount of staple food per day (liang)' 
   RD31_8  = 'rd31_8 proxy or not for d31' 
   D31_8   = 'd31_8 how often eat fresh fruit?' 
   RD32_8  = 'rd32_8 proxy or not for d32' 
   D32_8   = 'd32_8 how often eat vegetables?' 
   RD33_8  = 'rd33_8 proxy or not for d33' 
   D33_8   = 'd33_8 what kind of grease do you mainly use for cooking?' 
   RD34_8  = 'rd34_8 proxy or not for d34' 
   D34_8   = 'd34_8 main flavor you have' 
   RD4MEAT_8= 'rd4meat_8 proxy or not for d4meat1 and d4meat2' 
   D4MEAT2_8= 'd4meat2_8 how often eat meat at present?' 
   D4MEAT1_8= 'd4meat1_8 how often ate meat at around age 60?' 
   RD4FISH_8= 'rd4fish_8 proxy or not for d4fish1 and d4fish2' 
   D4FISH2_8= 'd4fish2_8 how often eat fish at present?' 
   D4FISH1_8= 'd4fish1_8 how often ate fish at around age 60?' 
   RD4EGG_8= 'rd4egg_8 proxy or not for d4egg1 and d4egg2' 
   D4EGG2_8= 'd4egg2_8 how often eat eggs at present?' 
   D4EGG1_8= 'd4egg1_8 how often ate eggs at around age 60?' 
   RD4BEAN_8= 'rd4bean_8 proxy or not for d4bean1 and d4bean2' 
   D4BEAN2_8= 'd4bean2_8 how often eat food made from beans at present?' 
   D4BEAN1_8= 'd4bean1_8 how often ate food made from beans at around age 60?' 
   RD4VEG_8= 'rd4veg_8 proxy or not for d4veg1 and d4veg2' 
   D4VEG2_8= 'd4veg2_8 how often eat salt-preserved vegetables at present' 
   D4VEG1_8= 'd4veg1_8 how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA_8= 'rd4suga_8 proxy or not for d4suga1 and d4suga2' 
   D4SUGA2_8= 'd4suga2_8 how often eat sugar at present' 
   D4SUGA1_8= 'd4suga1_8 how often ate sugar at around age 60' 
   RD4TEA_8= 'rd4tea_8 proxy or not for d4tea1 and d4tea2' 
   D4TEA2_8= 'd4tea2_8 how often drink tea at present' 
   D4TEA1_8= 'd4tea1_8 how often drank tea at around age 60' 
   RD4GARL_8= 'rd4garl_8 proxy or not for d4garl1 and d4garl2' 
   D4GARL2_8= 'd4garl2_8 how often eat garlic at present' 
   D4GARL1_8= 'd4garl1_8 how often ate garlic at around age 60' 
   RDEMILK_8= 'rdemilk_8 proxy or not for d4milk1 and d4milk2' 
   D4MILK1_8= 'd4milk1_8 how often eat milk products at present' 
   D4MILK2_8= 'd4milk2_8 how often ate milk products at around age 60' 
   RD4NUT_8= 'rd4nut_8 proxy or not for d4nut1 and d4nut2' 
   D4NUT1_8= 'd4nut1_8 how often eat nut products at present' 
   D4NUT2_8= 'd4nut2_8 how often ate nut products at around age 60' 
   RD4ALGA_8= 'rd4alga_8 proxy or not for d4alga1 and d4alga2' 
   D4ALGA1_8= 'd4alga1_8 how often eat mushroom or algae at present' 
   D4ALGA2_8= 'd4alga2_8 how often ate mushroom or algae at around age 60' 
   RD4VIT_8= 'rd4vit_8 proxy or not for d4vit1 and d4vit2' 
   D4VIT1_8= 'd4vit1_8 how often eat vitamins (a/c/e) at present' 
   D4VIT2_8= 'd4vit2_8 how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG_8= 'rd4drug_8 proxy or not for d4drug1 and d4drug2' 
   D4DRUG1_8= 'd4drug1_8 how often eat medicinal plants at present' 
   D4DRUG2_8= 'd4drug2_8 how often ate medicinal plants at around age 60' 
   RD5_8   = 'rd5_8 proxy or not for d5' 
   D5_8    = 'd5_8 what kind of water usually drink?' 
   RD6_8   = 'rd6_8 proxy or not for d6a d6b d6c' 
   D6A_8   = 'd6a_8 main source of water drank during childhood' 
   D6B_8   = 'd6b_8 main source of water drank at around age 60' 
   D6C_8   = 'd6c_8 main source of drinking water at present' 
   RD71_8  = 'rd71_8 proxy or not for d71' 
   D71_8   = 'd71_8 smoke or not at present?' 
   RD72_8  = 'rd72_8 proxy or not for d72' 
   D72_8   = 'd72_8 smoked or not in the past?' 
   RD73_8  = 'rd73_8 proxy or not for d73' 
   D73_8   = 'd73_8 age when began smoking' 
   RD74_8  = 'rd74_8 proxy or not for d74' 
   D74_8   = 'd74_8 age when quit smoking if not smoking at present' 
   RD75_8  = 'rd75_8 proxy or not for d75' 
   D75_8   = 'd75_8 number of times smoke (or smoked) per day' 
   RD81_8  = 'rd81_8 proxy or not for d81' 
   D81_8   = 'd81_8 drink or not at present?' 
   RD82_8  = 'rd82_8 proxy or not for d82' 
   D82_8   = 'd82_8 drank or not in the past?' 
   RD83_8  = 'rd83_8 proxy or not for d83' 
   D83_8   = 'd83_8 age when began drinking' 
   RD84_8  = 'rd84_8 proxy or not for d84' 
   D84_8   = 'd84_8 age when quit drinking if not drinking at present' 
   RD85_8  = 'rd85_8 proxy or not for d85' 
   D85_8   = 'd85_8 kind of alcohol you drink (drank) ?' 
   RD86_8  = 'rd86_8 proxy or not for d86' 
   D86_8   = 'd86_8 how much per day do you drink (or drank)?' 
   RD91_8  = 'rd91_8 proxy or not for d91' 
   D91_8   = 'd91_8 exercise or not at present?' 
   RD92_8  = 'rd92_8 proxy or not for d92' 
   D92_8   = 'd92_8 exercised or not in the past?' 
   RD93_8  = 'rd93_8 proxy or not for d93' 
   D93_8   = 'd93_8 age when started to exercise' 
   RD94_8  = 'rd94_8 proxy or not for d94' 
   D94_8   = 'd94_8 age when quit exercise if not exercising at present' 
   RD101_8 = 'rd101_8 proxy or not for d101' 
   D101_8  = 'd101_8 have you done physical labor regularly?' 
   RD102_8 = 'rd102_8 proxy or not for d102' 
   D102_8  = 'd102_8 age when began doing physical labor' 
   RD103_8 = 'rd103_8 proxy or not for d103' 
   D103_8  = 'd103_8 age when stopped doing physical labor' 
   RD11A_8 = 'rd11a_8 proxy or not for d11a' 
   D11A_8  = 'd11a_8 do you do house work at present?' 
   RD11B_8 = 'rd11b_8 proxy or not for d11b' 
   D11B_8  = 'd11b_8 do you grow vegetables & do other field work at present?' 
   RD11C_8 = 'rd11c_8 proxy or not for d11c' 
   D11C_8  = 'd11c_8 do you do garden work' 
   RD11D_8 = 'rd11d_8 proxy or not for d11d' 
   D11D_8  = 'd11d_8 do you read newspapers/books at present?' 
   RD11E_8 = 'rd11e_8 proxy or not for d11e' 
   D11E_8  = 'd11e_8 do you raise domestic animals/pets at present?' 
   RD11F_8 = 'rd11f_8 proxy or not for d11f' 
   D11F_8  = 'd11f_8 do you play cards/mah-jongg at present?' 
   RD11G_8 = 'rd11g_8 proxy or not for d11g' 
   D11G_8  = 'd11g_8 do you watch tv or listen to radio at present ?' 
   RD11H_8 = 'rd11h_8 proxy or not for d11h' 
   D11H_8  = 'd11h_8 do you take part in some social activities at present?' 
   RD12_8  = 'rd12_8 proxy or not for d12' 
   D12_8   = 'd12_8 # of times traveling beyond home county/city in the past two years' 
   RE6_8   = 're6_8 proxy or not for e6' 
   E6_8    = 'e6_8 feeding' 
   RE6B_8  = 're6b_8 proxy or not for e6b' 
   E6B_8   = 'e6b_8 # of days needing assistance in feeding' 
   RE1_8   = 're1_8 proxy or not for e1' 
   E1_8    = 'e1_8 bathing' 
   RE1B_8  = 're1b_8 proxy or not for e1b' 
   E1B_8   = 'e1b_8 # of days needing assistance in bathing' 
   RE2_8   = 're2_8 proxy or not for e2' 
   E2_8    = 'e2_8 dressing' 
   RE2B_8  = 're2b_8 proxy or not for e2b' 
   E2B_8   = 'e2b_8 # of days needing assistance in dressing' 
   RE3_8   = 're3_8 proxy or not for e3' 
   E3_8    = 'e3_8 toileting' 
   RE3B_8  = 're3b_8 proxy or not for e3b' 
   E3B_8   = 'e3b_8 # of days needing assistance in toileting' 
   RE4_8   = 're4_8 proxy or not for e4' 
   E4_8    = 'e4_8 indoor transferring' 
   RE4B_8  = 're4b_8 proxy or not for e4b' 
   E4B_8   = 'e4b_8 # of days needing assistance in indoor transferring' 
   RE5_8   = 're5_8 proxy or not for e5' 
   E5_8    = 'e5_8 continence' 
   RE5B_8  = 're5b_8 proxy or not for e5b' 
   E5B_8   = 'e5b_8 # of days needing assistance in continence' 
   RE610_8 = 're610_8 proxy or not for e610' 
   E610_8  = 'e610_8 primary caregiver when the elder need assistance in above six tasks' 
   RE62_8  = 're62_8 proxy or not for e62' 
   E62_8   = 'e62_8 the willingness of the primary caregiver when providing such care' 
   RE63_8  = 're63_8 proxy or not for e63' 
   E63_8   = 'e63_8 the total direct cost paid for caregiving last week' 
   RE64_8  = 're64_8 proxy or not for e64' 
   E64_8   = 'e64_8 who mainly pays the above cost?' 
   RE65_8  = 're65_8 proxy or not for e65' 
   E65_8   = 'e65_8 does the help received for the six above tasks meet his/her needs?' 
   RE67_8  = 're67_8 proxy or not for e67' 
   E67_8   = 'e67_8 how many hours did the (grand)children help the elder last week?' 
   RE7_8   = 're7_8 proxy or not for e7' 
   E7_8    = 'e7_8 able to go outside to visit neighbors?' 
   RE8_8   = 're8_8 proxy or not for e8' 
   E8_8    = 'e8_8 able to go shopping by yourself?' 
   RE9_8   = 're9_8 proxy or not for e9' 
   E9_8    = 'e9_8 able to make food by yourself?' 
   RE10_8  = 're10_8 proxy or not for e10' 
   E10_8   = 'e10_8 able to wash clothes by yourself?' 
   RE11_8  = 're11_8 proxy or not for e11' 
   E11_8   = 'e11_8 able to walk one kilometer?' 
   RE12_8  = 're12_8 proxy or not for e12' 
   E12_8   = 'e12_8 able to carry 5kg weight?' 
   RE13_8  = 're13_8 proxy or not for e13' 
   E13_8   = 'e13_8 able to crouch and stand three times?' 
   RE14_8  = 're14_8 proxy or not for e14' 
   E14_8   = 'e14_8 able to take public transportation?' 
   RF1_8   = 'rf1_8 proxy or not for f1' 
   F1_8    = 'f1_8 years of schooling' 
   RF2_8   = 'rf2_8 proxy or not for f2' 
   F2_8    = 'f2_8 main occupation before age 60' 
   F2T_8   = 'f2t_8 other occupation beyond f1' 
   RF21_8  = 'rf21_8 proxy or not for f21' 
   F21_8   = 'f21_8 do you have a pension?' 
   RF211_8 = 'rf211_8 proxy or not for f211' 
   F211_8  = 'f211_8 are you retired?' 
   RF22_8  = 'rf22_8 proxy or not for f22' 
   F22_8   = 'f22_8 which year did you retire?' 
   RF23_8  = 'rf23_8 proxy or not for f23' 
   F23_8   = 'f23_8 are you still engaged in paid jobs now?' 
   RF31_8  = 'rf31_8 proxy or not for f31' 
   F31_8   = 'f31_8 main source of financial support' 
   RF32_8  = 'rf32_8 proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A_8  = 'f32a_8 first of other financial support sources' 
   F32B_8  = 'f32b_8 second of other financial support sources' 
   F32C_8  = 'f32c_8 third of other financial support sources' 
   F32D_8  = 'f32d_8 fourth of other financial support sources' 
   F32E_8  = 'f32e_8 fifth of other financial support sources' 
   RF33_8  = 'rf33_8 proxy or not for f33' 
   F33_8   = 'f33_8 is all of the financial support sufficient to pay for daily expenses?' 
   RF340_8 = 'rf340_8 proxy or not for f340' 
   F340_8  = 'f340_8 your power in decision-making on financial spending in the household' 
   RF34_8  = 'rf34_8 proxy or not for f34' 
   F34_8   = 'f34_8 how do you rate your economic status compared with other local people?' 
   RF35_8  = 'rf35_8 proxy or not for f35' 
   F35_8   = 'f35_8 total income of your household last year' 
   RF41_8  = 'rf41_8 proxy or not for f41' 
   F41_8   = 'f41_8 current marital status' 
   RF42_8  = 'rf42_8 proxy or not for f42' 
   F42_8   = 'f42_8 how many times have you been married?' 
   RF43A_8 = 'rf43a_8 proxy or not for f43a1 to f43a4' 
   F43A1_8 = 'f43a1_8 age at the 1st marriage' 
   F43A2_8 = 'f43a2_8 current status of the 1st marriage' 
   F43A3_8 = 'f43a3_8 age at the 1st marriage dissolution' 
   F43A4_8 = 'f43a4_8 quality of the 1st marriage' 
   RF43B_8 = 'rf43b_8 proxy or not for f43b1 to f43b4' 
   F43B1_8 = 'f43b1_8 age at the 2nd marriage' 
   F43B2_8 = 'f43b2_8 current status of the 2nd marriage' 
   F43B3_8 = 'f43b3_8 age at the 2nd marriage dissolution' 
   F43B4_8 = 'f43b4_8 quality of the 2nd marriage' 
   RF43C_8 = 'rf43c_8 proxy or not for f43c1 to f43c4' 
   F43C1_8 = 'f43c1_8 age at the 3rd marriage' 
   F43C2_8 = 'f43c2_8 current status of the 3rd marriage' 
   F43C3_8 = 'f43c3_8 age at the 3rd marriage dissolution' 
   F43C4_8 = 'f43c4_8 quality of the 3rd marriage' 
   RF43D_8 = 'rf43d_8 proxy or not for f43d1 to f43d4' 
   F43D1_8 = 'f43d1_8 age at the latest marriage' 
   F43D2_8 = 'f43d2_8 current status of the latest marriage' 
   F43D3_8 = 'f43d3_8 age at the latest marriage dissolution' 
   F43D4_8 = 'f43d4_8 quality of the latest marriage' 
   RF44_8  = 'rf44_8 proxy or not for f44' 
   F44_8   = 'f44_8 years of schooling of the latest spouse' 
   RF45_8  = 'rf45_8 proxy or not for f45' 
   F45_8   = 'f45_8 main occupation of the latest spouse before age 60' 
   RF46_8  = 'rf46_8 proxy or not for f46' 
   F46_8   = 'f46_8 does your spouse have a paid job at present?' 
   RF47_8  = 'rf47_8 proxy or not for f47' 
   F47_8   = 'f47_8 current health status of your spouse' 
   RF5_8   = 'rf5_8 proxy or not for f5' 
   F5_8    = 'f5_8 who take care of you when you are sick?' 
   RF61_8  = 'rf61_8 proxy or not for f61' 
   F61_8   = 'f61_8 get adequate medical service at present' 
   RF610_8 = 'rf610_8 proxy or not for f610' 
   F610_8  = 'f610_8 main reason not to visit doctor when necessary' 
   RF62_8  = 'rf62_8 proxy or not for f62' 
   F62_8   = 'f62_8 got adequate medical treatment at around age 60' 
   RF63_8  = 'rf63_8 proxy or not for 63' 
   F63_8   = 'f63_8 got adequate medical treatment in childhood' 
   RF64_8  = 'rf64_8 proxy or not for f64' 
   F64A_8  = 'f64a_8 do you have retirement pension at present' 
   F64B_8  = 'f64b_8 do you have public old-age insurance at present' 
   F64C_8  = 'f64c_8 do you have private old-age insurance at present' 
   F64D_8  = 'f64d_8 do you have public free medical services at present' 
   F64E_8  = 'f64e_8 do you have collective medical services at present' 
   F64F_8  = 'f64f_8 do you have basic medical insurance at present' 
   F64G_8  = 'f64g_8 do you have severe disease insurance at present' 
   F64H_8  = 'f64h_8 do you have life insurance at present' 
   F64I_8  = 'f64i_8 do you have other social security or private insurance at present' 
   RF651A_8= 'rf651a_8 proxy or not for f651a' 
   F651A_8 = 'f651a_8 how much money did you spend on medical care last year?' 
   RF651B_8= 'rf651b_8 proxy or not for f651b' 
   F651B_8 = 'f651b_8 how much money did your family pay for your medical care last year?' 
   RF652_8 = 'rf652_8 proxy or not for f652' 
   F652_8  = 'f652_8 who mainly paid the cost?' 
   RF66_8  = 'rf66_8 proxy or not for f66' 
   F66_8   = 'f66_8 often went to bed hungry as a child' 
   RF71_8  = 'rf71_8 proxy or not for f71' 
   F71_8   = 'f71_8 mother alive or not' 
   RF721_8 = 'rf721_8 proxy or not for f721' 
   F721_8  = 'f721_8 mother''s age if alive' 
   RF722_8 = 'rf722_8 proxy or not for f722' 
   F722_8  = 'f722_8 mother''s age at death' 
   RF73_8  = 'rf73_8 proxy or not for f73' 
   F73_8   = 'f73_8 respondent''s age at mother''s death' 
   RF74_8  = 'rf74_8 proxy or not for f74' 
   F74_8   = 'f74_8 how many years did your mother attend school?' 
   RF81_8  = 'rf81_8 proxy or not for f81' 
   F81_8   = 'f81_8 father alive or not' 
   RF821_8 = 'rf821_8 proxy or not for f821' 
   F821_8  = 'f821_8 father''s age if alive' 
   RF822_8 = 'rf822_8 proxy or not for f822' 
   F822_8  = 'f822_8 father''s age at death' 
   RF83_8  = 'rf83_8 proxy or not for f83' 
   F83_8   = 'f83_8 respondent''s age at father''s death' 
   RF84_8  = 'rf84_8 proxy or not for f84' 
   F84_8   = 'f84_8 father''s main occupation before age 60' 
   RF85_8  = 'rf85_8 proxy or not for f85' 
   F85_8   = 'f85_8 father''s main occupation in your childhood' 
   RF86_8  = 'rf86_8 proxy or not for f86' 
   F86_8   = 'f86_8 years of schooling your father received' 
   RF9_8   = 'rf9_8 proxy or not for f9' 
   F9_8    = 'f9_8 number of biological siblings' 
   F9A_8   = 'f9a_8 number of biological siblings alive' 
   RF91_8  = 'rf91_8 proxy or not for f91' 
   F91_8   = 'f91_8 birth order of respondent' 
   RF92A_8 = 'rf92a_8 proxy or not for f92a1 to f92a6' 
   F92A1_8 = 'f92a1_8 birth order of the sibling' 
   F92A2_8 = 'f92a2_8 sex of the sibling' 
   F92A3_8 = 'f92a3_8 sibling alive' 
   F92A4_8 = 'f92a4_8 sibling''s age at present if alive, or age at death if died' 
   F92A5_8 = 'f92a5_8 residence distance' 
   F92A6_8 = 'f92a6_8 frequent visits' 
   RF92B_8 = 'rf92b_8 proxy or not for f92b1 to f92b6' 
   F92B1_8 = 'f92b1_8 birth order of the sibling' 
   F92B2_8 = 'f92b2_8 sex of the sibling' 
   F92B3_8 = 'f92b3_8 sibling alive' 
   F92B4_8 = 'f92b4_8 sibling''s age at present if alive, or age at death if died' 
   F92B5_8 = 'f92b5_8 residence distance' 
   F92B6_8 = 'f92b6_8 frequent visits' 
   RF92C_8 = 'rf92c_8 proxy or not for f92c1 to f92c6' 
   F92C1_8 = 'f92c1_8 birth order of the sibling' 
   F92C2_8 = 'f92c2_8 sex of the sibling' 
   F92C3_8 = 'f92c3_8 sibling alive' 
   F92C4_8 = 'f92c4_8 sibling''s age at present if alive, or age at death if died' 
   F92C5_8 = 'f92c5_8 residence distance' 
   F92C6_8 = 'f92c6_8 frequent visits' 
   RF92D_8 = 'rf92d_8 proxy or not for f92d1 to f92d6' 
   F92D1_8 = 'f92d1_8 birth order of the sibling' 
   F92D2_8 = 'f92d2_8 sex of the sibling' 
   F92D3_8 = 'f92d3_8 sibling alive' 
   F92D4_8 = 'f92d4_8 sibling''s age at present if alive, or age at death if died' 
   F92D5_8 = 'f92d5_8 residence distance' 
   F92D6_8 = 'f92d6_8 frequent visits' 
   RF92E_8 = 'rf92e_8 proxy or not for f92e1 to f92e6' 
   F92E1_8 = 'f92e1_8 birth order of the sibling' 
   F92E2_8 = 'f92e2_8 sex of the sibling' 
   F92E3_8 = 'f92e3_8 sibling alive' 
   F92E4_8 = 'f92e4_8 sibling''s age at present if alive, or age at death if died' 
   F92E5_8 = 'f92e5_8 residence distance' 
   F92E6_8 = 'f92e6_8 frequent visits' 
   RF92F_8 = 'rf92f_8 proxy or not for f92f1 to f92f6' 
   F92F1_8 = 'f92f1_8 birth order of the sibling' 
   F92F2_8 = 'f92f2_8 sex of the sibling' 
   F92F3_8 = 'f92f3_8 sibling alive' 
   F92F4_8 = 'f92f4_8 sibling''s age at present if alive, or age at death if died' 
   F92F5_8 = 'f92f5_8 residence distance' 
   F92F6_8 = 'f92f6_8 frequent visits' 
   RF92G_8 = 'rf92g_8 proxy or not for f92g1 to f92g6' 
   F92G1_8 = 'f92g1_8 birth order of the sibling' 
   F92G2_8 = 'f92g2_8 sex of the sibling' 
   F92G3_8 = 'f92g3_8 sibling alive' 
   F92G4_8 = 'f92g4_8 sibling''s age at present if alive, or age at death if died' 
   F92G5_8 = 'f92g5_8 residence distance' 
   F92G6_8 = 'f92g6_8 frequent visits' 
   RF92H_8 = 'rf92h_8 proxy or not for f92h1 to f92h6' 
   F92H1_8 = 'f92h1_8 birth order of the sibling' 
   F92H2_8 = 'f92h2_8 sex of the sibling' 
   F92H3_8 = 'f92h3_8 sibling alive' 
   F92H4_8 = 'f92h4_8 sibling''s age at present if alive, or age at death if died' 
   F92H5_8 = 'f92h5_8 residence distance' 
   F92H6_8 = 'f92h6_8 frequent visits' 
   RF92I_8 = 'rf92i_8 proxy or not for f92i1 to f92i6' 
   F92I1_8 = 'f92i1_8 birth order of the sibling' 
   F92I2_8 = 'f92i2_8 sex of the sibling' 
   F92I3_8 = 'f92i3_8 sibling alive' 
   F92I4_8 = 'f92i4_8 sibling''s age at present if alive, or age at death if died' 
   F92I5_8 = 'f92i5_8 residence distance' 
   F92I6_8 = 'f92i6_8 frequent visits' 
   RF92J_8 = 'rf92j_8 proxy or not for f92j1 to f92j6' 
   F92J1_8 = 'f92j1_8 birth order of the sibling' 
   F92J2_8 = 'f92j2_8 sex of the sibling' 
   F92J3_8 = 'f92j3_8 sibling alive' 
   F92J4_8 = 'f92j4_8 sibling''s age at present if alive, or age at death if died' 
   F92J5_8 = 'f92j5_8 residence distance' 
   F92J6_8 = 'f92j6_8 frequent visits' 
   JIGE_8  = 'jige_8 number of siblings alive who are 80+ years old' 
   RF10_8  = 'rf10_8 proxy or not for f10 and f10a' 
   F10_8   = 'f10_8 number of children ever born' 
   F10A_8  = 'f10a_8 number of male children ever born' 
   RF101_8 = 'rf101_8 proxy or not for f101' 
   F101_8  = 'f101_8 age at first birth' 
   RF102_8 = 'rf102_8 proxy or not for f102' 
   F102_8  = 'f102_8 age at last birth' 
   F103_8  = 'f103_8 number of children, including deceased and non-biological children' 
   RF103A_8= 'rf103a_8 proxy or not for f103a1 to f103a8' 
   F103A8_8= 'f103a8_8 1st child is biological or not?' 
   F103A1_8= 'f103a1_8 sex of the 1st child' 
   F103A2_8= 'f103a2_8 the 1st child alive or not' 
   F103A3_8= 'f103a3_8 the 1st child''s age at present if alive, or the age the child would be if s/he w' 
   F103A4_8= 'f103a4_8 frequent visits of the 1st child' 
   F103A7_8= 'f103a7_8 contact with the 1st child' 
   F103A5_8= 'f103a5_8 residence distance of the 1st child' 
   RF103B_8= 'rf103b_8 proxy or not for f103b1 to f103b8' 
   F103B8_8= 'f103b8_8 2nd child is biological or not?' 
   F103B1_8= 'f103b1_8 sex of the 2nd child' 
   F103B2_8= 'f103b2_8 the 2nd child alive or not' 
   F103B3_8= 'f103b3_8 the 2nd child''s age at present if alive, or the age the child would be if s/he w' 
   F103B4_8= 'f103b4_8 frequent visits of the 2nd child' 
   F103B7_8= 'f103b7_8 contact with the 2nd child' 
   F103B5_8= 'f103b5_8 residence distance of the 2nd child' 
   RF103C_8= 'rf103c_8 proxy or not for f103c1 to f103c8' 
   F103C8_8= 'f103c8_8 3rd child is biological or not?' 
   F103C1_8= 'f103c1_8 sex of the 3rd child' 
   F103C2_8= 'f103c2_8 the 3rd child alive or not' 
   F103C3_8= 'f103c3_8 the 3rd child''s age at present if alive, or the age the child would be if s/he w' 
   F103C4_8= 'f103c4_8 frequent visits of the 3rd child' 
   F103C7_8= 'f103c7_8 contact with the 3rd child' 
   F103C5_8= 'f103c5_8 residence distance of the 3rd child' 
   RF103D_8= 'rf103d_8 proxy or not for f103d1 to f103d8' 
   F103D8_8= 'f103d8_8 4th child is biological or not?' 
   F103D1_8= 'f103d1_8 sex of the 4th child' 
   F103D2_8= 'f103d2_8 the 4th child alive or not' 
   F103D3_8= 'f103d3_8 the 4th child''s age at present if alive, or the age the child would be if s/he w' 
   F103D4_8= 'f103d4_8 frequent visits of the 4th child' 
   F103D7_8= 'f103d7_8 contact with the 4th child' 
   F103D5_8= 'f103d5_8 residence distance of the 4th child' 
   RF103E_8= 'rf103e_8 proxy or not for f103e1 to f103e8' 
   F103E8_8= 'f103e8_8 5th child is biological or not?' 
   F103E1_8= 'f103e1_8 sex of the 5th child' 
   F103E2_8= 'f103e2_8 the 5th child alive or not' 
   F103E3_8= 'f103e3_8 the 5th child''s age at present if alive, or the age the child would be if s/he w' 
   F103E4_8= 'f103e4_8 frequent visits of the 5th child' 
   F103E7_8= 'f103e7_8 contact with the 5th child' 
   F103E5_8= 'f103e5_8 residence distance of the 5th child' 
   RF103F_8= 'rf103f_8 proxy or not for f103f1 to f103f8' 
   F103F8_8= 'f103f8_8 6th child is biological or not?' 
   F103F1_8= 'f103f1_8 sex of the 6th child' 
   F103F2_8= 'f103f2_8 the 6th child alive or not' 
   F103F3_8= 'f103f3_8 the 6th child''s age at present if alive, or the age the child would be if s/he w' 
   F103F4_8= 'f103f4_8 frequent visits of the 6th child' 
   F103F7_8= 'f103f7_8 contact with the 6th child' 
   F103F5_8= 'f103f5_8 residence distance of the 6th child' 
   RF103G_8= 'rf103g_8 proxy or not for f103g1 to f103g8' 
   F103G8_8= 'f103g8_8 7th child is biological or not?' 
   F103G1_8= 'f103g1_8 sex of the 7th child' 
   F103G2_8= 'f103g2_8 the 7th child alive or not' 
   F103G3_8= 'f103g3_8 the 7th child''s age at present if alive, or the age the child would be if s/he w' 
   F103G4_8= 'f103g4_8 frequent visits of the 7th child' 
   F103G7_8= 'f103g7_8 contact with the 7th child' 
   F103G5_8= 'f103g5_8 residence distance of the 7th child' 
   RF103H_8= 'rf103h_8 proxy or not for f103h1 to f103h8' 
   F103H8_8= 'f103h8_8 8th child is biological or not?' 
   F103H1_8= 'f103h1_8 sex of the 8th child' 
   F103H2_8= 'f103h2_8 the 8th child alive or not' 
   F103H3_8= 'f103h3_8 the 8th child''s age at present if alive, or the age the child would be if s/he w' 
   F103H4_8= 'f103h4_8 frequent visits of the 8th child' 
   F103H7_8= 'f103h7_8 contact with the 8th child' 
   F103H5_8= 'f103h5_8 residence distance of the 8th child' 
   RF103I_8= 'rf103i_8 proxy or not for f103i1 to f103i8' 
   F103I8_8= 'f103i8_8 9th child is biological or not?' 
   F103I1_8= 'f103i1_8 sex of the 9th child' 
   F103I2_8= 'f103i2_8 the 9th child alive or not' 
   F103I3_8= 'f103i3_8 the 9th child''s age at present if alive, or the age the child would be if s/he w' 
   F103I4_8= 'f103i4_8 frequent visits of the 9th child' 
   F103I7_8= 'f103i7_8 contact with the 9th child' 
   F103I5_8= 'f103i5_8 residence distance of the 9th child' 
   RF103J_8= 'rf103j_8 proxy or not for f103j1 to f103j8' 
   F103J8_8= 'f103j8_8 10th child is biological or not?' 
   F103J1_8= 'f103j1_8 sex of the 10th child' 
   F103J2_8= 'f103j2_8 the 10th child alive or not' 
   F103J3_8= 'f103j3_8 the 10th child''s age at present if alive, or the age the child would be if s/he' 
   F103J4_8= 'f103j4_8 frequent visits of the 10th child' 
   F103J7_8= 'f103j7_8 contact with the 10th child' 
   F103J5_8= 'f103j5_8 residence distance of the 10th child' 
   RF103K_8= 'rf103k_8 proxy or not for f103k1 to f103k8' 
   F103K8_8= 'f103k8_8 11th child is biological or not?' 
   F103K1_8= 'f103k1_8 sex of the 11th child' 
   F103K2_8= 'f103k2_8 the 11th child alive or not' 
   F103K3_8= 'f103k3_8 the 11th child''s age at present if alive, or the age the child would be if s/he' 
   F103K4_8= 'f103k4_8 frequent visits of the 11th child' 
   F103K7_8= 'f103k7_8 contact with the 11th child' 
   F103K5_8= 'f103k5_8 residence distance of the 11th child' 
   RF103L_8= 'rf103l_8 proxy or not for f103l1 to f103l8' 
   F103L8_8= 'f103l8_8 12th child is biological or not?' 
   F103L1_8= 'f103l1_8 sex of the 12th child' 
   F103L2_8= 'f103l2_8 the 12th child alive or not' 
   F103L3_8= 'f103l3_8 the 12th child''s age at present if alive, or the age the child would be if s/he' 
   F103L4_8= 'f103l4_8 frequent visits of the 12th child' 
   F103L7_8= 'f103l7_8 contact with the 12th child' 
   F103L5_8= 'f103l5_8 residence distance of the 12th child' 
   RF103M_8= 'rf103m_8 proxy or not for f103m1 to f103m8' 
   F103M8_8= 'f103m8_8 13th child is biological or not?' 
   F103M1_8= 'f103m1_8 sex of the 13th child' 
   F103M2_8= 'f103m2_8 the 13th child alive or not' 
   F103M3_8= 'f103m3_8 the 13th child''s age at present if alive, or the age the child would be if s/he' 
   F103M4_8= 'f103m4_8 frequent visits of the 13th child' 
   F103M7_8= 'f103m7_8 contact with the 13th child' 
   F103M5_8= 'f103m5_8 residence distance of the 13th child' 
   RF111_8 = 'rf111_8 proxy or not for f111a to f111c' 
   F111A_8 = 'f111a_8 the first person to whom you usually talk frequently in daily life' 
   F111B_8 = 'f111b_8 the second person to whom you usually talk frequently in daily life' 
   F111C_8 = 'f111c_8 the third person to whom you usually talk frequently in daily life' 
   RF112_8 = 'rf112_8 proxy or not for f112a to f112c' 
   F112A_8 = 'f112a_8 1st person to whom you talk first when you need to share some of your thoughts' 
   F112B_8 = 'f112b_8 2nd person to whom you talk first when you need to share some of your thoughts' 
   F112C_8 = 'f112c_8 3rd person to whom you talk first when you need to share some of your thoughts' 
   RF113_8 = 'rf113_8 proxy or not for f113a to f113c' 
   F113A_8 = 'f113a_8 1st person you ask for help when you have problem/difficulties' 
   F113B_8 = 'f113b_8 2nd person you ask for help when you have problem/difficulties' 
   F113C_8 = 'f113c_8 3rd person you ask for help when you have problem/difficulties' 
   RF12_8  = 'rf12_8 proxy or not for f12a to f12c' 
   F12A_8  = 'f12a_8 how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_8  = 'f12b_8 how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C_8  = 'f12c_8 how much did you receive from your grandchild(ren) last year?' 
   RF13_8  = 'rf13_8 proxy or not for f13a to f13c' 
   F13A_8  = 'f13a_8 how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_8  = 'f13b_8 how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C_8  = 'f13c_8 how much did you give to your grandchild(ren)in last year?' 
   RF14_8  = 'rf14_8 proxy or not for f14' 
   F141_8  = 'f141_8 are personal care services available in your community?' 
   F142_8  = 'f142_8 are home visit services available in your community?' 
   F143_8  = 'f143_8 are psychological consulting services available in your community?' 
   F144_8  = 'f144_8 are daily shopping services available in your community?' 
   F145_8  = 'f145_8 are social and recreation services available in your community?' 
   F146_8  = 'f146_8 are legal aid services available in your community?' 
   F147_8  = 'f147_8 are healthcare education services available in your community?' 
   F148_8  = 'f148_8 are neighborhood-relation services available in your community?' 
   F149_8  = 'f149_8 are any other social services available in your community?' 
   RF15_8  = 'rf15_8 proxy or not for f15' 
   F151_8  = 'f151_8 do you expect your community to provide personal care services?' 
   F152_8  = 'f152_8 do you expect your community to provide home visit services?' 
   F153_8  = 'f153_8 do you expect your community to provide psychological consulting services?' 
   F154_8  = 'f154_8 do you expect your community to provide daily shopping services?' 
   F155_8  = 'f155_8 do you expect your community to provide social and recreation activities?' 
   F156_8  = 'f156_8 do you expect your community provide legal aid services?' 
   F157_8  = 'f157_8 do you expect your community to provide healthcare education service?' 
   F158_8  = 'f158_8 do you expect your community to provide neighborhood-relation services?' 
   F159_8  = 'f159_8 do you expect your community to provide other social services?' 
   F16_8   = 'f16_8 what kind of living arrangement do you like best?' 
   G01_8   = 'g01_8 how about the quality of your sleep?' 
   RG02_8  = 'rg02_8 proxy or not for g02' 
   G02_8   = 'g02_8 how long do you sleep normally?' 
   G1_8    = 'g1_8 visual function' 
   RG21_8  = 'rg21_8 proxy or not for g21' 
   G21_8   = 'g21_8 number of natural teeth' 
   RG22_8  = 'rg22_8 proxy or not for g22' 
   G22_8   = 'g22_8 have false teeth?' 
   RG3_8   = 'rg3_8 proxy or not for g3' 
   G3_8    = 'g3_8 able to use chopsticks to eat?' 
   RG4_8   = 'rg4_8 proxy or not for g4' 
   G4_8    = 'g4_8 which hand do you normally use for eating?' 
   RG51_8  = 'rg51_8 proxy or not for g511-g512' 
   G511_8  = 'g511_8 systolic' 
   G512_8  = 'g512_8 systolic' 
   RG52_8  = 'rg52_8 proxy or not for g521-g522' 
   G521_8  = 'g521_8 diastolic' 
   G522_8  = 'g522_8 diastolic' 
   G71_8   = 'g71_8 heart rate' 
   G72_8   = 'g72_8 heart rate' 
   G81_8   = 'g81_8 hand behind neck' 
   G82_8   = 'g82_8 hand behind lower back' 
   G83_8   = 'g83_8 hold-up arms' 
   G9_8    = 'g9_8 able to stand up from sitting in a chair?' 
   RG101_8 = 'rg101_8 proxy or not for g101' 
   G101_8  = 'g101_8 weight' 
   RG102_8 = 'rg102_8 proxy or not for g1021-g123' 
   G1021_8 = 'g1021_8 directly measured height of the interviewee' 
   G122_8  = 'g122_8 height measured from the top of the right arm bone to the top of the right shoul' 
   G123_8  = 'g123_8 height measured from the right knee joint to the ground' 
   G11_8   = 'g11_8 able to pick up a book from the floor?' 
   G12_8   = 'g12_8 steps used to turn around 360 with help?' 
   G130_8  = 'g130_8 feel not-well within the past two weeks?' 
   RG13_8  = 'rg13_8 with proxy or not for g131' 
   G131_8  = 'g131_8 # of times suffering from serious illness within the past two years' 
   G132_8  = 'g132_8 # of times in hospitals' 
   RG14A_8 = 'rg14a_8 with proxy or not for g14a1 and g14a2' 
   G14A1_8 = 'g14a1_8 name of disease suffered at 1st hospital visit' 
   G14A2_8 = 'g14a2_8 1st time, number of days in hospital or bedridden' 
   RG14B_8 = 'rg14b_8 with proxy or not for g14b1 and g14b2' 
   G14B1_8 = 'g14b1_8 name of disease suffered at 2nd hospital visit' 
   G14B2_8 = 'g14b2_8 2nd time, number of days in hospital or bedridden' 
   RG14C_8 = 'rg14c_8 with proxy or not for g14c1 and g14c2' 
   G14C1_8 = 'g14c1_8 name of disease suffered at the last hospital visit' 
   G14C2_8 = 'g14c2_8 last time, days in hospital or bedridden' 
   RG15A_8 = 'rg15a_8 with proxy or not for g15a1-g15a3' 
   G15A1_8 = 'g15a1_8 suffering from hypertension?' 
   G15A2_8 = 'g15a2_8 diagnosed by hospital?' 
   G15A3_8 = 'g15a3_8 disability in daily life' 
   RG15B_8 = 'rg15b_8 with proxy or not for g15b1-g15b3' 
   G15B1_8 = 'g15b1_8 suffering from diabetes?' 
   G15B2_8 = 'g15b2_8 diagnosed by hospital?' 
   G15B3_8 = 'g15b3_8 disability in daily life' 
   RG15C_8 = 'rg15c_8 with proxy or not for g15c1-g15c3' 
   G15C1_8 = 'g15c1_8 suffering from heart disease?' 
   G15C2_8 = 'g15c2_8 diagnosed by hospital?' 
   G15C3_8 = 'g15c3_8 disability in daily life' 
   RG15D_8 = 'rg15d_8 with proxy or not for g15d1-g15d3' 
   G15D1_8 = 'g15d1_8 suffering from stroke or cvd?' 
   G15D2_8 = 'g15d2_8 diagnosed by hospital?' 
   G15D3_8 = 'g15d3_8 disability in daily life' 
   RG15E_8 = 'rg15e_8 with proxy or not for g15e1-g15e3' 
   G15E1_8 = 'g15e1_8 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_8 = 'g15e2_8 diagnosed by hospital?' 
   G15E3_8 = 'g15e3_8 disability in daily life' 
   RG15F_8 = 'rg15f_8 with proxy or not for g15f1-g15f3' 
   G15F1_8 = 'g15f1_8 suffering from tuberculosis?' 
   G15F2_8 = 'g15f2_8 diagnosed by hospital?' 
   G15F3_8 = 'g15f3_8 disability in daily life' 
   RG15G_8 = 'rg15g_8 with proxy or not for g15g1-g15g3' 
   G15G1_8 = 'g15g1_8 suffering from cataract?' 
   G15G2_8 = 'g15g2_8 diagnosed by hospital?' 
   G15G3_8 = 'g15g3_8 disability in daily life' 
   RG15H_8 = 'rg15h_8 with proxy or not for g15h1-g15h3' 
   G15H1_8 = 'g15h1_8 suffering from glaucoma?' 
   G15H2_8 = 'g15h2_8 diagnosed by hospital?' 
   G15H3_8 = 'g15h3_8 disability in daily life' 
   RG15I_8 = 'rg15i_8 with proxy or not for g15i1-g15i3' 
   G15I1_8 = 'g15i1_8 suffering from cancer?' 
   G15I2_8 = 'g15i2_8 diagnosed by hospital?' 
   G15I3_8 = 'g15i3_8 disability in daily life' 
   RG15J_8 = 'rg15j_8 with proxy or not for g15j1-g15j3' 
   G15J1_8 = 'g15j1_8 suffering from prostate tumor?' 
   G15J2_8 = 'g15j2_8 diagnosed by hospital?' 
   G15J3_8 = 'g15j3_8 disability in daily life' 
   RG15K_8 = 'rg15k_8 with proxy or not for g15k1-g15k3' 
   G15K1_8 = 'g15k1_8 suffering from gastric or duodenal ulcer?' 
   G15K2_8 = 'g15k2_8 diagnosed by hospital?' 
   G15K3_8 = 'g15k3_8 disability in daily life' 
   RG15L_8 = 'rg15l_8 with proxy or not for g15l1-g15l3' 
   G15L1_8 = 'g15l1_8 suffering from parkinson''s disease?' 
   G15L2_8 = 'g15l2_8 diagnosed by hospital?' 
   G15L3_8 = 'g15l3_8 disability in daily life' 
   RG15M_8 = 'rg15m_8 with proxy or not for g15m1-g15m3' 
   G15M1_8 = 'g15m1_8 suffering from bedsore?' 
   G15M2_8 = 'g15m2_8 diagnosed by hospital?' 
   G15M3_8 = 'g15m3_8 disability in daily life' 
   RG15N_8 = 'rg15n_8 with proxy or not for g15n1-g15n3' 
   G15N1_8 = 'g15n1_8 suffering from arthritis?' 
   G15N2_8 = 'g15n2_8 diagnosed by hospital?' 
   G15N3_8 = 'g15n3_8 disability in daily life' 
   RG15O_8 = 'rg15o_8 with proxy or not for g15o1-g15o3' 
   G15O1_8 = 'g15o1_8 suffering from dementia?' 
   G15O2_8 = 'g15o2_8 diagnosed by hospital?' 
   G15O3_8 = 'g15o3_8 disability in daily life' 
   RG15P_8 = 'rg15p_8 with proxy or not for g15p1-g15p3' 
   G15P1_8 = 'g15p1_8 suffering from epilepsy?' 
   G15P2_8 = 'g15p2_8 diagnosed by hospital?' 
   G15P3_8 = 'g15p3_8 disability in daily life' 
   RG15Q_8 = 'rg15q_8 with proxy or not for g15q1-g15q3' 
   G15Q1_8 = 'g15q1_8 suffering from cholecystitis, cholelith disease?' 
   G15Q2_8 = 'g15q2_8 diagnosed by hospital?' 
   G15Q3_8 = 'g15q3_8 disability in daily life' 
   RG15R_8 = 'rg15r_8 with proxy or not for g15r1-g15r3' 
   G15R1_8 = 'g15r1_8 suffering from blood disease?' 
   G15R2_8 = 'g15r2_8 diagnosed by hospital?' 
   G15R3_8 = 'g15r3_8 disability in daily life' 
   RG15S_8 = 'rg15s_8 with proxy or not for g15s1-g15s3' 
   G15S1_8 = 'g15s1_8 suffering from chronic nephritis?' 
   G15S2_8 = 'g15s2_8 diagnosed by hospital?' 
   G15S3_8 = 'g15s3_8 disability in daily life' 
   RG15T_8 = 'rg15t_8 with proxy or not for g15t1-g15t3' 
   G15T1_8 = 'g15t1_8 suffering from galactophore disease?' 
   G15T2_8 = 'g15t2_8 diagnosed by hospital?' 
   G15T3_8 = 'g15t3_8 disability in daily life' 
   RG15U_8 = 'rg15u_8 with proxy or not for g15u1-g15u3' 
   G15U1_8 = 'g15u1_8 suffering from uterine tumor?' 
   G15U2_8 = 'g15u2_8 diagnosed by hospital?' 
   G15U3_8 = 'g15u3_8 disability in daily life' 
   RG15V_8 = 'rg15v_8 with proxy or not for g15v1-g15v3' 
   G15V1_8 = 'g15v1_8 suffering from hepatitis?' 
   G15V2_8 = 'g15v2_8 diagnosed by hospital?' 
   G15V3_8 = 'g15v3_8 disability in daily life' 
   H1_8    = 'h1_8 was interviewee able to hear?' 
   H21_8   = 'h21_8 did interviewee able to participate in physical check?' 
   H22_8   = 'h22_8 the reason for inability to participate in physical check' 
   H3_8    = 'h3_8 the health of interviewee rated by interviewer' 
   H6_8    = 'h6_8 has interviewer checked for failure to ask a question?' 
   H7_8    = 'h7_8 did anyone help the interviewee to answer question' 
   H71_8   = 'h71_8 who helped the interviewee to answer questions?' 
   D8VYEAR = 'd8vyear validated year of death of the sampled person' 
   D8VMONTH= 'd8vmonth validated month of death of the sampled person' 
   D8VDAY  = 'd8vday validated day of death of the sampled person' 
   D8RESID = 'd8resid category of residence of the deceased elder at the 2005 survey' 
   D8SEX   = 'd8sex sex of the deceased person' 
   D8MARRY = 'd8marry marital status of the deceased elder at death' 
   D8LIVARR= 'd8livarr primary living arrangement of the deceased elder in the last year of life' 
   D8PERSON= 'd8person number of people who living with the respondent before dying' 
   D8GENER = 'd8gener number of generations living in the household when the elderly died' 
   D8DPLACE= 'd8dplace place of death' 
   D8CARGIV= 'd8cargiv primary caregiver before dying' 
   D8PCGDAY= 'd8pcgday number of days cared for the deceased by primary caregiver in the last month of' 
   D8BEDRID= 'd8bedrid bedridden or not before dying' 
   D8BEDDAY= 'd8bedday days of being bedridden before dying' 
   D8ILL   = 'd8ill number of times suffering from serious illness' 
   D8DISEA1= 'd8disea1 name of disease suffering from at the first time' 
   D8DIDAY1= 'd8diday1 days suffering from such disease at the first time' 
   D8DISEA2= 'd8disea2 name of disease suffering from at the second time' 
   D8DIDAY2= 'd8diday2 days suffering from such disease at the second time' 
   D8DISEA3= 'd8disea3 name of disease suffering from at the last time' 
   D8DIDAY3= 'd8diday3 days suffering from such disease at the last time' 
   D8HYPERT= 'd8hypert suffering from hypertension before dying?' 
   D8DIABET= 'd8diabet suffering from diabetes before dying?' 
   D8HEART = 'd8heart suffering from heart disease before dying' 
   D8CVD   = 'd8cvd suffering from stroke or cvd before dying?' 
   D8PNEUM = 'd8pneum suffering from bronchitis, emphysema, pneumonia before dying?' 
   D8TUBERC= 'd8tuberc suffering from tuberculosis before dying?' 
   D8CANCER= 'd8cancer suffering from cancer before dying?' 
   D8GLAUCO= 'd8glauco suffering from glaucoma or cataract before dying?' 
   D8PROSTA= 'd8prosta suffering from prostate tumor before dying?' 
   D8GYNECO= 'd8gyneco suffering from gynecological disease bedore dying?' 
   D8GASTRI= 'd8gastri suffering from gastric or duodenal ulcer before dying?' 
   D8PARKIN= 'd8parkin suffering from parkinson''s disease before dying?' 
   D8BEDSOR= 'd8bedsor suffering from bedsore before dying?' 
   D8DEMENT= 'd8dement suffering from dementia before dying?' 
   D8PSYCHO= 'd8psycho suffering from psychosis before dying?' 
   D8NEUROS= 'd8neuros suffering from neurosis disease?' 
   D8ARTHRI= 'd8arthri suffering from arthritis before dying?' 
   D8OTHERS= 'd8others suffering from other chronic disease before dying?' 
   D8MEDICA= 'd8medica got timely medication before dying' 
   D8FINANC= 'd8financ main financial source before dying' 
   D8INCOME= 'd8income yearly per capita income of the family of the deceased elder' 
   D8WCFACI= 'd8wcfaci family had toilet facility before the elder died' 
   D8TAPWAT= 'd8tapwat family had tap water facility before the elder died' 
   D8BATHFA= 'd8bathfa family had bath facility before the elder died' 
   D8HEATER= 'd8heater family had heater before the elder died' 
   D8TVSET = 'd8tvset family had tv before the elder died' 
   D8WASHMA= 'd8washma family had washing machine before elder died' 
   D8PHONE = 'd8phone family had telephone before the elder died' 
   D8DOCTOR= 'd8doctor if the deceased elder lived in rural, was there a doctor in the village?' 
   D8LICDOC= 'd8licdoc did the village doctor have a license?' 
   D8WHOPAY= 'd8whopay who mainly paid the medical cost for the deceased elder?' 
   D8MEDCOS= 'd8medcos total medical cost (in yuan, rmb) in the last year of the life' 
   D8POCKET= 'd8pocket total amount of out-of-pocket' 
   D8BATHFU= 'd8bathfu functioning of bathing before dying' 
   D8BATDAY= 'd8batday days lasted if bathing functioning disabled or partially disabled' 
   D8DRESFU= 'd8dresfu functioning of dressing before dying' 
   D8DREDAY= 'd8dreday days lasted if dressing functioning disabled or partially disabled' 
   D8TOILFU= 'd8toilfu functioning of toileting before dying' 
   D8TOIDAY= 'd8toiday days lasted if toileting functioning disabled or partially disabled' 
   D8MOVEFU= 'd8movefu functioning of indoor transferring before dying' 
   D8MOVDAY= 'd8movday days lasted if indoor transferring functioning disabled or partially disabled' 
   D8CONTFU= 'd8contfu functioning of continence before dying' 
   D8CONDAY= 'd8conday days lasted in incontinence' 
   D8FEEDFU= 'd8feedfu functioning of self-feeding before dying' 
   D8FEEDAY= 'd8feeday days lasted if can''t feed self' 
   D8FULLDA= 'd8fullda days the deceased perosn needing full care before dying' 
   D8CARCST= 'd8carcst total cost for full care in daily life' 
   D8DIRCST= 'd8dircst total direct cost for caregiving in the last month of life' 
   D8CARPAY= 'd8carpay who mainly paid the care serivces before dying?' 
   D8OUTDOR= 'd8outdor days the elder could not get outdoor to chat before dying' 
   D8ACTDAY= 'd8actday number of days being bedridden longer than that of activities before dying' 
   D8SMOKE = 'd8smoke smoked or not since the last interview' 
   D8SMKTIM= 'd8smktim number of times smoked a day on average' 
   D8DRINK = 'd8drink did the deceased elder drink since the last interview?' 
   D8KNDDRK= 'd8knddrk what kind of drink if the elder drank?' 
   D8DRKMCH= 'd8drkmch how much (liang) did the elder drink every day since last interview?' 
   D8ADVDIR= 'd8advdir whether did the deceased elderly tell the family about his/her death and related' 
   D8DIRDAY= 'd8dirday if yes, how many days did she/he tell the family before her/his death' 
   D8DREAM = 'd8dream whether did the deceased elderly have some dreams about the death before dying?' 
   D8PAIN  = 'd8pain whether was the deceased elderly painful before dying?' 
   D8UNCONS= 'd8uncons was the deceased elderly unconscious before death?' 
   D8UNCDAY= 'd8uncday if yes, how many days lasted before death' 
   DTH08_11= 'dth08_11 status of survival, death, or lost to follow-up from 2008 to 2011 waves' 
   YEARIN_11= 'yearin_11 year of the 2011/2012 interview' 
   MONTHIN_11= 'monthin_11 month of the 2011/2012 interview' 
   DAYIN_11= 'dayin_11 day of the 2011/2012 interview' 
   RESIC_11= 'resic_11 category of residence of the interviewee in 2011' 
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
         A41_14 a41fffff. A42 a42fffff. A42_14 a42fffff.
         A43 a43fffff. A43_14 a43fffff. A51 a51fffff.
         A51_11 a51_11ff. A51_14 a51fffff. A51_5 a51_5fff.
         A51_8 a51_8fff. A52 a52fffff. A52_11 a52_11ff.
         A52_14 a52fffff. A52_5 a52_5fff. A52_8 a52_8fff.
         A530_11 a530_11f. A530_14 a530_14f. A530_5 a530_5ff.
         A530_8 a530_8ff. A531 a531ffff. A531_11 a531_11f.
         A531_14 a531ffff. A531_5 a531_5ff. A531_8 a531_8ff.
         A532 a532ffff. A532_11 a532_11f. A532_14 a532ffff.
         A532_5 a532_5ff. A532_8 a532_8ff. A533_11 a533_11f.
         A533_14 a533_14f. A534_11 a534_11f. A534_14 a534_14f.
         A535_11 a535_11f. A535_14 a535_14f. A536_11 a535_11f.
         A536_14 a535_14f. A537_11 a537_11f. A537_14 a537_14f.
         A53A1 a53a1fff. A53A1_11 a53a1_1f. A53A1_14 a53a1fff.
         A53A1_5 a53a1_5f. A53A1_8 a53a1_8f. A53A2 a53a2fff.
         A53A2_11 a53a2_1f. A53A2_14 a53a2fff. A53A2_5 a53a2_5f.
         A53A2_8 a53a2_8f. A53A3 a53a3fff. A53A3_11 a53a3_1f.
         A53A3_14 a53a3fff. A53A3_5 a53a3_5f. A53A3_8 a53a3_8f.
         A53A4_11 a53a4_1f. A53A4_14 a53a4_1_1f. A53A4_5 a53a4_5f.
         A53A4_8 a53a4_8f. A53A5_11 a53a5_1f. A53A5_14 a54bffff.
         A53B1 a53a1fff. A53B1_11 a53a1_1f. A53B1_14 a53a1fff.
         A53B1_5 a53a1_5f. A53B1_8 a53a1_8f. A53B2 a53a2fff.
         A53B2_11 a53a2_1f. A53B2_14 a53a2fff. A53B2_5 a53a2_5f.
         A53B2_8 a53a2_8f. A53B3 a53a3fff. A53B3_11 a53b3_1f.
         A53B3_14 a53a3fff. A53B3_5 a53a3_5f. A53B3_8 a53b3_8f.
         A53B4_11 a53a4_1f. A53B4_14 a53a4_1_1f. A53B4_5 a53a4_5f.
         A53B4_8 a53a4_8f. A53B5_11 a53a5_1f. A53B5_14 a54bffff.
         A53C1 a53a1fff. A53C1_11 a53a1_1f. A53C1_14 a53a1fff.
         A53C1_5 a53a1_5f. A53C1_8 a53a1_8f. A53C2 a53a2fff.
         A53C2_11 a53a2_1f. A53C2_14 a53a2fff. A53C2_5 a53a2_5f.
         A53C2_8 a53a2_8f. A53C3 a53a3fff. A53C3_11 a53b3_1f.
         A53C3_14 a53a3fff. A53C3_5 a53a3_5f. A53C3_8 a53b3_8f.
         A53C4_11 a53a4_1f. A53C4_14 a53a4_1_1f. A53C4_5 a53a4_5f.
         A53C4_8 a53a4_8f. A53C5_11 a53a5_1f. A53C5_14 a54bffff.
         A53D1 a53a1fff. A53D1_11 a53a1_1f. A53D1_14 a53a1fff.
         A53D1_5 a53a1_5f. A53D1_8 a53a1_8f. A53D2 a53a2fff.
         A53D2_11 a53a2_1f. A53D2_14 a53a2fff. A53D2_5 a53a2_5f.
         A53D2_8 a53a2_8f. A53D3 a53a3fff. A53D3_11 a53b3_1f.
         A53D3_14 a53a3fff. A53D3_5 a53a3_5f. A53D3_8 a53b3_8f.
         A53D4_11 a53a4_1f. A53D4_14 a53a4_1_1f. A53D4_5 a53a4_5f.
         A53D4_8 a53a4_8f. A53D5_11 a53a5_1f. A53D5_14 a54bffff.
         A53E1 a53a1fff. A53E1_11 a53a1_1f. A53E1_14 a53a1fff.
         A53E1_5 a53a1_5f. A53E1_8 a53a1_8f. A53E2 a53a2fff.
         A53E2_11 a53a2_1f. A53E2_14 a53a2fff. A53E2_5 a53a2_5f.
         A53E2_8 a53a2_8f. A53E3 a53a3fff. A53E3_11 a53b3_1f.
         A53E3_14 a53a3fff. A53E3_5 a53a3_5f. A53E3_8 a53b3_8f.
         A53E4_11 a53a4_1f. A53E4_14 a53a4_1_1f. A53E4_5 a53a4_5f.
         A53E4_8 a53a4_8f. A53E5_11 a53a5_1f. A53E5_14 a54bffff.
         A53F1 a53a1fff. A53F1_11 a53a1_1f. A53F1_14 a53a1fff.
         A53F1_5 a53a1_5f. A53F1_8 a53a1_8f. A53F2 a53a2fff.
         A53F2_11 a53a2_1f. A53F2_14 a53a2fff. A53F2_5 a53a2_5f.
         A53F2_8 a53a2_8f. A53F3 a53a3fff. A53F3_11 a53b3_1f.
         A53F3_14 a53a3fff. A53F3_5 a53a3_5f. A53F3_8 a53b3_8f.
         A53F4_11 a53a4_1f. A53F4_14 a53a4_1_1f. A53F4_5 a53a4_5f.
         A53F4_8 a53a4_8f. A53F5_11 a53a5_1f. A53F5_14 a54bffff.
         A53G1 a53a1fff. A53G1_11 a53a1_1f. A53G1_14 a53a1fff.
         A53G1_5 a53a1_5f. A53G1_8 a53a1_8f. A53G2 a53a2fff.
         A53G2_11 a53a2_1f. A53G2_14 a53a2fff. A53G2_5 a53a2_5f.
         A53G2_8 a53a2_8f. A53G3 a53a3fff. A53G3_11 a53b3_1f.
         A53G3_14 a53a3fff. A53G3_5 a53a3_5f. A53G3_8 a53b3_8f.
         A53G4_11 a53a4_1f. A53G4_14 a53a4_1_1f. A53G4_5 a53a4_5f.
         A53G4_8 a53a4_8f. A53G5_11 a53a5_1f. A53G5_14 a54bffff.
         A53H1 a53a1fff. A53H1_11 a53a1_1f. A53H1_14 a53a1fff.
         A53H1_5 a53a1_5f. A53H1_8 a53a1_8f. A53H2 a53a2fff.
         A53H2_11 a53a2_1f. A53H2_14 a53a2fff. A53H2_5 a53a2_5f.
         A53H2_8 a53a2_8f. A53H3 a53a3fff. A53H3_11 a53b3_1f.
         A53H3_14 a53a3fff. A53H3_5 a53a3_5f. A53H3_8 a53b3_8f.
         A53H4_11 a53a4_1f. A53H4_14 a53a4_1_1f. A53H4_5 a53a4_5f.
         A53H4_8 a53a4_8f. A53H5_11 a53a5_1f. A53H5_14 a54bffff.
         A53I1 a53a1fff. A53I1_11 a53a1_1f. A53I1_14 a53a1fff.
         A53I1_5 a53a1_5f. A53I1_8 a53a1_8f. A53I2 a53a2fff.
         A53I2_11 a53a2_1f. A53I2_14 a53a2fff. A53I2_5 a53a2_5f.
         A53I2_8 a53a2_8f. A53I3 a53a3fff. A53I3_11 a53b3_1f.
         A53I3_14 a53a3fff. A53I3_5 a53a3_5f. A53I3_8 a53b3_8f.
         A53I4_11 a53a4_1f. A53I4_14 a53a4_1_1f. A53I4_5 a53a4_5f.
         A53I4_8 a53a4_8f. A53I5_11 a53a5_1f. A53I5_14 a54bffff.
         A53J1 a53a1fff. A53J1_11 a53a1_1f. A53J1_14 a53a1fff.
         A53J1_5 a53a1_5f. A53J1_8 a53a1_8f. A53J2 a53a2fff.
         A53J2_11 a53a2_1f. A53J2_14 a53a2fff. A53J2_5 a53a2_5f.
         A53J2_8 a53a2_8f. A53J3 a53a3fff. A53J3_11 a53b3_1f.
         A53J3_14 a53a3fff. A53J3_5 a53a3_5f. A53J3_8 a53b3_8f.
         A53J4_11 a53a4_1f. A53J4_14 a53a4_1_1f. A53J4_5 a53a4_5f.
         A53J4_8 a53a4_8f. A53J5_11 a53a5_1f. A53J5_14 a54bffff.
         A53K1 a53a1fff. A53K1_5 a53a1_5f. A53K1_8 a53a1_8f.
         A53K2 a53a2fff. A53K2_5 a53a2_5f. A53K2_8 a53a2_8f.
         A53K3 a53a3fff. A53K3_5 a53a3_5f. A53K3_8 a53b3_8f.
         A53K4_5 a53a4_5f. A53K4_8 a53a4_8f. A53L1 a53a1fff.
         A53L1_5 a53a1_5f. A53L1_8 a53a1_8f. A53L2 a53a2fff.
         A53L2_5 a53a2_5f. A53L2_8 a53a2_8f. A53L3 a53a3fff.
         A53L3_5 a53a3_5f. A53L3_8 a53b3_8f. A53L4_5 a53a4_5f.
         A53L4_8 a53a4_8f. A540_11 a540_11f. A540_14 a540_14f.
         A540_5 a540_5ff. A541_11 a541_11f. A541_14 a541_14f.
         A541_5 a541_5ff. A541_8 a541_8ff. A542_11 a542_11f.
         A542_14 a542_14f. A542_5 a542_5ff. A542_8 a542_8ff.
         A54A a54affff. A54A_11 a54a_11f. A54A_14 a54affff.
         A54A_5 a54a_5ff. A54A_8 a54a_8ff. A54B a54bffff.
         A54B_11 a54b_11f. A54B_14 a54bffff. A54B_5 a54b_5ff.
         A54B_8 a54b_8ff. B11 b11fffff. B11_11 b11_11ff.
         B11_14 b11fffff. B11_5 b11_5fff. B11_8 b11_8fff.
         B12 b11fffff. B121 b121ffff. B121_11 b121_11f.
         B121_14 b121ffff. B121_5 b121_5ff. B121_8 b121_8ff.
         B12_11 b11_11ff. B12_14 b11fffff. B12_5 b11_5fff.
         B12_8 b11_8fff. B21 b21fffff. B210_11 b210_11f.
         B210_14 b210_14f. B21_11 b21_11ff. B21_14 b21fffff.
         B21_5 b21_5fff. B21_8 b21_8fff. B22 b21fffff.
         B22_11 b21_11ff. B22_14 b21fffff. B22_5 b21_5fff.
         B22_8 b21_8fff. B23 b21fffff. B23_11 b21_11ff.
         B23_14 b21fffff. B23_5 b21_5fff. B23_8 b21_8fff.
         B24 b21fffff. B24_11 b21_11ff. B24_14 b21fffff.
         B24_5 b21_5fff. B24_8 b21_8fff. B25 b21fffff.
         B25_11 b21_11ff. B25_14 b21fffff. B25_5 b21_5fff.
         B25_8 b21_8fff. B26 b21fffff. B26_11 b21_11ff.
         B26_14 b21fffff. B26_5 b21_5fff. B26_8 b21_8fff.
         B27 b21fffff. B27_11 b21_11ff. B27_14 b21fffff.
         B27_5 b21_5fff. B27_8 b21_8fff. B28_11 b28_11ff.
         B28_14 b28_14ff. B29_11 b28_11ff. B29_14 b28_14ff.
         C11 c11fffff. C11_11 c11_11ff. C11_14 c11fffff.
         C11_5 c11_5fff. C11_8 c11_8fff. C12 c11fffff.
         C12_11 c11_11ff. C12_14 c11fffff. C12_5 c11_5fff.
         C12_8 c11_8fff. C13 c11fffff. C131 c11fffff.
         C13_11 c11_11ff. C13_14 c11fffff. C13_5 c11_5fff.
         C13_8 c11_8fff. C14 c11fffff. C14_11 c11_11ff.
         C14_14 c11fffff. C14_5 c11_5fff. C14_8 c11_8fff.
         C15 c11fffff. C15_11 c11_11ff. C15_14 c11fffff.
         C15_5 c11_5fff. C15_8 c11_8fff. C16 c16fffff.
         C161 c11fffff. C162 c11fffff. C163 c11fffff.
         C16_11 c16_11ff. C16_14 c16fffff. C16_5 c16_5fff.
         C16_8 c16_8fff. C21A c11fffff. C21A_11 c11_11ff.
         C21A_14 c11fffff. C21A_5 c11_5fff. C21A_8 c11_8fff.
         C21B c11fffff. C21B_11 c11_11ff. C21B_14 c11fffff.
         C21B_5 c11_5fff. C21B_8 c11_8fff. C21C c11fffff.
         C21C_11 c11_11ff. C21C_14 c11fffff. C21C_5 c11_5fff.
         C21C_8 c11_8fff. C22 c22fffff. C22_11 c22_11ff.
         C22_14 c22fffff. C22_5 c22_5fff. C22_8 c22_8fff.
         C31A c11fffff. C31A_11 c11_11ff. C31A_14 c11fffff.
         C31A_5 c11_5fff. C31A_8 c11_8fff. C31B c11fffff.
         C31B_11 c11_11ff. C31B_14 c11fffff. C31B_5 c11_5fff.
         C31B_8 c11_8fff. C31C c11fffff. C31C_11 c11_11ff.
         C31C_14 c11fffff. C31C_5 c11_5fff. C31C_8 c11_8fff.
         C31D c11fffff. C31D_11 c31d_11f. C31D_14 c11fffff.
         C31D_5 c11_5fff. C31D_8 c31d_8ff. C31E c11fffff.
         C31E_11 c11_11ff. C31E_14 c11fffff. C31E_5 c11_5fff.
         C31E_8 c11_8fff. C32 c32fffff. C32_11 c32_11ff.
         C32_14 c32fffff. C32_5 c11_5fff. C32_8 c32_8fff.
         C41A c11fffff. C41A_11 c11_11ff. C41A_14 c11fffff.
         C41A_5 c11_5fff. C41A_8 c11_8fff. C41B c11fffff.
         C41B_11 c11_11ff. C41B_14 c11fffff. C41B_5 c11_5fff.
         C41B_8 c11_8fff. C41C c11fffff. C41C_11 c11_11ff.
         C41C_14 c11fffff. C41C_5 c11_5fff. C41C_8 c11_8fff.
         C51A c11fffff. C51A_11 c11_11ff. C51A_14 c11fffff.
         C51A_5 c11_5fff. C51A_8 c11_8fff. C51B c11fffff.
         C51B_11 c11_11ff. C51B_14 c11fffff. C51B_5 c11_5fff.
         C51B_8 c11_8fff. C52 c52fffff. C521 c521ffff.
         C52X1_11 c11_11ff. C52X1_8 c11_8fff. C52X2_11 c11_11ff.
         C52X2_8 c11_8fff. C52_11 c11_11ff. C52_14 c52fffff.
         C52_5 c11_5fff. C52_8 c11_8fff. C53A c53affff.
         C53A_11 c53a_11f. C53A_14 c53affff. C53A_5 c11_5fff.
         C53A_8 c53a_8ff. C53B c53affff. C53B_11 c53a_11f.
         C53B_14 c53affff. C53B_5 c11_5fff. C53B_8 c53a_8ff.
         C53C c53affff. C53C_11 c53a_11f. C53C_14 c53affff.
         C53C_5 c11_5fff. C53C_8 c53a_8ff. C54 c54fffff.
         C54_11 c54_11ff. C54_14 c54fffff. C54_5 c54_5fff.
         C54_8 c54_8fff. C55 c55fffff. C55_11 c55_11ff.
         C55_14 c55fffff. C55_5 c55_5fff. C55_8 c55_8fff.
         D1 d1ffffff. D101 d71fffff. D101_11 d91_11ff.
         D101_14 d71fffff. D101_5 d71_5fff. D101_8 d91_8fff.
         D102 a53a2fff. D102_11 a53a2_1f. D102_14 a53a2fff.
         D102_5 a53a2_5f. D102_8 a53a2_8f. D103 a53a2fff.
         D103_11 a53a2_1f. D103_14 a53a2fff. D103_5 a53a2_5f.
         D103_8 a53a2_8f. D11A d11affff. D11A533 d11a533f.
         D11A534 d11yr1ff. D11A535 d11a535f. D11A536 d11a535f.
         D11A537 d11a537f. D11A53A1 d11a53af. D11A53A3 d11a53a_1f.
         D11A53A4 d11a53a_2f. D11A53A5 d11a53a_3f. D11A53A6 d11mon1f.
         D11A53B1 d11a53af. D11A53B3 d11a53a_1f. D11A53B4 d11a53a_2f.
         D11A53B5 d11a53a_3f. D11A53B6 d11mon1f. D11A53C1 d11a53af.
         D11A53C3 d11a53a_1f. D11A53C4 d11a53a_2f. D11A53C5 d11a53a_3f.
         D11A53C6 d11mon1f. D11A53D1 d11a53af. D11A53D3 d11a53a_1f.
         D11A53D4 d11a53a_2f. D11A53D5 d11a53a_3f. D11A53D6 d11mon1f.
         D11A53E1 d11a53af. D11A53E3 d11a53a_1f. D11A53E4 d11a53a_2f.
         D11A53E5 d11a53a_3f. D11A53E6 d11mon1f. D11A53F1 d11a53af.
         D11A53F3 d11a53a_1f. D11A53F4 d11a53a_2f. D11A53F5 d11a53a_3f.
         D11A53F6 d11mon1f. D11A53G1 d11a53af. D11A53G3 d11a53a_1f.
         D11A53G4 d11a53a_2f. D11A53G5 d11a53a_3f. D11A53G6 d11mon1f.
         D11A53H1 d11a53af. D11A53H3 d11a53a_1f. D11A53H4 d11a53a_2f.
         D11A53H5 d11a53a_3f. D11A53H6 d11mon1f. D11A53I1 d11a53af.
         D11A53I3 d11a53a_1f. D11A53I4 d11a53a_2f. D11A53I5 d11a53a_3f.
         D11A53I6 d11mon1f. D11A53J1 d11a53af. D11A53J3 d11a53a_1f.
         D11A53J4 d11a53a_2f. D11A53J5 d11a53a_3f. D11A53J6 d11mon1f.
         D11ACTDAY d11beddf. D11ADVDIR d11doctf. D11AGE d11vyeaf.
         D11ARTHRI d11hypef. D11A_11 d11a_11f. D11A_14 d11affff.
         D11A_5 d11a_5ff. D11A_8 d11a_8ff. D11B d11affff.
         D11BATDAY d11beddf. D11BATDAY1 d11beddf. D11BATDAY2 d11batdf.
         D11BATHFA d11wcfaf. D11BATHFU d11bathf. D11BEDDAY d11beddf.
         D11BEDRID d11bedrf. D11BEDSOR d11hypef. D11B_11 d11a_11f.
         D11B_14 d11affff. D11B_5 d11a_5ff. D11B_8 d11a_8ff.
         D11C d11affff. D11CANCER d11hypef. D11CARCST d11medcf.
         D11CARGIV d11cargf. D11CARPAY d11carpf. D11CONDAY d11beddf.
         D11CONDAY1 d11batdf. D11CONDAY2 d11batdf. D11CONTFU d11contf.
         D11CVD d11hypef. D11C_11 d11a_11f. D11C_14 d11affff.
         D11C_5 d11a_5ff. D11C_8 d11a_8ff. D11D d11affff.
         D11D21B d11d21bf. D11DEMENT d11hypef. D11DIABET d11hypef.
         D11DIDAY1 d11didaf. D11DIDAY2 d11didaf. D11DIDAY3 d11didaf.
         D11DIRCST d11medcf. D11DIRDAY d11yr1ff. D11DISEA1 d11disef.
         D11DISEA2 d11disef. D11DISEA3 d11disef. D11DOCTOR d11doctf.
         D11DPLACE d11dplaf. D11DREAM d11dreaf. D11DREDAY d11beddf.
         D11DREDAY1 d11batdf. D11DREDAY2 d11batdf. D11DRESFU d11bathf.
         D11DRINK d11doctf. D11DRKMCH d11mon1f. D11D_11 d11a_11f.
         D11D_14 d11affff. D11D_5 d11a_5ff. D11D_8 d11a_8ff.
         D11E d11affff. D11E_11 d11a_11f. D11E_14 d11affff.
         D11E_5 d11a_5ff. D11E_8 d11a_8ff. D11F d11affff.
         D11FEEDAY d11beddf. D11FEEDAY1 d11batdf. D11FEEDAY2 d11batdf.
         D11FEEDFU d11bathf. D11FINANC d11finaf. D11FULLDA d11beddf.
         D11F_11 d11a_11f. D11F_14 d11affff. D11F_5 d11a_5ff.
         D11F_8 d11a_8ff. D11G d11affff. D11G102 d11g102f.
         D11G106 d11a535f. D11G1061 d11g106f. D11G1062 d11g106_1f.
         D11G1063 d11g106_2f. D11G23 d11g23ff. D11G24 d11a535f.
         D11G24A d11illff. D11G25 d11a535f. D11G25A d11illff.
         D11G4 d11g4fff. D11G4A d11g4aff. D11G4B d11g4bff.
         D11GASTRI d11hypef. D11GENER d11genef. D11GLAUCO d11hypef.
         D11GYNECO d11hypef. D11G_11 d11a_11f. D11G_14 d11affff.
         D11G_5 d11a_5ff. D11G_8 d11a_8ff. D11H d11affff.
         D11HEART d11hypef. D11HEATER d11wcfaf. D11HYPERT d11hypef.
         D11H_11 d11a_11f. D11H_14 d11affff. D11H_5 d11a_5ff.
         D11H_8 d11a_8ff. D11I d11affff. D11ILL d11illff.
         D11INCOME d11incof. D11INSPEN d11inspf. D11INSUR d11insuf.
         D11KNDDRK d11knddf. D11LICDOC d11licdf. D11LIVARR d11livaf.
         D11MARRY d11marrf. D11MARRY1 d11marr_1f. D11MEDCOS d11medcf.
         D11MEDICA d11medif. D11MON1 d11mon1f. D11MOVDAY d11beddf.
         D11MOVDAY1 d11batdf. D11MOVDAY2 d11batdf. D11MOVEFU d11bathf.
         D11NEUROS d11hypef. D11NOINSU d11noinf. D11OTHERS d11hypef.
         D11OUTDOR d11beddf. D11PAIN d11painf. D11PARKIN d11hypef.
         D11PAYGOV d11payif. D11PAYIND d11payif. D11PCGDAY d11vyeaf.
         D11PERSON d11vdayf. D11PHONE d11wcfaf. D11PNEUM d11hypef.
         D11POCKET d11medcf. D11PROSTA d11hypef. D11PSYCHO d11hypef.
         D11RESID d11resif. D11RETIRE d11retif. D11RETPEN d11retpf.
         D11RETYR d11yr1ff. D11SMKTIM d11mon1f. D11SMOKE d11doctf.
         D11TAPWAT d11wcfaf. D11TOIDAY d11beddf. D11TOIDAY1 d11batdf.
         D11TOIDAY2 d11batdf. D11TOILFU d11bathf. D11TUBERC d11hypef.
         D11TVSET d11wcfaf. D11UNCDAY d11yr1ff. D11UNCONS d11doctf.
         D11VDAY d11vdayf. D11VMONTH d11vyeaf. D11VYEAR d11vyeaf.
         D11WASHMA d11wcfaf. D11WCFACI d11wcfaf. D11WHOPAY d11whopf.
         D11YR1 d11yr1ff. D12 v_bthmof. D12_11 a54b_11f.
         D12_14 v_bthmof. D12_5 d12_5fff. D12_8 a54b_8ff.
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
         D1_5 d1_5ffff. D1_8 d1_8ffff. D2 d2ffffff.
         D2_11 a54b_11f. D2_5 a54b_5ff. D2_8 a54b_8ff.
         D31 d31fffff. D31_11 d31_11ff. D31_14 d31fffff.
         D31_5 d31_5fff. D31_8 d31_8fff. D32 d31fffff.
         D32_11 d32_11ff. D32_14 d31fffff. D32_5 d31_5fff.
         D32_8 d32_8fff. D33_11 d33_11ff. D33_14 d33_14ff.
         D33_8 d33_8fff. D34_11 d34_11ff. D34_14 d34_14ff.
         D34_8 d34_8fff. D4ALGA1_11 d4meat2_2f. D4ALGA1_14 d4milk1f.
         D4ALGA1_8 d4meat2_1f. D4ALGA2_11 d4meat2_2f. D4ALGA2_14 d4milk1f.
         D4ALGA2_8 d4meat2_1f. D4A_14 d4a_14ff. D4BEAN1 d4meat1f.
         D4BEAN1_11 d4meat2_2f. D4BEAN1_14 d4meat1f. D4BEAN1_8 d4meat2_1f.
         D4BEAN2 d4meat2f. D4BEAN2_11 d4meat2_2f. D4BEAN2_14 d4meat2f.
         D4BEAN2_8 d4meat2_1f. D4BEN2_5 d4mt2_5f. D4B_14 d4b_14ff.
         D4DRUG1_11 d4drug1_1f. D4DRUG1_14 d4drug1_2f. D4DRUG1_8 d4drug1f.
         D4DRUG2_11 d4drug1_1f. D4DRUG2_14 d4drug1_2f. D4DRUG2_8 d4drug1f.
         D4EGG1 d4meat1f. D4EGG1_11 d4meat2_2f. D4EGG1_14 d4meat1f.
         D4EGG1_8 d4meat2_1f. D4EGG2 d4meat2f. D4EGG2_11 d4meat2_2f.
         D4EGG2_14 d4meat2f. D4EGG2_5 d4mt2_5f. D4EGG2_8 d4meat2_1f.
         D4FISH1 d4meat1f. D4FISH1_11 d4meat2_2f. D4FISH1_14 d4meat1f.
         D4FISH1_8 d4meat2_1f. D4FISH2 d4meat2f. D4FISH2_11 d4meat2_2f.
         D4FISH2_14 d4meat2f. D4FISH2_8 d4meat2_1f. D4FSH2_5 d4mt2_5f.
         D4GAR2_5 d4mt2_5f. D4GARL1 d4meat1f. D4GARL1_11 d4meat2_2f.
         D4GARL1_14 d4meat1f. D4GARL1_8 d4meat2_1f. D4GARL2 d4meat2f.
         D4GARL2_11 d4meat2_2f. D4GARL2_14 d4meat2f. D4GARL2_8 d4meat2_1f.
         D4MEAT1 d4meat1f. D4MEAT1_11 d4meat2_2f. D4MEAT1_14 d4meat1f.
         D4MEAT1_8 d4meat2_1f. D4MEAT2 d4meat2f. D4MEAT2_11 d4meat2_2f.
         D4MEAT2_14 d4meat2f. D4MEAT2_8 d4meat2_1f. D4MILK1_11 d4meat2_2f.
         D4MILK1_14 d4milk1f. D4MILK1_8 d4meat2_1f. D4MILK2_11 d4meat2_2f.
         D4MILK2_14 d4milk1f. D4MILK2_8 d4meat2_1f. D4MT2_5 d4mt2_5f.
         D4NUT1_11 d4meat2_2f. D4NUT1_14 d4milk1f. D4NUT1_8 d4meat2_1f.
         D4NUT2_11 d4meat2_2f. D4NUT2_14 d4milk1f. D4NUT2_8 d4meat2_1f.
         D4SUG2_5 d4mt2_5f. D4SUGA1 d4meat1f. D4SUGA1_11 d4meat2_2f.
         D4SUGA1_14 d4meat1f. D4SUGA1_8 d4meat2_1f. D4SUGA2 d4meat2f.
         D4SUGA2_11 d4meat2_2f. D4SUGA2_14 d4meat2f. D4SUGA2_8 d4meat2_1f.
         D4TEA1 d4meat1f. D4TEA1_11 d4meat2_2f. D4TEA1_14 d4meat1f.
         D4TEA1_8 d4meat2_1f. D4TEA2 d4meat2f. D4TEA2_11 d4meat2_2f.
         D4TEA2_14 d4meat2f. D4TEA2_5 d4mt2_5f. D4TEA2_8 d4meat2_1f.
         D4VEG1 d4meat1f. D4VEG1_11 d4meat2_2f. D4VEG1_14 d4meat1f.
         D4VEG1_8 d4meat2_1f. D4VEG2 d4meat2f. D4VEG2_11 d4meat2_2f.
         D4VEG2_14 d4meat2f. D4VEG2_5 d4mt2_5f. D4VEG2_8 d4meat2_1f.
         D4VIT1_11 d4meat2_2f. D4VIT1_14 d4milk1f. D4VIT1_8 d4meat2_1f.
         D4VIT2_11 d4meat2_2f. D4VIT2_14 d4milk1f. D4VIT2_8 d4meat2_1f.
         D5 d5ffffff. D5ACTDAY d5vyearf. D5ADVDIR d5bedrif.
         D5BATDAY d5batdaf. D5BATHFA d5wcfacf. D5BATHFU d5bathff.
         D5BEDDAY d5beddaf. D5BEDRID d5bedrif. D5CARCST d5medcof.
         D5CARGIV d5cargif. D5CARPAY d5carpaf. D5CAUSE d5causef.
         D5CONDAY d5batdaf. D5CONTFU d5contff. D5DAYIN d5vmontf.
         D5DIDAY1 d5didayf. D5DIDAY2 d5didayf. D5DIDAY3 d5didayf.
         D5DIRCST d5medcof. D5DIRDAY d5dirdaf. D5DISEA1 d5diseaf.
         D5DISEA2 d5diseaf. D5DISEA3 d5diseaf. D5DOCTOR d5doctof.
         D5DPLACE d5dplacf. D5DREAM d5dreamf. D5DREDAY d5batdaf.
         D5DRESFU d5dresff. D5DRINK d5bedrif. D5DRKMCH d5smktif.
         D5FEEDAY d5batdaf. D5FEEDFU d5feedff. D5FINANC d5finanf.
         D5FULLDA d5vyearf. D5GENER d5generf. D5HEATER d5wcfacf.
         D5ILL d5pcgdaf. D5INCOME d5incomf. D5KNDDRK d5knddrf.
         D5LICDOC d5licdof. D5LIVARR d5livarf. D5MARRY d5marryf.
         D5MEDCOS d5medcof. D5MEDICA d5medicf. D5MOVDAY d5batdaf.
         D5MOVEFU d5moveff. D5MTHIN d5vmontf. D5OUTDOR d5vyearf.
         D5PAIN d5painff. D5PCGDAY d5pcgdaf. D5PERSON d5vmontf.
         D5PHONE d5wcfacf. D5POCKET d5medcof. D5RESID d5residf.
         D5RESPON d5respof. D5SEX d5sexfff. D5SMKTIM d5smktif.
         D5SMOKE d5bedrif. D5TAPWAT d5wcfacf. D5TOIDAY d5batdaf.
         D5TOILFU d5toilff. D5TVSET d5wcfacf. D5UNCDAY d5dirdaf.
         D5UNCONS d5bedrif. D5VDAY d5vmontf. D5VMONTH d5vmontf.
         D5VYEAR d5vyearf. D5WASHMA d5wcfacf. D5WCFACI d5wcfacf.
         D5WHOPAY d5whopaf. D5_11 d5_11fff. D5_14 d5ffffff.
         D5_5 d5_5ffff. D5_8 d5_8ffff. D6A d6afffff.
         D6A_11 d6a_11ff. D6A_14 d6afffff. D6A_8 d6a_8fff.
         D6B d6afffff. D6B_11 d6a_11ff. D6B_14 d6afffff.
         D6B_8 d6a_8fff. D6C d6cfffff. D6C_11 d6a_11ff.
         D6C_14 d6cfffff. D6C_5 d6c_5fff. D6C_8 d6a_8fff.
         D71 d71fffff. D710A_11 d78a_11f. D710A_14 d78a_14f.
         D710B_11 d78a_11f. D710B_14 d78a_14f. D710_11 a535_11f.
         D710_14 a535_14f. D71_11 d71_11ff. D71_14 d71fffff.
         D71_5 d71_5fff. D71_8 d71_8fff. D72 d71fffff.
         D72_11 d71_11ff. D72_14 d71fffff. D72_5 d71_5fff.
         D72_8 d71_8fff. D73 a53a2fff. D73_11 a53a2_1f.
         D73_14 a53a2fff. D73_5 a53a2_5f. D73_8 a53a2_8f.
         D74 a53a2fff. D74_11 a53a2_1f. D74_14 a53a2fff.
         D74_5 a53a2_5f. D74_8 a53a2_8f. D75 a54bffff.
         D75_11 a53a5_1f. D75_14 a54bffff. D75_5 d75_5fff.
         D75_8 d75_8fff. D76_11 d76_11ff. D76_14 d76_14ff.
         D77_11 d77_11ff. D77_14 d77_14ff. D78A_11 d78a_11f.
         D78A_14 d78a_14f. D78B_11 d78a_11f. D78B_14 d78a_14f.
         D78_11 a535_11f. D78_14 a535_14f. D79A_11 d78a_11f.
         D79A_14 d78a_14f. D79B_11 d78a_11f. D79B_14 d78a_14f.
         D79_11 a535_11f. D79_14 a535_14f. D81 d71fffff.
         D81_11 d71_11ff. D81_14 d71fffff. D81_5 d71_5fff.
         D81_8 d71_8fff. D82 d71fffff. D82_11 d71_11ff.
         D82_14 d71fffff. D82_5 d71_5fff. D82_8 d71_8fff.
         D83 a53a2fff. D83_11 a53a2_1f. D83_14 a53a2fff.
         D83_5 a53a2_5f. D83_8 a53a2_8f. D84 a53a2fff.
         D84_11 a53a2_1f. D84_14 a53a2fff. D84_5 a53a2_5f.
         D84_8 a53a2_8f. D85 d85fffff. D85_11 d85_11ff.
         D85_14 d85fffff. D85_5 d85_5fff. D85_8 d85_8fff.
         D86 a54bffff. D86_11 a53a5_1f. D86_14 a54bffff.
         D86_5 d75_5fff. D86_8 d75_8fff. D87_11 a535_11f.
         D87_14 a535_14f. D8ACTDAY d8batdaf. D8ADVDIR d8doctof.
         D8ARTHRI d8hyperf. D8BATDAY d8batdaf. D8BATHFA d8wcfacf.
         D8BATHFU d8bathff. D8BEDDAY d8beddaf. D8BEDRID d8bedrif.
         D8BEDSOR d8hyperf. D8CANCER d8hyperf. D8CARCST d8medcof.
         D8CARGIV d8cargif. D8CARPAY d8carpaf. D8CONDAY d8batdaf.
         D8CONTFU d8contff. D8CVD d8hyperf. D8DEMENT d8hyperf.
         D8DIABET d8hyperf. D8DIDAY1 d8didayf. D8DIDAY2 d8didayf.
         D8DIDAY3 d8didayf. D8DIRCST d8medcof. D8DIRDAY d8dirdaf.
         D8DISEA1 d8diseaf. D8DISEA2 d8diseaf. D8DISEA3 d8diseaf.
         D8DOCTOR d8doctof. D8DPLACE d8dplacf. D8DREAM d8dreamf.
         D8DREDAY d8batdaf. D8DRESFU d8bathff. D8DRINK d8doctof.
         D8DRKMCH d8smktif. D8FEEDAY d8batdaf. D8FEEDFU d8bathff.
         D8FINANC d8finanf. D8FULLDA d8batdaf. D8GASTRI d8hyperf.
         D8GENER d8generf. D8GLAUCO d8hyperf. D8GYNECO d8hyperf.
         D8HEART d8hyperf. D8HEATER d8wcfacf. D8HYPERT d8hyperf.
         D8ILL d8illfff. D8INCOME d8incomf. D8KNDDRK d8knddrf.
         D8LICDOC d8licdof. D8LIVARR d8livarf. D8MARRY d8marryf.
         D8MEDCOS d8medcof. D8MEDICA d8medicf. D8MOVDAY d8batdaf.
         D8MOVEFU d8bathff. D8NEUROS d8hyperf. D8OTHERS d8hyperf.
         D8OUTDOR d8batdaf. D8PAIN d8painff. D8PARKIN d8hyperf.
         D8PERSON d8persof. D8PHONE d8wcfacf. D8PNEUM d8hyperf.
         D8POCKET d8medcof. D8PROSTA d8hyperf. D8PSYCHO d8hyperf.
         D8RESID d8residf. D8SEX d8sexfff. D8SMKTIM d8smktif.
         D8SMOKE d8doctof. D8TAPWAT d8wcfacf. D8TOIDAY d8batdaf.
         D8TOILFU d8bathff. D8TUBERC d8hyperf. D8TVSET d8wcfacf.
         D8UNCDAY d8uncdaf. D8UNCONS d8bedrif. D8VDAY d8vdayff.
         D8WASHMA d8wcfacf. D8WCFACI d8wcfacf. D8WHOPAY d8whopaf.
         D91 d71fffff. D91_11 d91_11ff. D91_14 d71fffff.
         D91_5 d71_5fff. D91_8 d91_8fff. D92 d71fffff.
         D92_11 d91_11ff. D92_14 d71fffff. D92_5 d71_5fff.
         D92_8 d91_8fff. D93 a53a2fff. D93_11 a53a2_1f.
         D93_14 a53a2fff. D93_5 a53a2_5f. D93_8 a53a2_8f.
         D94 a53a2fff. D94_11 a53a2_1f. D94_14 a53a2fff.
         D94_5 a53a2_5f. D94_8 a53a2_8f. DAYIN_11 monthinf.
         DAY_5 month_5f. DAY_8 month_8f. DTH02_05 dth02_0f.
         DTH05_08 dth05_0f. DTH08_11 dth08_1f. DTH11_14 dth11_1f.
         E0_11 e0_11fff. E0_14 e0_14fff. E1 e1ffffff.
         E10 e7ffffff. E10_11 e7_11fff. E10_14 e7ffffff.
         E10_5 e7_5ffff. E10_8 e7_8ffff. E11 e7ffffff.
         E11_11 e7_11fff. E11_14 e7ffffff. E11_5 e7_5ffff.
         E11_8 e7_8ffff. E12 e7ffffff. E12_11 e7_11fff.
         E12_14 e7ffffff. E12_5 e7_5ffff. E12_8 e7_8ffff.
         E13 e7ffffff. E13_11 e7_11fff. E13_14 e7ffffff.
         E13_5 e7_5ffff. E13_8 e7_8ffff. E14 e7ffffff.
         E14_11 e7_11fff. E14_14 e7ffffff. E14_5 e7_5ffff.
         E14_8 e7_8ffff. E1A e1afffff. E1B_11 e1b_11ff.
         E1B_14 e1b_14ff. E1B_5 e1b_5fff. E1B_8 e1b_8fff.
         E1_11 e1_11fff. E1_14 e1ffffff. E1_5 e1_5ffff.
         E1_8 e1_8ffff. E2 e2ffffff. E2A e1afffff.
         E2B_11 e1b_11ff. E2B_14 e1b_14ff. E2B_5 e1b_5fff.
         E2B_8 e1b_8fff. E2_11 e2_11fff. E2_14 e2ffffff.
         E2_5 e2_5ffff. E2_8 e2_8ffff. E3 e3ffffff.
         E3A e1afffff. E3B_11 e1b_11ff. E3B_14 e1b_14ff.
         E3B_5 e1b_5fff. E3B_8 e1b_8fff. E3_11 e3_11fff.
         E3_14 e3ffffff. E3_5 e3_5ffff. E3_8 e3_8ffff.
         E4 e4ffffff. E4A e1afffff. E4B_11 e1b_11ff.
         E4B_14 e1b_14ff. E4B_5 e1b_5fff. E4B_8 e1b_8fff.
         E4_11 e4_11fff. E4_14 e4ffffff. E4_5 e4_5ffff.
         E4_8 e4_8ffff. E5 e5ffffff. E5A e1afffff.
         E5B_11 e1b_11ff. E5B_14 e1b_14ff. E5B_5 e1b_5fff.
         E5B_8 e1b_8fff. E5_11 e5_11fff. E5_14 e5ffffff.
         E5_5 e5_5ffff. E5_8 e5_8ffff. E6 e6ffffff.
         E610_11 e610_11f. E610_14 e610_14f. E610_5 e610_5ff.
         E610_8 e610_8ff. E62_11 e62_11ff. E62_14 e62_14ff.
         E62_5 e62_5fff. E62_8 e62_8fff. E63_11 e63_11ff.
         E63_14 e63_14ff. E63_5 e63_5fff. E63_8 e63_8fff.
         E64_11 e64_11ff. E64_14 e64_14ff. E64_5 e64_5fff.
         E64_8 e64_8fff. E65_11 e65_11ff. E65_14 e65_14ff.
         E65_5 e65_5fff. E65_8 e65_8fff. E66_5 e66_5fff.
         E67_11 e67_11ff. E67_14 e67_14ff. E67_5 e67_5fff.
         E67_8 e67_8fff. E6A e1afffff. E6B_11 e6b_11ff.
         E6B_14 e6b_14ff. E6B_5 e1b_5fff. E6B_8 e6b_8fff.
         E6_11 e6_11fff. E6_14 e6ffffff. E6_5 e6_5ffff.
         E6_8 e6_8ffff. E7 e7ffffff. E7_11 e7_11fff.
         E7_14 e7ffffff. E7_5 e7_5ffff. E7_8 e7_8ffff.
         E8 e7ffffff. E8_11 e7_11fff. E8_14 e7ffffff.
         E8_5 e7_5ffff. E8_8 e7_8ffff. E9 e7ffffff.
         E9_11 e7_11fff. E9_14 e7ffffff. E9_5 e7_5ffff.
         E9_8 e7_8ffff. F1 d2ffffff. F10 d2ffffff.
         F101 a54bffff. F101_11 a53a5_1f. F101_14 a54bffff.
         F101_8 d75_8fff. F102 a54bffff. F102_11 a53a5_1f.
         F102_14 a54bffff. F102_8 d75_8fff. F1030A_11 a535_11f.
         F1030B1_11 f901b1_f. F1030B2_11 f901b1_f. F1030B3_11 f901b1_f.
         F1030_11 f41a12_f. F1031A_11 a535_11f. F1031B1_11 f901b1_f.
         F1031B2_11 f901b1_f. F1031B3_11 f1031b3f. F1031_11 f41a12_f.
         F1032_11 f1032_1f. F1033_11 f1033_1f. F103A1 f92a2fff.
         F103A1_11 a53a3_1f. F103A1_14 f92a2fff. F103A1_5 f92a2_5f.
         F103A1_8 a53a3_8f. F103A2 f92a3fff. F103A2_11 f103a2__1f.
         F103A2_14 f92a3fff. F103A2_5 f103a8_f. F103A2_8 f103a2_f.
         F103A3 a53a2fff. F103A3_11 a53a5_1f. F103A3_14 a53a2fff.
         F103A3_5 a53a2_5f. F103A3_8 d75_8fff. F103A4 a532ffff.
         F103A4_11 f92a3_1f. F103A4_14 a532ffff. F103A4_5 a532_5ff.
         F103A4_8 f92a3_8f. F103A5 f103a5ff. F103A5_11 f103a5__2f.
         F103A5_14 f103a5ff. F103A5_5 f103a5_f. F103A5_8 f103a5__1f.
         F103A6 f103a6ff. F103A6_5 d75_5fff. F103A7 f103a7ff.
         F103A7_11 f92a3_1f. F103A7_14 f103a7ff. F103A7_5 a532_5ff.
         F103A7_8 f92a3_8f. F103A8_11 f92a3_1f. F103A8_14 f92a3fff.
         F103A8_5 f103a8_f. F103A8_8 f92a3_8f. F103B1 f92a2fff.
         F103B1_11 a53a3_1f. F103B1_14 f92a2fff. F103B1_5 f92a2_5f.
         F103B1_8 a53a3_8f. F103B2 f92a3fff. F103B2_11 f103a2__1f.
         F103B2_14 f92a3fff. F103B2_5 f103a8_f. F103B2_8 f103a2_f.
         F103B3 a53a2fff. F103B3_11 a53a5_1f. F103B3_14 a53a2fff.
         F103B3_5 a53a2_5f. F103B3_8 d75_8fff. F103B4 a532ffff.
         F103B4_11 f92a3_1f. F103B4_14 a532ffff. F103B4_5 a532_5ff.
         F103B4_8 f92a3_8f. F103B5 f103a5ff. F103B5_11 f103a5__2f.
         F103B5_14 f103a5ff. F103B5_5 f103a5_f. F103B5_8 f103a5__1f.
         F103B6 f103a6ff. F103B6_5 d75_5fff. F103B7 f103a7ff.
         F103B7_11 f92a3_1f. F103B7_14 f103a7ff. F103B7_5 a532_5ff.
         F103B7_8 f92a3_8f. F103B8_11 f92a3_1f. F103B8_14 f92a3fff.
         F103B8_5 f103a8_f. F103B8_8 f92a3_8f. F103C1 f92a2fff.
         F103C1_11 a53a3_1f. F103C1_14 f92a2fff. F103C1_5 f92a2_5f.
         F103C1_8 a53a3_8f. F103C2 f92a3fff. F103C2_11 f103a2__1f.
         F103C2_14 f92a3fff. F103C2_5 f103a8_f. F103C2_8 f103a2_f.
         F103C3 a53a2fff. F103C3_11 a53a5_1f. F103C3_14 a53a2fff.
         F103C3_5 a53a2_5f. F103C3_8 d75_8fff. F103C4 a532ffff.
         F103C4_11 f92a3_1f. F103C4_14 a532ffff. F103C4_5 a532_5ff.
         F103C4_8 f92a3_8f. F103C5 f103a5ff. F103C5_11 f103a5__2f.
         F103C5_14 f103a5ff. F103C5_5 f103a5_f. F103C5_8 f103a5__1f.
         F103C6 f103a6ff. F103C6_5 f103c6_f. F103C7 f103a7ff.
         F103C7_11 f92a3_1f. F103C7_14 f103a7ff. F103C7_5 a532_5ff.
         F103C7_8 f92a3_8f. F103C8_11 f92a3_1f. F103C8_14 f92a3fff.
         F103C8_5 f103a8_f. F103C8_8 f92a3_8f. F103D1 f92a2fff.
         F103D1_11 a53a3_1f. F103D1_14 f92a2fff. F103D1_5 f92a2_5f.
         F103D1_8 a53a3_8f. F103D2 f92a3fff. F103D2_11 f103a2__1f.
         F103D2_14 f92a3fff. F103D2_5 f103a8_f. F103D2_8 f103a2_f.
         F103D3 a53a2fff. F103D3_11 a53a5_1f. F103D3_14 a53a2fff.
         F103D3_5 a53a2_5f. F103D3_8 d75_8fff. F103D4 a532ffff.
         F103D4_11 f92a3_1f. F103D4_14 a532ffff. F103D4_5 a532_5ff.
         F103D4_8 f92a3_8f. F103D5 f103a5ff. F103D5_11 f103a5__2f.
         F103D5_14 f103a5ff. F103D5_5 f103a5_f. F103D5_8 f103a5__1f.
         F103D6 f103a6ff. F103D6_5 d75_5fff. F103D7 f103a7ff.
         F103D7_11 f92a3_1f. F103D7_14 f103a7ff. F103D7_5 a532_5ff.
         F103D7_8 f92a3_8f. F103D8_11 f92a3_1f. F103D8_14 f92a3fff.
         F103D8_5 f103a8_f. F103D8_8 f92a3_8f. F103E1 f92a2fff.
         F103E1_11 a53a3_1f. F103E1_14 f92a2fff. F103E1_5 f92a2_5f.
         F103E1_8 a53a3_8f. F103E2 f92a3fff. F103E2_11 f103a2__1f.
         F103E2_14 f92a3fff. F103E2_5 f103a8_f. F103E2_8 f103a2_f.
         F103E3 a53a2fff. F103E3_11 a53a5_1f. F103E3_14 a53a2fff.
         F103E3_5 a53a2_5f. F103E3_8 d75_8fff. F103E4 a532ffff.
         F103E4_11 f92a3_1f. F103E4_14 a532ffff. F103E4_5 a532_5ff.
         F103E4_8 f92a3_8f. F103E5 f103a5ff. F103E5_11 f103a5__2f.
         F103E5_14 f103a5ff. F103E5_5 f103a5_f. F103E5_8 f103a5__1f.
         F103E6 f103a6ff. F103E6_5 d75_5fff. F103E7 f103a7ff.
         F103E7_11 f92a3_1f. F103E7_14 f103a7ff. F103E7_5 a532_5ff.
         F103E7_8 f92a3_8f. F103E8_11 f92a3_1f. F103E8_14 f92a3fff.
         F103E8_5 f103a8_f. F103E8_8 f92a3_8f. F103F1 f92a2fff.
         F103F1_11 a53a3_1f. F103F1_14 f92a2fff. F103F1_5 f92a2_5f.
         F103F1_8 a53a3_8f. F103F2 f92a3fff. F103F2_11 f103a2__1f.
         F103F2_14 f92a3fff. F103F2_5 f103a8_f. F103F2_8 f103a2_f.
         F103F3 a53a2fff. F103F3_11 a53a5_1f. F103F3_14 a53a2fff.
         F103F3_5 a53a2_5f. F103F3_8 d75_8fff. F103F4 a532ffff.
         F103F4_11 f92a3_1f. F103F4_14 a532ffff. F103F4_5 a532_5ff.
         F103F4_8 f92a3_8f. F103F5 f103a5ff. F103F5_11 f103a5__2f.
         F103F5_14 f103a5ff. F103F5_5 f103a5_f. F103F5_8 f103a5__1f.
         F103F6 f103a6ff. F103F6_5 d75_5fff. F103F7 f103a7ff.
         F103F7_11 f92a3_1f. F103F7_14 f103a7ff. F103F7_5 a532_5ff.
         F103F7_8 f92a3_8f. F103F8_11 f92a3_1f. F103F8_14 f92a3fff.
         F103F8_5 f103a8_f. F103F8_8 f92a3_8f. F103G1 f92a2fff.
         F103G1_11 a53a3_1f. F103G1_14 f92a2fff. F103G1_5 f92a2_5f.
         F103G1_8 a53a3_8f. F103G2 f92a3fff. F103G2_11 f103a2__1f.
         F103G2_14 f92a3fff. F103G2_5 f103a8_f. F103G2_8 f103a2_f.
         F103G3 a53a2fff. F103G3_11 a53a5_1f. F103G3_14 a53a2fff.
         F103G3_5 a53a2_5f. F103G3_8 d75_8fff. F103G4 a532ffff.
         F103G4_11 f92a3_1f. F103G4_14 a532ffff. F103G4_5 a532_5ff.
         F103G4_8 f92a3_8f. F103G5 f103a5ff. F103G5_11 f103a5__2f.
         F103G5_14 f103a5ff. F103G5_5 f103a5_f. F103G5_8 f103a5__1f.
         F103G6 f103a6ff. F103G6_5 f103c6_f. F103G7 f103a7ff.
         F103G7_11 f92a3_1f. F103G7_14 f103a7ff. F103G7_5 a532_5ff.
         F103G7_8 f92a3_8f. F103G8_11 f92a3_1f. F103G8_14 f92a3fff.
         F103G8_5 f103a8_f. F103G8_8 f92a3_8f. F103H1 f92a2fff.
         F103H1_11 a53a3_1f. F103H1_14 f92a2fff. F103H1_5 f92a2_5f.
         F103H1_8 a53a3_8f. F103H2 f92a3fff. F103H2_11 f103a2__1f.
         F103H2_14 f92a3fff. F103H2_5 f103a8_f. F103H2_8 f103a2_f.
         F103H3 a53a2fff. F103H3_11 a53a5_1f. F103H3_14 a53a2fff.
         F103H3_5 a53a2_5f. F103H3_8 d75_8fff. F103H4 a532ffff.
         F103H4_11 f92a3_1f. F103H4_14 a532ffff. F103H4_5 a532_5ff.
         F103H4_8 f92a3_8f. F103H5 f103a5ff. F103H5_11 f103a5__2f.
         F103H5_14 f103a5ff. F103H5_5 f103a5_f. F103H5_8 f103a5__1f.
         F103H6 f103a6ff. F103H6_5 f103c6_f. F103H7 f103a7ff.
         F103H7_11 f92a3_1f. F103H7_14 f103a7ff. F103H7_5 a532_5ff.
         F103H7_8 f92a3_8f. F103H8_11 f92a3_1f. F103H8_14 f92a3fff.
         F103H8_5 f103a8_f. F103H8_8 f92a3_8f. F103I1 f92a2fff.
         F103I1_11 a53a3_1f. F103I1_14 f92a2fff. F103I1_5 f92a2_5f.
         F103I1_8 a53a3_8f. F103I2 f92a3fff. F103I2_11 f103a2__1f.
         F103I2_14 f92a3fff. F103I2_5 f103a8_f. F103I2_8 f103a2_f.
         F103I3 a53a2fff. F103I3_11 a53a5_1f. F103I3_14 a53a2fff.
         F103I3_5 a53a2_5f. F103I3_8 d75_8fff. F103I4 a532ffff.
         F103I4_11 f92a3_1f. F103I4_14 a532ffff. F103I4_5 a532_5ff.
         F103I4_8 f92a3_8f. F103I5 f103a5ff. F103I5_11 f103a5__2f.
         F103I5_14 f103a5ff. F103I5_5 f103a5_f. F103I5_8 f103a5__1f.
         F103I6 f103a6ff. F103I6_5 f103c6_f. F103I7 f103a7ff.
         F103I7_11 f92a3_1f. F103I7_14 f103a7ff. F103I7_5 a532_5ff.
         F103I7_8 f92a3_8f. F103I8_11 f92a3_1f. F103I8_14 f92a3fff.
         F103I8_5 f103a8_f. F103I8_8 f92a3_8f. F103J1 f92a2fff.
         F103J1_11 a53a3_1f. F103J1_14 f92a2fff. F103J1_5 f92a2_5f.
         F103J1_8 a53a3_8f. F103J2 f92a3fff. F103J2_11 f103a2__1f.
         F103J2_14 f92a3fff. F103J2_5 f103a8_f. F103J2_8 f103a2_f.
         F103J3 a53a2fff. F103J3_11 a53a5_1f. F103J3_14 a53a2fff.
         F103J3_5 a53a2_5f. F103J3_8 d75_8fff. F103J4 a532ffff.
         F103J4_11 f92a3_1f. F103J4_14 a532ffff. F103J4_5 a532_5ff.
         F103J4_8 f92a3_8f. F103J5 f103a5ff. F103J5_11 f103a5__2f.
         F103J5_14 f103a5ff. F103J5_5 f103a5_f. F103J5_8 f103a5__1f.
         F103J6 f103a6ff. F103J6_5 f103c6_f. F103J7 f103a7ff.
         F103J7_11 f92a3_1f. F103J7_14 f103a7ff. F103J7_5 a532_5ff.
         F103J7_8 f92a3_8f. F103J8_11 f92a3_1f. F103J8_14 f92a3fff.
         F103J8_5 f103a8_f. F103J8_8 f92a3_8f. F103K1 f92a2fff.
         F103K1_11 a53a3_1f. F103K1_14 f92a2fff. F103K1_5 f92a2_5f.
         F103K1_8 a53a3_8f. F103K2 f92a3fff. F103K2_11 f103a2__1f.
         F103K2_14 f92a3fff. F103K2_5 f103a8_f. F103K2_8 f103a2_f.
         F103K3 a53a2fff. F103K3_11 a53a5_1f. F103K3_14 a53a2fff.
         F103K3_5 a53a2_5f. F103K3_8 d75_8fff. F103K4 a532ffff.
         F103K4_11 f92a3_1f. F103K4_14 a532ffff. F103K4_5 a532_5ff.
         F103K4_8 f92a3_8f. F103K5 f103a5ff. F103K5_11 f103a5__2f.
         F103K5_14 f103a5ff. F103K5_5 f103a5_f. F103K5_8 f103a5__1f.
         F103K6 f103a6ff. F103K6_5 f103c6_f. F103K7 f103a7ff.
         F103K7_11 f92a3_1f. F103K7_14 f103a7ff. F103K7_5 a532_5ff.
         F103K7_8 f92a3_8f. F103K8_11 f92a3_1f. F103K8_14 f92a3fff.
         F103K8_5 f103a8_f. F103K8_8 f92a3_8f. F103L1_11 a53a3_1f.
         F103L1_14 f92a2fff. F103L1_5 f92a2_5f. F103L1_8 a53a3_8f.
         F103L2_11 f103a2__1f. F103L2_14 f103l2_f. F103L2_5 f103a8_f.
         F103L2_8 f103a2_f. F103L3_11 a53a5_1f. F103L3_14 a53a2fff.
         F103L3_5 a53a2_5f. F103L3_8 d75_8fff. F103L4_11 f92a3_1f.
         F103L4_14 f92a3fff. F103L4_5 a532_5ff. F103L4_8 f92a3_8f.
         F103L5_11 f103a5__2f. F103L5_14 f103l5_f. F103L5_5 f103a5_f.
         F103L5_8 f103a5__1f. F103L6_5 f103c6_f. F103L7_11 f92a3_1f.
         F103L7_14 f92a3fff. F103L7_5 a532_5ff. F103L7_8 f92a3_8f.
         F103L8_11 f92a3_1f. F103L8_14 f92a3fff. F103L8_5 f103a8_f.
         F103L8_8 f92a3_8f. F103M1_11 a53a3_1f. F103M1_14 f92a2fff.
         F103M1_5 f92a2_5f. F103M1_8 a53a3_8f. F103M2_11 f103a2__1f.
         F103M2_14 f103l2_f. F103M2_5 f103a8_f. F103M2_8 f103a2_f.
         F103M3_11 a53a5_1f. F103M3_14 a53a2fff. F103M3_5 a53a2_5f.
         F103M3_8 d75_8fff. F103M4_11 f92a3_1f. F103M4_14 f92a3fff.
         F103M4_5 a532_5ff. F103M4_8 f92a3_8f. F103M5_11 f103a5__2f.
         F103M5_14 f103l5_f. F103M5_5 f103a5_f. F103M5_8 f103a5__1f.
         F103M6_5 f103c6_f. F103M7_11 f92a3_1f. F103M7_14 f92a3fff.
         F103M7_5 a532_5ff. F103M7_8 f92a3_8f. F103M8_11 f92a3_1f.
         F103M8_14 f92a3fff. F103M8_5 f103a8_f. F103M8_8 f92a3_8f.
         F103_11 a54b_11f. F103_8 a54b_8ff. F104 a53a2fff.
         F104_14 a53a2fff. F105 a53a2fff. F105_14 a53a2fff.
         F10A_11 a54b_11f. F10A_14 a54bffff. F10A_8 a54b_8ff.
         F10_11 a54b_11f. F10_14 d2ffffff. F10_8 a54b_8ff.
         F111 f111ffff. F111A_11 f111a_1f. F111A_14 f111a_1_1f.
         F111A_5 f111a_5f. F111A_8 f111a_8f. F111B_11 f111a_1f.
         F111B_14 f111a_1_1f. F111B_5 f111a_5f. F111B_8 f111a_8f.
         F111C_11 f111a_1f. F111C_14 f111a_1_1f. F111C_5 f111a_5f.
         F111C_8 f111a_8f. F112 f111ffff. F112A_11 f111a_1f.
         F112A_14 f111a_1_1f. F112A_5 f111a_5f. F112A_8 f111a_8f.
         F112B_11 f111a_1f. F112B_14 f111a_1_1f. F112B_5 f111a_5f.
         F112B_8 f111a_8f. F112C_11 f111a_1f. F112C_14 f111a_1_1f.
         F112C_5 f111a_5f. F112C_8 f111a_8f. F113 f111ffff.
         F113A_11 f111a_1f. F113A_14 f111a_1_1f. F113A_5 f111a_5f.
         F113A_8 f111a_8f. F113B_11 f111a_1f. F113B_14 f111a_1_1f.
         F113B_5 f111a_5f. F113B_8 f111a_8f. F113C_11 f111a_1f.
         F113C_14 f111a_1_1f. F113C_5 f111a_5f. F113C_8 f111a_8f.
         F12A f12affff. F12A_11 f12a_11f. F12A_14 f12affff.
         F12A_5 f12a_5ff. F12A_8 f12a_8ff. F12B f12affff.
         F12B_11 f12a_11f. F12B_14 f12affff. F12B_5 f12a_5ff.
         F12B_8 f12a_8ff. F12C_11 f12a_11f. F12C_14 f12c_14f.
         F12C_5 f12a_5ff. F12C_8 f12a_8ff. F13A f12affff.
         F13A_11 f12a_11f. F13A_14 f12affff. F13A_5 f12a_5ff.
         F13A_8 f12a_8ff. F13B f12affff. F13B_11 f12a_11f.
         F13B_14 f12affff. F13B_5 f12a_5ff. F13B_8 f12a_8ff.
         F13C_11 f12a_11f. F13C_14 f12c_14f. F13C_5 f12a_5ff.
         F13C_8 f12a_8ff. F141_11 f141_11f. F141_14 f141_14f.
         F141_5 f141_5ff. F141_8 f141_8ff. F142_11 f141_11f.
         F142_14 f141_14f. F142_5 f141_5ff. F142_8 f141_8ff.
         F143_11 f141_11f. F143_14 f141_14f. F143_5 f141_5ff.
         F143_8 f141_8ff. F144_11 f141_11f. F144_14 f141_14f.
         F144_5 f141_5ff. F144_8 f141_8ff. F145_11 f141_11f.
         F145_14 f141_14f. F145_5 f141_5ff. F145_8 f141_8ff.
         F146_11 f141_11f. F146_14 f141_14f. F146_5 f141_5ff.
         F146_8 f141_8ff. F147_11 f141_11f. F147_14 f141_14f.
         F147_5 f141_5ff. F147_8 f141_8ff. F148_11 f141_11f.
         F148_14 f141_14f. F148_5 f141_5ff. F148_8 f141_8ff.
         F149_11 f141_11f. F149_14 f141_14f. F149_5 f141_5ff.
         F149_8 f141_8ff. F151_11 b28_11ff. F151_14 b28_14ff.
         F151_5 f141_5ff. F151_8 f151_8ff. F152_11 b28_11ff.
         F152_14 b28_14ff. F152_5 f141_5ff. F152_8 f151_8ff.
         F153_11 b28_11ff. F153_14 b28_14ff. F153_5 f141_5ff.
         F153_8 f151_8ff. F154_11 b28_11ff. F154_14 b28_14ff.
         F154_5 f141_5ff. F154_8 f151_8ff. F155_11 b28_11ff.
         F155_14 b28_14ff. F155_5 f141_5ff. F155_8 f151_8ff.
         F156_11 b28_11ff. F156_14 b28_14ff. F156_5 f141_5ff.
         F156_8 f151_8ff. F157_11 b28_11ff. F157_14 b28_14ff.
         F157_5 f141_5ff. F157_8 f151_8ff. F158_11 b28_11ff.
         F158_14 b28_14ff. F158_5 f141_5ff. F158_8 f151_8ff.
         F159_11 b28_11ff. F159_14 b28_14ff. F159_5 f141_5ff.
         F159_8 f151_8ff. F16_11 f16_11ff. F16_14 f16_14ff.
         F16_5 f16_5fff. F16_8 f16_8fff. F1_14 d2ffffff.
         F1_8 a54b_8ff. F2 f2ffffff. F21 d71fffff.
         F211 a532ffff. F211_11 f21_11ff. F211_14 a532ffff.
         F211_5 f211_5ff. F211_8 f21_8fff. F21_11 f21_11ff.
         F21_14 d71fffff. F21_8 f21_8fff. F22 f22fffff.
         F221_11 f221_11f. F221_14 f221_14f. F22_11 a541_11f.
         F22_14 f22fffff. F22_5 e1b_5fff. F22_8 a541_8ff.
         F23 a532ffff. F23_11 f23_11ff. F23_14 a532ffff.
         F23_5 a532_5ff. F23_8 f23_8fff. F24_11 a535_11f.
         F24_14 a535_14f. F251_11 f251_11f. F252_11 f251_11f.
         F25A1_14 f25a1_1f. F25A2_14 f25a1_1f. F25B1_11 f25b1_1f.
         F25B1_14 f25b1_1_1f. F25B2_11 d78a_11f. F25B2_14 d78a_14f.
         F26_11 f25b1_1f. F26_14 f26_14ff. F27_11 f27_11ff.
         F27_14 f27_14ff. F2_14 f2ffffff. F2_8 f2_8ffff.
         F31 f31fffff. F31_11 f31_11ff. F31_14 f31fffff.
         F31_5 f31_5fff. F31_8 f31_8fff. F32A_11 f31_11ff.
         F32A_14 f32a_14f. F32A_5 f31_5fff. F32A_8 f31_8fff.
         F32B_11 f31_11ff. F32B_14 f32a_14f. F32B_5 f31_5fff.
         F32B_8 f31_8fff. F32C_11 f31_11ff. F32C_14 f32a_14f.
         F32C_5 f31_5fff. F32C_8 f31_8fff. F32D_11 f31_11ff.
         F32D_14 f32a_14f. F32D_5 f31_5fff. F32D_8 f31_8fff.
         F32E_11 f31_11ff. F32E_14 f32a_14f. F32E_5 f31_5fff.
         F32E_8 f31_8fff. F33 d71fffff. F33_11 f23_11ff.
         F33_14 d71fffff. F33_5 d71_5fff. F33_8 f23_8fff.
         F34 f34fffff. F340_11 f340_11f. F340_14 f340_14f.
         F340_5 f340_5ff. F340_8 f340_8ff. F34_11 f34_11ff.
         F34_14 f34fffff. F34_5 f34_5fff. F34_8 f34_8fff.
         F35 f35fffff. F35_11 f35_11ff. F35_14 f35fffff.
         F35_5 f35_5fff. F35_8 f35_8fff. F41 f41fffff.
         F41A11_11 a534_11f. F41A11_14 a534_14f. F41A12_11 f41a12_f.
         F41A12_14 f41a12__1f. F41A1_11 a535_11f. F41A1_14 a535_14f.
         F41A21_11 a534_11f. F41A21_14 a534_14f. F41A22_11 f41a12_f.
         F41A22_14 f41a12__1f. F41A2_11 a535_11f. F41A2_14 a535_14f.
         F41A31_11 a534_11f. F41A31_14 a534_14f. F41A32_11 f41a12_f.
         F41A32_14 f41a12__1f. F41A3_11 a535_11f. F41A3_14 a535_14f.
         F41B1_11 a534_11f. F41B1_14 a534_14f. F41B2_11 f41a12_f.
         F41B2_14 f41a12__1f. F41B_11 a535_11f. F41B_14 a535_14f.
         F41_11 f41_11ff. F41_14 f41fffff. F41_5 f41_5fff.
         F41_8 f41_8fff. F42 a54bffff. F42_11 a53a5_1f.
         F42_14 a54bffff. F42_5 d75_5fff. F42_8 d75_8fff.
         F43A1 a53a2fff. F43A1_11 a53a2_1f. F43A1_14 a53a2fff.
         F43A1_5 a53a2_5f. F43A1_8 a53a2_8f. F43A2 f43a2fff.
         F43A2_11 f43a2_1f. F43A2_14 f43a2fff. F43A2_5 f43a2_5f.
         F43A2_8 f43a2_8f. F43A3 a53a2fff. F43A3_11 a53a2_1f.
         F43A3_14 a53a2fff. F43A3_5 a53a2_5f. F43A3_8 a53a2_8f.
         F43A4 f43a4fff. F43A4_11 f43a4_1f. F43A4_14 f43a4fff.
         F43A4_5 f43a4_5f. F43A4_8 f43a4_8f. F43B1 a53a2fff.
         F43B1_11 a53a2_1f. F43B1_14 a53a2fff. F43B1_5 a53a2_5f.
         F43B1_8 a53a2_8f. F43B2 f43a2fff. F43B2_11 f43a2_1f.
         F43B2_14 f43a2fff. F43B2_5 f43a2_5f. F43B2_8 f43a2_8f.
         F43B3 a53a2fff. F43B3_11 a53a2_1f. F43B3_14 a53a2fff.
         F43B3_5 a53a2_5f. F43B3_8 a53a2_8f. F43B4 f43a4fff.
         F43B4_11 f43a4_1f. F43B4_14 f43a4fff. F43B4_5 f43a4_5f.
         F43B4_8 f43a4_8f. F43C1 a53a2fff. F43C1_11 a53a2_1f.
         F43C1_14 a53a2fff. F43C1_5 a53a2_5f. F43C1_8 a53a2_8f.
         F43C2 f43a2fff. F43C2_11 f43a2_1f. F43C2_14 f43a2fff.
         F43C2_5 f43a2_5f. F43C2_8 f43a2_8f. F43C3 a53a2fff.
         F43C3_11 a53a2_1f. F43C3_14 a53a2fff. F43C3_5 a53a2_5f.
         F43C3_8 a53a2_8f. F43C4 f43a4fff. F43C4_11 f43a4_1f.
         F43C4_14 f43a4fff. F43C4_5 f43a4_5f. F43C4_8 f43a4_8f.
         F43D1 a53a2fff. F43D1_11 a53a2_1f. F43D1_14 a53a2fff.
         F43D1_5 a53a2_5f. F43D1_8 a53a2_8f. F43D2 f43a2fff.
         F43D2_11 f43a2_1f. F43D2_14 f43a2fff. F43D2_5 f43a2_5f.
         F43D2_8 f43a2_8f. F43D3 a53a2fff. F43D3_11 a53a2_1f.
         F43D3_14 a53a2fff. F43D3_5 a53a2_5f. F43D3_8 a53a2_8f.
         F43D4 f43a4fff. F43D4_11 f43a4_1f. F43D4_14 f43a4fff.
         F43D4_5 f43a4_5f. F43D4_8 f43a4_8f. F44 a54bffff.
         F44_11 a53a5_1f. F44_14 a54bffff. F44_5 d75_5fff.
         F44_8 d75_8fff. F45 f45fffff. F45_11 f45_11ff.
         F45_14 f45fffff. F45_5 f45_5fff. F45_8 f45_8fff.
         F46_11 f46_11ff. F46_14 f46_14ff. F46_5 f46_5fff.
         F46_8 f46_8fff. F47_11 f47_11ff. F47_14 f47_14ff.
         F47_8 f47_8fff. F5 f5ffffff. F5_11 f5_11fff.
         F5_11_14 f5ffffff. F5_5 f5_5ffff. F5_8 f5_8ffff.
         F61 f61fffff. F610_11 f610_11f. F610_14 f610_14f.
         F610_5 f610_5ff. F610_8 f610_8ff. F61_11 d71_11ff.
         F61_14 f61fffff. F61_5 d71_5fff. F61_8 d71_8fff.
         F62 f62fffff. F62_11 f62_11ff. F62_14 f62fffff.
         F62_8 f62_8fff. F63 f62fffff. F63_11 f62_11ff.
         F63_14 f62fffff. F63_8 f62_8fff. F64 f64fffff.
         F64A_11 f64a_11f. F64A_14 f64a_14f. F64A_5 f64a_5ff.
         F64A_8 f64a_8ff. F64B_11 f64a_11f. F64B_14 f64a_14f.
         F64B_5 f64a_5ff. F64B_8 f64a_8ff. F64C_11 f64a_11f.
         F64C_14 f64a_14f. F64C_5 f64a_5ff. F64C_8 f64a_8ff.
         F64D_11 f64a_11f. F64D_14 f64a_14f. F64D_5 f64a_5ff.
         F64D_8 f64a_8ff. F64E1_11 f64e1_1f. F64E_14 f64a_14f.
         F64E_5 f64a_5ff. F64E_8 f64a_8ff. F64F1_11 f64e1_1f.
         F64F_14 f64a_14f. F64F_5 f64a_5ff. F64F_8 f64a_8ff.
         F64G1_11 f64e1_1f. F64G_14 f64a_14f. F64G_5 f64a_5ff.
         F64G_8 f64a_8ff. F64H1_11 f64e1_1f. F64H_14 f64a_14f.
         F64H_5 f64a_5ff. F64H_8 f64a_8ff. F64I_11 f64i_11f.
         F64I_14 f64a_14f. F64I_5 f64a_5ff. F64I_8 f64i_8ff.
         F65 f65fffff. F651A1_11 f651a1_f. F651A1_14 f651a1__1f.
         F651A2_11 f651a1_f. F651A2_14 f651a1__1f. F651A_5 f651a_5f.
         F651A_8 f651a_8f. F651B1_11 f651a1_f. F651B1_14 f651a1__1f.
         F651B2_11 f651a1_f. F651B2_14 f651a1__1f. F651B_5 f651a_5f.
         F651B_8 f651a_8f. F6521_11 f6521_1f. F6521_14 f6521_1_1f.
         F652A_11 yearin_f. F652B_11 a535_11f. F652B_14 a535_14f.
         F652_5 f652_5ff. F652_8 f652_8ff. F66 f66fffff.
         F66_11 d91_11ff. F66_14 f66fffff. F66_8 d91_8fff.
         F71 f71fffff. F71_11 d91_11ff. F71_14 f71fffff.
         F71_5 f71_5fff. F71_8 d91_8fff. F721 a53a2fff.
         F721_11 a53a2_1f. F721_14 a53a2fff. F721_5 a53a2_5f.
         F721_8 a53a2_8f. F722 a53a2fff. F722A_11 d91_11ff.
         F722_11 a53a2_1f. F722_14 a53a2fff. F722_5 a53a2_5f.
         F722_8 a53a2_8f. F73 a53a2fff. F73_11 a53a2_1f.
         F73_14 a53a2fff. F73_5 a53a2_5f. F73_8 a53a2_8f.
         F74_11 a54b_11f. F74_14 d2ffffff. F74_5 a54b_5ff.
         F74_8 a54b_8ff. F81 f71fffff. F81_11 d91_11ff.
         F81_14 f71fffff. F81_5 f71_5fff. F81_8 d91_8fff.
         F821 a53a2fff. F821_11 a53a2_1f. F821_14 a53a2fff.
         F821_5 a53a2_5f. F821_8 a53a2_8f. F822 a53a2fff.
         F822A_11 d91_11ff. F822_11 a53a2_1f. F822_14 a53a2fff.
         F822_5 a53a2_5f. F822_8 a53a2_8f. F83 a53a2fff.
         F83_11 a53a2_1f. F83_14 a53a2fff. F83_5 a53a2_5f.
         F83_8 a53a2_8f. F84 f2ffffff. F84_11 f84_11ff.
         F84_14 f2ffffff. F84_8 f84_8fff. F85_11 f84_11ff.
         F85_14 f85_14ff. F85_5 f85_5fff. F85_8 f84_8fff.
         F86_11 a54b_11f. F86_14 d2ffffff. F86_5 a54b_5ff.
         F86_8 a54b_8ff. F9 d2ffffff. F901A_11 a535_11f.
         F901B1_11 f901b1_f. F901B2_11 f901b1_f. F901B3_11 f901b1_f.
         F901_11 f41a12_f. F902A_11 a535_11f. F902B1_11 f901b1_f.
         F902B2_11 f901b1_f. F902B3_11 f901b1_f. F902_11 f41a12_f.
         F91 d2ffffff. F91_11 a54b_11f. F91_14 d2ffffff.
         F91_8 a54b_8ff. F92A1 a54bffff. F92A1_11 a53a5_1f.
         F92A1_14 a54bffff. F92A1_5 d75_5fff. F92A1_8 d75_8fff.
         F92A2 f92a2fff. F92A2_11 a53a3_1f. F92A2_14 f92a2fff.
         F92A2_5 f92a2_5f. F92A2_8 a53a3_8f. F92A3 f92a3fff.
         F92A3_11 f92a3_1f. F92A3_14 f92a3fff. F92A3_5 f92a3_5f.
         F92A3_8 f92a3_8f. F92A4 a53a2fff. F92A4_11 a53a2_1f.
         F92A4_14 a53a2fff. F92A4_5 a53a2_5f. F92A4_8 a53a2_8f.
         F92A5 f92a5fff. F92A5_11 f92a5_1f. F92A5_14 f92a5fff.
         F92A5_5 f92a5_5f. F92A5_8 f92a5_8f. F92A6 a532ffff.
         F92A6_11 f92a3_1f. F92A6_14 a532ffff. F92A6_5 a532_5ff.
         F92A6_8 f92a3_8f. F92A7_11 f92a3_1f. F92A7_14 f92a3fff.
         F92B1 a54bffff. F92B1_11 a53a5_1f. F92B1_14 a54bffff.
         F92B1_5 d75_5fff. F92B1_8 d75_8fff. F92B2 f92a2fff.
         F92B2_11 a53a3_1f. F92B2_14 f92a2fff. F92B2_5 f92a2_5f.
         F92B2_8 a53a3_8f. F92B3 f92a3fff. F92B3_11 f92a3_1f.
         F92B3_14 f92a3fff. F92B3_5 f92a3_5f. F92B3_8 f92a3_8f.
         F92B4 a53a2fff. F92B4_11 a53a2_1f. F92B4_14 a53a2fff.
         F92B4_5 a53a2_5f. F92B4_8 a53a2_8f. F92B5 f92a5fff.
         F92B5_11 f92a5_1f. F92B5_14 f92a5fff. F92B5_5 f92a5_5f.
         F92B5_8 f92a5_8f. F92B6 a532ffff. F92B6_11 f92a3_1f.
         F92B6_14 a532ffff. F92B6_5 a532_5ff. F92B6_8 f92a3_8f.
         F92B7_11 f92a3_1f. F92B7_14 f92a3fff. F92C1 a54bffff.
         F92C1_11 a53a5_1f. F92C1_14 a54bffff. F92C1_5 d75_5fff.
         F92C1_8 d75_8fff. F92C2 f92a2fff. F92C2_11 a53a3_1f.
         F92C2_14 f92a2fff. F92C2_5 f92a2_5f. F92C2_8 a53a3_8f.
         F92C3 f92a3fff. F92C3_11 f92a3_1f. F92C3_14 f92a3fff.
         F92C3_5 f92a3_5f. F92C3_8 f92a3_8f. F92C4 a53a2fff.
         F92C4_11 a53a2_1f. F92C4_14 a53a2fff. F92C4_5 a53a2_5f.
         F92C4_8 a53a2_8f. F92C5 f92a5fff. F92C5_11 f92a5_1f.
         F92C5_14 f92a5fff. F92C5_5 f92a5_5f. F92C5_8 f92a5_8f.
         F92C6 a532ffff. F92C6_11 f92a3_1f. F92C6_14 a532ffff.
         F92C6_5 a532_5ff. F92C6_8 f92a3_8f. F92C7_11 f92a3_1f.
         F92C7_14 f92a3fff. F92D1 a54bffff. F92D1_11 a53a5_1f.
         F92D1_14 a54bffff. F92D1_5 d75_5fff. F92D1_8 d75_8fff.
         F92D2 f92a2fff. F92D2_11 a53a3_1f. F92D2_14 f92a2fff.
         F92D2_5 f92a2_5f. F92D2_8 a53a3_8f. F92D3 f92a3fff.
         F92D3_11 f92a3_1f. F92D3_14 f92a3fff. F92D3_5 f92a3_5f.
         F92D3_8 f92a3_8f. F92D4 a53a2fff. F92D4_11 a53a2_1f.
         F92D4_14 a53a2fff. F92D4_5 a53a2_5f. F92D4_8 a53a2_8f.
         F92D5 f92a5fff. F92D5_11 f92a5_1f. F92D5_14 f92a5fff.
         F92D5_5 f92a5_5f. F92D5_8 f92a5_8f. F92D6 a532ffff.
         F92D6_11 f92a3_1f. F92D6_14 a532ffff. F92D6_5 a532_5ff.
         F92D6_8 f92a3_8f. F92D7_11 f92a3_1f. F92D7_14 f92a3fff.
         F92E1 a54bffff. F92E1_11 a53a5_1f. F92E1_14 a54bffff.
         F92E1_5 d75_5fff. F92E1_8 d75_8fff. F92E2 f92a2fff.
         F92E2_11 a53a3_1f. F92E2_14 f92a2fff. F92E2_5 f92a2_5f.
         F92E2_8 a53a3_8f. F92E3 f92a3fff. F92E3_11 f92a3_1f.
         F92E3_14 f92a3fff. F92E3_5 f92a3_5f. F92E3_8 f92a3_8f.
         F92E4 a53a2fff. F92E4_11 a53a2_1f. F92E4_14 a53a2fff.
         F92E4_5 a53a2_5f. F92E4_8 a53a2_8f. F92E5 f92a5fff.
         F92E5_11 f92a5_1f. F92E5_14 f92a5fff. F92E5_5 f92a5_5f.
         F92E5_8 f92a5_8f. F92E6 a532ffff. F92E6_11 f92a3_1f.
         F92E6_14 a532ffff. F92E6_5 a532_5ff. F92E6_8 f92a3_8f.
         F92E7_11 f92a3_1f. F92E7_14 f92a3fff. F92F1 a54bffff.
         F92F1_11 a53a5_1f. F92F1_14 a54bffff. F92F1_5 d75_5fff.
         F92F1_8 d75_8fff. F92F2 f92a2fff. F92F2_11 a53a3_1f.
         F92F2_14 f92a2fff. F92F2_5 f92a2_5f. F92F2_8 a53a3_8f.
         F92F3 f92a3fff. F92F3_11 f92a3_1f. F92F3_14 f92a3fff.
         F92F3_5 f92a3_5f. F92F3_8 f92a3_8f. F92F4 a53a2fff.
         F92F4_11 a53a2_1f. F92F4_14 a53a2fff. F92F4_5 a53a2_5f.
         F92F4_8 a53a2_8f. F92F5 f92a5fff. F92F5_11 f92a5_1f.
         F92F5_14 f92a5fff. F92F5_5 f92a5_5f. F92F5_8 f92a5_8f.
         F92F6 a532ffff. F92F6_11 f92a3_1f. F92F6_14 a532ffff.
         F92F6_5 a532_5ff. F92F6_8 f92a3_8f. F92F7_11 f92a3_1f.
         F92F7_14 f92a3fff. F92G1 a54bffff. F92G1_11 a53a5_1f.
         F92G1_14 a54bffff. F92G1_5 d75_5fff. F92G1_8 d75_8fff.
         F92G2 f92a2fff. F92G2_11 a53a3_1f. F92G2_14 f92a2fff.
         F92G2_5 f92a2_5f. F92G2_8 a53a3_8f. F92G3 f92a3fff.
         F92G3_11 f92a3_1f. F92G3_14 f92a3fff. F92G3_5 f92a3_5f.
         F92G3_8 f92a3_8f. F92G4 a53a2fff. F92G4_11 a53a2_1f.
         F92G4_14 a53a2fff. F92G4_5 a53a2_5f. F92G4_8 a53a2_8f.
         F92G5 f92a5fff. F92G5_11 f92a5_1f. F92G5_14 f92a5fff.
         F92G5_5 f92a5_5f. F92G5_8 f92a5_8f. F92G6 a532ffff.
         F92G6_11 f92a3_1f. F92G6_14 a532ffff. F92G6_5 a532_5ff.
         F92G6_8 f92a3_8f. F92G7_11 f92a3_1f. F92G7_14 f92a3fff.
         F92H1 a54bffff. F92H1_11 a53a5_1f. F92H1_14 a54bffff.
         F92H1_5 d75_5fff. F92H1_8 d75_8fff. F92H2 f92a2fff.
         F92H2_11 a53a3_1f. F92H2_14 f92a2fff. F92H2_5 f92a2_5f.
         F92H2_8 a53a3_8f. F92H3 f92a3fff. F92H3_11 f92a3_1f.
         F92H3_14 f92a3fff. F92H3_5 f92a3_5f. F92H3_8 f92a3_8f.
         F92H4 a53a2fff. F92H4_11 a53a2_1f. F92H4_14 a53a2fff.
         F92H4_5 a53a2_5f. F92H4_8 a53a2_8f. F92H5 f92a5fff.
         F92H5_11 f92a5_1f. F92H5_14 f92a5fff. F92H5_5 f92a5_5f.
         F92H5_8 f92a5_8f. F92H6 a532ffff. F92H6_11 f92a3_1f.
         F92H6_14 a532ffff. F92H6_5 a532_5ff. F92H6_8 f92a3_8f.
         F92H7_11 f92a3_1f. F92H7_14 f92a3fff. F92I1 a54bffff.
         F92I1_11 a53a5_1f. F92I1_14 a54bffff. F92I1_5 d75_5fff.
         F92I1_8 d75_8fff. F92I2 f92a2fff. F92I2_11 a53a3_1f.
         F92I2_14 f92a2fff. F92I2_5 f92a2_5f. F92I2_8 a53a3_8f.
         F92I3 f92a3fff. F92I3_11 f92a3_1f. F92I3_14 f92a3fff.
         F92I3_5 f92a3_5f. F92I3_8 f92a3_8f. F92I4 a53a2fff.
         F92I4_11 a53a2_1f. F92I4_14 a53a2fff. F92I4_5 a53a2_5f.
         F92I4_8 a53a2_8f. F92I5 f92a5fff. F92I5_11 f92a5_1f.
         F92I5_14 f92a5fff. F92I5_5 f92a5_5f. F92I5_8 f92a5_8f.
         F92I6 a532ffff. F92I6_11 f92a3_1f. F92I6_14 a532ffff.
         F92I6_5 a532_5ff. F92I6_8 f92a3_8f. F92I7_11 f92a3_1f.
         F92I7_14 f92a3fff. F92J1 a54bffff. F92J1_11 a53a5_1f.
         F92J1_14 a54bffff. F92J1_5 d75_5fff. F92J1_8 d75_8fff.
         F92J2 f92a2fff. F92J2_11 a53a3_1f. F92J2_14 f92a2fff.
         F92J2_5 f92a2_5f. F92J2_8 a53a3_8f. F92J3 f92a3fff.
         F92J3_11 f92a3_1f. F92J3_14 f92a3fff. F92J3_5 f92a3_5f.
         F92J3_8 f92a3_8f. F92J4 a53a2fff. F92J4_11 a53a2_1f.
         F92J4_14 a53a2fff. F92J4_5 a53a2_5f. F92J4_8 a53a2_8f.
         F92J5 f92a5fff. F92J5_11 f92a5_1f. F92J5_14 f92a5fff.
         F92J5_5 f92a5_5f. F92J5_8 f92a5_8f. F92J6 a532ffff.
         F92J6_11 f92a3_1f. F92J6_14 a532ffff. F92J6_5 a532_5ff.
         F92J6_8 f92a3_8f. F92J7_11 f92a3_1f. F92J7_14 f92a3fff.
         F92K1 a54bffff. F92K1_5 d75_5fff. F92K2 f92a2fff.
         F92K2_5 f92a2_5f. F92K3 f92a3fff. F92K3_5 f92a3_5f.
         F92K4 a53a2fff. F92K4_5 a53a2_5f. F92K5 f92a5fff.
         F92K5_5 f92a5_5f. F92K6 a532ffff. F92K6_5 a532_5ff.
         F9A_11 a54b_11f. F9A_5 d75_5fff. F9A_8 a54b_8ff.
         F9_11 a54b_11f. F9_8 a54b_8ff. G01_11 g01_11ff.
         G01_14 g01_14ff. G01_5 g01_5fff. G01_8 g01_8fff.
         G02_11 a54b_11f. G02_14 d2ffffff. G02_5 a54b_5ff.
         G02_8 a54b_8ff. G1 g1ffffff. G101 g51fffff.
         G1011_11 a54b_11f. G1011_14 d2ffffff. G101_11 g511_11f.
         G101_14 g51fffff. G101_5 g51_5fff. G101_8 g511_8ff.
         G1021_11 g511_11f. G1021_14 g1021_1f. G1021_8 g511_8ff.
         G102A g51fffff. G102B g51fffff. G102B_11 g7_11fff.
         G102C_11 g102c_1f. G102C_14 g102c_1_1f. G102_11 d91_11ff.
         G102_14 f71fffff. G102_5 g51_5fff. G1061_11 g1061_1f.
         G1061_14 g1061_1_1f. G1062_11 g1062_1f. G1062_14 g1062_1_1f.
         G1063_11 g1063_1f. G1063_14 g1063_1_1f. G106_11 d91_11ff.
         G106_14 f71fffff. G11 g11fffff. G11_11 g11_11ff.
         G11_14 g11fffff. G11_5 g11_5fff. G11_8 g11_8fff.
         G12 g12fffff. G122_11 g511_11f. G122_14 d2ffffff.
         G122_8 g511_8ff. G123_11 g511_11f. G123_14 d2ffffff.
         G123_8 g511_8ff. G12_11 g12_11ff. G12_14 g12fffff.
         G12_5 g12_5fff. G12_8 g12_8fff. G13 g13fffff.
         G130_11 d91_11ff. G130_14 f71fffff. G130_5 d71_5fff.
         G130_8 d91_8fff. G131_11 g131_11f. G131_14 g13fffff.
         G131_8 g131_8ff. G132_11 g132_11f. G132_14 g132_14f.
         G132_8 g132_8ff. G13_5 g13_5fff. G14A1 g14a1fff.
         G14A1_11 g14a1_1f. G14A1_14 g14a1fff. G14A1_5 g14a1_5f.
         G14A1_8 g14a1_8f. G14A2 g14a2fff. G14A2_11 g14a2_1f.
         G14A2_14 g14a2fff. G14A2_5 g14a2_5f. G14A2_8 g14a2_8f.
         G14B1 g14a1fff. G14B1_11 g14a1_1f. G14B1_14 g14a1fff.
         G14B1_5 g14a1_5f. G14B1_8 g14b1_8f. G14B2 g14a2fff.
         G14B2_11 g14a2_1f. G14B2_14 g14a2fff. G14B2_5 g14a2_5f.
         G14B2_8 g14a2_8f. G14C1 g14a1fff. G14C1_11 g14a1_1f.
         G14C1_14 g14a1fff. G14C1_5 g14a1_5f. G14C1_8 g14b1_8f.
         G14C2 g14a2fff. G14C2_11 g14a2_1f. G14C2_14 g14a2fff.
         G14C2_5 g14a2_5f. G14C2_8 g14a2_8f. G15A1 g15a1fff.
         G15A1_11 g15a1_1f. G15A1_14 g15a1fff. G15A1_5 g15a1_5f.
         G15A1_8 g15a1_8f. G15A2 f71fffff. G15A2_11 d71_11ff.
         G15A2_14 f71fffff. G15A2_5 d71_5fff. G15A2_8 d71_8fff.
         G15A3 g15a3fff. G15A3_11 g15a3_1f. G15A3_14 g15a3fff.
         G15A3_5 g15a3_5f. G15A3_8 g15a3_8f. G15B1 g15a1fff.
         G15B1_11 g15a1_1f. G15B1_14 g15a1fff. G15B1_5 g15a1_5f.
         G15B1_8 g15a1_8f. G15B2 f71fffff. G15B2_11 d71_11ff.
         G15B2_14 f71fffff. G15B2_5 d71_5fff. G15B2_8 d71_8fff.
         G15B3 g15a3fff. G15B3_11 g15a3_1f. G15B3_14 g15a3fff.
         G15B3_5 g15a3_5f. G15B3_8 g15a3_8f. G15C1 g15a1fff.
         G15C1_11 g15a1_1f. G15C1_14 g15a1fff. G15C1_5 g15c1_5f.
         G15C1_8 g15a1_8f. G15C2 f71fffff. G15C2_11 d71_11ff.
         G15C2_14 f71fffff. G15C2_5 g15c2_5f. G15C2_8 d71_8fff.
         G15C3 g15a3fff. G15C3_11 g15a3_1f. G15C3_14 g15a3fff.
         G15C3_5 g15c3_5f. G15C3_8 g15a3_8f. G15D1 g15a1fff.
         G15D1_11 g15a1_1f. G15D1_14 g15a1fff. G15D1_5 g15c1_5f.
         G15D1_8 g15a1_8f. G15D2 f71fffff. G15D2_11 d71_11ff.
         G15D2_14 f71fffff. G15D2_5 g15c2_5f. G15D2_8 d71_8fff.
         G15D3 g15a3fff. G15D3_11 g15a3_1f. G15D3_14 g15a3fff.
         G15D3_5 g15c3_5f. G15D3_8 g15a3_8f. G15E1 g15a1fff.
         G15E1_11 g15a1_1f. G15E1_14 g15a1fff. G15E1_5 g15c1_5f.
         G15E1_8 g15a1_8f. G15E2 f71fffff. G15E2_11 d71_11ff.
         G15E2_14 f71fffff. G15E2_5 g15c2_5f. G15E2_8 d71_8fff.
         G15E3 g15a3fff. G15E3_11 g15a3_1f. G15E3_14 g15a3fff.
         G15E3_5 g15c3_5f. G15E3_8 g15a3_8f. G15F1 g15a1fff.
         G15F1_11 g15a1_1f. G15F1_14 g15a1fff. G15F1_5 g15c1_5f.
         G15F1_8 g15a1_8f. G15F2 f71fffff. G15F2_11 d91_11ff.
         G15F2_14 f71fffff. G15F2_5 g15c2_5f. G15F2_8 d91_8fff.
         G15F3 g15a3fff. G15F3_11 g15f3_1f. G15F3_14 g15a3fff.
         G15F3_5 g15c3_5f. G15F3_8 g15f3_8f. G15G1 g15a1fff.
         G15G1_11 g15a1_1f. G15G1_14 g15a1fff. G15G1_5 g15c1_5f.
         G15G1_8 g15a1_8f. G15G2 f71fffff. G15G2_11 d71_11ff.
         G15G2_14 f71fffff. G15G2_5 g15c2_5f. G15G2_8 d71_8fff.
         G15G3 g15a3fff. G15G3_11 g15a3_1f. G15G3_14 g15a3fff.
         G15G3_5 g15c3_5f. G15G3_8 g15a3_8f. G15H1 g15a1fff.
         G15H1_11 g15a1_1f. G15H1_14 g15a1fff. G15H1_5 g15c1_5f.
         G15H1_8 g15a1_8f. G15H2 f71fffff. G15H2_11 d71_11ff.
         G15H2_14 f71fffff. G15H2_5 g15c2_5f. G15H2_8 d71_8fff.
         G15H3 g15a3fff. G15H3_11 g15a3_1f. G15H3_14 g15a3fff.
         G15H3_5 g15c3_5f. G15H3_8 g15a3_8f. G15I1 g15a1fff.
         G15I1_11 g15a1_1f. G15I1_14 g15a1fff. G15I1_5 g15c1_5f.
         G15I1_8 g15a1_8f. G15I2 f71fffff. G15I2_11 d71_11ff.
         G15I2_14 f71fffff. G15I2_5 g15c2_5f. G15I2_8 d71_8fff.
         G15I3 g15a3fff. G15I3_11 g15a3_1f. G15I3_14 g15a3fff.
         G15I3_5 g15c3_5f. G15I3_8 g15a3_8f. G15J1 g15a1fff.
         G15J1A_11 g15n1a_f. G15J1A_14 g15n1a__1f. G15J1_11 g15a1_1f.
         G15J1_14 g15a1fff. G15J1_5 g15c1_5f. G15J1_8 g15a1_8f.
         G15J2 f71fffff. G15J2A_11 g15n1a_f. G15J2A_14 g15n1a__1f.
         G15J2_11 d71_11ff. G15J2_14 f71fffff. G15J2_5 g15c2_5f.
         G15J2_8 d71_8fff. G15J3 g15a3fff. G15J3A_11 g15n3a_f.
         G15J3A_14 g15n3a__1f. G15J3_11 g15a3_1f. G15J3_14 g15a3fff.
         G15J3_5 g15c3_5f. G15J3_8 g15a3_8f. G15K1 g15a1fff.
         G15K1_11 g15a1_1f. G15K1_14 g15a1fff. G15K1_5 g15c1_5f.
         G15K1_8 g15a1_8f. G15K2 f71fffff. G15K2_11 d71_11ff.
         G15K2_14 f71fffff. G15K2_5 g15c2_5f. G15K2_8 d71_8fff.
         G15K3 g15a3fff. G15K3_11 g15f3_1f. G15K3_14 g15a3fff.
         G15K3_5 g15c3_5f. G15K3_8 g15f3_8f. G15L1 g15a1fff.
         G15L1_11 g15a1_1f. G15L1_14 g15a1fff. G15L1_5 g15c1_5f.
         G15L1_8 g15a1_8f. G15L2 f71fffff. G15L2_11 d71_11ff.
         G15L2_14 f71fffff. G15L2_5 g15c2_5f. G15L2_8 d71_8fff.
         G15L3 g15a3fff. G15L3_11 g15a3_1f. G15L3_14 g15a3fff.
         G15L3_5 g15c3_5f. G15L3_8 g15a3_8f. G15M1 g15a1fff.
         G15M1_11 g15a1_1f. G15M1_14 g15a1fff. G15M1_5 g15c1_5f.
         G15M1_8 g15a1_8f. G15M2 f71fffff. G15M2_11 d71_11ff.
         G15M2_14 f71fffff. G15M2_5 g15c2_5f. G15M2_8 d71_8fff.
         G15M3 g15a3fff. G15M3_11 g15a3_1f. G15M3_14 g15a3fff.
         G15M3_5 g15c3_5f. G15M3_8 g15a3_8f. G15N1 g15a1fff.
         G15N1A_11 g15n1a_f. G15N1A_14 g15n1a__1f. G15N1_11 g15a1_1f.
         G15N1_14 g15a1fff. G15N1_5 g15c1_5f. G15N1_8 g15a1_8f.
         G15N2 f71fffff. G15N2A_11 g15n1a_f. G15N2A_14 g15n1a__1f.
         G15N2_11 d71_11ff. G15N2_14 f71fffff. G15N2_5 g15c2_5f.
         G15N2_8 d71_8fff. G15N3 g15a3fff. G15N3A_11 g15n3a_f.
         G15N3A_14 g15n3a__1f. G15N3_11 g15a3_1f. G15N3_14 g15a3fff.
         G15N3_5 g15c3_5f. G15N3_8 g15a3_8f. G15O1 g15a1fff.
         G15O1_11 g15a1_1f. G15O1_14 g15a1fff. G15O1_5 g15c1_5f.
         G15O1_8 g15a1_8f. G15O2 f71fffff. G15O2_11 d71_11ff.
         G15O2_14 f71fffff. G15O2_5 g15c2_5f. G15O2_8 d71_8fff.
         G15O3 g15a3fff. G15O3_11 g15a3_1f. G15O3_14 g15a3fff.
         G15O3_5 g15c3_5f. G15O3_8 g15a3_8f. G15P1 g15p1fff.
         G15P1_11 g15a1_1f. G15P1_14 g15p1fff. G15P1_5 g15c1_5f.
         G15P1_8 g15a1_8f. G15P2 f71fffff. G15P2_11 d71_11ff.
         G15P2_14 f71fffff. G15P2_5 g15c2_5f. G15P2_8 d71_8fff.
         G15P3 g15a3fff. G15P3_11 g15a3_1f. G15P3_14 g15a3fff.
         G15P3_5 g15c3_5f. G15P3_8 g15a3_8f. G15Q1 g15p1fff.
         G15Q1_11 g15a1_1f. G15Q1_14 g15p1fff. G15Q1_5 g15c1_5f.
         G15Q1_8 g15a1_8f. G15Q2 f71fffff. G15Q2_11 d71_11ff.
         G15Q2_14 f71fffff. G15Q2_5 g15c2_5f. G15Q2_8 d71_8fff.
         G15Q3 g15a3fff. G15Q3_11 g15a3_1f. G15Q3_14 g15a3fff.
         G15Q3_5 g15c3_5f. G15Q3_8 g15a3_8f. G15R1 g15p1fff.
         G15R1_11 g15a1_1f. G15R1_14 g15p1fff. G15R1_5 g15c1_5f.
         G15R1_8 g15a1_8f. G15R2 f71fffff. G15R2_11 d71_11ff.
         G15R2_14 f71fffff. G15R2_5 g15c2_5f. G15R2_8 d71_8fff.
         G15R3 g15a3fff. G15R3_11 g15a3_1f. G15R3_14 g15a3fff.
         G15R3_5 g15c3_5f. G15R3_8 g15a3_8f. G15S1 g15p1fff.
         G15S1_11 g15a1_1f. G15S1_14 g15p1fff. G15S1_5 g15c1_5f.
         G15S1_8 g15a1_8f. G15S2 f71fffff. G15S2_11 d71_11ff.
         G15S2_14 f71fffff. G15S2_5 g15c2_5f. G15S2_8 d71_8fff.
         G15S3 g15a3fff. G15S3_11 g15a3_1f. G15S3_14 g15a3fff.
         G15S3_5 g15c3_5f. G15S3_8 g15a3_8f. G15T1 g15p1fff.
         G15T1_11 g15a1_1f. G15T1_14 g15p1fff. G15T1_5 g15c1_5f.
         G15T1_8 g15a1_8f. G15T2 f71fffff. G15T2_11 d71_11ff.
         G15T2_14 f71fffff. G15T2_5 g15c2_5f. G15T2_8 d71_8fff.
         G15T3 g15a3fff. G15T3_11 g15a3_1f. G15T3_14 g15a3fff.
         G15T3_5 g15c3_5f. G15T3_8 g15a3_8f. G15U1 g15p1fff.
         G15U1_11 g15a1_1f. G15U1_14 g15p1fff. G15U1_5 g15c1_5f.
         G15U1_8 g15a1_8f. G15U2 f71fffff. G15U2_11 d71_11ff.
         G15U2_14 f71fffff. G15U2_5 g15c2_5f. G15U2_8 d71_8fff.
         G15U3 g15a3fff. G15U3_11 g15a3_1f. G15U3_14 g15a3fff.
         G15U3_5 g15c3_5f. G15U3_8 g15a3_8f. G15V1 g15v1fff.
         G15V1_11 g15a1_1f. G15V1_14 g15v1fff. G15V1_5 g15c1_5f.
         G15V1_8 g15a1_8f. G15V2 g15v2fff. G15V2_11 d91_11ff.
         G15V2_14 g15v2fff. G15V2_5 g15c2_5f. G15V2_8 d91_8fff.
         G15V3 g15a3fff. G15V3_11 g15f3_1f. G15V3_14 g15a3fff.
         G15V3_5 g15c3_5f. G15V3_8 g15f3_8f. G15W1 g15p1fff.
         G15W1_5 g15c1_5f. G15W2 f71fffff. G15W2_5 g15c2_5f.
         G15W3 g15a3fff. G15W3_5 g15c3_5f. G15Y2_11 g15n1a_f.
         G15Y2_14 f26_14ff. G15Y3_11 g15n3a_f. G15Y3_14 g15n3a__1f.
         G1_11 g1_11fff. G1_14 g1ffffff. G1_5 g1_5ffff.
         G1_8 g1_8ffff. G21 v_bthmof. G21_11 a54b_11f.
         G21_14 v_bthmof. G21_5 d12_5fff. G21_8 a54b_8ff.
         G22 d71fffff. G22_11 d91_11ff. G22_14 d71fffff.
         G22_5 d71_5fff. G22_8 d91_8fff. G23_11 g23_11ff.
         G23_14 g23_14ff. G24A_11 f41a12_f. G24A_14 f41a12__1f.
         G24_11 a535_11f. G24_14 a535_14f. G25A_11 f41a12_f.
         G25A_14 f41a12__1f. G25_11 a535_11f. G25_14 a535_14f.
         G3 d71fffff. G3_11 d91_11ff. G3_14 d71fffff.
         G3_5 d71_5fff. G3_8 d91_8fff. G4 g4ffffff.
         G4A_11 g4a_11ff. G4A_14 g4a_14ff. G4B_11 g4b_11ff.
         G4B_14 g4b_14ff. G4_11 g4_11fff. G4_14 g4ffffff.
         G4_5 g4_5ffff. G4_8 g4_8ffff. G51 g51fffff.
         G511_11 g511_11f. G511_14 g511_14f. G511_8 g511_8ff.
         G512_11 g511_11f. G512_14 g511_14f. G512_8 g511_8ff.
         G51_5 g51_5fff. G52 g51fffff. G521_11 g511_11f.
         G521_14 g511_14f. G521_8 g511_8ff. G522_11 g511_11f.
         G522_14 g511_14f. G522_8 g511_8ff. G52_5 g51_5fff.
         G6 g6ffffff. G6_11 g6_11fff. G6_14 g6ffffff.
         G6_5 g6_5ffff. G7 g51fffff. G71_8 g511_8ff.
         G72_8 g511_8ff. G7_11 g7_11fff. G7_14 g51fffff.
         G7_5 g51_5fff. G81 g81fffff. G81_11 g81_11ff.
         G81_14 g81fffff. G81_5 g81_5fff. G81_8 g81_8fff.
         G82 g81fffff. G82_11 g81_11ff. G82_14 g81fffff.
         G82_5 g81_5fff. G82_8 g81_8fff. G83 g83fffff.
         G83_11 g83_11ff. G83_14 g83fffff. G83_5 g83_5fff.
         G83_8 g83_8fff. G9 g9ffffff. G9_11 g9_11fff.
         G9_14 g9ffffff. G9_5 g9_5ffff. G9_8 g9_8ffff.
         H1 h1ffffff. H1_11 h1_11fff. H1_14 h1ffffff.
         H1_5 h1_5ffff. H1_8 h1_8ffff. H21 h21fffff.
         H21_11 h21_11ff. H21_14 h21fffff. H21_5 h21_5fff.
         H21_8 h21_8fff. H22 h22fffff. H22_11 h22_11ff.
         H22_14 h22fffff. H22_5 h22_5fff. H22_8 h22_8fff.
         H3 h3ffffff. H3_11 h3_11fff. H3_14 h3ffffff.
         H3_5 h3_5ffff. H3_8 h3_8ffff. H5_14 h5_14fff.
         H6 d71fffff. H6_11 d71_11ff. H6_14 d71fffff.
         H6_5 d71_5fff. H6_8 d71_8fff. H7 d71fffff.
         H71 h71fffff. H71_11 h71_11ff. H71_14 h71fffff.
         H71_5 h71_5fff. H71_8 h71_8fff. H7_11 d71_11ff.
         H7_14 d71fffff. H7_5 d71_5fff. H7_8 d71_8fff.
         H8 d71fffff. JIGE_11 a54b_11f. JIGE_14 a54bffff.
         JIGE_8 a54b_8ff. MONTHIN_11 monthinf. MONTH_5 month_5f.
         MONTH_8 month_8f. PROV provffff. RA2 ra2fffff.
         RA41 ra2fffff. RA41_14 ra2fffff. RA42 ra2fffff.
         RA42_14 ra2fffff. RA43 ra2fffff. RA43_14 ra2fffff.
         RA51 ra2fffff. RA51_11 ra51_11f. RA51_14 ra2fffff.
         RA51_5 ra51_5ff. RA51_8 ra51_8ff. RA52 ra52ffff.
         RA52_11 ra52_11f. RA52_14 ra52ffff. RA52_5 ra52_5ff.
         RA52_8 ra52_8ff. RA530_11 ra52_11f. RA530_14 ra52ffff.
         RA530_5 ra52_5ff. RA530_8 ra52_8ff. RA531 ra52ffff.
         RA531_11 ra52_11f. RA531_14 ra52ffff. RA531_5 ra52_5ff.
         RA531_8 ra52_8ff. RA532 ra52ffff. RA532_11 ra52_11f.
         RA532_14 ra52ffff. RA532_5 ra52_5ff. RA532_8 ra52_8ff.
         RA533_11 ra52_11f. RA533_14 ra52ffff. RA534_11 ra52_11f.
         RA534_14 ra52ffff. RA535_11 ra52_11f. RA535_14 ra52ffff.
         RA536_11 ra52_11f. RA536_14 ra52ffff. RA537_11 ra52_11f.
         RA537_14 ra52ffff. RA53A ra52ffff. RA53A_11 ra52_11f.
         RA53A_14 ra52ffff. RA53A_5 ra52_5ff. RA53A_8 ra52_8ff.
         RA53B ra52ffff. RA53B_11 ra52_11f. RA53B_14 ra52ffff.
         RA53B_5 ra52_5ff. RA53B_8 ra52_8ff. RA53C ra52ffff.
         RA53C_11 ra52_11f. RA53C_14 ra52ffff. RA53C_5 ra52_5ff.
         RA53C_8 ra52_8ff. RA53D ra52ffff. RA53D_11 ra52_11f.
         RA53D_14 ra52ffff. RA53D_5 ra52_5ff. RA53D_8 ra52_8ff.
         RA53E ra52ffff. RA53E_11 ra52_11f. RA53E_14 ra52ffff.
         RA53E_5 ra52_5ff. RA53E_8 ra52_8ff. RA53F ra52ffff.
         RA53F_11 ra52_11f. RA53F_14 ra52ffff. RA53F_5 ra52_5ff.
         RA53F_8 ra52_8ff. RA53G ra52ffff. RA53G_11 ra52_11f.
         RA53G_14 ra52ffff. RA53G_5 ra52_5ff. RA53G_8 ra52_8ff.
         RA53H ra52ffff. RA53H_11 ra52_11f. RA53H_14 ra52ffff.
         RA53H_5 ra52_5ff. RA53H_8 ra52_8ff. RA53I ra52ffff.
         RA53I_11 ra52_11f. RA53I_14 ra52ffff. RA53I_5 ra52_5ff.
         RA53I_8 ra52_8ff. RA53J ra52ffff. RA53J_11 ra52_11f.
         RA53J_14 ra52ffff. RA53J_5 ra52_5ff. RA53J_8 ra52_8ff.
         RA53K ra52ffff. RA53K_5 ra52_5ff. RA53K_8 ra52_8ff.
         RA53L ra52ffff. RA53L_5 ra52_5ff. RA53L_8 ra52_8ff.
         RA54 ra52ffff. RA540_11 ra52_11f. RA540_14 ra52ffff.
         RA540_5 ra52_5ff. RA541_11 ra52_11f. RA541_14 ra52ffff.
         RA541_5 ra52_5ff. RA541_8 ra52_8ff. RA542_11 ra52_11f.
         RA542_14 ra52ffff. RA542_5 ra52_5ff. RA542_8 ra52_8ff.
         RA54_11 ra52_11f. RA54_14 ra52ffff. RA54_5 ra52_5ff.
         RA54_8 ra52_8ff. RD1 rd1fffff. RD101 ra2fffff.
         RD101_11 ra51_11f. RD101_14 ra2fffff. RD101_5 ra51_5ff.
         RD101_8 ra51_8ff. RD102 ra52ffff. RD102_11 ra52_11f.
         RD102_14 ra52ffff. RD102_5 ra52_5ff. RD102_8 ra52_8ff.
         RD103 ra52ffff. RD103_11 ra52_11f. RD103_14 ra52ffff.
         RD103_5 ra52_5ff. RD103_8 ra52_8ff. RD11A ra2fffff.
         RD11A_11 ra51_11f. RD11A_14 ra2fffff. RD11A_5 ra51_5ff.
         RD11A_8 ra51_8ff. RD11B ra2fffff. RD11B_11 ra51_11f.
         RD11B_14 ra2fffff. RD11B_5 ra51_5ff. RD11B_8 ra51_8ff.
         RD11C ra2fffff. RD11C_11 ra51_11f. RD11C_14 ra2fffff.
         RD11C_5 ra51_5ff. RD11C_8 ra51_8ff. RD11D ra2fffff.
         RD11D_11 ra51_11f. RD11D_14 ra2fffff. RD11D_5 ra51_5ff.
         RD11D_8 ra51_8ff. RD11E ra2fffff. RD11E_11 ra51_11f.
         RD11E_14 ra2fffff. RD11E_5 ra51_5ff. RD11E_8 ra51_8ff.
         RD11F ra2fffff. RD11F_11 ra51_11f. RD11F_14 ra2fffff.
         RD11F_5 ra51_5ff. RD11F_8 ra51_8ff. RD11G ra2fffff.
         RD11G_11 ra51_11f. RD11G_14 ra2fffff. RD11G_5 ra51_5ff.
         RD11G_8 ra51_8ff. RD11H ra2fffff. RD11H_11 ra51_11f.
         RD11H_14 ra2fffff. RD11H_5 ra51_5ff. RD11H_8 ra51_8ff.
         RD11I ra2fffff. RD12 ra2fffff. RD12_11 rd12_11f.
         RD12_14 ra2fffff. RD12_5 ra51_5ff. RD12_8 rd12_8ff.
         RD1_11 rd1_11ff. RD1_14 rd1fffff. RD1_5 ra51_5ff.
         RD1_8 rd1_8fff. RD2 ra2fffff. RD2_11 ra51_11f.
         RD2_14 ra2fffff. RD2_5 ra51_5ff. RD2_8 ra51_8ff.
         RD31 ra2fffff. RD31_11 ra51_11f. RD31_14 ra2fffff.
         RD31_5 ra51_5ff. RD31_8 ra51_8ff. RD32 ra2fffff.
         RD32_11 ra51_11f. RD32_14 ra2fffff. RD32_5 ra51_5ff.
         RD32_8 ra51_8ff. RD33_11 ra51_11f. RD33_14 ra52ffff.
         RD33_8 ra51_8ff. RD34_11 ra51_11f. RD34_14 ra52ffff.
         RD34_8 ra51_8ff. RD4ALGA_11 ra51_11f. RD4ALGA_14 ra52ffff.
         RD4ALGA_8 ra51_8ff. RD4BEAN ra2fffff. RD4BEAN_11 ra51_11f.
         RD4BEAN_14 ra2fffff. RD4BEAN_8 ra51_8ff. RD4BEN_5 ra51_5ff.
         RD4DRUG_11 ra51_11f. RD4DRUG_14 ra52ffff. RD4DRUG_8 ra51_8ff.
         RD4EGG ra2fffff. RD4EGG_11 ra51_11f. RD4EGG_14 ra2fffff.
         RD4EGG_5 ra51_5ff. RD4EGG_8 ra51_8ff. RD4FISH ra2fffff.
         RD4FISH_11 ra51_11f. RD4FISH_14 ra2fffff. RD4FISH_8 ra51_8ff.
         RD4FSH_5 ra51_5ff. RD4GARL ra2fffff. RD4GARL_11 ra51_11f.
         RD4GARL_14 ra2fffff. RD4GARL_8 ra51_8ff. RD4GAR_5 ra51_5ff.
         RD4MEAT ra2fffff. RD4MEAT_11 ra51_11f. RD4MEAT_14 ra2fffff.
         RD4MEAT_8 ra51_8ff. RD4MILK_14 ra52ffff. RD4MT_5 ra51_5ff.
         RD4NUT_11 ra51_11f. RD4NUT_14 ra52ffff. RD4NUT_8 ra51_8ff.
         RD4SUGA ra2fffff. RD4SUGA_11 ra51_11f. RD4SUGA_14 ra2fffff.
         RD4SUGA_8 ra51_8ff. RD4SUG_5 ra51_5ff. RD4TEA ra2fffff.
         RD4TEA_11 ra51_11f. RD4TEA_14 ra2fffff. RD4TEA_5 ra51_5ff.
         RD4TEA_8 ra51_8ff. RD4VEG ra2fffff. RD4VEG_11 ra51_11f.
         RD4VEG_14 ra2fffff. RD4VEG_5 ra51_5ff. RD4VEG_8 ra51_8ff.
         RD4VIT_11 ra51_11f. RD4VIT_14 ra52ffff. RD4VIT_8 ra51_8ff.
         RD5 ra2fffff. RD5_11 ra51_11f. RD5_14 ra2fffff.
         RD5_5 ra51_5ff. RD5_8 ra51_8ff. RD6 ra2fffff.
         RD6_11 ra51_11f. RD6_14 ra2fffff. RD6_5 ra51_5ff.
         RD6_8 ra51_8ff. RD71 ra2fffff. RD710_11 ra52_11f.
         RD710_14 ra52ffff. RD71_11 ra51_11f. RD71_14 ra2fffff.
         RD71_5 ra51_5ff. RD71_8 ra51_8ff. RD72 ra2fffff.
         RD72_11 ra51_11f. RD72_14 ra2fffff. RD72_5 ra51_5ff.
         RD72_8 ra51_8ff. RD73 ra52ffff. RD73_11 ra52_11f.
         RD73_14 ra52ffff. RD73_5 ra52_5ff. RD73_8 ra52_8ff.
         RD74 ra52ffff. RD74_11 ra52_11f. RD74_14 ra52ffff.
         RD74_5 ra52_5ff. RD74_8 ra52_8ff. RD75 ra52ffff.
         RD75_11 ra52_11f. RD75_14 ra52ffff. RD75_5 ra52_5ff.
         RD75_8 ra52_8ff. RD76_11 ra52_11f. RD76_14 ra52ffff.
         RD77_11 ra52_11f. RD77_14 ra52ffff. RD78_11 ra52_11f.
         RD78_14 ra52ffff. RD79_11 ra52_11f. RD79_14 ra52ffff.
         RD81 ra2fffff. RD81_11 ra51_11f. RD81_14 ra2fffff.
         RD81_5 ra51_5ff. RD81_8 ra51_8ff. RD82 ra2fffff.
         RD82_11 ra51_11f. RD82_14 ra2fffff. RD82_5 ra51_5ff.
         RD82_8 ra51_8ff. RD83 ra52ffff. RD83_11 ra52_11f.
         RD83_14 ra52ffff. RD83_5 ra52_5ff. RD83_8 ra52_8ff.
         RD84 ra52ffff. RD84_11 ra52_11f. RD84_14 ra52ffff.
         RD84_5 ra52_5ff. RD84_8 ra52_8ff. RD85 ra52ffff.
         RD85_11 ra52_11f. RD85_14 ra52ffff. RD85_5 ra52_5ff.
         RD85_8 ra52_8ff. RD86 ra52ffff. RD86_11 ra51_11f.
         RD86_14 ra52ffff. RD86_5 ra52_5ff. RD86_8 ra51_8ff.
         RD87_11 ra52_11f. RD87_14 ra52ffff. RD91 ra2fffff.
         RD91_11 ra51_11f. RD91_14 ra2fffff. RD91_5 ra51_5ff.
         RD91_8 ra51_8ff. RD92 ra52ffff. RD92_11 ra52_11f.
         RD92_14 ra52ffff. RD92_5 ra52_5ff. RD92_8 ra52_8ff.
         RD93 ra52ffff. RD93_11 ra52_11f. RD93_14 ra52ffff.
         RD93_5 ra52_5ff. RD93_8 ra52_8ff. RD94 ra52ffff.
         RD94_11 ra52_11f. RD94_14 ra52ffff. RD94_5 ra52_5ff.
         RD94_8 ra52_8ff. RDEMILK_11 ra51_11f. RDEMILK_8 ra51_8ff.
         RE0_11 ra52_11f. RE0_14 ra52ffff. RE1 ra2fffff.
         RE10 ra2fffff. RE10_11 ra51_11f. RE10_14 re1_14ff.
         RE10_5 ra51_5ff. RE10_8 ra51_8ff. RE11 ra2fffff.
         RE11_11 ra51_11f. RE11_14 re1_14ff. RE11_5 ra51_5ff.
         RE11_8 ra51_8ff. RE12 ra2fffff. RE12_11 ra51_11f.
         RE12_14 re1_14ff. RE12_5 ra51_5ff. RE12_8 ra51_8ff.
         RE13 ra2fffff. RE13_11 ra51_11f. RE13_14 re1_14ff.
         RE13_5 ra51_5ff. RE13_8 ra51_8ff. RE14 ra2fffff.
         RE14_11 ra51_11f. RE14_14 re1_14ff. RE14_5 ra51_5ff.
         RE14_8 ra51_8ff. RE1A ra52ffff. RE1B_11 ra51_11f.
         RE1B_14 ra52ffff. RE1B_5 ra52_5ff. RE1B_8 ra51_8ff.
         RE1_11 ra51_11f. RE1_14 re1_14ff. RE1_5 ra51_5ff.
         RE1_8 ra51_8ff. RE2 ra2fffff. RE2A ra52ffff.
         RE2B_11 ra51_11f. RE2B_14 ra52ffff. RE2B_5 ra52_5ff.
         RE2B_8 ra51_8ff. RE2_11 ra51_11f. RE2_14 re1_14ff.
         RE2_5 ra51_5ff. RE2_8 ra51_8ff. RE3 ra2fffff.
         RE3A ra52ffff. RE3B_11 ra51_11f. RE3B_14 ra52ffff.
         RE3B_5 ra52_5ff. RE3B_8 ra51_8ff. RE3_11 ra51_11f.
         RE3_14 re1_14ff. RE3_5 ra51_5ff. RE3_8 ra51_8ff.
         RE4 ra2fffff. RE4A ra52ffff. RE4B_11 ra51_11f.
         RE4B_14 ra52ffff. RE4B_5 ra52_5ff. RE4B_8 ra51_8ff.
         RE4_11 ra51_11f. RE4_14 re1_14ff. RE4_5 ra51_5ff.
         RE4_8 ra51_8ff. RE5 ra2fffff. RE5A ra52ffff.
         RE5B_11 ra51_11f. RE5B_14 ra52ffff. RE5B_5 ra52_5ff.
         RE5B_8 ra51_8ff. RE5_11 ra51_11f. RE5_14 re1_14ff.
         RE5_5 ra51_5ff. RE5_8 ra51_8ff. RE6 ra2fffff.
         RE610_11 ra51_11f. RE610_14 ra52ffff. RE610_5 ra52_5ff.
         RE610_8 ra51_8ff. RE62_11 ra51_11f. RE62_14 ra52ffff.
         RE62_5 ra52_5ff. RE62_8 ra51_8ff. RE63_11 ra51_11f.
         RE63_14 ra52ffff. RE63_5 ra52_5ff. RE63_8 ra51_8ff.
         RE64_11 ra51_11f. RE64_14 ra52ffff. RE64_5 ra52_5ff.
         RE64_8 ra51_8ff. RE65_11 ra51_11f. RE65_14 ra52ffff.
         RE65_5 ra52_5ff. RE65_8 ra51_8ff. RE66_5 ra52_5ff.
         RE67_11 ra51_11f. RE67_14 ra52ffff. RE67_5 ra52_5ff.
         RE67_8 ra51_8ff. RE6A ra52ffff. RE6B_11 ra51_11f.
         RE6B_14 ra52ffff. RE6B_5 ra52_5ff. RE6B_8 ra51_8ff.
         RE6_11 ra51_11f. RE6_14 re1_14ff. RE6_5 ra51_5ff.
         RE6_8 ra51_8ff. RE7 ra2fffff. RE7_11 ra51_11f.
         RE7_14 re1_14ff. RE7_5 ra51_5ff. RE7_8 ra51_8ff.
         RE8 ra2fffff. RE8_11 ra51_11f. RE8_14 re1_14ff.
         RE8_5 ra51_5ff. RE8_8 ra51_8ff. RE9 ra2fffff.
         RE9_11 ra51_11f. RE9_14 re1_14ff. RE9_5 ra51_5ff.
         RE9_8 ra51_8ff. RELATYPE relatypf. RESIC_11 resic_1f.
         RESIDENC residenf. RESIDENC_14 residenf. RESID_5 resid_5f.
         RESID_8 resid_8f. RF1 ra2fffff. RF10 ra2fffff.
         RF101 ra52ffff. RF101_11 ra52_11f. RF101_14 ra52ffff.
         RF101_8 ra52_8ff. RF102 ra52ffff. RF102_11 ra52_11f.
         RF102_14 ra52ffff. RF102_8 ra52_8ff. RF1030A_11 ra52_11f.
         RF1030_11 ra52_11f. RF1031A_11 ra52_11f. RF1031_11 ra52_11f.
         RF1032_11 ra52_11f. RF1033_11 ra52_11f. RF103A ra52ffff.
         RF103A_11 ra52_11f. RF103A_14 ra52ffff. RF103A_5 ra52_5ff.
         RF103A_8 ra52_8ff. RF103B ra52ffff. RF103B_11 ra52_11f.
         RF103B_14 ra52ffff. RF103B_5 ra52_5ff. RF103B_8 ra52_8ff.
         RF103C ra52ffff. RF103C_11 ra52_11f. RF103C_14 ra52ffff.
         RF103C_5 ra52_5ff. RF103C_8 ra52_8ff. RF103D ra52ffff.
         RF103D_11 ra52_11f. RF103D_14 ra52ffff. RF103D_5 ra52_5ff.
         RF103D_8 ra52_8ff. RF103E ra52ffff. RF103E_11 ra52_11f.
         RF103E_14 ra52ffff. RF103E_5 ra52_5ff. RF103E_8 ra52_8ff.
         RF103F ra52ffff. RF103F_11 ra52_11f. RF103F_14 ra52ffff.
         RF103F_5 ra52_5ff. RF103F_8 ra52_8ff. RF103G ra52ffff.
         RF103G_11 ra52_11f. RF103G_14 ra52ffff. RF103G_5 ra52_5ff.
         RF103G_8 ra52_8ff. RF103H ra52ffff. RF103H_11 ra52_11f.
         RF103H_14 ra52ffff. RF103H_5 ra52_5ff. RF103H_8 ra52_8ff.
         RF103I ra52ffff. RF103I_11 ra52_11f. RF103I_14 ra52ffff.
         RF103I_5 ra52_5ff. RF103I_8 ra52_8ff. RF103J ra52ffff.
         RF103J_11 ra52_11f. RF103J_14 ra52ffff. RF103J_5 ra52_5ff.
         RF103J_8 ra52_8ff. RF103K ra52ffff. RF103K_11 ra52_11f.
         RF103K_14 ra52ffff. RF103K_5 ra52_5ff. RF103K_8 ra52_8ff.
         RF103L_11 ra52_11f. RF103L_14 ra52ffff. RF103L_5 ra52_5ff.
         RF103L_8 ra52_8ff. RF103M_11 ra52_11f. RF103M_14 ra52ffff.
         RF103M_5 ra52_5ff. RF103M_8 ra52_8ff. RF104 ra52ffff.
         RF104_14 ra52ffff. RF105 ra52ffff. RF105_14 ra52ffff.
         RF10_11 ra52_11f. RF10_14 ra2fffff. RF10_8 ra52_8ff.
         RF111 ra2fffff. RF111_5 ra51_5ff. RF111_8 ra51_8ff.
         RF112 ra2fffff. RF112_5 ra51_5ff. RF112_8 ra51_8ff.
         RF113 ra2fffff. RF113_5 ra51_5ff. RF113_8 ra51_8ff.
         RF12 ra52ffff. RF12_11 ra52_11f. RF12_14 ra52ffff.
         RF12_5 ra52_5ff. RF12_8 ra52_8ff. RF13 ra52ffff.
         RF13_11 ra52_11f. RF13_14 ra52ffff. RF13_5 ra52_5ff.
         RF13_8 ra52_8ff. RF14_11 ra51_11f. RF14_14 ra52ffff.
         RF14_5 ra51_5ff. RF14_8 ra51_8ff. RF15_11 ra51_11f.
         RF15_14 ra52ffff. RF15_5 ra51_5ff. RF15_8 ra51_8ff.
         RF1_14 ra2fffff. RF1_8 ra52_8ff. RF2 ra2fffff.
         RF21 ra52ffff. RF211 ra52ffff. RF211_11 ra52_11f.
         RF211_14 ra52ffff. RF211_5 ra52_5ff. RF211_8 ra52_8ff.
         RF21_11 ra52_11f. RF21_14 ra52ffff. RF21_8 ra52_8ff.
         RF22 ra52ffff. RF221_11 ra52_11f. RF221_14 ra52ffff.
         RF22_11 ra52_11f. RF22_14 ra52ffff. RF22_5 ra52_5ff.
         RF22_8 ra52_8ff. RF23 ra52ffff. RF23_11 ra52_11f.
         RF23_14 ra52ffff. RF23_5 ra52_5ff. RF23_8 ra52_8ff.
         RF24_11 ra52_11f. RF24_14 ra52ffff. RF25A_14 ra52ffff.
         RF25B_11 ra52_11f. RF25B_14 ra52ffff. RF25_11 ra52_11f.
         RF26_11 ra52_11f. RF26_14 ra52ffff. RF27_11 ra52_11f.
         RF27_14 ra52ffff. RF2_14 ra2fffff. RF2_8 ra52_8ff.
         RF31 ra2fffff. RF31_11 ra51_11f. RF31_14 ra2fffff.
         RF31_5 ra51_5ff. RF31_8 ra51_8ff. RF32 ra2fffff.
         RF32_11 ra51_11f. RF32_14 ra2fffff. RF32_5 ra51_5ff.
         RF32_8 ra51_8ff. RF33 ra2fffff. RF33_11 ra51_11f.
         RF33_14 ra2fffff. RF33_5 ra51_5ff. RF33_8 ra51_8ff.
         RF34 ra2fffff. RF340_11 ra51_11f. RF340_14 ra52ffff.
         RF340_5 ra51_5ff. RF340_8 ra51_8ff. RF34_11 ra51_11f.
         RF34_14 ra2fffff. RF34_5 ra51_5ff. RF34_8 ra51_8ff.
         RF35 ra2fffff. RF35_11 ra51_11f. RF35_14 ra2fffff.
         RF35_5 ra51_5ff. RF35_8 ra51_8ff. RF41 ra2fffff.
         RF41A_11 ra52_11f. RF41A_14 ra52ffff. RF41B_11 ra52_11f.
         RF41B_14 ra52ffff. RF41_11 ra51_11f. RF41_14 ra2fffff.
         RF41_5 ra51_5ff. RF41_8 ra51_8ff. RF42 ra52ffff.
         RF42_11 ra52_11f. RF42_14 ra52ffff. RF42_5 ra52_5ff.
         RF42_8 ra52_8ff. RF43A ra52ffff. RF43A_11 ra52_11f.
         RF43A_14 ra52ffff. RF43A_5 ra52_5ff. RF43A_8 ra52_8ff.
         RF43B ra52ffff. RF43B_11 ra52_11f. RF43B_14 ra52ffff.
         RF43B_5 ra52_5ff. RF43B_8 ra52_8ff. RF43C ra52ffff.
         RF43C_11 ra52_11f. RF43C_14 ra52ffff. RF43C_5 ra52_5ff.
         RF43C_8 ra52_8ff. RF43D ra52ffff. RF43D_11 ra52_11f.
         RF43D_14 ra52ffff. RF43D_5 ra52_5ff. RF43D_8 ra52_8ff.
         RF44 ra52ffff. RF44_11 ra52_11f. RF44_14 ra52ffff.
         RF44_5 ra52_5ff. RF44_8 ra52_8ff. RF45 ra52ffff.
         RF45_11 ra52_11f. RF45_14 ra52ffff. RF45_5 ra52_5ff.
         RF45_8 ra52_8ff. RF46_11 ra52_11f. RF46_14 ra52ffff.
         RF46_5 ra52_5ff. RF46_8 ra52_8ff. RF47_11 rd1_11ff.
         RF47_14 ra52ffff. RF47_8 rd1_8fff. RF5 ra2fffff.
         RF5_11 ra51_11f. RF5_14 ra2fffff. RF5_5 ra51_5ff.
         RF5_8 ra51_8ff. RF61 ra2fffff. RF610_11 ra51_11f.
         RF610_14 ra52ffff. RF610_5 ra51_5ff. RF610_8 ra51_8ff.
         RF61_11 ra51_11f. RF61_14 ra2fffff. RF61_5 ra51_5ff.
         RF61_8 ra51_8ff. RF62 ra2fffff. RF62_11 ra51_11f.
         RF62_14 ra2fffff. RF62_8 ra51_8ff. RF63 ra2fffff.
         RF63_11 ra51_11f. RF63_14 ra2fffff. RF63_8 ra51_8ff.
         RF64 ra2fffff. RF64_11 ra51_11f. RF64_14 ra2fffff.
         RF64_5 ra51_5ff. RF64_8 ra51_8ff. RF65 ra52ffff.
         RF651A1_11 ra52_11f. RF651A1_14 ra52ffff. RF651A2_11 ra52_11f.
         RF651A2_14 ra52ffff. RF651A_5 ra51_5ff. RF651A_8 ra51_8ff.
         RF651B1_11 ra52_11f. RF651B1_14 ra52ffff. RF651B2_11 ra52_11f.
         RF651B2_14 ra52ffff. RF651B_5 ra51_5ff. RF651B_8 ra51_8ff.
         RF6521_11 ra52_11f. RF6521_14 ra52ffff. RF652A_11 ra52_11f.
         RF652A_14 ra52ffff. RF652B_11 ra52_11f. RF652B_14 ra52ffff.
         RF652_5 ra52_5ff. RF652_8 ra51_8ff. RF66 ra52ffff.
         RF66_11 ra52_11f. RF66_14 ra52ffff. RF66_8 ra52_8ff.
         RF71 ra52ffff. RF71_11 ra52_11f. RF71_14 ra52ffff.
         RF71_5 ra51_5ff. RF71_8 ra52_8ff. RF721 ra52ffff.
         RF721_11 ra52_11f. RF721_14 ra52ffff. RF721_5 ra52_5ff.
         RF721_8 ra52_8ff. RF722 ra52ffff. RF722_11 ra52_11f.
         RF722_14 ra52ffff. RF722_5 ra52_5ff. RF722_8 ra52_8ff.
         RF73 ra52ffff. RF73_11 ra52_11f. RF73_14 ra52ffff.
         RF73_5 ra52_5ff. RF73_8 ra52_8ff. RF74_11 ra51_11f.
         RF74_14 ra2fffff. RF74_5 ra51_5ff. RF74_8 ra51_8ff.
         RF81 ra2fffff. RF81_11 ra52_11f. RF81_14 ra2fffff.
         RF81_5 ra51_5ff. RF81_8 ra52_8ff. RF821 ra52ffff.
         RF821_11 ra52_11f. RF821_14 ra52ffff. RF821_5 ra52_5ff.
         RF821_8 ra52_8ff. RF822 ra52ffff. RF822_11 ra52_11f.
         RF822_14 ra52ffff. RF822_5 ra52_5ff. RF822_8 ra52_8ff.
         RF83 ra52ffff. RF83_11 ra52_11f. RF83_14 ra52ffff.
         RF83_5 ra52_5ff. RF83_8 ra52_8ff. RF84 ra2fffff.
         RF84_11 ra51_11f. RF84_14 ra2fffff. RF84_8 ra51_8ff.
         RF85_11 ra51_11f. RF85_14 ra2fffff. RF85_5 ra51_5ff.
         RF85_8 ra51_8ff. RF86_11 ra51_11f. RF86_14 ra2fffff.
         RF86_5 ra51_5ff. RF86_8 ra51_8ff. RF9 ra2fffff.
         RF901A_11 ra52_11f. RF901_11 ra52_11f. RF902A_11 ra52_11f.
         RF902_11 ra52_11f. RF91 ra2fffff. RF91_11 ra52_11f.
         RF91_14 ra2fffff. RF91_8 ra52_8ff. RF92A ra52ffff.
         RF92A_11 ra52_11f. RF92A_14 ra52ffff. RF92A_5 ra52_5ff.
         RF92A_8 ra52_8ff. RF92B ra52ffff. RF92B_11 ra52_11f.
         RF92B_14 ra52ffff. RF92B_5 ra52_5ff. RF92B_8 ra52_8ff.
         RF92C ra52ffff. RF92C_11 ra52_11f. RF92C_14 ra52ffff.
         RF92C_5 ra52_5ff. RF92C_8 ra52_8ff. RF92D ra52ffff.
         RF92D_11 ra52_11f. RF92D_14 ra52ffff. RF92D_5 ra52_5ff.
         RF92D_8 ra52_8ff. RF92E ra52ffff. RF92E_11 ra52_11f.
         RF92E_14 ra52ffff. RF92E_5 ra52_5ff. RF92E_8 ra52_8ff.
         RF92F ra52ffff. RF92F_11 ra52_11f. RF92F_14 ra52ffff.
         RF92F_5 ra52_5ff. RF92F_8 ra52_8ff. RF92G ra52ffff.
         RF92G_11 ra52_11f. RF92G_14 ra52ffff. RF92G_5 ra52_5ff.
         RF92G_8 ra52_8ff. RF92H ra52ffff. RF92H_11 ra52_11f.
         RF92H_14 ra52ffff. RF92H_5 ra52_5ff. RF92H_8 ra52_8ff.
         RF92I ra52ffff. RF92I_11 ra52_11f. RF92I_14 ra52ffff.
         RF92I_5 ra52_5ff. RF92I_8 ra52_8ff. RF92J ra52ffff.
         RF92J_11 ra52_11f. RF92J_14 ra52ffff. RF92J_5 ra52_5ff.
         RF92J_8 ra52_8ff. RF92K ra52ffff. RF92K_5 ra52_5ff.
         RF9_11 ra52_11f. RF9_5 ra52_5ff. RF9_8 ra52_8ff.
         RG01_11 ra52_11f. RG01_14 ra52ffff. RG01_5 ra51_5ff.
         RG02_11 ra51_11f. RG02_14 ra52ffff. RG02_5 ra51_5ff.
         RG02_8 ra51_8ff. RG101 ra2fffff. RG101_8 ra51_8ff.
         RG102_8 ra51_8ff. RG1061_11 ra52_11f. RG1061_14 ra52ffff.
         RG1062_11 ra52_11f. RG1062_14 ra52ffff. RG1063_11 ra52_11f.
         RG1063_14 ra52ffff. RG106_11 ra52_11f. RG106_14 ra52ffff.
         RG13 ra2fffff. RG130_11 ra52_11f. RG130_14 ra52ffff.
         RG130_5 ra51_5ff. RG13_11 ra52_11f. RG13_14 ra2fffff.
         RG13_5 ra51_5ff. RG13_8 ra51_8ff. RG14A_11 ra51_11f.
         RG14A_14 ra52ffff. RG14A_5 ra52_5ff. RG14A_8 ra51_8ff.
         RG14B_11 ra51_11f. RG14B_14 ra52ffff. RG14B_5 ra52_5ff.
         RG14B_8 ra51_8ff. RG14C_11 ra51_11f. RG14C_14 ra52ffff.
         RG14C_5 ra52_5ff. RG14C_8 ra51_8ff. RG15A_8 ra51_8ff.
         RG15B_8 ra51_8ff. RG15C_8 ra51_8ff. RG15D_8 ra51_8ff.
         RG15E_8 ra51_8ff. RG15F_8 ra51_8ff. RG15G_8 ra51_8ff.
         RG15H_8 ra51_8ff. RG15I_8 ra51_8ff. RG15J_8 ra51_8ff.
         RG15K_8 ra51_8ff. RG15L_8 ra51_8ff. RG15M_8 ra51_8ff.
         RG15N_8 ra51_8ff. RG15O_8 ra51_8ff. RG15P_8 ra51_8ff.
         RG15Q_8 ra51_8ff. RG15R_8 ra51_8ff. RG15S_8 ra51_8ff.
         RG15T_8 ra51_8ff. RG15U_8 ra51_8ff. RG15V_8 ra51_8ff.
         RG1_11 ra52_11f. RG1_14 ra52ffff. RG21_11 ra51_11f.
         RG21_14 ra52ffff. RG21_8 ra51_8ff. RG22_11 ra51_11f.
         RG22_14 ra52ffff. RG22_8 ra51_8ff. RG23_11 ra52_11f.
         RG23_14 ra52ffff. RG24A_11 ra52_11f. RG24A_14 ra52ffff.
         RG24_11 ra52_11f. RG24_14 ra52ffff. RG25A_11 ra52_11f.
         RG25A_14 ra52ffff. RG25_11 ra52_11f. RG25_14 ra52ffff.
         RG3_11 ra51_11f. RG3_14 ra52ffff. RG3_8 ra51_8ff.
         RG4A_11 ra52_11f. RG4A_14 ra52ffff. RG4B_11 ra52_11f.
         RG4B_14 ra52ffff. RG4_11 ra51_11f. RG4_14 ra52ffff.
         RG4_8 ra51_8ff. RG51_8 ra51_8ff. RG52_8 ra51_8ff.
         RG5_11 ra52_11f. RG5_14 ra52ffff. TYPE typeffff.
         VAGE_11 yearin_f. VAGE_5 vage_5ff. V_BTHMON v_bthmof.
         V_BTHYR v_bthyrf. YEARIN_11 yearin_f.
    ;
*/

RUN ;
