/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0001: 1998-2014 LONGITUDINAL DATA, VERSION 1)
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
 | "c:\temp\36692-0001-data.txt").
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
VALUE c55_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
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
VALUE d71_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE g14c1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
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
VALUE c22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE d2provif  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 11='(11) beijing'
                12='(12) tianjian' 13='(13) hebei' 14='(14) shanxi' 21='(21) liaoning' 22='(22) jilin'
                23='(23) helongjiang' 31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang'
                34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan'
                42='(42) hubei' 43='(43) henan' 44='(44) guangdong' 45='(45) guangxi' 50='(50) chongqing'
                51='(51) sichuan' 61='(61) shaanxi';
VALUE d0respof  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) spouse'
                2='(2) child' 3='(3) spouse of child' 4='(4) grandchild and his/her spouse'
                5='(5) relative' 6='(6) other' 9='(9) missing';
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
VALUE f72fffff  888='(888) don''t know' 999='(999) missing';
VALUE d14carpf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE b121_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE g13_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(00) no serious illness' 88='(88) bedridden all the year around' 99='(99) missing';
VALUE d2sexfff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
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
VALUE d2dplacf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institution' 4='(4) others' 8='(8) don''t know' 9='(9) missing';
VALUE f103a2_f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE d0incomf  -9='(-0009) lost to follow-up in the 2000 survey'
                -7='(-0007) it is for the deceased persons, not applicable for survivors'
                88888='(88888) don''t know' 99998='(99998) more than 100,000' 99999='(99999) missing';
VALUE f92a5_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
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
VALUE d8dplacf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE e66_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
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
VALUE ra1fffff  9='(9)  missing';
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
VALUE g17n1fff  1='(1) difficult to classify' 2='(2) no' 3='(3) don''t know'
                4='(4) mental disease' 5='(5) orthopedic disease' 6='(6) internal medical disease'
                7='(7) dermatosis' 8='(8) five organs diseases' 9='(9) gynecological disease';
VALUE d5dplacf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE d2generf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) one generation' 2='(2) two generations' 3='(3) three generations'
                4='(4)  four and more generations' 9='(9) missing';
VALUE e67_14ff  -1='(-01) not applicable' 888='(888) not able to answer'
                998='(998) more than 1000' 999='(999) missing';
VALUE rg17ffff  0='(0) without proxy' 1='(1) with proxy' 2='(2) UNDOCUMENTED CODE'
                9='(9) missing';
VALUE f211_14f  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 9='(9) missing';
VALUE d4drug1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d2vmontf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE a51_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE e12_14ff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                8='(8) do not know' 9='(9) missing';
VALUE f141_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE c31d_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE c11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to answer';
VALUE a537_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) never cooking'
                1='(1) gas: from underground pipes' 2='(2) gas: bottled, tank, or lp' 3='(3) electricity'
                4='(4) fuel oil, kerosene, etc' 5='(5) coal or coke' 6='(6) charcoal'
                7='(7) solar energy' 8='(8) firewood or straw' 9='(9) other';
VALUE h21_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE b21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE g01_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE c53a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE a53a3_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE f111_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(00) spouse'
                1='(01) sons and daughters-in-law' 2='(02) daughters and sons-in-law'
                3='(03) sons and daughters' 4='(04) grandchildren and their spouse' 5='(05) relatives'
                6='(06) friends/neighbors' 7='(07) social workers' 8='(08) matrons' 9='(09) nobody'
                99='(99) missing';
VALUE d31_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) almost every day'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 9='(9) missing';
VALUE d0beddaf  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for the deceased persons, not applicable for survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 998='(998) more than 1000 days'
                999='(999) missing';
VALUE d4drug1_2f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE c22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three objects correctly' 8='(8) unable to answer'
                9='(9) missing';
VALUE c55_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE f41_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f2ffffff  0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2)  agriculture, forest, animal husbandry' 3='(3) fishery worker'
                4='(4) industrial worker' 5='(5) commercial or service worker' 6='(6) military personnel'
                7='(7) housework' 8='(8) others' 9='(9) missing';
VALUE f64a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE e63_14ff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g14a2_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden all the year around' 999='(999) missing';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE e1b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 100000 days'
                9999='(9999) missing';
VALUE a53a2_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE c54_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE g23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) do not brush'
                1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE h1afffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
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
VALUE h1_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE e4_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE g12_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) can''t turn around'
                99='(99) missing';
VALUE d11vyeaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors';
VALUE resid_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) city'
                2='(2) town' 3='(3) rural';
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
VALUE c55fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE d2respof  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) spouse'
                2='(2) child' 3='(3) spouse of child' 4='(4) grandchild and his/her spouse'
                5='(5) relative' 6='(6) other' 9='(9) missing';
VALUE d0illfff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 87='(87) bedridden not all the time but without information'
                88='(88) bedridden all the time' 99='(99) missing';
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
VALUE d71_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE d11a53a_4f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE f46_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE a54affff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE c55_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2)  hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE e4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d8uncdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE f31_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relatives' 6='(6) local government or community' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE g11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
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
VALUE d11vdayf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE c54_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 0='(0) wrong' 1='(1) correct'
                2='(2) UNDOCUMENTED CODE' 3='(3) UNDOCUMENTED CODE' 8='(8) unable to answer';
VALUE f5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchildren' 8='(08) other relatives' 9='(09) friends and neighbors'
                10='(10) social services' 11='(11) live-in care giver' 12='(12) nobody'
                88='(88) don''t know' 99='(99) missing';
VALUE f34_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) didn''t answer'
                9='(9) missing';
VALUE g14a1_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
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
VALUE f31_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE d5batdaf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE g16fffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE f41_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d0knddrf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 1='(1) very strong liquor' 2='(2) not very strong liquor'
                3='(3) wine' 4='(4) rice wine' 5='(5) beer ' 6='(6) others' 8='(8) don''t know'
                9='(9) missing';
VALUE d6c_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 9='(9) missing';
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
VALUE d2finanf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relatives'
                6='(6) local government or community' 7='(7) own work' 8='(8) others' 9='(9) missing';
VALUE d0vdagef  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for the deceased persons, not applicable for survivors'
                888='(888) don''t know' 999='(999) missing';
VALUE d11a535f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE b28_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE f35_5fff  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE a54b_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE d11painf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE d0otherf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) difficult to classify' 2='(2) no' 3='(3) don''t know' 4='(4) mental disease'
                5='(5) orthopedic disease' 6='(6) internal medical disease' 7='(7) dermatosis'
                8='(8) five sense diseases' 9='(9) gynecological disease';
VALUE d0cargif  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 0='(0) spouse'
                1='(1) children and their spouses' 2='(2) grandchildren and their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social workers' 6='(6) nurse'
                7='(7) no body to take care' 8='(8) no need to take care' 9='(9) missing';
VALUE d11inspf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE g15a1_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3) don''t know' 9='(9)  missing';
VALUE c22fffff  -1='(-1) not applicable, i.e.,repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
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
VALUE d5residf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE d31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) quite often' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE relatiof  0='(0) original sampled person'
                1='(1) first sibling of the original sampled person'
                2='(2) second sibling of the original sampled person'
                3='(3) third sibling of the original sampled person'
                4='(4) fourth sibling of the original sampled person'
                5='(5) fifth sibling or beyond of the original sampled elderly' 9='(9) missing';
VALUE f92a2fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
                9='(9) missing';
VALUE a54b_0ff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE h22fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE g15a3_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less' 3='(3) no'
                9='(9) missing';
VALUE f5_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) spouse'
                2='(2) children and their spouses' 3='(3) grandchild and their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social services' 7='(7) caregiver'
                8='(8) nobody' 9='(9) missing';
VALUE d5_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE d5livarf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE b121_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) unable to answer';
VALUE d0causef  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(01) malignant tumor(cancer)' 2='(02) cvd' 3='(03) heart disease'
                4='(04) respiratory and digest disease' 5='(05) injury and poisoned'
                6='(06) endocrine, nutritional, metabolic, immune diseases'
                7='(07) urinary and reproductive diseases' 8='(08) dementia' 9='(09) neurosis'
                10='(10) tuberculosis (tb)' 11='(11) infectious disease(except tb)' 12='(12) accident'
                13='(13) others' 66='(66) natural death with no reported disease' 88='(88) don''t know'
                99='(99) missing';
VALUE d4mt2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
VALUE d75fffff  -1='(-1) not applicable' 1='(1) very strong liquor' 2='(2) wine'
                3='(3) rice wine' 9='(9) missing';
VALUE g83_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE d0toilff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) fully independent in toileting' 2='(2) partially independent in toileting '
                3='(3) fully dependent in toileting ' 9='(9) missing';
VALUE month_5f  -9='(-9) lost to follow-up at the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons';
VALUE c54_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3) partially';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE d2persof  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE g1063_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) suddenly (over a few days)'
                2='(2) over a few months' 3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE c22_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                -1='(-1) not applicable, i.e.,repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE d85_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 9='(9) missing';
VALUE a54b_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
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
VALUE f46_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE d0bathff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
VALUE c54_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE f103a8_f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE g102c_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                998='(998) more than 1000' 999='(999) missing';
VALUE d31_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 9='(9) missing';
VALUE d91_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE g14a2_0f  -9='(-09) lost to follow-up in the 2000 survey'
                -6='(-06) it is for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden all the year around' 999='(999) missing';
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
VALUE d5_14fff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE a532_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) missing';
VALUE f34_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
VALUE vage_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased';
VALUE h22_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE e1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
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
VALUE f16_14ff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                8='(8) do not know' 9='(9) missing';
VALUE f652_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) public free medical services' 2='(02) cooperative medical scheme'
                3='(03) state and collective subsidies' 4='(04) medical insurance' 5='(05) self'
                6='(06) spouse' 7='(07) children' 8='(08) no money to pay' 9='(09) others'
                99='(99) missing';
VALUE e1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
VALUE d2doctof  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 8='(8) don''t know' 9='(9) missing';
VALUE f32_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3) so so' 8='(8) don''t know';
VALUE re1_14ff  0='(0) without proxy';
VALUE e7_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, independently' 2='(2) yes, but need some help' 3='(3) no, can''t'
                9='(9) missing';
VALUE d0smktif  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE c54_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE b21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4) seldom' 5='(5) never' 8='(8) unable to answer';
VALUE d2wcfacf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
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
VALUE f43a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE d11a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE e1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE f64i_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE d2knddrf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer ' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE h5_14fff  888='(888) don''t know';
VALUE d77_14ff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE a53a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE d5_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) boiled water'
                2='(2) unboiled water' 9='(9) missing';
VALUE d0doctof  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 1='(1) no' 2='(2) yes' 8='(8) don''t know' 9='(9) missing';
VALUE a53a3_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) male' 2='(2) female' 9='(9) missing';
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
VALUE d2whopaf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) shared by children living with'
                5='(05)  shared by all children and grandchildren' 6='(06) cooperative medical scheme'
                7='(07) state or collectives subsidy' 8='(08) medical insurance' 9='(09) no money to pay'
                10='(10) others' 88='(88) don''t know' 99='(99) missing';
VALUE g51_0fff  -9='(-09) lost to follow-up in the 2000 survey'
                -6='(-06) it is for survivors, not applicable for the deceased persons'
                999='(999) missing';
VALUE g15a1_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9) missing';
VALUE f92a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE a530_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                9='(9) missing';
VALUE g511_14f  888='(888) do not know' 999='(999) missing';
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
VALUE d11retyf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE a542_14f  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d5licdof  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 9='(9) missing';
VALUE d11g4fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f1033_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who live in other village/district/city' 8='(8) not able to answer'
                9='(9) missing';
VALUE d2bedrif  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE d0wcfacf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 0='(0) no'
                1='(1) yes' 8='(8) don''t know' 9='(9) missing';
VALUE c32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) can''t use pen to draw the figure'
                9='(9) not able to do this (disabled)';
VALUE a535_14f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE g11fffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                9='(9) missing';
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
VALUE d0finanf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relatives' 6='(6) local government or community' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE d0moveff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) fully independent in indoor transferring'
                2='(2) partially independent in indoor transferring'
                3='(3) fully dependent in indoor transferring' 9='(9) missing';
VALUE d2vageff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) the deceased persons only, not applicable to survivors';
VALUE f64a_14f  0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 9='(9) missing';
VALUE d1_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) other' 9='(9) missing';
VALUE d0actdaf  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for the deceased persons, not applicable for survivors'
                888='(888) don''t know' 998='(998) more 1000 days' 999='(999) missing';
VALUE d75_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE a54a_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE f21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE g6_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) regular'
                2='(2) irregular' 9='(9) missing';
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
VALUE b210_14f  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE f64_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) public medicare' 2='(2) self' 3='(3) family and children' 4='(4) others'
                9='(9) missing';
VALUE e3_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
VALUE d11whopf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE d2bathff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
VALUE d2livarf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE a53a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d0unfinf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable (finished)' 1='(1) refusal' 2='(2) others';
VALUE g4a_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e2_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
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
VALUE resid_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) city' 2='(2) town'
                3='(3) county';
VALUE dth05_0f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2008 survey' 1='(1) died before the 2008 survey';
VALUE a53a2_2f  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE d11dplaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE e3_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
VALUE d0feedff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) fully independent in feeding' 2='(2) partially independent in feeding'
                3='(3) fully dependent in feeding' 9='(9) missing';
VALUE g15a1_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9) missing';
VALUE resid_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE f12a_14f  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE b121_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE d0persof  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                88='(88) don''t know' 99='(99) missing';
VALUE g4_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) right hand'
                2='(2) left hand' 9='(9) missing';
VALUE d2_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                88='(88) don''t know' 99='(99) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d5feedff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in eating' 2='(2) partially independent in eating'
                3='(3) fully dependent in eating' 9='(9) missing';
VALUE f34_14ff  1='(1) very rich' 2='(2) rich' 3='(3) so so' 4='(4) poor'
                5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE c31d_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to do' 9='(9) missing';
VALUE ra52_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE ra51_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE g14a2_2f  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden' 999='(999) missing';
VALUE f64e1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d2outdof  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors' 888='(888) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
VALUE d11carpf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE d14d26a_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE ra52_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE g23_14ff  0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day'
                3='(3) twice a day' 4='(4) three or more times a day ' 8='(8) do not know'
                9='(9) not applicable (no teeth)';
VALUE d2causef  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) malignant tumor(cancer)' 2='(02) cvd' 3='(03) heart disease'
                4='(04) respiratory and digest disease' 5='(05) injury and poisoned'
                6='(06) endocrine, nutritional, metabolic, immune diseases'
                7='(07) urinary and reproductive diseases' 8='(08) dementia' 9='(09) neurosis'
                10='(10) tuberculosis (tb)' 11='(11) infectious disease(except tb)' 12='(12) accident'
                13='(13) others' 14='(14) UNDOCUMENTED CODE'
                66='(66) natural death with no reported disease' 88='(88) don''t know' 99='(99) missing';
VALUE d11a53af  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g17a2fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 9='(9) missing';
VALUE e63_5fff  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) do not know' 99999='(99999) missing';
VALUE f47_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE d2incomf  -9='(-0009) lost to follow-up in the 2002 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99999='(99999) missing';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d0hyperf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) yes'
                2='(2) no' 3='(3) don''t know' 9='(9) missing';
VALUE d8dirdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE f151_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE g11_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
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
VALUE d4a_14ff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE g4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE d14knddf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE e62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE d5smktif  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                99='(99) missing';
VALUE d10affff  1='(1) almost everyday' 2='(2) sometimes' 3='(3) never' 9='(9) missing';
VALUE f41_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d5contff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in continence' 2='(2) partially independent in continence'
                3='(3) fully dependent in continence' 9='(9) missing';
VALUE a52_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                99='(99) missing';
VALUE a532_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE e6b_8fff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE h71_14ff  -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
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
VALUE d31_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) almost everyday' 2='(2) except winter' 3='(3) occasionally'
                4='(4) rarely or never' 9='(9) missing';
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
VALUE d5vmontf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 99='(99) missing';
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
VALUE f92a5fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE d12_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
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
VALUE g83_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                9='(9) missing';
VALUE d11a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE e64_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE g14a1_2f  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 1='(001) hypertension' 2='(002) diabetes'
                3='(003) heart diseases' 4='(004) stroke, cvd'
                5='(005) bronchitis, emphysema, asthma, pneumonia' 6='(006)  pulmonary tuberculosis'
                7='(007) cataract' 8='(008) glaucoma' 9='(009) cancer' 10='(010) prostate'
                11='(011) gastric or duodenal ulcer' 12='(012) parkinson''s disease' 13='(013) bedsore'
                14='(014) arthritis' 15='(015) dementia' 160='(160) other'
                161='(161) diseases difficult to classify' 164='(164) mental diseases'
                165='(165) orthopedic diseases' 166='(166) internal medical diseases'
                167='(167) dermatosis' 168='(168) five organs diseases'
                169='(169) gynecological diseases';
VALUE e67_5fff  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE g511_11f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) don''t know'
                999='(999) missing';
VALUE c11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE f31_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE g1062_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE f340_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) make decisions on almost all spending in household'
                2='(2) make decisions on own and small other spending in household'
                3='(3) make decisions on almost all spending in household'
                4='(4) can''t make decisions on any spending ' 5='(5) don''t know' 9='(9) missing';
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
VALUE e2_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
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
VALUE d0sexfff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) male'
                2='(2) female';
VALUE d5carpaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 9='(9) missing';
VALUE d0whopaf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children living with' 5='(05)  shared by children and grandchildren'
                6='(06) grandchildren' 7='(07) cooperative medical scheme' 8='(08) state or collectives'
                9='(09) medical insurance' 10='(10) no money to pay' 11='(11) others'
                88='(88) don''t know' 99='(99) missing';
VALUE f16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE a52_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                99='(99) missing';
VALUE f25b1_1f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE ra2fffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE g12_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                88='(88) can''t turn around' 99='(99) missing';
VALUE d5marryf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE e6_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE d14hypef  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a53a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d5cargif  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children/their spouses' 2='(2) grandchildren/their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social service providers'
                6='(6) nurse/maid' 7='(7) no body ' 8='(8) do not need care' 9='(9) missing';
VALUE f103a2__2f  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
                8='(8) don''t know' 9='(9) missing';
VALUE b210_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) all day long'
                2='(2) most of the day' 3='(3) about half of the day' 4='(4) less than half of the day'
                8='(8) not able to answer' 9='(9) missing';
VALUE f34_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3) so so' 8='(8) don''t know' 9='(9) missing';
VALUE month_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 99='(99) missing';
VALUE e1a_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) spouse of son' 4='(04) daughter'
                5='(05) spouse of daughter' 6='(06) son and daughter together' 7='(07) grandchildren'
                8='(08) other family members' 9='(09) social services' 10='(10) matron' 11='(11) none'
                99='(99) missing';
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
VALUE d2cargif  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children and their spouses' 2='(2) grandchildren and their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social workers' 6='(6) nurse'
                7='(7) no body to take care' 8='(8) no need to take care' 9='(9) missing';
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
VALUE a51_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) with household members'
                2='(2) alone' 3='(3)  in an institution' 9='(9) missing';
VALUE a531_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE provffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang' 31='(31) shanghai'
                32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi'
                37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan' 44='(44) guangdong'
                45='(45) guangxi' 50='(50) chongqing' 51='(51) sichuan' 61='(61) shaanxi';
VALUE e63_8fff  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d0provif  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 11='(11) beijing'
                12='(12) tianjian' 13='(13) hebei' 14='(14) shanxi' 21='(21) liaoning' 22='(22) jilin'
                23='(23) helongjiang' 31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang'
                34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan'
                42='(42) hubei' 43='(43) hunan' 44='(44) guangdong' 45='(45) guangxi' 50='(50) chongqing'
                51='(51) sichuan' 61='(61) shaanxi';
VALUE g1063_1_1f  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d4mt2_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
VALUE f211_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE g132_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE a531_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives '
                5='(5) other non-relatives' 8='(8) don''t know' 9='(9) missing';
VALUE g131_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE a531_14f  -1='(-1) not applicable' 1='(1) self or spouse' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 8='(8) don''t know'
                9='(9) missing';
VALUE g6_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) regular'
                2='(2) irregular' 9='(9) missing';
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
VALUE a53a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE a51fffff  1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution'
                9='(9) missing';
VALUE a54a_2ff  -9='(-009) lost to follow-up in the 2002 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -6='(-006) survivors only, not applicable to the deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d8batdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE c11_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer';
VALUE g14a1_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases'
                4='(04) stroke, cvd' 5='(05)  bronchitis, emphysema, asthma, pneumonia'
                6='(06) pulmonary tuberculosis' 7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer'
                10='(10) prostate tumor' 11='(11)  gastric or duodenal ulcer'
                12='(12) parkinson''s disease' 13='(13) bedsore' 14='(14) arthritis' 15='(15) dementia'
                16='(16) other' 66='(66) natural senescence without reporting any disease'
                89='(89) don''t know' 99='(99) missing';
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
VALUE d5dirdaf  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 999='(999) missing';
VALUE g15a3_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE d0residf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE f43a2_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d11c_14f  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 8='(8) do not know' 9='(9) missing';
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
VALUE c16fffff  88='(88) not able to answer' 99='(99) missing';
VALUE d0licdof  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 1='(1) licensed with college degree'
                2='(2) licensed without college degree' 3='(3) unlicensed' 8='(8) don''t know'
                9='(9) missing';
VALUE c53a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to do' 9='(9) missing';
VALUE d0contff  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) fully independent in continence' 2='(2) partially independent in continence'
                3='(3) fully dependent in continence' 9='(9) missing';
VALUE g9_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
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
VALUE d85_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) very strong liquor' 2='(2) not very strong liquor'
                3='(3) wine' 4='(4) rice wine' 5='(5)  beer' 6='(6) others' 9='(9) missing';
VALUE d5afffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE g1061_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) left' 2='(2) right'
                3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE g1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see' 4='(4) blind'
                9='(9) missing';
VALUE dth00_0f  -9='(-9) lost to follow-up at the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2002 survey' 1='(1) died before the 2002 survey';
VALUE d8hyperf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE f16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE g15p1_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) difficult to classify' 2='(2) no' 3='(3) don''t know' 4='(4) mental disease'
                5='(5) orthopedic disease' 6='(6) internal medical disease' 7='(7) dermatosis'
                8='(8) five organs diseases' 9='(9) gynecological disease';
VALUE d5doctof  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 9='(9) missing';
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
VALUE e1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
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
VALUE ra53afff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                9='(9) missing';
VALUE d5incomf  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                99999='(99999) missing';
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
VALUE g1_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) can see and distinguish the break in the circle' 2='(2) can''t see' 3='(3) blind'
                9='(9) missing';
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
VALUE g14fffff  88='(88) can''t turn around' 99='(99) missing';
VALUE f27_14ff  1='(1) not worth' 2='(2) not necessary'
                3='(3) cannot afford to the payment' 8='(8) do not know' 9='(9) missing';
VALUE g4ffffff  1='(1) right-hand' 2='(2) left-hand' 9='(9) missing';
VALUE a535_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9) missing';
VALUE e610_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) not able to answer' 99='(99) missing';
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
VALUE h21_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3) partially able to' 9='(9) missing';
VALUE h71_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of children'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver' 8='(8) others' 9='(9) missing';
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
VALUE d4mt2_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) almost every day'
                2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
VALUE g4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 9='(9) missing';
VALUE g9_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without using hands'
                2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE f45_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d14g102f  -9='(-09) lost to follow-up in the 2014 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE e2_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE a540_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) don''t own house/apartment but want to separate from children'
                4='(4) easy contact with other older persons' 5='(5) others' 9='(9) missing';
VALUE a531_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 9='(9) missing';
VALUE f610_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                -1='(-1) not applicable (not sick)' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience in movement' 4='(4) nobody to go with' 5='(5) didn''t want to go'
                6='(6) other' 9='(9) missing';
VALUE h3_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
VALUE d14bedrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a41bffff  88='(88) don''t know' 99='(99) missing';
VALUE f103a5_f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) co-reside with the sampled elder' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE d5cfffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 9='(9) missing';
VALUE d2vyearf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors';
VALUE g11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11insuf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE month98f  99='(99) missing since these respondents were not interviewed in 2000';
VALUE a52_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE e62_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 5='(5) don''t know' 9='(9) missing';
VALUE e0_14fff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) other' 9='(9) missing';
VALUE d0dplacf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institution' 4='(4) others' 8='(8) don''t know' 9='(9) missing';
VALUE f45_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) professional or technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) staff/service workers/ industrial workers' 3='(3) self-employer'
                4='(4) agricultural, forestry, animal husbandry, fishery personnel' 5='(5) housework'
                6='(6) military personnel' 7='(7) unemployed' 8='(8) others' 9='(9) missing';
VALUE f43a4fff  -1='(-1) not applicable' 1='(1) good' 2='(2) so so' 3='(3) bad'
                8='(8) don''t know' 9='(9) missing';
VALUE d14cargf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body' 9='(9) do not need care';
VALUE e7_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE d4milk1f  1='(1) almost everyday' 2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE c521_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                9='(9) missing';
VALUE d8knddrf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f103a6_f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(00) UNDOCUMENTED CODE' 88='(88) don''t know' 99='(99) missing';
VALUE h22_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE g1061_1_1f  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE e1b_5fff  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -6='(-006) survivors only, not applicable to the deceased persons'
                -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE g13_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                0='(00) no serious illness' 88='(88) bedridden all the year around' 99='(99) missing';
VALUE d5bedrif  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                9='(9) missing';
VALUE g83_14ff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
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
VALUE d2marryf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married and living with spouse' 2='(2)  married but separate with spouse'
                3='(3) divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE a532_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE d0livarf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                0='(0) institution' 1='(1) alone due to never married'
                2='(2) alone due to widowed or divorced' 3='(3) with spouse only'
                4='(4) with married children and grandchildren' 5='(5) with grandchildren only'
                6='(6) with unmarried children and offspring' 7='(7) other relatives' 8='(8) others'
                9='(9) missing';
VALUE residenf  1='(1) urban (city and town)' 2='(2) rural';
VALUE c22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE a53a2_0f  -9='(-09) lost to follow-up in the 2000 survey'
                -6='(-06) it is for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE h21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partly' 9='(9) missing';
VALUE ra51_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE b28_14ff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d0b_agef  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for the deceased persons, not applicable for survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE c16_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) not able to answer' 99='(99) missing';
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
VALUE d1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat'
                5='(5) other' 9='(9) missing';
VALUE d14a535f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE g4_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) right hand'
                2='(2) left hand' 9='(9) missing';
VALUE e6ffffff  1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding'
                9='(9) missing';
VALUE f92a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE g15a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE b11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE h21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE yearin_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased';
VALUE f71fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11a_0ff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) almost everyday' 2='(2) sometimes' 3='(3) never' 9='(9) missing';
VALUE f65_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable (not sick)' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience in movement' 4='(4) nobody to go with' 5='(5) others'
                9='(9) missing';
VALUE h71_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) children and their spouses' 3='(3) grandchildren and their spouses'
                4='(4) great grandchildren and their spouses' 5='(5) siblings'
                6='(6) parents/parents-in-law' 7='(7) caregivers' 8='(8) others' 9='(9) missing';
VALUE e67_8fff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE e5_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2)  occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE f62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) UNDOCUMENTED CODE' 8='(8) didn''t answer' 9='(9) missing';
VALUE f84_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE g51fffff  999='(999) missing';
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
VALUE g12_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) unable to make a turn' 99='(99) missing';
VALUE d85_14ff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE g511_8ff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' 888='(888) don''t know'
                999='(999) missing';
VALUE f12a_5ff  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE d14g106_1f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE g4b_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE a542_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                9='(9) missing';
VALUE d11g4aff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE f35_14ff  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g9_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE h3_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
VALUE d5painff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) very painful'
                2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful' 5='(5) peaceful'
                6='(6) difficult to say' 9='(9) missing';
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
VALUE e65_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) do not know'
                9='(9) missing';
VALUE d8illfff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE f141_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE d8vdayff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE f35_2fff  -9='(-0009) lost to follow-up in the 2002 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                99999='(99999) missing';
VALUE d14a537f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE dth98_0f  -9='(-9) lost to follow-up in the 2000 survey'
                0='(0) still alive at 2000 survey ' 1='(1) died before 2000 survey';
VALUE f41a12__1f  88='(88) do not know' 99='(99) missing';
VALUE d5sexfff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
VALUE f141_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE d8carpaf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) medical insurance' 2='(02) self' 3='(03) spouse' 4='(04) children/grandchildren'
                5='(05) state or collectives' 6='(06) others' 88='(88) don''t know' 99='(99) missing';
VALUE d11marrf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f61_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) no' 3='(3)  not sick recently' 9='(9) missing';
VALUE d8sexfff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
VALUE d5bathff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
VALUE h71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE g81_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE f65_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconveniency in movement'
                4='(4) nobody to go with' 5='(5) don''t want to go to hospital' 6='(6) others'
                9='(9) missing';
VALUE h1bfffff  -1='(-1) not applicable' 9='(9) missing';
VALUE month_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons';
VALUE a53a4_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no education' 2='(2) primary school' 3='(3) middle school' 4='(4) high school'
                5='(5) collage or above' 9='(9) missing';
VALUE e7_14fff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                9='(9) missing';
VALUE d5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE f43a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE resic_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural';
VALUE d2_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE d34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) insipidity' 2='(2) salty'
                3='(3) sweet' 4='(4) hot' 5='(5) crude' 6='(6) do not have all the above tastes'
                8='(8) don''t know' 9='(9) missing';
VALUE d5vyearf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors' 9999='(9999) missing';
VALUE a533_14f  1='(1) detached house' 2='(2) duplex/triplex'
                3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d5beddaf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE b21_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) always'
                2='(2) often' 3='(3) sometimes' 4='(4) seldom' 5='(5) never' 8='(8) not able to answer'
                9='(9) missing';
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
VALUE ra51_0ff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE e4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d78a_14f  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE d8bedrif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d5respof  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) parent'
                1='(1) spouse' 2='(2) child' 3='(3) spouse of a child'
                4='(4) grandchild or spouse of a grandchild' 5='(5) relative' 6='(6) neighbor'
                7='(7) social worker' 8='(8) other' 9='(9) missing';
VALUE f41_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no' 3='(3)  not sick at that time' 9='(9) missing';
VALUE a53a3_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE d5medicf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 9='(9) missing';
VALUE d61fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE b11_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer';
VALUE d33_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) vegetable grease'
                2='(2) gingili grease' 3='(3) lard' 4='(4) other animal''s fat' 8='(8) don''t know'
                9='(9) missing';
VALUE g11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE f651a1_f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE a534_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) do not know'
                9999='(9999) missing';
VALUE d5toilff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in toileting' 2='(2) partially independent in toileting'
                3='(3) fully dependent in toileting' 9='(9) missing';
VALUE h1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE d0medicf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) yes, all the time' 2='(2) yes, sometimes' 3='(3) no' 4='(4) was not ill'
                8='(8) don''t know' 9='(9) missing';
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
VALUE f33_0fff  -9='(-0009) lost to follow-up in the 2000 survey'
                -6='(-0006) it is for survivors, not applicable for the deceased persons'
                0='(00000) no other source' 99999='(99999) missing';
VALUE f85_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE a53a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE rd1_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d0didayf  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 887='(887) bedridden not all the time but without information'
                888='(888) bedridden all the time' 889='(889) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
VALUE d8incomf  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE rf71ffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                2='(2) UNDOCUMENTED CODE' 9='(9) missing';
VALUE d12_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE e5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2)  occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE g14a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
VALUE d2didayf  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 887='(887) bedridden not all the time but without information'
                888='(888) bedridden all the time' 889='(889) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
VALUE d14painf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE a53a1_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE e7_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE f34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
VALUE d11yr1ff  1='(1) UNDOCUMENTED CODE' 2='(2) UNDOCUMENTED CODE';
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g51_2fff  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons' 999='(999) missing';
VALUE g131_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE a43_14ff  1='(1) urban' 2='(2) rural' 8='(8) don''t know' 9='(9) missing';
VALUE g14a2_1_1f  -1='(-01) not applicable' 888='(888) bedridden all the year around'
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
VALUE d71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
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
VALUE f45fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2)  agriculture, forest, animal husbandry' 3='(3) fishery worker'
                4='(4) industrial worker' 5='(5) commercial or service worker' 6='(6) military personnel'
                7='(7) housework' 8='(8) others' 9='(9) missing';
VALUE d5finanf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE f31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE vage_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons';
VALUE a54bffff  -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE d76_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) within 5 minutes'
                2='(2) 6-30 minutes' 3='(3) 31-60 minutes' 4='(4) after 60 minutes' 8='(8) do not know '
                9='(9) missing';
VALUE f43a2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d5wcfacf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE g15a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE c32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) can''t use pen to draw the figure' 9='(9) not able to do this (disabled)';
VALUE a41_14ff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian'
                36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan'
                44='(44) guangdong' 45='(45) guangxi' 46='(46)  hainan' 50='(50) chongqing'
                51='(51) sichuan' 52='(52)  guizhou' 53='(53) yunnan' 54='(54)  tibet' 61='(61) shaanxi'
                62='(62) gansu' 63='(63)  qinghai' 64='(64)  ningxia' 65='(65)  xinjiang'
                71='(71) taiwan' 81='(81) hongkong' 88='(88) don''t know' 90='(90) north korea'
                91='(91) south korea' 92='(92) burma' 93='(93) indonesia' 94='(94)  japan'
                95='(95) vietnam' 96='(96) others' 99='(99) missing';
VALUE d11bathf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE a540_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE f31fffff  1='(1) retirement wage' 2='(2) spouse' 3='(3) children'
                4='(4) grandchildren' 5='(5) other relatives' 6='(6) local government or community'
                7='(7) own work' 8='(8) others' 9='(9) missing';
VALUE f651a_5f  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d5generf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 9='(9) missing';
VALUE d5pcgdaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE g15a1_1_1f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
VALUE b12_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) unable to answer' 9='(9) missing';
VALUE d85_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE g21_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 99='(99) missing';
VALUE d32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a41affff  1='(01) beijing' 2='(02) tianjian' 3='(03) hebei' 4='(04) shanxi'
                5='(05) liaoning' 6='(06) jilin' 7='(07) helongjiang' 8='(08) shanghai' 9='(09) jiangsu'
                10='(10) zhejiang' 11='(11) anhui' 12='(12) fujian' 13='(13) jiangxi' 14='(14) shangdong'
                15='(15) henan' 16='(16) hubei' 17='(17) henan' 18='(18) guangdong' 19='(19) guangxi'
                20='(20) sichuan' 21='(21) chongqing' 22='(22) shaanxi' 88='(88) don''t know'
                99='(99) missing';
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
VALUE e6_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE d5knddrf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 9='(9) missing';
VALUE d2medicf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) yes, all the time' 2='(2) yes, sometimes' 3='(3) no' 4='(4) was not ill'
                8='(8) don''t know' 9='(9) missing';
VALUE a541_14f  -1='(-001) not applicable' 8888='(8888) don''t know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE d6c_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water (including purified water)' 9='(9) missing';
VALUE ra52_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE g13_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) bedridden'
                99='(99) missing';
VALUE f340_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE d0marryf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                1='(1) married and living with spouse' 2='(2)  married but separate with spouse'
                3='(3) divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE d11g106_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE e7_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE d11didaf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d14vdayf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE g14a1_1_1f  -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes'
                3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) epilepsy'
                17='(17) cholecystitis, cholelith disease' 18='(18) blood disease'
                19='(19) chronic nephritis' 20='(20) galactophore disease' 21='(21) galactophore disease'
                22='(22) uterine tumor' 23='(23) hyperplasia of prostate gland' 24='(24) hepatitis'
                25='(25) other' 66='(66) natural senescence without reporting any disease'
                88='(88) don''t know' 99='(99) missing';
VALUE ra52_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d6c_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 9='(9) missing';
VALUE d4meat1f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                8='(8) don''t know' 9='(9) missing';
VALUE f43a4_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE d11knddf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE f5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(01) spouse'
                2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law'
                6='(06) son and daughter' 7='(07) grandchildren' 8='(08) other relatives'
                9='(09) friends and neighbors' 10='(10) social services' 11='(11) live-in care giver'
                12='(12) nobody' 99='(99) missing';
VALUE g1ffffff  1='(1) can see and distinguish the break in the circle'
                2='(2) can see but can''t distinguish the break in the circle' 3='(3) can''t see'
                4='(4) blind' 9='(9) missing';
VALUE a542_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE g81_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right hand only'
                2='(2) left hand only' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE a532_14f  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) do not know'
                9='(9) missing';
VALUE a54a_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE c11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE g01_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE f41_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3) divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE s1ffffff  -1='(-1)  not applicable' 1='(1) the elder''s age is not correct'
                2='(2) doubt about the elder''s age' 3='(3) have no idea about the elder''s age'
                4='(4) not sure for elder''s age' 5='(5) sure for elder''s age' 9='(9) missing';
VALUE d5whopaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE d8smktif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE a541_5ff  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -6='(-006) survivors only, not applicable to the deceased persons'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE d85_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) very strong liquor'
                2='(2) not  very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5) beer'
                6='(6) others' 9='(9) missing';
VALUE g15a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE d8bathff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE g9_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
VALUE d5medcof  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) do not know' 99999='(99999) missing';
VALUE e6b_14ff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE g14a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
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
VALUE f12a_2ff  -9='(-0009) lost to follow-up in the 2002 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 0='(00000) spouse' 99999='(99999) missing';
VALUE d5didayf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 9999='(9999) missing';
VALUE d11doctf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE c16_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                88='(88) not able to answer';
VALUE f31_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) retirement wages'
                2='(2) spouse' 3='(3) child(ren)' 4='(4) grandchild(ren' 5='(5) relative(s)'
                6='(6) local government or community' 7='(7) work' 8='(8)  others' 9='(9) missing';
VALUE d2batdaf  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE d2hyperf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE d5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE rd12_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0)  without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE g13fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE d34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) insipidity'
                2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE d14dresf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE d77_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) at much less risk'
                2='(2) at less risk' 3='(3) at the same risk' 4='(4) at higher risk'
                5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE f21_14ff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE g101ffff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 9='(9) missing';
VALUE d11livaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home '
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE a53a1_0f  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 0='(0) spouse' 1='(1) child' 2='(2) spouse of child'
                3='(3) grandchild' 4='(4)  spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE f62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) didn''t answer' 9='(9) missing';
VALUE f104_14f  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE a53a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) UNDOCUMENTED CODE' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE e65_14ff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) not able to answer' 9='(9) missing';
VALUE d0vyearf  -9='(-009) lost to follow-up in the 2000 survey'
                -7='(-007) it is for the deceased persons, not applicable for survivors'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE b21_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) always'
                2='(2) often' 3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer';
VALUE e65_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE g15n1a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9)  missing';
VALUE h3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) surprisingly healthy'
                2='(2) relatively healthy' 3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE g6_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) regular'
                2='(2) irregular' 9='(9) missing';
VALUE d11a_14f  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE c16_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 88='(88) unable to answer';
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
VALUE f104_2ff  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable ' 888='(888) don''t know' 999='(999) missing';
VALUE f43a2fff  -1='(-1) not applicable' 1='(1) married' 2='(2) divorced' 3='(3) widowed'
                4='(4) UNDOCUMENTED CODE' 8='(8) don''t know' 9='(9) missing';
VALUE a51_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE f111a_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(00) spouse'
                1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) do not know' 99='(99) missing';
VALUE f92a6fff  -1='(-1) not applicable' 1='(1) same village' 2='(2) same town/district'
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
VALUE h22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE g4b_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE a54b_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE g21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 99='(99) missing';
VALUE d8finanf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE d5dresff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in dressing' 2='(2) partially independent in dressing'
                3='(3) fully dependent in dressing' 9='(9) missing';
VALUE g15a3_1_1f  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE d0outdof  -9='(-09) lost to follow-up in the 2000 survey'
                -7='(-07) it is for the deceased persons, not applicable for survivors'
                888='(888) don''t know' 998='(998) more than 1000 days' 999='(999) missing';
VALUE a530_14f  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 8='(8) don''t know' 9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE f22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) 8888 "don''t know" 9999 "missing"';
VALUE e64_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) do not know' 9='(9) missing';
VALUE f92a2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE f43a2_1_1f  -1='(-1) not applicable' 1='(1) married' 2='(2) divorced' 3='(3) widowed'
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
VALUE d71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE dth11_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2014 survey' 1='(1) died before the 2014 survey';
VALUE g1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) cannot see' 4='(4) blind'
                9='(9) missing';
VALUE d0diseaf  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes' 3='(03) heart disease'
                4='(04) stroke or cvd' 5='(05) bronchitis, emphysema, pneumonia,asthma'
                6='(06) tuberculosis' 7='(07) glaucoma, cataract' 8='(08) prostate tumor'
                9='(09) gastric or duodenal ulcer' 10='(10) parkinson''s disease' 11='(11) bedsore'
                12='(12) dementia' 13='(13) psychosis' 14='(14) neurosis' 15='(15) arthritis'
                16='(16) others' 66='(66) natural senescence without reporting disease'
                87='(87) bedridden not all the time but without information'
                88='(88) bedridden all the time but no disease information' 89='(89) don''t know'
                99='(99) missing';
VALUE a51_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE d11payif  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                8888='(08888) don''t know' 9998='(09998) more than 10000' 9999='(09999) missing'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d11wcfaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE s1_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 1='(1) the elder''s age is not correct'
                2='(2) doubt about the elder''s age' 3='(3) have no idea about the elder''s age'
                4='(4) not sure for elder''s age' 5='(5) sure for elder''s age' 9='(9) missing';
VALUE f23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE d11resif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE d0bedrif  -9='(-9) lost to follow-up in the 2000 survey'
                -7='(-7) it is for the deceased persons, not applicable for survivors' 1='(1) no'
                2='(2) yes' 8='(8) don''t know' 9='(9) missing';
VALUE h22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE e4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE ra54_0ff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for the deceased persons, not applicable for survivors'
                -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE a54a_5ff  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -6='(-006) survivors only, not applicable to the deceased persons'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d5moveff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in indoor transferring'
                2='(2) partially independent in indoor transferring'
                3='(3) fully dependent in indoor transferring' 9='(9) missing';
VALUE d14dreaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE g9_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
VALUE e65_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE f23_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
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
VALUE b121_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE a531_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE ra51_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
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
VALUE f71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE b11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) unable to answer';
VALUE g17a1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know' 9='(9)  missing';
VALUE d5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE f211_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, retired as a normally retiree' 2='(2) yes, retired as a high officer'
                3='(3) no' 9='(9) missing';
VALUE d1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat'
                5='(5) other' 9='(9) missing';
VALUE e6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE f5ffffff  1='(1) spouse' 2='(2) children, grandchild and their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social services' 6='(6) caregiver'
                7='(7) nobody' 9='(9) missing';
VALUE a541_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d11g4bff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE a54b_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE monthinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 99='(99) missing';
VALUE a54a_0ff  -9='(-009) lost to follow-up in the 2000 survey'
                -6='(-006) it is for survivors, not applicable for the deceased persons'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE d2licdof  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) don''t know' 9='(9) missing';
VALUE f103a5__3f  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d11g106f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE d2beddaf  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 998='(998) more than 1000 days'
                999='(999) missing';
VALUE f16_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (/with spouse)and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE e0_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, strongly limited'
                2='(2) yes, limited' 3='(3) not limited' 8='(8) do not know' 9='(9) missing';
VALUE a42fffff  1='(1) urban' 2='(2) rural' 9='(9) missing';
VALUE e5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4) seldom'
                5='(5) never' 8='(8)  not able to answer' 9='(9) missing';
VALUE a52fffff  99='(99) missing';
VALUE g81_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE d11a_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once a week' 3='(3) not weekly, but at least once a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE f21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE d2actdaf  -9='(-09) lost to follow-up in the 2002 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                0='(000) activity-hour is longer than bedridden-hour in a day' 888='(888) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
VALUE f141_14f  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE f25b1_1_1f  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
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
VALUE f103a5__2f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE f610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable (not sick)'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconvenience to travel'
                4='(4) nobody to go with' 5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE s2ffffff  -1='(-1) not applicable' 1='(1) the elder''s age is not correct'
                2='(2) doubt about the elder''s age' 3='(3) have no idea about the elder''s age'
                4='(4) not sure for elder''s age' 5='(5) sure for elder''s age' 9='(9) missing';
VALUE d34_14ff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE f34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very rich' 2='(2) rich'
                3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE h81fffff  -1='(-1) not applicable' 1='(1) spouse'
                2='(2) children or spouse of children' 3='(3) grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver' 8='(8) others' 9='(9) missing';
VALUE a53b3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE a52_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE b11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer'
                9='(9) missing';
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
VALUE a52_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable' 99='(99) missing';
VALUE a53a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE d2illfff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                87='(87) bedridden not all the time but without information'
                88='(88) bedridden all the time' 99='(99) missing';
VALUE a53a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 9='(9) missing';
VALUE d14livaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home'
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE d5dreamf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                3='(3) do not know' 9='(9) missing';
VALUE f651a_8f  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE a53a1_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g132_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE f43a2_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d11medcf  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f64a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE d1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) rice'
                2='(2) corn (maize)' 3='(3) wheat (noodles and bread, etc.)' 4='(4) nice and wheat'
                5='(5) others';
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
VALUE f61fffff  1='(1) yes' 2='(2) no' 3='(3)  no sick recently' 9='(9) missing';
VALUE ra51_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE h71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE d8residf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE d2residf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE g12_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) can''t turn around' 99='(99) missing';
VALUE b121_14f  1='(1) much better' 2='(2) a little better' 3='(3) no change'
                4='(4) a little worse' 5='(5) much worse' 8='(8) not able to answer' 9='(9)  missing';
VALUE a541_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased persons' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE e64_14ff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children and their spouses' 4='(4) grandchildren and their spouses'
                5='(5) public and collectives' 6='(6) others' 8='(8) not able to answer' 9='(9) missing';
VALUE g81_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know'
                9='(9) missing';
VALUE e6_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE c16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) not able to answer'
                99='(99) missing';
VALUE f64_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) public medicare'
                2='(2) self' 3='(3) family and children' 4='(4) others' 9='(9) missing';
VALUE e1_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE e610_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) do not know' 99='(99) missing';
VALUE g81_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right hand' 2='(2) left hand'
                3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE d11medif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) was not sick' 8='(8) do not know' 9='(9) missing';
VALUE d4meat2_2f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE a530_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                8='(8) don''t know' 9='(9) missing';
VALUE dth02_0f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2005 survey' 1='(1) died before the 2005 survey';
VALUE jige_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE d8dreamf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                3='(3) do not know' 8='(8) don''t know' 9='(9) missing';
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
VALUE d11cargf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body ' 9='(9) do not need care';
VALUE h1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite using hearing aid' 4='(4) can''t' 9='(9) missing';
VALUE c22_0fff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable, i.e.,repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
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
VALUE f111a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) spouse' 1='(01) son'
                2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d8medicf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 8='(8) don''t know' 9='(9) missing';
VALUE f5_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(00) UNDOCUMENTED CODE' 1='(01) spouse' 2='(02) sons and their spouses'
                3='(03) daughters and their spouses' 4='(04) grandchildren and their spouses'
                5='(05) relatives' 6='(06) friends/neighbors' 7='(07) social services' 8='(08) matron'
                9='(09) nobody' 99='(99) missing';
VALUE h3_0ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
VALUE d2diseaf  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart disease' 4='(04) stroke or cvd'
                5='(05) bronchitis, emphysema, pneumonia,asthma' 6='(06) tuberculosis'
                7='(07) glaucoma, cataract' 8='(08) prostate tumor' 9='(09) gastric or duodenal ulcer'
                10='(10) parkinson''s disease' 11='(11) bedsore' 12='(12) dementia' 13='(13) psychosis'
                14='(14) neurosis' 15='(15) arthritis' 16='(16) others'
                88='(88) bedridden all the time but no disease information' 99='(99) missing';
VALUE d14genef  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE g51_5fff  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons' 999='(999) missing';
VALUE d5diseaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05) bronchitis, emphysema, asthma,  pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cancer' 8='(08) cataract or glaucoma' 9='(09) prostate tumor'
                10='(10) gynecological disease' 11='(11) gastric or duodenal ulcer'
                12='(12) parkinson''s disease' 13='(13) bedsore' 14='(14) dementia' 15='(15) psychosis'
                16='(16) neurosis' 17='(17) arthritis' 18='(18) other' 88='(88) don''t know'
                99='(99) missing';
VALUE c16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) not able to answer'
                99='(99) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0001;
INFILE "&VERSION\DS0001\36692-0001-Data.txt" LRECL=10711;
INPUT
       ID 1-8                  YEAR9899 9-12
        MONTH98 13-14           DATE98 15-16            V_BTHYR 17-20
        V_BTHMON 21-22          PROV 23-24              RELATION 25
        RELATYPE 26-27          RESIDENC 28             TRUEAGE 29-31
        RA1 32                  A1 33                   RA2 34
        A2 35                   RA41 36                 A41A 37-38
        A41B 39-40              RA42 41                 A42 42
        RA51 43                 A51 44                  RA52 45-46
        A52 47-48               RA53A 49-50             A53A1 51-52
        A53A2 53-55             A53A3 56-57             RA53B 58-59
        A53B1 60-61             A53B2 62-64             A53B3 65-66
        RA53C 67-68             A53C1 69-70             A53C2 71-73
        A53C3 74-75             RA53D 76-77             A53D1 78-79
        A53D2 80-82             A53D3 83-84             RA53E 85-86
        A53E1 87-88             A53E2 89-91             A53E3 92-93
        RA53F 94-95             A53F1 96-97             A53F2 98-100
        A53F3 101-102           RA53G 103-104           A53G1 105-106
        A53G2 107-109           A53G3 110-112           RA53H 113-114
        A53H1 115-116           A53H2 117-119           A53H3 120-122
        RA53I 123-124           A53I1 125-126           A53I2 127-129
        A53I3 130-131           RA53J 132-133           A53J1 134-135
        A53J2 136-138           A53J3 139-140           RA53K 141-142
        A53K1 143-144           A53K2 145-147           A53K3 148-149
        RA53L 150-151           A53L1 152-153           A53L2 154-156
        A53L3 157-158           RA54 159-160            A54A 161-164
        A54B 165-166            B11 167                 B12 168
        B21 169                 B22 170                 B23 171
        B24 172                 B25 173                 B26 174
        B27 175                 C11 176                 C12 177
        C13 178                 C14 179                 C15 180
        C16 181-182             C21A 183                C21B 184
        C21C 185                C22 186-187             C31A 188
        C31B 189                C31C 190                C31D 191
        C31E 192                C32 193                 C41A 194
        C41B 195                C41C 196                C51A 197
        C51B 198                C52 199                 C53A 200
        C53B 201                C53C 202                C54 203
        C55 204-205             RD1 206                 D1 207
        RD2 208                 D2 209-210              RD31 211
        D31 212                 RD32 213                D32 214
        RD4MEAT 215             D4MEAT1 216             D4MEAT2 217
        RD4FISH 218             D4FISH1 219             D4FISH2 220
        RD4EGG 221              D4EGG1 222              D4EGG2 223
        RD4BEAN 224             D4BEAN1 225             D4BEAN2 226
        RD4VEG 227              D4VEG1 228              D4VEG2 229
        RD4SUGA 230             D4SUGA1 231             D4SUGA2 232
        RD4TEA 233              D4TEA1 234              D4TEA2 235
        RD4GARL 236             D4GARL1 237             D4GARL2 238
        RD5 239                 D5A 240                 D5B 241
        D5C 242                 RD61 243                D61 244
        RD62 245-246            D62 247                 RD63 248-249
        D63 250-252             RD64 253-254            D64 255-257
        RD65 258-259            D65 260-261             RD71 262
        D71 263                 RD72 264-265            D72 266
        RD73 267-268            D73 269-271             RD74 272-273
        D74 274-276             RD75 277-278            D75 279-280
        RD76 281-282            D76 283-284             RD81 285
        D81 286                 RD82 287-288            D82 289
        RD83 290-291            D83 292-294             RD84 295-296
        D84 297-299             RD91 300                D91 301
        RD92 302-303            D92 304-306             RD93 307-308
        D93 309-311             RD10A 312               D10A 313
        RD10B 314               D10B 315                RD10C 316
        D10C 317                RD10D 318               D10D 319
        RD10E 320               D10E 321                RD10F 322
        D10F 323                RD10G 324               D10G 325
        RD10H 326               D10H 327                RE1 328
        E1 329                  RE2 330                 E2 331
        RE3 332                 E3 333                  RE4 334
        E4 335                  RE5 336                 E5 337
        RE6 338                 E6 339                  RF1 340-341
        F1 342-343              RF2 344-345             F2 346
        RF31 347                F31 348                 RF32 349
        F32 350                 RF41 351                F41 352
        RF42 353-354            F42 355-356             RF43A 357-358
        F43A1 359-361           F43A2 362-363           F43A3 364-366
        F43A4 367-368           RF43B 369-370           F43B1 371-373
        F43B2 374-375           F43B3 376-378           F43B4 379-380
        RF43C 381-382           F43C1 383-385           F43C2 386-387
        F43C3 388-390           F43C4 391-392           RF43D 393-394
        F43D1 395-397           F43D2 398-399           F43D3 400-402
        F43D4 403-404           RF44 405-406            F44 407-408
        RF45 409-410            F45 411-412             RF5 413
        F5 414                  RF61 415                F61 416
        RF62 417-418            F62 419                 RF63 420-421
        F63 422                 RF64 423                F64 424
        RF65 425                F65 426                 RF71 427-428
        F71 429                 RF72 430-431            F72 432-434
        RF73 435-436            F73 437-439             RF81 440-441
        F81 442                 RF82 443-444            F82 445-447
        RF83 448-449            F83 450-452             RF84 453-454
        F84 455                 RF9 456-457             F9 458-459
        RF91 460-461            F91 462-463             RF92A 464-465
        F92A1 466-467           F92A2 468-469           F92A3 470-471
        F92A4 472-474           F92A5 475-476           F92A6 477-478
        RF92B 479-480           F92B1 481-482           F92B2 483-484
        F92B3 485-486           F92B4 487-489           F92B5 490-491
        F92B6 492-493           RF92C 494-495           F92C1 496-497
        F92C2 498-499           F92C3 500-501           F92C4 502-504
        F92C5 505-506           F92C6 507-508           RF92D 509-510
        F92D1 511-512           F92D2 513-514           F92D3 515-516
        F92D4 517-519           F92D5 520-521           F92D6 522-523
        RF92E 524-525           F92E1 526-527           F92E2 528-529
        F92E3 530-531           F92E4 532-534           F92E5 535-536
        F92E6 537-538           RF92F 539-540           F92F1 541-542
        F92F2 543-544           F92F3 545-546           F92F4 547-549
        F92F5 550-551           F92F6 552-553           RF92G 554-555
        F92G1 556-557           F92G2 558-559           F92G3 560-561
        F92G4 562-564           F92G5 565-566           F92G6 567-568
        RF92H 569-570           F92H1 571-572           F92H2 573-574
        F92H3 575-576           F92H4 577-579           F92H5 580-581
        F92H6 582-583           RF92I 584-585           F92I1 586-587
        F92I2 588-589           F92I3 590-591           F92I4 592-594
        F92I5 595-596           F92I6 597-598           RF92J 599-600
        F92J1 601-602           F92J2 603-604           F92J3 605-606
        F92J4 607-609           F92J5 610-611           F92J6 612-613
        RF92K 614-615           F92K1 616-617           F92K2 618-619
        F92K3 620-621           F92K4 622-624           F92K5 625-626
        F92K6 627-628           RF92L 629-630           F92L1 631-632
        F92L2 633-634           F92L3 635-636           F92L4 637-639
        F92L5 640-641           F92L6 642-643           RF92M 644-645
        F92M1 646-647           F92M2 648-649           F92M3 650-651
        F92M4 652-654           F92M5 655-656           F92M6 657-658
        RF92N 659-660           F92N1 661-662           F92N2 663-664
        F92N3 665-666           F92N4 667-669           F92N5 670-671
        F92N6 672-673           RF92O 674-675           F92O1 676-677
        F92O2 678-679           F92O3 680-681           F92O4 682-684
        F92O5 685-686           F92O6 687-688           RF10 689-690
        F10 691-692             RF101A 693-694          F101A1 695-696
        F101A2 697-698          F101A3 699-701          F101A4 702-703
        F101A5 704-705          RF101B 706-707          F101B1 708-709
        F101B2 710-711          F101B3 712-714          F101B4 715-716
        F101B5 717-718          RF101C 719-720          F101C1 721-722
        F101C2 723-724          F101C3 725-727          F101C4 728-729
        F101C5 730-731          RF101D 732-733          F101D1 734-735
        F101D2 736-737          F101D3 738-740          F101D4 741-742
        F101D5 743-744          RF101E 745-746          F101E1 747-748
        F101E2 749-750          F101E3 751-753          F101E4 754-755
        F101E5 756-757          RF101F 758-759          F101F1 760-761
        F101F2 762-763          F101F3 764-766          F101F4 767-768
        F101F5 769-770          RF101G 771-772          F101G1 773-774
        F101G2 775-776          F101G3 777-779          F101G4 780-781
        F101G5 782-783          RF101H 784-785          F101H1 786-787
        F101H2 788-789          F101H3 790-792          F101H4 793-794
        F101H5 795-796          RF101I 797-798          F101I1 799-800
        F101I2 801-802          F101I3 803-805          F101I4 806-807
        F101I5 808-809          RF101J 810-811          F101J1 812-813
        F101J2 814-815          F101J3 816-818          F101J4 819-820
        F101J5 821-822          RF101K 823-824          F101K1 825-826
        F101K2 827-828          F101K3 829-831          F101K4 832-833
        F101K5 834-835          G1 836                  G21 837-838
        G22 839                 G3 840                  G4 841
        G51 842-844             G52 845-847             G6 848
        G7 849-851              G81 852-854             G82 855-857
        G9 858-860              G101 861                G102 862
        G11 863                 G12 864-866             G13 867
        G14 868-869             RG16 870                G16 871-872
        RG17A 873               G17A1 874               G17A2 875-876
        RG17B 877               G17B1 878               G17B2 879-880
        RG17C 881               G17C1 882               G17C2 883-884
        RG17D 885               G17D1 886               G17D2 887-888
        RG17E 889               G17E1 890               G17E2 891-892
        RG17F 893               G17F1 894               G17F2 895-896
        RG17G 897               G17G1 898               G17G2 899-900
        RG17H 901               G17H1 902               G17H2 903-904
        RG17I 905               G17I1 906               G17I2 907-908
        RG17J 909-910           G17J1 911               G17J2 912-913
        RG17K 914               G17K1 915               G17K2 916-917
        RG17L 918               G17L1 919               G17L2 920-921
        RG17M 922               G17M1 923               G17M2 924-925
        RG17N 926               G17N1 927               G17N2 928-929
        H1A 930                 H1B 931-932             H21 933
        H22 934-935             H3 936                  H7 937
        H8 938                  H81 939-940             H9A 941
        H9B 942                 S1 943-944              S2 945-946
        S3 947-948              W_1998 949-963 .13      DTH98_00 964-965
        MONTH_0 966-967         DAY_0 968-969           RESID_0 970-971
        VAGE_0 972-974          RA51_0 975-976          A51_0 977-978
        RA52_0 979-980          A52_0 981-982           RA53A_0 983-984
        A53A1_0 985-986         A53A2_0 987-989         A53A3_0 990-991
        RA53B_0 992-993         A53B1_0 994-995         A53B2_0 996-998
        A53B3_0 999-1000        RA53C_0 1001-1002       A53C1_0 1003-1004
        A53C2_0 1005-1007       A53C3_0 1008-1009       RA53D_0 1010-1011
        A53D1_0 1012-1013       A53D2_0 1014-1016       A53D3_0 1017-1018
        RA53E_0 1019-1020       A53E1_0 1021-1022       A53E2_0 1023-1025
        A53E3_0 1026-1027       RA53F_0 1028-1029       A53F1_0 1030-1031
        A53F2_0 1032-1034       A53F3_0 1035-1036       RA53G_0 1037-1038
        A53G1_0 1039-1040       A53G2_0 1041-1043       A53G3_0 1044-1045
        RA53H_0 1046-1047       A53H1_0 1048-1049       A53H2_0 1050-1052
        A53H3_0 1053-1054       RA53I_0 1055-1056       A53I1_0 1057-1058
        A53I2_0 1059-1061       A53I3_0 1062-1063       RA53J_0 1064-1065
        A53J1_0 1066-1067       A53J2_0 1068-1070       A53J3_0 1071-1072
        RA53K_0 1073-1074       A53K1_0 1075-1076       A53K2_0 1077-1079
        A53K3_0 1080-1081       RA53L_0 1082-1083       A53L1_0 1084-1085
        A53L2_0 1086-1088       A53L3_0 1089-1090       RA54_0 1091-1092
        A54A_0 1093-1096        A54B_0 1097-1098        B11_0 1099-1100
        B12_0 1101-1102         B21_0 1103-1104         B22_0 1105-1106
        B23_0 1107-1108         B24_0 1109-1110         B25_0 1111-1112
        B26_0 1113-1114         B27_0 1115-1116         C11_0 1117-1118
        C12_0 1119-1120         C13_0 1121-1122         C14_0 1123-1124
        C15_0 1125-1126         C16_0 1127-1128         C21A_0 1129-1130
        C21B_0 1131-1132        C21C_0 1133-1134        C22_0 1135-1136
        C31A_0 1137-1138        C31B_0 1139-1140        C31C_0 1141-1142
        C31D_0 1143-1144        C31E_0 1145-1146        C32_0 1147-1148
        C41A_0 1149-1150        C41B_0 1151-1152        C41C_0 1153-1154
        C51A_0 1155-1156        C51B_0 1157-1158        C52_0 1159-1160
        C53A_0 1161-1162        C53B_0 1163-1164        C53C_0 1165-1166
        C54_0 1167-1168         C55_0 1169-1170         RD1_0 1171-1172
        D1_0 1173-1174          RD2_0 1175-1176         D2_0 1177-1178
        RD31_0 1179-1180        D31_0 1181-1182         RD32_0 1183-1184
        D32_0 1185-1186         RD4MT_0 1187-1188       D4MT2_0 1189-1190
        RD4FSH_0 1191-1192      D4FSH2_0 1193-1194      RD4EGG_0 1195-1196
        D4EGG2_0 1197-1198      RD4BEN_0 1199-1200      D4BEN2_0 1201-1202
        RD4VEG_0 1203-1204      D4VEG2_0 1205-1206      RD4SUG_0 1207-1208
        D4SUG2_0 1209-1210      RD4TEA_0 1211-1212      D4TEA2_0 1213-1214
        RD4GAR_0 1215-1216      D4GAR2_0 1217-1218      RD5_0 1219-1220
        D5_0 1221-1222          RD6_0 1223-1224         D6C_0 1225-1226
        RD71_0 1227-1228        D71_0 1229-1230         RD75_0 1231-1232
        D75_0 1233-1234         RD81_0 1235-1236        D81_0 1237-1238
        RD85_0 1239-1240        D85_0 1241-1242         RD86_0 1243-1244
        D86_0 1245-1246         RD91_0 1247-1248        D91_0 1249-1250
        RD11A_0 1251-1252       D11A_0 1253-1254        RD11B_0 1255-1256
        D11B_0 1257-1258        RD11C_0 1259-1260       D11C_0 1261-1262
        RD11D_0 1263-1264       D11D_0 1265-1266        RD11E_0 1267-1268
        D11E_0 1269-1270        RD11F_0 1271-1272       D11F_0 1273-1274
        RD11G_0 1275-1276       D11G_0 1277-1278        RD11H_0 1279-1280
        D11H_0 1281-1282        RE1_0 1283-1284         E1_0 1285-1286
        RE2_0 1287-1288         E2_0 1289-1290          RE3_0 1291-1292
        E3_0 1293-1294          RE4_0 1295-1296         E4_0 1297-1298
        RE5_0 1299-1300         E5_0 1301-1302          RE6_0 1303-1304
        E6_0 1305-1306          RF31_0 1307-1308        F31_0 1309-1310
        F32_0 1311-1312         RF33_0 1313-1314        F33_0 1315-1319
        RF34_0 1320-1321        F34_0 1322-1323         RF41_0 1324-1325
        F41_0 1326-1327         RF5_0 1328-1329         F5_0 1330-1331
        RF61_0 1332-1333        F61_0 1334-1335         RF64_0 1336-1337
        F64_0 1338-1339         RF65_0 1340-1341        F65_0 1342-1343
        RF101_0 1344-1345       F101_0 1346-1347        RF102_0 1348-1349
        F102_0 1350-1351        G1_0 1352-1353          G21_0 1354-1355
        G22_0 1356-1357         G3_0 1358-1359          G4_0 1360-1361
        G51_0 1362-1364         G52_0 1365-1367         G6_0 1368-1369
        G7_0 1370-1372          G81_0 1373-1374         G82_0 1375-1376
        G9_0 1377-1378          G10_0 1379-1381         G11_0 1382-1383
        G12_0 1384-1385         RG13_0 1386-1387        G13_0 1388-1389
        G14A1_0 1390-1391       G14A2_0 1392-1394       G14B1_0 1395-1396
        G14B2_0 1397-1399       G14C1_0 1400-1401       G14C2_0 1402-1404
        G15A1_0 1405-1406       G15A2_0 1407-1408       G15A3_0 1409-1410
        G15B1_0 1411-1412       G15B2_0 1413-1414       G15B3_0 1415-1416
        G15C1_0 1417-1418       G15C2_0 1419-1420       G15C3_0 1421-1422
        G15D1_0 1423-1424       G15D2_0 1425-1426       G15D3_0 1427-1428
        G15E1_0 1429-1430       G15E2_0 1431-1432       G15E3_0 1433-1434
        G15F1_0 1435-1436       G15F2_0 1437-1438       G15F3_0 1439-1440
        G15G1_0 1441-1442       G15G2_0 1443-1444       G15G3_0 1445-1446
        G15H1_0 1447-1448       G15H2_0 1449-1450       G15H3_0 1451-1452
        G15I1_0 1453-1454       G15I2_0 1455-1456       G15I3_0 1457-1458
        G15J1_0 1459-1460       G15J2_0 1461-1462       G15J3_0 1463-1464
        G15K1_0 1465-1466       G15K2_0 1467-1468       G15K3_0 1469-1470
        G15L1_0 1471-1472       G15L2_0 1473-1474       G15L3_0 1475-1476
        G15M1_0 1477-1478       G15M2_0 1479-1480       G15M3_0 1481-1482
        G15N1_0 1483-1484       G15N2_0 1485-1486       G15N3_0 1487-1488
        G15O1_0 1489-1490       G15O2_0 1491-1492       G15O3_0 1493-1494
        G15P1_0 1495-1496       G15P2_0 1497-1498       G15P3_0 1499-1500
        H1_0 1501-1502          H21_0 1503-1504         H22_0 1505-1506
        H3_0 1507-1508          H6_0 1509-1510          H7_0 1511-1512
        H71_0 1513-1514         H8_0 1515-1516          S1_0 1517-1518
        S2_0 1519-1520          D0PROVID 1521-1522      D0RESID 1523-1524
        D0RESPON 1525-1526      D0UNFINI 1527-1528      D0SEX 1529-1530
        D0MARRY 1531-1532       D0LIVARR 1533-1534      D0PERSON 1535-1536
        D0VYEAR 1537-1540       D0VMONTH 1541-1542      D0VDAY 1543-1544
        D0VDAGE 1545-1547       D0DPLACE 1548-1549      D0CAUSE 1550-1551
        D0CARGIV 1552-1553      D0BEDRID 1554-1555      D0BEDDAY 1556-1558
        D0ILL 1559-1560         D0DISEA1 1561-1562      D0DIDAY1 1563-1565
        D0DISEA2 1566-1567      D0DIDAY2 1568-1570      D0DISEA3 1571-1572
        D0DIDAY3 1573-1575      D0HYPERT 1576-1577      D0DIABET 1578-1579
        D0HEART 1580-1581       D0CVD 1582-1583         D0PNEUM 1584-1585
        D0TUBERC 1586-1587      D0GLAUCO 1588-1589      D0PROSTA 1590-1591
        D0GASTRI 1592-1593      D0PARKIN 1594-1595      D0BEDSOR 1596-1597
        D0DEMENT 1598-1599      D0PSYCHO 1600-1601      D0NEUROS 1602-1603
        D0ARTHRI 1604-1605      D0OTHERS 1606-1607      D0MEDICA 1608-1609
        D0FINANC 1610-1611      D0INCOME 1612-1616      D0WCFACI 1617-1618
        D0TAPWAT 1619-1620      D0BATHFA 1621-1622      D0HEATER 1623-1624
        D0TVSET 1625-1626       D0WASHMA 1627-1628      D0PHONE 1629-1630
        D0DOCTOR 1631-1632      D0LICDOC 1633-1634      D0WHOPAY 1635-1636
        D0MEDCOS 1637-1641      D0BATHFU 1642-1643      D0B_AGE1 1644-1646
        D0B_AGE2 1647-1649      D0DRESFU 1650-1651      D0D_AGE1 1652-1654
        D0D_AGE2 1655-1657      D0TOILFU 1658-1659      D0T_AGE1 1660-1662
        D0T_AGE2 1663-1665      D0MOVEFU 1666-1667      D0M_AGE1 1668-1670
        D0M_AGE2 1671-1673      D0CONTFU 1674-1675      D0C_AGE1 1676-1678
        D0C_AGE2 1679-1681      D0FEEDFU 1682-1683      D0F_AGE1 1684-1686
        D0F_AGE2 1687-1689      D0OUTDOR 1690-1692      D0ACTDAY 1693-1695
        D0SMOKE 1696-1697       D0SMKTIM 1698-1699      D0DRINK 1700-1701
        D0KNDDRK 1702-1703      D0DRKMCH 1704-1705      DTH00_02 1706-1707
        MONTH_2 1708-1709       DAY_2 1710-1711         RESID_2 1712-1713
        VAGE_2 1714-1716        RA51_2 1717-1718        A51_2 1719-1720
        RA52_2 1721-1722        A52_2 1723-1724         RA53A_2 1725-1726
        A53A1_2 1727-1728       A53A2_2 1729-1731       A53A3_2 1732-1733
        RA53B_2 1734-1735       A53B1_2 1736-1737       A53B2_2 1738-1740
        A53B3_2 1741-1742       RA53C_2 1743-1744       A53C1_2 1745-1746
        A53C2_2 1747-1749       A53C3_2 1750-1751       RA53D_2 1752-1753
        A53D1_2 1754-1755       A53D2_2 1756-1758       A53D3_2 1759-1760
        RA53E_2 1761-1762       A53E1_2 1763-1764       A53E2_2 1765-1767
        A53E3_2 1768-1769       RA53F_2 1770-1771       A53F1_2 1772-1773
        A53F2_2 1774-1776       A53F3_2 1777-1778       RA53G_2 1779-1780
        A53G1_2 1781-1782       A53G2_2 1783-1785       A53G3_2 1786-1787
        RA53H_2 1788-1789       A53H1_2 1790-1791       A53H2_2 1792-1794
        A53H3_2 1795-1796       RA53I_2 1797-1798       A53I1_2 1799-1800
        A53I2_2 1801-1803       A53I3_2 1804-1805       RA53J_2 1806-1807
        A53J1_2 1808-1809       A53J2_2 1810-1812       A53J3_2 1813-1814
        RA53K_2 1815-1816       A53K1_2 1817-1818       A53K2_2 1819-1821
        A53K3_2 1822-1823       RA53L_2 1824-1825       A53L1_2 1826-1827
        A53L2_2 1828-1830       A53L3_2 1831-1832       RA531_2 1833-1834
        A531_2 1835-1836        RA532_2 1837-1838       A532_2 1839-1840
        RA54_2 1841-1842        A54A_2 1843-1846        A54B_2 1847-1848
        B11_2 1849-1850         B12_2 1851-1852         B121_2 1853-1854
        B21_2 1855-1856         B22_2 1857-1858         B23_2 1859-1860
        B24_2 1861-1862         B25_2 1863-1864         B26_2 1865-1866
        B27_2 1867-1868         C11_2 1869-1870         C12_2 1871-1872
        C13_2 1873-1874         C131_2 1875-1876        C14_2 1877-1878
        C15_2 1879-1880         C16_2 1881-1882         C161_2 1883-1884
        C162_2 1885-1886        C163_2 1887-1888        C21A_2 1889-1890
        C21B_2 1891-1892        C21C_2 1893-1894        C22_2 1895-1896
        C31A_2 1897-1898        C31B_2 1899-1900        C31C_2 1901-1902
        C31D_2 1903-1904        C31E_2 1905-1906        C32_2 1907-1908
        C41A_2 1909-1910        C41B_2 1911-1912        C41C_2 1913-1914
        C51A_2 1915-1916        C51B_2 1917-1918        C52_2 1919-1920
        C521_2 1921-1922        C53A_2 1923-1924        C53B_2 1925-1926
        C53C_2 1927-1928        C54_2 1929-1930         C55_2 1931-1932
        RD1_2 1933-1934         D1_2 1935-1936          RD2_2 1937-1938
        D2_2 1939-1940          RD31_2 1941-1942        D31_2 1943-1944
        RD32_2 1945-1946        D32_2 1947-1948         RD4MT_2 1949-1950
        D4MT2_2 1951-1952       RD4FSH_2 1953-1954      D4FSH2_2 1955-1956
        RD4EGG_2 1957-1958      D4EGG2_2 1959-1960      RD4BEN_2 1961-1962
        D4BEN2_2 1963-1964      RD4VEG_2 1965-1966      D4VEG2_2 1967-1968
        RD4SUG_2 1969-1970      D4SUG2_2 1971-1972      RD4TEA_2 1973-1974
        D4TEA2_2 1975-1976      RD4GAR_2 1977-1978      D4GAR2_2 1979-1980
        RD5_2 1981-1982         D5_2 1983-1984          RD6_2 1985-1986
        D6C_2 1987-1988         RD71_2 1989-1990        D71_2 1991-1992
        RD74_2 1993-1994        D74_2 1995-1997         RD75_2 1998-1999
        D75_2 2000-2001         RD81_2 2002-2003        D81_2 2004-2005
        RD84_2 2006-2007        D84_2 2008-2010         RD85_2 2011-2012
        D85_2 2013-2014         RD86_2 2015-2016        D86_2 2017-2018
        RD91_2 2019-2020        D91_2 2021-2022         RD94_2 2023-2024
        D94_2 2025-2027         RD11A_2 2028-2029       D11A_2 2030-2031
        RD11B_2 2032-2033       D11B_2 2034-2035        RD11C_2 2036-2037
        D11C_2 2038-2039        RD11D_2 2040-2041       D11D_2 2042-2043
        RD11E_2 2044-2045       D11E_2 2046-2047        RD11F_2 2048-2049
        D11F_2 2050-2051        RD11G_2 2052-2053       D11G_2 2054-2055
        RD11H_2 2056-2057       D11H_2 2058-2059        RD11I_2 2060-2061
        D11I_2 2062-2063        RD12_2 2064-2065        D12_2 2066-2067
        RE1_2 2068-2069         E1_2 2070-2071          RE1A_2 2072-2073
        E1A_2 2074-2075         RE2_2 2076-2077         E2_2 2078-2079
        RE2A_2 2080-2081        E2A_2 2082-2083         RE3_2 2084-2085
        E3_2 2086-2087          RE3A_2 2088-2089        E3A_2 2090-2091
        RE4_2 2092-2093         E4_2 2094-2095          RE4A_2 2096-2097
        E4A_2 2098-2099         RE5_2 2100-2101         E5_2 2102-2103
        RE5A_2 2104-2105        E5A_2 2106-2107         RE6_2 2108-2109
        E6_2 2110-2111          RE6A_2 2112-2113        E6A_2 2114-2115
        RE7_2 2116-2117         E7_2 2118-2119          RE8_2 2120-2121
        E8_2 2122-2123          RE9_2 2124-2125         E9_2 2126-2127
        RE10_2 2128-2129        E10_2 2130-2131         RE11_2 2132-2133
        E11_2 2134-2135         RE12_2 2136-2137        E12_2 2138-2139
        RE13_2 2140-2141        E13_2 2142-2143         RE14_2 2144-2145
        E14_2 2146-2147         RF21_2 2148-2149        F21_2 2150-2151
        RF211_2 2152-2153       F211_2 2154-2155        RF22_2 2156-2157
        F22_2 2158-2161         RF23_2 2162-2163        F23_2 2164-2165
        RF31_2 2166-2167        F31_2 2168-2169         RF32_2 2170-2171
        F32_2 2172-2176         RF33_2 2177-2178        F33_2 2179-2180
        RF34_2 2181-2182        F34_2 2183-2184         RF35_2 2185-2186
        F35_2 2187-2191         RF41_2 2192-2193        F41_2 2194-2195
        RF45_2 2196-2197        F45_2 2198-2199         RF5_2 2200-2201
        F5_2 2202-2203          RF61_2 2204-2205        F61_2 2206-2207
        RF64_2 2208-2209        F64_2 2210-2211         RF65_2 2212-2213
        F65_2 2214-2215         RF104_2 2216-2217       F104_2 2218-2220
        RF105_2 2221-2222       F105_2 2223-2225        RF111_2 2226-2227
        F111_2 2228-2229        RF112_2 2230-2231       F112_2 2232-2233
        RF113_2 2234-2235       F113_2 2236-2237        RF12_2 2238-2239
        F12A_2 2240-2244        F12B_2 2245-2249        RF13_2 2250-2251
        F13A_2 2252-2256        F13B_2 2257-2261        G1_2 2262-2263
        G21_2 2264-2265         G22_2 2266-2267         G3_2 2268-2269
        G4_2 2270-2271          G51_2 2272-2274         G52_2 2275-2277
        G6_2 2278-2279          G7_2 2280-2282          G81_2 2283-2284
        G82_2 2285-2286         G83_2 2287-2288         G9_2 2289-2290
        RG101_2 2291-2292       G101_2 2293-2295        G102A_2 2296-2298
        G102B_2 2299-2301       G11_2 2302-2303         G12_2 2304-2305
        RG13_2 2306-2307        G13_2 2308-2309         G14A1_2 2310-2312
        G14A2_2 2313-2315       G14B1_2 2316-2318       G14B2_2 2319-2321
        G14C1_2 2322-2324       G14C2_2 2325-2327       G15A1_2 2328-2329
        G15A2_2 2330-2331       G15A3_2 2332-2333       G15B1_2 2334-2335
        G15B2_2 2336-2337       G15B3_2 2338-2339       G15C1_2 2340-2341
        G15C2_2 2342-2343       G15C3_2 2344-2345       G15D1_2 2346-2347
        G15D2_2 2348-2349       G15D3_2 2350-2351       G15E1_2 2352-2353
        G15E2_2 2354-2355       G15E3_2 2356-2357       G15F1_2 2358-2359
        G15F2_2 2360-2361       G15F3_2 2362-2363       G15G1_2 2364-2365
        G15G2_2 2366-2367       G15G3_2 2368-2369       G15H1_2 2370-2371
        G15H2_2 2372-2373       G15H3_2 2374-2375       G15I1_2 2376-2377
        G15I2_2 2378-2379       G15I3_2 2380-2381       G15J1_2 2382-2383
        G15J2_2 2384-2385       G15J3_2 2386-2387       G15K1_2 2388-2389
        G15K2_2 2390-2391       G15K3_2 2392-2393       G15L1_2 2394-2395
        G15L2_2 2396-2397       G15L3_2 2398-2399       G15M1_2 2400-2401
        G15M2_2 2402-2403       G15M3_2 2404-2405       G15N1_2 2406-2407
        G15N2_2 2408-2409       G15N3_2 2410-2411       G15O1_2 2412-2413
        G15O2_2 2414-2415       G15O3_2 2416-2417       G15P1_2 2418-2419
        G15P2_2 2420-2421       G15P3_2 2422-2423       G15Q1_2 2424-2425
        G15Q2_2 2426-2427       G15Q3_2 2428-2429       G15R1_2 2430-2431
        G15R2_2 2432-2433       G15R3_2 2434-2435       G15S1_2 2436-2437
        G15S2_2 2438-2439       G15S3_2 2440-2441       G15T1_2 2442-2443
        G15T2_2 2444-2445       G15T3_2 2446-2447       G15U1_2 2448-2449
        G15U2_2 2450-2451       G15U3_2 2452-2453       G15V1_2 2454-2455
        G15V2_2 2456-2457       G15V3_2 2458-2459       G15W1_2 2460-2461
        G15W2_2 2462-2463       G15W3_2 2464-2465       H1_2 2466-2467
        H21_2 2468-2469         H22_2 2470-2471         H3_2 2472-2473
        H6_2 2474-2475          H7_2 2476-2477          H71_2 2478-2479
        H8_2 2480-2481          D2PROVIN 2482-2483      D2RESID 2484-2485
        D2RESPON 2486-2487      D2VYEAR 2488-2491       D2VMONTH 2492-2493
        D2VDAY 2494-2495        D2MTHIN 2496-2497       D2DAYIN 2498-2499
        D2SEX 2500-2501         D2VAGE 2502-2504        D2MARRY 2505-2506
        D2LIVARR 2507-2508      D2PERSON 2509-2510      D2GENER 2511-2512
        D2DPLACE 2513-2514      D2CAUSE 2515-2516       D2CARGIV 2517-2518
        D2BEDRID 2519-2520      D2BEDDAY 2521-2523      D2ILL 2524-2525
        D2DISEA1 2526-2527      D2DIDAY1 2528-2530      D2DISEA2 2531-2532
        D2DIDAY2 2533-2535      D2DISEA3 2536-2537      D2DIDAY3 2538-2540
        D2HYPERT 2541-2542      D2DIABET 2543-2544      D2HEART 2545-2546
        D2CVD 2547-2548         D2PNEUM 2549-2550       D2TUBERC 2551-2552
        D2GLAUCO 2553-2554      D2PROSTA 2555-2556      D2GASTRI 2557-2558
        D2PARKIN 2559-2560      D2BEDSOR 2561-2562      D2DEMENT 2563-2564
        D2PSYCHO 2565-2566      D2NEUROS 2567-2568      D2ARTHRI 2569-2570
        D2OTHERS 2571-2572      D2MEDICA 2573-2574      D2FINANC 2575-2576
        D2INCOME 2577-2581      D2WCFACI 2582-2583      D2TAPWAT 2584-2585
        D2BATHFA 2586-2587      D2HEATER 2588-2589      D2TVSET 2590-2591
        D2WASHMA 2592-2593      D2PHONE 2594-2595       D2DOCTOR 2596-2597
        D2LICDOC 2598-2599      D2WHOPAY 2600-2601      D2MEDCOS 2602-2606
        D2BATHFU 2607-2608      D2BATDAY 2609-2611      D2DRESFU 2612-2613
        D2DREDAY 2614-2616      D2TOILFU 2617-2618      D2TOIDAY 2619-2621
        D2MOVEFU 2622-2623      D2MOVDAY 2624-2626      D2CONTFU 2627-2628
        D2CONDAY 2629-2631      D2FEEDFU 2632-2633      D2FEEDAY 2634-2636
        D2OUTDOR 2637-2639      D2ACTDAY 2640-2642      D2SMOKE 2643-2644
        D2SMKTIM 2645-2646      D2DRINK 2647-2648       D2KNDDRK 2649-2650
        D2DRKMCH 2651-2652      DTH02_05 2653-2654      MONTH_5 2655-2656
        DAY_5 2657-2658         RESID_5 2659-2660       VAGE_5 2661-2663
        RA51_5 2664-2665        A51_5 2666-2667         RA52_5 2668-2669
        A52_5 2670-2671         RA53A_5 2672-2673       A53A1_5 2674-2675
        A53A2_5 2676-2678       A53A3_5 2679-2680       A53A4_5 2681-2682
        RA53B_5 2683-2684       A53B1_5 2685-2686       A53B2_5 2687-2689
        A53B3_5 2690-2691       A53B4_5 2692-2693       RA53C_5 2694-2695
        A53C1_5 2696-2697       A53C2_5 2698-2700       A53C3_5 2701-2702
        A53C4_5 2703-2704       RA53D_5 2705-2706       A53D1_5 2707-2708
        A53D2_5 2709-2711       A53D3_5 2712-2713       A53D4_5 2714-2715
        RA53E_5 2716-2717       A53E1_5 2718-2719       A53E2_5 2720-2722
        A53E3_5 2723-2724       A53E4_5 2725-2726       RA53F_5 2727-2728
        A53F1_5 2729-2730       A53F2_5 2731-2733       A53F3_5 2734-2735
        A53F4_5 2736-2737       RA53G_5 2738-2739       A53G1_5 2740-2741
        A53G2_5 2742-2744       A53G3_5 2745-2746       A53G4_5 2747-2748
        RA53H_5 2749-2750       A53H1_5 2751-2752       A53H2_5 2753-2755
        A53H3_5 2756-2757       A53H4_5 2758-2759       RA53I_5 2760-2761
        A53I1_5 2762-2763       A53I2_5 2764-2766       A53I3_5 2767-2768
        A53I4_5 2769-2770       RA53J_5 2771-2772       A53J1_5 2773-2774
        A53J2_5 2775-2777       A53J3_5 2778-2779       A53J4_5 2780-2781
        RA53K_5 2782-2783       A53K1_5 2784-2785       A53K2_5 2786-2788
        A53K3_5 2789-2790       A53K4_5 2791-2792       RA53L_5 2793-2794
        A53L1_5 2795-2796       A53L2_5 2797-2799       A53L3_5 2800-2801
        A53L4_5 2802-2803       RA530_5 2804-2805       A530_5 2806-2807
        RA531_5 2808-2809       A531_5 2810-2811        RA532_5 2812-2813
        A532_5 2814-2815        RA540_5 2816-2817       A540_5 2818-2819
        RA541_5 2820-2821       A541_5 2822-2825        RA542_5 2826-2827
        A542_5 2828-2829        RA54_5 2830-2831        A54A_5 2832-2835
        A54B_5 2836-2837        B11_5 2838-2839         B12_5 2840-2841
        B121_5 2842-2843        B21_5 2844-2845         B22_5 2846-2847
        B23_5 2848-2849         B24_5 2850-2851         B25_5 2852-2853
        B26_5 2854-2855         B27_5 2856-2857         C11_5 2858-2859
        C12_5 2860-2861         C13_5 2862-2863         C14_5 2864-2865
        C15_5 2866-2867         C16_5 2868-2869         C21A_5 2870-2871
        C21B_5 2872-2873        C21C_5 2874-2875        C22_5 2876-2877
        C31A_5 2878-2879        C31B_5 2880-2881        C31C_5 2882-2883
        C31D_5 2884-2885        C31E_5 2886-2887        C32_5 2888-2889
        C41A_5 2890-2891        C41B_5 2892-2893        C41C_5 2894-2895
        C51A_5 2896-2897        C51B_5 2898-2899        C52_5 2900-2901
        C53A_5 2902-2903        C53B_5 2904-2905        C53C_5 2906-2907
        C54_5 2908-2909         C55_5 2910-2911         RD1_5 2912-2913
        D1_5 2914-2915          RD2_5 2916-2917         D2_5 2918-2919
        RD31_5 2920-2921        D31_5 2922-2923         RD32_5 2924-2925
        D32_5 2926-2927         RD4MT_5 2928-2929       D4MT2_5 2930-2931
        RD4FSH_5 2932-2933      D4FSH2_5 2934-2935      RD4EGG_5 2936-2937
        D4EGG2_5 2938-2939      RD4BEN_5 2940-2941      D4BEN2_5 2942-2943
        RD4VEG_5 2944-2945      D4VEG2_5 2946-2947      RD4SUG_5 2948-2949
        D4SUG2_5 2950-2951      RD4TEA_5 2952-2953      D4TEA2_5 2954-2955
        RD4GAR_5 2956-2957      D4GAR2_5 2958-2959      RD5_5 2960-2961
        D5_5 2962-2963          RD6_5 2964-2965         D6C_5 2966-2967
        RD71_5 2968-2969        D71_5 2970-2971         RD72_5 2972-2973
        D72_5 2974-2975         RD73_5 2976-2977        D73_5 2978-2980
        RD74_5 2981-2982        D74_5 2983-2985         RD75_5 2986-2987
        D75_5 2988-2989         RD81_5 2990-2991        D81_5 2992-2993
        RD82_5 2994-2995        D82_5 2996-2997         RD83_5 2998-2999
        D83_5 3000-3002         RD84_5 3003-3004        D84_5 3005-3007
        RD85_5 3008-3009        D85_5 3010-3011         RD86_5 3012-3013
        D86_5 3014-3015         RD91_5 3016-3017        D91_5 3018-3019
        RD92_5 3020-3021        D92_5 3022-3023         RD93_5 3024-3025
        D93_5 3026-3028         RD94_5 3029-3030        D94_5 3031-3033
        RD101_5 3034-3035       D101_5 3036-3037        RD102_5 3038-3039
        D102_5 3040-3042        RD103_5 3043-3044       D103_5 3045-3047
        RD11A_5 3048-3049       D11A_5 3050-3051        RD11B_5 3052-3053
        D11B_5 3054-3055        RD11C_5 3056-3057       D11C_5 3058-3059
        RD11D_5 3060-3061       D11D_5 3062-3063        RD11E_5 3064-3065
        D11E_5 3066-3067        RD11F_5 3068-3069       D11F_5 3070-3071
        RD11G_5 3072-3073       D11G_5 3074-3075        RD11H_5 3076-3077
        D11H_5 3078-3079        RD12_5 3080-3081        D12_5 3082-3083
        RE1_5 3084-3085         E1_5 3086-3087          RE1B_5 3088-3089
        E1B_5 3090-3093         RE2_5 3094-3095         E2_5 3096-3097
        RE2B_5 3098-3099        E2B_5 3100-3103         RE3_5 3104-3105
        E3_5 3106-3107          RE3B_5 3108-3109        E3B_5 3110-3113
        RE4_5 3114-3115         E4_5 3116-3117          RE4B_5 3118-3119
        E4B_5 3120-3123         RE5_5 3124-3125         E5_5 3126-3127
        RE5B_5 3128-3129        E5B_5 3130-3133         RE6_5 3134-3135
        E6_5 3136-3137          RE6B_5 3138-3139        E6B_5 3140-3143
        RE610_5 3144-3145       E610_5 3146-3147        RE62_5 3148-3149
        E62_5 3150-3151         RE63_5 3152-3153        E63_5 3154-3158
        RE64_5 3159-3160        E64_5 3161-3162         RE65_5 3163-3164
        E65_5 3165-3166         RE66_5 3167-3168        E66_5 3169-3170
        RE67_5 3171-3172        E67_5 3173-3175         RE7_5 3176-3177
        E7_5 3178-3179          RE8_5 3180-3181         E8_5 3182-3183
        RE9_5 3184-3185         E9_5 3186-3187          RE10_5 3188-3189
        E10_5 3190-3191         RE11_5 3192-3193        E11_5 3194-3195
        RE12_5 3196-3197        E12_5 3198-3199         RE13_5 3200-3201
        E13_5 3202-3203         RE14_5 3204-3205        E14_5 3206-3207
        RF211_5 3208-3209       F211_5 3210-3211        RF22_5 3212-3213
        F22_5 3214-3217         RF23_5 3218-3219        F23_5 3220-3221
        RF31_5 3222-3223        F31_5 3224-3225         RF32_5 3226-3227
        F32A_5 3228-3229        F32B_5 3230-3231        F32C_5 3232-3233
        F32D_5 3234-3235        F32E_5 3236-3237        RF33_5 3238-3239
        F33_5 3240-3241         RF340_5 3242-3243       F340_5 3244-3245
        RF34_5 3246-3247        F34_5 3248-3249         RF35_5 3250-3251
        F35_5 3252-3256         RF41_5 3257-3258        F41_5 3259-3260
        RF42_5 3261-3262        F42_5 3263-3264         RF43A_5 3265-3266
        F43A1_5 3267-3269       F43A2_5 3270-3271       F43A3_5 3272-3274
        F43A4_5 3275-3276       RF43B_5 3277-3278       F43B1_5 3279-3281
        F43B2_5 3282-3283       F43B3_5 3284-3286       F43B4_5 3287-3288
        RF43C_5 3289-3290       F43C1_5 3291-3293       F43C2_5 3294-3295
        F43C3_5 3296-3298       F43C4_5 3299-3300       RF43D_5 3301-3302
        F43D1_5 3303-3305       F43D2_5 3306-3307       F43D3_5 3308-3310
        F43D4_5 3311-3312       RF44_5 3313-3314        F44_5 3315-3316
        RF45_5 3317-3318        F45_5 3319-3320         RF46_5 3321-3322
        F46_5 3323-3324         RF5_5 3325-3326         F5_5 3327-3328
        RF61_5 3329-3330        F61_5 3331-3332         RF610_5 3333-3334
        F610_5 3335-3336        RF64_5 3337-3338        F64A_5 3339-3340
        F64B_5 3341-3342        F64C_5 3343-3344        F64D_5 3345-3346
        F64E_5 3347-3348        F64F_5 3349-3350        F64G_5 3351-3352
        F64H_5 3353-3354        F64I_5 3355-3356        RF651A_5 3357-3358
        F651A_5 3359-3363       RF651B_5 3364-3365      F651B_5 3366-3370
        RF652_5 3371-3372       F652_5 3373-3374        RF71_5 3375-3376
        F71_5 3377-3378         RF721_5 3379-3380       F721_5 3381-3383
        RF722_5 3384-3385       F722_5 3386-3388        RF73_5 3389-3390
        F73_5 3391-3393         RF74_5 3394-3395        F74_5 3396-3397
        RF81_5 3398-3399        F81_5 3400-3401         RF821_5 3402-3403
        F821_5 3404-3406        RF822_5 3407-3408       F822_5 3409-3411
        RF83_5 3412-3413        F83_5 3414-3416         RF85_5 3417-3418
        F85_5 3419-3420         RF86_5 3421-3422        F86_5 3423-3424
        RF9_5 3425-3426         F9A_5 3427-3428         RF92A_5 3429-3430
        F92A1_5 3431-3432       F92A2_5 3433-3434       F92A3_5 3435-3436
        F92A4_5 3437-3439       F92A5_5 3440-3441       F92A6_5 3442-3443
        RF92B_5 3444-3445       F92B1_5 3446-3447       F92B2_5 3448-3449
        F92B3_5 3450-3451       F92B4_5 3452-3454       F92B5_5 3455-3456
        F92B6_5 3457-3458       RF92C_5 3459-3460       F92C1_5 3461-3462
        F92C2_5 3463-3464       F92C3_5 3465-3466       F92C4_5 3467-3469
        F92C5_5 3470-3471       F92C6_5 3472-3473       RF92D_5 3474-3475
        F92D1_5 3476-3477       F92D2_5 3478-3479       F92D3_5 3480-3481
        F92D4_5 3482-3484       F92D5_5 3485-3486       F92D6_5 3487-3488
        RF92E_5 3489-3490       F92E1_5 3491-3492       F92E2_5 3493-3494
        F92E3_5 3495-3496       F92E4_5 3497-3499       F92E5_5 3500-3501
        F92E6_5 3502-3503       RF92F_5 3504-3505       F92F1_5 3506-3507
        F92F2_5 3508-3509       F92F3_5 3510-3511       F92F4_5 3512-3514
        F92F5_5 3515-3516       F92F6_5 3517-3518       RF92G_5 3519-3520
        F92G1_5 3521-3522       F92G2_5 3523-3524       F92G3_5 3525-3526
        F92G4_5 3527-3529       F92G5_5 3530-3531       F92G6_5 3532-3533
        RF92H_5 3534-3535       F92H1_5 3536-3537       F92H2_5 3538-3539
        F92H3_5 3540-3541       F92H4_5 3542-3544       F92H5_5 3545-3546
        F92H6_5 3547-3548       RF92I_5 3549-3550       F92I1_5 3551-3552
        F92I2_5 3553-3554       F92I3_5 3555-3556       F92I4_5 3557-3559
        F92I5_5 3560-3561       F92I6_5 3562-3563       RF92J_5 3564-3565
        F92J1_5 3566-3567       F92J2_5 3568-3569       F92J3_5 3570-3571
        F92J4_5 3572-3574       F92J5_5 3575-3576       F92J6_5 3577-3578
        RF92K_5 3579-3580       F92K1_5 3581-3582       F92K2_5 3583-3584
        F92K3_5 3585-3586       F92K4_5 3587-3589       F92K5_5 3590-3591
        F92K6_5 3592-3593       RF103A_5 3594-3595      F103A6_5 3596-3597
        F103A8_5 3598-3599      F103A1_5 3600-3601      F103A2_5 3602-3603
        F103A3_5 3604-3606      F103A4_5 3607-3608      F103A7_5 3609-3610
        F103A5_5 3611-3612      RF103B_5 3613-3614      F103B6_5 3615-3616
        F103B8_5 3617-3618      F103B1_5 3619-3620      F103B2_5 3621-3622
        F103B3_5 3623-3625      F103B4_5 3626-3627      F103B7_5 3628-3629
        F103B5_5 3630-3631      RF103C_5 3632-3633      F103C6_5 3634-3635
        F103C8_5 3636-3637      F103C1_5 3638-3639      F103C2_5 3640-3641
        F103C3_5 3642-3644      F103C4_5 3645-3646      F103C7_5 3647-3648
        F103C5_5 3649-3650      RF103D_5 3651-3652      F103D6_5 3653-3654
        F103D8_5 3655-3656      F103D1_5 3657-3658      F103D2_5 3659-3660
        F103D3_5 3661-3663      F103D4_5 3664-3665      F103D7_5 3666-3667
        F103D5_5 3668-3669      RF103E_5 3670-3671      F103E6_5 3672-3673
        F103E8_5 3674-3675      F103E1_5 3676-3677      F103E2_5 3678-3679
        F103E3_5 3680-3682      F103E4_5 3683-3684      F103E7_5 3685-3686
        F103E5_5 3687-3688      RF103F_5 3689-3690      F103F6_5 3691-3692
        F103F8_5 3693-3694      F103F1_5 3695-3696      F103F2_5 3697-3698
        F103F3_5 3699-3701      F103F4_5 3702-3703      F103F7_5 3704-3705
        F103F5_5 3706-3707      RF103G_5 3708-3709      F103G6_5 3710-3711
        F103G8_5 3712-3713      F103G1_5 3714-3715      F103G2_5 3716-3717
        F103G3_5 3718-3720      F103G4_5 3721-3722      F103G7_5 3723-3724
        F103G5_5 3725-3726      RF103H_5 3727-3728      F103H6_5 3729-3730
        F103H8_5 3731-3732      F103H1_5 3733-3734      F103H2_5 3735-3736
        F103H3_5 3737-3739      F103H4_5 3740-3741      F103H7_5 3742-3743
        F103H5_5 3744-3745      RF103I_5 3746-3747      F103I6_5 3748-3749
        F103I8_5 3750-3751      F103I1_5 3752-3753      F103I2_5 3754-3755
        F103I3_5 3756-3758      F103I4_5 3759-3760      F103I7_5 3761-3762
        F103I5_5 3763-3764      RF103J_5 3765-3766      F103J6_5 3767-3768
        F103J8_5 3769-3770      F103J1_5 3771-3772      F103J2_5 3773-3774
        F103J3_5 3775-3777      F103J4_5 3778-3779      F103J7_5 3780-3781
        F103J5_5 3782-3783      RF103K_5 3784-3785      F103K6_5 3786-3787
        F103K8_5 3788-3789      F103K1_5 3790-3791      F103K2_5 3792-3793
        F103K3_5 3794-3796      F103K4_5 3797-3798      F103K7_5 3799-3800
        F103K5_5 3801-3802      RF103L_5 3803-3804      F103L6_5 3805-3806
        F103L8_5 3807-3808      F103L1_5 3809-3810      F103L2_5 3811-3812
        F103L3_5 3813-3815      F103L4_5 3816-3817      F103L7_5 3818-3819
        F103L5_5 3820-3821      RF103M_5 3822-3823      F103M6_5 3824-3825
        F103M8_5 3826-3827      F103M1_5 3828-3829      F103M2_5 3830-3831
        F103M3_5 3832-3834      F103M4_5 3835-3836      F103M7_5 3837-3838
        F103M5_5 3839-3840      RF111_5 3841-3842       F111A_5 3843-3844
        F111B_5 3845-3846       F111C_5 3847-3848       RF112_5 3849-3850
        F112A_5 3851-3852       F112B_5 3853-3854       F112C_5 3855-3856
        RF113_5 3857-3858       F113A_5 3859-3860       F113B_5 3861-3862
        F113C_5 3863-3864       RF12_5 3865-3866        F12A_5 3867-3871
        F12B_5 3872-3876        F12C_5 3877-3881        RF13_5 3882-3883
        F13A_5 3884-3888        F13B_5 3889-3893        F13C_5 3894-3898
        RF14_5 3899-3900        F141_5 3901-3902        F142_5 3903-3904
        F143_5 3905-3906        F144_5 3907-3908        F145_5 3909-3910
        F146_5 3911-3912        F147_5 3913-3914        F148_5 3915-3916
        F149_5 3917-3918        RF15_5 3919-3920        F151_5 3921-3922
        F152_5 3923-3924        F153_5 3925-3926        F154_5 3927-3928
        F155_5 3929-3930        F156_5 3931-3932        F157_5 3933-3934
        F158_5 3935-3936        F159_5 3937-3938        F16_5 3939-3940
        RG01_5 3941-3942        G01_5 3943-3944         RG02_5 3945-3946
        G02_5 3947-3948         G1_5 3949-3950          G21_5 3951-3952
        G22_5 3953-3954         G3_5 3955-3956          G4_5 3957-3958
        G51_5 3959-3961         G52_5 3962-3964         G6_5 3965-3966
        G7_5 3967-3969          G81_5 3970-3971         G82_5 3972-3973
        G83_5 3974-3975         G9_5 3976-3977          G101_5 3978-3980
        G102_5 3981-3983        G11_5 3984-3985         G12_5 3986-3987
        RG130_5 3988-3989       G130_5 3990-3991        RG13_5 3992-3993
        G13_5 3994-3995         RG14A_5 3996-3997       G14A1_5 3998-4000
        G14A2_5 4001-4003       RG14B_5 4004-4005       G14B1_5 4006-4008
        G14B2_5 4009-4011       RG14C_5 4012-4013       G14C1_5 4014-4016
        G14C2_5 4017-4019       G15A1_5 4020-4021       G15A2_5 4022-4023
        G15A3_5 4024-4025       G15B1_5 4026-4027       G15B2_5 4028-4029
        G15B3_5 4030-4031       G15C1_5 4032-4033       G15C2_5 4034-4035
        G15C3_5 4036-4037       G15D1_5 4038-4039       G15D2_5 4040-4041
        G15D3_5 4042-4043       G15E1_5 4044-4045       G15E2_5 4046-4047
        G15E3_5 4048-4049       G15F1_5 4050-4051       G15F2_5 4052-4053
        G15F3_5 4054-4055       G15G1_5 4056-4057       G15G2_5 4058-4059
        G15G3_5 4060-4061       G15H1_5 4062-4063       G15H2_5 4064-4065
        G15H3_5 4066-4067       G15I1_5 4068-4069       G15I2_5 4070-4071
        G15I3_5 4072-4073       G15J1_5 4074-4075       G15J2_5 4076-4077
        G15J3_5 4078-4079       G15K1_5 4080-4081       G15K2_5 4082-4083
        G15K3_5 4084-4085       G15L1_5 4086-4087       G15L2_5 4088-4089
        G15L3_5 4090-4091       G15M1_5 4092-4093       G15M2_5 4094-4095
        G15M3_5 4096-4097       G15N1_5 4098-4099       G15N2_5 4100-4101
        G15N3_5 4102-4103       G15O1_5 4104-4105       G15O2_5 4106-4107
        G15O3_5 4108-4109       G15P1_5 4110-4111       G15P2_5 4112-4113
        G15P3_5 4114-4115       G15Q1_5 4116-4117       G15Q2_5 4118-4119
        G15Q3_5 4120-4121       G15R1_5 4122-4123       G15R2_5 4124-4125
        G15R3_5 4126-4127       G15S1_5 4128-4129       G15S2_5 4130-4131
        G15S3_5 4132-4133       G15T1_5 4134-4135       G15T2_5 4136-4137
        G15T3_5 4138-4139       G15U1_5 4140-4141       G15U2_5 4142-4143
        G15U3_5 4144-4145       G15V1_5 4146-4147       G15V2_5 4148-4149
        G15V3_5 4150-4151       G15W1_5 4152-4153       G15W2_5 4154-4155
        G15W3_5 4156-4157       H1_5 4158-4159          H21_5 4160-4161
        H22_5 4162-4163         H3_5 4164-4165          H6_5 4166-4167
        H7_5 4168-4169          H71_5 4170-4171         D5VYEAR 4172-4175
        D5VMONTH 4176-4177      D5VDAY 4178-4179        D5MTHIN 4180-4181
        D5DAYIN 4182-4183       D5SEX 4184-4185         D5RESID 4186-4187
        D5RESPON 4188-4189      D5MARRY 4190-4191       D5LIVARR 4192-4193
        D5PERSON 4194-4195      D5GENER 4196-4197       D5DPLACE 4198-4199
        D5CAUSE 4200-4201       D5CARGIV 4202-4203      D5PCGDAY 4204-4205
        D5BEDRID 4206-4207      D5BEDDAY 4208-4211      D5ILL 4212-4213
        D5DISEA1 4214-4215      D5DIDAY1 4216-4219      D5DISEA2 4220-4221
        D5DIDAY2 4222-4225      D5DISEA3 4226-4227      D5DIDAY3 4228-4231
        D5MEDICA 4232-4233      D5FINANC 4234-4235      D5INCOME 4236-4240
        D5WCFACI 4241-4242      D5TAPWAT 4243-4244      D5BATHFA 4245-4246
        D5HEATER 4247-4248      D5TVSET 4249-4250       D5WASHMA 4251-4252
        D5PHONE 4253-4254       D5DOCTOR 4255-4256      D5LICDOC 4257-4258
        D5WHOPAY 4259-4260      D5MEDCOS 4261-4265      D5POCKET 4266-4270
        D5BATHFU 4271-4272      D5BATDAY 4273-4276      D5DRESFU 4277-4278
        D5DREDAY 4279-4282      D5TOILFU 4283-4284      D5TOIDAY 4285-4288
        D5MOVEFU 4289-4290      D5MOVDAY 4291-4294      D5CONTFU 4295-4296
        D5CONDAY 4297-4300      D5FEEDFU 4301-4302      D5FEEDAY 4303-4306
        D5FULLDA 4307-4310      D5CARCST 4311-4315      D5DIRCST 4316-4320
        D5CARPAY 4321-4322      D5OUTDOR 4323-4326      D5ACTDAY 4327-4330
        D5SMOKE 4331-4332       D5SMKTIM 4333-4334      D5DRINK 4335-4336
        D5KNDDRK 4337-4338      D5DRKMCH 4339-4340      D5ADVDIR 4341-4342
        D5DIRDAY 4343-4345      D5DREAM 4346-4347       D5PAIN 4348-4349
        D5UNCONS 4350-4351      D5UNCDAY 4352-4354      DTH05_08 4355-4356
        YEAR_8 4357-4360        MONTH_8 4361-4362       DAY_8 4363-4364
        RESID_8 4365-4366       VAGE_8 4367-4369        RA51_8 4370-4371
        A51_8 4372-4373         RA52_8 4374-4375        A52_8 4376-4377
        RA53A_8 4378-4379       A53A1_8 4380-4381       A53A3_8 4382-4383
        A53A2_8 4384-4386       A53A4_8 4387-4388       RA53B_8 4389-4390
        A53B1_8 4391-4392       A53B3_8 4393-4394       A53B2_8 4395-4397
        A53B4_8 4398-4399       RA53C_8 4400-4401       A53C1_8 4402-4403
        A53C3_8 4404-4405       A53C2_8 4406-4408       A53C4_8 4409-4410
        RA53D_8 4411-4412       A53D1_8 4413-4414       A53D3_8 4415-4416
        A53D2_8 4417-4419       A53D4_8 4420-4421       RA53E_8 4422-4423
        A53E1_8 4424-4425       A53E3_8 4426-4427       A53E2_8 4428-4430
        A53E4_8 4431-4432       RA53F_8 4433-4434       A53F1_8 4435-4436
        A53F3_8 4437-4438       A53F2_8 4439-4441       A53F4_8 4442-4443
        RA53G_8 4444-4445       A53G1_8 4446-4447       A53G3_8 4448-4449
        A53G2_8 4450-4452       A53G4_8 4453-4454       RA53H_8 4455-4456
        A53H1_8 4457-4458       A53H3_8 4459-4460       A53H2_8 4461-4463
        A53H4_8 4464-4465       RA53I_8 4466-4467       A53I1_8 4468-4469
        A53I3_8 4470-4471       A53I2_8 4472-4474       A53I4_8 4475-4476
        RA53J_8 4477-4478       A53J1_8 4479-4480       A53J11_8 $4481
        A53J3_8 4482-4483       A53J2_8 4484-4486       A53J4_8 4487-4488
        RA53K_8 4489-4490       A53K1_8 4491-4492       A53K11_8 $4493
        A53K3_8 4494-4495       A53K2_8 4496-4498       A53K4_8 4499-4500
        RA53L_8 4501-4502       A53L1_8 4503-4504       A53L11_8 $4505
        A53L3_8 4506-4507       A53L2_8 4508-4510       A53L4_8 4511-4512
        RA530_8 4513-4514       A530_8 4515-4516        RA531_8 4517-4518
        A531_8 4519-4520        RA532_8 4521-4522       A532_8 4523-4524
        RA541_8 4525-4526       A541_8 4527-4530        RA542_8 4531-4532
        A542_8 4533-4534        RA54_8 4535-4536        A54A_8 4537-4540
        A54B_8 4541-4542        B11_8 4543-4544         B12_8 4545-4546
        B121_8 4547-4548        B21_8 4549-4550         B22_8 4551-4552
        B23_8 4553-4554         B24_8 4555-4556         B25_8 4557-4558
        B26_8 4559-4560         B27_8 4561-4562         C11_8 4563-4564
        C12_8 4565-4566         C13_8 4567-4568         C14_8 4569-4570
        C15_8 4571-4572         C16_8 4573-4574         C21A_8 4575-4576
        C21B_8 4577-4578        C21C_8 4579-4580        C22_8 4581-4582
        C31A_8 4583-4584        C31B_8 4585-4586        C31C_8 4587-4588
        C31D_8 4589-4590        C31E_8 4591-4592        C32_8 4593-4594
        C41A_8 4595-4596        C41B_8 4597-4598        C41C_8 4599-4600
        C51A_8 4601-4602        C51B_8 4603-4604        C52_8 4605-4606
        C52X1_8 4607-4608       C52X2_8 4609-4610       C53A_8 4611-4612
        C53B_8 4613-4614        C53C_8 4615-4616        C54_8 4617-4618
        C55_8 4619-4620         RD1_8 4621-4622         D1_8 4623-4624
        RD2_8 4625-4626         D2_8 4627-4628          RD31_8 4629-4630
        D31_8 4631-4632         RD32_8 4633-4634        D32_8 4635-4636
        RD33_8 4637-4638        D33_8 4639-4640         RD34_8 4641-4642
        D34_8 4643-4644         RD4MEAT_8 4645-4646     D4MEAT2_8 4647-4648
        D4MEAT1_8 4649-4650     RD4FISH_8 4651-4652     D4FISH2_8 4653-4654
        D4FISH1_8 4655-4656     RD4EGG_8 4657-4658      D4EGG2_8 4659-4660
        D4EGG1_8 4661-4662      RD4BEAN_8 4663-4664     D4BEAN2_8 4665-4666
        D4BEAN1_8 4667-4668     RD4VEG_8 4669-4670      D4VEG2_8 4671-4672
        D4VEG1_8 4673-4674      RD4SUGA_8 4675-4676     D4SUGA2_8 4677-4678
        D4SUGA1_8 4679-4680     RD4TEA_8 4681-4682      D4TEA2_8 4683-4684
        D4TEA1_8 4685-4686      RD4GARL_8 4687-4688     D4GARL2_8 4689-4690
        D4GARL1_8 4691-4692     RDEMILK_8 4693-4694     D4MILK1_8 4695-4696
        D4MILK2_8 4697-4698     RD4NUT_8 4699-4700      D4NUT1_8 4701-4702
        D4NUT2_8 4703-4704      RD4ALGA_8 4705-4706     D4ALGA1_8 4707-4708
        D4ALGA2_8 4709-4710     RD4VIT_8 4711-4712      D4VIT1_8 4713-4714
        D4VIT2_8 4715-4716      RD4DRUG_8 4717-4718     D4DRUG1_8 4719-4720
        D4DRUG2_8 4721-4722     RD5_8 4723-4724         D5_8 4725-4726
        RD6_8 4727-4728         D6A_8 4729-4730         D6B_8 4731-4732
        D6C_8 4733-4734         RD71_8 4735-4736        D71_8 4737-4738
        RD72_8 4739-4740        D72_8 4741-4742         RD73_8 4743-4744
        D73_8 4745-4747         RD74_8 4748-4749        D74_8 4750-4752
        RD75_8 4753-4754        D75_8 4755-4756         RD81_8 4757-4758
        D81_8 4759-4760         RD82_8 4761-4762        D82_8 4763-4764
        RD83_8 4765-4766        D83_8 4767-4769         RD84_8 4770-4771
        D84_8 4772-4774         RD85_8 4775-4776        D85_8 4777-4778
        RD86_8 4779-4780        D86_8 4781-4782         RD91_8 4783-4784
        D91_8 4785-4786         RD92_8 4787-4788        D92_8 4789-4790
        RD93_8 4791-4792        D93_8 4793-4795         RD94_8 4796-4797
        D94_8 4798-4800         RD101_8 4801-4802       D101_8 4803-4804
        RD102_8 4805-4806       D102_8 4807-4809        RD103_8 4810-4811
        D103_8 4812-4814        RD11A_8 4815-4816       D11A_8 4817-4818
        RD11B_8 4819-4820       D11B_8 4821-4822        RD11C_8 4823-4824
        D11C_8 4825-4826        RD11D_8 4827-4828       D11D_8 4829-4830
        RD11E_8 4831-4832       D11E_8 4833-4834        RD11F_8 4835-4836
        D11F_8 4837-4838        RD11G_8 4839-4840       D11G_8 4841-4842
        RD11H_8 4843-4844       D11H_8 4845-4846        RD12_8 4847-4848
        D12_8 4849-4850         RE6_8 4851-4852         E6_8 4853-4854
        RE6B_8 4855-4856        E6B_8 4857-4860         RE1_8 4861-4862
        E1_8 4863-4864          RE1B_8 4865-4866        E1B_8 4867-4870
        RE2_8 4871-4872         E2_8 4873-4874          RE2B_8 4875-4876
        E2B_8 4877-4880         RE3_8 4881-4882         E3_8 4883-4884
        RE3B_8 4885-4886        E3B_8 4887-4890         RE4_8 4891-4892
        E4_8 4893-4894          RE4B_8 4895-4896        E4B_8 4897-4900
        RE5_8 4901-4902         E5_8 4903-4904          RE5B_8 4905-4906
        E5B_8 4907-4910         RE610_8 4911-4912       E610_8 4913-4914
        RE62_8 4915-4916        E62_8 4917-4918         RE63_8 4919-4920
        E63_8 4921-4925         RE64_8 4926-4927        E64_8 4928-4929
        RE65_8 4930-4931        E65_8 4932-4933         RE67_8 4934-4935
        E67_8 4936-4938         RE7_8 4939-4940         E7_8 4941-4942
        RE8_8 4943-4944         E8_8 4945-4946          RE9_8 4947-4948
        E9_8 4949-4950          RE10_8 4951-4952        E10_8 4953-4954
        RE11_8 4955-4956        E11_8 4957-4958         RE12_8 4959-4960
        E12_8 4961-4962         RE13_8 4963-4964        E13_8 4965-4966
        RE14_8 4967-4968        E14_8 4969-4970         RF1_8 4971-4972
        F1_8 4973-4974          RF2_8 4975-4976         F2_8 4977-4978
        F2T_8 $4979             RF21_8 4980-4981        F21_8 4982-4983
        RF211_8 4984-4985       F211_8 4986-4987        RF22_8 4988-4989
        F22_8 4990-4993         RF23_8 4994-4995        F23_8 4996-4997
        RF31_8 4998-4999        F31_8 5000-5001         RF32_8 5002-5003
        F32A_8 5004-5005        F32B_8 5006-5007        F32C_8 5008-5009
        F32D_8 5010-5011        F32E_8 5012-5013        RF33_8 5014-5015
        F33_8 5016-5017         RF340_8 5018-5019       F340_8 5020-5021
        RF34_8 5022-5023        F34_8 5024-5025         RF35_8 5026-5027
        F35_8 5028-5032         RF41_8 5033-5034        F41_8 5035-5036
        RF42_8 5037-5038        F42_8 5039-5040         RF43A_8 5041-5042
        F43A1_8 5043-5045       F43A2_8 5046-5047       F43A3_8 5048-5050
        F43A4_8 5051-5052       RF43B_8 5053-5054       F43B1_8 5055-5057
        F43B2_8 5058-5059       F43B3_8 5060-5062       F43B4_8 5063-5064
        RF43C_8 5065-5066       F43C1_8 5067-5069       F43C2_8 5070-5071
        F43C3_8 5072-5074       F43C4_8 5075-5076       RF43D_8 5077-5078
        F43D1_8 5079-5081       F43D2_8 5082-5083       F43D3_8 5084-5086
        F43D4_8 5087-5088       RF44_8 5089-5090        F44_8 5091-5092
        RF45_8 5093-5094        F45_8 5095-5096         RF46_8 5097-5098
        F46_8 5099-5100         RF47_8 5101-5102        F47_8 5103-5104
        RF5_8 5105-5106         F5_8 5107-5108          RF61_8 5109-5110
        F61_8 5111-5112         RF610_8 5113-5114       F610_8 5115-5116
        RF62_8 5117-5118        F62_8 5119-5120         RF63_8 5121-5122
        F63_8 5123-5124         RF64_8 5125-5126        F64A_8 5127-5128
        F64B_8 5129-5130        F64C_8 5131-5132        F64D_8 5133-5134
        F64E_8 5135-5136        F64F_8 5137-5138        F64G_8 5139-5140
        F64H_8 5141-5142        F64I_8 5143-5144        RF651A_8 5145-5146
        F651A_8 5147-5151       RF651B_8 5152-5153      F651B_8 5154-5158
        RF652_8 5159-5160       F652_8 5161-5162        RF66_8 5163-5164
        F66_8 5165-5166         RF71_8 5167-5168        F71_8 5169-5170
        RF721_8 5171-5172       F721_8 5173-5175        RF722_8 5176-5177
        F722_8 5178-5180        RF73_8 5181-5182        F73_8 5183-5185
        RF74_8 5186-5187        F74_8 5188-5189         RF81_8 5190-5191
        F81_8 5192-5193         RF821_8 5194-5195       F821_8 5196-5198
        RF822_8 5199-5200       F822_8 5201-5203        RF83_8 5204-5205
        F83_8 5206-5208         RF84_8 5209-5210        F84_8 5211-5212
        RF85_8 5213-5214        F85_8 5215-5216         RF86_8 5217-5218
        F86_8 5219-5220         RF9_8 5221-5222         F9_8 5223-5224
        F9A_8 5225-5226         RF91_8 5227-5228        F91_8 5229-5230
        RF92A_8 5231-5232       F92A1_8 5233-5234       F92A2_8 5235-5236
        F92A3_8 5237-5238       F92A4_8 5239-5241       F92A5_8 5242-5243
        F92A6_8 5244-5245       RF92B_8 5246-5247       F92B1_8 5248-5249
        F92B2_8 5250-5251       F92B3_8 5252-5253       F92B4_8 5254-5256
        F92B5_8 5257-5258       F92B6_8 5259-5260       RF92C_8 5261-5262
        F92C1_8 5263-5264       F92C2_8 5265-5266       F92C3_8 5267-5268
        F92C4_8 5269-5271       F92C5_8 5272-5273       F92C6_8 5274-5275
        RF92D_8 5276-5277       F92D1_8 5278-5279       F92D2_8 5280-5281
        F92D3_8 5282-5283       F92D4_8 5284-5286       F92D5_8 5287-5288
        F92D6_8 5289-5290       RF92E_8 5291-5292       F92E1_8 5293-5294
        F92E2_8 5295-5296       F92E3_8 5297-5298       F92E4_8 5299-5301
        F92E5_8 5302-5303       F92E6_8 5304-5305       RF92F_8 5306-5307
        F92F1_8 5308-5309       F92F2_8 5310-5311       F92F3_8 5312-5313
        F92F4_8 5314-5316       F92F5_8 5317-5318       F92F6_8 5319-5320
        RF92G_8 5321-5322       F92G1_8 5323-5324       F92G2_8 5325-5326
        F92G3_8 5327-5328       F92G4_8 5329-5331       F92G5_8 5332-5333
        F92G6_8 5334-5335       RF92H_8 5336-5337       F92H1_8 5338-5339
        F92H2_8 5340-5341       F92H3_8 5342-5343       F92H4_8 5344-5346
        F92H5_8 5347-5348       F92H6_8 5349-5350       RF92I_8 5351-5352
        F92I1_8 5353-5354       F92I2_8 5355-5356       F92I3_8 5357-5358
        F92I4_8 5359-5361       F92I5_8 5362-5363       F92I6_8 5364-5365
        RF92J_8 5366-5367       F92J1_8 5368-5369       F92J2_8 5370-5371
        F92J3_8 5372-5373       F92J4_8 5374-5376       F92J5_8 5377-5378
        F92J6_8 5379-5380       JIGE_8 5381-5382        RF10_8 5383-5384
        F10_8 5385-5386         F10A_8 5387-5388        RF101_8 5389-5390
        F101_8 5391-5392        RF102_8 5393-5394       F102_8 5395-5396
        F103_8 5397-5398        RF103A_8 5399-5400      F103A8_8 5401-5402
        F103A1_8 5403-5404      F103A2_8 5405-5406      F103A3_8 5407-5408
        F103A4_8 5409-5410      F103A7_8 5411-5412      F103A5_8 5413-5414
        RF103B_8 5415-5416      F103B8_8 5417-5418      F103B1_8 5419-5420
        F103B2_8 5421-5422      F103B3_8 5423-5424      F103B4_8 5425-5426
        F103B7_8 5427-5428      F103B5_8 5429-5430      RF103C_8 5431-5432
        F103C8_8 5433-5434      F103C1_8 5435-5436      F103C2_8 5437-5438
        F103C3_8 5439-5440      F103C4_8 5441-5442      F103C7_8 5443-5444
        F103C5_8 5445-5446      RF103D_8 5447-5448      F103D8_8 5449-5450
        F103D1_8 5451-5452      F103D2_8 5453-5454      F103D3_8 5455-5456
        F103D4_8 5457-5458      F103D7_8 5459-5460      F103D5_8 5461-5462
        RF103E_8 5463-5464      F103E8_8 5465-5466      F103E1_8 5467-5468
        F103E2_8 5469-5470      F103E3_8 5471-5472      F103E4_8 5473-5474
        F103E7_8 5475-5476      F103E5_8 5477-5478      RF103F_8 5479-5480
        F103F8_8 5481-5482      F103F1_8 5483-5484      F103F2_8 5485-5486
        F103F3_8 5487-5488      F103F4_8 5489-5490      F103F7_8 5491-5492
        F103F5_8 5493-5494      RF103G_8 5495-5496      F103G8_8 5497-5498
        F103G1_8 5499-5500      F103G2_8 5501-5502      F103G3_8 5503-5504
        F103G4_8 5505-5506      F103G7_8 5507-5508      F103G5_8 5509-5510
        RF103H_8 5511-5512      F103H8_8 5513-5514      F103H1_8 5515-5516
        F103H2_8 5517-5518      F103H3_8 5519-5520      F103H4_8 5521-5522
        F103H7_8 5523-5524      F103H5_8 5525-5526      RF103I_8 5527-5528
        F103I8_8 5529-5530      F103I1_8 5531-5532      F103I2_8 5533-5534
        F103I3_8 5535-5536      F103I4_8 5537-5538      F103I7_8 5539-5540
        F103I5_8 5541-5542      RF103J_8 5543-5544      F103J8_8 5545-5546
        F103J1_8 5547-5548      F103J2_8 5549-5550      F103J3_8 5551-5552
        F103J4_8 5553-5554      F103J7_8 5555-5556      F103J5_8 5557-5558
        RF103K_8 5559-5560      F103K8_8 5561-5562      F103K1_8 5563-5564
        F103K2_8 5565-5566      F103K3_8 5567-5568      F103K4_8 5569-5570
        F103K7_8 5571-5572      F103K5_8 5573-5574      RF103L_8 5575-5576
        F103L8_8 5577-5578      F103L1_8 5579-5580      F103L2_8 5581-5582
        F103L3_8 5583-5584      F103L4_8 5585-5586      F103L7_8 5587-5588
        F103L5_8 5589-5590      RF103M_8 5591-5592      F103M8_8 5593-5594
        F103M1_8 5595-5596      F103M2_8 5597-5598      F103M3_8 5599-5600
        F103M4_8 5601-5602      F103M7_8 5603-5604      F103M5_8 5605-5606
        RF111_8 5607-5608       F111A_8 5609-5610       F111B_8 5611-5612
        F111C_8 5613-5614       RF112_8 5615-5616       F112A_8 5617-5618
        F112B_8 5619-5620       F112C_8 5621-5622       RF113_8 5623-5624
        F113A_8 5625-5626       F113B_8 5627-5628       F113C_8 5629-5630
        RF12_8 5631-5632        F12A_8 5633-5637        F12B_8 5638-5642
        F12C_8 5643-5647        RF13_8 5648-5649        F13A_8 5650-5654
        F13B_8 5655-5659        F13C_8 5660-5664        RF14_8 5665-5666
        F141_8 5667-5668        F142_8 5669-5670        F143_8 5671-5672
        F144_8 5673-5674        F145_8 5675-5676        F146_8 5677-5678
        F147_8 5679-5680        F148_8 5681-5682        F149_8 5683-5684
        RF15_8 5685-5686        F151_8 5687-5688        F152_8 5689-5690
        F153_8 5691-5692        F154_8 5693-5694        F155_8 5695-5696
        F156_8 5697-5698        F157_8 5699-5700        F158_8 5701-5702
        F159_8 5703-5704        F16_8 5705-5706         G01_8 5707-5708
        RG02_8 5709-5710        G02_8 5711-5712         G1_8 5713-5714
        RG21_8 5715-5716        G21_8 5717-5718         RG22_8 5719-5720
        G22_8 5721-5722         RG3_8 5723-5724         G3_8 5725-5726
        RG4_8 5727-5728         G4_8 5729-5730          RG51_8 5731-5732
        G511_8 5733-5735        G512_8 5736-5738        RG52_8 5739-5740
        G521_8 5741-5743        G522_8 5744-5746        G71_8 5747-5749
        G72_8 5750-5752         G81_8 5753-5754         G82_8 5755-5756
        G83_8 5757-5758         G9_8 5759-5760          RG101_8 5761-5762
        G101_8 5763-5765        RG102_8 5766-5767       G1021_8 5768-5770
        G122_8 5771-5773        G123_8 5774-5776        G11_8 5777-5778
        G12_8 5779-5780         G130_8 5781-5782        RG13 5783-5784
        G131_8 5785-5786        G132_8 5787-5788        RG14A_8 5789-5790
        G14A1_8 5791-5792       G14A2_8 5793-5795       RG14B_8 5796-5797
        G14B1_8 5798-5799       G14B2_8 5800-5802       RG14C_8 5803-5804
        G14C1_8 5805-5806       G14C2_8 5807-5809       RG15A_8 5810-5811
        G15A1_8 5812-5813       G15A2_8 5814-5815       G15A3_8 5816-5817
        RG15B_8 5818-5819       G15B1_8 5820-5821       G15B2_8 5822-5823
        G15B3_8 5824-5825       RG15C_8 5826-5827       G15C1_8 5828-5829
        G15C2_8 5830-5831       G15C3_8 5832-5833       RG15D_8 5834-5835
        G15D1_8 5836-5837       G15D2_8 5838-5839       G15D3_8 5840-5841
        RG15E_8 5842-5843       G15E1_8 5844-5845       G15E2_8 5846-5847
        G15E3_8 5848-5849       RG15F_8 5850-5851       G15F1_8 5852-5853
        G15F2_8 5854-5855       G15F3_8 5856-5857       RG15G_8 5858-5859
        G15G1_8 5860-5861       G15G2_8 5862-5863       G15G3_8 5864-5865
        RG15H_8 5866-5867       G15H1_8 5868-5869       G15H2_8 5870-5871
        G15H3_8 5872-5873       RG15I_8 5874-5875       G15I1_8 5876-5877
        G15I2_8 5878-5879       G15I3_8 5880-5881       RG15J_8 5882-5883
        G15J1_8 5884-5885       G15J2_8 5886-5887       G15J3_8 5888-5889
        RG15K_8 5890-5891       G15K1_8 5892-5893       G15K2_8 5894-5895
        G15K3_8 5896-5897       RG15L_8 5898-5899       G15L1_8 5900-5901
        G15L2_8 5902-5903       G15L3_8 5904-5905       RG15M_8 5906-5907
        G15M1_8 5908-5909       G15M2_8 5910-5911       G15M3_8 5912-5913
        RG15N_8 5914-5915       G15N1_8 5916-5917       G15N2_8 5918-5919
        G15N3_8 5920-5921       RG15O_8 5922-5923       G15O1_8 5924-5925
        G15O2_8 5926-5927       G15O3_8 5928-5929       RG15P_8 5930-5931
        G15P1_8 5932-5933       G15P2_8 5934-5935       G15P3_8 5936-5937
        RG15Q_8 5938-5939       G15Q1_8 5940-5941       G15Q2_8 5942-5943
        G15Q3_8 5944-5945       RG15R_8 5946-5947       G15R1_8 5948-5949
        G15R2_8 5950-5951       G15R3_8 5952-5953       RG15S_8 5954-5955
        G15S1_8 5956-5957       G15S2_8 5958-5959       G15S3_8 5960-5961
        RG15T_8 5962-5963       G15T1_8 5964-5965       G15T2_8 5966-5967
        G15T3_8 5968-5969       RG15U_8 5970-5971       G15U1_8 5972-5973
        G15U2_8 5974-5975       G15U3_8 5976-5977       RG15V_8 5978-5979
        G15V1_8 5980-5981       G15V2_8 5982-5983       G15V3_8 5984-5985
        H1_8 5986-5987          H21_8 5988-5989         H22_8 5990-5991
        H3_8 5992-5993          H6_8 5994-5995          H7_8 5996-5997
        H71_8 5998-5999         D8VYEAR 6000-6003       D8VMONTH 6004-6005
        D8VDAY 6006-6007        D8RESID 6008-6009       D8SEX 6010-6011
        D8MARRY 6012-6013       D8LIVARR 6014-6015      D8PERSON 6016-6017
        D8GENER 6018-6019       D8DPLACE 6020-6021      D8CARGIV 6022-6023
        D8PCGDAY 6024-6025      D8BEDRID 6026-6027      D8BEDDAY 6028-6031
        D8ILL 6032-6033         D8DISEA1 6034-6035      D8DIDAY1 6036-6039
        D8DISEA2 6040-6041      D8DIDAY2 6042-6045      D8DISEA3 6046-6047
        D8DIDAY3 6048-6051      D8HYPERT 6052-6053      D8DIABET 6054-6055
        D8HEART 6056-6057       D8CVD 6058-6059         D8PNEUM 6060-6061
        D8TUBERC 6062-6063      D8CANCER 6064-6065      D8GLAUCO 6066-6067
        D8PROSTA 6068-6069      D8GYNECO 6070-6071      D8GASTRI 6072-6073
        D8PARKIN 6074-6075      D8BEDSOR 6076-6077      D8DEMENT 6078-6079
        D8PSYCHO 6080-6081      D8NEUROS 6082-6083      D8ARTHRI 6084-6085
        D8OTHERS 6086-6087      D8MEDICA 6088-6089      D8FINANC 6090-6091
        D8INCOME 6092-6096      D8WCFACI 6097-6098      D8TAPWAT 6099-6100
        D8BATHFA 6101-6102      D8HEATER 6103-6104      D8TVSET 6105-6106
        D8WASHMA 6107-6108      D8PHONE 6109-6110       D8DOCTOR 6111-6112
        D8LICDOC 6113-6114      D8WHOPAY 6115-6116      D8MEDCOS 6117-6121
        D8POCKET 6122-6126      D8BATHFU 6127-6128      D8BATDAY 6129-6132
        D8DRESFU 6133-6134      D8DREDAY 6135-6138      D8TOILFU 6139-6140
        D8TOIDAY 6141-6144      D8MOVEFU 6145-6146      D8MOVDAY 6147-6150
        D8CONTFU 6151-6152      D8CONDAY 6153-6156      D8FEEDFU 6157-6158
        D8FEEDAY 6159-6162      D8FULLDA 6163-6166      D8CARCST 6167-6171
        D8DIRCST 6172-6176      D8CARPAY 6177-6178      D8OUTDOR 6179-6182
        D8ACTDAY 6183-6186      D8SMOKE 6187-6188       D8SMKTIM 6189-6190
        D8DRINK 6191-6192       D8KNDDRK 6193-6194      D8DRKMCH 6195-6196
        D8ADVDIR 6197-6198      D8DIRDAY 6199-6202      D8DREAM 6203-6204
        D8PAIN 6205-6206        D8UNCONS 6207-6208      D8UNCDAY 6209-6212
        DTH08_11 6213-6214      YEARIN_11 6215-6218     MONTHIN_11 6219-6220
        DAYIN_11 6221-6222      RESIC_11 6223-6224      VAGE_11 6225-6227
        RA51_11 6228-6229       A51_11 6230-6231        RA52_11 6232-6233
        A52_11 6234-6235        RA53A_11 6236-6237      A53A1_11 6238-6239
        A53A3_11 6240-6241      A53A2_11 6242-6244      A53A4_11 6245-6246
        A53A5_11 6247-6248      RA53B_11 6249-6250      A53B1_11 6251-6252
        A53B3_11 6253-6254      A53B2_11 6255-6257      A53B4_11 6258-6259
        A53B5_11 6260-6261      RA53C_11 6262-6263      A53C1_11 6264-6265
        A53C3_11 6266-6267      A53C2_11 6268-6270      A53C4_11 6271-6272
        A53C5_11 6273-6274      RA53D_11 6275-6276      A53D1_11 6277-6278
        A53D3_11 6279-6280      A53D2_11 6281-6283      A53D4_11 6284-6285
        A53D5_11 6286-6287      RA53E_11 6288-6289      A53E1_11 6290-6291
        A53E3_11 6292-6293      A53E2_11 6294-6296      A53E4_11 6297-6298
        A53E5_11 6299-6300      RA53F_11 6301-6302      A53F1_11 6303-6304
        A53F3_11 6305-6306      A53F2_11 6307-6309      A53F4_11 6310-6311
        A53F5_11 6312-6313      RA53G_11 6314-6315      A53G1_11 6316-6317
        A53G3_11 6318-6319      A53G2_11 6320-6322      A53G4_11 6323-6324
        A53G5_11 6325-6326      RA53H_11 6327-6328      A53H1_11 6329-6330
        A53H3_11 6331-6332      A53H2_11 6333-6335      A53H4_11 6336-6337
        A53H5_11 6338-6339      RA53I_11 6340-6341      A53I1_11 6342-6343
        A53I3_11 6344-6345      A53I2_11 6346-6348      A53I4_11 6349-6350
        A53I5_11 6351-6352      RA53J_11 6353-6354      A53J1_11 6355-6356
        A53J11_11 $6357         A53J3_11 6358-6359      A53J2_11 6360-6362
        A53J4_11 6363-6364      A53J5_11 6365-6366      RA530_11 6367-6368
        A530_11 6369-6370       RA531_11 6371-6372      A531_11 6373-6374
        RA532_11 6375-6376      A532_11 6377-6378       RA533_11 6379-6380
        A533_11 6381-6382       A533A_11 $6383          RA534_11 6384-6385
        A534_11 6386-6389       RA535_11 6390-6391      A535_11 6392-6393
        RA536_11 6394-6395      A536_11 6396-6397       RA537_11 6398-6399
        A537_11 6400-6401       RA540_11 6402-6403      A540_11 6404-6405
        RA541_11 6406-6407      A541_11 6408-6411       RA542_11 6412-6413
        A542_11 6414-6415       A542A_11 $6416          RA54_11 6417-6418
        A54A_11 6419-6422       A54B_11 6423-6424       B11_11 6425-6426
        B12_11 6427-6428        B121_11 6429-6430       B21_11 6431-6432
        B22_11 6433-6434        B23_11 6435-6436        B24_11 6437-6438
        B25_11 6439-6440        B26_11 6441-6442        B27_11 6443-6444
        B28_11 6445-6446        B29_11 6447-6448        B210_11 6449-6450
        C11_11 6451-6452        C12_11 6453-6454        C13_11 6455-6456
        C14_11 6457-6458        C15_11 6459-6460        C16_11 6461-6462
        C21A_11 6463-6464       C21B_11 6465-6466       C21C_11 6467-6468
        C22_11 6469-6470        C31A_11 6471-6472       C31B_11 6473-6474
        C31C_11 6475-6476       C31D_11 6477-6478       C31E_11 6479-6480
        C32_11 6481-6482        C41A_11 6483-6484       C41B_11 6485-6486
        C41C_11 6487-6488       C51A_11 6489-6490       C51B_11 6491-6492
        C52_11 6493-6494        C52X1_11 6495-6496      C52X2_11 6497-6498
        C53A_11 6499-6500       C53B_11 6501-6502       C53C_11 6503-6504
        C54_11 6505-6506        C55_11 6507-6508        RD1_11 6509-6510
        D1_11 6511-6512         RD2_11 6513-6514        D2_11 6515-6516
        RD31_11 6517-6518       D31_11 6519-6520        RD32_11 6521-6522
        D32_11 6523-6524        RD33_11 6525-6526       D33_11 6527-6528
        D33A_11 $6529           RD34_11 6530-6531       D34_11 6532-6533
        RD4MEAT_11 6534-6535    D4MEAT2_11 6536-6537    D4MEAT1_11 6538-6539
        RD4FISH_11 6540-6541    D4FISH2_11 6542-6543    D4FISH1_11 6544-6545
        RD4EGG_11 6546-6547     D4EGG2_11 6548-6549     D4EGG1_11 6550-6551
        RD4BEAN_11 6552-6553    D4BEAN2_11 6554-6555    D4BEAN1_11 6556-6557
        RD4VEG_11 6558-6559     D4VEG2_11 6560-6561     D4VEG1_11 6562-6563
        RD4SUGA_11 6564-6565    D4SUGA2_11 6566-6567    D4SUGA1_11 6568-6569
        RD4TEA_11 6570-6571     D4TEA2_11 6572-6573     D4TEA1_11 6574-6575
        RD4GARL_11 6576-6577    D4GARL2_11 6578-6579    D4GARL1_11 6580-6581
        RDEMILK_11 6582-6583    D4MILK1_11 6584-6585    D4MILK2_11 6586-6587
        RD4NUT_11 6588-6589     D4NUT1_11 6590-6591     D4NUT2_11 6592-6593
        RD4ALGA_11 6594-6595    D4ALGA1_11 6596-6597    D4ALGA2_11 6598-6599
        RD4VIT_11 6600-6601     D4VIT1_11 6602-6603     D4VIT2_11 6604-6605
        RD4DRUG_11 6606-6607    D4DRUG1_11 6608-6609    D4DRUG2_11 6610-6611
        RD5_11 6612-6613        D5_11 6614-6615         RD6_11 6616-6617
        D6A_11 6618-6619        D6B_11 6620-6621        D6C_11 6622-6623
        RD71_11 6624-6625       D71_11 6626-6627        RD72_11 6628-6629
        D72_11 6630-6631        RD73_11 6632-6633       D73_11 6634-6636
        RD74_11 6637-6638       D74_11 6639-6641        RD75_11 6642-6643
        D75_11 6644-6645        RD76_11 6646-6647       D76_11 6648-6649
        RD77_11 6650-6651       D77_11 6652-6653        RD78_11 6654-6655
        D78_11 6656-6657        D78A_11 6658-6659       D78B_11 6660-6661
        RD79_11 6662-6663       D79_11 6664-6665        D79A_11 6666-6667
        D79B_11 6668-6669       RD710_11 6670-6671      D710_11 6672-6673
        D710A_11 6674-6675      D710B_11 6676-6677      RD81_11 6678-6679
        D81_11 6680-6681        RD82_11 6682-6683       D82_11 6684-6685
        RD83_11 6686-6687       D83_11 6688-6690        RD84_11 6691-6692
        D84_11 6693-6695        RD85_11 6696-6697       D85_11 6698-6699
        RD86_11 6700-6701       D86_11 6702-6703        RD87_11 6704-6705
        D87_11 6706-6707        RD91_11 6708-6709       D91_11 6710-6711
        RD92_11 6712-6713       D92_11 6714-6715        RD93_11 6716-6717
        D93_11 6718-6720        RD94_11 6721-6722       D94_11 6723-6725
        RD101_11 6726-6727      D101_11 6728-6729       RD102_11 6730-6731
        D102_11 6732-6734       RD103_11 6735-6736      D103_11 6737-6739
        RD11A_11 6740-6741      D11A_11 6742-6743       RD11B_11 6744-6745
        D11B_11 6746-6747       RD11C_11 6748-6749      D11C_11 6750-6751
        RD11D_11 6752-6753      D11D_11 6754-6755       RD11E_11 6756-6757
        D11E_11 6758-6759       RD11F_11 6760-6761      D11F_11 6762-6763
        RD11G_11 6764-6765      D11G_11 6766-6767       RD11H_11 6768-6769
        D11H_11 6770-6771       RD12_11 6772-6773       D12_11 6774-6775
        RE0_11 6776-6777        E0_11 6778-6779         RE1_11 6780-6781
        E1_11 6782-6783         RE1B_11 6784-6785       E1B_11 6786-6789
        RE2_11 6790-6791        E2_11 6792-6793         RE2B_11 6794-6795
        E2B_11 6796-6799        RE3_11 6800-6801        E3_11 6802-6803
        RE3B_11 6804-6805       E3B_11 6806-6809        RE4_11 6810-6811
        E4_11 6812-6813         RE4B_11 6814-6815       E4B_11 6816-6819
        RE5_11 6820-6821        E5_11 6822-6823         RE5B_11 6824-6825
        E5B_11 6826-6829        RE6_11 6830-6831        E6_11 6832-6833
        RE6B_11 6834-6835       E6B_11 6836-6839        RE610_11 6840-6841
        E610_11 6842-6843       RE62_11 6844-6845       E62_11 6846-6847
        RE63_11 6848-6849       E63_11 6850-6854        RE64_11 6855-6856
        E64_11 6857-6858        E64A_11 $6859           RE65_11 6860-6861
        E65_11 6862-6863        RE67_11 6864-6865       E67_11 6866-6868
        RE7_11 6869-6870        E7_11 6871-6872         RE8_11 6873-6874
        E8_11 6875-6876         RE9_11 6877-6878        E9_11 6879-6880
        RE10_11 6881-6882       E10_11 6883-6884        RE11_11 6885-6886
        E11_11 6887-6888        RE12_11 6889-6890       E12_11 6891-6892
        RE13_11 6893-6894       E13_11 6895-6896        RE14_11 6897-6898
        E14_11 6899-6900        RF21_11 6901-6902       F21_11 6903-6904
        RF211_11 6905-6906      F211_11 6907-6908       RF22_11 6909-6910
        F22_11 6911-6914        RF221_11 6915-6916      F221_11 6917-6921
        RF23_11 6922-6923       F23_11 6924-6925        RF24_11 6926-6927
        F24_11 6928-6929        RF25_11 6930-6931       F251_11 6932-6936
        F252_11 6937-6941       RF25B_11 6942-6943      F25B1_11 6944-6947
        F25B2_11 6948-6949      RF26_11 6950-6951       F26_11 6952-6955
        RF27_11 6956-6957       F27_11 6958-6959        RF31_11 6960-6961
        F31_11 6962-6963        RF32_11 6964-6965       F32A_11 6966-6967
        F32B_11 6968-6969       F32C_11 6970-6971       F32D_11 6972-6973
        F32E_11 6974-6975       RF33_11 6976-6977       F33_11 6978-6979
        RF340_11 6980-6981      F340_11 6982-6983       RF34_11 6984-6985
        F34_11 6986-6987        RF35_11 6988-6989       F35_11 6990-6994
        RF41_11 6995-6996       F41_11 6997-6998        RF41A_11 6999-7000
        F41A1_11 7001-7002      F41A11_11 7003-7006     F41A12_11 7007-7008
        F41A2_11 7009-7010      F41A21_11 7011-7014     F41A22_11 7015-7016
        F41A3_11 7017-7018      F41A31_11 7019-7022     F41A32_11 7023-7024
        RF41B_11 7025-7026      F41B_11 7027-7028       F41B1_11 7029-7032
        F41B2_11 7033-7034      RF42_11 7035-7036       F42_11 7037-7038
        RF43A_11 7039-7040      F43A1_11 7041-7043      F43A2_11 7044-7045
        F43A3_11 7046-7048      F43A4_11 7049-7050      RF43B_11 7051-7052
        F43B1_11 7053-7055      F43B2_11 7056-7057      F43B3_11 7058-7060
        F43B4_11 7061-7062      RF43C_11 7063-7064      F43C1_11 7065-7067
        F43C2_11 7068-7069      F43C3_11 7070-7072      F43C4_11 7073-7074
        RF43D_11 7075-7076      F43D1_11 7077-7079      F43D2_11 7080-7081
        F43D3_11 7082-7084      F43D4_11 7085-7086      RF44_11 7087-7088
        F44_11 7089-7090        RF45_11 7091-7092       F45_11 7093-7094
        RF46_11 7095-7096       F46_11 7097-7098        RF47_11 7099-7100
        F47_11 7101-7102        RF5_11 7103-7104        F5_11 7105-7106
        RF61_11 7107-7108       F61_11 7109-7110        RF610_11 7111-7112
        F610_11 7113-7114       RF62_11 7115-7116       F62_11 7117-7118
        RF63_11 7119-7120       F63_11 7121-7122        RF64_11 7123-7124
        F64A_11 7125-7126       F64B_11 7127-7128       F64C_11 7129-7130
        F64D_11 7131-7132       F64E1_11 7133-7134      F64F1_11 7135-7136
        F64G1_11 7137-7138      F64H1_11 7139-7140      F64I_11 7141-7142
        RF651A1_11 7143-7144    F651A1_11 7145-7149     RF651B1_11 7150-7151
        F651B1_11 7152-7156     RF651A2_11 7157-7158    F651A2_11 7159-7163
        RF651B2_11 7164-7165    F651B2_11 7166-7170     RF6521_11 7171-7172
        F6521_11 7173-7174      RF652A_11 7175-7176     F652A_11 7177-7191 .12
        RF652B_11 7192-7193     F652B_11 7194-7195      RF66_11 7196-7197
        F66_11 7198-7199        RF71_11 7200-7201       F71_11 7202-7203
        RF721_11 7204-7205      F721_11 7206-7208       RF722_11 7209-7210
        F722_11 7211-7213       F722A_11 7214-7215      RF73_11 7216-7217
        F73_11 7218-7220        RF74_11 7221-7222       F74_11 7223-7224
        RF81_11 7225-7226       F81_11 7227-7228        RF821_11 7229-7230
        F821_11 7231-7233       RF822_11 7234-7235      F822_11 7236-7238
        F822A_11 7239-7240      RF83_11 7241-7242       F83_11 7243-7245
        RF84_11 7246-7247       F84_11 7248-7249        RF85_11 7250-7251
        F85_11 7252-7253        RF86_11 7254-7255       F86_11 7256-7257
        RF9_11 7258-7259        F9_11 7260-7261         F9A_11 7262-7263
        RF901_11 7264-7265      F901_11 7266-7267       RF901A_11 7268-7269
        F901A_11 7270-7271      F901B1_11 7272-7274     F901B2_11 7275-7277
        F901B3_11 7278-7280     RF902_11 7281-7282      F902_11 7283-7284
        RF902A_11 7285-7286     F902A_11 7287-7288      F902B1_11 7289-7291
        F902B2_11 7292-7294     F902B3_11 7295-7297     RF91_11 7298-7299
        F91_11 7300-7301        RF92A_11 7302-7303      F92A1_11 7304-7305
        F92A2_11 7306-7307      F92A3_11 7308-7309      F92A4_11 7310-7312
        F92A5_11 7313-7314      F92A6_11 7315-7316      F92A7_11 7317-7318
        RF92B_11 7319-7320      F92B1_11 7321-7322      F92B2_11 7323-7324
        F92B3_11 7325-7326      F92B4_11 7327-7329      F92B5_11 7330-7331
        F92B6_11 7332-7333      F92B7_11 7334-7335      RF92C_11 7336-7337
        F92C1_11 7338-7339      F92C2_11 7340-7341      F92C3_11 7342-7343
        F92C4_11 7344-7346      F92C5_11 7347-7348      F92C6_11 7349-7350
        F92C7_11 7351-7352      RF92D_11 7353-7354      F92D1_11 7355-7356
        F92D2_11 7357-7358      F92D3_11 7359-7360      F92D4_11 7361-7363
        F92D5_11 7364-7365      F92D6_11 7366-7367      F92D7_11 7368-7369
        RF92E_11 7370-7371      F92E1_11 7372-7373      F92E2_11 7374-7375
        F92E3_11 7376-7377      F92E4_11 7378-7380      F92E5_11 7381-7382
        F92E6_11 7383-7384      F92E7_11 7385-7386      RF92F_11 7387-7388
        F92F1_11 7389-7390      F92F2_11 7391-7392      F92F3_11 7393-7394
        F92F4_11 7395-7397      F92F5_11 7398-7399      F92F6_11 7400-7401
        F92F7_11 7402-7403      RF92G_11 7404-7405      F92G1_11 7406-7407
        F92G2_11 7408-7409      F92G3_11 7410-7411      F92G4_11 7412-7414
        F92G5_11 7415-7416      F92G6_11 7417-7418      F92G7_11 7419-7420
        RF92H_11 7421-7422      F92H1_11 7423-7424      F92H2_11 7425-7426
        F92H3_11 7427-7428      F92H4_11 7429-7431      F92H5_11 7432-7433
        F92H6_11 7434-7435      F92H7_11 7436-7437      RF92I_11 7438-7439
        F92I1_11 7440-7441      F92I2_11 7442-7443      F92I3_11 7444-7445
        F92I4_11 7446-7448      F92I5_11 7449-7450      F92I6_11 7451-7452
        F92I7_11 7453-7454      RF92J_11 7455-7456      F92J1_11 7457-7458
        F92J2_11 7459-7460      F92J3_11 7461-7462      F92J4_11 7463-7465
        F92J5_11 7466-7467      F92J6_11 7468-7469      F92J7_11 7470-7471
        JIGE_11 7472-7473       RF10_11 7474-7475       F10_11 7476-7477
        F10A_11 7478-7479       RF101_11 7480-7481      F101_11 7482-7483
        RF102_11 7484-7485      F102_11 7486-7487       F103_11 7488-7489
        RF1030_11 7490-7491     F1030_11 7492-7493      RF1030A_11 7494-7495
        F1030A_11 7496-7497     F1030B1_11 7498-7500    F1030B2_11 7501-7503
        F1030B3_11 7504-7506    RF1031_11 7507-7508     F1031_11 7509-7510
        RF1031A_11 7511-7512    F1031A_11 7513-7514     F1031B1_11 7515-7517
        F1031B2_11 7518-7520    F1031B3_11 7521-7523    RF103A_11 7524-7525
        F103A8_11 7526-7527     F103A1_11 7528-7529     F103A2_11 7530-7531
        F103A3_11 7532-7533     F103A4_11 7534-7535     F103A7_11 7536-7537
        F103A5_11 7538-7539     RF103B_11 7540-7541     F103B8_11 7542-7543
        F103B1_11 7544-7545     F103B2_11 7546-7547     F103B3_11 7548-7549
        F103B4_11 7550-7551     F103B7_11 7552-7553     F103B5_11 7554-7555
        RF103C_11 7556-7557     F103C8_11 7558-7559     F103C1_11 7560-7561
        F103C2_11 7562-7563     F103C3_11 7564-7565     F103C4_11 7566-7567
        F103C7_11 7568-7569     F103C5_11 7570-7571     RF103D_11 7572-7573
        F103D8_11 7574-7575     F103D1_11 7576-7577     F103D2_11 7578-7579
        F103D3_11 7580-7581     F103D4_11 7582-7583     F103D7_11 7584-7585
        F103D5_11 7586-7587     RF103E_11 7588-7589     F103E8_11 7590-7591
        F103E1_11 7592-7593     F103E2_11 7594-7595     F103E3_11 7596-7597
        F103E4_11 7598-7599     F103E7_11 7600-7601     F103E5_11 7602-7603
        RF103F_11 7604-7605     F103F8_11 7606-7607     F103F1_11 7608-7609
        F103F2_11 7610-7611     F103F3_11 7612-7613     F103F4_11 7614-7615
        F103F7_11 7616-7617     F103F5_11 7618-7619     RF103G_11 7620-7621
        F103G8_11 7622-7623     F103G1_11 7624-7625     F103G2_11 7626-7627
        F103G3_11 7628-7629     F103G4_11 7630-7631     F103G7_11 7632-7633
        F103G5_11 7634-7635     RF103H_11 7636-7637     F103H8_11 7638-7639
        F103H1_11 7640-7641     F103H2_11 7642-7643     F103H3_11 7644-7645
        F103H4_11 7646-7647     F103H7_11 7648-7649     F103H5_11 7650-7651
        RF103I_11 7652-7653     F103I8_11 7654-7655     F103I1_11 7656-7657
        F103I2_11 7658-7659     F103I3_11 7660-7661     F103I4_11 7662-7663
        F103I7_11 7664-7665     F103I5_11 7666-7667     RF103J_11 7668-7669
        F103J8_11 7670-7671     F103J1_11 7672-7673     F103J2_11 7674-7675
        F103J3_11 7676-7677     F103J4_11 7678-7679     F103J7_11 7680-7681
        F103J5_11 7682-7683     RF103K_11 7684-7685     F103K8_11 7686-7687
        F103K1_11 7688-7689     F103K2_11 7690-7691     F103K3_11 7692-7693
        F103K4_11 7694-7695     F103K7_11 7696-7697     F103K5_11 7698-7699
        RF103L_11 7700-7701     F103L8_11 7702-7703     F103L1_11 7704-7705
        F103L2_11 7706-7707     F103L3_11 7708-7709     F103L4_11 7710-7711
        F103L7_11 7712-7713     F103L5_11 7714-7715     RF103M_11 7716-7717
        F103M8_11 7718-7719     F103M1_11 7720-7721     F103M2_11 7722-7723
        F103M3_11 7724-7725     F103M4_11 7726-7727     F103M7_11 7728-7729
        F103M5_11 7730-7731     RF1032_11 7732-7733     F1032_11 7734-7735
        RF1033_11 7736-7737     F1033_11 7738-7739      F111A_11 7740-7741
        F111B_11 7742-7743      F111C_11 7744-7745      F112A_11 7746-7747
        F112B_11 7748-7749      F112C_11 7750-7751      F113A_11 7752-7753
        F113B_11 7754-7755      F113C_11 7756-7757      RF12_11 7758-7759
        F12A_11 7760-7764       F12B_11 7765-7769       F12C_11 7770-7774
        RF13_11 7775-7776       F13A_11 7777-7781       F13B_11 7782-7786
        F13C_11 7787-7791       RF14_11 7792-7793       F141_11 7794-7795
        F142_11 7796-7797       F143_11 7798-7799       F144_11 7800-7801
        F145_11 7802-7803       F146_11 7804-7805       F147_11 7806-7807
        F148_11 7808-7809       F149_11 7810-7811       F14T_11 $7812
        RF15_11 7813-7814       F151_11 7815-7816       F152_11 7817-7818
        F153_11 7819-7820       F154_11 7821-7822       F155_11 7823-7824
        F156_11 7825-7826       F157_11 7827-7828       F158_11 7829-7830
        F159_11 7831-7832       F15T_11 $7833           F16_11 7834-7835
        RG01_11 7836-7837       G01_11 7838-7839        RG02_11 7840-7841
        G02_11 7842-7843        RG1_11 7844-7845        G1_11 7846-7847
        G1A_11 $7848            RG21_11 7849-7850       G21_11 7851-7852
        RG22_11 7853-7854       G22_11 7855-7856        RG23_11 7857-7858
        G23_11 7859-7860        RG24_11 7861-7862       G24_11 7863-7864
        RG24A_11 7865-7866      G24A_11 7867-7868       RG25_11 7869-7870
        G25_11 7871-7872        RG25A_11 7873-7874      G25A_11 7875-7876
        RG3_11 7877-7878        G3_11 7879-7880         RG4_11 7881-7882
        G4_11 7883-7884         RG4A_11 7885-7886       G4A_11 7887-7888
        RG4B_11 7889-7890       G4B_11 7891-7892        RG5_11 7893-7894
        G511_11 7895-7897       G512_11 7898-7900       G521_11 7901-7903
        G522_11 7904-7906       G6_11 7907-7908         G7_11 7909-7911
        G81_11 7912-7913        G82_11 7914-7915        G83_11 7916-7917
        G9_11 7918-7919         G101_11 7920-7922       G1011_11 7923-7924
        G102_11 7925-7926       G1021_11 7927-7929      G122_11 7930-7932
        G123_11 7933-7935       G102B_11 7936-7938      G102C_11 7939-7941
        RG106_11 7942-7943      G106_11 7944-7945       RG1061_11 7946-7947
        G1061_11 7948-7949      RG1062_11 7950-7951     G1062_11 7952-7953
        RG1063_11 7954-7955     G1063_11 7956-7957      G11_11 7958-7959
        G12_11 7960-7961        RG130_11 7962-7963      G130_11 7964-7965
        RG13_11 7966-7967       G131_11 7968-7969       G132_11 7970-7971
        RG14A_11 7972-7973      G14A1_11 7974-7975      G14A2_11 7976-7978
        RG14B_11 7979-7980      G14B1_11 7981-7982      G14B2_11 7983-7985
        RG14C_11 7986-7987      G14C1_11 7988-7989      G14C2_11 7990-7992
        G15A1_11 7993-7994      G15A2_11 7995-7996      G15A3_11 7997-7998
        G15B1_11 7999-8000      G15B2_11 8001-8002      G15B3_11 8003-8004
        G15C1_11 8005-8006      G15C2_11 8007-8008      G15C3_11 8009-8010
        G15D1_11 8011-8012      G15D2_11 8013-8014      G15D3_11 8015-8016
        G15E1_11 8017-8018      G15E2_11 8019-8020      G15E3_11 8021-8022
        G15F1_11 8023-8024      G15F2_11 8025-8026      G15F3_11 8027-8028
        G15G1_11 8029-8030      G15G2_11 8031-8032      G15G3_11 8033-8034
        G15H1_11 8035-8036      G15H2_11 8037-8038      G15H3_11 8039-8040
        G15I1_11 8041-8042      G15I2_11 8043-8044      G15I3_11 8045-8046
        G15J1_11 8047-8048      G15J2_11 8049-8050      G15J3_11 8051-8052
        G15K1_11 8053-8054      G15K2_11 8055-8056      G15K3_11 8057-8058
        G15L1_11 8059-8060      G15L2_11 8061-8062      G15L3_11 8063-8064
        G15M1_11 8065-8066      G15M2_11 8067-8068      G15M3_11 8069-8070
        G15N1_11 8071-8072      G15N2_11 8073-8074      G15N3_11 8075-8076
        G15O1_11 8077-8078      G15O2_11 8079-8080      G15O3_11 8081-8082
        G15P1_11 8083-8084      G15P2_11 8085-8086      G15P3_11 8087-8088
        G15Q1_11 8089-8090      G15Q2_11 8091-8092      G15Q3_11 8093-8094
        G15R1_11 8095-8096      G15R2_11 8097-8098      G15R3_11 8099-8100
        G15N1A_11 8101-8102     G15N2A_11 8103-8104     G15N3A_11 8105-8106
        G15S1_11 8107-8108      G15S2_11 8109-8110      G15S3_11 8111-8112
        G15T1_11 8113-8114      G15T2_11 8115-8116      G15T3_11 8117-8118
        G15U1_11 8119-8120      G15U2_11 8121-8122      G15U3_11 8123-8124
        G15J1A_11 8125-8126     G15J2A_11 8127-8128     G15J3A_11 8129-8130
        G15V1_11 8131-8132      G15V2_11 8133-8134      G15V3_11 8135-8136
        G15Y2_11 8137-8138      G15Y3_11 8139-8140      H1_11 8141-8142
        H21_11 8143-8144        H22_11 8145-8146        H3_11 8147-8148
        H6_11 8149-8150         H7_11 8151-8152         H71_11 8153-8154
        D11VYEAR 8155-8158      D11VMONTH 8159-8160     D11VDAY 8161-8162
        D11RESID 8163-8164      D11AGE 8165-8167        D11MARRY 8168-8169
        D11MARRY1 8170-8171     D11YR1 8172-8175        D11MON1 8176-8177
        D11RETIRE 8178-8179     D11RETYR 8180-8183      D11RETPEN 8184-8187
        D11INSUR 8188-8189      D11PAYIND 8190-8194     D11PAYGOV 8195-8199
        D11INSPEN 8200-8203     D11NOINSU 8204-8205     D11A53A1 8206-8207
        D11A53A3 8208-8209      D11A53A4 8210-8212      D11A53A5 8213-8214
        D11A53A6 8215-8216      D11A53B1 8217-8218      D11A53B3 8219-8220
        D11A53B4 8221-8223      D11A53B5 8224-8225      D11A53B6 8226-8227
        D11A53C1 8228-8229      D11A53C3 8230-8231      D11A53C4 8232-8234
        D11A53C5 8235-8236      D11A53C6 8237-8238      D11A53D1 8239-8240
        D11A53D3 8241-8242      D11A53D4 8243-8245      D11A53D5 8246-8247
        D11A53D6 8248-8249      D11A53E1 8250-8251      D11A53E3 8252-8253
        D11A53E4 8254-8256      D11A53E5 8257-8258      D11A53E6 8259-8260
        D11A53F1 8261-8262      D11A53F3 8263-8264      D11A53F4 8265-8267
        D11A53F5 8268-8269      D11A53F6 8270-8271      D11A53G1 8272-8273
        D11A53G3 8274-8275      D11A53G4 8276-8278      D11A53G5 8279-8280
        D11A53G6 8281-8282      D11A53H1 8283-8284      D11A53H3 8285-8286
        D11A53H4 8287-8289      D11A53H5 8290-8291      D11A53H6 8292-8293
        D11A53I1 8294-8295      D11A53I3 8296-8297      D11A53I4 8298-8300
        D11A53I5 8301-8302      D11A53I6 8303-8304      D11A53J1 8305-8306
        D11A53J3 8307-8308      D11A53J4 8309-8311      D11A53J5 8312-8313
        D11A53J6 8314-8315      D11LIVARR 8316-8317     D11PERSON 8318-8319
        D11GENER 8320-8321      D11DPLACE 8322-8323     D11CARGIV 8324-8325
        D11PCGDAY 8326-8327     D11BEDRID 8328-8329     D11BEDDAY 8330-8333
        D11ILL 8334-8335        D11DISEA1 8336-8337     D11DIDAY1 8338-8341
        D11DISEA2 8342-8343     D11DIDAY2 8344-8347     D11DISEA3 8348-8349
        D11DIDAY3 8350-8353     D11HYPERT 8354-8355     D11DIABET 8356-8357
        D11HEART 8358-8359      D11CVD 8360-8361        D11PNEUM 8362-8363
        D11TUBERC 8364-8365     D11CANCER 8366-8367     D11GLAUCO 8368-8369
        D11PROSTA 8370-8371     D11GYNECO 8372-8373     D11GASTRI 8374-8375
        D11PARKIN 8376-8377     D11BEDSOR 8378-8379     D11DEMENT 8380-8381
        D11PSYCHO 8382-8383     D11NEUROS 8384-8385     D11ARTHRI 8386-8387
        D11OTHERS 8388-8389     D11MEDICA 8390-8391     D11FINANC 8392-8393
        D11INCOME 8394-8398     D11WCFACI 8399-8400     D11TAPWAT 8401-8402
        D11BATHFA 8403-8404     D11HEATER 8405-8406     D11TVSET 8407-8408
        D11WASHMA 8409-8410     D11PHONE 8411-8412      D11DOCTOR 8413-8414
        D11LICDOC 8415-8416     D11WHOPAY 8417-8418     D11MEDCOS 8419-8423
        D11POCKET 8424-8428     D11BATHFU 8429-8430     D11BATDAY 8431-8434
        D11BATDAY1 8435-8438    D11BATDAY2 8439-8442    D11DRESFU 8443-8444
        D11DREDAY 8445-8448     D11DREDAY1 8449-8452    D11DREDAY2 8453-8456
        D11TOILFU 8457-8458     D11TOIDAY 8459-8462     D11TOIDAY1 8463-8466
        D11TOIDAY2 8467-8470    D11MOVEFU 8471-8472     D11MOVDAY 8473-8476
        D11MOVDAY1 8477-8480    D11MOVDAY2 8481-8484    D11CONTFU 8485-8486
        D11CONDAY 8487-8490     D11CONDAY1 8491-8494    D11CONDAY2 8495-8498
        D11FEEDFU 8499-8500     D11FEEDAY 8501-8504     D11FEEDAY1 8505-8508
        D11FEEDAY2 8509-8512    D11FULLDA 8513-8516     D11CARCST 8517-8521
        D11DIRCST 8522-8526     D11CARPAY 8527-8528     D11OUTDOR 8529-8532
        D11ACTDAY 8533-8536     D11SMOKE 8537-8538      D11SMKTIM 8539-8540
        D11D21B 8541-8542       D11DRINK 8543-8544      D11KNDDRK 8545-8546
        D11DRKMCH 8547-8548     D11ADVDIR 8549-8550     D11DIRDAY 8551-8554
        D11DREAM 8555-8556      D11PAIN 8557-8558       D11UNCONS 8559-8560
        D11UNCDAY 8561-8564     D11A533 8565-8566       D11A534 8567-8570
        D11A535 8571-8572       D11A536 8573-8574       D11A537 8575-8576
        D11G23 8577-8578        D11G24 8579-8580        D11G24A 8581-8582
        D11G25 8583-8584        D11G25A 8585-8586       D11G4 8587-8588
        D11G4A 8589-8590        D11G4B 8591-8592        D11G102 8593-8595
        D11G106 8596-8597       D11G1061 8598-8599      D11G1062 8600-8601
        D11G1063 8602-8603      DTH11_14 8604-8605      YEARIN_14 8606-8609
        MONTHIN_14 8610-8611    DAYIN_14 8612-8613      V_BTHYR_14 8614-8617
        V_BTHMON_14 8618-8619   RESIDENC_14 8620        TRUEAGE_14 8621-8623
        RA41_14 8624            A41_14 8625-8626        RA42_14 8627
        A42_14 8628             RA43_14 8629-8630       A43_14 8631
        RA51_14 8632            A51_14 8633             RA52_14 8634
        A52_14 8635-8636        RA53A_14 8637-8638      A53A1_14 8639-8640
        A53A11_14 8641          A53A2_14 8642-8644      A53A3_14 8645-8646
        A53A4_14 8647-8648      A53A5_14 8649-8650      RA53B_14 8651-8652
        A53B1_14 8653-8654      A53B11_14 8655          A53B2_14 8656-8658
        A53B3_14 8659-8661      A53B4_14 8662-8663      A53B5_14 8664-8665
        RA53C_14 8666-8667      A53C1_14 8668-8669      A53C11_14 8670
        A53C2_14 8671-8673      A53C3_14 8674-8676      A53C4_14 8677-8678
        A53C5_14 8679-8680      RA53D_14 8681-8682      A53D1_14 8683-8684
        A53D11_14 8685          A53D2_14 8686-8688      A53D3_14 8689-8691
        A53D4_14 8692-8693      A53D5_14 8694-8695      RA53E_14 8696-8697
        A53E1_14 8698-8699      A53E11_14 8700          A53E2_14 8701-8703
        A53E3_14 8704-8706      A53E4_14 8707-8708      A53E5_14 8709-8710
        RA53F_14 8711-8712      A53F1_14 8713-8714      A53F11_14 8715
        A53F2_14 8716-8718      A53F3_14 8719-8721      A53F4_14 8722-8723
        A53F5_14 8724-8725      RA53G_14 8726-8727      A53G1_14 8728-8729
        A53G11_14 8730          A53G2_14 8731-8733      A53G3_14 8734-8736
        A53G4_14 8737-8738      A53G5_14 8739-8740      RA53H_14 8741-8742
        A53H1_14 8743-8744      A53H11_14 8745          A53H2_14 8746-8748
        A53H3_14 8749-8751      A53H4_14 8752-8753      A53H5_14 8754-8755
        RA53I_14 8756-8757      A53I1_14 8758-8759      A53I11_14 8760
        A53I2_14 8761-8763      A53I3_14 8764-8765      A53I4_14 8766-8767
        A53I5_14 8768-8769      RA53J_14 8770-8771      A53J1_14 8772-8773
        A53J11_14 8774          A53J2_14 8775-8777      A53J3_14 8778-8780
        A53J4_14 8781-8782      A53J5_14 8783-8784      RA530_14 8785-8786
        A530_14 8787-8788       A530A_14 8789           RA531_14 8790-8791
        A531_14 8792-8793       A531A_14 8794           RA532_14 8795-8796
        A532_14 8797-8798       RA533_14 8799-8800      A533_14 8801
        A533A_14 8802           RA534_14 8803-8804      A534_14 8805-8808
        RA535_14 8809-8810      A535_14 8811            RA536_14 8812-8813
        A536_14 8814            RA537_14 8815-8816      A537_14 8817
        A537A_14 8818           RA540_14 8819-8820      A540_14 8821
        RA541_14 8822-8823      A541_14 8824-8827       RA542_14 8828-8829
        A542_14 8830-8831       A542A_14 8832           RA54_14 8833-8834
        A54A_14 8835-8838       A54B_14 8839-8840       B11_14 8841
        B12_14 8842             B121_14 8843            B21_14 8844
        B22_14 8845             B23_14 8846             B24_14 8847
        B25_14 8848             B26_14 8849             B27_14 8850
        B28_14 8851             B29_14 8852             B210_14 8853
        C11_14 8854             C12_14 8855             C13_14 8856
        C14_14 8857             C15_14 8858             C16_14 8859-8860
        C21A_14 8861            C21B_14 8862            C21C_14 8863
        C22_14 8864-8865        C31A_14 8866            C31B_14 8867
        C31C_14 8868            C31D_14 8869            C31E_14 8870
        C32_14 8871             C41A_14 8872            C41B_14 8873
        C41C_14 8874            C51A_14 8875            C51B_14 8876
        C52_14 8877             C53A_14 8878            C53B_14 8879
        C53C_14 8880            C54_14 8881             C55_14 8882-8883
        RD1_14 8884             D1_14 8885              RD2_14 8886
        D2_14 8887-8888         RD31_14 8889            D31_14 8890
        RD32_14 8891            D32_14 8892             RD33_14 8893-8894
        D33_14 8895             D33A_14 8896            RD34_14 8897-8898
        D34_14 8899             RD4MEAT_14 8900         D4MEAT2_14 8901
        D4MEAT1_14 8902         RD4FISH_14 8903         D4FISH2_14 8904
        D4FISH1_14 8905         RD4EGG_14 8906          D4EGG2_14 8907
        D4EGG1_14 8908          RD4BEAN_14 8909         D4BEAN2_14 8910
        D4BEAN1_14 8911         RD4VEG_14 8912          D4VEG2_14 8913
        D4VEG1_14 8914          RD4SUGA_14 8915         D4SUGA2_14 8916
        D4SUGA1_14 8917         RD4TEA_14 8918          D4TEA2_14 8919
        D4TEA1_14 8920          RD4GARL_14 8921         D4GARL2_14 8922
        D4GARL1_14 8923         RD4MILK_14 8924-8925    D4MILK1_14 8926
        D4MILK2_14 8927         RD4NUT_14 8928-8929     D4NUT1_14 8930
        D4NUT2_14 8931          RD4ALGA_14 8932-8933    D4ALGA1_14 8934
        D4ALGA2_14 8935         RD4VIT_14 8936-8937     D4VIT1_14 8938
        D4VIT2_14 8939          RD4DRUG_14 8940-8941    D4DRUG1_14 8942
        D4DRUG2_14 8943         D4A_14 8944             D4B_14 8945
        RD5_14 8946             D5_14 8947              RD6_14 8948-8949
        D6A_14 8950             D6B_14 8951             D6C_14 8952
        RD71_14 8953            D71_14 8954             RD72_14 8955-8956
        D72_14 8957             RD73_14 8958-8959       D73_14 8960-8962
        RD74_14 8963-8964       D74_14 8965-8967        RD75_14 8968-8969
        D75_14 8970-8971        RD76_14 8972-8973       D76_14 8974-8975
        RD77_14 8976-8977       D77_14 8978             RD78_14 8979-8980
        D78_14 8981             D78A_14 8982-8983       D78B_14 8984-8985
        RD79_14 8986-8987       D79_14 8988             D79A_14 8989-8990
        D79B_14 8991-8992       RD710_14 8993-8994      D710_14 8995
        D710A_14 8996-8997      D710B_14 8998-8999      RD81_14 9000
        D81_14 9001             RD82_14 9002-9003       D82_14 9004
        RD83_14 9005-9006       D83_14 9007-9009        RD84_14 9010-9011
        D84_14 9012-9014        RD85_14 9015-9016       D85_14 9017-9018
        D85A_14 9019            RD86_14 9020-9021       D86_14 9022-9023
        RD87_14 9024-9025       D87_14 9026             RD91_14 9027
        D91_14 9028             RD92_14 9029-9030       D92_14 9031-9033
        RD93_14 9034-9035       D93_14 9036-9038        RD94_14 9039-9040
        D94_14 9041-9043        RD101_14 9044-9045      D101_14 9046
        RD102_14 9047-9048      D102_14 9049-9051       RD103_14 9052-9053
        D103_14 9054-9056       RD11A_14 9057-9058      D11A_14 9059
        RD11B_14 9060-9061      D11B_14 9062            RD11C_14 9063-9064
        D11C_14 9065            RD11D_14 9066-9067      D11D_14 9068
        RD11E_14 9069-9070      D11E_14 9071            RD11F_14 9072-9073
        D11F_14 9074            RD11G_14 9075-9076      D11G_14 9077
        RD11H_14 9078-9079      D11H_14 9080            RD12_14 9081-9082
        D12_14 9083-9084        RE0_14 9085-9086        E0_14 9087
        RE1_14 9088             E1_14 9089              RE1B_14 9090-9091
        E1B_14 9092-9095        RE2_14 9096             E2_14 9097
        RE2B_14 9098-9099       E2B_14 9100-9103        RE3_14 9104
        E3_14 9105              RE3B_14 9106-9107       E3B_14 9108-9111
        RE4_14 9112             E4_14 9113              RE4B_14 9114-9115
        E4B_14 9116-9119        RE5_14 9120             E5_14 9121
        RE5B_14 9122-9123       E5B_14 9124-9127        RE6_14 9128
        E6_14 9129              RE6B_14 9130-9131       E6B_14 9132-9135
        RE610_14 9136-9137      E610_14 9138-9139       RE62_14 9140-9141
        E62_14 9142-9143        RE63_14 9144-9145       E63_14 9146-9150
        RE64_14 9151-9152       E64_14 9153-9154        E64A_14 9155
        RE65_14 9156-9157       E65_14 9158-9159        RE67_14 9160-9161
        E67_14 9162-9164        RE7_14 9165-9166        E7_14 9167
        RE8_14 9168-9169        E8_14 9170              RE9_14 9171-9172
        E9_14 9173              RE10_14 9174-9175       E10_14 9176
        RE11_14 9177-9178       E11_14 9179             RE12_14 9180-9181
        E12_14 9182             RE13_14 9183-9184       E13_14 9185
        RE14_14 9186-9187       E14_14 9188             RF1_14 9189-9190
        F1_14 9191-9192         RF2_14 9193-9194        F2_14 9195
        RF21_14 9196-9197       F21_14 9198-9199        RF211_14 9200-9201
        F211_14 9202-9203       RF22_14 9204-9205       F22_14 9206-9209
        RF221_14 9210-9211      F221_14 9212-9216       RF23_14 9217-9218
        F23_14 9219-9220        RF24_14 9221-9222       F24_14 9223
        RF25A_14 9224-9225      F25A1_14 9226-9230      F25A2_14 9231-9235
        RF25B_14 9236-9237      F25B1_14 9238-9241      F25B2_14 9242-9243
        RF26_14 9244-9245       F26_14 9246-9248        RF27_14 9249-9250
        F27_14 9251             RF31_14 9252            F31_14 9253
        RF32_14 9254            F32A_14 9255-9256       F32B_14 9257-9258
        F32C_14 9259-9260       F32D_14 9261-9262       F32E_14 9263-9264
        RF33_14 9265-9266       F33_14 9267-9268        RF340_14 9269-9270
        F340_14 9271            RF34_14 9272-9273       F34_14 9274
        RF35_14 9275-9276       F35_14 9277-9281        RF41_14 9282
        F41_14 9283             RF41A_14 9284-9285      F41A1_14 9286
        F41A11_14 9287-9290     F41A12_14 9291-9292     F41A2_14 9293
        F41A21_14 9294-9297     F41A22_14 9298-9299     F41A3_14 9300
        F41A31_14 9301-9304     F41A32_14 9305-9306     RF41B_14 9307-9308
        F41B_14 9309            F41B1_14 9310-9313      F41B2_14 9314-9315
        RF42_14 9316-9317       F42_14 9318-9319        RF43A_14 9320-9321
        F43A1_14 9322-9324      F43A2_14 9325-9326      F43A3_14 9327-9329
        F43A4_14 9330-9331      RF43B_14 9332-9333      F43B1_14 9334-9336
        F43B2_14 9337-9338      F43B3_14 9339-9341      F43B4_14 9342-9343
        RF43C_14 9344-9345      F43C1_14 9346-9348      F43C2_14 9349-9350
        F43C3_14 9351-9353      F43C4_14 9354-9355      RF43D_14 9356-9357
        F43D1_14 9358-9360      F43D2_14 9361-9362      F43D3_14 9363-9365
        F43D4_14 9366-9367      RF44_14 9368-9369       F44_14 9370-9371
        RF45_14 9372-9373       F45_14 9374-9375        RF46_14 9376-9377
        F46_14 9378-9379        RF47_14 9380-9381       F47_14 9382
        RF5_14 9383             F5_11_14 9384-9385      RF61_14 9386
        F61_14 9387             RF610_14 9388-9389      F610_14 9390-9391
        RF62_14 9392-9393       F62_14 9394             RF63_14 9395-9396
        F63_14 9397             RF64_14 9398            F64A_14 9399
        F64B_14 9400            F64C_14 9401            F64D_14 9402
        F64E_14 9403            F64F_14 9404            F64G_14 9405
        F64H_14 9406            F64I_14 9407            RF651A1_14 9408-9409
        F651A1_14 9410-9414     RF651B1_14 9415-9416    F651B1_14 9417-9421
        RF651A2_14 9422-9423    F651A2_14 9424-9428     RF651B2_14 9429-9430
        F651B2_14 9431-9435     RF6521_14 9436-9437     F6521_14 9438
        F6521T_14 9439          RF652A_14 9440-9441     F652A_14 9442-9456 .12
        RF652B_14 9457-9458     F652B_14 9459           RF66_14 9460-9461
        F66_14 9462             RF71_14 9463-9464       F71_14 9465
        RF721_14 9466-9467      F721_14 9468-9470       RF722_14 9471-9472
        F722_14 9473-9475       RF73_14 9476-9477       F73_14 9478-9480
        RF74_14 9481            F74_14 9482-9483        RF81_14 9484-9485
        F81_14 9486             RF821_14 9487-9488      F821_14 9489-9491
        RF822_14 9492-9493      F822_14 9494-9496       RF83_14 9497-9498
        F83_14 9499-9501        RF84_14 9502-9503       F84_14 9504
        RF85_14 9505            F85_14 9506-9507        RF86_14 9508
        F86_14 9509-9510        RF91_14 9511-9512       F91_14 9513-9514
        RF92A_14 9515-9516      F92A1_14 9517-9518      F92A2_14 9519-9520
        F92A3_14 9521-9522      F92A4_14 9523-9525      F92A5_14 9526-9527
        F92A6_14 9528-9529      F92A7_14 9530-9531      RF92B_14 9532-9533
        F92B1_14 9534-9535      F92B2_14 9536-9537      F92B3_14 9538-9539
        F92B4_14 9540-9542      F92B5_14 9543-9544      F92B6_14 9545-9546
        F92B7_14 9547-9548      RF92C_14 9549-9550      F92C1_14 9551-9552
        F92C2_14 9553-9554      F92C3_14 9555-9556      F92C4_14 9557-9559
        F92C5_14 9560-9561      F92C6_14 9562-9563      F92C7_14 9564-9565
        RF92D_14 9566-9567      F92D1_14 9568-9569      F92D2_14 9570-9571
        F92D3_14 9572-9573      F92D4_14 9574-9576      F92D5_14 9577-9578
        F92D6_14 9579-9580      F92D7_14 9581-9582      RF92E_14 9583-9584
        F92E1_14 9585-9586      F92E2_14 9587-9588      F92E3_14 9589-9590
        F92E4_14 9591-9593      F92E5_14 9594-9595      F92E6_14 9596-9597
        F92E7_14 9598-9599      RF92F_14 9600-9601      F92F1_14 9602-9603
        F92F2_14 9604-9605      F92F3_14 9606-9607      F92F4_14 9608-9610
        F92F5_14 9611-9612      F92F6_14 9613-9614      F92F7_14 9615-9616
        RF92G_14 9617-9618      F92G1_14 9619-9620      F92G2_14 9621-9622
        F92G3_14 9623-9624      F92G4_14 9625-9627      F92G5_14 9628-9629
        F92G6_14 9630-9631      F92G7_14 9632-9633      RF92H_14 9634-9635
        F92H1_14 9636-9637      F92H2_14 9638-9639      F92H3_14 9640-9641
        F92H4_14 9642-9644      F92H5_14 9645-9646      F92H6_14 9647-9648
        F92H7_14 9649-9650      RF92I_14 9651-9652      F92I1_14 9653-9654
        F92I2_14 9655-9656      F92I3_14 9657-9658      F92I4_14 9659-9661
        F92I5_14 9662-9663      F92I6_14 9664-9665      F92I7_14 9666-9667
        RF92J_14 9668-9669      F92J1_14 9670-9671      F92J2_14 9672-9673
        F92J3_14 9674-9675      F92J4_14 9676-9678      F92J5_14 9679-9680
        F92J6_14 9681-9682      F92J7_14 9683-9684      JIGE_14 9685-9686
        RF10_14 9687-9688       F10_14 9689-9690        F10A_14 9691-9692
        RF101_14 9693-9694      F101_14 9695-9696       RF102_14 9697-9698
        F102_14 9699-9700       RF103A_14 9701-9702     F103A8_14 9703-9704
        F103A1_14 9705-9706     F103A2_14 9707-9708     F103A3_14 9709-9711
        F103A4_14 9712-9713     F103A7_14 9714-9715     F103A5_14 9716-9717
        RF103B_14 9718-9719     F103B8_14 9720-9721     F103B1_14 9722-9723
        F103B2_14 9724-9725     F103B3_14 9726-9728     F103B4_14 9729-9730
        F103B7_14 9731-9732     F103B5_14 9733-9734     RF103C_14 9735-9736
        F103C8_14 9737-9738     F103C1_14 9739-9740     F103C2_14 9741-9742
        F103C3_14 9743-9745     F103C4_14 9746-9747     F103C7_14 9748-9749
        F103C5_14 9750-9751     RF103D_14 9752-9753     F103D8_14 9754-9755
        F103D1_14 9756-9757     F103D2_14 9758-9759     F103D3_14 9760-9762
        F103D4_14 9763-9764     F103D7_14 9765-9766     F103D5_14 9767-9768
        RF103E_14 9769-9770     F103E8_14 9771-9772     F103E1_14 9773-9774
        F103E2_14 9775-9776     F103E3_14 9777-9779     F103E4_14 9780-9781
        F103E7_14 9782-9783     F103E5_14 9784-9785     RF103F_14 9786-9787
        F103F8_14 9788-9789     F103F1_14 9790-9791     F103F2_14 9792-9793
        F103F3_14 9794-9796     F103F4_14 9797-9798     F103F7_14 9799-9800
        F103F5_14 9801-9802     RF103G_14 9803-9804     F103G8_14 9805-9806
        F103G1_14 9807-9808     F103G2_14 9809-9810     F103G3_14 9811-9813
        F103G4_14 9814-9815     F103G7_14 9816-9817     F103G5_14 9818-9819
        RF103H_14 9820-9821     F103H8_14 9822-9823     F103H1_14 9824-9825
        F103H2_14 9826-9827     F103H3_14 9828-9830     F103H4_14 9831-9832
        F103H7_14 9833-9834     F103H5_14 9835-9836     RF103I_14 9837-9838
        F103I8_14 9839-9840     F103I1_14 9841-9842     F103I2_14 9843-9844
        F103I3_14 9845-9847     F103I4_14 9848-9849     F103I7_14 9850-9851
        F103I5_14 9852-9853     RF103J_14 9854-9855     F103J8_14 9856-9857
        F103J1_14 9858-9859     F103J2_14 9860-9861     F103J3_14 9862-9864
        F103J4_14 9865-9866     F103J7_14 9867-9868     F103J5_14 9869-9870
        RF103K_14 9871-9872     F103K8_14 9873-9874     F103K1_14 9875-9876
        F103K2_14 9877-9878     F103K3_14 9879-9881     F103K4_14 9882-9883
        F103K7_14 9884-9885     F103K5_14 9886-9887     RF103L_14 9888-9889
        F103L8_14 9890-9891     F103L1_14 9892-9893     F103L2_14 9894-9895
        F103L3_14 9896-9898     F103L4_14 9899-9900     F103L7_14 9901-9902
        F103L5_14 9903-9904     RF103M_14 9905-9906     F103M8_14 9907-9908
        F103M1_14 9909-9910     F103M2_14 9911-9912     F103M3_14 9913-9915
        F103M4_14 9916-9917     F103M7_14 9918-9919     F103M5_14 9920-9921
        RF104_14 9922-9923      F104_14 9924-9926       RF105_14 9927-9928
        F105_14 9929-9931       F111A_14 9932-9933      F111B_14 9934-9935
        F111C_14 9936-9937      F112A_14 9938-9939      F112B_14 9940-9941
        F112C_14 9942-9943      F113A_14 9944-9945      F113B_14 9946-9947
        F113C_14 9948-9949      RF12_14 9950-9951       F12A_14 9952-9956
        F12B_14 9957-9961       F12C_14 9962-9966       RF13_14 9967-9968
        F13A_14 9969-9973       F13B_14 9974-9978       F13C_14 9979-9983
        RF14_14 9984-9985       F141_14 9986            F142_14 9987
        F143_14 9988            F144_14 9989            F145_14 9990
        F146_14 9991            F147_14 9992            F148_14 9993
        F149_14 9994            F14T_14 9995            RF15_14 9996-9997
        F151_14 9998            F152_14 9999            F153_14 10000
        F154_14 10001           F155_14 10002           F156_14 10003
        F157_14 10004           F158_14 10005           F159_14 10006
        F15T_14 10007           F16_14 10008            RG01_14 10009-10010
        G01_14 10011            RG02_14 10012-10013     G02_14 10014-10015
        RG1_14 10016-10017      G1_14 10018             G1A_14 10019
        RG21_14 10020-10021     G21_14 10022-10023      RG22_14 10024-10025
        G22_14 10026            RG23_14 10027-10028     G23_14 10029
        RG24_14 10030-10031     G24_14 10032            RG24A_14 10033-10034
        G24A_14 10035-10036     RG25_14 10037-10038     G25_14 10039
        RG25A_14 10040-10041    G25A_14 10042-10043     RG3_14 10044-10045
        G3_14 10046             RG4_14 10047-10048      G4_14 10049
        RG4A_14 10050-10051     G4A_14 10052            RG4B_14 10053-10054
        G4B_14 10055            RG5_14 10056-10057      G511_14 10058-10060
        G512_14 10061-10063     G521_14 10064-10066     G522_14 10067-10069
        G6_14 10070             G7_14 10071-10073       G81_14 10074-10076
        G82_14 10077-10079      G83_14 10080            G9_14 10081-10083
        G101_14 10084-10086     G1011_14 10087-10088    G102_14 10089
        G1021_14 10090-10092    G122_14 10093-10094     G123_14 10095-10096
        G102C_14 10097-10099    RG106_14 10100-10101    G106_14 10102
        RG1061_14 10103-10104   G1061_14 10105          RG1062_14 10106-10107
        G1062_14 10108          RG1063_14 10109-10110   G1063_14 10111
        G11_14 10112            G12_14 10113-10115      RG130_14 10116-10117
        G130_14 10118           RG13_14 10119-10120     G131_14 10121-10122
        G132_14 10123-10124     RG14A_14 10125-10126    G14A1_14 10127-10128
        G14A2_14 10129-10131    G141T_14 10132          RG14B_14 10133-10134
        G14B1_14 10135-10136    G14B2_14 10137-10139    G142T_14 10140
        RG14C_14 10141-10142    G14C1_14 10143-10144    G14C2_14 10145-10147
        G143T_14 10148          G15A1_14 10149          G15A2_14 10150
        G15A3_14 10151-10152    G15B1_14 10153          G15B2_14 10154
        G15B3_14 10155-10156    G15C1_14 10157          G15C2_14 10158
        G15C3_14 10159-10160    G15D1_14 10161          G15D2_14 10162
        G15D3_14 10163-10164    G15E1_14 10165          G15E2_14 10166
        G15E3_14 10167-10168    G15F1_14 10169          G15F2_14 10170
        G15F3_14 10171-10172    G15G1_14 10173          G15G2_14 10174
        G15G3_14 10175-10176    G15H1_14 10177          G15H2_14 10178
        G15H3_14 10179-10180    G15I1_14 10181          G15I2_14 10182
        G15I3_14 10183-10184    G15J1_14 10185          G15J2_14 10186
        G15J3_14 10187-10188    G15K1_14 10189          G15K2_14 10190
        G15K3_14 10191-10192    G15L1_14 10193          G15L2_14 10194
        G15L3_14 10195-10196    G15M1_14 10197          G15M2_14 10198
        G15M3_14 10199-10200    G15N1_14 10201          G15N2_14 10202
        G15N3_14 10203-10204    G15O1_14 10205          G15O2_14 10206
        G15O3_14 10207-10208    G15P1_14 10209          G15P2_14 10210
        G15P3_14 10211-10212    G15Q1_14 10213          G15Q2_14 10214
        G15Q3_14 10215-10216    G15R1_14 10217          G15R2_14 10218
        G15R3_14 10219-10220    G15N1A_14 10221         G15N2A_14 10222
        G15N3A_14 10223-10224   G15S1_14 10225          G15S2_14 10226
        G15S3_14 10227-10228    G15T1_14 10229          G15T2_14 10230
        G15T3_14 10231-10232    G15U1_14 10233          G15U2_14 10234
        G15U3_14 10235-10236    G15J1A_14 10237         G15J2A_14 10238
        G15J3A_14 10239-10240   G15V1_14 10241          G15V2_14 10242
        G15V3_14 10243-10244    G15Y1_14 $10245-10253   G15Y2_14 10254-10256
        G15Y3_14 10257-10258    G15YT_14 10259          H1_14 10260
        H21_14 10261            H22_14 10262-10263      H3_14 10264
        H5_14 10265-10267       H6_14 10268             H7_14 10269
        H71_14 10270-10271      D14VYEAR 10272-10275    D14VMONTH 10276-10277
        D14VDAY 10278-10279     D14AGE 10280-10282      D14MARRY 10283-10284
        D14MARRY1 10285-10286   D14YR1 $10287-10290     D14MON1 $10291-10292
        D14D22 10293-10294      D14D231 $10295-10303    D14D232 $10304-10306
        D14D233 $10307-10310    D14D234 $10311          D14D24 $10312-10315
        D14D25 10316-10318      D14D26A1 10319-10320    D14D26A2 10321-10322
        D14D26A3 $10323-10325   D14D26A4 $10326         D14D26A5 10327
        D14D26A6 10328-10329    D14D26A61 $10330-10331  D14D26B1 10332-10333
        D14D26B2 10334-10335    D14D26B3 10336-10338    D14D26B4 10339
        D14D26B5 10340          D14D26B6 10341-10342    D14D26B61 $10343-10344
        D14D26C1 10345-10346    D14D26C2 10347-10348    D14D26C3 10349-10351
        D14D26C4 10352          D14D26C5 10353          D14D26C6 10354-10355
        D14D26C61 10356-10357   D14D26D1 10358-10359    D14D26D2 10360-10361
        D14D26D3 10362-10363    D14D26D4 10364          D14D26D5 10365
        D14D26D6 10366-10367    D14D26D61 10368-10369   D14D26E1 10370-10371
        D14D26E2 10372-10373    D14D26E3 $10374-10375   D14D26E4 $10376
        D14D26E5 10377          D14D26E6 10378-10379    D14D26E61 10380
        D14D26F1 10381-10382    D14D26F2 10383-10384    D14D26F3 10385-10386
        D14D26F4 $10387         D14D26F5 10388          D14D26F6 10389-10390
        D14D26F61 10391         D14D26G1 10392-10393    D14D26G11 10394
        D14D26G2 10395-10396    D14D26G3 10397-10398    D14D26G4 10399
        D14D26G5 10400          D14D26G6 10401-10402    D14D26G61 10403
        D14D26H1 10404-10405    D14D26H11 10406         D14D26H2 10407-10408
        D14D26H3 10409-10410    D14D26H4 $10411         D14D26H5 10412
        D14D26H6 10413-10414    D14D26H61 10415         D14D26I1 10416-10417
        D14D26I11 10418         D14D26I2 10419-10420    D14D26I3 10421
        D14D26I4 10422          D14D26I5 10423          D14D26I6 10424-10425
        D14D26I61 10426         D14D26J1 10427-10428    D14D26J11 10429
        D14D26J2 10430-10431    D14D26J3 10432          D14D26J4 10433
        D14D26J5 10434          D14D26J51 10435         D14D26J6 10436-10437
        D14D26J61 $10438-10439  D14LIVARR 10440-10441   D14PERSON 10442-10444
        D14GENER 10445-10447    D14DPLACE 10448-10449   D14CARGIV 10450-10451
        D14PCGDAY $10452-10454  D14BEDRID 10455-10456   D14BEDDAY $10457-10460
        D14ILL 10461-10462      D14DISEA1 $10463-10471  D14DIDAY1 $10472-10475
        D14DISEA2 $10476-10484  D14DIDAY2 $10485-10488  D14DISEA3 $10489-10497
        D14DIDAY3 $10498-10501  D14HYPERT 10502-10503   D14DIABET 10504-10505
        D14HEART 10506-10507    D14CVD 10508-10509      D14PNEUM 10510-10511
        D14TUBERC 10512-10513   D14CANCER 10514-10515   D14GLAUCO 10516-10517
        D14PROSTA 10518-10519   D14GYNECO 10520-10521   D14GASTRI 10522-10523
        D14PARKIN 10524-10525   D14BEDSOR 10526-10527   D14DEMENT 10528-10529
        D14PSYCHO 10530-10531   D14NEUROS 10532-10533   D14ARTHRI 10534-10535
        D14OTHERS 10536-10537   D14INCOME $10538-10546  D14WCFACI 10547-10548
        D14TAPWAT 10549-10550   D14BATHFA 10551-10552   D14HEATER 10553-10554
        D14TVSET 10555-10556    D14WASHMA 10557-10558   D14PHONE 10559-10560
        D14DOCTOR 10561-10562   D14LICDOC 10563-10564   D14WHOPAY $10565-10566
        D14MEDCOS $10567-10571  D14POCKET $10572-10576  D14BATHFU 10577-10578
        D14BATDAY $10579-10582  D14DRESFU 10583-10584   D14DREDAY $10585-10588
        D14TOILFU 10589-10590   D14TOIDAY $10591-10594  D14MOVEFU 10595-10596
        D14MOVDAY $10597-10600  D14CONTFU 10601-10602   D14CONDAY $10603-10606
        D14FEEDFU 10607-10608   D14FEEDAY $10609-10612  D14FULLDA $10613-10621
        D14CARCST $10622-10626  D14DIRCST $10627-10631  D14CARPAY 10632-10633
        D14OUTDOR 10634-10637   D14ACTDAY $10638-10641  D14SMOKE 10642-10643
        D14SMKTIM 10644-10645   D14D21B 10646-10647     D14DRINK 10648-10649
        D14KNDDRK 10650-10651   D14DRKMCH $10652-10653  D14ADVDIR 10654-10655
        D14DIRDAY 10656-10659   D14DREAM 10660-10661    D14PAIN 10662-10663
        D14UNCONS 10664-10665   D14UNCDAY $10666-10668  D14A533 10669-10670
        D14A534 $10671-10674    D14A535 10675-10676     D14A536 10677-10678
        D14A537 10679-10680     D14G23 $10681-10682     D14G24 10683-10684
        D14G24A 10685-10686     D14G25 10687-10688      D14G25A 10689-10690
        D14G4 10691-10692       D14G4A 10693-10694      D14G4B 10695-10696
        D14G102 10697-10699     D14G106 10700-10701     D14G1061 10702-10703
        D14G1062 10704-10705    D14G1063 10706-10707    D14D45 10708-10709
        D14D46 $10710           D14D47 10711            ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id id= province code +given no. + year of the wave of the very first interview' 
   YEAR9899= 'year9899 the year of the first interview took place' 
   MONTH98 = 'month98 month of the interview of the 1998 survey' 
   DATE98  = 'date98 day of the interview of the 1998 survey' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'prov national code for provinces sampled' 
   RELATION= 'relation respondent is original sampled person or his/her sibling?' 
   RELATYPE= 'relatype what kind of sibling?' 
   RESIDENC= 'residenc category of residence of the interviewee at the 1998 survey' 
   TRUEAGE = 'trueage validated age based on the 1998 survey''s information' 
   RA1     = 'ra1 proxy or not for a1' 
   A1      = 'a1 sex' 
   RA2     = 'ra2 proxy or not for a2' 
   A2      = 'a2 ethnic group' 
   RA41    = 'ra41 proxy or not for a41a and a41b' 
   A41A    = 'a41a which province were you born in?' 
   A41B    = 'a41b which city/county were you born in?' 
   RA42    = 'ra42 proxy or not for a42' 
   A42     = 'a42 was the place of birth an urban area or a rural area at time of birth?' 
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
   RA54    = 'ra54 proxy or not for a54a a54b' 
   A54A    = 'a54a year of being admitted to the nursing home' 
   A54B    = 'a54b month of being admitted to the nursing home' 
   B11     = 'b11 self-reported quality of life' 
   B12     = 'b12 self-reported health' 
   B21     = 'b21 look on the bright side of things' 
   B22     = 'b22 keep my belongings neat and clean' 
   B23     = 'b23 feel fearful or anxious' 
   B24     = 'b24 feel lonely and isolated' 
   B25     = 'b25 make own decision' 
   B26     = 'b26 feel useless with age' 
   B27     = 'b27 be happy as younger' 
   C11     = 'c11 what time of day is it right now?' 
   C12     = 'c12 what month is it right now?' 
   C13     = 'c13 what is the date of the mid-autumn festival?' 
   C14     = 'c14 what is the season right now?' 
   C15     = 'c15 what is the name of this county or district?' 
   C16     = 'c16 # of kinds of food named in one minute' 
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
   D4VEG1  = 'd4veg1 how often ate salt-preserved vegetables at around age 60' 
   D4VEG2  = 'd4veg2 how often eat salt-preserved vegetables at present' 
   RD4SUGA = 'rd4suga proxy or not for d4suga1 and d4suga2' 
   D4SUGA1 = 'd4suga1 how often ate sugar at around age 60' 
   D4SUGA2 = 'd4suga2 how often eat sugar at present' 
   RD4TEA  = 'rd4tea proxy or not for d4tea1 and d4tea2' 
   D4TEA1  = 'd4tea1 how often drank tea at around age 60' 
   D4TEA2  = 'd4tea2 how often drink tea at present' 
   RD4GARL = 'rd4garl proxy or not for d4garl1 and d4garl2' 
   D4GARL1 = 'd4garl1 how often ate garlic at around age 60' 
   D4GARL2 = 'd4garl2 how often eat garlic at present' 
   RD5     = 'rd5 proxy or not for d5a d5b d5c' 
   D5A     = 'd5a water you drank at childhood was from' 
   D5B     = 'd5b water you drank at around age 60 was from' 
   D5C     = 'd5c water you drink at present is from' 
   RD61    = 'rd61 proxy or not for d61' 
   D61     = 'd61 smoke or not at present?' 
   RD62    = 'rd62 proxy or not for d62' 
   D62     = 'd62 smoked or not in the past?' 
   RD63    = 'rd63 proxy or not for d63' 
   D63     = 'd63 age when starting to smoke' 
   RD64    = 'rd64 proxy or not for d64' 
   D64     = 'd64 age when quitting smoking if not smoke at present' 
   RD65    = 'rd65 proxy or not for d65' 
   D65     = 'd65 times smoke (or smoked) per day' 
   RD71    = 'rd71 proxy or not for d71' 
   D71     = 'd71 drink or not at present?' 
   RD72    = 'rd72 proxy or not for d72' 
   D72     = 'd72 drank or not in the past?' 
   RD73    = 'rd73 proxy or not for d73' 
   D73     = 'd73 age when starting to drink' 
   RD74    = 'rd74 proxy or not for d74' 
   D74     = 'd74 age when quitting drinking if not drink at present' 
   RD75    = 'rd75 proxy or not for d75' 
   D75     = 'd75 what kind of drink if drink (drank)?' 
   RD76    = 'rd76 proxy or not for d76' 
   D76     = 'd76 how much per day if drink( or drank)?' 
   RD81    = 'rd81 proxy or not for d81' 
   D81     = 'd81 exercise or not at present?' 
   RD82    = 'rd82 proxy or not for d82' 
   D82     = 'd82 exercised or not in the past?' 
   RD83    = 'rd83 proxy or not for d83' 
   D83     = 'd83 age when starting to exercise' 
   RD84    = 'rd84 proxy or not for d84' 
   D84     = 'd84 age when quitting exercising if not exercise at present' 
   RD91    = 'rd91 proxy or not for d91' 
   D91     = 'd91 have you done physical labor regularly?' 
   RD92    = 'rd92 proxy or not for d92' 
   D92     = 'd92 age when starting to do physical labor' 
   RD93    = 'rd93 proxy or not for d103' 
   D93     = 'd93 age when stopping doing physical labor' 
   RD10A   = 'rd10a proxy or not for d10a' 
   D10A    = 'd10a do you do house work at present?' 
   RD10B   = 'rd10b proxy or not for d10b' 
   D10B    = 'd10b do you grow vegetables & do other field work at present?' 
   RD10C   = 'rd10c proxy or not for d10c' 
   D10C    = 'd10c do you do garden work' 
   RD10D   = 'rd10d proxy or not for d10d' 
   D10D    = 'd10d do you read newspapers/books at present?' 
   RD10E   = 'rd10e proxy or not for d10e' 
   D10E    = 'd10e do you raise domestic animals/pets at present?' 
   RD10F   = 'rd10f proxy or not for d10f' 
   D10F    = 'd10f do you play cards/mah-jong at present?' 
   RD10G   = 'rd10g proxy or not for d10g' 
   D10G    = 'd10g do you watch tv or listen to radio at present ?' 
   RD10H   = 'rd10h proxy or not for d10h' 
   D10H    = 'd10h do you participate religious activities at present?' 
   RE1     = 're1 proxy or not for e1' 
   E1      = 'e1 bathing' 
   RE2     = 're2 proxy or not for e2' 
   E2      = 'e2 dressing' 
   RE3     = 're3 proxy or not for e3' 
   E3      = 'e3 toileting' 
   RE4     = 're4 proxy or not for e4' 
   E4      = 'e4 transferring' 
   RE5     = 're5 proxy or not for e5' 
   E5      = 'e5 continence' 
   RE6     = 're6 proxy or not for e6' 
   E6      = 'e6 feeding' 
   RF1     = 'rf1 proxy or not for f1' 
   F1      = 'f1 years of schooling' 
   RF2     = 'rf2 proxy or not for f2' 
   F2      = 'f2 main occupation before age 60' 
   RF31    = 'rf31 proxy or not for f31' 
   F31     = 'f31 main source of financial support' 
   RF32    = 'rf32 proxy or not for f32' 
   F32     = 'f32 other sources of financial support' 
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
   F62     = 'f62 got adequate medical service at around age 80' 
   RF63    = 'rf63 proxy or not for 63' 
   F63     = 'f63 got adequate medical service at around age 60' 
   RF64    = 'rf64 proxy or not for f64' 
   F64     = 'f64 got adequate medical service in childhood' 
   RF65    = 'rf65 proxy or not for f65' 
   F65     = 'f65 often went to bed hungry as a child' 
   RF71    = 'rf71 proxy or not for f71' 
   F71     = 'f71 mother alive or not' 
   RF72    = 'rf72 proxy or not for f72' 
   F72     = 'f72 mother''s age if alive or mother''s age at death' 
   RF73    = 'rf73 proxy or not for f73' 
   F73     = 'f73 respondent''s age at mother''s death' 
   RF81    = 'rf81 proxy or not for f81' 
   F81     = 'f81 father alive or not' 
   RF82    = 'rf82 proxy or not for f82' 
   F82     = 'f82 father''s age if alive or father''s age at death' 
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
   F92A5   = 'f92a5 frequent visits' 
   F92A6   = 'f92a6 residence distance' 
   RF92B   = 'rf92b proxy or not for f92b1 to f92b6' 
   F92B1   = 'f92b1 birth order of the sibling' 
   F92B2   = 'f92b2 sex of the sibling' 
   F92B3   = 'f92b3 sibling alive' 
   F92B4   = 'f92b4 sibling''s age at present if alive, or age at death if died' 
   F92B5   = 'f92b5 frequent visits' 
   F92B6   = 'f92b6 residence distance' 
   RF92C   = 'rf92c proxy or not for f92c1 to f92c6' 
   F92C1   = 'f92c1 birth order of the sibling' 
   F92C2   = 'f92c2 sex of the sibling' 
   F92C3   = 'f92c3 sibling alive' 
   F92C4   = 'f92c4 sibling''s age at present if alive, or age at death if died' 
   F92C5   = 'f92c5 frequent visits' 
   F92C6   = 'f92c6 residence distance' 
   RF92D   = 'rf92d proxy or not for f92d1 to f92d6' 
   F92D1   = 'f92d1 birth order of the sibling' 
   F92D2   = 'f92d2 sex of the sibling' 
   F92D3   = 'f92d3 sibling alive' 
   F92D4   = 'f92d4 sibling''s age at present if alive, or age at death if died' 
   F92D5   = 'f92d5 frequent visits' 
   F92D6   = 'f92d6 residence distance' 
   RF92E   = 'rf92e proxy or not for f92e1 to f92e6' 
   F92E1   = 'f92e1 birth order of the sibling' 
   F92E2   = 'f92e2 sex of the sibling' 
   F92E3   = 'f92e3 sibling alive' 
   F92E4   = 'f92e4 sibling''s age at present if alive, or age at death if died' 
   F92E5   = 'f92e5 frequent visits' 
   F92E6   = 'f92e6 residence distance' 
   RF92F   = 'rf92f proxy or not for f92f1 to f92f6' 
   F92F1   = 'f92f1 birth order of the sibling' 
   F92F2   = 'f92f2 sex of the sibling' 
   F92F3   = 'f92f3 sibling alive' 
   F92F4   = 'f92f4 sibling''s age at present if alive, or age at death if died' 
   F92F5   = 'f92f5 frequent visits' 
   F92F6   = 'f92f6 residence distance' 
   RF92G   = 'rf92g proxy or not for f92g1 to f92g6' 
   F92G1   = 'f92g1 birth order of the sibling' 
   F92G2   = 'f92g2 sex of the sibling' 
   F92G3   = 'f92g3 sibling alive' 
   F92G4   = 'f92g4 sibling''s age at present if alive, or age at death if died' 
   F92G5   = 'f92g5 frequent visits' 
   F92G6   = 'f92g6 residence distance' 
   RF92H   = 'rf92h proxy or not for f92h1 to f92h6' 
   F92H1   = 'f92h1 birth order of the sibling' 
   F92H2   = 'f92h2 sex of the sibling' 
   F92H3   = 'f92h3 sibling alive' 
   F92H4   = 'f92h4 sibling''s age at present if alive, or age at death if died' 
   F92H5   = 'f92h5 frequent visits' 
   F92H6   = 'f92h6 residence distance' 
   RF92I   = 'rf92i proxy or not for f92i1 to f92i6' 
   F92I1   = 'f92i1 birth order of the sibling' 
   F92I2   = 'f92i2 sex of the sibling' 
   F92I3   = 'f92i3 sibling alive' 
   F92I4   = 'f92i4 sibling''s age at present if alive, or age at death if died' 
   F92I5   = 'f92i5 frequent visits' 
   F92I6   = 'f92i6 residence distance' 
   RF92J   = 'rf92j proxy or not for f92j1 to f92j6' 
   F92J1   = 'f92j1 birth order of the sibling' 
   F92J2   = 'f92j2 sex of the sibling' 
   F92J3   = 'f92j3 sibling alive' 
   F92J4   = 'f92j4 sibling''s age at present if alive, or age at death if died' 
   F92J5   = 'f92j5 frequent visits' 
   F92J6   = 'f92j6 residence distance' 
   RF92K   = 'rf92k proxy or not for f92k1 to f92k6' 
   F92K1   = 'f92k1 birth order of the sibling' 
   F92K2   = 'f92k2 sex of the sibling' 
   F92K3   = 'f92k3 sibling alive' 
   F92K4   = 'f92k4 sibling''s age at present if alive, or age at death if died' 
   F92K5   = 'f92k5 frequent visits' 
   F92K6   = 'f92k6 residence distance' 
   RF92L   = 'rf92l proxy or not for f92l1 to f92l6' 
   F92L1   = 'f92l1 birth order of the sibling' 
   F92L2   = 'f92l2 sex of the sibling' 
   F92L3   = 'f92l3 sibling alive' 
   F92L4   = 'f92l4 sibling''s age at present if alive, or age at death if died' 
   F92L5   = 'f92l5 frequent visits' 
   F92L6   = 'f92l6 residence distance' 
   RF92M   = 'rf92m proxy or not for f92m1 to f92m6' 
   F92M1   = 'f92m1 birth order of the sibling' 
   F92M2   = 'f92m2 sex of the sibling' 
   F92M3   = 'f92m3 sibling alive' 
   F92M4   = 'f92m4 sibling''s age at present if alive, or age at death if died' 
   F92M5   = 'f92m5 frequent visits' 
   F92M6   = 'f92m6 residence distance' 
   RF92N   = 'rf92n proxy or not for f92n1 to f92n6' 
   F92N1   = 'f92n1 birth order of the sibling' 
   F92N2   = 'f92n2 sex of the sibling' 
   F92N3   = 'f92n3 sibling alive' 
   F92N4   = 'f92n4 sibling''s age at present if alive, or age at death if died' 
   F92N5   = 'f92n5 frequent visits' 
   F92N6   = 'f92n6 residence distance' 
   RF92O   = 'rf92o proxy or not for f92o1 to f92o6' 
   F92O1   = 'f92o1 birth order of the sibling' 
   F92O2   = 'f92o2 sex of the sibling' 
   F92O3   = 'f92o3 sibling alive' 
   F92O4   = 'f92o4 sibling''s age at present if alive, or age at death if died' 
   F92O5   = 'f92o5 frequent visits' 
   F92O6   = 'f92o6 residence distance' 
   RF10    = 'rf10 proxy or not for f10' 
   F10     = 'f10 number of children ever born' 
   RF101A  = 'rf101a proxy or not for f101a1 to f101a5' 
   F101A1  = 'f101a1 sex of child living separately' 
   F101A2  = 'f101a2 child alive or not' 
   F101A3  = 'f101a3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101A4  = 'f101a4 frequent visits' 
   F101A5  = 'f101a5 residence distance' 
   RF101B  = 'rf101b proxy or not for f101b1 to f101b5' 
   F101B1  = 'f101b1 sex of child living separately' 
   F101B2  = 'f101b2 child alive or not' 
   F101B3  = 'f101b3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101B4  = 'f101b4 frequent visits' 
   F101B5  = 'f101b5 residence distance' 
   RF101C  = 'rf101c proxy or not for f101c1 to f101c5' 
   F101C1  = 'f101c1 sex of child living separately' 
   F101C2  = 'f101c2 child alive or not' 
   F101C3  = 'f101c3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101C4  = 'f101c4 frequent visits' 
   F101C5  = 'f101c5 residence distance' 
   RF101D  = 'rf101d proxy or not for f101d1 to f101d5' 
   F101D1  = 'f101d1 sex of child living separately' 
   F101D2  = 'f101d2 child alive or not' 
   F101D3  = 'f101d3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101D4  = 'f101d4 frequent visits' 
   F101D5  = 'f101d5 residence distance' 
   RF101E  = 'rf101e proxy or not for f101e1 to f101e5' 
   F101E1  = 'f101e1 sex of child living separately' 
   F101E2  = 'f101e2 child alive or not' 
   F101E3  = 'f101e3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101E4  = 'f101e4 frequent visits' 
   F101E5  = 'f101e5 residence distance' 
   RF101F  = 'rf101f proxy or not for f101f1 to f101f5' 
   F101F1  = 'f101f1 sex of child living separately' 
   F101F2  = 'f101f2 child alive or not' 
   F101F3  = 'f101f3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101F4  = 'f101f4 frequent visits' 
   F101F5  = 'f101f5 residence distance' 
   RF101G  = 'rf101g proxy or not for f101g1 to f101g5' 
   F101G1  = 'f101g1 sex of child living separately' 
   F101G2  = 'f101g2 child alive or not' 
   F101G3  = 'f101g3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101G4  = 'f101g4 frequent visits' 
   F101G5  = 'f101g5 residence distance' 
   RF101H  = 'rf101h proxy or not for f101h1 to f101h5' 
   F101H1  = 'f101h1 sex of child living separately' 
   F101H2  = 'f101h2 child alive or not' 
   F101H3  = 'f101h3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101H4  = 'f101h4 frequent visits' 
   F101H5  = 'f101h5 residence distance' 
   RF101I  = 'rf101i proxy or not for f101i1 to f101i5' 
   F101I1  = 'f101i1 sex of child living separately' 
   F101I2  = 'f101i2 child alive or not' 
   F101I3  = 'f101i3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101I4  = 'f101i4 frequent visits' 
   F101I5  = 'f101i5 residence distance' 
   RF101J  = 'rf101j proxy or not for f101j1 to f101j5' 
   F101J1  = 'f101j1 sex of child living separately' 
   F101J2  = 'f101j2 child alive or not' 
   F101J3  = 'f101j3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101J4  = 'f101j4 frequent visits' 
   F101J5  = 'f101j5 residence distance' 
   RF101K  = 'rf101k proxy or not for f101k1 to f101k5' 
   F101K1  = 'f101k1 sex of child living separately' 
   F101K2  = 'f101k2 child alive or not' 
   F101K3  = 'f101k3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F101K4  = 'f101k4 frequent visits' 
   F101K5  = 'f101k5 residence distance' 
   G1      = 'g1 visual function' 
   G21     = 'g21 number of natural teeth have' 
   G22     = 'g22 have false teeth?' 
   G3      = 'g3 able to use chopsticks to eat?' 
   G4      = 'g4 which hand do you normally use for eating?' 
   G51     = 'g51 systolic' 
   G52     = 'g52 diastolic' 
   G6      = 'g6 rhythm of heart' 
   G7      = 'g7 heart rate' 
   G81     = 'g81 acromion process styloideus' 
   G82     = 'g82 right knee to the floor' 
   G9      = 'g9 lungflow' 
   G101    = 'g101 hand behind neck' 
   G102    = 'g102 hand behind lower back' 
   G11     = 'g11 able to stand up from sitting in a chair?' 
   G12     = 'g12 weight' 
   G13     = 'g13 able to pick up a book from the floor?' 
   G14     = 'g14 steps used to turn around 360 degree without help?' 
   RG16    = 'rg16 with proxy or not for g16' 
   G16     = 'g16 # of times suffering from serious illness in the past two years' 
   RG17A   = 'rg17a proxy or not for g17a1 g17a2' 
   G17A1   = 'g17a1 suffering from hypertension?' 
   G17A2   = 'g17a2 disability in daily life' 
   RG17B   = 'rg17b proxy or not for g17b1 g17b2' 
   G17B1   = 'g17b1 suffering from diabetes?' 
   G17B2   = 'g17b2 disability in daily life' 
   RG17C   = 'rg17c proxy or not for g17c1 g17c2' 
   G17C1   = 'g17c1 suffering from hear disease?' 
   G17C2   = 'g17c2 disability in daily life' 
   RG17D   = 'rg17d proxy or not for g17d1 g17d2' 
   G17D1   = 'g17d1 suffering from stroke or cvd?' 
   G17D2   = 'g17d2 disability in daily life' 
   RG17E   = 'rg17e proxy or not for g17e1 g17e2' 
   G17E1   = 'g17e1 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G17E2   = 'g17e2 disability in daily life' 
   RG17F   = 'rg17f proxy or not for g17f1 g17f2' 
   G17F1   = 'g17f1 suffering from tuberculosis?' 
   G17F2   = 'g17f2 disability in daily life' 
   RG17G   = 'rg17g proxy or not for g17g1 g17g2' 
   G17G1   = 'g17g1 suffering from cataract?' 
   G17G2   = 'g17g2 disability in daily life' 
   RG17H   = 'rg17h proxy or not for g17h1 g17h2' 
   G17H1   = 'g17h1 suffering from glaucoma?' 
   G17H2   = 'g17h2 disability in daily life' 
   RG17I   = 'rg17i proxy or not for g17i1 g17i2' 
   G17I1   = 'g17i1 suffering from cancer?' 
   G17I2   = 'g17i2 disability in daily life' 
   RG17J   = 'rg17j proxy or not for g17j1 g17j2' 
   G17J1   = 'g17j1 suffering from prostate tumor?' 
   G17J2   = 'g17j2 disability in daily life' 
   RG17K   = 'rg17k proxy or not for g17k1 g17k2' 
   G17K1   = 'g17k1 suffering from gastric or duodenal ulcer?' 
   G17K2   = 'g17k2 disability in daily life' 
   RG17L   = 'rg17l proxy or not for g17l1 g17l2' 
   G17L1   = 'g17l1 suffering from parkinson''s disease?' 
   G17L2   = 'g17l2 disability in daily life' 
   RG17M   = 'rg17m proxy or not for g17m1 g17m2' 
   G17M1   = 'g17m1 suffering from bedsore?' 
   G17M2   = 'g17m2 disability in daily life' 
   RG17N   = 'rg17n proxy or not for g17n1 g17n2' 
   G17N1   = 'g17n1 suffering from other chronic disease?' 
   G17N2   = 'g17n2 disability in daily life' 
   H1A     = 'h1a was interviewee able to hear?' 
   H1B     = 'h1b volume of hearing aid' 
   H21     = 'h21 did interviewee able to participate physical check?' 
   H22     = 'h22 the reason of unable to participate physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H7      = 'h7 has interviewer checked whether failing to ask a question?' 
   H8      = 'h8 did anyone help the interviewee to answer question' 
   H81     = 'h81 who helped interviewee to answer question?' 
   H9A     = 'h9a did interviewer take a photo for interviewee?' 
   H9B     = 'h9b did interviewer take a photo for interviewee''s family?' 
   S1      = 's1 interviewer''s opinion based on information got from the elder''s neighbors' 
   S2      = 's2 interviewer''s opinion based on information got from  local aging association' 
   S3      = 's3 interviewer''s opinion based on information got from  local aging association' 
   W_1998  = 'w_1998 weight variable, estimated based on 100% age-sex-residence-specific distribution' 
   DTH98_00= 'dth98_00 status of survival, death, or lost to follow-up from 1998 to 2000 waves' 
   MONTH_0 = 'month_0 month of the interview in 2000' 
   DAY_0   = 'day_0 day of the interview in  2000' 
   RESID_0 = 'resid_0 category of residence of the interviewee in 2000' 
   VAGE_0  = 'vage_0 validated age in the 2000 survey' 
   RA51_0  = 'ra51_0 proxy or not for a51_0' 
   A51_0   = 'a51_0 co-residence of interviewee' 
   RA52_0  = 'ra52_0 proxy or not for a52_0' 
   A52_0   = 'a52_0 how many people are living with you?' 
   RA53A_0 = 'ra53a_0 proxy or not for a53a1_0, a53a2_0, a53a3_0' 
   A53A1_0 = 'a53a1_0 relationship between you and 1st person you living with currently' 
   A53A2_0 = 'a53a2_0 age of 1st person you living with currently' 
   A53A3_0 = 'a53a3_0 sex of 1st person you living with currently' 
   RA53B_0 = 'ra53b_0 proxy or not for a53b1_0, a53b2_0, a53b3_0' 
   A53B1_0 = 'a53b1_0 relationship between you and 2nd person you living with currently' 
   A53B2_0 = 'a53b2_0 age of 2nd person you living with currently' 
   A53B3_0 = 'a53b3_0 sex of 2nd person you living with currently' 
   RA53C_0 = 'ra53c_0 proxy or not for a53c1_0, a53c2_0, a53c3_0' 
   A53C1_0 = 'a53c1_0 relationship between you and 3rd person you living with currently' 
   A53C2_0 = 'a53c2_0 age of 3rd person you living with currently' 
   A53C3_0 = 'a53c3_0 sex of 3rd person you living with currently' 
   RA53D_0 = 'ra53d_0 proxy or not for a53d1_0, a53d2_0, a53d3_0' 
   A53D1_0 = 'a53d1_0 relationship between you and 4th person you living with currently' 
   A53D2_0 = 'a53d2_0 age of 4th person you living with currently' 
   A53D3_0 = 'a53d3_0 sex of 4tht person you living with currently' 
   RA53E_0 = 'ra53e_0 proxy or not for a53e1_0, a53e2_0, a53e3_0' 
   A53E1_0 = 'a53e1_0 relationship between you and 5th person you living with currently' 
   A53E2_0 = 'a53e2_0 age of 5th person you living with currently' 
   A53E3_0 = 'a53e3_0 sex of 5th person you living with currently' 
   RA53F_0 = 'ra53f_0 proxy or not for a53f1_0, a53f2_0, a53f3_0' 
   A53F1_0 = 'a53f1_0 relationship between you and 6th person you living with currently' 
   A53F2_0 = 'a53f2_0 age of 6th person you living with currently' 
   A53F3_0 = 'a53f3_0 sex of 6th person you living with currently' 
   RA53G_0 = 'ra53g_0 proxy or not for a53g1_0, a53g2_0, a53g3_0' 
   A53G1_0 = 'a53g1_0 relationship between you and 7th person you living with currently' 
   A53G2_0 = 'a53g2_0 age of 7th person you living with currently' 
   A53G3_0 = 'a53g3_0 sex of 7th person you living with currently' 
   RA53H_0 = 'ra53h_0 proxy or not for a53h1_0, a53h2_0, a53h3_0' 
   A53H1_0 = 'a53h1_0 relationship between you and 8th person you living with currently' 
   A53H2_0 = 'a53h2_0 age of 8th person you living with currently' 
   A53H3_0 = 'a53h3_0 sex of 8th person you living with currently' 
   RA53I_0 = 'ra53i_0 proxy or not for a53i1_0, a53i2_0, a53i3_0' 
   A53I1_0 = 'a53i1_0 relationship between you and 9th person you living with currently' 
   A53I2_0 = 'a53i2_0 age of 9th person you living with currently' 
   A53I3_0 = 'a53i3_0 sex of 9th person you living with currently' 
   RA53J_0 = 'ra53j_0 proxy or not for a53j1_0, a53j2_0, a53j3_0' 
   A53J1_0 = 'a53j1_0 relationship between you and 10th person you living with currently' 
   A53J2_0 = 'a53j2_0 age of 10th person you living with currently' 
   A53J3_0 = 'a53j3_0 sex of 10th person you living with currently' 
   RA53K_0 = 'ra53k_0 proxy or not for a53k1_0, a53k2_0, a53k3_0' 
   A53K1_0 = 'a53k1_0 relationship between you and 11th person you living with currently' 
   A53K2_0 = 'a53k2_0 age of 11th person you living with currently' 
   A53K3_0 = 'a53k3_0 sex of 11th person you living with currently' 
   RA53L_0 = 'ra53l_0 proxy or not for a53l1_0, a53l2_0, a53l3_0' 
   A53L1_0 = 'a53l1_0 relationship between you and 12th person you living with currently' 
   A53L2_0 = 'a53l2_0 age of 12th person you living with currently' 
   A53L3_0 = 'a53l3_0 sex of 12th person you living with currently' 
   RA54_0  = 'ra54_0 proxy or not for a54a_0 a54b_0' 
   A54A_0  = 'a54a_0 year of being admitted to the nursing home' 
   A54B_0  = 'a54b_0 month of being admitted to the nursing home' 
   B11_0   = 'b11_0 self-reported quality of life' 
   B12_0   = 'b12_0 self-reported health' 
   B21_0   = 'b21_0 look on the bright side of things' 
   B22_0   = 'b22_0 keep my belongings neat and clean' 
   B23_0   = 'b23_0 feel fearful or anxious' 
   B24_0   = 'b24_0 feel lonely and isolated' 
   B25_0   = 'b25_0 make own decision' 
   B26_0   = 'b26_0 feel useless with age' 
   B27_0   = 'b27_0 be happy as younger' 
   C11_0   = 'c11_0 what time of day is it right now?' 
   C12_0   = 'c12_0 what month is it right now?' 
   C13_0   = 'c13_0 what is the date of the mid-autumn festival?' 
   C14_0   = 'c14_0 what is the season right now?' 
   C15_0   = 'c15_0 what is the name of this county or district?' 
   C16_0   = 'c16_0 kinds of food named in one minute' 
   C21A_0  = 'c21a_0 repeat the name of ''table'' at the first time' 
   C21B_0  = 'c21b_0 repeat the name of ''apple'' at the first time' 
   C21C_0  = 'c21c_0 repeat the name of ''clothes'' at the first time' 
   C22_0   = 'c22_0 attempts to repeat the names of three objects correctly' 
   C31A_0  = 'c31a_0 $20-$3=?' 
   C31B_0  = 'c31b_0 $20-$3-$3=?' 
   C31C_0  = 'c31c_0 $20-$3-$3-$3=?' 
   C31D_0  = 'c31d_0 $20-$3-$3-$3-$3=?' 
   C31E_0  = 'c31e_0 $20-$3-$3-$3-$3-$3=?' 
   C32_0   = 'c32_0 draw the figure following the sample' 
   C41A_0  = 'c41a_0 repeat the name of ''table'' a while later' 
   C41B_0  = 'c41b_0 repeat the name of ''apple'' a while later' 
   C41C_0  = 'c41c_0 repeat the name of ''clothes'' a while later' 
   C51A_0  = 'c51a_0 naming ''pen''' 
   C51B_0  = 'c51b_0 naming ''watch''' 
   C52_0   = 'c52_0 repeat a sentence' 
   C53A_0  = 'c53a_0 taking paper using right hand' 
   C53B_0  = 'c53b_0 folding paper' 
   C53C_0  = 'c53c_0 put paper on the floor' 
   C54_0   = 'c54_0 was the interviewee able to answer sections b and c?' 
   C55_0   = 'c55_0 what is the main reason unable to answer questions?' 
   RD1_0   = 'rd1_0 proxy or not for d1_0' 
   D1_0    = 'd1_0 staple food' 
   RD2_0   = 'rd2_0 proxy or not for d2_0' 
   D2_0    = 'd2_0 amount of staple food per day (liang)' 
   RD31_0  = 'rd31_0 proxy or not for d31_0' 
   D31_0   = 'd31_0 how often eat fresh fruit?' 
   RD32_0  = 'rd32_0 proxy or not for d32_0' 
   D32_0   = 'd32_0 how often eat vegetables?' 
   RD4MT_0 = 'rd4mt_0 proxy or not for d4mt2_0' 
   D4MT2_0 = 'd4mt2_0 how often eat meat at present?' 
   RD4FSH_0= 'rd4fsh_0 proxy or not for d4fsh2_0' 
   D4FSH2_0= 'd4fsh2_0 how often eat fish at present?' 
   RD4EGG_0= 'rd4egg_0 proxy or not for d4egg2_0' 
   D4EGG2_0= 'd4egg2_0 how often eat eggs at present?' 
   RD4BEN_0= 'rd4ben_0 proxy or not for d4ben2_0' 
   D4BEN2_0= 'd4ben2_0 how often eat bean at present?' 
   RD4VEG_0= 'rd4veg_0 proxy or not for d4veg2_0' 
   D4VEG2_0= 'd4veg2_0 how often eat salt-preserved vegetables at present' 
   RD4SUG_0= 'rd4sug_0 proxy or not for d4sug2_0' 
   D4SUG2_0= 'd4sug2_0 how often eat sugar at present' 
   RD4TEA_0= 'rd4tea_0 proxy or not for d4tea2_0' 
   D4TEA2_0= 'd4tea2_0 how often drink tea at present' 
   RD4GAR_0= 'rd4gar_0 proxy or not for d4gar2_0' 
   D4GAR2_0= 'd4gar2_0 how often eat garlic at present' 
   RD5_0   = 'rd5_0 proxy or not for d5_0' 
   D5_0    = 'd5_0 what kind of water usually drink?' 
   RD6_0   = 'rd6_0 proxy or not for d6c_0' 
   D6C_0   = 'd6c_0 water you drink at present is from' 
   RD71_0  = 'rd71_0 proxy or not for d71_0' 
   D71_0   = 'd71_0 smoke or not at present?' 
   RD75_0  = 'rd75_0 proxy or not for d75_0' 
   D75_0   = 'd75_0 times smoke (or smoked) per day' 
   RD81_0  = 'rd81_0 proxy or not for d81_0' 
   D81_0   = 'd81_0 drink or not at present?' 
   RD85_0  = 'rd85_0 proxy or not for d85_0' 
   D85_0   = 'd85_0 what kind of drink if drink (drank)?' 
   RD86_0  = 'rd86_0 proxy or not for d86_0' 
   D86_0   = 'd86_0 how much per day if drink( or drank)?' 
   RD91_0  = 'rd91_0 proxy or not for d91_0' 
   D91_0   = 'd91_0 exercise or not at present?' 
   RD11A_0 = 'rd11a_0 proxy or not for d11a_0' 
   D11A_0  = 'd11a_0 do you do house work at present?' 
   RD11B_0 = 'rd11b_0 proxy or not for d11b_0' 
   D11B_0  = 'd11b_0 do you do any personal outdoor activities at present?' 
   RD11C_0 = 'rd11c_0 proxy or not for d11c_0' 
   D11C_0  = 'd11c_0 do you do garden work' 
   RD11D_0 = 'rd11d_0 proxy or not for d11d_0' 
   D11D_0  = 'd11d_0 do you read newspapers/books at present?' 
   RD11E_0 = 'rd11e_0 proxy or not for d11e_0' 
   D11E_0  = 'd11e_0 do you raise domestic animals/pets at present?' 
   RD11F_0 = 'rd11f_0 proxy or not for d11f_0' 
   D11F_0  = 'd11f_0 do you play cards/mah-jong at present?' 
   RD11G_0 = 'rd11g_0 proxy or not for d11g_0' 
   D11G_0  = 'd11g_0 do you watch tv or listen to radio at present ?' 
   RD11H_0 = 'rd11h_0 proxy or not for d11h_0' 
   D11H_0  = 'd11h_0 do you participate religious activities at present?' 
   RE1_0   = 're1_0 proxy or not for e1_0' 
   E1_0    = 'e1_0 bathing' 
   RE2_0   = 're2_0 proxy or not for e2_0' 
   E2_0    = 'e2_0 dressing' 
   RE3_0   = 're3_0 proxy or not for e3_0' 
   E3_0    = 'e3_0 toileting' 
   RE4_0   = 're4_0 proxy or not for e4_0' 
   E4_0    = 'e4_0 transferring' 
   RE5_0   = 're5_0 proxy or not for e5_0' 
   E5_0    = 'e5_0 continence' 
   RE6_0   = 're6_0 proxy or not for e6_0' 
   E6_0    = 'e6_0 feeding' 
   RF31_0  = 'rf31_0 proxy or not for f31_0' 
   F31_0   = 'f31_0 main source of financial support' 
   F32_0   = 'f32_0 could main financial support maintain your daily cost?' 
   RF33_0  = 'rf33_0 proxy or not for f33_0' 
   F33_0   = 'f33_0 other sources of financial support' 
   RF34_0  = 'rf34_0 proxy or not for f34_0' 
   F34_0   = 'f34_0 could all financial support maintain your daily cost?' 
   RF41_0  = 'rf41_0 proxy or not for f41_0' 
   F41_0   = 'f41_0 current marital status' 
   RF5_0   = 'rf5_0 proxy or not for f5_0' 
   F5_0    = 'f5_0 who take care of you when you are sick?' 
   RF61_0  = 'rf61_0 proxy or not for f61_0' 
   F61_0   = 'f61_0 get adequate medical service at present' 
   RF64_0  = 'rf64_0 proxy or not for f64_0' 
   F64_0   = 'f64_0 who mainly pay for your medical cost?' 
   RF65_0  = 'rf65_0 proxy or not for f65_0' 
   F65_0   = 'f65_0 main reason not visit doctor when necessary' 
   RF101_0 = 'rf101_0 proxy or not for f101_0' 
   F101_0  = 'f101_0 age when gave the first birth' 
   RF102_0 = 'rf102_0 proxy or not for f102_0' 
   F102_0  = 'f102_0 age when gave the last birth' 
   G1_0    = 'g1_0 visual function' 
   G21_0   = 'g21_0 number of natural teeth have' 
   G22_0   = 'g22_0 have false teeth?' 
   G3_0    = 'g3_0 able to use chopsticks to eat?' 
   G4_0    = 'g4_0 which hand do you normally use for eating?' 
   G51_0   = 'g51_0 systolic' 
   G52_0   = 'g52_0 diastolic' 
   G6_0    = 'g6_0 rhythm of heart' 
   G7_0    = 'g7_0 heart rate' 
   G81_0   = 'g81_0 hand behind neck' 
   G82_0   = 'g82_0 hand behind lower back' 
   G9_0    = 'g9_0 able to stand up from sitting in a chair?' 
   G10_0   = 'g10_0 weight' 
   G11_0   = 'g11_0 able to pick up a book from the floor?' 
   G12_0   = 'g12_0 steps used to turn around 360 degree without help?' 
   RG13_0  = 'rg13_0 with proxy or not for g13_0' 
   G13_0   = 'g13_0 # of times suffering from serious illness in the past two years' 
   G14A1_0 = 'g14a1_0 name of disease suffering at the first time' 
   G14A2_0 = 'g14a2_0 days lasted for the first time' 
   G14B1_0 = 'g14b1_0 name of disease suffering at the second time' 
   G14B2_0 = 'g14b2_0 days lasted for the second time' 
   G14C1_0 = 'g14c1_0 name of disease suffering at the last time' 
   G14C2_0 = 'g14c2_0 days lasted for the last time' 
   G15A1_0 = 'g15a1_0 suffering from hypertension?' 
   G15A2_0 = 'g15a2_0 diagnosed by hospital?' 
   G15A3_0 = 'g15a3_0 disability in daily life' 
   G15B1_0 = 'g15b1_0 suffering from diabetes?' 
   G15B2_0 = 'g15b2_0 diagnosed by hospital?' 
   G15B3_0 = 'g15b3_0 disability in daily life' 
   G15C1_0 = 'g15c1_0 suffering from hear disease?' 
   G15C2_0 = 'g15c2_0 diagnosed by hospital?' 
   G15C3_0 = 'g15c3_0 disability in daily life' 
   G15D1_0 = 'g15d1_0 suffering from stroke or cvd?' 
   G15D2_0 = 'g15d2_0 diagnosed by hospital?' 
   G15D3_0 = 'g15d3_0 disability in daily life' 
   G15E1_0 = 'g15e1_0 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_0 = 'g15e2_0 diagnosed by hospital?' 
   G15E3_0 = 'g15e3_0 disability in daily life' 
   G15F1_0 = 'g15f1_0 suffering from tuberculosis?' 
   G15F2_0 = 'g15f2_0 diagnosed by hospital?' 
   G15F3_0 = 'g15f3_0 disability in daily life' 
   G15G1_0 = 'g15g1_0 suffering from cataract?' 
   G15G2_0 = 'g15g2_0 diagnosed by hospital?' 
   G15G3_0 = 'g15g3_0 disability in daily life' 
   G15H1_0 = 'g15h1_0 suffering from glaucoma?' 
   G15H2_0 = 'g15h2_0 diagnosed by hospital?' 
   G15H3_0 = 'g15h3_0 disability in daily life' 
   G15I1_0 = 'g15i1_0 suffering from cancer?' 
   G15I2_0 = 'g15i2_0 diagnosed by hospital?' 
   G15I3_0 = 'g15i3_0 disability in daily life' 
   G15J1_0 = 'g15j1_0 suffering from prostate tumor?' 
   G15J2_0 = 'g15j2_0 diagnosed by hospital?' 
   G15J3_0 = 'g15j3_0 disability in daily life' 
   G15K1_0 = 'g15k1_0 suffering from gastric or duodenal ulcer?' 
   G15K2_0 = 'g15k2_0 diagnosed by hospital?' 
   G15K3_0 = 'g15k3_0 disability in daily life' 
   G15L1_0 = 'g15l1_0 suffering from parkinson''s disease?' 
   G15L2_0 = 'g15l2_0 diagnosed by hospital?' 
   G15L3_0 = 'g15l3_0 disability in daily life' 
   G15M1_0 = 'g15m1_0 suffering from bedsore?' 
   G15M2_0 = 'g15m2_0 diagnosed by hospital?' 
   G15M3_0 = 'g15m3_0 disability in daily life' 
   G15N1_0 = 'g15n1_0 suffering from arthritis?' 
   G15N2_0 = 'g15n2_0 diagnosed by hospital?' 
   G15N3_0 = 'g15n3_0 disability in daily life' 
   G15O1_0 = 'g15o1_0 suffering from dementia?' 
   G15O2_0 = 'g15o2_0 diagnosed by hospital?' 
   G15O3_0 = 'g15o3_0 disability in daily life' 
   G15P1_0 = 'g15p1_0 suffering from other chronic disease?' 
   G15P2_0 = 'g15p2_0 diagnosed by hospital?' 
   G15P3_0 = 'g15p3_0 disability in daily life' 
   H1_0    = 'h1_0 was interviewee able to hear?' 
   H21_0   = 'h21_0 did interviewee able to participate physical check?' 
   H22_0   = 'h22_0 the reason of unable to participate physical check' 
   H3_0    = 'h3_0 the health of interviewee rated by interviewer' 
   H6_0    = 'h6_0 has interviewer checked whether failing to ask a question?' 
   H7_0    = 'h7_0 did anyone help the interviewee to answer question' 
   H71_0   = 'h71_0 who helped interviewee to answer question?' 
   H8_0    = 'h8_0 did interviewer take a photo for interviewee?' 
   S1_0    = 's1_0 interviewer''s opinion based on information got from the elder''s neighbors' 
   S2_0    = 's2_0 interviewer''s opinion based on information got from the elder''s neighborhood com' 
   D0PROVID= 'd0provid province living in at death' 
   D0RESID = 'd0resid place of residence at death' 
   D0RESPON= 'd0respon who answered the questionnaire' 
   D0UNFINI= 'd0unfini main reason which did not finish the interview' 
   D0SEX   = 'd0sex sex of the deceased elder' 
   D0MARRY = 'd0marry marital status of the deceased elder at death' 
   D0LIVARR= 'd0livarr primary living arrangement of the deceased elder in the last year of life' 
   D0PERSON= 'd0person number of people who living with the respondent before dying' 
   D0VYEAR = 'd0vyear validated year of death' 
   D0VMONTH= 'd0vmonth validated month of death' 
   D0VDAY  = 'd0vday validated day of death' 
   D0VDAGE = 'd0vdage validated age at death' 
   D0DPLACE= 'd0dplace place of death' 
   D0CAUSE = 'd0cause main cause of death' 
   D0CARGIV= 'd0cargiv first caregiver before dying' 
   D0BEDRID= 'd0bedrid bedridden or nor before dying' 
   D0BEDDAY= 'd0bedday days of being bedridden before dying' 
   D0ILL   = 'd0ill number of times suffering from serious illness' 
   D0DISEA1= 'd0disea1 name of disease suffering from at the first time' 
   D0DIDAY1= 'd0diday1 days suffering from such disease at the first time' 
   D0DISEA2= 'd0disea2 name of disease suffering from at the second time' 
   D0DIDAY2= 'd0diday2 days suffering from such disease at the second time' 
   D0DISEA3= 'd0disea3 name of disease suffering from at the last time' 
   D0DIDAY3= 'd0diday3 days suffering from such disease at the last time' 
   D0HYPERT= 'd0hypert suffering from hypertension before dying?' 
   D0DIABET= 'd0diabet suffering from diabetes before dying?' 
   D0HEART = 'd0heart suffering from heart disease before dying' 
   D0CVD   = 'd0cvd suffering from stroke or cvd before dying?' 
   D0PNEUM = 'd0pneum suffering from bronchitis, emphysema, pneumonia before dying?' 
   D0TUBERC= 'd0tuberc suffering from tuberculosis before dying?' 
   D0GLAUCO= 'd0glauco suffering from glaucoma or cataract before dying?' 
   D0PROSTA= 'd0prosta suffering from prostate tumor before dying?' 
   D0GASTRI= 'd0gastri suffering from gastric or duodenal ulcer before dying?' 
   D0PARKIN= 'd0parkin suffering from parkinson''s disease before dying?' 
   D0BEDSOR= 'd0bedsor suffering from bedsore before dying?' 
   D0DEMENT= 'd0dement suffering from dementia before dying?' 
   D0PSYCHO= 'd0psycho suffering from psychosis before dying?' 
   D0NEUROS= 'd0neuros suffering from neurosis disease?' 
   D0ARTHRI= 'd0arthri suffering from arthritis before dying?' 
   D0OTHERS= 'd0others suffering from other chronic disease before dying?' 
   D0MEDICA= 'd0medica got timely medication before dying' 
   D0FINANC= 'd0financ main financial source before dying' 
   D0INCOME= 'd0income yearly per capita income of the family of the deceased elder' 
   D0WCFACI= 'd0wcfaci family had toilet facility before the elder died' 
   D0TAPWAT= 'd0tapwat family had tap water facility before the elder died' 
   D0BATHFA= 'd0bathfa family had bathing/showering facility before the elder died' 
   D0HEATER= 'd0heater family had heater/heating system before the elder died' 
   D0TVSET = 'd0tvset family had tv before the elder died' 
   D0WASHMA= 'd0washma family had washing machine before elder died' 
   D0PHONE = 'd0phone family had telephone before the elder died' 
   D0DOCTOR= 'd0doctor if the deceased elder was from rural, was there a doctor in the village?' 
   D0LICDOC= 'd0licdoc did the village doctor have a license?' 
   D0WHOPAY= 'd0whopay who mainly paid the medical cost for the deceased elder?' 
   D0MEDCOS= 'd0medcos total medical cost (rmb) in the last year of the life' 
   D0BATHFU= 'd0bathfu functioning of bathing before dying' 
   D0B_AGE1= 'd0b_age1 age starting to be partially dependent in bathing' 
   D0B_AGE2= 'd0b_age2 age starting to be fully dependent in bathing' 
   D0DRESFU= 'd0dresfu functioning of dressing before dying' 
   D0D_AGE1= 'd0d_age1 age starting to be partially dependent in dressing' 
   D0D_AGE2= 'd0d_age2 age starting to be fully dependent in dressing' 
   D0TOILFU= 'd0toilfu functioning of toileting before dying' 
   D0T_AGE1= 'd0t_age1 age starting to be partially dependent in toileting' 
   D0T_AGE2= 'd0t_age2 age starting to be fully dependent in toileting' 
   D0MOVEFU= 'd0movefu functioning of indoor transferring before dying' 
   D0M_AGE1= 'd0m_age1 age starting to be partially dependent in indoor transferring' 
   D0M_AGE2= 'd0m_age2 age starting to be fully dependent in indoor transferring' 
   D0CONTFU= 'd0contfu functioning of continence before dying' 
   D0C_AGE1= 'd0c_age1 age starting to be partially dependent in continence' 
   D0C_AGE2= 'd0c_age2 age starting to be fully dependent in continence' 
   D0FEEDFU= 'd0feedfu functioning of self-feeding before dying' 
   D0F_AGE1= 'd0f_age1 age starting to be partially dependent in feeding' 
   D0F_AGE2= 'd0f_age2 age starting to be fully dependent in feeding' 
   D0OUTDOR= 'd0outdor days the elder could not get outdoor to chat before dying' 
   D0ACTDAY= 'd0actday number of days of being bedridden in daytime is longer than non-bedridden time' 
   D0SMOKE = 'd0smoke smoked or not since the last interview' 
   D0SMKTIM= 'd0smktim number of times smoked a day on average' 
   D0DRINK = 'd0drink did the deceased elder drink since the last interview?' 
   D0KNDDRK= 'd0knddrk what kind of drink if the elder drank?' 
   D0DRKMCH= 'd0drkmch how much (liang) did the elder drink every day since last interview?' 
   DTH00_02= 'dth00_02 status of survival, death, or lost to follow-up from 2000 to 2002 waves' 
   MONTH_2 = 'month_2 month of the interview in 2002' 
   DAY_2   = 'day_2 day of the interview in 2002' 
   RESID_2 = 'resid_2 ctegory of residence of the interviewee in 2002' 
   VAGE_2  = 'vage_2 validated age at the 2002 survey' 
   RA51_2  = 'ra51_2 proxy or not for a51_2' 
   A51_2   = 'a51_2 co-residence of interviewee' 
   RA52_2  = 'ra52_2 proxy or not for a52_2' 
   A52_2   = 'a52_2 how many people are living with you?' 
   RA53A_2 = 'ra53a_2 proxy or not for a53a1_2, a53a2_2 a53a3_2' 
   A53A1_2 = 'a53a1_2 relationship between you and 1st person you living with currently' 
   A53A2_2 = 'a53a2_2 age of 1st person you living with currently' 
   A53A3_2 = 'a53a3_2 sex of 1st person you living with currently' 
   RA53B_2 = 'ra53b_2 proxy or not for a53b1_2, a53b2_2 a53b3_2' 
   A53B1_2 = 'a53b1_2 relationship between you and 2nd person you living with currently' 
   A53B2_2 = 'a53b2_2 age of 2nd person you living with currently' 
   A53B3_2 = 'a53b3_2 sex of 2nd person you living with currently' 
   RA53C_2 = 'ra53c_2 proxy or not for a53c1_2, a53c2_2 a53c3_2' 
   A53C1_2 = 'a53c1_2 relationship between you and 3rd person you living with currently' 
   A53C2_2 = 'a53c2_2 age of 3rd person you living with currently' 
   A53C3_2 = 'a53c3_2 sex of 3rd person you living with currently' 
   RA53D_2 = 'ra53d_2 proxy or not for a53d1_2, a53d2_2 a53d3_2' 
   A53D1_2 = 'a53d1_2 relationship between you and 4th person you living with currently' 
   A53D2_2 = 'a53d2_2 age of 4th person you living with currently' 
   A53D3_2 = 'a53d3_2 sex of 4th person you living with currently' 
   RA53E_2 = 'ra53e_2 proxy or not for a53e1_2, a53e2_2 a53e3_2' 
   A53E1_2 = 'a53e1_2 relationship between you and 5th person you living with currently' 
   A53E2_2 = 'a53e2_2 age of 5th person you living with currently' 
   A53E3_2 = 'a53e3_2 sex of 5th person you living with currently' 
   RA53F_2 = 'ra53f_2 proxy or not for a53f1_2, a53f2_2 a53f3_2' 
   A53F1_2 = 'a53f1_2 relationship between you and 6th person you living with currently' 
   A53F2_2 = 'a53f2_2 age of 6th person you living with currently' 
   A53F3_2 = 'a53f3_2 sex of 6th person you living with currently' 
   RA53G_2 = 'ra53g_2 proxy or not for a53g1_2, a53g2_2 a53g3_2' 
   A53G1_2 = 'a53g1_2 relationship between you and 7th person you living with currently' 
   A53G2_2 = 'a53g2_2 age of 7th person you living with currently' 
   A53G3_2 = 'a53g3_2 sex of 7th person you living with currently' 
   RA53H_2 = 'ra53h_2 proxy or not for a53h1_2, a53h2_2 a53h3_2' 
   A53H1_2 = 'a53h1_2 relationship between you and 8th person you living with currently' 
   A53H2_2 = 'a53h2_2 age of 8th person you living with currently' 
   A53H3_2 = 'a53h3_2 sex of 8th person you living with currently' 
   RA53I_2 = 'ra53i_2 proxy or not for a53i1_2, a53i2_2 a53i3_2' 
   A53I1_2 = 'a53i1_2 relationship between you and 9th person you living with currently' 
   A53I2_2 = 'a53i2_2 age of 9th person you living with currently' 
   A53I3_2 = 'a53i3_2 sex of 9th person you living with currently' 
   RA53J_2 = 'ra53j_2 proxy or not for a53j1_2, a53j2_2 a53j3_2' 
   A53J1_2 = 'a53j1_2 relationship between you and 10th person you living with currently' 
   A53J2_2 = 'a53j2_2 age of 10th person you living with currently' 
   A53J3_2 = 'a53j3_2 sex of 10th person you living with currently' 
   RA53K_2 = 'ra53k_2 proxy or not for a53k1_2, a53k2_2 a53k3_2' 
   A53K1_2 = 'a53k1_2 relationship between you and 11th person you living with currently' 
   A53K2_2 = 'a53k2_2 age of 11th person you living with currently' 
   A53K3_2 = 'a53k3_2 sex of 11th person you living with currently' 
   RA53L_2 = 'ra53l_2 proxy or not for a53l1_2, a53l2_2 a53l3_2' 
   A53L1_2 = 'a53l1_2 relationship between you and 12th person you living with currently' 
   A53L2_2 = 'a53l2_2 age of 12th person you living with currently' 
   A53L3_2 = 'a53l3_2 sex of 12th person you living with currently' 
   RA531_2 = 'ra531_2 proxy or not for a531_2' 
   A531_2  = 'a531_2 under whose name your current house/apartment purchased or rented' 
   RA532_2 = 'ra532_2 proxy or not for a532_2' 
   A532_2  = 'a532_2 do you (and your spouse) have your own bedroom?' 
   RA54_2  = 'ra54_2 proxy or not for a54a_2 and a54b_2' 
   A54A_2  = 'a54a_2 year of being admitted to the nursing home' 
   A54B_2  = 'a54b_2 month of being admitted to the nursing home' 
   B11_2   = 'b11_2 self-reported quality of life' 
   B12_2   = 'b12_2 self-reported health' 
   B121_2  = 'b121_2 do you feel any change of your health since last year?' 
   B21_2   = 'b21_2 look on the bright side of things' 
   B22_2   = 'b22_2 keep my belongings neat and clean' 
   B23_2   = 'b23_2 feel fearful or anxious' 
   B24_2   = 'b24_2 feel lonely and isolated' 
   B25_2   = 'b25_2 make own decision' 
   B26_2   = 'b26_2 feel useless with age' 
   B27_2   = 'b27_2 be happy as younger' 
   C11_2   = 'c11_2 what time of day is it right now?' 
   C12_2   = 'c12_2 what month is it right now?' 
   C13_2   = 'c13_2 what is the date of the mid-autumn festival?' 
   C131_2  = 'c131_2 name four leaders since the new republic' 
   C14_2   = 'c14_2 what is the season right now?' 
   C15_2   = 'c15_2 what is the name of this county or district?' 
   C16_2   = 'c16_2 # of kinds of food named in one minute' 
   C161_2  = 'c161_2 # of jie qi in a year?' 
   C162_2  = 'c162_2 name four province capital or big city' 
   C163_2  = 'c163_2 when we succeed in anti-japanese war?' 
   C21A_2  = 'c21a_2 repeat the name of ''table'' at the first time' 
   C21B_2  = 'c21b_2 repeat the name of ''apple'' at the first time' 
   C21C_2  = 'c21c_2 repeat the name of ''clothes'' at the first time' 
   C22_2   = 'c22_2 attempts to repeat the names of three objects correctly' 
   C31A_2  = 'c31a_2 $20-$3=?' 
   C31B_2  = 'c31b_2 $20-$3-$3=?' 
   C31C_2  = 'c31c_2 $20-$3-$3-$3=?' 
   C31D_2  = 'c31d_2 $20-$3-$3-$3-$3=?' 
   C31E_2  = 'c31e_2 $20-$3-$3-$3-$3-$3=?' 
   C32_2   = 'c32_2 draw the figure following the sample' 
   C41A_2  = 'c41a_2 repeat the name of ''table'' a while later' 
   C41B_2  = 'c41b_2 repeat the name of ''apple'' a while later' 
   C41C_2  = 'c41c_2 repeat the name of ''clothes'' a while later' 
   C51A_2  = 'c51a_2 naming ''pen''' 
   C51B_2  = 'c51b_2 naming ''watch''' 
   C52_2   = 'c52_2 repeat a sentence' 
   C521_2  = 'c521_2 number of words correctly repeated' 
   C53A_2  = 'c53a_2 taking paper using right hand' 
   C53B_2  = 'c53b_2 folding paper' 
   C53C_2  = 'c53c_2 put paper on the floor' 
   C54_2   = 'c54_2 was the interviewee able to answer sections b and c?' 
   C55_2   = 'c55_2 what is the main reason unable to answer questions?' 
   RD1_2   = 'rd1_2 proxy or not for d1_2' 
   D1_2    = 'd1_2 staple food' 
   RD2_2   = 'rd2_2 proxy or not for d2_2' 
   D2_2    = 'd2_2 amount of staple food per day (liang)' 
   RD31_2  = 'rd31_2 proxy or not for d31_2' 
   D31_2   = 'd31_2 how often eat fresh fruit?' 
   RD32_2  = 'rd32_2 proxy or not for d32_2' 
   D32_2   = 'd32_2 how often eat vegetables?' 
   RD4MT_2 = 'rd4mt_2 proxy or not for d4mt2_2' 
   D4MT2_2 = 'd4mt2_2 how often eat meat at present?' 
   RD4FSH_2= 'rd4fsh_2 proxy or not for d4fsh2_2' 
   D4FSH2_2= 'd4fsh2_2 how often eat fish at present?' 
   RD4EGG_2= 'rd4egg_2 proxy or not for d4egg2_2' 
   D4EGG2_2= 'd4egg2_2 how often eat eggs at present?' 
   RD4BEN_2= 'rd4ben_2 proxy or not for d4ben2_2' 
   D4BEN2_2= 'd4ben2_2 how often eat bean at present?' 
   RD4VEG_2= 'rd4veg_2 proxy or not for d4veg2_2' 
   D4VEG2_2= 'd4veg2_2 how often eat salt-preserved vegetables at present?' 
   RD4SUG_2= 'rd4sug_2 proxy or not for d4sug2_2' 
   D4SUG2_2= 'd4sug2_2 how often eat sugar at present?' 
   RD4TEA_2= 'rd4tea_2 proxy or not for d4tea2_2' 
   D4TEA2_2= 'd4tea2_2 how often drink tea at present?' 
   RD4GAR_2= 'rd4gar_2 proxy or not for d4gar2_2' 
   D4GAR2_2= 'd4gar2_2 how often eat garlic at present?' 
   RD5_2   = 'rd5_2 proxy or not for d5_2' 
   D5_2    = 'd5_2 what kind of water usually drink?' 
   RD6_2   = 'rd6_2 proxy or not for d6c_2' 
   D6C_2   = 'd6c_2 water you drink at present is from' 
   RD71_2  = 'rd71_2 proxy or not for d71_2' 
   D71_2   = 'd71_2 smoke or not at present?' 
   RD74_2  = 'rd74_2 proxy or not for d74_2' 
   D74_2   = 'd74_2 age when quitting smoking if not smoke at present' 
   RD75_2  = 'rd75_2 proxy or not for d75' 
   D75_2   = 'd75_2 times smoke (or smoked) per day' 
   RD81_2  = 'rd81_2 proxy or not for d81_2' 
   D81_2   = 'd81_2 drink or not at present?' 
   RD84_2  = 'rd84_2 proxy or not for d84_2' 
   D84_2   = 'd84_2 age when quitting drinking if not drink at present' 
   RD85_2  = 'rd85_2 proxy or not for d85_2' 
   D85_2   = 'd85_2 what kind of drink if drink (drank)?' 
   RD86_2  = 'rd86_2 proxy or not for d86_2' 
   D86_2   = 'd86_2 how much per day if drink( or drank)?' 
   RD91_2  = 'rd91_2 proxy or not for d91_2' 
   D91_2   = 'd91_2 exercise or not at present?' 
   RD94_2  = 'rd94_2 proxy or not for d94_2' 
   D94_2   = 'd94_2 age when quitting exercising if not exercise at present' 
   RD11A_2 = 'rd11a_2 proxy or not for d11a_2' 
   D11A_2  = 'd11a_2 do you do house work at present?' 
   RD11B_2 = 'rd11b_2 proxy or not for d11b_2' 
   D11B_2  = 'd11b_2 do you do any personal outdoor activities at present?' 
   RD11C_2 = 'rd11c_2 proxy or not for d11c_2' 
   D11C_2  = 'd11c_2 do you do garden work' 
   RD11D_2 = 'rd11d_2 proxy or not for d11d_2' 
   D11D_2  = 'd11d_2 do you read newspapers/books at present?' 
   RD11E_2 = 'rd11e_2 proxy or not for d11e_2' 
   D11E_2  = 'd11e_2 do you raise domestic animals/pets at present?' 
   RD11F_2 = 'rd11f_2 proxy or not for d11f_2' 
   D11F_2  = 'd11f_2 do you play cards/mah-jong at present?' 
   RD11G_2 = 'rd11g_2 proxy or not for d11g_2' 
   D11G_2  = 'd11g_2 do you watch tv or listen to the radio at present?' 
   RD11H_2 = 'rd11h_2 proxy or not for d11h_2' 
   D11H_2  = 'd11h_2 do you take part in some social activities?' 
   RD11I_2 = 'rd11i_2 proxy or not for d11i_2' 
   D11I_2  = 'd11i_2 do you participate religious activities at present?' 
   RD12_2  = 'rd12_2 proxy or not for d12_2' 
   D12_2   = 'd12_2 # of traveling in the past two years' 
   RE1_2   = 're1_2 proxy or not for e1_2' 
   E1_2    = 'e1_2 bathing' 
   RE1A_2  = 're1a_2 proxy or not for e1a_2' 
   E1A_2   = 'e1a_2 if needed, who helped you?' 
   RE2_2   = 're2_2 proxy or not for e2_2' 
   E2_2    = 'e2_2 dressing' 
   RE2A_2  = 're2a_2 proxy or not for e2a_2' 
   E2A_2   = 'e2a_2 if needed, who helped you?' 
   RE3_2   = 're3_2 proxy or not for e3_2' 
   E3_2    = 'e3_2 toileting' 
   RE3A_2  = 're3a_2 proxy or not for e3a_2' 
   E3A_2   = 'e3a_2 if needed, who helped you?' 
   RE4_2   = 're4_2 proxy or not for e4_2' 
   E4_2    = 'e4_2 transferring' 
   RE4A_2  = 're4a_2 proxy or not for e4a_2' 
   E4A_2   = 'e4a_2 if needed, who helped you?' 
   RE5_2   = 're5_2 proxy or not for e5_2' 
   E5_2    = 'e5_2 continence' 
   RE5A_2  = 're5a_2 proxy or not for e5a_2' 
   E5A_2   = 'e5a_2 if needed, who helped you?' 
   RE6_2   = 're6_2 proxy or not for e6_2' 
   E6_2    = 'e6_2 feeding' 
   RE6A_2  = 're6a_2 proxy or not for e6a_2' 
   E6A_2   = 'e6a_2 if needed, who helped you?' 
   RE7_2   = 're7_2 proxy or not for e7_2' 
   E7_2    = 'e7_2 able to go outside to visit neighbors?' 
   RE8_2   = 're8_2 proxy or not for e8_2' 
   E8_2    = 'e8_2 able to go shopping by yourself?' 
   RE9_2   = 're9_2 proxy or not for e9_2' 
   E9_2    = 'e9_2 able to make food by yourself?' 
   RE10_2  = 're10_2 proxy or not for e10_2' 
   E10_2   = 'e10_2 able to wash clothes by yourself?' 
   RE11_2  = 're11_2 proxy or not for e11_2' 
   E11_2   = 'e11_2 able to walk one kilometer?' 
   RE12_2  = 're12_2 proxy or not for e12_2' 
   E12_2   = 'e12_2 able to carry 5kg weight?' 
   RE13_2  = 're13_2 proxy or not for e13_2' 
   E13_2   = 'e13_2 able to crouch and stand for three times?' 
   RE14_2  = 're14_2 proxy or not for e14_2' 
   E14_2   = 'e14_2 able to take public transport?' 
   RF21_2  = 'rf21_2 proxy or not for f21_2' 
   F21_2   = 'f21_2 do you have pension?' 
   RF211_2 = 'rf211_2 proxy or not for f211_2' 
   F211_2  = 'f211_2 did you retire?' 
   RF22_2  = 'rf22_2 proxy or not for f22_2' 
   F22_2   = 'f22_2 which year did you retire?' 
   RF23_2  = 'rf23_2 proxy or not for f23_2' 
   F23_2   = 'f23_2 did you do something paid after retirement?' 
   RF31_2  = 'rf31_2 proxy or not for f31_2' 
   F31_2   = 'f31_2 main financial source' 
   RF32_2  = 'rf32_2 proxy or not for f32_2' 
   F32_2   = 'f32_2 other financial sources' 
   RF33_2  = 'rf33_2 proxy or not for f33_2' 
   F33_2   = 'f33_2 are all financial sources enough for your life?' 
   RF34_2  = 'rf34_2 proxy or not for f34_2' 
   F34_2   = 'f34_2 how about your life compared with other local people?' 
   RF35_2  = 'rf35_2 proxy or not for f35_2' 
   F35_2   = 'f35_2 what''s your family per capital income last year?' 
   RF41_2  = 'rf41_2 proxy or not for f41_2' 
   F41_2   = 'f41_2 current marital status' 
   RF45_2  = 'rf45_2 proxy or not for f45_2' 
   F45_2   = 'f45_2 main occupation of the latest spouse before age 60' 
   RF5_2   = 'rf5_2 proxy or not for f5_2' 
   F5_2    = 'f5_2 who take care of you when you are sick?' 
   RF61_2  = 'rf61_2 proxy or not for f61_2' 
   F61_2   = 'f61_2 get adequate medical service at present' 
   RF64_2  = 'rf64_2 proxy or not for f64_2' 
   F64_2   = 'f64_2 who mainly pay for your medical cost?' 
   RF65_2  = 'rf65_2 proxy or not for f65_2' 
   F65_2   = 'f65_2 main reason not visit doctor when necessary' 
   RF104_2 = 'rf104_2 proxy or not for f104_2' 
   F104_2  = 'f104_2 if your 1st child died, what would his/her age be at present if she/he were aliv' 
   RF105_2 = 'rf105_2 proxy or not for f105_2' 
   F105_2  = 'f105_2 if your last child died, what would his/her age be at present if she/he were ali' 
   RF111_2 = 'rf111_2 proxy or not for f111_2' 
   F111_2  = 'f111_2 to whom do you usually talk most frequently in daily life?' 
   RF112_2 = 'rf112_2 proxy or not for f112_2' 
   F112_2  = 'f112_2 to whom do you talk first when you need to tell something of your thoughts?' 
   RF113_2 = 'rf113_2 proxy or not for f113_2' 
   F113_2  = 'f113_2 who do you ask first for help when you have problems/difficulties?' 
   RF12_2  = 'rf12_2 proxy or not for f12a_2 and f12b_2' 
   F12A_2  = 'f12a_2 how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_2  = 'f12b_2 how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   RF13_2  = 'rf13_2 proxy or not for f13a_2 and f13b_2' 
   F13A_2  = 'f13a_2 how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_2  = 'f13b_2 how much did you give to your daughter(s) or son(s)-in-law last year?' 
   G1_2    = 'g1_2 visual function' 
   G21_2   = 'g21_2 number of natural teeth have' 
   G22_2   = 'g22_2 have false teeth' 
   G3_2    = 'g3_2 able to use chopsticks to eat?' 
   G4_2    = 'g4_2 which hand do you normally use for eating?' 
   G51_2   = 'g51_2 systolic' 
   G52_2   = 'g52_2 diastolic' 
   G6_2    = 'g6_2 rhythm of heart' 
   G7_2    = 'g7_2 heart rate' 
   G81_2   = 'g81_2 hand behind neck' 
   G82_2   = 'g82_2 hand behind lower back' 
   G83_2   = 'g83_2 raise arms upright' 
   G9_2    = 'g9_2 able to stand up from sitting in a chair' 
   RG101_2 = 'rg101_2 proxy or not for g101_2' 
   G101_2  = 'g101_2 weight' 
   G102A_2 = 'g102a_2 length from wrist to shoulder' 
   G102B_2 = 'g102b_2 length from kneel to floor' 
   G11_2   = 'g11_2 able to pick up a book from the floor' 
   G12_2   = 'g12_2 steps used to turn around 360 degree without help' 
   RG13_2  = 'rg13_2 proxy or not for g13_2' 
   G13_2   = 'g13_2 number of times suffering from serious illness in the past two years' 
   G14A1_2 = 'g14a1_2 name of disease suffering at the first time' 
   G14A2_2 = 'g14a2_2 days lasted for the first time' 
   G14B1_2 = 'g14b1_2 name of disease suffering at the second time' 
   G14B2_2 = 'g14b2_2 days lasted for the second time' 
   G14C1_2 = 'g14c1_2 name of disease suffering at the last time' 
   G14C2_2 = 'g14c2_2 days lasted for the last time' 
   G15A1_2 = 'g15a1_2 suffering from hypertension' 
   G15A2_2 = 'g15a2_2 diagnosed by hospital' 
   G15A3_2 = 'g15a3_2 disability in daily life' 
   G15B1_2 = 'g15b1_2 suffering from diabetes' 
   G15B2_2 = 'g15b2_2 diagnosed by hospital' 
   G15B3_2 = 'g15b3_2 disability in daily life' 
   G15C1_2 = 'g15c1_2 suffering from heart disease' 
   G15C2_2 = 'g15c2_2 diagnosed by hospital' 
   G15C3_2 = 'g15c3_2 disability in daily life' 
   G15D1_2 = 'g15d1_2 suffering from stroke or cvd' 
   G15D2_2 = 'g15d2_2 diagnosed by hospital' 
   G15D3_2 = 'g15d3_2 disability in daily life' 
   G15E1_2 = 'g15e1_2 suffering from bronchitis, emphysema, pneumonia, asthma' 
   G15E2_2 = 'g15e2_2 diagnosed by hospital' 
   G15E3_2 = 'g15e3_2 disability in daily life' 
   G15F1_2 = 'g15f1_2 suffering from tuberculosis' 
   G15F2_2 = 'g15f2_2 diagnosed by hospital' 
   G15F3_2 = 'g15f3_2 disability in daily life' 
   G15G1_2 = 'g15g1_2 suffering from cataract' 
   G15G2_2 = 'g15g2_2 diagnosed by hospital' 
   G15G3_2 = 'g15g3_2 disability in daily life' 
   G15H1_2 = 'g15h1_2 suffering from glaucoma' 
   G15H2_2 = 'g15h2_2 diagnosed by hospital' 
   G15H3_2 = 'g15h3_2 disability in daily life' 
   G15I1_2 = 'g15i1_2 suffering from cancer' 
   G15I2_2 = 'g15i2_2 diagnosed by hospital' 
   G15I3_2 = 'g15i3_2 disability in daily life' 
   G15J1_2 = 'g15j1_2 suffering from prostate tumor' 
   G15J2_2 = 'g15j2_2 diagnosed by hospital' 
   G15J3_2 = 'g15j3_2 disability in daily life' 
   G15K1_2 = 'g15k1_2 suffering from gastric or duodenal ulcer' 
   G15K2_2 = 'g15k2_2 diagnosed by hospital' 
   G15K3_2 = 'g15k3_2 disability in daily life' 
   G15L1_2 = 'g15l1_2 suffering from parkinson''s disease' 
   G15L2_2 = 'g15l2_2 diagnosed by hospital' 
   G15L3_2 = 'g15l3_2 disability in daily life' 
   G15M1_2 = 'g15m1_2 suffering from bedsore' 
   G15M2_2 = 'g15m2_2 diagnosed by hospital' 
   G15M3_2 = 'g15m3_2 disability in daily life' 
   G15N1_2 = 'g15n1_2 suffering from arthritis' 
   G15N2_2 = 'g15n2_2 diagnosed by hospital' 
   G15N3_2 = 'g15n3_2 disability in daily life' 
   G15O1_2 = 'g15o1_2 suffering from dementia' 
   G15O2_2 = 'g15o2_2 diagnosed by hospital' 
   G15O3_2 = 'g15o3_2 disability in daily life' 
   G15P1_2 = 'g15p1_2 suffering from disease difficult to classify' 
   G15P2_2 = 'g15p2_2 diagnosed by hospital' 
   G15P3_2 = 'g15p3_2 disability in daily life' 
   G15Q1_2 = 'g15q1_2 suffering from mental disease' 
   G15Q2_2 = 'g15q2_2 diagnosed by hospital' 
   G15Q3_2 = 'g15q3_2 disability in daily life' 
   G15R1_2 = 'g15r1_2 suffering from orthopedic disease' 
   G15R2_2 = 'g15r2_2 diagnosed by hospital' 
   G15R3_2 = 'g15r3_2 disability in daily life' 
   G15S1_2 = 'g15s1_2 suffering from internal medical disease' 
   G15S2_2 = 'g15s2_2 diagnosed by hospital' 
   G15S3_2 = 'g15s3_2 disability in daily life' 
   G15T1_2 = 'g15t1_2 suffering from dermatosis' 
   G15T2_2 = 'g15t2_2 diagnosed by hospital' 
   G15T3_2 = 'g15t3_2 disability in daily life' 
   G15U1_2 = 'g15u1_2 suffering from five organs diseases' 
   G15U2_2 = 'g15u2_2 diagnosed by hospital' 
   G15U3_2 = 'g15u3_2 disability in daily life' 
   G15V1_2 = 'g15v1_2 suffering from gynecological disease' 
   G15V2_2 = 'g15v2_2 diagnosed by hospital' 
   G15V3_2 = 'g15v3_2 disability in daily life' 
   G15W1_2 = 'g15w1_2 suffering from others' 
   G15W2_2 = 'g15w2_2 diagnosed by hospital' 
   G15W3_2 = 'g15w3_2 disability in daily life' 
   H1_2    = 'h1_2 was interviewee able to hear?' 
   H21_2   = 'h21_2 did interviewee able to participate physical check?' 
   H22_2   = 'h22_2 the reason of unable to participate physical check' 
   H3_2    = 'h3_2 the health of interviewee rated by interviewer' 
   H6_2    = 'h6_2 has interviewer checked whether failing to ask a question?' 
   H7_2    = 'h7_2 did anyone help the interviewee to answer question?' 
   H71_2   = 'h71_2 who helped interviewee to answer question?' 
   H8_2    = 'h8_2 did interviewer take a photo for interviewee?' 
   D2PROVIN= 'd2provin province of residence at the time of death' 
   D2RESID = 'd2resid place of residence at death' 
   D2RESPON= 'd2respon who answered the questionnaire' 
   D2VYEAR = 'd2vyear validated year of death' 
   D2VMONTH= 'd2vmonth validated month of death' 
   D2VDAY  = 'd2vday validated day of death' 
   D2MTHIN = 'd2mthin month of the 2002 interview conducted' 
   D2DAYIN = 'd2dayin day of the 2002 interview conducted' 
   D2SEX   = 'd2sex sex of the deceased elder' 
   D2VAGE  = 'd2vage validated age at death' 
   D2MARRY = 'd2marry marital status of the deceased elder at death' 
   D2LIVARR= 'd2livarr primary living arrangement of the deceased elder in the last year of life' 
   D2PERSON= 'd2person number of people who living with the respondent before dying' 
   D2GENER = 'd2gener number of generations living in the household when the elderly died' 
   D2DPLACE= 'd2dplace place of death' 
   D2CAUSE = 'd2cause main cause of death' 
   D2CARGIV= 'd2cargiv primary caregiver before dying' 
   D2BEDRID= 'd2bedrid bedridden or nor before dying' 
   D2BEDDAY= 'd2bedday days of being bedridden before dying' 
   D2ILL   = 'd2ill number of times suffering from serious illness' 
   D2DISEA1= 'd2disea1 name of disease suffering from at the first time' 
   D2DIDAY1= 'd2diday1 days suffering from such disease at the first time' 
   D2DISEA2= 'd2disea2 name of disease suffering from at the second time' 
   D2DIDAY2= 'd2diday2 days suffering from such disease at the second time' 
   D2DISEA3= 'd2disea3 name of disease suffering from at the last time' 
   D2DIDAY3= 'd2diday3 days suffering from such disease at the last time' 
   D2HYPERT= 'd2hypert suffering from hypertension before dying?' 
   D2DIABET= 'd2diabet suffering from diabetes before dying?' 
   D2HEART = 'd2heart suffering from heart disease before dying' 
   D2CVD   = 'd2cvd suffering from stroke or cvd before dying?' 
   D2PNEUM = 'd2pneum suffering from bronchitis, emphysema, pneumonia before dying?' 
   D2TUBERC= 'd2tuberc suffering from tuberculosis before dying?' 
   D2GLAUCO= 'd2glauco suffering from glaucoma or cataract before dying?' 
   D2PROSTA= 'd2prosta suffering from prostate tumor before dying?' 
   D2GASTRI= 'd2gastri suffering from gastric or duodenal ulcer before dying?' 
   D2PARKIN= 'd2parkin suffering from parkinson''s disease before dying?' 
   D2BEDSOR= 'd2bedsor suffering from bedsore before dying?' 
   D2DEMENT= 'd2dement suffering from dementia before dying?' 
   D2PSYCHO= 'd2psycho suffering from psychosis before dying?' 
   D2NEUROS= 'd2neuros suffering from neurosis disease?' 
   D2ARTHRI= 'd2arthri suffering from arthritis before dying?' 
   D2OTHERS= 'd2others suffering from other chronic disease before dying?' 
   D2MEDICA= 'd2medica got timely medication before dying' 
   D2FINANC= 'd2financ main financial source before dying' 
   D2INCOME= 'd2income yearly per capita income of the family of the deceased elder' 
   D2WCFACI= 'd2wcfaci family had toilet facility before the elder died' 
   D2TAPWAT= 'd2tapwat family had tap water facility before the elder died' 
   D2BATHFA= 'd2bathfa family had bathing/showering facility before the elder died' 
   D2HEATER= 'd2heater family had heater/heating system before the elder died' 
   D2TVSET = 'd2tvset family had tv before the elder died' 
   D2WASHMA= 'd2washma family had washing machine before elder died' 
   D2PHONE = 'd2phone family had telephone before the elder died' 
   D2DOCTOR= 'd2doctor if the deceased elder was from rural, was there a doctor in the village?' 
   D2LICDOC= 'd2licdoc did the village doctor have a license?' 
   D2WHOPAY= 'd2whopay who mainly paid the medical cost for the deceased elder?' 
   D2MEDCOS= 'd2medcos total medical cost (in yuan, rmb) in the last year of the life' 
   D2BATHFU= 'd2bathfu functioning of bathing before dying' 
   D2BATDAY= 'd2batday days lasted if bathing functioning disabled or partially disabled' 
   D2DRESFU= 'd2dresfu functioning of dressing before dying' 
   D2DREDAY= 'd2dreday days lasted if dressing functioning disabled or partially disabled' 
   D2TOILFU= 'd2toilfu functioning of toileting before dying' 
   D2TOIDAY= 'd2toiday days lasted if toileting functioning disabled or partially disabled' 
   D2MOVEFU= 'd2movefu functioning of indoor transferring before dying' 
   D2MOVDAY= 'd2movday days lasted if indoor transferring functioning disabled or partially disabled' 
   D2CONTFU= 'd2contfu functioning of continence before dying' 
   D2CONDAY= 'd2conday days lasted in incontinence' 
   D2FEEDFU= 'd2feedfu functioning of self-feeding before dying' 
   D2FEEDAY= 'd2feeday days lasted if can''t feed self' 
   D2OUTDOR= 'd2outdor days the elder could not get outdoor to chat before dying' 
   D2ACTDAY= 'd2actday number of days being bedridden longer than that of activities before dying' 
   D2SMOKE = 'd2smoke smoked or not since the last interview' 
   D2SMKTIM= 'd2smktim number of times smoked a day on average' 
   D2DRINK = 'd2drink did the deceased elder drink since the last interview?' 
   D2KNDDRK= 'd2knddrk what kind of drink if the elder drank?' 
   D2DRKMCH= 'd2drkmch how much (liang) did the elder drink every day since last interview?' 
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
   RG13    = 'rg13 with proxy or not for g131' 
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
         A1 a1ffffff. A2 a2ffffff. A41A a41affff.
         A41B a41bffff. A41_14 a41_14ff. A42 a42fffff.
         A42_14 a42fffff. A43_14 a43_14ff. A51 a51fffff.
         A51_0 a51_0fff. A51_11 a51_11ff. A51_14 a51fffff.
         A51_2 a51_2fff. A51_5 a51_5fff. A51_8 a51_8fff.
         A52 a52fffff. A52_0 a52_0fff. A52_11 a52_11ff.
         A52_14 a52fffff. A52_2 a52_2fff. A52_5 a52_5fff.
         A52_8 a52_8fff. A530_11 a530_11f. A530_14 a530_14f.
         A530_5 a530_5ff. A530_8 a530_8ff. A531_11 a531_11f.
         A531_14 a531_14f. A531_2 a531_2ff. A531_5 a531_5ff.
         A531_8 a531_8ff. A532_11 a532_11f. A532_14 a532_14f.
         A532_2 a532_2ff. A532_5 a532_5ff. A532_8 a532_8ff.
         A533_11 a533_11f. A533_14 a533_14f. A534_11 a534_11f.
         A534_14 a534_14f. A535_11 a535_11f. A535_14 a535_14f.
         A536_11 a535_11f. A536_14 a535_14f. A537_11 a537_11f.
         A537_14 a537_14f. A53A1 a53a1fff. A53A1_0 a53a1_0f.
         A53A1_11 a53a1_1f. A53A1_14 a53a1fff. A53A1_2 a53a1_2f.
         A53A1_5 a53a1_5f. A53A1_8 a53a1_8f. A53A2 a53a2fff.
         A53A2_0 a53a2_0f. A53A2_11 a53a2_1f. A53A2_14 a53a2fff.
         A53A2_2 a53a2_2f. A53A2_5 a53a2_5f. A53A2_8 a53a2_8f.
         A53A3 a53a3fff. A53A3_0 a53a3_0f. A53A3_11 a53a3_1f.
         A53A3_14 a53a3fff. A53A3_2 a53a3_2f. A53A3_5 a53a3_5f.
         A53A3_8 a53a3_8f. A53A4_11 a53a4_1f. A53A4_14 a53a4_1_1f.
         A53A4_5 a53a4_5f. A53A4_8 a53a4_8f. A53A5_11 a53a5_1f.
         A53A5_14 a54bffff. A53B1 a53a1fff. A53B1_0 a53a1_0f.
         A53B1_11 a53a1_1f. A53B1_14 a53a1fff. A53B1_2 a53a1_2f.
         A53B1_5 a53a1_5f. A53B1_8 a53a1_8f. A53B2 a53a2fff.
         A53B2_0 a53a2_0f. A53B2_11 a53a2_1f. A53B2_14 a53a2fff.
         A53B2_2 a53a2_2f. A53B2_5 a53a2_5f. A53B2_8 a53a2_8f.
         A53B3 a53a3fff. A53B3_0 a53a3_0f. A53B3_11 a53b3_1f.
         A53B3_14 a53a3fff. A53B3_2 a53a3_2f. A53B3_5 a53a3_5f.
         A53B3_8 a53b3_8f. A53B4_11 a53a4_1f. A53B4_14 a53a4_1_1f.
         A53B4_5 a53a4_5f. A53B4_8 a53a4_8f. A53B5_11 a53a5_1f.
         A53B5_14 a54bffff. A53C1 a53a1fff. A53C1_0 a53a1_0f.
         A53C1_11 a53a1_1f. A53C1_14 a53a1fff. A53C1_2 a53a1_2f.
         A53C1_5 a53a1_5f. A53C1_8 a53a1_8f. A53C2 a53a2fff.
         A53C2_0 a53a2_0f. A53C2_11 a53a2_1f. A53C2_14 a53a2fff.
         A53C2_2 a53a2_2f. A53C2_5 a53a2_5f. A53C2_8 a53a2_8f.
         A53C3 a53a3fff. A53C3_0 a53a3_0f. A53C3_11 a53b3_1f.
         A53C3_14 a53a3fff. A53C3_2 a53a3_2f. A53C3_5 a53a3_5f.
         A53C3_8 a53b3_8f. A53C4_11 a53a4_1f. A53C4_14 a53a4_1_1f.
         A53C4_5 a53a4_5f. A53C4_8 a53a4_8f. A53C5_11 a53a5_1f.
         A53C5_14 a54bffff. A53D1 a53a1fff. A53D1_0 a53a1_0f.
         A53D1_11 a53a1_1f. A53D1_14 a53a1fff. A53D1_2 a53a1_2f.
         A53D1_5 a53a1_5f. A53D1_8 a53a1_8f. A53D2 a53a2fff.
         A53D2_0 a53a2_0f. A53D2_11 a53a2_1f. A53D2_14 a53a2fff.
         A53D2_2 a53a2_2f. A53D2_5 a53a2_5f. A53D2_8 a53a2_8f.
         A53D3 a53a3fff. A53D3_0 a53a3_0f. A53D3_11 a53b3_1f.
         A53D3_14 a53a3fff. A53D3_2 a53a3_2f. A53D3_5 a53a3_5f.
         A53D3_8 a53b3_8f. A53D4_11 a53a4_1f. A53D4_14 a53a4_1_1f.
         A53D4_5 a53a4_5f. A53D4_8 a53a4_8f. A53D5_11 a53a5_1f.
         A53D5_14 a54bffff. A53E1 a53a1fff. A53E1_0 a53a1_0f.
         A53E1_11 a53a1_1f. A53E1_14 a53a1fff. A53E1_2 a53a1_2f.
         A53E1_5 a53a1_5f. A53E1_8 a53a1_8f. A53E2 a53a2fff.
         A53E2_0 a53a2_0f. A53E2_11 a53a2_1f. A53E2_14 a53a2fff.
         A53E2_2 a53a2_2f. A53E2_5 a53a2_5f. A53E2_8 a53a2_8f.
         A53E3 a53a3fff. A53E3_0 a53a3_0f. A53E3_11 a53b3_1f.
         A53E3_14 a53a3fff. A53E3_2 a53a3_2f. A53E3_5 a53a3_5f.
         A53E3_8 a53b3_8f. A53E4_11 a53a4_1f. A53E4_14 a53a4_1_1f.
         A53E4_5 a53a4_5f. A53E4_8 a53a4_8f. A53E5_11 a53a5_1f.
         A53E5_14 a54bffff. A53F1 a53a1fff. A53F1_0 a53a1_0f.
         A53F1_11 a53a1_1f. A53F1_14 a53a1fff. A53F1_2 a53a1_2f.
         A53F1_5 a53a1_5f. A53F1_8 a53a1_8f. A53F2 a53a2fff.
         A53F2_0 a53a2_0f. A53F2_11 a53a2_1f. A53F2_14 a53a2fff.
         A53F2_2 a53a2_2f. A53F2_5 a53a2_5f. A53F2_8 a53a2_8f.
         A53F3 a53a3fff. A53F3_0 a53a3_0f. A53F3_11 a53b3_1f.
         A53F3_14 a53a3fff. A53F3_2 a53a3_2f. A53F3_5 a53a3_5f.
         A53F3_8 a53b3_8f. A53F4_11 a53a4_1f. A53F4_14 a53a4_1_1f.
         A53F4_5 a53a4_5f. A53F4_8 a53a4_8f. A53F5_11 a53a5_1f.
         A53F5_14 a54bffff. A53G1 a53a1fff. A53G1_0 a53a1_0f.
         A53G1_11 a53a1_1f. A53G1_14 a53a1fff. A53G1_2 a53a1_2f.
         A53G1_5 a53a1_5f. A53G1_8 a53a1_8f. A53G2 a53a2fff.
         A53G2_0 a53a2_0f. A53G2_11 a53a2_1f. A53G2_14 a53a2fff.
         A53G2_2 a53a2_2f. A53G2_5 a53a2_5f. A53G2_8 a53a2_8f.
         A53G3 a53a3fff. A53G3_0 a53a3_0f. A53G3_11 a53b3_1f.
         A53G3_14 a53a3fff. A53G3_2 a53a3_2f. A53G3_5 a53a3_5f.
         A53G3_8 a53b3_8f. A53G4_11 a53a4_1f. A53G4_14 a53a4_1_1f.
         A53G4_5 a53a4_5f. A53G4_8 a53a4_8f. A53G5_11 a53a5_1f.
         A53G5_14 a54bffff. A53H1 a53a1fff. A53H1_0 a53a1_0f.
         A53H1_11 a53a1_1f. A53H1_14 a53a1fff. A53H1_2 a53a1_2f.
         A53H1_5 a53a1_5f. A53H1_8 a53a1_8f. A53H2 a53a2fff.
         A53H2_0 a53a2_0f. A53H2_11 a53a2_1f. A53H2_14 a53a2fff.
         A53H2_2 a53a2_2f. A53H2_5 a53a2_5f. A53H2_8 a53a2_8f.
         A53H3 a53a3fff. A53H3_0 a53a3_0f. A53H3_11 a53b3_1f.
         A53H3_14 a53a3fff. A53H3_2 a53a3_2f. A53H3_5 a53a3_5f.
         A53H3_8 a53b3_8f. A53H4_11 a53a4_1f. A53H4_14 a53a4_1_1f.
         A53H4_5 a53a4_5f. A53H4_8 a53a4_8f. A53H5_11 a53a5_1f.
         A53H5_14 a54bffff. A53I1 a53a1fff. A53I1_0 a53a1_0f.
         A53I1_11 a53a1_1f. A53I1_14 a53a1fff. A53I1_2 a53a1_2f.
         A53I1_5 a53a1_5f. A53I1_8 a53a1_8f. A53I2 a53a2fff.
         A53I2_0 a53a2_0f. A53I2_11 a53a2_1f. A53I2_14 a53a2fff.
         A53I2_2 a53a2_2f. A53I2_5 a53a2_5f. A53I2_8 a53a2_8f.
         A53I3 a53a3fff. A53I3_0 a53a3_0f. A53I3_11 a53b3_1f.
         A53I3_14 a53a3fff. A53I3_2 a53a3_2f. A53I3_5 a53a3_5f.
         A53I3_8 a53b3_8f. A53I4_11 a53a4_1f. A53I4_14 a53a4_1_1f.
         A53I4_5 a53a4_5f. A53I4_8 a53a4_8f. A53I5_11 a53a5_1f.
         A53I5_14 a54bffff. A53J1 a53a1fff. A53J1_0 a53a1_0f.
         A53J1_11 a53a1_1f. A53J1_14 a53a1fff. A53J1_2 a53a1_2f.
         A53J1_5 a53a1_5f. A53J1_8 a53a1_8f. A53J2 a53a2fff.
         A53J2_0 a53a2_0f. A53J2_11 a53a2_1f. A53J2_14 a53a2fff.
         A53J2_2 a53a2_2f. A53J2_5 a53a2_5f. A53J2_8 a53a2_8f.
         A53J3 a53a3fff. A53J3_0 a53a3_0f. A53J3_11 a53b3_1f.
         A53J3_14 a53a3fff. A53J3_2 a53a3_2f. A53J3_5 a53a3_5f.
         A53J3_8 a53b3_8f. A53J4_11 a53a4_1f. A53J4_14 a53a4_1_1f.
         A53J4_5 a53a4_5f. A53J4_8 a53a4_8f. A53J5_11 a53a5_1f.
         A53J5_14 a54bffff. A53K1 a53a1fff. A53K1_0 a53a1_0f.
         A53K1_2 a53a1_2f. A53K1_5 a53a1_5f. A53K1_8 a53a1_8f.
         A53K2 a53a2fff. A53K2_0 a53a2_0f. A53K2_2 a53a2_2f.
         A53K2_5 a53a2_5f. A53K2_8 a53a2_8f. A53K3 a53a3fff.
         A53K3_0 a53a3_0f. A53K3_2 a53a3_2f. A53K3_5 a53a3_5f.
         A53K3_8 a53b3_8f. A53K4_5 a53a4_5f. A53K4_8 a53a4_8f.
         A53L1 a53a1fff. A53L1_0 a53a1_0f. A53L1_2 a53a1_2f.
         A53L1_5 a53a1_5f. A53L1_8 a53a1_8f. A53L2 a53a2fff.
         A53L2_0 a53a2_0f. A53L2_2 a53a2_2f. A53L2_5 a53a2_5f.
         A53L2_8 a53a2_8f. A53L3 a53a3fff. A53L3_0 a53a3_0f.
         A53L3_2 a53a3_2f. A53L3_5 a53a3_5f. A53L3_8 a53b3_8f.
         A53L4_5 a53a4_5f. A53L4_8 a53a4_8f. A540_11 a540_11f.
         A540_14 a540_14f. A540_5 a540_5ff. A541_11 a541_11f.
         A541_14 a541_14f. A541_5 a541_5ff. A541_8 a541_8ff.
         A542_11 a542_11f. A542_14 a542_14f. A542_5 a542_5ff.
         A542_8 a542_8ff. A54A a54affff. A54A_0 a54a_0ff.
         A54A_11 a54a_11f. A54A_14 a54affff. A54A_2 a54a_2ff.
         A54A_5 a54a_5ff. A54A_8 a54a_8ff. A54B a54bffff.
         A54B_0 a54b_0ff. A54B_11 a54b_11f. A54B_14 a54bffff.
         A54B_2 a54b_2ff. A54B_5 a54b_5ff. A54B_8 a54b_8ff.
         B11 b11fffff. B11_0 b11_0fff. B11_11 b11_11ff.
         B11_14 b11fffff. B11_2 b11_2fff. B11_5 b11_5fff.
         B11_8 b11_8fff. B12 b11fffff. B121_11 b121_11f.
         B121_14 b121_14f. B121_2 b121_2ff. B121_5 b121_5ff.
         B121_8 b121_8ff. B12_0 b11_0fff. B12_11 b11_11ff.
         B12_14 b11fffff. B12_2 b12_2fff. B12_5 b11_5fff.
         B12_8 b11_8fff. B21 b21fffff. B210_11 b210_11f.
         B210_14 b210_14f. B21_0 b21_0fff. B21_11 b21_11ff.
         B21_14 b21fffff. B21_2 b21_2fff. B21_5 b21_5fff.
         B21_8 b21_8fff. B22 b21fffff. B22_0 b21_0fff.
         B22_11 b21_11ff. B22_14 b21fffff. B22_2 b21_2fff.
         B22_5 b21_5fff. B22_8 b21_8fff. B23 b21fffff.
         B23_0 b21_0fff. B23_11 b21_11ff. B23_14 b21fffff.
         B23_2 b21_2fff. B23_5 b21_5fff. B23_8 b21_8fff.
         B24 b21fffff. B24_0 b21_0fff. B24_11 b21_11ff.
         B24_14 b21fffff. B24_2 b21_2fff. B24_5 b21_5fff.
         B24_8 b21_8fff. B25 b21fffff. B25_0 b21_0fff.
         B25_11 b21_11ff. B25_14 b21fffff. B25_2 b21_2fff.
         B25_5 b21_5fff. B25_8 b21_8fff. B26 b21fffff.
         B26_0 b21_0fff. B26_11 b21_11ff. B26_14 b21fffff.
         B26_2 b21_2fff. B26_5 b21_5fff. B26_8 b21_8fff.
         B27 b21fffff. B27_0 b21_0fff. B27_11 b21_11ff.
         B27_14 b21fffff. B27_2 b21_2fff. B27_5 b21_5fff.
         B27_8 b21_8fff. B28_11 b28_11ff. B28_14 b28_14ff.
         B29_11 b28_11ff. B29_14 b28_14ff. C11 c11fffff.
         C11_0 c11_0fff. C11_11 c11_11ff. C11_14 c11fffff.
         C11_2 c11_2fff. C11_5 c11_5fff. C11_8 c11_8fff.
         C12 c11fffff. C12_0 c11_0fff. C12_11 c11_11ff.
         C12_14 c11fffff. C12_2 c11_2fff. C12_5 c11_5fff.
         C12_8 c11_8fff. C13 c11fffff. C131_2 c11_2fff.
         C13_0 c11_0fff. C13_11 c11_11ff. C13_14 c11fffff.
         C13_2 c11_2fff. C13_5 c11_5fff. C13_8 c11_8fff.
         C14 c11fffff. C14_0 c11_0fff. C14_11 c11_11ff.
         C14_14 c11fffff. C14_2 c11_2fff. C14_5 c11_5fff.
         C14_8 c11_8fff. C15 c11fffff. C15_0 c11_0fff.
         C15_11 c11_11ff. C15_14 c11fffff. C15_2 c11_2fff.
         C15_5 c11_5fff. C15_8 c11_8fff. C16 c16fffff.
         C161_2 c11_2fff. C162_2 c11_2fff. C163_2 c11_2fff.
         C16_0 c16_0fff. C16_11 c16_11ff. C16_14 c16fffff.
         C16_2 c16_2fff. C16_5 c16_5fff. C16_8 c16_8fff.
         C21A c11fffff. C21A_0 c11_0fff. C21A_11 c11_11ff.
         C21A_14 c11fffff. C21A_2 c11_2fff. C21A_5 c11_5fff.
         C21A_8 c11_8fff. C21B c11fffff. C21B_0 c11_0fff.
         C21B_11 c11_11ff. C21B_14 c11fffff. C21B_2 c11_2fff.
         C21B_5 c11_5fff. C21B_8 c11_8fff. C21C c11fffff.
         C21C_0 c11_0fff. C21C_11 c11_11ff. C21C_14 c11fffff.
         C21C_2 c11_2fff. C21C_5 c11_5fff. C21C_8 c11_8fff.
         C22 c22fffff. C22_0 c22_0fff. C22_11 c22_11ff.
         C22_14 c22fffff. C22_2 c22_2fff. C22_5 c22_5fff.
         C22_8 c22_8fff. C31A c11fffff. C31A_0 c11_0fff.
         C31A_11 c11_11ff. C31A_14 c11fffff. C31A_2 c11_2fff.
         C31A_5 c11_5fff. C31A_8 c11_8fff. C31B c11fffff.
         C31B_0 c11_0fff. C31B_11 c11_11ff. C31B_14 c11fffff.
         C31B_2 c11_2fff. C31B_5 c11_5fff. C31B_8 c11_8fff.
         C31C c11fffff. C31C_0 c11_0fff. C31C_11 c11_11ff.
         C31C_14 c11fffff. C31C_2 c11_2fff. C31C_5 c11_5fff.
         C31C_8 c11_8fff. C31D c11fffff. C31D_0 c11_0fff.
         C31D_11 c31d_11f. C31D_14 c11fffff. C31D_2 c11_2fff.
         C31D_5 c11_5fff. C31D_8 c31d_8ff. C31E c11fffff.
         C31E_0 c11_0fff. C31E_11 c11_11ff. C31E_14 c11fffff.
         C31E_2 c11_2fff. C31E_5 c11_5fff. C31E_8 c11_8fff.
         C32 c32fffff. C32_0 c11_0fff. C32_11 c32_11ff.
         C32_14 c32fffff. C32_2 c11_2fff. C32_5 c11_5fff.
         C32_8 c32_8fff. C41A c11fffff. C41A_0 c11_0fff.
         C41A_11 c11_11ff. C41A_14 c11fffff. C41A_2 c11_2fff.
         C41A_5 c11_5fff. C41A_8 c11_8fff. C41B c11fffff.
         C41B_0 c11_0fff. C41B_11 c11_11ff. C41B_14 c11fffff.
         C41B_2 c11_2fff. C41B_5 c11_5fff. C41B_8 c11_8fff.
         C41C c11fffff. C41C_0 c11_0fff. C41C_11 c11_11ff.
         C41C_14 c11fffff. C41C_2 c11_2fff. C41C_5 c11_5fff.
         C41C_8 c11_8fff. C51A c11fffff. C51A_0 c11_0fff.
         C51A_11 c11_11ff. C51A_14 c11fffff. C51A_2 c11_2fff.
         C51A_5 c11_5fff. C51A_8 c11_8fff. C51B c11fffff.
         C51B_0 c11_0fff. C51B_11 c11_11ff. C51B_14 c11fffff.
         C51B_2 c11_2fff. C51B_5 c11_5fff. C51B_8 c11_8fff.
         C52 c11fffff. C521_2 c521_2ff. C52X1_11 c11_11ff.
         C52X1_8 c11_8fff. C52X2_11 c11_11ff. C52X2_8 c11_8fff.
         C52_0 c11_0fff. C52_11 c11_11ff. C52_14 c11fffff.
         C52_2 c11_2fff. C52_5 c11_5fff. C52_8 c11_8fff.
         C53A c53affff. C53A_0 c11_0fff. C53A_11 c53a_11f.
         C53A_14 c53affff. C53A_2 c11_2fff. C53A_5 c11_5fff.
         C53A_8 c53a_8ff. C53B c53affff. C53B_0 c11_0fff.
         C53B_11 c53a_11f. C53B_14 c53affff. C53B_2 c11_2fff.
         C53B_5 c11_5fff. C53B_8 c53a_8ff. C53C c53affff.
         C53C_0 c11_0fff. C53C_11 c53a_11f. C53C_14 c53affff.
         C53C_2 c11_2fff. C53C_5 c11_5fff. C53C_8 c53a_8ff.
         C54 c54fffff. C54_0 c54_0fff. C54_11 c54_11ff.
         C54_14 c54fffff. C54_2 c54_2fff. C54_5 c54_5fff.
         C54_8 c54_8fff. C55 c55fffff. C55_0 c55_0fff.
         C55_11 c55_11ff. C55_14 c55fffff. C55_2 c55_2fff.
         C55_5 c55_5fff. C55_8 c55_8fff. D0ACTDAY d0actdaf.
         D0ARTHRI d0hyperf. D0BATHFA d0wcfacf. D0BATHFU d0bathff.
         D0BEDDAY d0beddaf. D0BEDRID d0bedrif. D0BEDSOR d0hyperf.
         D0B_AGE1 d0b_agef. D0B_AGE2 d0b_agef. D0CARGIV d0cargif.
         D0CAUSE d0causef. D0CONTFU d0contff. D0CVD d0hyperf.
         D0C_AGE1 d0b_agef. D0C_AGE2 d0b_agef. D0DEMENT d0hyperf.
         D0DIABET d0hyperf. D0DIDAY1 d0didayf. D0DIDAY2 d0didayf.
         D0DIDAY3 d0didayf. D0DISEA1 d0diseaf. D0DISEA2 d0diseaf.
         D0DISEA3 d0diseaf. D0DOCTOR d0doctof. D0DPLACE d0dplacf.
         D0DRESFU d0bathff. D0DRINK d0bedrif. D0DRKMCH d0smktif.
         D0D_AGE1 d0b_agef. D0D_AGE2 d0b_agef. D0FEEDFU d0feedff.
         D0FINANC d0finanf. D0F_AGE1 d0b_agef. D0F_AGE2 d0b_agef.
         D0GASTRI d0hyperf. D0GLAUCO d0hyperf. D0HEART d0hyperf.
         D0HEATER d0wcfacf. D0HYPERT d0hyperf. D0ILL d0illfff.
         D0INCOME d0incomf. D0KNDDRK d0knddrf. D0LICDOC d0licdof.
         D0LIVARR d0livarf. D0MARRY d0marryf. D0MEDCOS d0incomf.
         D0MEDICA d0medicf. D0MOVEFU d0moveff. D0M_AGE1 d0b_agef.
         D0M_AGE2 d0b_agef. D0NEUROS d0hyperf. D0OTHERS d0otherf.
         D0OUTDOR d0outdof. D0PARKIN d0hyperf. D0PERSON d0persof.
         D0PHONE d0wcfacf. D0PNEUM d0hyperf. D0PROSTA d0hyperf.
         D0PROVID d0provif. D0PSYCHO d0hyperf. D0RESID d0residf.
         D0RESPON d0respof. D0SEX d0sexfff. D0SMKTIM d0smktif.
         D0SMOKE d0bedrif. D0TAPWAT d0wcfacf. D0TOILFU d0toilff.
         D0TUBERC d0hyperf. D0TVSET d0wcfacf. D0T_AGE1 d0b_agef.
         D0T_AGE2 d0b_agef. D0UNFINI d0unfinf. D0VDAGE d0vdagef.
         D0VDAY d0persof. D0VMONTH d0persof. D0VYEAR d0vyearf.
         D0WASHMA d0wcfacf. D0WCFACI d0wcfacf. D0WHOPAY d0whopaf.
         D1 d1ffffff. D101_11 d91_11ff. D101_14 f71fffff.
         D101_5 d71_5fff. D101_8 d91_8fff. D102_11 a53a2_1f.
         D102_14 a53a2fff. D102_5 a53a2_5f. D102_8 a53a2_8f.
         D103_11 a53a2_1f. D103_14 a53a2fff. D103_5 a53a2_5f.
         D103_8 a53a2_8f. D10A d10affff. D10B d10affff.
         D10C d10affff. D10D d10affff. D10E d10affff.
         D10F d10affff. D10G d10affff. D10H d10affff.
         D11A533 d11a533f. D11A534 d11retyf. D11A535 d11a535f.
         D11A536 d11a535f. D11A537 d11a537f. D11A53A1 d11a53af.
         D11A53A3 d11a53a_1f. D11A53A4 d11a53a_2f. D11A53A5 d11a53a_3f.
         D11A53A6 d11a53a_4f. D11A53B1 d11a53af. D11A53B3 d11a53a_1f.
         D11A53B4 d11a53a_2f. D11A53B5 d11a53a_3f. D11A53B6 d11a53a_4f.
         D11A53C1 d11a53af. D11A53C3 d11a53a_1f. D11A53C4 d11a53a_2f.
         D11A53C5 d11a53a_3f. D11A53C6 d11a53a_4f. D11A53D1 d11a53af.
         D11A53D3 d11a53a_1f. D11A53D4 d11a53a_2f. D11A53D5 d11a53a_3f.
         D11A53D6 d11a53a_4f. D11A53E1 d11a53af. D11A53E3 d11a53a_1f.
         D11A53E4 d11a53a_2f. D11A53E5 d11a53a_3f. D11A53E6 d11a53a_4f.
         D11A53F1 d11a53af. D11A53F3 d11a53a_1f. D11A53F4 d11a53a_2f.
         D11A53F5 d11a53a_3f. D11A53F6 d11a53a_4f. D11A53G1 d11a53af.
         D11A53G3 d11a53a_1f. D11A53G4 d11a53a_2f. D11A53G5 d11a53a_3f.
         D11A53G6 d11a53a_4f. D11A53H1 d11a53af. D11A53H3 d11a53a_1f.
         D11A53H4 d11a53a_2f. D11A53H5 d11a53a_3f. D11A53H6 d11a53a_4f.
         D11A53I1 d11a53af. D11A53I3 d11a53a_1f. D11A53I4 d11a53a_2f.
         D11A53I5 d11a53a_3f. D11A53I6 d11a53a_4f. D11A53J1 d11a53af.
         D11A53J3 d11a53a_1f. D11A53J4 d11a53a_2f. D11A53J5 d11a53a_3f.
         D11A53J6 d11a53a_4f. D11ACTDAY d11beddf. D11ADVDIR d11doctf.
         D11AGE d11vyeaf. D11ARTHRI d11hypef. D11A_0 d11a_0ff.
         D11A_11 d11a_11f. D11A_14 d11a_14f. D11A_2 d11a_2ff.
         D11A_5 d11a_5ff. D11A_8 d11a_8ff. D11BATDAY d11beddf.
         D11BATDAY1 d11beddf. D11BATDAY2 d11batdf. D11BATHFA d11wcfaf.
         D11BATHFU d11bathf. D11BEDDAY d11beddf. D11BEDRID d11bedrf.
         D11BEDSOR d11hypef. D11B_0 d11a_0ff. D11B_11 d11a_11f.
         D11B_14 d11a_14f. D11B_2 d11a_2ff. D11B_5 d11a_5ff.
         D11B_8 d11a_8ff. D11CANCER d11hypef. D11CARCST d11medcf.
         D11CARGIV d11cargf. D11CARPAY d11carpf. D11CONDAY d11beddf.
         D11CONDAY1 d11batdf. D11CONDAY2 d11batdf. D11CONTFU d11contf.
         D11CVD d11hypef. D11C_0 d11a_0ff. D11C_11 d11a_11f.
         D11C_14 d11c_14f. D11C_2 d11a_2ff. D11C_5 d11a_5ff.
         D11C_8 d11a_8ff. D11D21B d11d21bf. D11DEMENT d11hypef.
         D11DIABET d11hypef. D11DIDAY1 d11didaf. D11DIDAY2 d11didaf.
         D11DIDAY3 d11didaf. D11DIRCST d11medcf. D11DIRDAY d11retyf.
         D11DISEA1 d11disef. D11DISEA2 d11disef. D11DISEA3 d11disef.
         D11DOCTOR d11doctf. D11DPLACE d11dplaf. D11DREAM d11dreaf.
         D11DREDAY d11beddf. D11DREDAY1 d11batdf. D11DREDAY2 d11batdf.
         D11DRESFU d11bathf. D11DRINK d11doctf. D11DRKMCH d11a53a_4f.
         D11D_0 d11a_0ff. D11D_11 d11a_11f. D11D_14 d11a_14f.
         D11D_2 d11a_2ff. D11D_5 d11a_5ff. D11D_8 d11a_8ff.
         D11E_0 d11a_0ff. D11E_11 d11a_11f. D11E_14 d11a_14f.
         D11E_2 d11a_2ff. D11E_5 d11a_5ff. D11E_8 d11a_8ff.
         D11FEEDAY d11beddf. D11FEEDAY1 d11batdf. D11FEEDAY2 d11batdf.
         D11FEEDFU d11bathf. D11FINANC d11finaf. D11FULLDA d11beddf.
         D11F_0 d11a_0ff. D11F_11 d11a_11f. D11F_14 d11c_14f.
         D11F_2 d11a_2ff. D11F_5 d11a_5ff. D11F_8 d11a_8ff.
         D11G102 d11g102f. D11G106 d11a535f. D11G1061 d11g106f.
         D11G1062 d11g106_1f. D11G1063 d11g106_2f. D11G23 d11g23ff.
         D11G24 d11a535f. D11G24A d11illff. D11G25 d11a535f.
         D11G25A d11illff. D11G4 d11g4fff. D11G4A d11g4aff.
         D11G4B d11g4bff. D11GASTRI d11hypef. D11GENER d11genef.
         D11GLAUCO d11hypef. D11GYNECO d11hypef. D11G_0 d11a_0ff.
         D11G_11 d11a_11f. D11G_14 d11a_14f. D11G_2 d11a_2ff.
         D11G_5 d11a_5ff. D11G_8 d11a_8ff. D11HEART d11hypef.
         D11HEATER d11wcfaf. D11HYPERT d11hypef. D11H_0 d11a_0ff.
         D11H_11 d11a_11f. D11H_14 d11c_14f. D11H_2 d11a_2ff.
         D11H_5 d11a_5ff. D11H_8 d11a_8ff. D11ILL d11illff.
         D11INCOME d11incof. D11INSPEN d11inspf. D11INSUR d11insuf.
         D11I_2 d11a_2ff. D11KNDDRK d11knddf. D11LICDOC d11licdf.
         D11LIVARR d11livaf. D11MARRY d11marrf. D11MARRY1 d11marr_1f.
         D11MEDCOS d11medcf. D11MEDICA d11medif. D11MON1 d11yr1ff.
         D11MOVDAY d11beddf. D11MOVDAY1 d11batdf. D11MOVDAY2 d11batdf.
         D11MOVEFU d11bathf. D11NEUROS d11hypef. D11NOINSU d11noinf.
         D11OTHERS d11hypef. D11OUTDOR d11beddf. D11PAIN d11painf.
         D11PARKIN d11hypef. D11PAYGOV d11payif. D11PAYIND d11payif.
         D11PCGDAY d11vyeaf. D11PERSON d11vdayf. D11PHONE d11wcfaf.
         D11PNEUM d11hypef. D11POCKET d11medcf. D11PROSTA d11hypef.
         D11PSYCHO d11hypef. D11RESID d11resif. D11RETIRE d11retif.
         D11RETPEN d11retpf. D11RETYR d11retyf. D11SMKTIM d11a53a_4f.
         D11SMOKE d11doctf. D11TAPWAT d11wcfaf. D11TOIDAY d11beddf.
         D11TOIDAY1 d11batdf. D11TOIDAY2 d11batdf. D11TOILFU d11bathf.
         D11TUBERC d11hypef. D11TVSET d11wcfaf. D11UNCDAY d11retyf.
         D11UNCONS d11doctf. D11VDAY d11vdayf. D11VMONTH d11vyeaf.
         D11VYEAR d11vyeaf. D11WASHMA d11wcfaf. D11WCFACI d11wcfaf.
         D11WHOPAY d11whopf. D11YR1 d11yr1ff. D12_11 a54b_11f.
         D12_14 a41bffff. D12_2 d12_2fff. D12_5 d12_5fff.
         D12_8 a54b_8ff. D14A533 d14a533f. D14A535 d14a535f.
         D14A536 d14a535f. D14A537 d14a537f. D14ADVDIR d14doctf.
         D14AGE d14vyeaf. D14ARTHRI d14hypef. D14BATHFA d14wcfaf.
         D14BATHFU d14bathf. D14BEDRID d14bedrf. D14BEDSOR d14hypef.
         D14CANCER d14hypef. D14CARGIV d14cargf. D14CARPAY d14carpf.
         D14CONTFU d14contf. D14CVD d14hypef. D14D21B d14d21bf.
         D14D22 d14marr_1f. D14D26A1 d14d26af. D14D26A2 d14d26a_1f.
         D14D26A6 d14d26a_2f. D14D26B1 d14d26af. D14D26B2 d14d26a_1f.
         D14D26B6 d14d26a_2f. D14D26C1 d14d26af. D14D26C2 d14d26a_1f.
         D14D26C6 d14d26a_2f. D14D26D1 d14d26af. D14D26D2 d14d26a_1f.
         D14D26D6 d14d26a_2f. D14D26E1 d14d26af. D14D26E2 d14d26a_1f.
         D14D26E6 d14d26a_2f. D14D26F1 d14d26af. D14D26F2 d14d26a_1f.
         D14D26F6 d14d26a_2f. D14D26G1 d14d26af. D14D26G2 d14d26a_1f.
         D14D26G6 d14d26a_2f. D14D26H1 d14d26af. D14D26H2 d14d26a_1f.
         D14D26H6 d14d26a_2f. D14D26I1 d14d26af. D14D26I2 d14d26a_1f.
         D14D26I6 d14d26a_2f. D14D26J1 d14d26af. D14D26J2 d14d26a_1f.
         D14D26J6 d14d26a_2f. D14D45 d14g106f. D14DEMENT d14hypef.
         D14DIABET d14hypef. D14DIRDAY d14dirdf. D14DOCTOR d14doctf.
         D14DPLACE d14dplaf. D14DREAM d14dreaf. D14DRESFU d14dresf.
         D14DRINK d14doctf. D14FEEDFU d14dresf. D14G102 d14g102f.
         D14G106 d14g106f. D14G1061 d14g106_1f. D14G1062 d14g106_2f.
         D14G1063 d14g106_3f. D14G24 d14a535f. D14G24A d14illff.
         D14G25 d14a535f. D14G25A d14illff. D14G4 d14g4fff.
         D14G4A d14g4aff. D14G4B d14g4bff. D14GASTRI d14hypef.
         D14GENER d14genef. D14GLAUCO d14hypef. D14GYNECO d14hypef.
         D14HEART d14hypef. D14HEATER d14wcfaf. D14HYPERT d14hypef.
         D14ILL d14illff. D14KNDDRK d14knddf. D14LICDOC d14licdf.
         D14LIVARR d14livaf. D14MARRY d14marrf. D14MARRY1 d14marr_1f.
         D14MOVEFU d14bathf. D14NEUROS d14hypef. D14OTHERS d14hypef.
         D14OUTDOR d14outdf. D14PAIN d14painf. D14PARKIN d14hypef.
         D14PERSON d14vdayf. D14PHONE d14tapwf. D14PNEUM d14hypef.
         D14PROSTA d14hypef. D14PSYCHO d14hypef. D14SMKTIM d14d26a_2f.
         D14SMOKE d14smokf. D14TAPWAT d14tapwf. D14TOILFU d14dresf.
         D14TUBERC d14hypef. D14TVSET d14tapwf. D14UNCONS d14doctf.
         D14VDAY d14vdayf. D14VMONTH d14vyeaf. D14VYEAR d14vyeaf.
         D14WASHMA d14tapwf. D14WCFACI d14wcfaf. D1_0 d1_0ffff.
         D1_11 d1_11fff. D1_14 d1ffffff. D1_2 d1_2ffff.
         D1_5 d1_5ffff. D1_8 d1_8ffff. D2 a41bffff.
         D2ACTDAY d2actdaf. D2ARTHRI d2hyperf. D2BATDAY d2batdaf.
         D2BATHFA d2wcfacf. D2BATHFU d2bathff. D2BEDDAY d2beddaf.
         D2BEDRID d2bedrif. D2BEDSOR d2hyperf. D2CARGIV d2cargif.
         D2CAUSE d2causef. D2CONDAY d2batdaf. D2CONTFU d2bathff.
         D2CVD d2hyperf. D2DAYIN d2vmontf. D2DEMENT d2hyperf.
         D2DIABET d2hyperf. D2DIDAY1 d2didayf. D2DIDAY2 d2didayf.
         D2DIDAY3 d2didayf. D2DISEA1 d2diseaf. D2DISEA2 d2diseaf.
         D2DISEA3 d2diseaf. D2DOCTOR d2doctof. D2DPLACE d2dplacf.
         D2DREDAY d2batdaf. D2DRESFU d2bathff. D2DRINK d2bedrif.
         D2DRKMCH d2persof. D2FEEDAY d2batdaf. D2FEEDFU d2bathff.
         D2FINANC d2finanf. D2GASTRI d2hyperf. D2GENER d2generf.
         D2GLAUCO d2hyperf. D2HEART d2hyperf. D2HEATER d2wcfacf.
         D2HYPERT d2hyperf. D2ILL d2illfff. D2INCOME d2incomf.
         D2KNDDRK d2knddrf. D2LICDOC d2licdof. D2LIVARR d2livarf.
         D2MARRY d2marryf. D2MEDCOS d2incomf. D2MEDICA d2medicf.
         D2MOVDAY d2batdaf. D2MOVEFU d2bathff. D2MTHIN d2vmontf.
         D2NEUROS d2hyperf. D2OTHERS d2hyperf. D2OUTDOR d2outdof.
         D2PARKIN d2hyperf. D2PERSON d2persof. D2PHONE d2wcfacf.
         D2PNEUM d2hyperf. D2PROSTA d2hyperf. D2PROVIN d2provif.
         D2PSYCHO d2hyperf. D2RESID d2residf. D2RESPON d2respof.
         D2SEX d2sexfff. D2SMKTIM d2persof. D2SMOKE d2bedrif.
         D2TAPWAT d2wcfacf. D2TOIDAY d2batdaf. D2TOILFU d2bathff.
         D2TUBERC d2hyperf. D2TVSET d2wcfacf. D2VAGE d2vageff.
         D2VDAY d2vmontf. D2VMONTH d2vmontf. D2VYEAR d2vyearf.
         D2WASHMA d2wcfacf. D2WCFACI d2wcfacf. D2WHOPAY d2whopaf.
         D2_0 d2_0ffff. D2_11 a54b_11f. D2_2 d2_2ffff.
         D2_5 a54b_5ff. D2_8 a54b_8ff. D31 d31fffff.
         D31_0 d31_0fff. D31_11 d31_11ff. D31_14 d31fffff.
         D31_2 d31_2fff. D31_5 d31_5fff. D31_8 d31_8fff.
         D32 d31fffff. D32_0 d31_0fff. D32_11 d32_11ff.
         D32_14 d31fffff. D32_2 d31_2fff. D32_5 d31_5fff.
         D32_8 d32_8fff. D33_11 d33_11ff. D33_14 d33_14ff.
         D33_8 d33_8fff. D34_11 d34_11ff. D34_14 d34_14ff.
         D34_8 d34_8fff. D4ALGA1_11 d4meat2_2f. D4ALGA1_14 d4milk1f.
         D4ALGA1_8 d4meat2_1f. D4ALGA2_11 d4meat2_2f. D4ALGA2_14 d4milk1f.
         D4ALGA2_8 d4meat2_1f. D4A_14 d4a_14ff. D4BEAN1 d4meat1f.
         D4BEAN1_11 d4meat2_2f. D4BEAN1_14 d4meat1f. D4BEAN1_8 d4meat2_1f.
         D4BEAN2 d4meat2f. D4BEAN2_11 d4meat2_2f. D4BEAN2_14 d4meat2f.
         D4BEAN2_8 d4meat2_1f. D4BEN2_0 d4mt2_0f. D4BEN2_2 d4mt2_2f.
         D4BEN2_5 d4mt2_5f. D4B_14 d4b_14ff. D4DRUG1_11 d4drug1_1f.
         D4DRUG1_14 d4drug1_2f. D4DRUG1_8 d4drug1f. D4DRUG2_11 d4drug1_1f.
         D4DRUG2_14 d4drug1_2f. D4DRUG2_8 d4drug1f. D4EGG1 d4meat1f.
         D4EGG1_11 d4meat2_2f. D4EGG1_14 d4meat1f. D4EGG1_8 d4meat2_1f.
         D4EGG2 d4meat2f. D4EGG2_0 d4mt2_0f. D4EGG2_11 d4meat2_2f.
         D4EGG2_14 d4meat2f. D4EGG2_2 d4mt2_2f. D4EGG2_5 d4mt2_5f.
         D4EGG2_8 d4meat2_1f. D4FISH1 d4meat1f. D4FISH1_11 d4meat2_2f.
         D4FISH1_14 d4meat1f. D4FISH1_8 d4meat2_1f. D4FISH2 d4meat2f.
         D4FISH2_11 d4meat2_2f. D4FISH2_14 d4meat2f. D4FISH2_8 d4meat2_1f.
         D4FSH2_0 d4mt2_0f. D4FSH2_2 d4mt2_2f. D4FSH2_5 d4mt2_5f.
         D4GAR2_0 d4mt2_0f. D4GAR2_2 d4mt2_2f. D4GAR2_5 d4mt2_5f.
         D4GARL1 d4meat1f. D4GARL1_11 d4meat2_2f. D4GARL1_14 d4meat1f.
         D4GARL1_8 d4meat2_1f. D4GARL2 d4meat2f. D4GARL2_11 d4meat2_2f.
         D4GARL2_14 d4meat2f. D4GARL2_8 d4meat2_1f. D4MEAT1 d4meat1f.
         D4MEAT1_11 d4meat2_2f. D4MEAT1_14 d4meat1f. D4MEAT1_8 d4meat2_1f.
         D4MEAT2 d4meat2f. D4MEAT2_11 d4meat2_2f. D4MEAT2_14 d4meat2f.
         D4MEAT2_8 d4meat2_1f. D4MILK1_11 d4meat2_2f. D4MILK1_14 d4milk1f.
         D4MILK1_8 d4meat2_1f. D4MILK2_11 d4meat2_2f. D4MILK2_14 d4milk1f.
         D4MILK2_8 d4meat2_1f. D4MT2_0 d4mt2_0f. D4MT2_2 d4mt2_2f.
         D4MT2_5 d4mt2_5f. D4NUT1_11 d4meat2_2f. D4NUT1_14 d4milk1f.
         D4NUT1_8 d4meat2_1f. D4NUT2_11 d4meat2_2f. D4NUT2_14 d4milk1f.
         D4NUT2_8 d4meat2_1f. D4SUG2_0 d4mt2_0f. D4SUG2_2 d4mt2_2f.
         D4SUG2_5 d4mt2_5f. D4SUGA1 d4meat1f. D4SUGA1_11 d4meat2_2f.
         D4SUGA1_14 d4meat1f. D4SUGA1_8 d4meat2_1f. D4SUGA2 d4meat2f.
         D4SUGA2_11 d4meat2_2f. D4SUGA2_14 d4meat2f. D4SUGA2_8 d4meat2_1f.
         D4TEA1 d4meat1f. D4TEA1_11 d4meat2_2f. D4TEA1_14 d4meat1f.
         D4TEA1_8 d4meat2_1f. D4TEA2 d4meat2f. D4TEA2_0 d4mt2_0f.
         D4TEA2_11 d4meat2_2f. D4TEA2_14 d4meat2f. D4TEA2_2 d4mt2_2f.
         D4TEA2_5 d4mt2_5f. D4TEA2_8 d4meat2_1f. D4VEG1 d4meat1f.
         D4VEG1_11 d4meat2_2f. D4VEG1_14 d4meat1f. D4VEG1_8 d4meat2_1f.
         D4VEG2 d4meat2f. D4VEG2_0 d4mt2_0f. D4VEG2_11 d4meat2_2f.
         D4VEG2_14 d4meat2f. D4VEG2_2 d4mt2_2f. D4VEG2_5 d4mt2_5f.
         D4VEG2_8 d4meat2_1f. D4VIT1_11 d4meat2_2f. D4VIT1_14 d4milk1f.
         D4VIT1_8 d4meat2_1f. D4VIT2_11 d4meat2_2f. D4VIT2_14 d4milk1f.
         D4VIT2_8 d4meat2_1f. D5A d5afffff. D5ACTDAY d5vyearf.
         D5ADVDIR d5bedrif. D5B d5afffff. D5BATDAY d5batdaf.
         D5BATHFA d5wcfacf. D5BATHFU d5bathff. D5BEDDAY d5beddaf.
         D5BEDRID d5bedrif. D5C d5cfffff. D5CARCST d5medcof.
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
         D5WHOPAY d5whopaf. D5_0 d5_0ffff. D5_11 d5_11fff.
         D5_14 d5_14fff. D5_2 d5_2ffff. D5_5 d5_5ffff.
         D5_8 d5_8ffff. D61 d61fffff. D62 d61fffff.
         D63 a53a2fff. D64 a53a2fff. D65 a54bffff.
         D6A_11 d6a_11ff. D6A_14 d5afffff. D6A_8 d6a_8fff.
         D6B_11 d6a_11ff. D6B_14 d5afffff. D6B_8 d6a_8fff.
         D6C_0 d6c_0fff. D6C_11 d6a_11ff. D6C_14 d5afffff.
         D6C_2 d6c_2fff. D6C_5 d6c_5fff. D6C_8 d6a_8fff.
         D71 d61fffff. D710A_11 d78a_11f. D710A_14 d78a_14f.
         D710B_11 d78a_11f. D710B_14 d78a_14f. D710_11 a535_11f.
         D710_14 a535_14f. D71_0 d71_0fff. D71_11 d71_11ff.
         D71_14 d61fffff. D71_2 d71_2fff. D71_5 d71_5fff.
         D71_8 d71_8fff. D72 d61fffff. D72_11 d71_11ff.
         D72_14 d61fffff. D72_5 d71_5fff. D72_8 d71_8fff.
         D73 a53a2fff. D73_11 a53a2_1f. D73_14 a53a2fff.
         D73_5 a53a2_5f. D73_8 a53a2_8f. D74 a53a2fff.
         D74_11 a53a2_1f. D74_14 a53a2fff. D74_2 a53a2_2f.
         D74_5 a53a2_5f. D74_8 a53a2_8f. D75 d75fffff.
         D75_0 a54b_0ff. D75_11 a53a5_1f. D75_14 d75fffff.
         D75_2 a54b_2ff. D75_5 d75_5fff. D75_8 d75_8fff.
         D76 a54bffff. D76_11 d76_11ff. D76_14 a54bffff.
         D77_11 d77_11ff. D77_14 d77_14ff. D78A_11 d78a_11f.
         D78A_14 d78a_14f. D78B_11 d78a_11f. D78B_14 d78a_14f.
         D78_11 a535_11f. D78_14 a535_14f. D79A_11 d78a_11f.
         D79A_14 d78a_14f. D79B_11 d78a_11f. D79B_14 d78a_14f.
         D79_11 a535_11f. D79_14 a535_14f. D81 d61fffff.
         D81_0 d71_0fff. D81_11 d71_11ff. D81_14 d61fffff.
         D81_2 d71_2fff. D81_5 d71_5fff. D81_8 d71_8fff.
         D82 d61fffff. D82_11 d71_11ff. D82_14 d61fffff.
         D82_5 d71_5fff. D82_8 d71_8fff. D83 a53a2fff.
         D83_11 a53a2_1f. D83_14 a53a2fff. D83_5 a53a2_5f.
         D83_8 a53a2_8f. D84 a53a2fff. D84_11 a53a2_1f.
         D84_14 a53a2fff. D84_2 a53a2_2f. D84_5 a53a2_5f.
         D84_8 a53a2_8f. D85_0 d85_0fff. D85_11 d85_11ff.
         D85_14 d85_14ff. D85_2 d85_2fff. D85_5 d85_5fff.
         D85_8 d85_8fff. D86_0 a54b_0ff. D86_11 a53a5_1f.
         D86_14 a54bffff. D86_2 a54b_2ff. D86_5 d75_5fff.
         D86_8 d75_8fff. D87_11 a535_11f. D87_14 a535_14f.
         D8ACTDAY d8batdaf. D8ADVDIR d8doctof. D8ARTHRI d8hyperf.
         D8BATDAY d8batdaf. D8BATHFA d8wcfacf. D8BATHFU d8bathff.
         D8BEDDAY d8beddaf. D8BEDRID d8bedrif. D8BEDSOR d8hyperf.
         D8CANCER d8hyperf. D8CARCST d8medcof. D8CARGIV d8cargif.
         D8CARPAY d8carpaf. D8CONDAY d8batdaf. D8CONTFU d8contff.
         D8CVD d8hyperf. D8DEMENT d8hyperf. D8DIABET d8hyperf.
         D8DIDAY1 d8didayf. D8DIDAY2 d8didayf. D8DIDAY3 d8didayf.
         D8DIRCST d8medcof. D8DIRDAY d8dirdaf. D8DISEA1 d8diseaf.
         D8DISEA2 d8diseaf. D8DISEA3 d8diseaf. D8DOCTOR d8doctof.
         D8DPLACE d8dplacf. D8DREAM d8dreamf. D8DREDAY d8batdaf.
         D8DRESFU d8bathff. D8DRINK d8doctof. D8DRKMCH d8smktif.
         D8FEEDAY d8batdaf. D8FEEDFU d8bathff. D8FINANC d8finanf.
         D8FULLDA d8batdaf. D8GASTRI d8hyperf. D8GENER d8generf.
         D8GLAUCO d8hyperf. D8GYNECO d8hyperf. D8HEART d8hyperf.
         D8HEATER d8wcfacf. D8HYPERT d8hyperf. D8ILL d8illfff.
         D8INCOME d8incomf. D8KNDDRK d8knddrf. D8LICDOC d8licdof.
         D8LIVARR d8livarf. D8MARRY d8marryf. D8MEDCOS d8medcof.
         D8MEDICA d8medicf. D8MOVDAY d8batdaf. D8MOVEFU d8bathff.
         D8NEUROS d8hyperf. D8OTHERS d8hyperf. D8OUTDOR d8batdaf.
         D8PAIN d8painff. D8PARKIN d8hyperf. D8PERSON d8persof.
         D8PHONE d8wcfacf. D8PNEUM d8hyperf. D8POCKET d8medcof.
         D8PROSTA d8hyperf. D8PSYCHO d8hyperf. D8RESID d8residf.
         D8SEX d8sexfff. D8SMKTIM d8smktif. D8SMOKE d8doctof.
         D8TAPWAT d8wcfacf. D8TOIDAY d8batdaf. D8TOILFU d8bathff.
         D8TUBERC d8hyperf. D8TVSET d8wcfacf. D8UNCDAY d8uncdaf.
         D8UNCONS d8bedrif. D8VDAY d8vdayff. D8WASHMA d8wcfacf.
         D8WCFACI d8wcfacf. D8WHOPAY d8whopaf. D91 d61fffff.
         D91_0 d71_0fff. D91_11 d91_11ff. D91_14 d61fffff.
         D91_2 d71_2fff. D91_5 d71_5fff. D91_8 d91_8fff.
         D92 a53a2fff. D92_11 d91_11ff. D92_14 a53a2fff.
         D92_5 d71_5fff. D92_8 d91_8fff. D93 a53a2fff.
         D93_11 a53a2_1f. D93_14 a53a2fff. D93_5 a53a2_5f.
         D93_8 a53a2_8f. D94_11 a53a2_1f. D94_14 a53a2fff.
         D94_2 a53a2_2f. D94_5 a53a2_5f. D94_8 a53a2_8f.
         DATE98 month98f. DAYIN_11 monthinf. DAY_0 month_0f.
         DAY_2 month_2f. DAY_5 month_5f. DAY_8 month_8f.
         DTH00_02 dth00_0f. DTH02_05 dth02_0f. DTH05_08 dth05_0f.
         DTH08_11 dth08_1f. DTH11_14 dth11_1f. DTH98_00 dth98_0f.
         E0_11 e0_11fff. E0_14 e0_14fff. E1 e1ffffff.
         E10_11 e7_11fff. E10_14 e7_14fff. E10_2 e7_2ffff.
         E10_5 e7_5ffff. E10_8 e7_8ffff. E11_11 e7_11fff.
         E11_14 e7_14fff. E11_2 e7_2ffff. E11_5 e7_5ffff.
         E11_8 e7_8ffff. E12_11 e7_11fff. E12_14 e12_14ff.
         E12_2 e7_2ffff. E12_5 e7_5ffff. E12_8 e7_8ffff.
         E13_11 e7_11fff. E13_14 e7_14fff. E13_2 e7_2ffff.
         E13_5 e7_5ffff. E13_8 e7_8ffff. E14_11 e7_11fff.
         E14_14 e12_14ff. E14_2 e7_2ffff. E14_5 e7_5ffff.
         E14_8 e7_8ffff. E1A_2 e1a_2fff. E1B_11 e1b_11ff.
         E1B_14 e1b_14ff. E1B_5 e1b_5fff. E1B_8 e1b_8fff.
         E1_0 e1_0ffff. E1_11 e1_11fff. E1_14 e1ffffff.
         E1_2 e1_2ffff. E1_5 e1_5ffff. E1_8 e1_8ffff.
         E2 e2ffffff. E2A_2 e1a_2fff. E2B_11 e1b_11ff.
         E2B_14 e1b_14ff. E2B_5 e1b_5fff. E2B_8 e1b_8fff.
         E2_0 e2_0ffff. E2_11 e2_11fff. E2_14 e2ffffff.
         E2_2 e1_2ffff. E2_5 e2_5ffff. E2_8 e2_8ffff.
         E3 e3ffffff. E3A_2 e1a_2fff. E3B_11 e1b_11ff.
         E3B_14 e1b_14ff. E3B_5 e1b_5fff. E3B_8 e1b_8fff.
         E3_0 e3_0ffff. E3_11 e3_11fff. E3_14 e3ffffff.
         E3_2 e1_2ffff. E3_5 e3_5ffff. E3_8 e3_8ffff.
         E4 e4ffffff. E4A_2 e1a_2fff. E4B_11 e1b_11ff.
         E4B_14 e1b_14ff. E4B_5 e1b_5fff. E4B_8 e1b_8fff.
         E4_0 e4_0ffff. E4_11 e4_11fff. E4_14 e4ffffff.
         E4_2 e1_2ffff. E4_5 e4_5ffff. E4_8 e4_8ffff.
         E5 e5ffffff. E5A_2 e1a_2fff. E5B_11 e1b_11ff.
         E5B_14 e1b_14ff. E5B_5 e1b_5fff. E5B_8 e1b_8fff.
         E5_0 e5_0ffff. E5_11 e5_11fff. E5_14 e5ffffff.
         E5_2 e1_2ffff. E5_5 e5_5ffff. E5_8 e5_8ffff.
         E6 e6ffffff. E610_11 e610_11f. E610_14 e610_14f.
         E610_5 e610_5ff. E610_8 e610_8ff. E62_11 e62_11ff.
         E62_14 e62_14ff. E62_5 e62_5fff. E62_8 e62_8fff.
         E63_11 e63_11ff. E63_14 e63_14ff. E63_5 e63_5fff.
         E63_8 e63_8fff. E64_11 e64_11ff. E64_14 e64_14ff.
         E64_5 e64_5fff. E64_8 e64_8fff. E65_11 e65_11ff.
         E65_14 e65_14ff. E65_5 e65_5fff. E65_8 e65_8fff.
         E66_5 e66_5fff. E67_11 e67_11ff. E67_14 e67_14ff.
         E67_5 e67_5fff. E67_8 e67_8fff. E6A_2 e1a_2fff.
         E6B_11 e6b_11ff. E6B_14 e6b_14ff. E6B_5 e1b_5fff.
         E6B_8 e6b_8fff. E6_0 e6_0ffff. E6_11 e6_11fff.
         E6_14 e6ffffff. E6_2 e1_2ffff. E6_5 e6_5ffff.
         E6_8 e6_8ffff. E7_11 e7_11fff. E7_14 e7_14fff.
         E7_2 e7_2ffff. E7_5 e7_5ffff. E7_8 e7_8ffff.
         E8_11 e7_11fff. E8_14 e7_14fff. E8_2 e7_2ffff.
         E8_5 e7_5ffff. E8_8 e7_8ffff. E9_11 e7_11fff.
         E9_14 e7_14fff. E9_2 e7_2ffff. E9_5 e7_5ffff.
         E9_8 e7_8ffff. F1 a41bffff. F10 a41bffff.
         F101A1 f92a2fff. F101A2 f92a3fff. F101A3 a53a2fff.
         F101A4 f92a5fff. F101A5 f92a6fff. F101B1 f92a2fff.
         F101B2 f92a3fff. F101B3 a53a2fff. F101B4 f92a5fff.
         F101B5 f92a6fff. F101C1 f92a2fff. F101C2 f92a3fff.
         F101C3 a53a2fff. F101C4 f92a5fff. F101C5 f92a6fff.
         F101D1 f92a2fff. F101D2 f92a3fff. F101D3 a53a2fff.
         F101D4 f92a5fff. F101D5 f92a6fff. F101E1 f92a2fff.
         F101E2 f92a3fff. F101E3 a53a2fff. F101E4 f92a5fff.
         F101E5 f92a6fff. F101F1 f92a2fff. F101F2 f92a3fff.
         F101F3 a53a2fff. F101F4 f92a5fff. F101F5 f92a6fff.
         F101G1 f92a2fff. F101G2 f92a3fff. F101G3 a53a2fff.
         F101G4 f92a5fff. F101G5 f92a6fff. F101H1 f92a2fff.
         F101H2 f92a3fff. F101H3 a53a2fff. F101H4 f92a5fff.
         F101H5 f92a6fff. F101I1 f92a2fff. F101I2 f92a3fff.
         F101I3 a53a2fff. F101I4 f92a5fff. F101I5 f92a6fff.
         F101J1 f92a2fff. F101J2 f92a3fff. F101J3 a53a2fff.
         F101J4 f92a5fff. F101J5 f92a6fff. F101K1 f92a2fff.
         F101K2 f92a3fff. F101K3 a53a2fff. F101K4 f92a5fff.
         F101K5 f92a6fff. F101_0 a54b_0ff. F101_11 a53a5_1f.
         F101_14 a54bffff. F101_8 d75_8fff. F102_0 a54b_0ff.
         F102_11 a53a5_1f. F102_14 a54bffff. F102_8 d75_8fff.
         F1030A_11 a535_11f. F1030B1_11 f901b1_f. F1030B2_11 f901b1_f.
         F1030B3_11 f901b1_f. F1030_11 f41a12_f. F1031A_11 a535_11f.
         F1031B1_11 f901b1_f. F1031B2_11 f901b1_f. F1031B3_11 f901b1_f.
         F1031_11 f41a12_f. F1032_11 f1032_1f. F1033_11 f1033_1f.
         F103A1_11 a53a3_1f. F103A1_14 f92a2fff. F103A1_5 f92a2_5f.
         F103A1_8 a53a3_8f. F103A2_11 f103a2__1f. F103A2_14 f103a2__2f.
         F103A2_5 f103a8_f. F103A2_8 f103a2_f. F103A3_11 a53a5_1f.
         F103A3_14 a53a2fff. F103A3_5 a53a2_5f. F103A3_8 d75_8fff.
         F103A4_11 f92a3_1f. F103A4_14 f92a3fff. F103A4_5 a532_5ff.
         F103A4_8 f92a3_8f. F103A5_11 f103a5__2f. F103A5_14 f103a5__3f.
         F103A5_5 f103a5_f. F103A5_8 f103a5__1f. F103A6_5 f103a6_f.
         F103A7_11 f92a3_1f. F103A7_14 f92a3fff. F103A7_5 a532_5ff.
         F103A7_8 f92a3_8f. F103A8_11 f92a3_1f. F103A8_14 f92a3fff.
         F103A8_5 f103a8_f. F103A8_8 f92a3_8f. F103B1_11 a53a3_1f.
         F103B1_14 f92a2fff. F103B1_5 f92a2_5f. F103B1_8 a53a3_8f.
         F103B2_11 f103a2__1f. F103B2_14 f103a2__2f. F103B2_5 f103a8_f.
         F103B2_8 f103a2_f. F103B3_11 a53a5_1f. F103B3_14 a53a2fff.
         F103B3_5 a53a2_5f. F103B3_8 d75_8fff. F103B4_11 f92a3_1f.
         F103B4_14 f92a3fff. F103B4_5 a532_5ff. F103B4_8 f92a3_8f.
         F103B5_11 f103a5__2f. F103B5_14 f103a5__3f. F103B5_5 f103a5_f.
         F103B5_8 f103a5__1f. F103B6_5 d75_5fff. F103B7_11 f92a3_1f.
         F103B7_14 f92a3fff. F103B7_5 a532_5ff. F103B7_8 f92a3_8f.
         F103B8_11 f92a3_1f. F103B8_14 f92a3fff. F103B8_5 f103a8_f.
         F103B8_8 f92a3_8f. F103C1_11 a53a3_1f. F103C1_14 f92a2fff.
         F103C1_5 f92a2_5f. F103C1_8 a53a3_8f. F103C2_11 f103a2__1f.
         F103C2_14 f103a2__2f. F103C2_5 f103a8_f. F103C2_8 f103a2_f.
         F103C3_11 a53a5_1f. F103C3_14 a53a2fff. F103C3_5 a53a2_5f.
         F103C3_8 d75_8fff. F103C4_11 f92a3_1f. F103C4_14 f92a3fff.
         F103C4_5 a532_5ff. F103C4_8 f92a3_8f. F103C5_11 f103a5__2f.
         F103C5_14 f103a5__3f. F103C5_5 f103a5_f. F103C5_8 f103a5__1f.
         F103C6_5 f103a6_f. F103C7_11 f92a3_1f. F103C7_14 f92a3fff.
         F103C7_5 a532_5ff. F103C7_8 f92a3_8f. F103C8_11 f92a3_1f.
         F103C8_14 f92a3fff. F103C8_5 f103a8_f. F103C8_8 f92a3_8f.
         F103D1_11 a53a3_1f. F103D1_14 f92a2fff. F103D1_5 f92a2_5f.
         F103D1_8 a53a3_8f. F103D2_11 f103a2__1f. F103D2_14 f103a2__2f.
         F103D2_5 f103a8_f. F103D2_8 f103a2_f. F103D3_11 a53a5_1f.
         F103D3_14 a53a2fff. F103D3_5 a53a2_5f. F103D3_8 d75_8fff.
         F103D4_11 f92a3_1f. F103D4_14 f92a3fff. F103D4_5 a532_5ff.
         F103D4_8 f92a3_8f. F103D5_11 f103a5__2f. F103D5_14 f103a5__3f.
         F103D5_5 f103a5_f. F103D5_8 f103a5__1f. F103D6_5 f103a6_f.
         F103D7_11 f92a3_1f. F103D7_14 f92a3fff. F103D7_5 a532_5ff.
         F103D7_8 f92a3_8f. F103D8_11 f92a3_1f. F103D8_14 f92a3fff.
         F103D8_5 f103a8_f. F103D8_8 f92a3_8f. F103E1_11 a53a3_1f.
         F103E1_14 f92a2fff. F103E1_5 f92a2_5f. F103E1_8 a53a3_8f.
         F103E2_11 f103a2__1f. F103E2_14 f103a2__2f. F103E2_5 f103a8_f.
         F103E2_8 f103a2_f. F103E3_11 a53a5_1f. F103E3_14 a53a2fff.
         F103E3_5 a53a2_5f. F103E3_8 d75_8fff. F103E4_11 f92a3_1f.
         F103E4_14 f92a3fff. F103E4_5 a532_5ff. F103E4_8 f92a3_8f.
         F103E5_11 f103a5__2f. F103E5_14 f103a5__3f. F103E5_5 f103a5_f.
         F103E5_8 f103a5__1f. F103E6_5 f103a6_f. F103E7_11 f92a3_1f.
         F103E7_14 f92a3fff. F103E7_5 a532_5ff. F103E7_8 f92a3_8f.
         F103E8_11 f92a3_1f. F103E8_14 f92a3fff. F103E8_5 f103a8_f.
         F103E8_8 f92a3_8f. F103F1_11 a53a3_1f. F103F1_14 f92a2fff.
         F103F1_5 f92a2_5f. F103F1_8 a53a3_8f. F103F2_11 f103a2__1f.
         F103F2_14 f103a2__2f. F103F2_5 f103a8_f. F103F2_8 f103a2_f.
         F103F3_11 a53a5_1f. F103F3_14 a53a2fff. F103F3_5 a53a2_5f.
         F103F3_8 d75_8fff. F103F4_11 f92a3_1f. F103F4_14 f92a3fff.
         F103F4_5 a532_5ff. F103F4_8 f92a3_8f. F103F5_11 f103a5__2f.
         F103F5_14 f103a5__3f. F103F5_5 f103a5_f. F103F5_8 f103a5__1f.
         F103F6_5 f103a6_f. F103F7_11 f92a3_1f. F103F7_14 f92a3fff.
         F103F7_5 a532_5ff. F103F7_8 f92a3_8f. F103F8_11 f92a3_1f.
         F103F8_14 f92a3fff. F103F8_5 f103a8_f. F103F8_8 f92a3_8f.
         F103G1_11 a53a3_1f. F103G1_14 f92a2fff. F103G1_5 f92a2_5f.
         F103G1_8 a53a3_8f. F103G2_11 f103a2__1f. F103G2_14 f103a2__2f.
         F103G2_5 f103a8_f. F103G2_8 f103a2_f. F103G3_11 a53a5_1f.
         F103G3_14 a53a2fff. F103G3_5 a53a2_5f. F103G3_8 d75_8fff.
         F103G4_11 f92a3_1f. F103G4_14 f92a3fff. F103G4_5 a532_5ff.
         F103G4_8 f92a3_8f. F103G5_11 f103a5__2f. F103G5_14 f103a5__3f.
         F103G5_5 f103a5_f. F103G5_8 f103a5__1f. F103G6_5 f103a6_f.
         F103G7_11 f92a3_1f. F103G7_14 f92a3fff. F103G7_5 a532_5ff.
         F103G7_8 f92a3_8f. F103G8_11 f92a3_1f. F103G8_14 f92a3fff.
         F103G8_5 f103a8_f. F103G8_8 f92a3_8f. F103H1_11 a53a3_1f.
         F103H1_14 f92a2fff. F103H1_5 f92a2_5f. F103H1_8 a53a3_8f.
         F103H2_11 f103a2__1f. F103H2_14 f103a2__2f. F103H2_5 f103a8_f.
         F103H2_8 f103a2_f. F103H3_11 a53a5_1f. F103H3_14 a53a2fff.
         F103H3_5 a53a2_5f. F103H3_8 d75_8fff. F103H4_11 f92a3_1f.
         F103H4_14 f92a3fff. F103H4_5 a532_5ff. F103H4_8 f92a3_8f.
         F103H5_11 f103a5__2f. F103H5_14 f103a5__3f. F103H5_5 f103a5_f.
         F103H5_8 f103a5__1f. F103H6_5 f103a6_f. F103H7_11 f92a3_1f.
         F103H7_14 f92a3fff. F103H7_5 a532_5ff. F103H7_8 f92a3_8f.
         F103H8_11 f92a3_1f. F103H8_14 f92a3fff. F103H8_5 f103a8_f.
         F103H8_8 f92a3_8f. F103I1_11 a53a3_1f. F103I1_14 f92a2fff.
         F103I1_5 f92a2_5f. F103I1_8 a53a3_8f. F103I2_11 f103a2__1f.
         F103I2_14 f103a2__2f. F103I2_5 f103a8_f. F103I2_8 f103a2_f.
         F103I3_11 a53a5_1f. F103I3_14 a53a2fff. F103I3_5 a53a2_5f.
         F103I3_8 d75_8fff. F103I4_11 f92a3_1f. F103I4_14 f92a3fff.
         F103I4_5 a532_5ff. F103I4_8 f92a3_8f. F103I5_11 f103a5__2f.
         F103I5_14 f103a5__3f. F103I5_5 f103a5_f. F103I5_8 f103a5__1f.
         F103I6_5 f103a6_f. F103I7_11 f92a3_1f. F103I7_14 f92a3fff.
         F103I7_5 a532_5ff. F103I7_8 f92a3_8f. F103I8_11 f92a3_1f.
         F103I8_14 f92a3fff. F103I8_5 f103a8_f. F103I8_8 f92a3_8f.
         F103J1_11 a53a3_1f. F103J1_14 f92a2fff. F103J1_5 f92a2_5f.
         F103J1_8 a53a3_8f. F103J2_11 f103a2__1f. F103J2_14 f103a2__2f.
         F103J2_5 f103a8_f. F103J2_8 f103a2_f. F103J3_11 a53a5_1f.
         F103J3_14 a53a2fff. F103J3_5 a53a2_5f. F103J3_8 d75_8fff.
         F103J4_11 f92a3_1f. F103J4_14 f92a3fff. F103J4_5 a532_5ff.
         F103J4_8 f92a3_8f. F103J5_11 f103a5__2f. F103J5_14 f103a5__3f.
         F103J5_5 f103a5_f. F103J5_8 f103a5__1f. F103J6_5 f103a6_f.
         F103J7_11 f92a3_1f. F103J7_14 f92a3fff. F103J7_5 a532_5ff.
         F103J7_8 f92a3_8f. F103J8_11 f92a3_1f. F103J8_14 f92a3fff.
         F103J8_5 f103a8_f. F103J8_8 f92a3_8f. F103K1_11 a53a3_1f.
         F103K1_14 f92a2fff. F103K1_5 f92a2_5f. F103K1_8 a53a3_8f.
         F103K2_11 f103a2__1f. F103K2_14 f103a2__2f. F103K2_5 f103a8_f.
         F103K2_8 f103a2_f. F103K3_11 a53a5_1f. F103K3_14 a53a2fff.
         F103K3_5 a53a2_5f. F103K3_8 d75_8fff. F103K4_11 f92a3_1f.
         F103K4_14 f92a3fff. F103K4_5 a532_5ff. F103K4_8 f92a3_8f.
         F103K5_11 f103a5__2f. F103K5_14 f103a5__3f. F103K5_5 f103a5_f.
         F103K5_8 f103a5__1f. F103K6_5 f103a6_f. F103K7_11 f92a3_1f.
         F103K7_14 f92a3fff. F103K7_5 a532_5ff. F103K7_8 f92a3_8f.
         F103K8_11 f92a3_1f. F103K8_14 f92a3fff. F103K8_5 f103a8_f.
         F103K8_8 f92a3_8f. F103L1_11 a53a3_1f. F103L1_14 f92a2fff.
         F103L1_5 f92a2_5f. F103L1_8 a53a3_8f. F103L2_11 f103a2__1f.
         F103L2_14 f103a2__2f. F103L2_5 f103a8_f. F103L2_8 f103a2_f.
         F103L3_11 a53a5_1f. F103L3_14 a53a2fff. F103L3_5 a53a2_5f.
         F103L3_8 d75_8fff. F103L4_11 f92a3_1f. F103L4_14 f92a3fff.
         F103L4_5 a532_5ff. F103L4_8 f92a3_8f. F103L5_11 f103a5__2f.
         F103L5_14 f103a5__3f. F103L5_5 f103a5_f. F103L5_8 f103a5__1f.
         F103L6_5 f103a6_f. F103L7_11 f92a3_1f. F103L7_14 f92a3fff.
         F103L7_5 a532_5ff. F103L7_8 f92a3_8f. F103L8_11 f92a3_1f.
         F103L8_14 f92a3fff. F103L8_5 f103a8_f. F103L8_8 f92a3_8f.
         F103M1_11 a53a3_1f. F103M1_14 f92a2fff. F103M1_5 f92a2_5f.
         F103M1_8 a53a3_8f. F103M2_11 f103a2__1f. F103M2_14 f103a2__2f.
         F103M2_5 f103a8_f. F103M2_8 f103a2_f. F103M3_11 a53a5_1f.
         F103M3_14 a53a2fff. F103M3_5 a53a2_5f. F103M3_8 d75_8fff.
         F103M4_11 f92a3_1f. F103M4_14 f92a3fff. F103M4_5 a532_5ff.
         F103M4_8 f92a3_8f. F103M5_11 f103a5__2f. F103M5_14 f103a5__3f.
         F103M5_5 f103a5_f. F103M5_8 f103a5__1f. F103M6_5 d75_5fff.
         F103M7_11 f92a3_1f. F103M7_14 f92a3fff. F103M7_5 a532_5ff.
         F103M7_8 f92a3_8f. F103M8_11 f92a3_1f. F103M8_14 f92a3fff.
         F103M8_5 f103a8_f. F103M8_8 f92a3_8f. F103_11 a54b_11f.
         F103_8 a54b_8ff. F104_14 f104_14f. F104_2 f104_2ff.
         F105_14 f104_14f. F105_2 f104_2ff. F10A_11 a54b_11f.
         F10A_14 a54bffff. F10A_8 a54b_8ff. F10_11 a54b_11f.
         F10_14 a41bffff. F10_8 a54b_8ff. F111A_11 f111a_1f.
         F111A_14 f111a_1_1f. F111A_5 f111a_5f. F111A_8 f111a_8f.
         F111B_11 f111a_1f. F111B_14 f111a_1_1f. F111B_5 f111a_5f.
         F111B_8 f111a_8f. F111C_11 f111a_1f. F111C_14 f111a_1_1f.
         F111C_5 f111a_5f. F111C_8 f111a_8f. F111_2 f111_2ff.
         F112A_11 f111a_1f. F112A_14 f111a_1_1f. F112A_5 f111a_5f.
         F112A_8 f111a_8f. F112B_11 f111a_1f. F112B_14 f111a_1_1f.
         F112B_5 f111a_5f. F112B_8 f111a_8f. F112C_11 f111a_1f.
         F112C_14 f111a_1_1f. F112C_5 f111a_5f. F112C_8 f111a_8f.
         F112_2 f111_2ff. F113A_11 f111a_1f. F113A_14 f111a_1_1f.
         F113A_5 f111a_5f. F113A_8 f111a_8f. F113B_11 f111a_1f.
         F113B_14 f111a_1_1f. F113B_5 f111a_5f. F113B_8 f111a_8f.
         F113C_11 f111a_1f. F113C_14 f111a_1_1f. F113C_5 f111a_5f.
         F113C_8 f111a_8f. F113_2 f111_2ff. F12A_11 f12a_11f.
         F12A_14 f12a_14f. F12A_2 f12a_2ff. F12A_5 f12a_5ff.
         F12A_8 f12a_8ff. F12B_11 f12a_11f. F12B_14 f12a_14f.
         F12B_2 f12a_2ff. F12B_5 f12a_5ff. F12B_8 f12a_8ff.
         F12C_11 f12a_11f. F12C_14 f12a_14f. F12C_5 f12a_5ff.
         F12C_8 f12a_8ff. F13A_11 f12a_11f. F13A_14 f12a_14f.
         F13A_2 f12a_2ff. F13A_5 f12a_5ff. F13A_8 f12a_8ff.
         F13B_11 f12a_11f. F13B_14 f12a_14f. F13B_2 f12a_2ff.
         F13B_5 f12a_5ff. F13B_8 f12a_8ff. F13C_11 f12a_11f.
         F13C_14 f12a_14f. F13C_5 f12a_5ff. F13C_8 f12a_8ff.
         F141_11 f141_11f. F141_14 f141_14f. F141_5 f141_5ff.
         F141_8 f141_8ff. F142_11 f141_11f. F142_14 f141_14f.
         F142_5 f141_5ff. F142_8 f141_8ff. F143_11 f141_11f.
         F143_14 f141_14f. F143_5 f141_5ff. F143_8 f141_8ff.
         F144_11 f141_11f. F144_14 f141_14f. F144_5 f141_5ff.
         F144_8 f141_8ff. F145_11 f141_11f. F145_14 f141_14f.
         F145_5 f141_5ff. F145_8 f141_8ff. F146_11 f141_11f.
         F146_14 f141_14f. F146_5 f141_5ff. F146_8 f141_8ff.
         F147_11 f141_11f. F147_14 f141_14f. F147_5 f141_5ff.
         F147_8 f141_8ff. F148_11 f141_11f. F148_14 f141_14f.
         F148_5 f141_5ff. F148_8 f141_8ff. F149_11 f141_11f.
         F149_14 f141_14f. F149_5 f141_5ff. F149_8 f141_8ff.
         F151_11 b28_11ff. F151_14 b28_14ff. F151_5 f141_5ff.
         F151_8 f151_8ff. F152_11 b28_11ff. F152_14 b28_14ff.
         F152_5 f141_5ff. F152_8 f151_8ff. F153_11 b28_11ff.
         F153_14 b28_14ff. F153_5 f141_5ff. F153_8 f151_8ff.
         F154_11 b28_11ff. F154_14 b28_14ff. F154_5 f141_5ff.
         F154_8 f151_8ff. F155_11 b28_11ff. F155_14 b28_14ff.
         F155_5 f141_5ff. F155_8 f151_8ff. F156_11 b28_11ff.
         F156_14 b28_14ff. F156_5 f141_5ff. F156_8 f151_8ff.
         F157_11 b28_11ff. F157_14 b28_14ff. F157_5 f141_5ff.
         F157_8 f151_8ff. F158_11 b28_11ff. F158_14 b28_14ff.
         F158_5 f141_5ff. F158_8 f151_8ff. F159_11 b28_11ff.
         F159_14 b28_14ff. F159_5 f141_5ff. F159_8 f151_8ff.
         F16_11 f16_11ff. F16_14 f16_14ff. F16_5 f16_5fff.
         F16_8 f16_8fff. F1_14 a41bffff. F1_8 a54b_8ff.
         F2 f2ffffff. F211_11 f21_11ff. F211_14 f211_14f.
         F211_2 f211_2ff. F211_5 f211_5ff. F211_8 f21_8fff.
         F21_11 f21_11ff. F21_14 f21_14ff. F21_2 f21_2fff.
         F21_8 f21_8fff. F221_11 f221_11f. F221_14 f221_14f.
         F22_11 a541_11f. F22_14 a54affff. F22_2 f22_2fff.
         F22_5 e1b_5fff. F22_8 a541_8ff. F23_11 f23_11ff.
         F23_14 a532_14f. F23_2 f211_2ff. F23_5 a532_5ff.
         F23_8 f23_8fff. F24_11 a535_11f. F24_14 a535_14f.
         F251_11 f251_11f. F252_11 f251_11f. F25A1_14 f25a1_1f.
         F25A2_14 f25a1_1f. F25B1_11 f25b1_1f. F25B1_14 f25b1_1_1f.
         F25B2_11 d78a_11f. F25B2_14 d78a_14f. F26_11 f25b1_1f.
         F26_14 f26_14ff. F27_11 f27_11ff. F27_14 f27_14ff.
         F2_14 f2ffffff. F2_8 f2_8ffff. F31 f31fffff.
         F31_0 f31_0fff. F31_11 f31_11ff. F31_14 f31fffff.
         F31_2 f31_2fff. F31_5 f31_5fff. F31_8 f31_8fff.
         F32 f31fffff. F32A_11 f31_11ff. F32A_14 f32a_14f.
         F32A_5 f31_5fff. F32A_8 f31_8fff. F32B_11 f31_11ff.
         F32B_14 f32a_14f. F32B_5 f31_5fff. F32B_8 f31_8fff.
         F32C_11 f31_11ff. F32C_14 f32a_14f. F32C_5 f31_5fff.
         F32C_8 f31_8fff. F32D_11 f31_11ff. F32D_14 f32a_14f.
         F32D_5 f31_5fff. F32D_8 f31_8fff. F32E_11 f31_11ff.
         F32E_14 f32a_14f. F32E_5 f31_5fff. F32E_8 f31_8fff.
         F32_0 f32_0fff. F32_2 f31_2fff. F33_0 f33_0fff.
         F33_11 f23_11ff. F33_14 a532_14f. F33_2 f21_2fff.
         F33_5 d71_5fff. F33_8 f23_8fff. F340_11 f340_11f.
         F340_14 f340_14f. F340_5 f340_5ff. F340_8 f340_8ff.
         F34_0 f34_0fff. F34_11 f34_11ff. F34_14 f34_14ff.
         F34_2 f34_2fff. F34_5 f34_5fff. F34_8 f34_8fff.
         F35_11 f35_11ff. F35_14 f35_14ff. F35_2 f35_2fff.
         F35_5 f35_5fff. F35_8 f35_8fff. F41 f41fffff.
         F41A11_11 a534_11f. F41A11_14 a534_14f. F41A12_11 f41a12_f.
         F41A12_14 f41a12__1f. F41A1_11 a535_11f. F41A1_14 a535_14f.
         F41A21_11 a534_11f. F41A21_14 a534_14f. F41A22_11 f41a12_f.
         F41A22_14 f41a12__1f. F41A2_11 a535_11f. F41A2_14 a535_14f.
         F41A31_11 a534_11f. F41A31_14 a534_14f. F41A32_11 f41a12_f.
         F41A32_14 f41a12__1f. F41A3_11 a535_11f. F41A3_14 a535_14f.
         F41B1_11 a534_11f. F41B1_14 a534_14f. F41B2_11 f41a12_f.
         F41B2_14 f41a12__1f. F41B_11 a535_11f. F41B_14 a535_14f.
         F41_0 f41_0fff. F41_11 f41_11ff. F41_14 f41fffff.
         F41_2 f41_2fff. F41_5 f41_5fff. F41_8 f41_8fff.
         F42 a54bffff. F42_11 a53a5_1f. F42_14 a54bffff.
         F42_5 d75_5fff. F42_8 d75_8fff. F43A1 a53a2fff.
         F43A1_11 a53a2_1f. F43A1_14 a53a2fff. F43A1_5 a53a2_5f.
         F43A1_8 a53a2_8f. F43A2 f43a2fff. F43A2_11 f43a2_1f.
         F43A2_14 f43a2_1_1f. F43A2_5 f43a2_5f. F43A2_8 f43a2_8f.
         F43A3 a53a2fff. F43A3_11 a53a2_1f. F43A3_14 a53a2fff.
         F43A3_5 a53a2_5f. F43A3_8 a53a2_8f. F43A4 f43a4fff.
         F43A4_11 f43a4_1f. F43A4_14 f43a4fff. F43A4_5 f43a4_5f.
         F43A4_8 f43a4_8f. F43B1 a53a2fff. F43B1_11 a53a2_1f.
         F43B1_14 a53a2fff. F43B1_5 a53a2_5f. F43B1_8 a53a2_8f.
         F43B2 f43a2fff. F43B2_11 f43a2_1f. F43B2_14 f43a2_1_1f.
         F43B2_5 f43a2_5f. F43B2_8 f43a2_8f. F43B3 a53a2fff.
         F43B3_11 a53a2_1f. F43B3_14 a53a2fff. F43B3_5 a53a2_5f.
         F43B3_8 a53a2_8f. F43B4 f43a4fff. F43B4_11 f43a4_1f.
         F43B4_14 f43a4fff. F43B4_5 f43a4_5f. F43B4_8 f43a4_8f.
         F43C1 a53a2fff. F43C1_11 a53a2_1f. F43C1_14 a53a2fff.
         F43C1_5 a53a2_5f. F43C1_8 a53a2_8f. F43C2 f43a2fff.
         F43C2_11 f43a2_1f. F43C2_14 f43a2_1_1f. F43C2_5 f43a2_5f.
         F43C2_8 f43a2_8f. F43C3 a53a2fff. F43C3_11 a53a2_1f.
         F43C3_14 a53a2fff. F43C3_5 a53a2_5f. F43C3_8 a53a2_8f.
         F43C4 f43a4fff. F43C4_11 f43a4_1f. F43C4_14 f43a4fff.
         F43C4_5 f43a4_5f. F43C4_8 f43a4_8f. F43D1 a53a2fff.
         F43D1_11 a53a2_1f. F43D1_14 a53a2fff. F43D1_5 a53a2_5f.
         F43D1_8 a53a2_8f. F43D2 f43a2fff. F43D2_11 f43a2_1f.
         F43D2_14 f43a2_1_1f. F43D2_5 f43a2_5f. F43D2_8 f43a2_8f.
         F43D3 a53a2fff. F43D3_11 a53a2_1f. F43D3_14 a53a2fff.
         F43D3_5 a53a2_5f. F43D3_8 a53a2_8f. F43D4 f43a4fff.
         F43D4_11 f43a4_1f. F43D4_14 f43a4fff. F43D4_5 f43a4_5f.
         F43D4_8 f43a4_8f. F44 a54bffff. F44_11 a53a5_1f.
         F44_14 a54bffff. F44_5 d75_5fff. F44_8 d75_8fff.
         F45 f45fffff. F45_11 f45_11ff. F45_14 f45fffff.
         F45_2 f45_2fff. F45_5 f45_5fff. F45_8 f45_8fff.
         F46_11 f46_11ff. F46_14 f46_14ff. F46_5 f46_5fff.
         F46_8 f46_8fff. F47_11 f47_11ff. F47_14 f47_14ff.
         F47_8 f47_8fff. F5 f5ffffff. F5_0 f5_0ffff.
         F5_11 f5_11fff. F5_11_14 f5ffffff. F5_2 f5_2ffff.
         F5_5 f5_5ffff. F5_8 f5_8ffff. F61 f61fffff.
         F610_11 f610_11f. F610_14 f610_14f. F610_5 f610_5ff.
         F610_8 f610_8ff. F61_0 f61_0fff. F61_11 d71_11ff.
         F61_14 f61fffff. F61_2 f21_2fff. F61_5 d71_5fff.
         F61_8 d71_8fff. F62 f62fffff. F62_11 f62_11ff.
         F62_14 f62fffff. F62_8 f62_8fff. F63 f62fffff.
         F63_11 f62_11ff. F63_14 f62fffff. F63_8 f62_8fff.
         F64 f62fffff. F64A_11 f64a_11f. F64A_14 f64a_14f.
         F64A_5 f64a_5ff. F64A_8 f64a_8ff. F64B_11 f64a_11f.
         F64B_14 f64a_14f. F64B_5 f64a_5ff. F64B_8 f64a_8ff.
         F64C_11 f64a_11f. F64C_14 f64a_14f. F64C_5 f64a_5ff.
         F64C_8 f64a_8ff. F64D_11 f64a_11f. F64D_14 f64a_14f.
         F64D_5 f64a_5ff. F64D_8 f64a_8ff. F64E1_11 f64e1_1f.
         F64E_14 f64a_14f. F64E_5 f64a_5ff. F64E_8 f64a_8ff.
         F64F1_11 f64e1_1f. F64F_14 f64a_14f. F64F_5 f64a_5ff.
         F64F_8 f64a_8ff. F64G1_11 f64e1_1f. F64G_14 f64a_14f.
         F64G_5 f64a_5ff. F64G_8 f64a_8ff. F64H1_11 f64e1_1f.
         F64H_14 f64a_14f. F64H_5 f64a_5ff. F64H_8 f64a_8ff.
         F64I_11 f64i_11f. F64I_14 f64a_14f. F64I_5 f64a_5ff.
         F64I_8 f64i_8ff. F64_0 f64_0fff. F64_2 f64_2fff.
         F65 d61fffff. F651A1_11 f651a1_f. F651A1_14 f35_14ff.
         F651A2_11 f651a1_f. F651A2_14 f35_14ff. F651A_5 f651a_5f.
         F651A_8 f651a_8f. F651B1_11 f651a1_f. F651B1_14 f35_14ff.
         F651B2_11 f651a1_f. F651B2_14 f35_14ff. F651B_5 f651a_5f.
         F651B_8 f651a_8f. F6521_11 f6521_1f. F6521_14 f6521_1_1f.
         F652A_11 yearin_f. F652A_14 5.2 F652B_11 a535_11f.
         F652B_14 a535_14f. F652_5 f652_5ff. F652_8 f652_8ff.
         F65_0 f65_0fff. F65_2 f65_2fff. F66_11 d91_11ff.
         F66_14 f71fffff. F66_8 d91_8fff. F71 f71fffff.
         F71_11 d91_11ff. F71_14 f71fffff. F71_5 f71_5fff.
         F71_8 d91_8fff. F72 f72fffff. F721_11 a53a2_1f.
         F721_14 a53a2fff. F721_5 a53a2_5f. F721_8 a53a2_8f.
         F722A_11 d91_11ff. F722_11 a53a2_1f. F722_14 a53a2fff.
         F722_5 a53a2_5f. F722_8 a53a2_8f. F73 a53a2fff.
         F73_11 a53a2_1f. F73_14 a53a2fff. F73_5 a53a2_5f.
         F73_8 a53a2_8f. F74_11 a54b_11f. F74_14 a41bffff.
         F74_5 a54b_5ff. F74_8 a54b_8ff. F81 f71fffff.
         F81_11 d91_11ff. F81_14 f71fffff. F81_5 f71_5fff.
         F81_8 d91_8fff. F82 f72fffff. F821_11 a53a2_1f.
         F821_14 a53a2fff. F821_5 a53a2_5f. F821_8 a53a2_8f.
         F822A_11 d91_11ff. F822_11 a53a2_1f. F822_14 a53a2fff.
         F822_5 a53a2_5f. F822_8 a53a2_8f. F83 a53a2fff.
         F83_11 a53a2_1f. F83_14 a53a2fff. F83_5 a53a2_5f.
         F83_8 a53a2_8f. F84 f2ffffff. F84_11 f84_11ff.
         F84_14 f2ffffff. F84_8 f84_8fff. F85_11 f84_11ff.
         F85_14 f85_14ff. F85_5 f85_5fff. F85_8 f84_8fff.
         F86_11 a54b_11f. F86_14 a41bffff. F86_5 a54b_5ff.
         F86_8 a54b_8ff. F9 a41bffff. F901A_11 a535_11f.
         F901B1_11 f901b1_f. F901B2_11 f901b1_f. F901B3_11 f901b1_f.
         F901_11 f41a12_f. F902A_11 a535_11f. F902B1_11 f901b1_f.
         F902B2_11 f901b1_f. F902B3_11 f901b1_f. F902_11 f41a12_f.
         F91 a41bffff. F91_11 a54b_11f. F91_14 a41bffff.
         F91_8 a54b_8ff. F92A1 a54bffff. F92A1_11 a53a5_1f.
         F92A1_14 a54bffff. F92A1_5 d75_5fff. F92A1_8 d75_8fff.
         F92A2 f92a2fff. F92A2_11 a53a3_1f. F92A2_14 f92a2fff.
         F92A2_5 f92a2_5f. F92A2_8 a53a3_8f. F92A3 f92a3fff.
         F92A3_11 f92a3_1f. F92A3_14 f92a3fff. F92A3_5 f92a3_5f.
         F92A3_8 f92a3_8f. F92A4 a53a2fff. F92A4_11 a53a2_1f.
         F92A4_14 a53a2fff. F92A4_5 a53a2_5f. F92A4_8 a53a2_8f.
         F92A5 f92a5fff. F92A5_11 f92a5_1f. F92A5_14 f92a5fff.
         F92A5_5 f92a5_5f. F92A5_8 f92a5_8f. F92A6 f92a6fff.
         F92A6_11 f92a3_1f. F92A6_14 f92a6fff. F92A6_5 a532_5ff.
         F92A6_8 f92a3_8f. F92A7_11 f92a3_1f. F92A7_14 f92a3fff.
         F92B1 a54bffff. F92B1_11 a53a5_1f. F92B1_14 a54bffff.
         F92B1_5 d75_5fff. F92B1_8 d75_8fff. F92B2 f92a2fff.
         F92B2_11 a53a3_1f. F92B2_14 f92a2fff. F92B2_5 f92a2_5f.
         F92B2_8 a53a3_8f. F92B3 f92a3fff. F92B3_11 f92a3_1f.
         F92B3_14 f92a3fff. F92B3_5 f92a3_5f. F92B3_8 f92a3_8f.
         F92B4 a53a2fff. F92B4_11 a53a2_1f. F92B4_14 a53a2fff.
         F92B4_5 a53a2_5f. F92B4_8 a53a2_8f. F92B5 f92a5fff.
         F92B5_11 f92a5_1f. F92B5_14 f92a5fff. F92B5_5 f92a5_5f.
         F92B5_8 f92a5_8f. F92B6 f92a6fff. F92B6_11 f92a3_1f.
         F92B6_14 f92a6fff. F92B6_5 a532_5ff. F92B6_8 f92a3_8f.
         F92B7_11 f92a3_1f. F92B7_14 f92a3fff. F92C1 a54bffff.
         F92C1_11 a53a5_1f. F92C1_14 a54bffff. F92C1_5 d75_5fff.
         F92C1_8 d75_8fff. F92C2 f92a2fff. F92C2_11 a53a3_1f.
         F92C2_14 f92a2fff. F92C2_5 f92a2_5f. F92C2_8 a53a3_8f.
         F92C3 f92a3fff. F92C3_11 f92a3_1f. F92C3_14 f92a3fff.
         F92C3_5 f92a3_5f. F92C3_8 f92a3_8f. F92C4 a53a2fff.
         F92C4_11 a53a2_1f. F92C4_14 a53a2fff. F92C4_5 a53a2_5f.
         F92C4_8 a53a2_8f. F92C5 f92a5fff. F92C5_11 f92a5_1f.
         F92C5_14 f92a5fff. F92C5_5 f92a5_5f. F92C5_8 f92a5_8f.
         F92C6 f92a6fff. F92C6_11 f92a3_1f. F92C6_14 f92a6fff.
         F92C6_5 a532_5ff. F92C6_8 f92a3_8f. F92C7_11 f92a3_1f.
         F92C7_14 f92a3fff. F92D1 a54bffff. F92D1_11 a53a5_1f.
         F92D1_14 a54bffff. F92D1_5 d75_5fff. F92D1_8 d75_8fff.
         F92D2 f92a2fff. F92D2_11 a53a3_1f. F92D2_14 f92a2fff.
         F92D2_5 f92a2_5f. F92D2_8 a53a3_8f. F92D3 f92a3fff.
         F92D3_11 f92a3_1f. F92D3_14 f92a3fff. F92D3_5 f92a3_5f.
         F92D3_8 f92a3_8f. F92D4 a53a2fff. F92D4_11 a53a2_1f.
         F92D4_14 a53a2fff. F92D4_5 a53a2_5f. F92D4_8 a53a2_8f.
         F92D5 f92a5fff. F92D5_11 f92a5_1f. F92D5_14 f92a5fff.
         F92D5_5 f92a5_5f. F92D5_8 f92a5_8f. F92D6 f92a6fff.
         F92D6_11 f92a3_1f. F92D6_14 f92a6fff. F92D6_5 a532_5ff.
         F92D6_8 f92a3_8f. F92D7_11 f92a3_1f. F92D7_14 f92a3fff.
         F92E1 a54bffff. F92E1_11 a53a5_1f. F92E1_14 a54bffff.
         F92E1_5 d75_5fff. F92E1_8 d75_8fff. F92E2 f92a2fff.
         F92E2_11 a53a3_1f. F92E2_14 f92a2fff. F92E2_5 f92a2_5f.
         F92E2_8 a53a3_8f. F92E3 f92a3fff. F92E3_11 f92a3_1f.
         F92E3_14 f92a3fff. F92E3_5 f92a3_5f. F92E3_8 f92a3_8f.
         F92E4 a53a2fff. F92E4_11 a53a2_1f. F92E4_14 a53a2fff.
         F92E4_5 a53a2_5f. F92E4_8 a53a2_8f. F92E5 f92a5fff.
         F92E5_11 f92a5_1f. F92E5_14 f92a5fff. F92E5_5 f92a5_5f.
         F92E5_8 f92a5_8f. F92E6 f92a6fff. F92E6_11 f92a3_1f.
         F92E6_14 f92a6fff. F92E6_5 a532_5ff. F92E6_8 f92a3_8f.
         F92E7_11 f92a3_1f. F92E7_14 f92a3fff. F92F1 a54bffff.
         F92F1_11 a53a5_1f. F92F1_14 a54bffff. F92F1_5 d75_5fff.
         F92F1_8 d75_8fff. F92F2 f92a2fff. F92F2_11 a53a3_1f.
         F92F2_14 f92a2fff. F92F2_5 f92a2_5f. F92F2_8 a53a3_8f.
         F92F3 f92a3fff. F92F3_11 f92a3_1f. F92F3_14 f92a3fff.
         F92F3_5 f92a3_5f. F92F3_8 f92a3_8f. F92F4 a53a2fff.
         F92F4_11 a53a2_1f. F92F4_14 a53a2fff. F92F4_5 a53a2_5f.
         F92F4_8 a53a2_8f. F92F5 f92a5fff. F92F5_11 f92a5_1f.
         F92F5_14 f92a5fff. F92F5_5 f92a5_5f. F92F5_8 f92a5_8f.
         F92F6 f92a6fff. F92F6_11 f92a3_1f. F92F6_14 f92a6fff.
         F92F6_5 a532_5ff. F92F6_8 f92a3_8f. F92F7_11 f92a3_1f.
         F92F7_14 f92a3fff. F92G1 a54bffff. F92G1_11 a53a5_1f.
         F92G1_14 a54bffff. F92G1_5 d75_5fff. F92G1_8 d75_8fff.
         F92G2 f92a2fff. F92G2_11 a53a3_1f. F92G2_14 f92a2fff.
         F92G2_5 f92a2_5f. F92G2_8 a53a3_8f. F92G3 f92a3fff.
         F92G3_11 f92a3_1f. F92G3_14 f92a3fff. F92G3_5 f92a3_5f.
         F92G3_8 f92a3_8f. F92G4 a53a2fff. F92G4_11 a53a2_1f.
         F92G4_14 a53a2fff. F92G4_5 a53a2_5f. F92G4_8 a53a2_8f.
         F92G5 f92a5fff. F92G5_11 f92a5_1f. F92G5_14 f92a5fff.
         F92G5_5 f92a5_5f. F92G5_8 f92a5_8f. F92G6 f92a6fff.
         F92G6_11 f92a3_1f. F92G6_14 f92a6fff. F92G6_5 a532_5ff.
         F92G6_8 f92a3_8f. F92G7_11 f92a3_1f. F92G7_14 f92a3fff.
         F92H1 a54bffff. F92H1_11 a53a5_1f. F92H1_14 a54bffff.
         F92H1_5 d75_5fff. F92H1_8 d75_8fff. F92H2 f92a2fff.
         F92H2_11 a53a3_1f. F92H2_14 f92a2fff. F92H2_5 f92a2_5f.
         F92H2_8 a53a3_8f. F92H3 f92a3fff. F92H3_11 f92a3_1f.
         F92H3_14 f92a3fff. F92H3_5 f92a3_5f. F92H3_8 f92a3_8f.
         F92H4 a53a2fff. F92H4_11 a53a2_1f. F92H4_14 a53a2fff.
         F92H4_5 a53a2_5f. F92H4_8 a53a2_8f. F92H5 f92a5fff.
         F92H5_11 f92a5_1f. F92H5_14 f92a5fff. F92H5_5 f92a5_5f.
         F92H5_8 f92a5_8f. F92H6 f92a6fff. F92H6_11 f92a3_1f.
         F92H6_14 f92a6fff. F92H6_5 a532_5ff. F92H6_8 f92a3_8f.
         F92H7_11 f92a3_1f. F92H7_14 f92a3fff. F92I1 a54bffff.
         F92I1_11 a53a5_1f. F92I1_14 a54bffff. F92I1_5 d75_5fff.
         F92I1_8 d75_8fff. F92I2 f92a2fff. F92I2_11 a53a3_1f.
         F92I2_14 f92a2fff. F92I2_5 f92a2_5f. F92I2_8 a53a3_8f.
         F92I3 f92a3fff. F92I3_11 f92a3_1f. F92I3_14 f92a3fff.
         F92I3_5 f92a3_5f. F92I3_8 f92a3_8f. F92I4 a53a2fff.
         F92I4_11 a53a2_1f. F92I4_14 a53a2fff. F92I4_5 a53a2_5f.
         F92I4_8 a53a2_8f. F92I5 f92a5fff. F92I5_11 f92a5_1f.
         F92I5_14 f92a5fff. F92I5_5 f92a5_5f. F92I5_8 f92a5_8f.
         F92I6 f92a6fff. F92I6_11 f92a3_1f. F92I6_14 f92a6fff.
         F92I6_5 a532_5ff. F92I6_8 f92a3_8f. F92I7_11 f92a3_1f.
         F92I7_14 f92a3fff. F92J1 a54bffff. F92J1_11 a53a5_1f.
         F92J1_14 a54bffff. F92J1_5 d75_5fff. F92J1_8 d75_8fff.
         F92J2 f92a2fff. F92J2_11 a53a3_1f. F92J2_14 f92a2fff.
         F92J2_5 f92a2_5f. F92J2_8 a53a3_8f. F92J3 f92a3fff.
         F92J3_11 f92a3_1f. F92J3_14 f92a3fff. F92J3_5 f92a3_5f.
         F92J3_8 f92a3_8f. F92J4 a53a2fff. F92J4_11 a53a2_1f.
         F92J4_14 a53a2fff. F92J4_5 a53a2_5f. F92J4_8 a53a2_8f.
         F92J5 f92a5fff. F92J5_11 f92a5_1f. F92J5_14 f92a5fff.
         F92J5_5 f92a5_5f. F92J5_8 f92a5_8f. F92J6 f92a6fff.
         F92J6_11 f92a3_1f. F92J6_14 f92a6fff. F92J6_5 a532_5ff.
         F92J6_8 f92a3_8f. F92J7_11 f92a3_1f. F92J7_14 f92a3fff.
         F92K1 a54bffff. F92K1_5 d75_5fff. F92K2 f92a2fff.
         F92K2_5 f92a2_5f. F92K3 f92a3fff. F92K3_5 f92a3_5f.
         F92K4 a53a2fff. F92K4_5 a53a2_5f. F92K5 f92a5fff.
         F92K5_5 f92a5_5f. F92K6 f92a6fff. F92K6_5 a532_5ff.
         F92L1 a54bffff. F92L2 f92a2fff. F92L3 f92a3fff.
         F92L4 a53a2fff. F92L5 f92a5fff. F92L6 f92a6fff.
         F92M1 a54bffff. F92M2 f92a2fff. F92M3 f92a3fff.
         F92M4 a53a2fff. F92M5 f92a5fff. F92M6 f92a6fff.
         F92N1 a54bffff. F92N2 f92a2fff. F92N3 f92a3fff.
         F92N4 a53a2fff. F92N5 f92a5fff. F92N6 f92a6fff.
         F92O1 a54bffff. F92O2 f92a2fff. F92O3 f92a3fff.
         F92O4 a53a2fff. F92O5 f92a5fff. F92O6 f92a6fff.
         F9A_11 a54b_11f. F9A_5 d75_5fff. F9A_8 a54b_8ff.
         F9_11 a54b_11f. F9_8 a54b_8ff. G01_11 g01_11ff.
         G01_14 b11fffff. G01_5 g01_5fff. G01_8 g01_8fff.
         G02_11 a54b_11f. G02_14 a41bffff. G02_5 a54b_5ff.
         G02_8 a54b_8ff. G1 g1ffffff. G101 g101ffff.
         G1011_11 a54b_11f. G1011_14 a41bffff. G101_11 g511_11f.
         G101_14 g101ffff. G101_2 g51_2fff. G101_5 g51_5fff.
         G101_8 g511_8ff. G102 g101ffff. G1021_11 g511_11f.
         G1021_14 f72fffff. G1021_8 g511_8ff. G102A_2 g51_2fff.
         G102B_11 g7_11fff. G102B_2 g51_2fff. G102C_11 g102c_1f.
         G102C_14 g102c_1_1f. G102_11 d91_11ff. G102_14 g101ffff.
         G102_5 g51_5fff. G1061_11 g1061_1f. G1061_14 g1061_1_1f.
         G1062_11 g1062_1f. G1062_14 g1062_1_1f. G1063_11 g1063_1f.
         G1063_14 g1063_1_1f. G106_11 d91_11ff. G106_14 f71fffff.
         G10_0 g51_0fff. G11 g11fffff. G11_0 g11_0fff.
         G11_11 g11_11ff. G11_14 g11fffff. G11_2 g11_2fff.
         G11_5 g11_5fff. G11_8 g11_8fff. G12 g51fffff.
         G122_11 g511_11f. G122_14 a41bffff. G122_8 g511_8ff.
         G123_11 g511_11f. G123_14 a41bffff. G123_8 g511_8ff.
         G12_0 g12_0fff. G12_11 g12_11ff. G12_14 g51fffff.
         G12_2 g12_2fff. G12_5 g12_5fff. G12_8 g12_8fff.
         G13 g13fffff. G130_11 d91_11ff. G130_14 f71fffff.
         G130_5 d71_5fff. G130_8 d91_8fff. G131_11 g131_11f.
         G131_14 g16fffff. G131_8 g131_8ff. G132_11 g132_11f.
         G132_14 g132_14f. G132_8 g132_8ff. G13_0 g13_0fff.
         G13_2 g13_2fff. G13_5 g13_5fff. G14 g14fffff.
         G14A1_0 g14a1_0f. G14A1_11 g14a1_1f. G14A1_14 g14a1_1_1f.
         G14A1_2 g14a1_2f. G14A1_5 g14a1_5f. G14A1_8 g14a1_8f.
         G14A2_0 g14a2_0f. G14A2_11 g14a2_1f. G14A2_14 g14a2_1_1f.
         G14A2_2 g14a2_2f. G14A2_5 g14a2_5f. G14A2_8 g14a2_8f.
         G14B1_0 g14a1_0f. G14B1_11 g14a1_1f. G14B1_14 g14a1_1_1f.
         G14B1_2 g14a1_2f. G14B1_5 g14a1_5f. G14B1_8 g14a1_8f.
         G14B2_0 g14a2_0f. G14B2_11 g14a2_1f. G14B2_14 g14a2_1_1f.
         G14B2_2 g14a2_2f. G14B2_5 g14a2_5f. G14B2_8 g14a2_8f.
         G14C1_0 g14a1_0f. G14C1_11 g14c1_1f. G14C1_14 g14a1_1_1f.
         G14C1_2 g14a1_2f. G14C1_5 g14a1_5f. G14C1_8 g14a1_8f.
         G14C2_0 g14a2_0f. G14C2_11 g14a2_1f. G14C2_14 g14a2_1_1f.
         G14C2_2 g14a2_2f. G14C2_5 g14a2_5f. G14C2_8 g14a2_8f.
         G15A1_0 g15a1_0f. G15A1_11 g15a1_1f. G15A1_14 g15a1_1_1f.
         G15A1_2 g15a1_2f. G15A1_5 g15a1_5f. G15A1_8 g15a1_8f.
         G15A2_0 d71_0fff. G15A2_11 d71_11ff. G15A2_14 g15a1_1_1f.
         G15A2_2 f21_2fff. G15A2_5 d71_5fff. G15A2_8 d71_8fff.
         G15A3_0 g15a3_0f. G15A3_11 g15a3_1f. G15A3_14 g15a3_1_1f.
         G15A3_2 g15a3_2f. G15A3_5 g15a3_5f. G15A3_8 g15a3_8f.
         G15B1_0 g15a1_0f. G15B1_11 g15a1_1f. G15B1_14 g15a1_1_1f.
         G15B1_2 g15a1_2f. G15B1_5 g15a1_5f. G15B1_8 g15a1_8f.
         G15B2_0 d71_0fff. G15B2_11 d71_11ff. G15B2_14 g15a1_1_1f.
         G15B2_2 f21_2fff. G15B2_5 d71_5fff. G15B2_8 d71_8fff.
         G15B3_0 g15a3_0f. G15B3_11 g15a3_1f. G15B3_14 g15a3_1_1f.
         G15B3_2 g15a3_2f. G15B3_5 g15a3_5f. G15B3_8 g15a3_8f.
         G15C1_0 g15a1_0f. G15C1_11 g15a1_1f. G15C1_14 g15a1_1_1f.
         G15C1_2 g15a1_2f. G15C1_5 g15a1_5f. G15C1_8 g15a1_8f.
         G15C2_0 d71_0fff. G15C2_11 d71_11ff. G15C2_14 g15a1_1_1f.
         G15C2_2 f21_2fff. G15C2_5 d71_5fff. G15C2_8 d71_8fff.
         G15C3_0 g15a3_0f. G15C3_11 g15a3_1f. G15C3_14 g15a3_1_1f.
         G15C3_2 g15a3_2f. G15C3_5 g15a3_5f. G15C3_8 g15a3_8f.
         G15D1_0 g15a1_0f. G15D1_11 g15a1_1f. G15D1_14 g15a1_1_1f.
         G15D1_2 g15a1_2f. G15D1_5 g15a1_5f. G15D1_8 g15a1_8f.
         G15D2_0 d71_0fff. G15D2_11 d71_11ff. G15D2_14 g15a1_1_1f.
         G15D2_2 f21_2fff. G15D2_5 d71_5fff. G15D2_8 d71_8fff.
         G15D3_0 g15a3_0f. G15D3_11 g15a3_1f. G15D3_14 g15a3_1_1f.
         G15D3_2 g15a3_2f. G15D3_5 g15a3_5f. G15D3_8 g15a3_8f.
         G15E1_0 g15a1_0f. G15E1_11 g15a1_1f. G15E1_14 g15a1_1_1f.
         G15E1_2 g15a1_2f. G15E1_5 g15a1_5f. G15E1_8 g15a1_8f.
         G15E2_0 d71_0fff. G15E2_11 d71_11ff. G15E2_14 g15a1_1_1f.
         G15E2_2 f21_2fff. G15E2_5 d71_5fff. G15E2_8 d71_8fff.
         G15E3_0 g15a3_0f. G15E3_11 g15a3_1f. G15E3_14 g15a3_1_1f.
         G15E3_2 g15a3_2f. G15E3_5 g15a3_5f. G15E3_8 g15a3_8f.
         G15F1_0 g15a1_0f. G15F1_11 g15a1_1f. G15F1_14 g15a1_1_1f.
         G15F1_2 g15a1_2f. G15F1_5 g15a1_5f. G15F1_8 g15a1_8f.
         G15F2_0 d71_0fff. G15F2_11 d91_11ff. G15F2_14 g15a1_1_1f.
         G15F2_2 f21_2fff. G15F2_5 d71_5fff. G15F2_8 d91_8fff.
         G15F3_0 g15a3_0f. G15F3_11 g15f3_1f. G15F3_14 g15a3_1_1f.
         G15F3_2 g15a3_2f. G15F3_5 g15a3_5f. G15F3_8 g15f3_8f.
         G15G1_0 g15a1_0f. G15G1_11 g15a1_1f. G15G1_14 g15a1_1_1f.
         G15G1_2 g15a1_2f. G15G1_5 g15a1_5f. G15G1_8 g15a1_8f.
         G15G2_0 d71_0fff. G15G2_11 d71_11ff. G15G2_14 g15a1_1_1f.
         G15G2_2 f21_2fff. G15G2_5 d71_5fff. G15G2_8 d71_8fff.
         G15G3_0 g15a3_0f. G15G3_11 g15a3_1f. G15G3_14 g15a3_1_1f.
         G15G3_2 g15a3_2f. G15G3_5 g15a3_5f. G15G3_8 g15a3_8f.
         G15H1_0 g15a1_0f. G15H1_11 g15a1_1f. G15H1_14 g15a1_1_1f.
         G15H1_2 g15a1_2f. G15H1_5 g15a1_5f. G15H1_8 g15a1_8f.
         G15H2_0 d71_0fff. G15H2_11 d71_11ff. G15H2_14 g15a1_1_1f.
         G15H2_2 f21_2fff. G15H2_5 d71_5fff. G15H2_8 d71_8fff.
         G15H3_0 g15a3_0f. G15H3_11 g15a3_1f. G15H3_14 g15a3_1_1f.
         G15H3_2 g15a3_2f. G15H3_5 g15a3_5f. G15H3_8 g15a3_8f.
         G15I1_0 g15a1_0f. G15I1_11 g15a1_1f. G15I1_14 g15a1_1_1f.
         G15I1_2 g15a1_2f. G15I1_5 g15a1_5f. G15I1_8 g15a1_8f.
         G15I2_0 d71_0fff. G15I2_11 d71_11ff. G15I2_14 g15a1_1_1f.
         G15I2_2 f21_2fff. G15I2_5 d71_5fff. G15I2_8 d71_8fff.
         G15I3_0 g15a3_0f. G15I3_11 g15a3_1f. G15I3_14 g15a3_1_1f.
         G15I3_2 g15a3_2f. G15I3_5 g15a3_5f. G15I3_8 g15a3_8f.
         G15J1A_11 g15n1a_f. G15J1A_14 g15a1_1_1f. G15J1_0 g15a1_0f.
         G15J1_11 g15a1_1f. G15J1_14 g15a1_1_1f. G15J1_2 g15a1_2f.
         G15J1_5 g15a1_5f. G15J1_8 g15a1_8f. G15J2A_11 g15n1a_f.
         G15J2A_14 g15a1_1_1f. G15J2_0 d71_0fff. G15J2_11 d71_11ff.
         G15J2_14 g15a1_1_1f. G15J2_2 f21_2fff. G15J2_5 d71_5fff.
         G15J2_8 d71_8fff. G15J3A_11 g15n3a_f. G15J3A_14 g15a3_1_1f.
         G15J3_0 g15a3_0f. G15J3_11 g15a3_1f. G15J3_14 g15a3_1_1f.
         G15J3_2 g15a3_2f. G15J3_5 g15a3_5f. G15J3_8 g15a3_8f.
         G15K1_0 g15a1_0f. G15K1_11 g15a1_1f. G15K1_14 g15a1_1_1f.
         G15K1_2 g15a1_2f. G15K1_5 g15a1_5f. G15K1_8 g15a1_8f.
         G15K2_0 d71_0fff. G15K2_11 d71_11ff. G15K2_14 g15a1_1_1f.
         G15K2_2 f21_2fff. G15K2_5 d71_5fff. G15K2_8 d71_8fff.
         G15K3_0 g15a3_0f. G15K3_11 g15f3_1f. G15K3_14 g15a3_1_1f.
         G15K3_2 g15a3_2f. G15K3_5 g15a3_5f. G15K3_8 g15f3_8f.
         G15L1_0 g15a1_0f. G15L1_11 g15a1_1f. G15L1_14 g15a1_1_1f.
         G15L1_2 g15a1_2f. G15L1_5 g15a1_5f. G15L1_8 g15a1_8f.
         G15L2_0 d71_0fff. G15L2_11 d71_11ff. G15L2_14 g15a1_1_1f.
         G15L2_2 f21_2fff. G15L2_5 d71_5fff. G15L2_8 d71_8fff.
         G15L3_0 g15a3_0f. G15L3_11 g15a3_1f. G15L3_14 g15a3_1_1f.
         G15L3_2 g15a3_2f. G15L3_5 g15a3_5f. G15L3_8 g15a3_8f.
         G15M1_0 g15a1_0f. G15M1_11 g15a1_1f. G15M1_14 g15a1_1_1f.
         G15M1_2 g15a1_2f. G15M1_5 g15a1_5f. G15M1_8 g15a1_8f.
         G15M2_0 d71_0fff. G15M2_11 d71_11ff. G15M2_14 g15a1_1_1f.
         G15M2_2 f21_2fff. G15M2_5 d71_5fff. G15M2_8 d71_8fff.
         G15M3_0 g15a3_0f. G15M3_11 g15a3_1f. G15M3_14 g15a3_1_1f.
         G15M3_2 g15a3_2f. G15M3_5 g15a3_5f. G15M3_8 g15a3_8f.
         G15N1A_11 g15n1a_f. G15N1A_14 g15a1_1_1f. G15N1_0 g15a1_0f.
         G15N1_11 g15a1_1f. G15N1_14 g15a1_1_1f. G15N1_2 g15a1_2f.
         G15N1_5 g15a1_5f. G15N1_8 g15a1_8f. G15N2A_11 g15n1a_f.
         G15N2A_14 g15a1_1_1f. G15N2_0 d71_0fff. G15N2_11 d71_11ff.
         G15N2_14 g15a1_1_1f. G15N2_2 f21_2fff. G15N2_5 d71_5fff.
         G15N2_8 d71_8fff. G15N3A_11 g15n3a_f. G15N3A_14 g15a3_1_1f.
         G15N3_0 g15a3_0f. G15N3_11 g15a3_1f. G15N3_14 g15a3_1_1f.
         G15N3_2 g15a3_2f. G15N3_5 g15a3_5f. G15N3_8 g15a3_8f.
         G15O1_0 g15a1_0f. G15O1_11 g15a1_1f. G15O1_14 g15a1_1_1f.
         G15O1_2 g15a1_2f. G15O1_5 g15a1_5f. G15O1_8 g15a1_8f.
         G15O2_0 d71_0fff. G15O2_11 d71_11ff. G15O2_14 g15a1_1_1f.
         G15O2_2 f21_2fff. G15O2_5 d71_5fff. G15O2_8 d71_8fff.
         G15O3_0 g15a3_0f. G15O3_11 g15a3_1f. G15O3_14 g15a3_1_1f.
         G15O3_2 g15a3_2f. G15O3_5 g15a3_5f. G15O3_8 g15a3_8f.
         G15P1_0 g15p1_0f. G15P1_11 g15a1_1f. G15P1_14 g15a1_1_1f.
         G15P1_2 g15a1_2f. G15P1_5 g15a1_5f. G15P1_8 g15a1_8f.
         G15P2_0 d71_0fff. G15P2_11 d71_11ff. G15P2_14 g15a1_1_1f.
         G15P2_2 f21_2fff. G15P2_5 d71_5fff. G15P2_8 d71_8fff.
         G15P3_0 g15a3_0f. G15P3_11 g15a3_1f. G15P3_14 g15a3_1_1f.
         G15P3_2 g15a3_2f. G15P3_5 g15a3_5f. G15P3_8 g15a3_8f.
         G15Q1_11 g15a1_1f. G15Q1_14 g15a1_1_1f. G15Q1_2 g15a1_2f.
         G15Q1_5 g15a1_5f. G15Q1_8 g15a1_8f. G15Q2_11 d71_11ff.
         G15Q2_14 g15a1_1_1f. G15Q2_2 f21_2fff. G15Q2_5 d71_5fff.
         G15Q2_8 d71_8fff. G15Q3_11 g15a3_1f. G15Q3_14 g15a3_1_1f.
         G15Q3_2 g15a3_2f. G15Q3_5 g15a3_5f. G15Q3_8 g15a3_8f.
         G15R1_11 g15a1_1f. G15R1_14 g15a1_1_1f. G15R1_2 g15a1_2f.
         G15R1_5 g15a1_5f. G15R1_8 g15a1_8f. G15R2_11 d71_11ff.
         G15R2_14 g15a1_1_1f. G15R2_2 f21_2fff. G15R2_5 d71_5fff.
         G15R2_8 d71_8fff. G15R3_11 g15a3_1f. G15R3_14 g15a3_1_1f.
         G15R3_2 g15a3_2f. G15R3_5 g15a3_5f. G15R3_8 g15a3_8f.
         G15S1_11 g15a1_1f. G15S1_14 g15a1_1_1f. G15S1_2 g15a1_2f.
         G15S1_5 g15a1_5f. G15S1_8 g15a1_8f. G15S2_11 d71_11ff.
         G15S2_14 g15a1_1_1f. G15S2_2 f21_2fff. G15S2_5 d71_5fff.
         G15S2_8 d71_8fff. G15S3_11 g15a3_1f. G15S3_14 g15a3_1_1f.
         G15S3_2 g15a3_2f. G15S3_5 g15a3_5f. G15S3_8 g15a3_8f.
         G15T1_11 g15a1_1f. G15T1_14 g15a1_1_1f. G15T1_2 g15a1_2f.
         G15T1_5 g15a1_5f. G15T1_8 g15a1_8f. G15T2_11 d71_11ff.
         G15T2_14 g15a1_1_1f. G15T2_2 f21_2fff. G15T2_5 d71_5fff.
         G15T2_8 d71_8fff. G15T3_11 g15a3_1f. G15T3_14 g15a3_1_1f.
         G15T3_2 g15a3_2f. G15T3_5 g15a3_5f. G15T3_8 g15a3_8f.
         G15U1_11 g15a1_1f. G15U1_14 g15a1_1_1f. G15U1_2 g15a1_2f.
         G15U1_5 g15a1_5f. G15U1_8 g15a1_8f. G15U2_11 d71_11ff.
         G15U2_14 g15a1_1_1f. G15U2_2 f21_2fff. G15U2_5 d71_5fff.
         G15U2_8 d71_8fff. G15U3_11 g15a3_1f. G15U3_14 g15a3_1_1f.
         G15U3_2 g15a3_2f. G15U3_5 g15a3_5f. G15U3_8 g15a3_8f.
         G15V1_11 g15a1_1f. G15V1_14 g15a1_1_1f. G15V1_2 g15a1_2f.
         G15V1_5 g15a1_5f. G15V1_8 g15a1_8f. G15V2_11 d91_11ff.
         G15V2_14 g15a1_1_1f. G15V2_2 f21_2fff. G15V2_5 d71_5fff.
         G15V2_8 d91_8fff. G15V3_11 g15f3_1f. G15V3_14 g15a3_1_1f.
         G15V3_2 g15a3_2f. G15V3_5 g15a3_5f. G15V3_8 g15f3_8f.
         G15W1_2 g15a1_2f. G15W1_5 g15a1_5f. G15W2_2 f21_2fff.
         G15W2_5 d71_5fff. G15W3_2 g15a3_2f. G15W3_5 g15a3_5f.
         G15Y2_11 g15n1a_f. G15Y2_14 f26_14ff. G15Y3_11 g15n3a_f.
         G15Y3_14 g15a3_1_1f. G16 g16fffff. G17A1 g17a1fff.
         G17A2 g17a2fff. G17B1 g17a1fff. G17B2 g17a2fff.
         G17C1 g17a1fff. G17C2 g17a2fff. G17D1 g17a1fff.
         G17D2 g17a2fff. G17E1 g17a1fff. G17E2 g17a2fff.
         G17F1 g17a1fff. G17F2 g17a2fff. G17G1 g17a1fff.
         G17G2 g17a2fff. G17H1 g17a1fff. G17H2 g17a2fff.
         G17I1 g17a1fff. G17I2 g17a2fff. G17J1 g17a1fff.
         G17J2 g17a2fff. G17K1 g17a1fff. G17K2 g17a2fff.
         G17L1 g17a1fff. G17L2 g17a2fff. G17M1 g17a1fff.
         G17M2 g17a2fff. G17N1 g17n1fff. G17N2 g17a2fff.
         G1_0 g1_0ffff. G1_11 g1_11fff. G1_14 g1ffffff.
         G1_2 g1_2ffff. G1_5 g1_5ffff. G1_8 g1_8ffff.
         G21 a52fffff. G21_0 g21_0fff. G21_11 a54b_11f.
         G21_14 a52fffff. G21_2 g21_2fff. G21_5 d12_5fff.
         G21_8 a54b_8ff. G22 d61fffff. G22_0 d71_0fff.
         G22_11 d91_11ff. G22_14 d61fffff. G22_2 f21_2fff.
         G22_5 d71_5fff. G22_8 d91_8fff. G23_11 g23_11ff.
         G23_14 g23_14ff. G24A_11 f41a12_f. G24A_14 f41a12__1f.
         G24_11 a535_11f. G24_14 a535_14f. G25A_11 f41a12_f.
         G25A_14 f41a12__1f. G25_11 a535_11f. G25_14 a535_14f.
         G3 d61fffff. G3_0 d71_0fff. G3_11 d91_11ff.
         G3_14 d61fffff. G3_2 f21_2fff. G3_5 d71_5fff.
         G3_8 d91_8fff. G4 g4ffffff. G4A_11 g4a_11ff.
         G4A_14 g4a_14ff. G4B_11 g4b_11ff. G4B_14 g4b_14ff.
         G4_0 g4_0ffff. G4_11 g4_11fff. G4_14 g4ffffff.
         G4_2 g4_2ffff. G4_5 g4_5ffff. G4_8 g4_8ffff.
         G51 g51fffff. G511_11 g511_11f. G511_14 g511_14f.
         G511_8 g511_8ff. G512_11 g511_11f. G512_14 g511_14f.
         G512_8 g511_8ff. G51_0 g51_0fff. G51_2 g51_2fff.
         G51_5 g51_5fff. G52 g51fffff. G521_11 g511_11f.
         G521_14 g511_14f. G521_8 g511_8ff. G522_11 g511_11f.
         G522_14 g511_14f. G522_8 g511_8ff. G52_0 g51_0fff.
         G52_2 g51_2fff. G52_5 g51_5fff. G6 g6ffffff.
         G6_0 g6_0ffff. G6_11 g6_11fff. G6_14 g6ffffff.
         G6_2 g6_2ffff. G6_5 g6_5ffff. G7 g51fffff.
         G71_8 g511_8ff. G72_8 g511_8ff. G7_0 g51_0fff.
         G7_11 g7_11fff. G7_14 g51fffff. G7_2 g51_2fff.
         G7_5 g51_5fff. G81 g51fffff. G81_0 g81_0fff.
         G81_11 g81_11ff. G81_14 g51fffff. G81_2 g81_2fff.
         G81_5 g81_5fff. G81_8 g81_8fff. G82 g51fffff.
         G82_0 g81_0fff. G82_11 g81_11ff. G82_14 g51fffff.
         G82_2 g81_2fff. G82_5 g81_5fff. G82_8 g81_8fff.
         G83_11 g83_11ff. G83_14 g83_14ff. G83_2 g81_2fff.
         G83_5 g83_5fff. G83_8 g83_8fff. G9 g51fffff.
         G9_0 g9_0ffff. G9_11 g9_11fff. G9_14 g51fffff.
         G9_2 g9_2ffff. G9_5 g9_5ffff. G9_8 g9_8ffff.
         H1A h1afffff. H1B h1bfffff. H1_0 h1_0ffff.
         H1_11 h1_11fff. H1_14 h1afffff. H1_2 h1_2ffff.
         H1_5 h1_5ffff. H1_8 h1_8ffff. H21 h21fffff.
         H21_0 h21_0fff. H21_11 h21_11ff. H21_14 h21fffff.
         H21_2 h21_2fff. H21_5 h21_5fff. H21_8 h21_8fff.
         H22 h22fffff. H22_0 h22_0fff. H22_11 h22_11ff.
         H22_14 h22fffff. H22_2 h22_2fff. H22_5 h22_5fff.
         H22_8 h22_8fff. H3 h3ffffff. H3_0 h3_0ffff.
         H3_11 h3_11fff. H3_14 h3ffffff. H3_2 h3_2ffff.
         H3_5 h3_5ffff. H3_8 h3_8ffff. H5_14 h5_14fff.
         H6_0 d71_0fff. H6_11 d71_11ff. H6_14 d61fffff.
         H6_2 f21_2fff. H6_5 d71_5fff. H6_8 d71_8fff.
         H7 d61fffff. H71_0 h71_0fff. H71_11 h71_11ff.
         H71_14 h71_14ff. H71_2 h71_2fff. H71_5 h71_5fff.
         H71_8 h71_8fff. H7_0 d71_0fff. H7_11 d71_11ff.
         H7_14 d61fffff. H7_2 f21_2fff. H7_5 d71_5fff.
         H7_8 d71_8fff. H8 d61fffff. H81 h81fffff.
         H8_0 d71_0fff. H8_2 f21_2fff. H9A d61fffff.
         H9B d61fffff. JIGE_11 jige_11f. JIGE_14 a54bffff.
         JIGE_8 a54b_8ff. MONTH98 month98f. MONTHIN_11 monthinf.
         MONTH_0 month_0f. MONTH_2 month_2f. MONTH_5 month_5f.
         MONTH_8 month_8f. PROV provffff. RA1 ra1fffff.
         RA2 ra2fffff. RA41 ra2fffff. RA41_14 ra2fffff.
         RA42 ra2fffff. RA42_14 ra2fffff. RA43_14 ra53afff.
         RA51 ra2fffff. RA51_0 ra51_0ff. RA51_11 ra51_11f.
         RA51_14 ra2fffff. RA51_2 ra51_2ff. RA51_5 ra51_5ff.
         RA51_8 ra51_8ff. RA52 ra2fffff. RA52_0 ra51_0ff.
         RA52_11 ra52_11f. RA52_14 ra2fffff. RA52_2 ra52_2ff.
         RA52_5 ra52_5ff. RA52_8 ra52_8ff. RA530_11 ra52_11f.
         RA530_14 ra53afff. RA530_5 ra52_5ff. RA530_8 ra52_8ff.
         RA531_11 ra52_11f. RA531_14 ra53afff. RA531_2 ra51_2ff.
         RA531_5 ra52_5ff. RA531_8 ra52_8ff. RA532_11 ra52_11f.
         RA532_14 ra53afff. RA532_2 ra51_2ff. RA532_5 ra52_5ff.
         RA532_8 ra52_8ff. RA533_11 ra52_11f. RA533_14 ra53afff.
         RA534_11 ra52_11f. RA534_14 ra53afff. RA535_11 ra52_11f.
         RA535_14 ra53afff. RA536_11 ra52_11f. RA536_14 ra53afff.
         RA537_11 ra52_11f. RA537_14 ra53afff. RA53A ra53afff.
         RA53A_0 ra51_0ff. RA53A_11 ra52_11f. RA53A_14 ra53afff.
         RA53A_2 ra52_2ff. RA53A_5 ra52_5ff. RA53A_8 ra52_8ff.
         RA53B ra53afff. RA53B_0 ra51_0ff. RA53B_11 ra52_11f.
         RA53B_14 ra53afff. RA53B_2 ra52_2ff. RA53B_5 ra52_5ff.
         RA53B_8 ra52_8ff. RA53C ra53afff. RA53C_0 ra51_0ff.
         RA53C_11 ra52_11f. RA53C_14 ra53afff. RA53C_2 ra52_2ff.
         RA53C_5 ra52_5ff. RA53C_8 ra52_8ff. RA53D ra53afff.
         RA53D_0 ra51_0ff. RA53D_11 ra52_11f. RA53D_14 ra53afff.
         RA53D_2 ra52_2ff. RA53D_5 ra52_5ff. RA53D_8 ra52_8ff.
         RA53E ra53afff. RA53E_0 ra51_0ff. RA53E_11 ra52_11f.
         RA53E_14 ra53afff. RA53E_2 ra52_2ff. RA53E_5 ra52_5ff.
         RA53E_8 ra52_8ff. RA53F ra53afff. RA53F_0 ra51_0ff.
         RA53F_11 ra52_11f. RA53F_14 ra53afff. RA53F_2 ra52_2ff.
         RA53F_5 ra52_5ff. RA53F_8 ra52_8ff. RA53G ra53afff.
         RA53G_0 ra51_0ff. RA53G_11 ra52_11f. RA53G_14 ra53afff.
         RA53G_2 ra52_2ff. RA53G_5 ra52_5ff. RA53G_8 ra52_8ff.
         RA53H ra53afff. RA53H_0 ra51_0ff. RA53H_11 ra52_11f.
         RA53H_14 ra53afff. RA53H_2 ra52_2ff. RA53H_5 ra52_5ff.
         RA53H_8 ra52_8ff. RA53I ra53afff. RA53I_0 ra51_0ff.
         RA53I_11 ra52_11f. RA53I_14 ra53afff. RA53I_2 ra52_2ff.
         RA53I_5 ra52_5ff. RA53I_8 ra52_8ff. RA53J ra53afff.
         RA53J_0 ra51_0ff. RA53J_11 ra52_11f. RA53J_14 ra53afff.
         RA53J_2 ra52_2ff. RA53J_5 ra52_5ff. RA53J_8 ra52_8ff.
         RA53K ra53afff. RA53K_0 ra51_0ff. RA53K_2 ra52_2ff.
         RA53K_5 ra52_5ff. RA53K_8 ra52_8ff. RA53L ra53afff.
         RA53L_0 ra51_0ff. RA53L_2 ra52_2ff. RA53L_5 ra52_5ff.
         RA53L_8 ra52_8ff. RA54 ra53afff. RA540_11 ra52_11f.
         RA540_14 ra53afff. RA540_5 ra52_5ff. RA541_11 ra52_11f.
         RA541_14 ra53afff. RA541_5 ra52_5ff. RA541_8 ra52_8ff.
         RA542_11 ra52_11f. RA542_14 ra53afff. RA542_5 ra52_5ff.
         RA542_8 ra52_8ff. RA54_0 ra54_0ff. RA54_11 ra52_11f.
         RA54_14 ra53afff. RA54_2 ra52_2ff. RA54_5 ra52_5ff.
         RA54_8 ra52_8ff. RD1 ra2fffff. RD101_11 ra51_11f.
         RD101_14 ra53afff. RD101_5 ra51_5ff. RD101_8 ra51_8ff.
         RD102_11 ra52_11f. RD102_14 ra53afff. RD102_5 ra52_5ff.
         RD102_8 ra52_8ff. RD103_11 ra52_11f. RD103_14 ra53afff.
         RD103_5 ra52_5ff. RD103_8 ra52_8ff. RD10A ra2fffff.
         RD10B ra2fffff. RD10C ra2fffff. RD10D ra2fffff.
         RD10E ra2fffff. RD10F ra2fffff. RD10G ra2fffff.
         RD10H ra2fffff. RD11A_0 rd1_0fff. RD11A_11 ra51_11f.
         RD11A_14 ra53afff. RD11A_2 ra51_2ff. RD11A_5 ra51_5ff.
         RD11A_8 ra51_8ff. RD11B_0 rd1_0fff. RD11B_11 ra51_11f.
         RD11B_14 ra53afff. RD11B_2 ra51_2ff. RD11B_5 ra51_5ff.
         RD11B_8 ra51_8ff. RD11C_0 rd1_0fff. RD11C_11 ra51_11f.
         RD11C_14 ra53afff. RD11C_2 ra51_2ff. RD11C_5 ra51_5ff.
         RD11C_8 ra51_8ff. RD11D_0 rd1_0fff. RD11D_11 ra51_11f.
         RD11D_14 ra53afff. RD11D_2 ra51_2ff. RD11D_5 ra51_5ff.
         RD11D_8 ra51_8ff. RD11E_0 rd1_0fff. RD11E_11 ra51_11f.
         RD11E_14 ra53afff. RD11E_2 ra51_2ff. RD11E_5 ra51_5ff.
         RD11E_8 ra51_8ff. RD11F_0 rd1_0fff. RD11F_11 ra51_11f.
         RD11F_14 ra53afff. RD11F_2 ra51_2ff. RD11F_5 ra51_5ff.
         RD11F_8 ra51_8ff. RD11G_0 rd1_0fff. RD11G_11 ra51_11f.
         RD11G_14 ra53afff. RD11G_2 ra51_2ff. RD11G_5 ra51_5ff.
         RD11G_8 ra51_8ff. RD11H_0 rd1_0fff. RD11H_11 ra51_11f.
         RD11H_14 ra53afff. RD11H_2 ra51_2ff. RD11H_5 ra51_5ff.
         RD11H_8 ra51_8ff. RD11I_2 ra51_2ff. RD12_11 rd12_11f.
         RD12_14 ra53afff. RD12_2 ra51_2ff. RD12_5 ra51_5ff.
         RD12_8 rd12_8ff. RD1_0 rd1_0fff. RD1_11 rd1_11ff.
         RD1_14 ra2fffff. RD1_2 ra51_2ff. RD1_5 ra51_5ff.
         RD1_8 rd1_8fff. RD2 ra2fffff. RD2_0 rd1_0fff.
         RD2_11 ra51_11f. RD2_14 ra2fffff. RD2_2 ra51_2ff.
         RD2_5 ra51_5ff. RD2_8 ra51_8ff. RD31 ra2fffff.
         RD31_0 rd1_0fff. RD31_11 ra51_11f. RD31_14 ra2fffff.
         RD31_2 ra51_2ff. RD31_5 ra51_5ff. RD31_8 ra51_8ff.
         RD32 ra2fffff. RD32_0 rd1_0fff. RD32_11 ra51_11f.
         RD32_14 ra2fffff. RD32_2 ra51_2ff. RD32_5 ra51_5ff.
         RD32_8 ra51_8ff. RD33_11 ra51_11f. RD33_14 ra53afff.
         RD33_8 ra51_8ff. RD34_11 ra51_11f. RD34_14 ra53afff.
         RD34_8 ra51_8ff. RD4ALGA_11 ra51_11f. RD4ALGA_14 ra53afff.
         RD4ALGA_8 ra51_8ff. RD4BEAN ra2fffff. RD4BEAN_11 ra51_11f.
         RD4BEAN_14 ra2fffff. RD4BEAN_8 ra51_8ff. RD4BEN_0 rd1_0fff.
         RD4BEN_2 ra51_2ff. RD4BEN_5 ra51_5ff. RD4DRUG_11 ra51_11f.
         RD4DRUG_14 ra53afff. RD4DRUG_8 ra51_8ff. RD4EGG ra2fffff.
         RD4EGG_0 rd1_0fff. RD4EGG_11 ra51_11f. RD4EGG_14 ra2fffff.
         RD4EGG_2 ra51_2ff. RD4EGG_5 ra51_5ff. RD4EGG_8 ra51_8ff.
         RD4FISH ra2fffff. RD4FISH_11 ra51_11f. RD4FISH_14 ra2fffff.
         RD4FISH_8 ra51_8ff. RD4FSH_0 rd1_0fff. RD4FSH_2 ra51_2ff.
         RD4FSH_5 ra51_5ff. RD4GARL ra2fffff. RD4GARL_11 ra51_11f.
         RD4GARL_14 ra2fffff. RD4GARL_8 ra51_8ff. RD4GAR_0 rd1_0fff.
         RD4GAR_2 ra51_2ff. RD4GAR_5 ra51_5ff. RD4MEAT ra2fffff.
         RD4MEAT_11 ra51_11f. RD4MEAT_14 ra2fffff. RD4MEAT_8 ra51_8ff.
         RD4MILK_14 ra53afff. RD4MT_0 rd1_0fff. RD4MT_2 ra51_2ff.
         RD4MT_5 ra51_5ff. RD4NUT_11 ra51_11f. RD4NUT_14 ra53afff.
         RD4NUT_8 ra51_8ff. RD4SUGA ra2fffff. RD4SUGA_11 ra51_11f.
         RD4SUGA_14 ra2fffff. RD4SUGA_8 ra51_8ff. RD4SUG_0 rd1_0fff.
         RD4SUG_2 ra51_2ff. RD4SUG_5 ra51_5ff. RD4TEA ra2fffff.
         RD4TEA_0 rd1_0fff. RD4TEA_11 ra51_11f. RD4TEA_14 ra2fffff.
         RD4TEA_2 ra51_2ff. RD4TEA_5 ra51_5ff. RD4TEA_8 ra51_8ff.
         RD4VEG ra2fffff. RD4VEG_0 ra51_0ff. RD4VEG_11 ra51_11f.
         RD4VEG_14 ra2fffff. RD4VEG_2 ra51_2ff. RD4VEG_5 ra51_5ff.
         RD4VEG_8 ra51_8ff. RD4VIT_11 ra51_11f. RD4VIT_14 ra53afff.
         RD4VIT_8 ra51_8ff. RD5 ra2fffff. RD5_0 rd1_0fff.
         RD5_11 ra51_11f. RD5_14 ra2fffff. RD5_2 ra51_2ff.
         RD5_5 ra51_5ff. RD5_8 ra51_8ff. RD61 ra2fffff.
         RD62 ra53afff. RD63 ra53afff. RD64 ra53afff.
         RD65 ra53afff. RD6_0 rd1_0fff. RD6_11 ra51_11f.
         RD6_14 ra53afff. RD6_2 ra51_2ff. RD6_5 ra51_5ff.
         RD6_8 ra51_8ff. RD71 ra2fffff. RD710_11 ra52_11f.
         RD710_14 ra53afff. RD71_0 rd1_0fff. RD71_11 ra51_11f.
         RD71_14 ra2fffff. RD71_2 ra51_2ff. RD71_5 ra51_5ff.
         RD71_8 ra51_8ff. RD72 ra53afff. RD72_11 ra51_11f.
         RD72_14 ra53afff. RD72_5 ra51_5ff. RD72_8 ra51_8ff.
         RD73 ra53afff. RD73_11 ra52_11f. RD73_14 ra53afff.
         RD73_5 ra52_5ff. RD73_8 ra52_8ff. RD74 ra53afff.
         RD74_11 ra52_11f. RD74_14 ra53afff. RD74_2 ra52_2ff.
         RD74_5 ra52_5ff. RD74_8 ra52_8ff. RD75 ra53afff.
         RD75_0 ra51_0ff. RD75_11 ra52_11f. RD75_14 ra53afff.
         RD75_2 ra52_2ff. RD75_5 ra52_5ff. RD75_8 ra52_8ff.
         RD76 ra53afff. RD76_11 ra52_11f. RD76_14 ra53afff.
         RD77_11 ra52_11f. RD77_14 ra53afff. RD78_11 ra52_11f.
         RD78_14 ra53afff. RD79_11 ra52_11f. RD79_14 ra53afff.
         RD81 ra2fffff. RD81_0 rd1_0fff. RD81_11 ra51_11f.
         RD81_14 ra2fffff. RD81_2 ra51_2ff. RD81_5 ra51_5ff.
         RD81_8 ra51_8ff. RD82 ra53afff. RD82_11 ra51_11f.
         RD82_14 ra53afff. RD82_5 ra51_5ff. RD82_8 ra51_8ff.
         RD83 ra53afff. RD83_11 ra52_11f. RD83_14 ra53afff.
         RD83_5 ra52_5ff. RD83_8 ra52_8ff. RD84 ra53afff.
         RD84_11 ra52_11f. RD84_14 ra53afff. RD84_2 ra52_2ff.
         RD84_5 ra52_5ff. RD84_8 ra52_8ff. RD85_0 ra51_0ff.
         RD85_11 ra52_11f. RD85_14 ra53afff. RD85_2 ra52_2ff.
         RD85_5 ra52_5ff. RD85_8 ra52_8ff. RD86_0 ra51_0ff.
         RD86_11 ra51_11f. RD86_14 ra53afff. RD86_2 ra52_2ff.
         RD86_5 ra52_5ff. RD86_8 ra51_8ff. RD87_11 ra52_11f.
         RD87_14 ra53afff. RD91 ra2fffff. RD91_0 rd1_0fff.
         RD91_11 ra51_11f. RD91_14 ra2fffff. RD91_2 ra51_2ff.
         RD91_5 ra51_5ff. RD91_8 ra51_8ff. RD92 ra53afff.
         RD92_11 ra52_11f. RD92_14 ra53afff. RD92_5 ra52_5ff.
         RD92_8 ra52_8ff. RD93 ra53afff. RD93_11 ra52_11f.
         RD93_14 ra53afff. RD93_5 ra52_5ff. RD93_8 ra52_8ff.
         RD94_11 ra52_11f. RD94_14 ra53afff. RD94_2 ra52_2ff.
         RD94_5 ra52_5ff. RD94_8 ra52_8ff. RDEMILK_11 ra51_11f.
         RDEMILK_8 ra51_8ff. RE0_11 ra52_11f. RE0_14 ra53afff.
         RE1 ra2fffff. RE10_11 ra51_11f. RE10_14 ra53afff.
         RE10_2 ra51_2ff. RE10_5 ra51_5ff. RE10_8 ra51_8ff.
         RE11_11 ra51_11f. RE11_14 ra53afff. RE11_2 ra51_2ff.
         RE11_5 ra51_5ff. RE11_8 ra51_8ff. RE12_11 ra51_11f.
         RE12_14 ra53afff. RE12_2 ra51_2ff. RE12_5 ra51_5ff.
         RE12_8 ra51_8ff. RE13_11 ra51_11f. RE13_14 ra53afff.
         RE13_2 ra51_2ff. RE13_5 ra51_5ff. RE13_8 ra51_8ff.
         RE14_11 ra51_11f. RE14_14 ra53afff. RE14_2 ra51_2ff.
         RE14_5 ra51_5ff. RE14_8 ra51_8ff. RE1A_2 ra51_2ff.
         RE1B_11 ra51_11f. RE1B_14 ra53afff. RE1B_5 ra52_5ff.
         RE1B_8 ra51_8ff. RE1_0 rd1_0fff. RE1_11 ra51_11f.
         RE1_14 re1_14ff. RE1_2 ra51_2ff. RE1_5 ra51_5ff.
         RE1_8 ra51_8ff. RE2 ra2fffff. RE2A_2 ra51_2ff.
         RE2B_11 ra51_11f. RE2B_14 ra53afff. RE2B_5 ra52_5ff.
         RE2B_8 ra51_8ff. RE2_0 rd1_0fff. RE2_11 ra51_11f.
         RE2_14 re1_14ff. RE2_2 ra51_2ff. RE2_5 ra51_5ff.
         RE2_8 ra51_8ff. RE3 ra2fffff. RE3A_2 ra51_2ff.
         RE3B_11 ra51_11f. RE3B_14 ra53afff. RE3B_5 ra52_5ff.
         RE3B_8 ra51_8ff. RE3_0 rd1_0fff. RE3_11 ra51_11f.
         RE3_14 re1_14ff. RE3_2 ra51_2ff. RE3_5 ra51_5ff.
         RE3_8 ra51_8ff. RE4 ra2fffff. RE4A_2 ra51_2ff.
         RE4B_11 ra51_11f. RE4B_14 ra53afff. RE4B_5 ra52_5ff.
         RE4B_8 ra51_8ff. RE4_0 rd1_0fff. RE4_11 ra51_11f.
         RE4_14 re1_14ff. RE4_2 ra51_2ff. RE4_5 ra51_5ff.
         RE4_8 ra51_8ff. RE5 ra2fffff. RE5A_2 ra51_2ff.
         RE5B_11 ra51_11f. RE5B_14 ra53afff. RE5B_5 ra52_5ff.
         RE5B_8 ra51_8ff. RE5_0 rd1_0fff. RE5_11 ra51_11f.
         RE5_14 re1_14ff. RE5_2 ra51_2ff. RE5_5 ra51_5ff.
         RE5_8 ra51_8ff. RE6 ra2fffff. RE610_11 ra51_11f.
         RE610_14 ra53afff. RE610_5 ra52_5ff. RE610_8 ra51_8ff.
         RE62_11 ra51_11f. RE62_14 ra53afff. RE62_5 ra52_5ff.
         RE62_8 ra51_8ff. RE63_11 ra51_11f. RE63_14 ra53afff.
         RE63_5 ra52_5ff. RE63_8 ra51_8ff. RE64_11 ra51_11f.
         RE64_14 ra53afff. RE64_5 ra52_5ff. RE64_8 ra51_8ff.
         RE65_11 ra51_11f. RE65_14 ra53afff. RE65_5 ra52_5ff.
         RE65_8 ra51_8ff. RE66_5 ra52_5ff. RE67_11 ra51_11f.
         RE67_14 ra53afff. RE67_5 ra52_5ff. RE67_8 ra51_8ff.
         RE6A_2 ra51_2ff. RE6B_11 ra51_11f. RE6B_14 ra53afff.
         RE6B_5 ra52_5ff. RE6B_8 ra51_8ff. RE6_0 rd1_0fff.
         RE6_11 ra51_11f. RE6_14 re1_14ff. RE6_2 ra51_2ff.
         RE6_5 ra51_5ff. RE6_8 ra51_8ff. RE7_11 ra51_11f.
         RE7_14 ra53afff. RE7_2 ra51_2ff. RE7_5 ra51_5ff.
         RE7_8 ra51_8ff. RE8_11 ra51_11f. RE8_14 ra53afff.
         RE8_2 ra51_2ff. RE8_5 ra51_5ff. RE8_8 ra51_8ff.
         RE9_11 ra51_11f. RE9_14 ra53afff. RE9_2 ra51_2ff.
         RE9_5 ra51_5ff. RE9_8 ra51_8ff. RELATION relatiof.
         RELATYPE relatypf. RESIC_11 resic_1f. RESIDENC residenf.
         RESIDENC_14 residenf. RESID_0 resid_0f. RESID_2 resid_2f.
         RESID_5 resid_5f. RESID_8 resid_8f. RF1 ra53afff.
         RF10 ra53afff. RF101A ra53afff. RF101B ra53afff.
         RF101C ra53afff. RF101D ra53afff. RF101E ra53afff.
         RF101F ra53afff. RF101G ra53afff. RF101H ra53afff.
         RF101I ra53afff. RF101J ra53afff. RF101K ra53afff.
         RF101_0 rd1_0fff. RF101_11 ra52_11f. RF101_14 ra53afff.
         RF101_8 ra52_8ff. RF102_0 rd1_0fff. RF102_11 ra52_11f.
         RF102_14 ra53afff. RF102_8 ra52_8ff. RF1030A_11 ra52_11f.
         RF1030_11 ra52_11f. RF1031A_11 ra52_11f. RF1031_11 ra52_11f.
         RF1032_11 ra52_11f. RF1033_11 ra52_11f. RF103A_11 ra52_11f.
         RF103A_14 ra53afff. RF103A_5 ra52_5ff. RF103A_8 ra52_8ff.
         RF103B_11 ra52_11f. RF103B_14 ra53afff. RF103B_5 ra52_5ff.
         RF103B_8 ra52_8ff. RF103C_11 ra52_11f. RF103C_14 ra53afff.
         RF103C_5 ra52_5ff. RF103C_8 ra52_8ff. RF103D_11 ra52_11f.
         RF103D_14 ra53afff. RF103D_5 ra52_5ff. RF103D_8 ra52_8ff.
         RF103E_11 ra52_11f. RF103E_14 ra53afff. RF103E_5 ra52_5ff.
         RF103E_8 ra52_8ff. RF103F_11 ra52_11f. RF103F_14 ra53afff.
         RF103F_5 ra52_5ff. RF103F_8 ra52_8ff. RF103G_11 ra52_11f.
         RF103G_14 ra53afff. RF103G_5 ra52_5ff. RF103G_8 ra52_8ff.
         RF103H_11 ra52_11f. RF103H_14 ra53afff. RF103H_5 ra52_5ff.
         RF103H_8 ra52_8ff. RF103I_11 ra52_11f. RF103I_14 ra53afff.
         RF103I_5 ra52_5ff. RF103I_8 ra52_8ff. RF103J_11 ra52_11f.
         RF103J_14 ra53afff. RF103J_5 ra52_5ff. RF103J_8 ra52_8ff.
         RF103K_11 ra52_11f. RF103K_14 ra53afff. RF103K_5 ra52_5ff.
         RF103K_8 ra52_8ff. RF103L_11 ra52_11f. RF103L_14 ra53afff.
         RF103L_5 ra52_5ff. RF103L_8 ra52_8ff. RF103M_11 ra52_11f.
         RF103M_14 ra53afff. RF103M_5 ra52_5ff. RF103M_8 ra52_8ff.
         RF104_14 ra53afff. RF104_2 ra52_2ff. RF105_14 ra53afff.
         RF105_2 ra52_2ff. RF10_11 ra52_11f. RF10_14 ra53afff.
         RF10_8 ra52_8ff. RF111_2 ra51_2ff. RF111_5 ra51_5ff.
         RF111_8 ra51_8ff. RF112_2 ra51_2ff. RF112_5 ra51_5ff.
         RF112_8 ra51_8ff. RF113_2 ra51_2ff. RF113_5 ra51_5ff.
         RF113_8 ra51_8ff. RF12_11 ra52_11f. RF12_14 ra53afff.
         RF12_2 ra52_2ff. RF12_5 ra52_5ff. RF12_8 ra52_8ff.
         RF13_11 ra52_11f. RF13_14 ra53afff. RF13_2 ra52_2ff.
         RF13_5 ra52_5ff. RF13_8 ra52_8ff. RF14_11 ra51_11f.
         RF14_14 ra53afff. RF14_5 ra51_5ff. RF14_8 ra51_8ff.
         RF15_11 ra51_11f. RF15_14 ra53afff. RF15_5 ra51_5ff.
         RF15_8 ra51_8ff. RF1_14 ra53afff. RF1_8 ra52_8ff.
         RF2 ra53afff. RF211_11 ra52_11f. RF211_14 ra53afff.
         RF211_2 ra52_2ff. RF211_5 ra52_5ff. RF211_8 ra52_8ff.
         RF21_11 ra52_11f. RF21_14 ra53afff. RF21_2 ra51_2ff.
         RF21_8 ra52_8ff. RF221_11 ra52_11f. RF221_14 ra53afff.
         RF22_11 ra52_11f. RF22_14 ra53afff. RF22_2 ra52_2ff.
         RF22_5 ra52_5ff. RF22_8 ra52_8ff. RF23_11 ra52_11f.
         RF23_14 ra53afff. RF23_2 ra52_2ff. RF23_5 ra52_5ff.
         RF23_8 ra52_8ff. RF24_11 ra52_11f. RF24_14 ra53afff.
         RF25A_14 ra53afff. RF25B_11 ra52_11f. RF25B_14 ra53afff.
         RF25_11 ra52_11f. RF26_11 ra52_11f. RF26_14 ra53afff.
         RF27_11 ra52_11f. RF27_14 ra53afff. RF2_14 ra53afff.
         RF2_8 ra52_8ff. RF31 ra2fffff. RF31_0 rd1_0fff.
         RF31_11 ra51_11f. RF31_14 ra2fffff. RF31_2 ra51_2ff.
         RF31_5 ra51_5ff. RF31_8 ra51_8ff. RF32 ra2fffff.
         RF32_11 ra51_11f. RF32_14 ra2fffff. RF32_2 ra51_2ff.
         RF32_5 ra51_5ff. RF32_8 ra51_8ff. RF33_0 ra51_0ff.
         RF33_11 ra51_11f. RF33_14 ra53afff. RF33_2 ra51_2ff.
         RF33_5 ra51_5ff. RF33_8 ra51_8ff. RF340_11 ra51_11f.
         RF340_14 ra53afff. RF340_5 ra51_5ff. RF340_8 ra51_8ff.
         RF34_0 rd1_0fff. RF34_11 ra51_11f. RF34_14 ra53afff.
         RF34_2 ra51_2ff. RF34_5 ra51_5ff. RF34_8 ra51_8ff.
         RF35_11 ra51_11f. RF35_14 ra53afff. RF35_2 ra51_2ff.
         RF35_5 ra51_5ff. RF35_8 ra51_8ff. RF41 ra2fffff.
         RF41A_11 ra52_11f. RF41A_14 ra53afff. RF41B_11 ra52_11f.
         RF41B_14 ra53afff. RF41_0 rd1_0fff. RF41_11 ra51_11f.
         RF41_14 ra2fffff. RF41_2 ra51_2ff. RF41_5 ra51_5ff.
         RF41_8 ra51_8ff. RF42 ra53afff. RF42_11 ra52_11f.
         RF42_14 ra53afff. RF42_5 ra52_5ff. RF42_8 ra52_8ff.
         RF43A ra53afff. RF43A_11 ra52_11f. RF43A_14 ra53afff.
         RF43A_5 ra52_5ff. RF43A_8 ra52_8ff. RF43B ra53afff.
         RF43B_11 ra52_11f. RF43B_14 ra53afff. RF43B_5 ra52_5ff.
         RF43B_8 ra52_8ff. RF43C ra53afff. RF43C_11 ra52_11f.
         RF43C_14 ra53afff. RF43C_5 ra52_5ff. RF43C_8 ra52_8ff.
         RF43D ra53afff. RF43D_11 ra52_11f. RF43D_14 ra53afff.
         RF43D_5 ra52_5ff. RF43D_8 ra52_8ff. RF44 ra53afff.
         RF44_11 ra52_11f. RF44_14 ra53afff. RF44_5 ra52_5ff.
         RF44_8 ra52_8ff. RF45 ra53afff. RF45_11 ra52_11f.
         RF45_14 ra53afff. RF45_2 ra52_2ff. RF45_5 ra52_5ff.
         RF45_8 ra52_8ff. RF46_11 ra52_11f. RF46_14 ra53afff.
         RF46_5 ra52_5ff. RF46_8 ra52_8ff. RF47_11 rd1_11ff.
         RF47_14 ra53afff. RF47_8 rd1_8fff. RF5 ra2fffff.
         RF5_0 rd1_0fff. RF5_11 ra51_11f. RF5_14 ra2fffff.
         RF5_2 ra51_2ff. RF5_5 ra51_5ff. RF5_8 ra51_8ff.
         RF61 ra2fffff. RF610_11 ra51_11f. RF610_14 ra53afff.
         RF610_5 ra51_5ff. RF610_8 ra51_8ff. RF61_0 rd1_0fff.
         RF61_11 ra51_11f. RF61_14 ra2fffff. RF61_2 ra51_2ff.
         RF61_5 ra51_5ff. RF61_8 ra51_8ff. RF62 ra53afff.
         RF62_11 ra51_11f. RF62_14 ra53afff. RF62_8 ra51_8ff.
         RF63 ra53afff. RF63_11 ra51_11f. RF63_14 ra53afff.
         RF63_8 ra51_8ff. RF64 ra2fffff. RF64_0 ra51_0ff.
         RF64_11 ra51_11f. RF64_14 ra2fffff. RF64_2 ra51_2ff.
         RF64_5 ra51_5ff. RF64_8 ra51_8ff. RF65 ra2fffff.
         RF651A1_11 ra52_11f. RF651A1_14 ra53afff. RF651A2_11 ra52_11f.
         RF651A2_14 ra53afff. RF651A_5 ra51_5ff. RF651A_8 ra51_8ff.
         RF651B1_11 ra52_11f. RF651B1_14 ra53afff. RF651B2_11 ra52_11f.
         RF651B2_14 ra53afff. RF651B_5 ra51_5ff. RF651B_8 ra51_8ff.
         RF6521_11 ra52_11f. RF6521_14 ra53afff. RF652A_11 ra52_11f.
         RF652A_14 ra53afff. RF652B_11 ra52_11f. RF652B_14 ra53afff.
         RF652_5 ra52_5ff. RF652_8 ra51_8ff. RF65_0 ra51_0ff.
         RF65_2 ra51_2ff. RF66_11 ra52_11f. RF66_14 ra53afff.
         RF66_8 ra52_8ff. RF71 rf71ffff. RF71_11 ra52_11f.
         RF71_14 ra53afff. RF71_5 ra51_5ff. RF71_8 ra52_8ff.
         RF72 ra53afff. RF721_11 ra52_11f. RF721_14 ra53afff.
         RF721_5 ra52_5ff. RF721_8 ra52_8ff. RF722_11 ra52_11f.
         RF722_14 ra53afff. RF722_5 ra52_5ff. RF722_8 ra52_8ff.
         RF73 ra53afff. RF73_11 ra52_11f. RF73_14 ra53afff.
         RF73_5 ra52_5ff. RF73_8 ra52_8ff. RF74_11 ra51_11f.
         RF74_14 ra2fffff. RF74_5 ra51_5ff. RF74_8 ra51_8ff.
         RF81 ra53afff. RF81_11 ra52_11f. RF81_14 ra53afff.
         RF81_5 ra51_5ff. RF81_8 ra52_8ff. RF82 ra53afff.
         RF821_11 ra52_11f. RF821_14 ra53afff. RF821_5 ra52_5ff.
         RF821_8 ra52_8ff. RF822_11 ra52_11f. RF822_14 ra53afff.
         RF822_5 ra52_5ff. RF822_8 ra52_8ff. RF83 ra53afff.
         RF83_11 ra52_11f. RF83_14 ra53afff. RF83_5 ra52_5ff.
         RF83_8 ra52_8ff. RF84 ra53afff. RF84_11 ra51_11f.
         RF84_14 ra53afff. RF84_8 ra51_8ff. RF85_11 ra51_11f.
         RF85_14 ra2fffff. RF85_5 ra51_5ff. RF85_8 ra51_8ff.
         RF86_11 ra51_11f. RF86_14 ra2fffff. RF86_5 ra51_5ff.
         RF86_8 ra51_8ff. RF9 ra53afff. RF901A_11 ra52_11f.
         RF901_11 ra52_11f. RF902A_11 ra52_11f. RF902_11 ra52_11f.
         RF91 ra53afff. RF91_11 ra52_11f. RF91_14 ra53afff.
         RF91_8 ra52_8ff. RF92A ra53afff. RF92A_11 ra52_11f.
         RF92A_14 ra53afff. RF92A_5 ra52_5ff. RF92A_8 ra52_8ff.
         RF92B ra53afff. RF92B_11 ra52_11f. RF92B_14 ra53afff.
         RF92B_5 ra52_5ff. RF92B_8 ra52_8ff. RF92C ra53afff.
         RF92C_11 ra52_11f. RF92C_14 ra53afff. RF92C_5 ra52_5ff.
         RF92C_8 ra52_8ff. RF92D ra53afff. RF92D_11 ra52_11f.
         RF92D_14 ra53afff. RF92D_5 ra52_5ff. RF92D_8 ra52_8ff.
         RF92E ra53afff. RF92E_11 ra52_11f. RF92E_14 ra53afff.
         RF92E_5 ra52_5ff. RF92E_8 ra52_8ff. RF92F ra53afff.
         RF92F_11 ra52_11f. RF92F_14 ra53afff. RF92F_5 ra52_5ff.
         RF92F_8 ra52_8ff. RF92G ra53afff. RF92G_11 ra52_11f.
         RF92G_14 ra53afff. RF92G_5 ra52_5ff. RF92G_8 ra52_8ff.
         RF92H ra53afff. RF92H_11 ra52_11f. RF92H_14 ra53afff.
         RF92H_5 ra52_5ff. RF92H_8 ra52_8ff. RF92I ra53afff.
         RF92I_11 ra52_11f. RF92I_14 ra53afff. RF92I_5 ra52_5ff.
         RF92I_8 ra52_8ff. RF92J ra53afff. RF92J_11 ra52_11f.
         RF92J_14 ra53afff. RF92J_5 ra52_5ff. RF92J_8 ra52_8ff.
         RF92K ra53afff. RF92K_5 ra52_5ff. RF92L ra53afff.
         RF92M ra53afff. RF92N ra53afff. RF92O ra53afff.
         RF9_11 ra52_11f. RF9_5 ra52_5ff. RF9_8 ra52_8ff.
         RG01_11 ra52_11f. RG01_14 ra53afff. RG01_5 ra51_5ff.
         RG02_11 ra51_11f. RG02_14 ra53afff. RG02_5 ra51_5ff.
         RG02_8 ra51_8ff. RG101_2 ra51_2ff. RG101_8 ra51_8ff.
         RG102_8 ra51_8ff. RG1061_11 ra52_11f. RG1061_14 ra53afff.
         RG1062_11 ra52_11f. RG1062_14 ra53afff. RG1063_11 ra52_11f.
         RG1063_14 ra53afff. RG106_11 ra52_11f. RG106_14 ra53afff.
         RG13 ra51_8ff. RG130_11 ra52_11f. RG130_14 ra53afff.
         RG130_5 ra51_5ff. RG13_0 ra51_0ff. RG13_11 ra52_11f.
         RG13_14 ra53afff. RG13_2 ra51_2ff. RG13_5 ra51_5ff.
         RG14A_11 ra51_11f. RG14A_14 ra53afff. RG14A_5 ra52_5ff.
         RG14A_8 ra51_8ff. RG14B_11 ra51_11f. RG14B_14 ra53afff.
         RG14B_5 ra52_5ff. RG14B_8 ra51_8ff. RG14C_11 ra51_11f.
         RG14C_14 ra53afff. RG14C_5 ra52_5ff. RG14C_8 ra51_8ff.
         RG15A_8 ra51_8ff. RG15B_8 ra51_8ff. RG15C_8 ra51_8ff.
         RG15D_8 ra51_8ff. RG15E_8 ra51_8ff. RG15F_8 ra51_8ff.
         RG15G_8 ra51_8ff. RG15H_8 ra51_8ff. RG15I_8 ra51_8ff.
         RG15J_8 ra51_8ff. RG15K_8 ra51_8ff. RG15L_8 ra51_8ff.
         RG15M_8 ra51_8ff. RG15N_8 ra51_8ff. RG15O_8 ra51_8ff.
         RG15P_8 ra51_8ff. RG15Q_8 ra51_8ff. RG15R_8 ra51_8ff.
         RG15S_8 ra51_8ff. RG15T_8 ra51_8ff. RG15U_8 ra51_8ff.
         RG15V_8 ra51_8ff. RG16 ra2fffff. RG17A ra2fffff.
         RG17B ra2fffff. RG17C ra2fffff. RG17D ra2fffff.
         RG17E ra2fffff. RG17F rg17ffff. RG17G ra2fffff.
         RG17H ra2fffff. RG17I ra2fffff. RG17J ra53afff.
         RG17K ra2fffff. RG17L ra2fffff. RG17M ra2fffff.
         RG17N ra2fffff. RG1_11 ra52_11f. RG1_14 ra53afff.
         RG21_11 ra51_11f. RG21_14 ra53afff. RG21_8 ra51_8ff.
         RG22_11 ra51_11f. RG22_14 ra53afff. RG22_8 ra51_8ff.
         RG23_11 ra52_11f. RG23_14 ra53afff. RG24A_11 ra52_11f.
         RG24A_14 ra53afff. RG24_11 ra52_11f. RG24_14 ra53afff.
         RG25A_11 ra52_11f. RG25A_14 ra53afff. RG25_11 ra52_11f.
         RG25_14 ra53afff. RG3_11 ra51_11f. RG3_14 ra53afff.
         RG3_8 ra51_8ff. RG4A_11 ra52_11f. RG4A_14 ra53afff.
         RG4B_11 ra52_11f. RG4B_14 ra53afff. RG4_11 ra51_11f.
         RG4_14 ra53afff. RG4_8 ra51_8ff. RG51_8 ra51_8ff.
         RG52_8 ra51_8ff. RG5_11 ra52_11f. RG5_14 ra53afff.
         S1 s1ffffff. S1_0 s1_0ffff. S2 s2ffffff.
         S2_0 s1_0ffff. S3 s2ffffff. VAGE_0 month_0f.
         VAGE_11 yearin_f. VAGE_2 vage_2ff. VAGE_5 vage_5ff.
         YEARIN_11 yearin_f.
    ;
*/

RUN ;
