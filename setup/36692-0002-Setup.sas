/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0002: 2000-2014 LONGITUDINAL DATA, VERSION 1)
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
 | "c:\temp\36692-0002-data.txt").
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
VALUE f41_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3) divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
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
VALUE f34_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) didn''t answer'
                9='(9) missing';
VALUE c22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
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
VALUE a54a_2ff  -9='(-009) lost to follow-up in the 2002 survey'
                -6='(-006) survivors only, not applicable to the deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d2actdaf  -9='(-09) lost to follow-up in the 2002 survey'
                -7='(-07) the deceased persons only, not applicable to survivors'
                0='(000) activity-hour is longer than bedridden-hour in a day' 888='(888) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
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
VALUE f2ffffff  0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) agriculture, forest, animal husbandry' 3='(3) fishery worker'
                4='(4) industrial worker' 5='(5) commercial or service worker' 6='(6) military personnel'
                7='(7) housework' 8='(8) others' 9='(9) missing';
VALUE f103a2_f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE d2diseaf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) hypertension' 2='(02) diabetes' 3='(03) heart disease' 4='(04) stroke or cvd'
                5='(05) bronchitis, emphysema, pneumonia,asthma' 6='(06) tuberculosis'
                7='(07) glaucoma, cataract' 8='(08) prostate tumor' 9='(09) gastric or duodenal ulcer'
                10='(10) parkinson''s disease' 11='(11) bedsore' 12='(12) dementia' 13='(13) psychosis'
                14='(14) neurosis' 15='(15) arthritis' 16='(16) others'
                88='(88) bedridden all the time but no disease information' 99='(99) missing';
VALUE d2generf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) one generation' 2='(2) two generations' 3='(3) three generations'
                4='(4)  four and more generations' 9='(9) missing';
VALUE month_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 99='(99) missing';
VALUE f92a5_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d2countf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors';
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
VALUE vage_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased';
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
VALUE f64fffff  1='(1) public medicare' 2='(2) self' 3='(3) family and children'
                4='(4) others' 9='(9) missing';
VALUE d2outdof  -9='(-09) lost to follow-up in the 2002 survey'
                -7='(-07) the deceased persons only, not applicable to survivors' 888='(888) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
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
VALUE g15p1fff  1='(1) difficult to classify' 2='(2) no' 3='(3) don''t know'
                4='(4) mental disease' 5='(5) orthopedic disease' 6='(6) internal medical disease'
                7='(7) dermatosis' 8='(8) five organs diseases' 9='(9) gynecological disease';
VALUE a52fffff  -1='(-1) not applicable' 99='(99) missing';
VALUE d5dplacf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE e67_14ff  -1='(-01) not applicable' 888='(888) not able to answer'
                998='(998) more than 1000' 999='(999) missing';
VALUE d2incomf  -9='(-0009) lost to follow-up in the 2002 survey'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99999='(99999) missing';
VALUE d4drug1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
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
VALUE d2persof  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE c55_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2)  hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
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
VALUE d2toilff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in toileting' 2='(2) partially independent in toileting '
                3='(3) fully dependent in toileting ' 9='(9) missing';
VALUE f21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE d4drug1_2f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f41_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f84fffff  0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2)  agriculture, forest, animal husbandry' 3='(3) fishery worker'
                4='(4) industrial worker' 5='(5) commercial or service worker' 6='(6) military personnel'
                7='(7) housework' 8='(8) others' 9='(9) missing';
VALUE f64a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE d2causef  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) malignant tumor(cancer)' 2='(02) cvd' 3='(03) heart disease'
                4='(04) respiratory and digest disease' 5='(05) injury and poisoned'
                6='(06) endocrine, nutritional, metabolic, immune diseases'
                7='(07) urinary and reproductive diseases' 8='(08) dementia' 9='(09) neurosis'
                10='(10) tuberculosis (tb)' 11='(11) infectious disease(except tb)' 12='(12) accident'
                13='(13) others' 14='(14) UNDOCUMENTED CODE'
                66='(66) natural death with no reported disease' 88='(88) don''t know' 99='(99) missing';
VALUE b11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) unable to answer';
VALUE e63_14ff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g14a2_5f  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden all the year around' 999='(999) missing';
VALUE c52fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
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
VALUE h1ffffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
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
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially';
VALUE d2didayf  -9='(-09) lost to follow-up in the 2002 survey'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 887='(887) bedridden not all the time but without information'
                888='(888) bedridden all the time' 889='(889) don''t know'
                998='(998) more than 1000 days' 999='(999) missing';
VALUE g12_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 88='(88) can''t turn around'
                99='(99) missing';
VALUE e6_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
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
VALUE a41_14ff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
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
VALUE replacef  -1='(-1) not applicable' 1='(1) to replace the deceased elder'
                2='(2) to replace the migrated elder' 3='(3) to replace the refused elder'
                9='(9)  missing';
VALUE f211_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
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
VALUE a54affff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE e4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d8uncdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g81_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right hand only'
                2='(2) left hand only' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
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
VALUE f5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchildren' 8='(08) other relatives' 9='(09) friends and neighbors'
                10='(10) social services' 11='(11) live-in care giver' 12='(12) nobody'
                88='(88) don''t know' 99='(99) missing';
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
VALUE d2livarf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE d5batdaf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE g13fffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
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
VALUE f211_14f  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) don''t know' 9='(9) missing';
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
VALUE d11inspf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE c22fffff  -1='(-1) not applicable, i.e.,repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE f103a5__1f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE dth02_0f  -9='(-9) lost to follow-up at the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2005 survey' 1='(1) died before the 2005 survey';
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
VALUE f92a2fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
                9='(9) missing';
VALUE h22fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE c16_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 88='(88) unable to answer';
VALUE d5livarf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE d4mt2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
VALUE d2provif  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 11='(11) beijing'
                12='(12) tianjian' 13='(13) hebei' 14='(14) shanxi' 21='(21) liaoning' 22='(22) jilin'
                23='(23) helongjiang' 31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang'
                34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan'
                42='(42) hubei' 43='(43) henan' 44='(44) guangdong' 45='(45) guangxi' 50='(50) chongqing'
                51='(51) sichuan' 61='(61) shaanxi';
VALUE g83_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE d2dplacf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institution' 4='(4) others' 8='(8) don''t know' 9='(9) missing';
VALUE month_5f  -9='(-9) lost to follow-up at the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
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
VALUE c54_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE d2marryf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married and living with spouse' 2='(2)  married but separate with spouse'
                3='(3) divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
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
VALUE b121_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) unable to answer';
VALUE d91_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
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
VALUE a532_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE f34_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
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
VALUE re1_14ff  0='(0) without proxy';
VALUE d2illfff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                87='(87) bedridden not all the time but without information'
                88='(88) bedridden all the time' 99='(99) missing';
VALUE c54_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
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
VALUE f5ffffff  1='(1) spouse' 2='(2) children and their spouses'
                3='(3) grandchild and their spouses' 4='(4) other family members' 5='(5) friends'
                6='(6) social services' 7='(7) caregiver' 8='(8) nobody' 9='(9) missing';
VALUE d11a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE f64i_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE e2_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3) assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE f61fffff  1='(1) yes' 2='(2) no' 3='(3)  not sick recently' 9='(9) missing';
VALUE h5_14fff  888='(888) don''t know';
VALUE d77_14ff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
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
VALUE f1031b2f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                0='(000) UNDOCUMENTED CODE' 888='(888) do not know' 999='(999) missing';
VALUE d6c_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water (including purified water)' 9='(9) missing';
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
VALUE d11yr1ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 99='(99) missing';
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
VALUE c11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to answer';
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
VALUE d2finanf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relatives'
                6='(6) local government or community' 7='(7) own work' 8='(8) others' 9='(9) missing';
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
VALUE a531_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives '
                5='(5) other non-relatives' 8='(8) don''t know' 9='(9) missing';
VALUE g7_11fff  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                999='(999) missing';
VALUE d12_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE a54b_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
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
VALUE d11whopf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE g13_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 88='(88) bedridden'
                99='(99) missing';
VALUE a53a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g4a_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e2_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE a41fffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                24='(24) UNDOCUMENTED CODE' 28='(28) UNDOCUMENTED CODE' 29='(29) UNDOCUMENTED CODE'
                30='(30) UNDOCUMENTED CODE' 31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang'
                34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan'
                42='(42) hubei' 43='(43) henan' 44='(44) guangdong' 45='(45) guangxi' 46='(46) hainan'
                50='(50) chongqing' 51='(51) sichuan' 52='(52) guizhou' 53='(53) yunnan' 54='(54) tibet'
                61='(61) shaanxi' 62='(62) gansu' 63='(63) qinghai' 64='(64) ningxia' 65='(65) xinjiang'
                71='(71) taiwan' 81='(81) hong kong' 90='(90) north korea' 91='(91) south korea'
                92='(92) berman' 93='(93) indonesia' 94='(94) japan' 95='(95) vietnam' 96='(96) others'
                98='(98) don''t know' 99='(99) missing';
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
VALUE dth05_0f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2008 survey' 1='(1) died before the 2008 survey';
VALUE d11dplaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE e5_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE e3_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
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
VALUE g4_2ffff  -9='(-9) lost to follow-up in the 2000 survey'
                -6='(-6) it is for survivors, not applicable for the deceased persons' 1='(1) right hand'
                2='(2) left hand' 9='(9) missing';
VALUE h1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite using hearing aid' 4='(4) can''t' 9='(9) missing';
VALUE c54_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d5feedff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in eating' 2='(2) partially independent in eating'
                3='(3) fully dependent in eating' 9='(9) missing';
VALUE c31d_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to do' 9='(9) missing';
VALUE e4_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE ra51_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d2dresff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in dressing' 2='(2) partially independent in dressing'
                3='(3) fully dependent in dressing' 9='(9) missing';
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
VALUE ra52_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
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
VALUE e63_5fff  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) do not know' 99999='(99999) missing';
VALUE f47_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE g1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) cannot see' 4='(4) blind'
                9='(9) missing';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do';
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
VALUE d11affff  1='(1) almost everyday' 2='(2) sometimes' 3='(3) never' 9='(9) missing';
VALUE c16fffff  88='(88) not able to answer';
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
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
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
VALUE g4ffffff  1='(1) right hand' 2='(2) lefthand' 9='(9) missing';
VALUE d14g4bff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE h71_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) children and their spouses' 3='(3) grandchildren and their spouses'
                4='(4) great grandchildren and their spouses' 5='(5) siblings'
                6='(6) parents/parents-in-law' 7='(7) caregivers' 8='(8) others' 9='(9) missing';
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
VALUE e3_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
VALUE d1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) rice'
                2='(2) corn (maize)' 3='(3) wheat (noodles and bread, etc.)' 4='(4) nice and wheat'
                5='(5) others';
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
VALUE h21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partly' 9='(9) missing';
VALUE d2sexfff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
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
VALUE f111_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(00) spouse'
                1='(01) sons and daughters-in-law' 2='(02) daughters and sons-in-law'
                3='(03) sons and daughters' 4='(04) grandchildren and their spouse' 5='(05) relatives'
                6='(06) friends/neighbors' 7='(07) social workers' 8='(08) matrons' 9='(09) nobody'
                99='(99) missing';
VALUE a53a1fff  -1='(-1) not applicable' 0='(0) spouse' 1='(1) child'
                2='(2) spouse of child' 3='(3) grandchild' 4='(4) spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d2feedff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in feeding' 2='(2) partially independent in feeding'
                3='(3) fully dependent in feeding' 9='(9) missing';
VALUE a537_14f  0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE e3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE d2_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE d85_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f41fffff  1='(1) currently married and living with spouse' 2='(2) separated'
                3='(3)  divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d5carpaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 9='(9) missing';
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
VALUE ra51ffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE f64_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconveniency in movement'
                4='(4) nobody to go with' 5='(5) don''t want to go to hospital' 6='(6) others'
                9='(9) missing';
VALUE d5marryf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d5_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) boiled water'
                2='(2) unboiled water' 9='(9) missing';
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
VALUE f103k2_f  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
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
VALUE g14a1fff  -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes'
                3='(03) heart diseases' 4='(04) stroke, cvd'
                5='(05)  bronchitis, emphysema, asthma, pneumonia' 6='(06) pulmonary tuberculosis'
                7='(07) cataract' 8='(08) glaucoma' 9='(09) cancer' 10='(10) prostate tumor'
                11='(11)  gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) arthritis' 15='(15) dementia' 16='(16) other'
                66='(66) natural senescence without reporting any disease' 89='(89) don''t know'
                99='(99) missing';
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
VALUE a53a1_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
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
VALUE g1063_1_1f  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d11a_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once a week' 3='(3) not weekly, but at least once a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE g132_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                88='(88) bedridden all the year around' 99='(99) missing';
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
VALUE d8batdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE f104_2ff  -9='(-09) lost to follow-up in the 2002 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable ' 888='(888) don''t know' 999='(999) missing';
VALUE e1_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
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
VALUE h22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE d5dirdaf  -9='(-09) lost to follow-up in the 2005 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 999='(999) missing';
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
VALUE d2wcfacf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE d8persof  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE a52_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
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
VALUE g51_2fff  -9='(-09) lost to follow-up in the 2002 survey'
                -6='(-06) survivors only, not applicable to the deceased persons' 999='(999) missing';
VALUE g1061_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) left' 2='(2) right'
                3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE g1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see' 4='(4) blind'
                9='(9) missing';
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
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000 to replace those lost-to fol'
                3='(3) new added elder in 2000' 4='(4) sibling of 1,2,3' 5='(5)  parent of 1,2,3';
VALUE d2beddaf  -9='(-09) lost to follow-up in the 2002 survey'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 998='(998) more than 1000 days'
                999='(999) missing';
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
VALUE ra2fffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
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
VALUE d2bedrif  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE d4mt2_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) almost every day'
                2='(2) occasionally' 3='(3) rarely or never' 9='(9) missing';
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
VALUE b21_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4) seldom' 5='(5) never' 8='(8) unable to answer';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
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
VALUE d2licdof  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) don''t know' 9='(9) missing';
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
VALUE g4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 9='(9) missing';
VALUE g9_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without using hands'
                2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE rd1fffff  0='(0) without proxy' 1='(1) with proxy';
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
VALUE g6_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) regular'
                2='(2) irregular' 9='(9) missing';
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
VALUE d2ffffff  88='(88) don''t know' 99='(99) missing';
VALUE f103a5_f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) co-reside with the sampled elder' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE f35_2fff  -9='(-0009) lost to follow-up in the 2002 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                99999='(99999) missing';
VALUE d6cfffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 9='(9) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                9='(9) missing';
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
VALUE e62_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 5='(5) don''t know' 9='(9) missing';
VALUE e0_14fff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) other' 9='(9) missing';
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
VALUE d2moveff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in indoor transferring'
                2='(2) partially independent in indoor transferring'
                3='(3) fully dependent in indoor transferring' 9='(9) missing';
VALUE f103c6_f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(00) UNDOCUMENTED CODE' 88='(88) don''t know' 99='(99) missing';
VALUE d8knddrf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE a53a3_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE g1061_1_1f  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE e1b_5fff  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -6='(-006) survivors only, not applicable to the deceased persons'
                -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
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
VALUE a532_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE c22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE g1ffffff  1='(1) can see and distinguish the break in the circle' 2='(2) can''t see'
                3='(3) blind' 9='(9) missing';
VALUE ra51_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE b28_14ff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE a53a2_2f  -9='(-09) lost to follow-up in the 2002 survey'
                -6='(-06) survivors only, not applicable to the deceased' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
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
VALUE f5_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                0='(00) UNDOCUMENTED CODE' 1='(01) spouse' 2='(02) sons and their spouses'
                3='(03) daughters and their spouses' 4='(04) grandchildren and their spouses'
                5='(05) relatives' 6='(06) friends/neighbors' 7='(07) social services' 8='(08) matron'
                9='(09) nobody' 99='(99) missing';
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
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad'
                8='(8) not able to answer';
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
VALUE f71fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE yearin_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased';
VALUE e67_8fff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE f62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) UNDOCUMENTED CODE' 8='(8) didn''t answer' 9='(9) missing';
VALUE g15a3_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
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
VALUE f12a_5ff  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE g511_8ff  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' 888='(888) don''t know'
                999='(999) missing';
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
VALUE d2respof  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) spouse'
                2='(2) child' 3='(3) spouse of child' 4='(4) grandchild and his/her spouse'
                5='(5) relative' 6='(6) other' 9='(9) missing';
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
VALUE d5bathff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
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
VALUE e4_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE d78a_14f  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE d5respof  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) parent'
                1='(1) spouse' 2='(2) child' 3='(3) spouse of a child'
                4='(4) grandchild or spouse of a grandchild' 5='(5) relative' 6='(6) neighbor'
                7='(7) social worker' 8='(8) other' 9='(9) missing';
VALUE d8bedrif  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
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
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE a532_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
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
VALUE d5toilff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in toileting' 2='(2) partially independent in toileting'
                3='(3) fully dependent in toileting' 9='(9) missing';
VALUE a534_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) do not know'
                9999='(9999) missing';
VALUE h1_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
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
VALUE g15a1_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9) missing';
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
VALUE g9_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
VALUE d8incomf  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE f1ffffff  -2='(-2) already asked in 1998 survey' 88='(88) don''t know'
                99='(99) missing';
VALUE resid_2f  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) city' 2='(2) town'
                3='(3) county';
VALUE e5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2)  occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE g14a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased persons' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
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
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g11_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE g131_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE d78a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE g14a2fff  -1='(-01) not applicable' 888='(888) bedridden all the year around'
                999='(999) missing';
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
VALUE g15p2fff  1='(1) yes' 2='(2) no' 5='(5) UNDOCUMENTED CODE' 9='(9) missing';
VALUE d71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE e1a_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) spouse of son' 4='(04) daughter'
                5='(05) spouse of daughter' 6='(06) son and daughter together' 7='(07) grandchildren'
                8='(08) other family members' 9='(09) social services' 10='(10) matron' 11='(11) none'
                99='(99) missing';
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
VALUE d2bathff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in bathing' 2='(2) partially independent in bathing'
                3='(3) fully dependent in bathing' 9='(9) missing';
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
VALUE d11bathf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE f31fffff  1='(1) retirement wage' 2='(2) spouse' 3='(3) children'
                4='(4) grandchildren' 5='(5) other relatives' 6='(6) local government or community'
                7='(7) own work' 8='(8) others' 9='(9) missing';
VALUE a540_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE f651a_5f  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer';
VALUE d5generf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 9='(9) missing';
VALUE d5pcgdaf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE g15q1_1f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
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
VALUE d2residf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE ra52_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE e6_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE d5knddrf  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 9='(9) missing';
VALUE d2vmontf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE a541_14f  -1='(-001) not applicable' 8888='(8888) don''t know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE ra52_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
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
VALUE d6c_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 9='(9) missing';
VALUE ra52_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d4meat1f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                8='(8) don''t know' 9='(9) missing';
VALUE g14a1_2f  -9='(-09) lost to follow-up in the 2002 survey'
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
VALUE a542_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE a532_14f  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) do not know'
                9='(9) missing';
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
VALUE g15a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE f22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) 8888 "don''t know" 9999 "missing"';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d8bathff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE g9_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 9='(9) missing';
VALUE d5medcof  -9='(-0009) lost to follow-up in the 2005 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) do not know' 99999='(99999) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4)  seldom'
                5='(5) never' 8='(8)  not able to answer';
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
VALUE f33fffff  0='(00000) no other source' 99999='(99999) missing';
VALUE a532_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) missing';
VALUE d31_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) almost every day'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 9='(9) missing';
VALUE d5didayf  -9='(-009) lost to follow-up in the 2005 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 9999='(9999) missing';
VALUE d11doctf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE ra51_2ff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d5_5ffff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
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
VALUE d77_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) at much less risk'
                2='(2) at less risk' 3='(3) at the same risk' 4='(4) at higher risk'
                5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE f21_14ff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
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
VALUE f104_14f  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE a53a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) UNDOCUMENTED CODE' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE d2contff  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in continence' 2='(2) partially independent incontinence'
                3='(3) fully dependent in continence' 9='(9) missing';
VALUE f12a_2ff  -9='(-0009) lost to follow-up in the 2002 survey'
                -6='(-0006) survivors only, not applicable to the deceased persons'
                -1='(-0001) not applicable' 0='(00000) spouse' 99999='(99999) missing';
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
VALUE h3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) surprisingly healthy'
                2='(2) relatively healthy' 3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
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
VALUE f111a_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(00) spouse'
                1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) do not know' 99='(99) missing';
VALUE c22_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three objects correctly' 8='(8) unable to answer'
                9='(9) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 9='(9) missing';
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
VALUE g4b_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE a54b_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE d5dresff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) fully independent in dressing' 2='(2) partially independent in dressing'
                3='(3) fully dependent in dressing' 9='(9) missing';
VALUE d8finanf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE g15q3_1f  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE f65fffff  -1='(-1) not applicable (not sick)' 1='(1) no money'
                2='(2) far from hospital' 3='(3) inconvenience in movement' 4='(4) nobody to go with'
                5='(5) others' 9='(9) missing';
VALUE a530_14f  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 8='(8) don''t know' 9='(9) missing';
VALUE d2medicf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) yes, all the time' 2='(2) yes, sometimes' 3='(3) no' 4='(4) was not ill'
                8='(8) don''t know' 9='(9) missing';
VALUE d2doctof  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 8='(8) don''t know' 9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE e64_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) do not know' 9='(9) missing';
VALUE f31_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) retirement wages'
                2='(2) spouse' 3='(3) child(ren)' 4='(4) grandchild(ren' 5='(5) relative(s)'
                6='(6) local government or community' 7='(7) work' 8='(8)  others' 9='(9) missing';
VALUE f92a2_5f  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE f65_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' -1='(-1) not applicable'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconvenience in movement'
                4='(4) nobody to go with' 5='(5) don''t want to go to hospital (2002)' 6='(6) others'
                9='(9) missing';
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
VALUE d71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE dth11_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2014 survey' 1='(1) died before the 2014 survey';
VALUE a51_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE d2batdaf  -9='(-09) lost to follow-up in the 2002 survey'
                -7='(-07) the deceased persons only, not applicable to survivors'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE d11payif  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                8888='(08888) don''t know' 9998='(09998) more than 10000' 9999='(09999) missing'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d11wcfaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE f23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE d11resif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE d2cargif  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children and their spouses' 2='(2) grandchildren and their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social workers' 6='(6) nurse'
                7='(7) no body to take care' 8='(8) no need to take care' 9='(9) missing';
VALUE h22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE d2knddrf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer ' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE g12_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                88='(88) unable to make a turn' 99='(99) missing';
VALUE e4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
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
VALUE e65_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE h3_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
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
VALUE f45_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                0='(0) professional or technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) staff/service workers/ industrial workers' 3='(3) self-employer'
                4='(4) agricultural, forestry, animal husbandry, fishery personnel' 5='(5) housework'
                6='(6) military personnel' 7='(7) unemployed' 8='(8) others' 9='(9) missing';
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
VALUE f34fffff  1='(1) yes' 2='(2) no' 3='(3) so so' 8='(8) don''t know' 9='(9) missing';
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
VALUE g15a1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know' 9='(9)  missing';
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
VALUE a53e4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
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
VALUE dth00_0f  -9='(-9) lost to follow-up at the 2002 survey'
                0='(0) surviving at the 2002 survey' 1='(1) died before the 2002 survey';
VALUE monthinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 99='(99) missing';
VALUE f103k5_f  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d11g106f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
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
VALUE a43fffff  1='(1) urban' 2='(2) rural' 9='(9) missing';
VALUE e5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE g21fffff  99='(99) missing';
VALUE g81_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 9='(9) missing';
VALUE g3_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
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
VALUE s1ffffff  -1='(-1) not applicable' 1='(1) the elder''s age is not correct'
                2='(2) doubt about the elder''s age' 3='(3) have no idea about the elder''s age'
                4='(4) not sure for elder''s age' 5='(5) sure for elder''s age' 9='(9) missing';
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
VALUE a52_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE b11_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE f32fffff  1='(1) yes' 2='(2) no' 3='(3) so so' 8='(8) don''t know';
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
VALUE a53a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d71_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) yes' 2='(2) no'
                9='(9) missing';
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
VALUE d2hyperf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE f651a_8f  -9='(-0009) lost to follow-up in the 2008 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased persons'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d85_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) very strong liquor'
                2='(2) not  very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5) beer'
                6='(6) others' 9='(9) missing';
VALUE g132_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE f43a2_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE a51_2fff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased' 1='(1) with household members'
                2='(2) alone' 3='(3)  in an institution' 9='(9) missing';
VALUE d11medcf  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f64a_5ff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' 0='(0) no' 1='(1) yes'
                9='(9) missing';
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
VALUE h71_5fff  -9='(-9) lost to follow-up in the 2005 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -6='(-6) survivors only, not applicable to the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE d8residf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural' 8='(8) do not know' 9='(9) missing';
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
VALUE d2whopaf  -9='(-9) lost to follow-up in the 2002 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) free  public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) shared by children living with'
                5='(05)  shared by all children and grandchildren' 6='(06) cooperative medical scheme'
                7='(07) state or collectives subsidy' 8='(08) medical insurance' 9='(09) no money to pay'
                10='(10) others' 88='(88) don''t know' 99='(99) missing';
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
VALUE g14a2_2f  -9='(-09) lost to follow-up in the 2002 survey'
                -6='(-06) survivors only, not applicable to the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden' 999='(999) missing';
VALUE e7_2ffff  -9='(-9) lost to follow-up in the 2002 survey'
                -6='(-6) survivors only, not applicable to the deceased persons'
                1='(1) yes, independently' 2='(2) yes, but need some help' 3='(3) no, can''t'
                9='(9) missing';
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
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse'
                2='(2) child or spouse of children' 3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver' 8='(8) others' 9='(9) missing';
VALUE d8medicf  -9='(-9) lost to follow-up in the 2008 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 8='(8) don''t know' 9='(9) missing';
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

DATA data0002;
INFILE "&VERSION\DS0002\36692-0002-Data.txt" LRECL=9938;
INPUT
       ID 1-8                  MONTH00 9-10
        DAY00 11-12             V_BTHYR 13-16           V_BTHMON 17-18
        PROV 19-20              TYPE 21                 REPLACE 22-23
        RELATYPE 24-25          RESIDENC 26             TRUEAGE 27-29
        A1 30                   RA2 31-32               A2 33
        RA41 34-35              A41 36-37               RA42 38-39
        A42 40                  RA43 41-42              A43 43
        RA51 44                 A51 45                  RA52 46-47
        A52 48-49               RA53A 50-51             A53A1 52-53
        A53A2 54-56             A53A3 57-58             RA53B 59-60
        A53B1 61-62             A53B2 63-65             A53B3 66-67
        RA53C 68-69             A53C1 70-71             A53C2 72-74
        A53C3 75-76             RA53D 77-78             A53D1 79-80
        A53D2 81-83             A53D3 84-85             RA53E 86-87
        A53E1 88-89             A53E2 90-92             A53E3 93-94
        RA53F 95-96             A53F1 97-98             A53F2 99-101
        A53F3 102-103           RA53G 104-105           A53G1 106-107
        A53G2 108-110           A53G3 111-112           RA53H 113-114
        A53H1 115-116           A53H2 117-119           A53H3 120-121
        RA53I 122-123           A53I1 124-125           A53I2 126-128
        A53I3 129-130           RA53J 131-132           A53J1 133-134
        A53J2 135-137           A53J3 138-139           RA53K 140-141
        A53K1 142-143           A53K2 144-146           A53K3 147-148
        RA53L 149-150           A53L1 151-152           A53L2 153-155
        A53L3 156-157           RA54 158-159            A54A 160-163
        A54B 164-165            B11 166                 B12 167
        B21 168                 B22 169                 B23 170
        B24 171                 B25 172                 B26 173
        B27 174                 C11 175                 C12 176
        C13 177                 C14 178                 C15 179
        C16 180-181             C21A 182                C21B 183
        C21C 184                C22 185-186             C31A 187
        C31B 188                C31C 189                C31D 190
        C31E 191                C32 192                 C41A 193
        C41B 194                C41C 195                C51A 196
        C51B 197                C52 198                 C53A 199
        C53B 200                C53C 201                C54 202
        C55 203-204             RD1 205                 D1 206
        RD2 207                 D2 208-209              RD31 210
        D31 211                 RD32 212                D32 213
        RD4MEAT 214             D4MEAT1 215             D4MEAT2 216
        RD4FISH 217             D4FISH1 218             D4FISH2 219
        RD4EGG 220              D4EGG1 221              D4EGG2 222
        RD4BEAN 223             D4BEAN1 224             D4BEAN2 225
        RD4VEG 226              D4VEG1 227              D4VEG2 228
        RD4SUGA 229             D4SUGA1 230             D4SUGA2 231
        RD4TEA 232              D4TEA1 233              D4TEA2 234
        RD4GARL 235             D4GARL1 236             D4GARL2 237
        RD5 238                 D5 239                  RD6 240
        D6A 241                 D6B 242                 D6C 243
        RD71 244                D71 245                 RD72 246-247
        D72 248                 RD73 249-250            D73 251-253
        RD74 254-255            D74 256-258             RD75 259-260
        D75 261-262             RD81 263                D81 264
        RD82 265-266            D82 267                 RD83 268-269
        D83 270-272             RD84 273-274            D84 275-277
        RD85 278-279            D85 280-281             RD86 282-283
        D86 284-285             RD91 286                D91 287
        RD92 288-289            D92 290                 RD93 291-292
        D93 293-295             RD94 296-297            D94 298-300
        RD101 301               D101 302                RD102 303-304
        D102 305-307            RD103 308-309           D103 310-312
        RD11A 313               D11A 314                RD11B 315
        D11B 316                RD11C 317               D11C 318
        RD11D 319               D11D 320                RD11E 321
        D11E 322                RD11F 323               D11F 324
        RD11G 325               D11G 326                RD11H 327
        D11H 328                RE1 329                 E1 330
        RE2 331                 E2 332                  RE3 333
        E3 334                  RE4 335                 E4 336
        RE5 337                 E5 338                  RE6 339
        E6 340                  RF1 341-342             F1 343-344
        RF2 345-346             F2 347                  RF31 348
        F31 349                 F32 350                 RF33 351
        F33 352-356             RF34 357                F34 358
        RF41 359                F41 360                 RF42 361-362
        F42 363-364             RF43A 365-366           F43A1 367-369
        F43A2 370-371           F43A3 372-374           F43A4 375-376
        RF43B 377-378           F43B1 379-381           F43B2 382-383
        F43B3 384-386           F43B4 387-388           RF43C 389-390
        F43C1 391-393           F43C2 394-395           F43C3 396-398
        F43C4 399-400           RF43D 401-402           F43D1 403-405
        F43D2 406-407           F43D3 408-410           F43D4 411-412
        RF44 413-414            F44 415-417             RF45 418-419
        F45 420-421             RF5 422                 F5 423
        RF61 424                F61 425                 RF62 426-427
        F62 428                 RF63 429-430            F63 431
        RF64 432                F64 433                 RF65 434
        F65 435-436             RF66 437-438            F66 439
        RF71 440-441            F71 442                 RF72 443-444
        F72 445-447             RF73 448-449            F73 450-452
        RF81 453-454            F81 455                 RF82 456-457
        F82 458-460             RF83 461-462            F83 463-465
        RF84 466-467            F84 468                 RF9 469-470
        F9 471-472              RF91 473-474            F91 475-476
        RF92A 477-478           F92A1 479-480           F92A2 481-482
        F92A3 483-484           F92A4 485-487           F92A5 488-489
        F92A6 490-491           RF92B 492-493           F92B1 494-495
        F92B2 496-497           F92B3 498-499           F92B4 500-502
        F92B5 503-504           F92B6 505-506           RF92C 507-508
        F92C1 509-510           F92C2 511-512           F92C3 513-514
        F92C4 515-517           F92C5 518-519           F92C6 520-521
        RF92D 522-523           F92D1 524-525           F92D2 526-527
        F92D3 528-529           F92D4 530-532           F92D5 533-534
        F92D6 535-536           RF92E 537-538           F92E1 539-540
        F92E2 541-542           F92E3 543-544           F92E4 545-547
        F92E5 548-549           F92E6 550-551           RF92F 552-553
        F92F1 554-555           F92F2 556-557           F92F3 558-559
        F92F4 560-562           F92F5 563-564           F92F6 565-566
        RF92G 567-568           F92G1 569-570           F92G2 571-572
        F92G3 573-574           F92G4 575-577           F92G5 578-579
        F92G6 580-581           RF92H 582-583           F92H1 584-585
        F92H2 586-587           F92H3 588-589           F92H4 590-592
        F92H5 593-594           F92H6 595-596           RF92I 597-598
        F92I1 599-600           F92I2 601-602           F92I3 603-604
        F92I4 605-607           F92I5 608-609           F92I6 610-611
        RF92J 612-613           F92J1 614-615           F92J2 616-617
        F92J3 618-619           F92J4 620-622           F92J5 623-624
        F92J6 625-626           RF10 627-628            F10 629-630
        RF101 631-632           F101 633-634            RF102 635-636
        F102 637-638            RF103A 639-640          F103A1 641-642
        F103A2 643-644          F103A3 645-647          F103A4 648-649
        F103A5 650-651          RF103B 652-653          F103B1 654-655
        F103B2 656-657          F103B3 658-660          F103B4 661-662
        F103B5 663-664          RF103C 665-666          F103C1 667-668
        F103C2 669-670          F103C3 671-673          F103C4 674-675
        F103C5 676-677          RF103D 678-679          F103D1 680-681
        F103D2 682-683          F103D3 684-686          F103D4 687-688
        F103D5 689-690          RF103E 691-692          F103E1 693-694
        F103E2 695-696          F103E3 697-699          F103E4 700-701
        F103E5 702-703          RF103F 704-705          F103F1 706-707
        F103F2 708-709          F103F3 710-712          F103F4 713-714
        F103F5 715-716          RF103G 717-718          F103G1 719-720
        F103G2 721-722          F103G3 723-725          F103G4 726-727
        F103G5 728-729          RF103H 730-731          F103H1 732-733
        F103H2 734-735          F103H3 736-738          F103H4 739-740
        F103H5 741-742          RF103I 743-744          F103I1 745-746
        F103I2 747-748          F103I3 749-751          F103I4 752-753
        F103I5 754-755          RF103J 756-757          F103J1 758-759
        F103J2 760-761          F103J3 762-764          F103J4 765-766
        F103J5 767-768          G1 769                  G21 770-771
        G22 772                 G3 773                  G4 774
        G51 775-777             G52 778-780             G6 781
        G7 782-784              G81 785                 G82 786
        G9 787                  G10 788-790             G11 791
        G12 792-793             RG13 794                G13 795-796
        G14A1 797-798           G14A2 799-801           G14B1 802-803
        G14B2 804-806           G14C1 807-808           G14C2 809-811
        G15A1 812               G15A2 813               G15A3 814-815
        G15B1 816               G15B2 817               G15B3 818-819
        G15C1 820               G15C2 821               G15C3 822-823
        G15D1 824               G15D2 825               G15D3 826-827
        G15E1 828               G15E2 829               G15E3 830-831
        G15F1 832               G15F2 833               G15F3 834-835
        G15G1 836               G15G2 837               G15G3 838-839
        G15H1 840               G15H2 841               G15H3 842-843
        G15I1 844               G15I2 845               G15I3 846-847
        G15J1 848               G15J2 849               G15J3 850-851
        G15K1 852               G15K2 853               G15K3 854-855
        G15L1 856               G15L2 857               G15L3 858-859
        G15M1 860               G15M2 861               G15M3 862-863
        G15N1 864               G15N2 865               G15N3 866-867
        G15O1 868               G15O2 869               G15O3 870-871
        G15P1 872               G15P2 873               G15P3 874-875
        H1 876                  H21 877                 H22 878-879
        H3 880                  H6 881                  H7 882
        H71 883-884             H8 885                  S1 886-887
        S2 888-889              W_2000 890-904 .12      DTH00_02 905-906
        MONTH_2 907-908         DAY_2 909-910           RESID_2 911-912
        VAGE_2 913-915          RA51_2 916-917          A51_2 918-919
        RA52_2 920-921          A52_2 922-923           RA53A_2 924-925
        A53A1_2 926-927         A53A2_2 928-930         A53A3_2 931-932
        RA53B_2 933-934         A53B1_2 935-936         A53B2_2 937-939
        A53B3_2 940-941         RA53C_2 942-943         A53C1_2 944-945
        A53C2_2 946-948         A53C3_2 949-950         RA53D_2 951-952
        A53D1_2 953-954         A53D2_2 955-957         A53D3_2 958-959
        RA53E_2 960-961         A53E1_2 962-963         A53E2_2 964-966
        A53E3_2 967-968         RA53F_2 969-970         A53F1_2 971-972
        A53F2_2 973-975         A53F3_2 976-977         RA53G_2 978-979
        A53G1_2 980-981         A53G2_2 982-984         A53G3_2 985-986
        RA53H_2 987-988         A53H1_2 989-990         A53H2_2 991-993
        A53H3_2 994-995         RA53I_2 996-997         A53I1_2 998-999
        A53I2_2 1000-1002       A53I3_2 1003-1004       RA53J_2 1005-1006
        A53J1_2 1007-1008       A53J2_2 1009-1011       A53J3_2 1012-1013
        RA53K_2 1014-1015       A53K1_2 1016-1017       A53K2_2 1018-1020
        A53K3_2 1021-1022       RA53L_2 1023-1024       A53L1_2 1025-1026
        A53L2_2 1027-1029       A53L3_2 1030-1031       RA531_2 1032-1033
        A531_2 1034-1035        RA532_2 1036-1037       A532_2 1038-1039
        RA54_2 1040-1041        A54A_2 1042-1045        A54B_2 1046-1047
        B11_2 1048-1049         B12_2 1050-1051         B121_2 1052-1053
        B21_2 1054-1055         B22_2 1056-1057         B23_2 1058-1059
        B24_2 1060-1061         B25_2 1062-1063         B26_2 1064-1065
        B27_2 1066-1067         C11_2 1068-1069         C12_2 1070-1071
        C13_2 1072-1073         C131_2 1074-1075        C14_2 1076-1077
        C15_2 1078-1079         C16_2 1080-1081         C161_2 1082-1083
        C162_2 1084-1085        C163_2 1086-1087        C21A_2 1088-1089
        C21B_2 1090-1091        C21C_2 1092-1093        C22_2 1094-1095
        C31A_2 1096-1097        C31B_2 1098-1099        C31C_2 1100-1101
        C31D_2 1102-1103        C31E_2 1104-1105        C32_2 1106-1107
        C41A_2 1108-1109        C41B_2 1110-1111        C41C_2 1112-1113
        C51A_2 1114-1115        C51B_2 1116-1117        C52_2 1118-1119
        C521_2 1120-1121        C53A_2 1122-1123        C53B_2 1124-1125
        C53C_2 1126-1127        C54_2 1128-1129         C55_2 1130-1131
        RD1_2 1132-1133         D1_2 1134-1135          RD2_2 1136-1137
        D2_2 1138-1139          RD31_2 1140-1141        D31_2 1142-1143
        RD32_2 1144-1145        D32_2 1146-1147         RD4MT_2 1148-1149
        D4MT2_2 1150-1151       RD4FSH_2 1152-1153      D4FSH2_2 1154-1155
        RD4EGG_2 1156-1157      D4EGG2_2 1158-1159      RD4BEN_2 1160-1161
        D4BEN2_2 1162-1163      RD4VEG_2 1164-1165      D4VEG2_2 1166-1167
        RD4SUG_2 1168-1169      D4SUG2_2 1170-1171      RD4TEA_2 1172-1173
        D4TEA2_2 1174-1175      RD4GAR_2 1176-1177      D4GAR2_2 1178-1179
        RD5_2 1180-1181         D5_2 1182-1183          RD6_2 1184-1185
        D6C_2 1186-1187         RD71_2 1188-1189        D71_2 1190-1191
        RD74_2 1192-1193        D74_2 1194-1196         RD75_2 1197-1198
        D75_2 1199-1200         RD81_2 1201-1202        D81_2 1203-1204
        RD84_2 1205-1206        D84_2 1207-1209         RD85_2 1210-1211
        D85_2 1212-1213         RD86_2 1214-1215        D86_2 1216-1217
        RD91_2 1218-1219        D91_2 1220-1221         RD94_2 1222-1223
        D94_2 1224-1226         RD11A_2 1227-1228       D11A_2 1229-1230
        RD11B_2 1231-1232       D11B_2 1233-1234        RD11C_2 1235-1236
        D11C_2 1237-1238        RD11D_2 1239-1240       D11D_2 1241-1242
        RD11E_2 1243-1244       D11E_2 1245-1246        RD11F_2 1247-1248
        D11F_2 1249-1250        RD11G_2 1251-1252       D11G_2 1253-1254
        RD11H_2 1255-1256       D11H_2 1257-1258        RD11I_2 1259-1260
        D11I_2 1261-1262        RD12_2 1263-1264        D12_2 1265-1266
        RE1_2 1267-1268         E1_2 1269-1270          RE1A_2 1271-1272
        E1A_2 1273-1274         RE2_2 1275-1276         E2_2 1277-1278
        RE2A_2 1279-1280        E2A_2 1281-1282         RE3_2 1283-1284
        E3_2 1285-1286          RE3A_2 1287-1288        E3A_2 1289-1290
        RE4_2 1291-1292         E4_2 1293-1294          RE4A_2 1295-1296
        E4A_2 1297-1298         RE5_2 1299-1300         E5_2 1301-1302
        RE5A_2 1303-1304        E5A_2 1305-1306         RE6_2 1307-1308
        E6_2 1309-1310          RE6A_2 1311-1312        E6A_2 1313-1314
        RE7_2 1315-1316         E7_2 1317-1318          RE8_2 1319-1320
        E8_2 1321-1322          RE9_2 1323-1324         E9_2 1325-1326
        RE10_2 1327-1328        E10_2 1329-1330         RE11_2 1331-1332
        E11_2 1333-1334         RE12_2 1335-1336        E12_2 1337-1338
        RE13_2 1339-1340        E13_2 1341-1342         RE14_2 1343-1344
        E14_2 1345-1346         RF21_2 1347-1348        F21_2 1349-1350
        RF211_2 1351-1352       F211_2 1353-1354        RF22_2 1355-1356
        F22_2 1357-1360         RF23_2 1361-1362        F23_2 1363-1364
        RF31_2 1365-1366        F31_2 1367-1368         RF32_2 1369-1370
        F32_2 1371-1375         RF33_2 1376-1377        F33_2 1378-1379
        RF34_2 1380-1381        F34_2 1382-1383         RF35_2 1384-1385
        F35_2 1386-1390         RF41_2 1391-1392        F41_2 1393-1394
        RF45_2 1395-1396        F45_2 1397-1398         RF5_2 1399-1400
        F5_2 1401-1402          RF61_2 1403-1404        F61_2 1405-1406
        RF64_2 1407-1408        F64_2 1409-1410         RF65_2 1411-1412
        F65_2 1413-1414         RF104_2 1415-1416       F104_2 1417-1419
        RF105_2 1420-1421       F105_2 1422-1424        RF111_2 1425-1426
        F111_2 1427-1428        RF112_2 1429-1430       F112_2 1431-1432
        RF113_2 1433-1434       F113_2 1435-1436        RF12_2 1437-1438
        F12A_2 1439-1443        F12B_2 1444-1448        RF13_2 1449-1450
        F13A_2 1451-1455        F13B_2 1456-1460        G1_2 1461-1462
        G21_2 1463-1464         G22_2 1465-1466         G3_2 1467-1468
        G4_2 1469-1470          G51_2 1471-1473         G52_2 1474-1476
        G6_2 1477-1478          G7_2 1479-1481          G81_2 1482-1483
        G82_2 1484-1485         G83_2 1486-1487         G9_2 1488-1489
        RG101_2 1490-1491       G101_2 1492-1494        G102A_2 1495-1497
        G102B_2 1498-1500       G11_2 1501-1502         G12_2 1503-1504
        RG13_2 1505-1506        G13_2 1507-1508         G14A1_2 1509-1511
        G14A2_2 1512-1514       G14B1_2 1515-1517       G14B2_2 1518-1520
        G14C1_2 1521-1523       G14C2_2 1524-1526       G15A1_2 1527-1528
        G15A2_2 1529-1530       G15A3_2 1531-1532       G15B1_2 1533-1534
        G15B2_2 1535-1536       G15B3_2 1537-1538       G15C1_2 1539-1540
        G15C2_2 1541-1542       G15C3_2 1543-1544       G15D1_2 1545-1546
        G15D2_2 1547-1548       G15D3_2 1549-1550       G15E1_2 1551-1552
        G15E2_2 1553-1554       G15E3_2 1555-1556       G15F1_2 1557-1558
        G15F2_2 1559-1560       G15F3_2 1561-1562       G15G1_2 1563-1564
        G15G2_2 1565-1566       G15G3_2 1567-1568       G15H1_2 1569-1570
        G15H2_2 1571-1572       G15H3_2 1573-1574       G15I1_2 1575-1576
        G15I2_2 1577-1578       G15I3_2 1579-1580       G15J1_2 1581-1582
        G15J2_2 1583-1584       G15J3_2 1585-1586       G15K1_2 1587-1588
        G15K2_2 1589-1590       G15K3_2 1591-1592       G15L1_2 1593-1594
        G15L2_2 1595-1596       G15L3_2 1597-1598       G15M1_2 1599-1600
        G15M2_2 1601-1602       G15M3_2 1603-1604       G15N1_2 1605-1606
        G15N2_2 1607-1608       G15N3_2 1609-1610       G15O1_2 1611-1612
        G15O2_2 1613-1614       G15O3_2 1615-1616       G15P1_2 1617-1618
        G15P2_2 1619-1620       G15P3_2 1621-1622       G15Q1_2 1623-1624
        G15Q2_2 1625-1626       G15Q3_2 1627-1628       G15R1_2 1629-1630
        G15R2_2 1631-1632       G15R3_2 1633-1634       G15S1_2 1635-1636
        G15S2_2 1637-1638       G15S3_2 1639-1640       G15T1_2 1641-1642
        G15T2_2 1643-1644       G15T3_2 1645-1646       G15U1_2 1647-1648
        G15U2_2 1649-1650       G15U3_2 1651-1652       G15V1_2 1653-1654
        G15V2_2 1655-1656       G15V3_2 1657-1658       G15W1_2 1659-1660
        G15W2_2 1661-1662       G15W3_2 1663-1664       H1_2 1665-1666
        H21_2 1667-1668         H22_2 1669-1670         H3_2 1671-1672
        H6_2 1673-1674          H7_2 1675-1676          H71_2 1677-1678
        H8_2 1679-1680          D2PROVIN 1681-1682      D2COUNTY 1683-1686
        D2RESID 1687-1688       D2RESPON 1689-1690      D2VYEAR 1691-1694
        D2VMONTH 1695-1696      D2VDAY 1697-1698        D2MTHIN 1699-1700
        D2DAYIN 1701-1702       D2SEX 1703-1704         D2VAGE 1705-1707
        D2MARRY 1708-1709       D2LIVARR 1710-1711      D2PERSON 1712-1713
        D2GENER 1714-1715       D2DPLACE 1716-1717      D2CAUSE 1718-1719
        D2CARGIV 1720-1721      D2BEDRID 1722-1723      D2BEDDAY 1724-1726
        D2ILL 1727-1728         D2DISEA1 1729-1730      D2DIDAY1 1731-1733
        D2DISEA2 1734-1735      D2DIDAY2 1736-1738      D2DISEA3 1739-1740
        D2DIDAY3 1741-1743      D2HYPERT 1744-1745      D2DIABET 1746-1747
        D2HEART 1748-1749       D2CVD 1750-1751         D2PNEUM 1752-1753
        D2TUBERC 1754-1755      D2GLAUCO 1756-1757      D2PROSTA 1758-1759
        D2GASTRI 1760-1761      D2PARKIN 1762-1763      D2BEDSOR 1764-1765
        D2DEMENT 1766-1767      D2PSYCHO 1768-1769      D2NEUROS 1770-1771
        D2ARTHRI 1772-1773      D2OTHERS 1774-1775      D2MEDICA 1776-1777
        D2FINANC 1778-1779      D2INCOME 1780-1784      D2WCFACI 1785-1786
        D2TAPWAT 1787-1788      D2BATHFA 1789-1790      D2HEATER 1791-1792
        D2TVSET 1793-1794       D2WASHMA 1795-1796      D2PHONE 1797-1798
        D2DOCTOR 1799-1800      D2LICDOC 1801-1802      D2WHOPAY 1803-1804
        D2MEDCOS 1805-1809      D2BATHFU 1810-1811      D2BATDAY 1812-1814
        D2DRESFU 1815-1816      D2DREDAY 1817-1819      D2TOILFU 1820-1821
        D2TOIDAY 1822-1824      D2MOVEFU 1825-1826      D2MOVDAY 1827-1829
        D2CONTFU 1830-1831      D2CONDAY 1832-1834      D2FEEDFU 1835-1836
        D2FEEDAY 1837-1839      D2OUTDOR 1840-1842      D2ACTDAY 1843-1845
        D2SMOKE 1846-1847       D2SMKTIM 1848-1849      D2DRINK 1850-1851
        D2KNDDRK 1852-1853      D2DRKMCH 1854-1855      DTH02_05 1856-1857
        MONTH_5 1858-1859       DAY_5 1860-1861         RESID_5 1862-1863
        VAGE_5 1864-1866        RA51_5 1867-1868        A51_5 1869-1870
        RA52_5 1871-1872        A52_5 1873-1874         RA53A_5 1875-1876
        A53A1_5 1877-1878       A53A2_5 1879-1881       A53A3_5 1882-1883
        A53A4_5 1884-1885       RA53B_5 1886-1887       A53B1_5 1888-1889
        A53B2_5 1890-1892       A53B3_5 1893-1894       A53B4_5 1895-1896
        RA53C_5 1897-1898       A53C1_5 1899-1900       A53C2_5 1901-1903
        A53C3_5 1904-1905       A53C4_5 1906-1907       RA53D_5 1908-1909
        A53D1_5 1910-1911       A53D2_5 1912-1914       A53D3_5 1915-1916
        A53D4_5 1917-1918       RA53E_5 1919-1920       A53E1_5 1921-1922
        A53E2_5 1923-1925       A53E3_5 1926-1927       A53E4_5 1928-1929
        RA53F_5 1930-1931       A53F1_5 1932-1933       A53F2_5 1934-1936
        A53F3_5 1937-1938       A53F4_5 1939-1940       RA53G_5 1941-1942
        A53G1_5 1943-1944       A53G2_5 1945-1947       A53G3_5 1948-1949
        A53G4_5 1950-1951       RA53H_5 1952-1953       A53H1_5 1954-1955
        A53H2_5 1956-1958       A53H3_5 1959-1960       A53H4_5 1961-1962
        RA53I_5 1963-1964       A53I1_5 1965-1966       A53I2_5 1967-1969
        A53I3_5 1970-1971       A53I4_5 1972-1973       RA53J_5 1974-1975
        A53J1_5 1976-1977       A53J2_5 1978-1980       A53J3_5 1981-1982
        A53J4_5 1983-1984       RA53K_5 1985-1986       A53K1_5 1987-1988
        A53K2_5 1989-1991       A53K3_5 1992-1993       A53K4_5 1994-1995
        RA53L_5 1996-1997       A53L1_5 1998-1999       A53L2_5 2000-2002
        A53L3_5 2003-2004       A53L4_5 2005-2006       RA530_5 2007-2008
        A530_5 2009-2010        RA531_5 2011-2012       A531_5 2013-2014
        RA532_5 2015-2016       A532_5 2017-2018        RA540_5 2019-2020
        A540_5 2021-2022        RA541_5 2023-2024       A541_5 2025-2028
        RA542_5 2029-2030       A542_5 2031-2032        RA54_5 2033-2034
        A54A_5 2035-2038        A54B_5 2039-2040        B11_5 2041-2042
        B12_5 2043-2044         B121_5 2045-2046        B21_5 2047-2048
        B22_5 2049-2050         B23_5 2051-2052         B24_5 2053-2054
        B25_5 2055-2056         B26_5 2057-2058         B27_5 2059-2060
        C11_5 2061-2062         C12_5 2063-2064         C13_5 2065-2066
        C14_5 2067-2068         C15_5 2069-2070         C16_5 2071-2072
        C21A_5 2073-2074        C21B_5 2075-2076        C21C_5 2077-2078
        C22_5 2079-2080         C31A_5 2081-2082        C31B_5 2083-2084
        C31C_5 2085-2086        C31D_5 2087-2088        C31E_5 2089-2090
        C32_5 2091-2092         C41A_5 2093-2094        C41B_5 2095-2096
        C41C_5 2097-2098        C51A_5 2099-2100        C51B_5 2101-2102
        C52_5 2103-2104         C53A_5 2105-2106        C53B_5 2107-2108
        C53C_5 2109-2110        C54_5 2111-2112         C55_5 2113-2114
        RD1_5 2115-2116         D1_5 2117-2118          RD2_5 2119-2120
        D2_5 2121-2122          RD31_5 2123-2124        D31_5 2125-2126
        RD32_5 2127-2128        D32_5 2129-2130         RD4MT_5 2131-2132
        D4MT2_5 2133-2134       RD4FSH_5 2135-2136      D4FSH2_5 2137-2138
        RD4EGG_5 2139-2140      D4EGG2_5 2141-2142      RD4BEN_5 2143-2144
        D4BEN2_5 2145-2146      RD4VEG_5 2147-2148      D4VEG2_5 2149-2150
        RD4SUG_5 2151-2152      D4SUG2_5 2153-2154      RD4TEA_5 2155-2156
        D4TEA2_5 2157-2158      RD4GAR_5 2159-2160      D4GAR2_5 2161-2162
        RD5_5 2163-2164         D5_5 2165-2166          RD6_5 2167-2168
        D6C_5 2169-2170         RD71_5 2171-2172        D71_5 2173-2174
        RD72_5 2175-2176        D72_5 2177-2178         RD73_5 2179-2180
        D73_5 2181-2183         RD74_5 2184-2185        D74_5 2186-2188
        RD75_5 2189-2190        D75_5 2191-2192         RD81_5 2193-2194
        D81_5 2195-2196         RD82_5 2197-2198        D82_5 2199-2200
        RD83_5 2201-2202        D83_5 2203-2205         RD84_5 2206-2207
        D84_5 2208-2210         RD85_5 2211-2212        D85_5 2213-2214
        RD86_5 2215-2216        D86_5 2217-2218         RD91_5 2219-2220
        D91_5 2221-2222         RD92_5 2223-2224        D92_5 2225-2226
        RD93_5 2227-2228        D93_5 2229-2231         RD94_5 2232-2233
        D94_5 2234-2236         RD101_5 2237-2238       D101_5 2239-2240
        RD102_5 2241-2242       D102_5 2243-2245        RD103_5 2246-2247
        D103_5 2248-2250        RD11A_5 2251-2252       D11A_5 2253-2254
        RD11B_5 2255-2256       D11B_5 2257-2258        RD11C_5 2259-2260
        D11C_5 2261-2262        RD11D_5 2263-2264       D11D_5 2265-2266
        RD11E_5 2267-2268       D11E_5 2269-2270        RD11F_5 2271-2272
        D11F_5 2273-2274        RD11G_5 2275-2276       D11G_5 2277-2278
        RD11H_5 2279-2280       D11H_5 2281-2282        RD12_5 2283-2284
        D12_5 2285-2286         RE1_5 2287-2288         E1_5 2289-2290
        RE1B_5 2291-2292        E1B_5 2293-2296         RE2_5 2297-2298
        E2_5 2299-2300          RE2B_5 2301-2302        E2B_5 2303-2306
        RE3_5 2307-2308         E3_5 2309-2310          RE3B_5 2311-2312
        E3B_5 2313-2316         RE4_5 2317-2318         E4_5 2319-2320
        RE4B_5 2321-2322        E4B_5 2323-2326         RE5_5 2327-2328
        E5_5 2329-2330          RE5B_5 2331-2332        E5B_5 2333-2336
        RE6_5 2337-2338         E6_5 2339-2340          RE6B_5 2341-2342
        E6B_5 2343-2346         RE610_5 2347-2348       E610_5 2349-2350
        RE62_5 2351-2352        E62_5 2353-2354         RE63_5 2355-2356
        E63_5 2357-2361         RE64_5 2362-2363        E64_5 2364-2365
        RE65_5 2366-2367        E65_5 2368-2369         RE66_5 2370-2371
        E66_5 2372-2373         RE67_5 2374-2375        E67_5 2376-2378
        RE7_5 2379-2380         E7_5 2381-2382          RE8_5 2383-2384
        E8_5 2385-2386          RE9_5 2387-2388         E9_5 2389-2390
        RE10_5 2391-2392        E10_5 2393-2394         RE11_5 2395-2396
        E11_5 2397-2398         RE12_5 2399-2400        E12_5 2401-2402
        RE13_5 2403-2404        E13_5 2405-2406         RE14_5 2407-2408
        E14_5 2409-2410         RF211_5 2411-2412       F211_5 2413-2414
        RF22_5 2415-2416        F22_5 2417-2420         RF23_5 2421-2422
        F23_5 2423-2424         RF31_5 2425-2426        F31_5 2427-2428
        RF32_5 2429-2430        F32A_5 2431-2432        F32B_5 2433-2434
        F32C_5 2435-2436        F32D_5 2437-2438        F32E_5 2439-2440
        RF33_5 2441-2442        F33_5 2443-2444         RF340_5 2445-2446
        F340_5 2447-2448        RF34_5 2449-2450        F34_5 2451-2452
        RF35_5 2453-2454        F35_5 2455-2459         RF41_5 2460-2461
        F41_5 2462-2463         RF42_5 2464-2465        F42_5 2466-2467
        RF43A_5 2468-2469       F43A1_5 2470-2472       F43A2_5 2473-2474
        F43A3_5 2475-2477       F43A4_5 2478-2479       RF43B_5 2480-2481
        F43B1_5 2482-2484       F43B2_5 2485-2486       F43B3_5 2487-2489
        F43B4_5 2490-2491       RF43C_5 2492-2493       F43C1_5 2494-2496
        F43C2_5 2497-2498       F43C3_5 2499-2501       F43C4_5 2502-2503
        RF43D_5 2504-2505       F43D1_5 2506-2508       F43D2_5 2509-2510
        F43D3_5 2511-2513       F43D4_5 2514-2515       RF44_5 2516-2517
        F44_5 2518-2519         RF45_5 2520-2521        F45_5 2522-2523
        RF46_5 2524-2525        F46_5 2526-2527         RF5_5 2528-2529
        F5_5 2530-2531          RF61_5 2532-2533        F61_5 2534-2535
        RF610_5 2536-2537       F610_5 2538-2539        RF64_5 2540-2541
        F64A_5 2542-2543        F64B_5 2544-2545        F64C_5 2546-2547
        F64D_5 2548-2549        F64E_5 2550-2551        F64F_5 2552-2553
        F64G_5 2554-2555        F64H_5 2556-2557        F64I_5 2558-2559
        RF651A_5 2560-2561      F651A_5 2562-2566       RF651B_5 2567-2568
        F651B_5 2569-2573       RF652_5 2574-2575       F652_5 2576-2577
        RF71_5 2578-2579        F71_5 2580-2581         RF721_5 2582-2583
        F721_5 2584-2586        RF722_5 2587-2588       F722_5 2589-2591
        RF73_5 2592-2593        F73_5 2594-2596         RF74_5 2597-2598
        F74_5 2599-2600         RF81_5 2601-2602        F81_5 2603-2604
        RF821_5 2605-2606       F821_5 2607-2609        RF822_5 2610-2611
        F822_5 2612-2614        RF83_5 2615-2616        F83_5 2617-2619
        RF85_5 2620-2621        F85_5 2622-2623         RF86_5 2624-2625
        F86_5 2626-2627         RF9_5 2628-2629         F9A_5 2630-2631
        RF92A_5 2632-2633       F92A1_5 2634-2635       F92A2_5 2636-2637
        F92A3_5 2638-2639       F92A4_5 2640-2642       F92A5_5 2643-2644
        F92A6_5 2645-2646       RF92B_5 2647-2648       F92B1_5 2649-2650
        F92B2_5 2651-2652       F92B3_5 2653-2654       F92B4_5 2655-2657
        F92B5_5 2658-2659       F92B6_5 2660-2661       RF92C_5 2662-2663
        F92C1_5 2664-2665       F92C2_5 2666-2667       F92C3_5 2668-2669
        F92C4_5 2670-2672       F92C5_5 2673-2674       F92C6_5 2675-2676
        RF92D_5 2677-2678       F92D1_5 2679-2680       F92D2_5 2681-2682
        F92D3_5 2683-2684       F92D4_5 2685-2687       F92D5_5 2688-2689
        F92D6_5 2690-2691       RF92E_5 2692-2693       F92E1_5 2694-2695
        F92E2_5 2696-2697       F92E3_5 2698-2699       F92E4_5 2700-2702
        F92E5_5 2703-2704       F92E6_5 2705-2706       RF92F_5 2707-2708
        F92F1_5 2709-2710       F92F2_5 2711-2712       F92F3_5 2713-2714
        F92F4_5 2715-2717       F92F5_5 2718-2719       F92F6_5 2720-2721
        RF92G_5 2722-2723       F92G1_5 2724-2725       F92G2_5 2726-2727
        F92G3_5 2728-2729       F92G4_5 2730-2732       F92G5_5 2733-2734
        F92G6_5 2735-2736       RF92H_5 2737-2738       F92H1_5 2739-2740
        F92H2_5 2741-2742       F92H3_5 2743-2744       F92H4_5 2745-2747
        F92H5_5 2748-2749       F92H6_5 2750-2751       RF92I_5 2752-2753
        F92I1_5 2754-2755       F92I2_5 2756-2757       F92I3_5 2758-2759
        F92I4_5 2760-2762       F92I5_5 2763-2764       F92I6_5 2765-2766
        RF92J_5 2767-2768       F92J1_5 2769-2770       F92J2_5 2771-2772
        F92J3_5 2773-2774       F92J4_5 2775-2777       F92J5_5 2778-2779
        F92J6_5 2780-2781       RF92K_5 2782-2783       F92K1_5 2784-2785
        F92K2_5 2786-2787       F92K3_5 2788-2789       F92K4_5 2790-2792
        F92K5_5 2793-2794       F92K6_5 2795-2796       RF103A_5 2797-2798
        F103A6_5 2799-2800      F103A8_5 2801-2802      F103A1_5 2803-2804
        F103A2_5 2805-2806      F103A3_5 2807-2809      F103A4_5 2810-2811
        F103A7_5 2812-2813      F103A5_5 2814-2815      RF103B_5 2816-2817
        F103B6_5 2818-2819      F103B8_5 2820-2821      F103B1_5 2822-2823
        F103B2_5 2824-2825      F103B3_5 2826-2828      F103B4_5 2829-2830
        F103B7_5 2831-2832      F103B5_5 2833-2834      RF103C_5 2835-2836
        F103C6_5 2837-2838      F103C8_5 2839-2840      F103C1_5 2841-2842
        F103C2_5 2843-2844      F103C3_5 2845-2847      F103C4_5 2848-2849
        F103C7_5 2850-2851      F103C5_5 2852-2853      RF103D_5 2854-2855
        F103D6_5 2856-2857      F103D8_5 2858-2859      F103D1_5 2860-2861
        F103D2_5 2862-2863      F103D3_5 2864-2866      F103D4_5 2867-2868
        F103D7_5 2869-2870      F103D5_5 2871-2872      RF103E_5 2873-2874
        F103E6_5 2875-2876      F103E8_5 2877-2878      F103E1_5 2879-2880
        F103E2_5 2881-2882      F103E3_5 2883-2885      F103E4_5 2886-2887
        F103E7_5 2888-2889      F103E5_5 2890-2891      RF103F_5 2892-2893
        F103F6_5 2894-2895      F103F8_5 2896-2897      F103F1_5 2898-2899
        F103F2_5 2900-2901      F103F3_5 2902-2904      F103F4_5 2905-2906
        F103F7_5 2907-2908      F103F5_5 2909-2910      RF103G_5 2911-2912
        F103G6_5 2913-2914      F103G8_5 2915-2916      F103G1_5 2917-2918
        F103G2_5 2919-2920      F103G3_5 2921-2923      F103G4_5 2924-2925
        F103G7_5 2926-2927      F103G5_5 2928-2929      RF103H_5 2930-2931
        F103H6_5 2932-2933      F103H8_5 2934-2935      F103H1_5 2936-2937
        F103H2_5 2938-2939      F103H3_5 2940-2942      F103H4_5 2943-2944
        F103H7_5 2945-2946      F103H5_5 2947-2948      RF103I_5 2949-2950
        F103I6_5 2951-2952      F103I8_5 2953-2954      F103I1_5 2955-2956
        F103I2_5 2957-2958      F103I3_5 2959-2961      F103I4_5 2962-2963
        F103I7_5 2964-2965      F103I5_5 2966-2967      RF103J_5 2968-2969
        F103J6_5 2970-2971      F103J8_5 2972-2973      F103J1_5 2974-2975
        F103J2_5 2976-2977      F103J3_5 2978-2980      F103J4_5 2981-2982
        F103J7_5 2983-2984      F103J5_5 2985-2986      RF103K_5 2987-2988
        F103K6_5 2989-2990      F103K8_5 2991-2992      F103K1_5 2993-2994
        F103K2_5 2995-2996      F103K3_5 2997-2999      F103K4_5 3000-3001
        F103K7_5 3002-3003      F103K5_5 3004-3005      RF103L_5 3006-3007
        F103L6_5 3008-3009      F103L8_5 3010-3011      F103L1_5 3012-3013
        F103L2_5 3014-3015      F103L3_5 3016-3018      F103L4_5 3019-3020
        F103L7_5 3021-3022      F103L5_5 3023-3024      RF103M_5 3025-3026
        F103M6_5 3027-3028      F103M8_5 3029-3030      F103M1_5 3031-3032
        F103M2_5 3033-3034      F103M3_5 3035-3037      F103M4_5 3038-3039
        F103M7_5 3040-3041      F103M5_5 3042-3043      RF111_5 3044-3045
        F111A_5 3046-3047       F111B_5 3048-3049       F111C_5 3050-3051
        RF112_5 3052-3053       F112A_5 3054-3055       F112B_5 3056-3057
        F112C_5 3058-3059       RF113_5 3060-3061       F113A_5 3062-3063
        F113B_5 3064-3065       F113C_5 3066-3067       RF12_5 3068-3069
        F12A_5 3070-3074        F12B_5 3075-3079        F12C_5 3080-3084
        RF13_5 3085-3086        F13A_5 3087-3091        F13B_5 3092-3096
        F13C_5 3097-3101        RF14_5 3102-3103        F141_5 3104-3105
        F142_5 3106-3107        F143_5 3108-3109        F144_5 3110-3111
        F145_5 3112-3113        F146_5 3114-3115        F147_5 3116-3117
        F148_5 3118-3119        F149_5 3120-3121        RF15_5 3122-3123
        F151_5 3124-3125        F152_5 3126-3127        F153_5 3128-3129
        F154_5 3130-3131        F155_5 3132-3133        F156_5 3134-3135
        F157_5 3136-3137        F158_5 3138-3139        F159_5 3140-3141
        F16_5 3142-3143         RG01_5 3144-3145        G01_5 3146-3147
        RG02_5 3148-3149        G02_5 3150-3151         G1_5 3152-3153
        G21_5 3154-3155         G22_5 3156-3157         G3_5 3158-3159
        G4_5 3160-3161          G51_5 3162-3164         G52_5 3165-3167
        G6_5 3168-3169          G7_5 3170-3172          G81_5 3173-3174
        G82_5 3175-3176         G83_5 3177-3178         G9_5 3179-3180
        G101_5 3181-3183        G102_5 3184-3186        G11_5 3187-3188
        G12_5 3189-3190         RG130_5 3191-3192       G130_5 3193-3194
        RG13_5 3195-3196        G13_5 3197-3198         RG14A_5 3199-3200
        G14A1_5 3201-3203       G14A2_5 3204-3206       RG14B_5 3207-3208
        G14B1_5 3209-3211       G14B2_5 3212-3214       RG14C_5 3215-3216
        G14C1_5 3217-3219       G14C2_5 3220-3222       G15A1_5 3223-3224
        G15A2_5 3225-3226       G15A3_5 3227-3228       G15B1_5 3229-3230
        G15B2_5 3231-3232       G15B3_5 3233-3234       G15C1_5 3235-3236
        G15C2_5 3237-3238       G15C3_5 3239-3240       G15D1_5 3241-3242
        G15D2_5 3243-3244       G15D3_5 3245-3246       G15E1_5 3247-3248
        G15E2_5 3249-3250       G15E3_5 3251-3252       G15F1_5 3253-3254
        G15F2_5 3255-3256       G15F3_5 3257-3258       G15G1_5 3259-3260
        G15G2_5 3261-3262       G15G3_5 3263-3264       G15H1_5 3265-3266
        G15H2_5 3267-3268       G15H3_5 3269-3270       G15I1_5 3271-3272
        G15I2_5 3273-3274       G15I3_5 3275-3276       G15J1_5 3277-3278
        G15J2_5 3279-3280       G15J3_5 3281-3282       G15K1_5 3283-3284
        G15K2_5 3285-3286       G15K3_5 3287-3288       G15L1_5 3289-3290
        G15L2_5 3291-3292       G15L3_5 3293-3294       G15M1_5 3295-3296
        G15M2_5 3297-3298       G15M3_5 3299-3300       G15N1_5 3301-3302
        G15N2_5 3303-3304       G15N3_5 3305-3306       G15O1_5 3307-3308
        G15O2_5 3309-3310       G15O3_5 3311-3312       G15P1_5 3313-3314
        G15P2_5 3315-3316       G15P3_5 3317-3318       G15Q1_5 3319-3320
        G15Q2_5 3321-3322       G15Q3_5 3323-3324       G15R1_5 3325-3326
        G15R2_5 3327-3328       G15R3_5 3329-3330       G15S1_5 3331-3332
        G15S2_5 3333-3334       G15S3_5 3335-3336       G15T1_5 3337-3338
        G15T2_5 3339-3340       G15T3_5 3341-3342       G15U1_5 3343-3344
        G15U2_5 3345-3346       G15U3_5 3347-3348       G15V1_5 3349-3350
        G15V2_5 3351-3352       G15V3_5 3353-3354       G15W1_5 3355-3356
        G15W2_5 3357-3358       G15W3_5 3359-3360       H1_5 3361-3362
        H21_5 3363-3364         H22_5 3365-3366         H3_5 3367-3368
        H6_5 3369-3370          H7_5 3371-3372          H71_5 3373-3374
        D5VYEAR 3375-3378       D5VMONTH 3379-3380      D5VDAY 3381-3382
        D5MTHIN 3383-3384       D5DAYIN 3385-3386       D5SEX 3387-3388
        D5RESID 3389-3390       D5RESPON 3391-3392      D5MARRY 3393-3394
        D5LIVARR 3395-3396      D5PERSON 3397-3398      D5GENER 3399-3400
        D5DPLACE 3401-3402      D5CAUSE 3403-3404       D5CARGIV 3405-3406
        D5PCGDAY 3407-3408      D5BEDRID 3409-3410      D5BEDDAY 3411-3414
        D5ILL 3415-3416         D5DISEA1 3417-3418      D5DIDAY1 3419-3422
        D5DISEA2 3423-3424      D5DIDAY2 3425-3428      D5DISEA3 3429-3430
        D5DIDAY3 3431-3434      D5MEDICA 3435-3436      D5FINANC 3437-3438
        D5INCOME 3439-3443      D5WCFACI 3444-3445      D5TAPWAT 3446-3447
        D5BATHFA 3448-3449      D5HEATER 3450-3451      D5TVSET 3452-3453
        D5WASHMA 3454-3455      D5PHONE 3456-3457       D5DOCTOR 3458-3459
        D5LICDOC 3460-3461      D5WHOPAY 3462-3463      D5MEDCOS 3464-3468
        D5POCKET 3469-3473      D5BATHFU 3474-3475      D5BATDAY 3476-3479
        D5DRESFU 3480-3481      D5DREDAY 3482-3485      D5TOILFU 3486-3487
        D5TOIDAY 3488-3491      D5MOVEFU 3492-3493      D5MOVDAY 3494-3497
        D5CONTFU 3498-3499      D5CONDAY 3500-3503      D5FEEDFU 3504-3505
        D5FEEDAY 3506-3509      D5FULLDA 3510-3513      D5CARCST 3514-3518
        D5DIRCST 3519-3523      D5CARPAY 3524-3525      D5OUTDOR 3526-3529
        D5ACTDAY 3530-3533      D5SMOKE 3534-3535       D5SMKTIM 3536-3537
        D5DRINK 3538-3539       D5KNDDRK 3540-3541      D5DRKMCH 3542-3543
        D5ADVDIR 3544-3545      D5DIRDAY 3546-3548      D5DREAM 3549-3550
        D5PAIN 3551-3552        D5UNCONS 3553-3554      D5UNCDAY 3555-3557
        DTH05_08 3558-3559      YEAR_8 3560-3563        MONTH_8 3564-3565
        DAY_8 3566-3567         RESID_8 3568-3569       VAGE_8 3570-3572
        RA51_8 3573-3574        A51_8 3575-3576         RA52_8 3577-3578
        A52_8 3579-3580         RA53A_8 3581-3582       A53A1_8 3583-3584
        A53A3_8 3585-3586       A53A2_8 3587-3589       A53A4_8 3590-3591
        RA53B_8 3592-3593       A53B1_8 3594-3595       A53B3_8 3596-3597
        A53B2_8 3598-3600       A53B4_8 3601-3602       RA53C_8 3603-3604
        A53C1_8 3605-3606       A53C3_8 3607-3608       A53C2_8 3609-3611
        A53C4_8 3612-3613       RA53D_8 3614-3615       A53D1_8 3616-3617
        A53D3_8 3618-3619       A53D2_8 3620-3622       A53D4_8 3623-3624
        RA53E_8 3625-3626       A53E1_8 3627-3628       A53E3_8 3629-3630
        A53E2_8 3631-3633       A53E4_8 3634-3635       RA53F_8 3636-3637
        A53F1_8 3638-3639       A53F3_8 3640-3641       A53F2_8 3642-3644
        A53F4_8 3645-3646       RA53G_8 3647-3648       A53G1_8 3649-3650
        A53G3_8 3651-3652       A53G2_8 3653-3655       A53G4_8 3656-3657
        RA53H_8 3658-3659       A53H1_8 3660-3661       A53H3_8 3662-3663
        A53H2_8 3664-3666       A53H4_8 3667-3668       RA53I_8 3669-3670
        A53I1_8 3671-3672       A53I3_8 3673-3674       A53I2_8 3675-3677
        A53I4_8 3678-3679       RA53J_8 3680-3681       A53J1_8 3682-3683
        A53J11_8 $3684          A53J3_8 3685-3686       A53J2_8 3687-3689
        A53J4_8 3690-3691       RA53K_8 3692-3693       A53K1_8 3694-3695
        A53K11_8 $3696          A53K3_8 3697-3698       A53K2_8 3699-3701
        A53K4_8 3702-3703       RA53L_8 3704-3705       A53L1_8 3706-3707
        A53L11_8 $3708          A53L3_8 3709-3710       A53L2_8 3711-3713
        A53L4_8 3714-3715       RA530_8 3716-3717       A530_8 3718-3719
        RA531_8 3720-3721       A531_8 3722-3723        RA532_8 3724-3725
        A532_8 3726-3727        RA541_8 3728-3729       A541_8 3730-3733
        RA542_8 3734-3735       A542_8 3736-3737        RA54_8 3738-3739
        A54A_8 3740-3743        A54B_8 3744-3745        B11_8 3746-3747
        B12_8 3748-3749         B121_8 3750-3751        B21_8 3752-3753
        B22_8 3754-3755         B23_8 3756-3757         B24_8 3758-3759
        B25_8 3760-3761         B26_8 3762-3763         B27_8 3764-3765
        C11_8 3766-3767         C12_8 3768-3769         C13_8 3770-3771
        C14_8 3772-3773         C15_8 3774-3775         C16_8 3776-3777
        C21A_8 3778-3779        C21B_8 3780-3781        C21C_8 3782-3783
        C22_8 3784-3785         C31A_8 3786-3787        C31B_8 3788-3789
        C31C_8 3790-3791        C31D_8 3792-3793        C31E_8 3794-3795
        C32_8 3796-3797         C41A_8 3798-3799        C41B_8 3800-3801
        C41C_8 3802-3803        C51A_8 3804-3805        C51B_8 3806-3807
        C52_8 3808-3809         C52X1_8 3810-3811       C52X2_8 3812-3813
        C53A_8 3814-3815        C53B_8 3816-3817        C53C_8 3818-3819
        C54_8 3820-3821         C55_8 3822-3823         RD1_8 3824-3825
        D1_8 3826-3827          RD2_8 3828-3829         D2_8 3830-3831
        RD31_8 3832-3833        D31_8 3834-3835         RD32_8 3836-3837
        D32_8 3838-3839         RD33_8 3840-3841        D33_8 3842-3843
        RD34_8 3844-3845        D34_8 3846-3847         RD4MEAT_8 3848-3849
        D4MEAT2_8 3850-3851     D4MEAT1_8 3852-3853     RD4FISH_8 3854-3855
        D4FISH2_8 3856-3857     D4FISH1_8 3858-3859     RD4EGG_8 3860-3861
        D4EGG2_8 3862-3863      D4EGG1_8 3864-3865      RD4BEAN_8 3866-3867
        D4BEAN2_8 3868-3869     D4BEAN1_8 3870-3871     RD4VEG_8 3872-3873
        D4VEG2_8 3874-3875      D4VEG1_8 3876-3877      RD4SUGA_8 3878-3879
        D4SUGA2_8 3880-3881     D4SUGA1_8 3882-3883     RD4TEA_8 3884-3885
        D4TEA2_8 3886-3887      D4TEA1_8 3888-3889      RD4GARL_8 3890-3891
        D4GARL2_8 3892-3893     D4GARL1_8 3894-3895     RDEMILK_8 3896-3897
        D4MILK1_8 3898-3899     D4MILK2_8 3900-3901     RD4NUT_8 3902-3903
        D4NUT1_8 3904-3905      D4NUT2_8 3906-3907      RD4ALGA_8 3908-3909
        D4ALGA1_8 3910-3911     D4ALGA2_8 3912-3913     RD4VIT_8 3914-3915
        D4VIT1_8 3916-3917      D4VIT2_8 3918-3919      RD4DRUG_8 3920-3921
        D4DRUG1_8 3922-3923     D4DRUG2_8 3924-3925     RD5_8 3926-3927
        D5_8 3928-3929          RD6_8 3930-3931         D6A_8 3932-3933
        D6B_8 3934-3935         D6C_8 3936-3937         RD71_8 3938-3939
        D71_8 3940-3941         RD72_8 3942-3943        D72_8 3944-3945
        RD73_8 3946-3947        D73_8 3948-3950         RD74_8 3951-3952
        D74_8 3953-3955         RD75_8 3956-3957        D75_8 3958-3959
        RD81_8 3960-3961        D81_8 3962-3963         RD82_8 3964-3965
        D82_8 3966-3967         RD83_8 3968-3969        D83_8 3970-3972
        RD84_8 3973-3974        D84_8 3975-3977         RD85_8 3978-3979
        D85_8 3980-3981         RD86_8 3982-3983        D86_8 3984-3985
        RD91_8 3986-3987        D91_8 3988-3989         RD92_8 3990-3991
        D92_8 3992-3993         RD93_8 3994-3995        D93_8 3996-3998
        RD94_8 3999-4000        D94_8 4001-4003         RD101_8 4004-4005
        D101_8 4006-4007        RD102_8 4008-4009       D102_8 4010-4012
        RD103_8 4013-4014       D103_8 4015-4017        RD11A_8 4018-4019
        D11A_8 4020-4021        RD11B_8 4022-4023       D11B_8 4024-4025
        RD11C_8 4026-4027       D11C_8 4028-4029        RD11D_8 4030-4031
        D11D_8 4032-4033        RD11E_8 4034-4035       D11E_8 4036-4037
        RD11F_8 4038-4039       D11F_8 4040-4041        RD11G_8 4042-4043
        D11G_8 4044-4045        RD11H_8 4046-4047       D11H_8 4048-4049
        RD12_8 4050-4051        D12_8 4052-4053         RE6_8 4054-4055
        E6_8 4056-4057          RE6B_8 4058-4059        E6B_8 4060-4063
        RE1_8 4064-4065         E1_8 4066-4067          RE1B_8 4068-4069
        E1B_8 4070-4073         RE2_8 4074-4075         E2_8 4076-4077
        RE2B_8 4078-4079        E2B_8 4080-4083         RE3_8 4084-4085
        E3_8 4086-4087          RE3B_8 4088-4089        E3B_8 4090-4093
        RE4_8 4094-4095         E4_8 4096-4097          RE4B_8 4098-4099
        E4B_8 4100-4103         RE5_8 4104-4105         E5_8 4106-4107
        RE5B_8 4108-4109        E5B_8 4110-4113         RE610_8 4114-4115
        E610_8 4116-4117        RE62_8 4118-4119        E62_8 4120-4121
        RE63_8 4122-4123        E63_8 4124-4128         RE64_8 4129-4130
        E64_8 4131-4132         RE65_8 4133-4134        E65_8 4135-4136
        RE67_8 4137-4138        E67_8 4139-4141         RE7_8 4142-4143
        E7_8 4144-4145          RE8_8 4146-4147         E8_8 4148-4149
        RE9_8 4150-4151         E9_8 4152-4153          RE10_8 4154-4155
        E10_8 4156-4157         RE11_8 4158-4159        E11_8 4160-4161
        RE12_8 4162-4163        E12_8 4164-4165         RE13_8 4166-4167
        E13_8 4168-4169         RE14_8 4170-4171        E14_8 4172-4173
        RF1_8 4174-4175         F1_8 4176-4177          RF2_8 4178-4179
        F2_8 4180-4181          F2T_8 $4182             RF21_8 4183-4184
        F21_8 4185-4186         RF211_8 4187-4188       F211_8 4189-4190
        RF22_8 4191-4192        F22_8 4193-4196         RF23_8 4197-4198
        F23_8 4199-4200         RF31_8 4201-4202        F31_8 4203-4204
        RF32_8 4205-4206        F32A_8 4207-4208        F32B_8 4209-4210
        F32C_8 4211-4212        F32D_8 4213-4214        F32E_8 4215-4216
        RF33_8 4217-4218        F33_8 4219-4220         RF340_8 4221-4222
        F340_8 4223-4224        RF34_8 4225-4226        F34_8 4227-4228
        RF35_8 4229-4230        F35_8 4231-4235         RF41_8 4236-4237
        F41_8 4238-4239         RF42_8 4240-4241        F42_8 4242-4243
        RF43A_8 4244-4245       F43A1_8 4246-4248       F43A2_8 4249-4250
        F43A3_8 4251-4253       F43A4_8 4254-4255       RF43B_8 4256-4257
        F43B1_8 4258-4260       F43B2_8 4261-4262       F43B3_8 4263-4265
        F43B4_8 4266-4267       RF43C_8 4268-4269       F43C1_8 4270-4272
        F43C2_8 4273-4274       F43C3_8 4275-4277       F43C4_8 4278-4279
        RF43D_8 4280-4281       F43D1_8 4282-4284       F43D2_8 4285-4286
        F43D3_8 4287-4289       F43D4_8 4290-4291       RF44_8 4292-4293
        F44_8 4294-4295         RF45_8 4296-4297        F45_8 4298-4299
        RF46_8 4300-4301        F46_8 4302-4303         RF47_8 4304-4305
        F47_8 4306-4307         RF5_8 4308-4309         F5_8 4310-4311
        RF61_8 4312-4313        F61_8 4314-4315         RF610_8 4316-4317
        F610_8 4318-4319        RF62_8 4320-4321        F62_8 4322-4323
        RF63_8 4324-4325        F63_8 4326-4327         RF64_8 4328-4329
        F64A_8 4330-4331        F64B_8 4332-4333        F64C_8 4334-4335
        F64D_8 4336-4337        F64E_8 4338-4339        F64F_8 4340-4341
        F64G_8 4342-4343        F64H_8 4344-4345        F64I_8 4346-4347
        RF651A_8 4348-4349      F651A_8 4350-4354       RF651B_8 4355-4356
        F651B_8 4357-4361       RF652_8 4362-4363       F652_8 4364-4365
        RF66_8 4366-4367        F66_8 4368-4369         RF71_8 4370-4371
        F71_8 4372-4373         RF721_8 4374-4375       F721_8 4376-4378
        RF722_8 4379-4380       F722_8 4381-4383        RF73_8 4384-4385
        F73_8 4386-4388         RF74_8 4389-4390        F74_8 4391-4392
        RF81_8 4393-4394        F81_8 4395-4396         RF821_8 4397-4398
        F821_8 4399-4401        RF822_8 4402-4403       F822_8 4404-4406
        RF83_8 4407-4408        F83_8 4409-4411         RF84_8 4412-4413
        F84_8 4414-4415         RF85_8 4416-4417        F85_8 4418-4419
        RF86_8 4420-4421        F86_8 4422-4423         RF9_8 4424-4425
        F9_8 4426-4427          F9A_8 4428-4429         RF91_8 4430-4431
        F91_8 4432-4433         RF92A_8 4434-4435       F92A1_8 4436-4437
        F92A2_8 4438-4439       F92A3_8 4440-4441       F92A4_8 4442-4444
        F92A5_8 4445-4446       F92A6_8 4447-4448       RF92B_8 4449-4450
        F92B1_8 4451-4452       F92B2_8 4453-4454       F92B3_8 4455-4456
        F92B4_8 4457-4459       F92B5_8 4460-4461       F92B6_8 4462-4463
        RF92C_8 4464-4465       F92C1_8 4466-4467       F92C2_8 4468-4469
        F92C3_8 4470-4471       F92C4_8 4472-4474       F92C5_8 4475-4476
        F92C6_8 4477-4478       RF92D_8 4479-4480       F92D1_8 4481-4482
        F92D2_8 4483-4484       F92D3_8 4485-4486       F92D4_8 4487-4489
        F92D5_8 4490-4491       F92D6_8 4492-4493       RF92E_8 4494-4495
        F92E1_8 4496-4497       F92E2_8 4498-4499       F92E3_8 4500-4501
        F92E4_8 4502-4504       F92E5_8 4505-4506       F92E6_8 4507-4508
        RF92F_8 4509-4510       F92F1_8 4511-4512       F92F2_8 4513-4514
        F92F3_8 4515-4516       F92F4_8 4517-4519       F92F5_8 4520-4521
        F92F6_8 4522-4523       RF92G_8 4524-4525       F92G1_8 4526-4527
        F92G2_8 4528-4529       F92G3_8 4530-4531       F92G4_8 4532-4534
        F92G5_8 4535-4536       F92G6_8 4537-4538       RF92H_8 4539-4540
        F92H1_8 4541-4542       F92H2_8 4543-4544       F92H3_8 4545-4546
        F92H4_8 4547-4549       F92H5_8 4550-4551       F92H6_8 4552-4553
        RF92I_8 4554-4555       F92I1_8 4556-4557       F92I2_8 4558-4559
        F92I3_8 4560-4561       F92I4_8 4562-4564       F92I5_8 4565-4566
        F92I6_8 4567-4568       RF92J_8 4569-4570       F92J1_8 4571-4572
        F92J2_8 4573-4574       F92J3_8 4575-4576       F92J4_8 4577-4579
        F92J5_8 4580-4581       F92J6_8 4582-4583       JIGE_8 4584-4585
        RF10_8 4586-4587        F10_8 4588-4589         F10A_8 4590-4591
        RF101_8 4592-4593       F101_8 4594-4595        RF102_8 4596-4597
        F102_8 4598-4599        F103_8 4600-4601        RF103A_8 4602-4603
        F103A8_8 4604-4605      F103A1_8 4606-4607      F103A2_8 4608-4609
        F103A3_8 4610-4611      F103A4_8 4612-4613      F103A7_8 4614-4615
        F103A5_8 4616-4617      RF103B_8 4618-4619      F103B8_8 4620-4621
        F103B1_8 4622-4623      F103B2_8 4624-4625      F103B3_8 4626-4627
        F103B4_8 4628-4629      F103B7_8 4630-4631      F103B5_8 4632-4633
        RF103C_8 4634-4635      F103C8_8 4636-4637      F103C1_8 4638-4639
        F103C2_8 4640-4641      F103C3_8 4642-4643      F103C4_8 4644-4645
        F103C7_8 4646-4647      F103C5_8 4648-4649      RF103D_8 4650-4651
        F103D8_8 4652-4653      F103D1_8 4654-4655      F103D2_8 4656-4657
        F103D3_8 4658-4659      F103D4_8 4660-4661      F103D7_8 4662-4663
        F103D5_8 4664-4665      RF103E_8 4666-4667      F103E8_8 4668-4669
        F103E1_8 4670-4671      F103E2_8 4672-4673      F103E3_8 4674-4675
        F103E4_8 4676-4677      F103E7_8 4678-4679      F103E5_8 4680-4681
        RF103F_8 4682-4683      F103F8_8 4684-4685      F103F1_8 4686-4687
        F103F2_8 4688-4689      F103F3_8 4690-4691      F103F4_8 4692-4693
        F103F7_8 4694-4695      F103F5_8 4696-4697      RF103G_8 4698-4699
        F103G8_8 4700-4701      F103G1_8 4702-4703      F103G2_8 4704-4705
        F103G3_8 4706-4707      F103G4_8 4708-4709      F103G7_8 4710-4711
        F103G5_8 4712-4713      RF103H_8 4714-4715      F103H8_8 4716-4717
        F103H1_8 4718-4719      F103H2_8 4720-4721      F103H3_8 4722-4723
        F103H4_8 4724-4725      F103H7_8 4726-4727      F103H5_8 4728-4729
        RF103I_8 4730-4731      F103I8_8 4732-4733      F103I1_8 4734-4735
        F103I2_8 4736-4737      F103I3_8 4738-4739      F103I4_8 4740-4741
        F103I7_8 4742-4743      F103I5_8 4744-4745      RF103J_8 4746-4747
        F103J8_8 4748-4749      F103J1_8 4750-4751      F103J2_8 4752-4753
        F103J3_8 4754-4755      F103J4_8 4756-4757      F103J7_8 4758-4759
        F103J5_8 4760-4761      RF103K_8 4762-4763      F103K8_8 4764-4765
        F103K1_8 4766-4767      F103K2_8 4768-4769      F103K3_8 4770-4771
        F103K4_8 4772-4773      F103K7_8 4774-4775      F103K5_8 4776-4777
        RF103L_8 4778-4779      F103L8_8 4780-4781      F103L1_8 4782-4783
        F103L2_8 4784-4785      F103L3_8 4786-4787      F103L4_8 4788-4789
        F103L7_8 4790-4791      F103L5_8 4792-4793      RF103M_8 4794-4795
        F103M8_8 4796-4797      F103M1_8 4798-4799      F103M2_8 4800-4801
        F103M3_8 4802-4803      F103M4_8 4804-4805      F103M7_8 4806-4807
        F103M5_8 4808-4809      RF111_8 4810-4811       F111A_8 4812-4813
        F111B_8 4814-4815       F111C_8 4816-4817       RF112_8 4818-4819
        F112A_8 4820-4821       F112B_8 4822-4823       F112C_8 4824-4825
        RF113_8 4826-4827       F113A_8 4828-4829       F113B_8 4830-4831
        F113C_8 4832-4833       RF12_8 4834-4835        F12A_8 4836-4840
        F12B_8 4841-4845        F12C_8 4846-4850        RF13_8 4851-4852
        F13A_8 4853-4857        F13B_8 4858-4862        F13C_8 4863-4867
        RF14_8 4868-4869        F141_8 4870-4871        F142_8 4872-4873
        F143_8 4874-4875        F144_8 4876-4877        F145_8 4878-4879
        F146_8 4880-4881        F147_8 4882-4883        F148_8 4884-4885
        F149_8 4886-4887        RF15_8 4888-4889        F151_8 4890-4891
        F152_8 4892-4893        F153_8 4894-4895        F154_8 4896-4897
        F155_8 4898-4899        F156_8 4900-4901        F157_8 4902-4903
        F158_8 4904-4905        F159_8 4906-4907        F16_8 4908-4909
        G01_8 4910-4911         RG02_8 4912-4913        G02_8 4914-4915
        G1_8 4916-4917          RG21_8 4918-4919        G21_8 4920-4921
        RG22_8 4922-4923        G22_8 4924-4925         RG3_8 4926-4927
        G3_8 4928-4929          RG4_8 4930-4931         G4_8 4932-4933
        RG51_8 4934-4935        G511_8 4936-4938        G512_8 4939-4941
        RG52_8 4942-4943        G521_8 4944-4946        G522_8 4947-4949
        G71_8 4950-4952         G72_8 4953-4955         G81_8 4956-4957
        G82_8 4958-4959         G83_8 4960-4961         G9_8 4962-4963
        RG101_8 4964-4965       G101_8 4966-4968        RG102_8 4969-4970
        G1021_8 4971-4973       G122_8 4974-4976        G123_8 4977-4979
        G11_8 4980-4981         G12_8 4982-4983         G130_8 4984-4985
        RG13_8 4986-4987        G131_8 4988-4989        G132_8 4990-4991
        RG14A_8 4992-4993       G14A1_8 4994-4995       G14A2_8 4996-4998
        RG14B_8 4999-5000       G14B1_8 5001-5002       G14B2_8 5003-5005
        RG14C_8 5006-5007       G14C1_8 5008-5009       G14C2_8 5010-5012
        RG15A_8 5013-5014       G15A1_8 5015-5016       G15A2_8 5017-5018
        G15A3_8 5019-5020       RG15B_8 5021-5022       G15B1_8 5023-5024
        G15B2_8 5025-5026       G15B3_8 5027-5028       RG15C_8 5029-5030
        G15C1_8 5031-5032       G15C2_8 5033-5034       G15C3_8 5035-5036
        RG15D_8 5037-5038       G15D1_8 5039-5040       G15D2_8 5041-5042
        G15D3_8 5043-5044       RG15E_8 5045-5046       G15E1_8 5047-5048
        G15E2_8 5049-5050       G15E3_8 5051-5052       RG15F_8 5053-5054
        G15F1_8 5055-5056       G15F2_8 5057-5058       G15F3_8 5059-5060
        RG15G_8 5061-5062       G15G1_8 5063-5064       G15G2_8 5065-5066
        G15G3_8 5067-5068       RG15H_8 5069-5070       G15H1_8 5071-5072
        G15H2_8 5073-5074       G15H3_8 5075-5076       RG15I_8 5077-5078
        G15I1_8 5079-5080       G15I2_8 5081-5082       G15I3_8 5083-5084
        RG15J_8 5085-5086       G15J1_8 5087-5088       G15J2_8 5089-5090
        G15J3_8 5091-5092       RG15K_8 5093-5094       G15K1_8 5095-5096
        G15K2_8 5097-5098       G15K3_8 5099-5100       RG15L_8 5101-5102
        G15L1_8 5103-5104       G15L2_8 5105-5106       G15L3_8 5107-5108
        RG15M_8 5109-5110       G15M1_8 5111-5112       G15M2_8 5113-5114
        G15M3_8 5115-5116       RG15N_8 5117-5118       G15N1_8 5119-5120
        G15N2_8 5121-5122       G15N3_8 5123-5124       RG15O_8 5125-5126
        G15O1_8 5127-5128       G15O2_8 5129-5130       G15O3_8 5131-5132
        RG15P_8 5133-5134       G15P1_8 5135-5136       G15P2_8 5137-5138
        G15P3_8 5139-5140       RG15Q_8 5141-5142       G15Q1_8 5143-5144
        G15Q2_8 5145-5146       G15Q3_8 5147-5148       RG15R_8 5149-5150
        G15R1_8 5151-5152       G15R2_8 5153-5154       G15R3_8 5155-5156
        RG15S_8 5157-5158       G15S1_8 5159-5160       G15S2_8 5161-5162
        G15S3_8 5163-5164       RG15T_8 5165-5166       G15T1_8 5167-5168
        G15T2_8 5169-5170       G15T3_8 5171-5172       RG15U_8 5173-5174
        G15U1_8 5175-5176       G15U2_8 5177-5178       G15U3_8 5179-5180
        RG15V_8 5181-5182       G15V1_8 5183-5184       G15V2_8 5185-5186
        G15V3_8 5187-5188       H1_8 5189-5190          H21_8 5191-5192
        H22_8 5193-5194         H3_8 5195-5196          H6_8 5197-5198
        H7_8 5199-5200          H71_8 5201-5202         D8VYEAR 5203-5206
        D8VMONTH 5207-5208      D8VDAY 5209-5210        D8RESID 5211-5212
        D8SEX 5213-5214         D8MARRY 5215-5216       D8LIVARR 5217-5218
        D8PERSON 5219-5220      D8GENER 5221-5222       D8DPLACE 5223-5224
        D8CARGIV 5225-5226      D8PCGDAY 5227-5228      D8BEDRID 5229-5230
        D8BEDDAY 5231-5234      D8ILL 5235-5236         D8DISEA1 5237-5238
        D8DIDAY1 5239-5242      D8DISEA2 5243-5244      D8DIDAY2 5245-5248
        D8DISEA3 5249-5250      D8DIDAY3 5251-5254      D8HYPERT 5255-5256
        D8DIABET 5257-5258      D8HEART 5259-5260       D8CVD 5261-5262
        D8PNEUM 5263-5264       D8TUBERC 5265-5266      D8CANCER 5267-5268
        D8GLAUCO 5269-5270      D8PROSTA 5271-5272      D8GYNECO 5273-5274
        D8GASTRI 5275-5276      D8PARKIN 5277-5278      D8BEDSOR 5279-5280
        D8DEMENT 5281-5282      D8PSYCHO 5283-5284      D8NEUROS 5285-5286
        D8ARTHRI 5287-5288      D8OTHERS 5289-5290      D8MEDICA 5291-5292
        D8FINANC 5293-5294      D8INCOME 5295-5299      D8WCFACI 5300-5301
        D8TAPWAT 5302-5303      D8BATHFA 5304-5305      D8HEATER 5306-5307
        D8TVSET 5308-5309       D8WASHMA 5310-5311      D8PHONE 5312-5313
        D8DOCTOR 5314-5315      D8LICDOC 5316-5317      D8WHOPAY 5318-5319
        D8MEDCOS 5320-5324      D8POCKET 5325-5329      D8BATHFU 5330-5331
        D8BATDAY 5332-5335      D8DRESFU 5336-5337      D8DREDAY 5338-5341
        D8TOILFU 5342-5343      D8TOIDAY 5344-5347      D8MOVEFU 5348-5349
        D8MOVDAY 5350-5353      D8CONTFU 5354-5355      D8CONDAY 5356-5359
        D8FEEDFU 5360-5361      D8FEEDAY 5362-5365      D8FULLDA 5366-5369
        D8CARCST 5370-5374      D8DIRCST 5375-5379      D8CARPAY 5380-5381
        D8OUTDOR 5382-5385      D8ACTDAY 5386-5389      D8SMOKE 5390-5391
        D8SMKTIM 5392-5393      D8DRINK 5394-5395       D8KNDDRK 5396-5397
        D8DRKMCH 5398-5399      D8ADVDIR 5400-5401      D8DIRDAY 5402-5405
        D8DREAM 5406-5407       D8PAIN 5408-5409        D8UNCONS 5410-5411
        D8UNCDAY 5412-5415      DTH08_11 5416-5417      YEARIN_11 5418-5421
        MONTHIN_11 5422-5423    DAYIN_11 5424-5425      RESIC_11 5426-5427
        VAGE_11 5428-5430       RA51_11 5431-5432       A51_11 5433-5434
        RA52_11 5435-5436       A52_11 5437-5438        RA53A_11 5439-5440
        A53A1_11 5441-5442      A53A3_11 5443-5444      A53A2_11 5445-5447
        A53A4_11 5448-5449      A53A5_11 5450-5451      RA53B_11 5452-5453
        A53B1_11 5454-5455      A53B3_11 5456-5457      A53B2_11 5458-5460
        A53B4_11 5461-5462      A53B5_11 5463-5464      RA53C_11 5465-5466
        A53C1_11 5467-5468      A53C3_11 5469-5470      A53C2_11 5471-5473
        A53C4_11 5474-5475      A53C5_11 5476-5477      RA53D_11 5478-5479
        A53D1_11 5480-5481      A53D3_11 5482-5483      A53D2_11 5484-5486
        A53D4_11 5487-5488      A53D5_11 5489-5490      RA53E_11 5491-5492
        A53E1_11 5493-5494      A53E3_11 5495-5496      A53E2_11 5497-5499
        A53E4_11 5500-5501      A53E5_11 5502-5503      RA53F_11 5504-5505
        A53F1_11 5506-5507      A53F3_11 5508-5509      A53F2_11 5510-5512
        A53F4_11 5513-5514      A53F5_11 5515-5516      RA53G_11 5517-5518
        A53G1_11 5519-5520      A53G3_11 5521-5522      A53G2_11 5523-5525
        A53G4_11 5526-5527      A53G5_11 5528-5529      RA53H_11 5530-5531
        A53H1_11 5532-5533      A53H3_11 5534-5535      A53H2_11 5536-5538
        A53H4_11 5539-5540      A53H5_11 5541-5542      RA53I_11 5543-5544
        A53I1_11 5545-5546      A53I3_11 5547-5548      A53I2_11 5549-5551
        A53I4_11 5552-5553      A53I5_11 5554-5555      RA53J_11 5556-5557
        A53J1_11 5558-5559      A53J11_11 $5560         A53J3_11 5561-5562
        A53J2_11 5563-5565      A53J4_11 5566-5567      A53J5_11 5568-5569
        RA530_11 5570-5571      A530_11 5572-5573       RA531_11 5574-5575
        A531_11 5576-5577       RA532_11 5578-5579      A532_11 5580-5581
        RA533_11 5582-5583      A533_11 5584-5585       A533A_11 $5586
        RA534_11 5587-5588      A534_11 5589-5592       RA535_11 5593-5594
        A535_11 5595-5596       RA536_11 5597-5598      A536_11 5599-5600
        RA537_11 5601-5602      A537_11 5603-5604       RA540_11 5605-5606
        A540_11 5607-5608       RA541_11 5609-5610      A541_11 5611-5614
        RA542_11 5615-5616      A542_11 5617-5618       A542A_11 $5619
        RA54_11 5620-5621       A54A_11 5622-5625       A54B_11 5626-5627
        B11_11 5628-5629        B12_11 5630-5631        B121_11 5632-5633
        B21_11 5634-5635        B22_11 5636-5637        B23_11 5638-5639
        B24_11 5640-5641        B25_11 5642-5643        B26_11 5644-5645
        B27_11 5646-5647        B28_11 5648-5649        B29_11 5650-5651
        B210_11 5652-5653       C11_11 5654-5655        C12_11 5656-5657
        C13_11 5658-5659        C14_11 5660-5661        C15_11 5662-5663
        C16_11 5664-5665        C21A_11 5666-5667       C21B_11 5668-5669
        C21C_11 5670-5671       C22_11 5672-5673        C31A_11 5674-5675
        C31B_11 5676-5677       C31C_11 5678-5679       C31D_11 5680-5681
        C31E_11 5682-5683       C32_11 5684-5685        C41A_11 5686-5687
        C41B_11 5688-5689       C41C_11 5690-5691       C51A_11 5692-5693
        C51B_11 5694-5695       C52_11 5696-5697        C52X1_11 5698-5699
        C52X2_11 5700-5701      C53A_11 5702-5703       C53B_11 5704-5705
        C53C_11 5706-5707       C54_11 5708-5709        C55_11 5710-5711
        RD1_11 5712-5713        D1_11 5714-5715         RD2_11 5716-5717
        D2_11 5718-5719         RD31_11 5720-5721       D31_11 5722-5723
        RD32_11 5724-5725       D32_11 5726-5727        RD33_11 5728-5729
        D33_11 5730-5731        D33A_11 $5732           RD34_11 5733-5734
        D34_11 5735-5736        RD4MEAT_11 5737-5738    D4MEAT2_11 5739-5740
        D4MEAT1_11 5741-5742    RD4FISH_11 5743-5744    D4FISH2_11 5745-5746
        D4FISH1_11 5747-5748    RD4EGG_11 5749-5750     D4EGG2_11 5751-5752
        D4EGG1_11 5753-5754     RD4BEAN_11 5755-5756    D4BEAN2_11 5757-5758
        D4BEAN1_11 5759-5760    RD4VEG_11 5761-5762     D4VEG2_11 5763-5764
        D4VEG1_11 5765-5766     RD4SUGA_11 5767-5768    D4SUGA2_11 5769-5770
        D4SUGA1_11 5771-5772    RD4TEA_11 5773-5774     D4TEA2_11 5775-5776
        D4TEA1_11 5777-5778     RD4GARL_11 5779-5780    D4GARL2_11 5781-5782
        D4GARL1_11 5783-5784    RDEMILK_11 5785-5786    D4MILK1_11 5787-5788
        D4MILK2_11 5789-5790    RD4NUT_11 5791-5792     D4NUT1_11 5793-5794
        D4NUT2_11 5795-5796     RD4ALGA_11 5797-5798    D4ALGA1_11 5799-5800
        D4ALGA2_11 5801-5802    RD4VIT_11 5803-5804     D4VIT1_11 5805-5806
        D4VIT2_11 5807-5808     RD4DRUG_11 5809-5810    D4DRUG1_11 5811-5812
        D4DRUG2_11 5813-5814    RD5_11 5815-5816        D5_11 5817-5818
        RD6_11 5819-5820        D6A_11 5821-5822        D6B_11 5823-5824
        D6C_11 5825-5826        RD71_11 5827-5828       D71_11 5829-5830
        RD72_11 5831-5832       D72_11 5833-5834        RD73_11 5835-5836
        D73_11 5837-5839        RD74_11 5840-5841       D74_11 5842-5844
        RD75_11 5845-5846       D75_11 5847-5848        RD76_11 5849-5850
        D76_11 5851-5852        RD77_11 5853-5854       D77_11 5855-5856
        RD78_11 5857-5858       D78_11 5859-5860        D78A_11 5861-5862
        D78B_11 5863-5864       RD79_11 5865-5866       D79_11 5867-5868
        D79A_11 5869-5870       D79B_11 5871-5872       RD710_11 5873-5874
        D710_11 5875-5876       D710A_11 5877-5878      D710B_11 5879-5880
        RD81_11 5881-5882       D81_11 5883-5884        RD82_11 5885-5886
        D82_11 5887-5888        RD83_11 5889-5890       D83_11 5891-5893
        RD84_11 5894-5895       D84_11 5896-5898        RD85_11 5899-5900
        D85_11 5901-5902        RD86_11 5903-5904       D86_11 5905-5906
        RD87_11 5907-5908       D87_11 5909-5910        RD91_11 5911-5912
        D91_11 5913-5914        RD92_11 5915-5916       D92_11 5917-5918
        RD93_11 5919-5920       D93_11 5921-5923        RD94_11 5924-5925
        D94_11 5926-5928        RD101_11 5929-5930      D101_11 5931-5932
        RD102_11 5933-5934      D102_11 5935-5937       RD103_11 5938-5939
        D103_11 5940-5942       RD11A_11 5943-5944      D11A_11 5945-5946
        RD11B_11 5947-5948      D11B_11 5949-5950       RD11C_11 5951-5952
        D11C_11 5953-5954       RD11D_11 5955-5956      D11D_11 5957-5958
        RD11E_11 5959-5960      D11E_11 5961-5962       RD11F_11 5963-5964
        D11F_11 5965-5966       RD11G_11 5967-5968      D11G_11 5969-5970
        RD11H_11 5971-5972      D11H_11 5973-5974       RD12_11 5975-5976
        D12_11 5977-5978        RE0_11 5979-5980        E0_11 5981-5982
        RE1_11 5983-5984        E1_11 5985-5986         RE1B_11 5987-5988
        E1B_11 5989-5992        RE2_11 5993-5994        E2_11 5995-5996
        RE2B_11 5997-5998       E2B_11 5999-6002        RE3_11 6003-6004
        E3_11 6005-6006         RE3B_11 6007-6008       E3B_11 6009-6012
        RE4_11 6013-6014        E4_11 6015-6016         RE4B_11 6017-6018
        E4B_11 6019-6022        RE5_11 6023-6024        E5_11 6025-6026
        RE5B_11 6027-6028       E5B_11 6029-6032        RE6_11 6033-6034
        E6_11 6035-6036         RE6B_11 6037-6038       E6B_11 6039-6042
        RE610_11 6043-6044      E610_11 6045-6046       RE62_11 6047-6048
        E62_11 6049-6050        RE63_11 6051-6052       E63_11 6053-6057
        RE64_11 6058-6059       E64_11 6060-6061        E64A_11 $6062
        RE65_11 6063-6064       E65_11 6065-6066        RE67_11 6067-6068
        E67_11 6069-6071        RE7_11 6072-6073        E7_11 6074-6075
        RE8_11 6076-6077        E8_11 6078-6079         RE9_11 6080-6081
        E9_11 6082-6083         RE10_11 6084-6085       E10_11 6086-6087
        RE11_11 6088-6089       E11_11 6090-6091        RE12_11 6092-6093
        E12_11 6094-6095        RE13_11 6096-6097       E13_11 6098-6099
        RE14_11 6100-6101       E14_11 6102-6103        RF21_11 6104-6105
        F21_11 6106-6107        RF211_11 6108-6109      F211_11 6110-6111
        RF22_11 6112-6113       F22_11 6114-6117        RF221_11 6118-6119
        F221_11 6120-6124       RF23_11 6125-6126       F23_11 6127-6128
        RF24_11 6129-6130       F24_11 6131-6132        RF25_11 6133-6134
        F251_11 6135-6139       F252_11 6140-6144       RF25B_11 6145-6146
        F25B1_11 6147-6150      F25B2_11 6151-6152      RF26_11 6153-6154
        F26_11 6155-6158        RF27_11 6159-6160       F27_11 6161-6162
        RF31_11 6163-6164       F31_11 6165-6166        RF32_11 6167-6168
        F32A_11 6169-6170       F32B_11 6171-6172       F32C_11 6173-6174
        F32D_11 6175-6176       F32E_11 6177-6178       RF33_11 6179-6180
        F33_11 6181-6182        RF340_11 6183-6184      F340_11 6185-6186
        RF34_11 6187-6188       F34_11 6189-6190        RF35_11 6191-6192
        F35_11 6193-6197        RF41_11 6198-6199       F41_11 6200-6201
        RF41A_11 6202-6203      F41A1_11 6204-6205      F41A11_11 6206-6209
        F41A12_11 6210-6211     F41A2_11 6212-6213      F41A21_11 6214-6217
        F41A22_11 6218-6219     F41A3_11 6220-6221      F41A31_11 6222-6225
        F41A32_11 6226-6227     RF41B_11 6228-6229      F41B_11 6230-6231
        F41B1_11 6232-6235      F41B2_11 6236-6237      RF42_11 6238-6239
        F42_11 6240-6241        RF43A_11 6242-6243      F43A1_11 6244-6246
        F43A2_11 6247-6248      F43A3_11 6249-6251      F43A4_11 6252-6253
        RF43B_11 6254-6255      F43B1_11 6256-6258      F43B2_11 6259-6260
        F43B3_11 6261-6263      F43B4_11 6264-6265      RF43C_11 6266-6267
        F43C1_11 6268-6270      F43C2_11 6271-6272      F43C3_11 6273-6275
        F43C4_11 6276-6277      RF43D_11 6278-6279      F43D1_11 6280-6282
        F43D2_11 6283-6284      F43D3_11 6285-6287      F43D4_11 6288-6289
        RF44_11 6290-6291       F44_11 6292-6293        RF45_11 6294-6295
        F45_11 6296-6297        RF46_11 6298-6299       F46_11 6300-6301
        RF47_11 6302-6303       F47_11 6304-6305        RF5_11 6306-6307
        F5_11 6308-6309         RF61_11 6310-6311       F61_11 6312-6313
        RF610_11 6314-6315      F610_11 6316-6317       RF62_11 6318-6319
        F62_11 6320-6321        RF63_11 6322-6323       F63_11 6324-6325
        RF64_11 6326-6327       F64A_11 6328-6329       F64B_11 6330-6331
        F64C_11 6332-6333       F64D_11 6334-6335       F64E1_11 6336-6337
        F64F1_11 6338-6339      F64G1_11 6340-6341      F64H1_11 6342-6343
        F64I_11 6344-6345       RF651A1_11 6346-6347    F651A1_11 6348-6352
        RF651B1_11 6353-6354    F651B1_11 6355-6359     RF651A2_11 6360-6361
        F651A2_11 6362-6366     RF651B2_11 6367-6368    F651B2_11 6369-6373
        RF6521_11 6374-6375     F6521_11 6376-6377      RF652A_11 6378-6379
        F652A_11 6380-6394 .12  RF652B_11 6395-6396     F652B_11 6397-6398
        RF66_11 6399-6400       F66_11 6401-6402        RF71_11 6403-6404
        F71_11 6405-6406        RF721_11 6407-6408      F721_11 6409-6411
        RF722_11 6412-6413      F722_11 6414-6416       F722A_11 6417-6418
        RF73_11 6419-6420       F73_11 6421-6423        RF74_11 6424-6425
        F74_11 6426-6427        RF81_11 6428-6429       F81_11 6430-6431
        RF821_11 6432-6433      F821_11 6434-6436       RF822_11 6437-6438
        F822_11 6439-6441       F822A_11 6442-6443      RF83_11 6444-6445
        F83_11 6446-6448        RF84_11 6449-6450       F84_11 6451-6452
        RF85_11 6453-6454       F85_11 6455-6456        RF86_11 6457-6458
        F86_11 6459-6460        RF9_11 6461-6462        F9_11 6463-6464
        F9A_11 6465-6466        RF901_11 6467-6468      F901_11 6469-6470
        RF901A_11 6471-6472     F901A_11 6473-6474      F901B1_11 6475-6477
        F901B2_11 6478-6480     F901B3_11 6481-6483     RF902_11 6484-6485
        F902_11 6486-6487       RF902A_11 6488-6489     F902A_11 6490-6491
        F902B1_11 6492-6494     F902B2_11 6495-6497     F902B3_11 6498-6500
        RF91_11 6501-6502       F91_11 6503-6504        RF92A_11 6505-6506
        F92A1_11 6507-6508      F92A2_11 6509-6510      F92A3_11 6511-6512
        F92A4_11 6513-6515      F92A5_11 6516-6517      F92A6_11 6518-6519
        F92A7_11 6520-6521      RF92B_11 6522-6523      F92B1_11 6524-6525
        F92B2_11 6526-6527      F92B3_11 6528-6529      F92B4_11 6530-6532
        F92B5_11 6533-6534      F92B6_11 6535-6536      F92B7_11 6537-6538
        RF92C_11 6539-6540      F92C1_11 6541-6542      F92C2_11 6543-6544
        F92C3_11 6545-6546      F92C4_11 6547-6549      F92C5_11 6550-6551
        F92C6_11 6552-6553      F92C7_11 6554-6555      RF92D_11 6556-6557
        F92D1_11 6558-6559      F92D2_11 6560-6561      F92D3_11 6562-6563
        F92D4_11 6564-6566      F92D5_11 6567-6568      F92D6_11 6569-6570
        F92D7_11 6571-6572      RF92E_11 6573-6574      F92E1_11 6575-6576
        F92E2_11 6577-6578      F92E3_11 6579-6580      F92E4_11 6581-6583
        F92E5_11 6584-6585      F92E6_11 6586-6587      F92E7_11 6588-6589
        RF92F_11 6590-6591      F92F1_11 6592-6593      F92F2_11 6594-6595
        F92F3_11 6596-6597      F92F4_11 6598-6600      F92F5_11 6601-6602
        F92F6_11 6603-6604      F92F7_11 6605-6606      RF92G_11 6607-6608
        F92G1_11 6609-6610      F92G2_11 6611-6612      F92G3_11 6613-6614
        F92G4_11 6615-6617      F92G5_11 6618-6619      F92G6_11 6620-6621
        F92G7_11 6622-6623      RF92H_11 6624-6625      F92H1_11 6626-6627
        F92H2_11 6628-6629      F92H3_11 6630-6631      F92H4_11 6632-6634
        F92H5_11 6635-6636      F92H6_11 6637-6638      F92H7_11 6639-6640
        RF92I_11 6641-6642      F92I1_11 6643-6644      F92I2_11 6645-6646
        F92I3_11 6647-6648      F92I4_11 6649-6651      F92I5_11 6652-6653
        F92I6_11 6654-6655      F92I7_11 6656-6657      RF92J_11 6658-6659
        F92J1_11 6660-6661      F92J2_11 6662-6663      F92J3_11 6664-6665
        F92J4_11 6666-6668      F92J5_11 6669-6670      F92J6_11 6671-6672
        F92J7_11 6673-6674      JIGE_11 6675-6676       RF10_11 6677-6678
        F10_11 6679-6680        F10A_11 6681-6682       RF101_11 6683-6684
        F101_11 6685-6686       RF102_11 6687-6688      F102_11 6689-6690
        F103_11 6691-6692       RF1030_11 6693-6694     F1030_11 6695-6696
        RF1030A_11 6697-6698    F1030A_11 6699-6700     F1030B1_11 6701-6703
        F1030B2_11 6704-6706    F1030B3_11 6707-6709    RF1031_11 6710-6711
        F1031_11 6712-6713      RF1031A_11 6714-6715    F1031A_11 6716-6717
        F1031B1_11 6718-6720    F1031B2_11 6721-6723    F1031B3_11 6724-6726
        RF103A_11 6727-6728     F103A8_11 6729-6730     F103A1_11 6731-6732
        F103A2_11 6733-6734     F103A3_11 6735-6736     F103A4_11 6737-6738
        F103A7_11 6739-6740     F103A5_11 6741-6742     RF103B_11 6743-6744
        F103B8_11 6745-6746     F103B1_11 6747-6748     F103B2_11 6749-6750
        F103B3_11 6751-6752     F103B4_11 6753-6754     F103B7_11 6755-6756
        F103B5_11 6757-6758     RF103C_11 6759-6760     F103C8_11 6761-6762
        F103C1_11 6763-6764     F103C2_11 6765-6766     F103C3_11 6767-6768
        F103C4_11 6769-6770     F103C7_11 6771-6772     F103C5_11 6773-6774
        RF103D_11 6775-6776     F103D8_11 6777-6778     F103D1_11 6779-6780
        F103D2_11 6781-6782     F103D3_11 6783-6784     F103D4_11 6785-6786
        F103D7_11 6787-6788     F103D5_11 6789-6790     RF103E_11 6791-6792
        F103E8_11 6793-6794     F103E1_11 6795-6796     F103E2_11 6797-6798
        F103E3_11 6799-6800     F103E4_11 6801-6802     F103E7_11 6803-6804
        F103E5_11 6805-6806     RF103F_11 6807-6808     F103F8_11 6809-6810
        F103F1_11 6811-6812     F103F2_11 6813-6814     F103F3_11 6815-6816
        F103F4_11 6817-6818     F103F7_11 6819-6820     F103F5_11 6821-6822
        RF103G_11 6823-6824     F103G8_11 6825-6826     F103G1_11 6827-6828
        F103G2_11 6829-6830     F103G3_11 6831-6832     F103G4_11 6833-6834
        F103G7_11 6835-6836     F103G5_11 6837-6838     RF103H_11 6839-6840
        F103H8_11 6841-6842     F103H1_11 6843-6844     F103H2_11 6845-6846
        F103H3_11 6847-6848     F103H4_11 6849-6850     F103H7_11 6851-6852
        F103H5_11 6853-6854     RF103I_11 6855-6856     F103I8_11 6857-6858
        F103I1_11 6859-6860     F103I2_11 6861-6862     F103I3_11 6863-6864
        F103I4_11 6865-6866     F103I7_11 6867-6868     F103I5_11 6869-6870
        RF103J_11 6871-6872     F103J8_11 6873-6874     F103J1_11 6875-6876
        F103J2_11 6877-6878     F103J3_11 6879-6880     F103J4_11 6881-6882
        F103J7_11 6883-6884     F103J5_11 6885-6886     RF103K_11 6887-6888
        F103K8_11 6889-6890     F103K1_11 6891-6892     F103K2_11 6893-6894
        F103K3_11 6895-6896     F103K4_11 6897-6898     F103K7_11 6899-6900
        F103K5_11 6901-6902     RF103L_11 6903-6904     F103L8_11 6905-6906
        F103L1_11 6907-6908     F103L2_11 6909-6910     F103L3_11 6911-6912
        F103L4_11 6913-6914     F103L7_11 6915-6916     F103L5_11 6917-6918
        RF103M_11 6919-6920     F103M8_11 6921-6922     F103M1_11 6923-6924
        F103M2_11 6925-6926     F103M3_11 6927-6928     F103M4_11 6929-6930
        F103M7_11 6931-6932     F103M5_11 6933-6934     RF1032_11 6935-6936
        F1032_11 6937-6938      RF1033_11 6939-6940     F1033_11 6941-6942
        F111A_11 6943-6944      F111B_11 6945-6946      F111C_11 6947-6948
        F112A_11 6949-6950      F112B_11 6951-6952      F112C_11 6953-6954
        F113A_11 6955-6956      F113B_11 6957-6958      F113C_11 6959-6960
        RF12_11 6961-6962       F12A_11 6963-6967       F12B_11 6968-6972
        F12C_11 6973-6977       RF13_11 6978-6979       F13A_11 6980-6984
        F13B_11 6985-6989       F13C_11 6990-6994       RF14_11 6995-6996
        F141_11 6997-6998       F142_11 6999-7000       F143_11 7001-7002
        F144_11 7003-7004       F145_11 7005-7006       F146_11 7007-7008
        F147_11 7009-7010       F148_11 7011-7012       F149_11 7013-7014
        F14T_11 $7015           RF15_11 7016-7017       F151_11 7018-7019
        F152_11 7020-7021       F153_11 7022-7023       F154_11 7024-7025
        F155_11 7026-7027       F156_11 7028-7029       F157_11 7030-7031
        F158_11 7032-7033       F159_11 7034-7035       F15T_11 $7036
        F16_11 7037-7038        RG01_11 7039-7040       G01_11 7041-7042
        RG02_11 7043-7044       G02_11 7045-7046        RG1_11 7047-7048
        G1_11 7049-7050         G1A_11 $7051            RG21_11 7052-7053
        G21_11 7054-7055        RG22_11 7056-7057       G22_11 7058-7059
        RG23_11 7060-7061       G23_11 7062-7063        RG24_11 7064-7065
        G24_11 7066-7067        RG24A_11 7068-7069      G24A_11 7070-7071
        RG25_11 7072-7073       G25_11 7074-7075        RG25A_11 7076-7077
        G25A_11 7078-7079       RG3_11 7080-7081        G3_11 7082-7083
        RG4_11 7084-7085        G4_11 7086-7087         RG4A_11 7088-7089
        G4A_11 7090-7091        RG4B_11 7092-7093       G4B_11 7094-7095
        RG5_11 7096-7097        G511_11 7098-7100       G512_11 7101-7103
        G521_11 7104-7106       G522_11 7107-7109       G6_11 7110-7111
        G7_11 7112-7114         G81_11 7115-7116        G82_11 7117-7118
        G83_11 7119-7120        G9_11 7121-7122         G101_11 7123-7125
        G1011_11 7126-7127      G102_11 7128-7129       G1021_11 7130-7132
        G122_11 7133-7135       G123_11 7136-7138       G102B_11 7139-7141
        G102C_11 7142-7144      RG106_11 7145-7146      G106_11 7147-7148
        RG1061_11 7149-7150     G1061_11 7151-7152      RG1062_11 7153-7154
        G1062_11 7155-7156      RG1063_11 7157-7158     G1063_11 7159-7160
        G11_11 7161-7162        G12_11 7163-7164        RG130_11 7165-7166
        G130_11 7167-7168       RG13_11 7169-7170       G131_11 7171-7172
        G132_11 7173-7174       RG14A_11 7175-7176      G14A1_11 7177-7178
        G14A2_11 7179-7181      RG14B_11 7182-7183      G14B1_11 7184-7185
        G14B2_11 7186-7188      RG14C_11 7189-7190      G14C1_11 7191-7192
        G14C2_11 7193-7195      G15A1_11 7196-7197      G15A2_11 7198-7199
        G15A3_11 7200-7201      G15B1_11 7202-7203      G15B2_11 7204-7205
        G15B3_11 7206-7207      G15C1_11 7208-7209      G15C2_11 7210-7211
        G15C3_11 7212-7213      G15D1_11 7214-7215      G15D2_11 7216-7217
        G15D3_11 7218-7219      G15E1_11 7220-7221      G15E2_11 7222-7223
        G15E3_11 7224-7225      G15F1_11 7226-7227      G15F2_11 7228-7229
        G15F3_11 7230-7231      G15G1_11 7232-7233      G15G2_11 7234-7235
        G15G3_11 7236-7237      G15H1_11 7238-7239      G15H2_11 7240-7241
        G15H3_11 7242-7243      G15I1_11 7244-7245      G15I2_11 7246-7247
        G15I3_11 7248-7249      G15J1_11 7250-7251      G15J2_11 7252-7253
        G15J3_11 7254-7255      G15K1_11 7256-7257      G15K2_11 7258-7259
        G15K3_11 7260-7261      G15L1_11 7262-7263      G15L2_11 7264-7265
        G15L3_11 7266-7267      G15M1_11 7268-7269      G15M2_11 7270-7271
        G15M3_11 7272-7273      G15N1_11 7274-7275      G15N2_11 7276-7277
        G15N3_11 7278-7279      G15O1_11 7280-7281      G15O2_11 7282-7283
        G15O3_11 7284-7285      G15P1_11 7286-7287      G15P2_11 7288-7289
        G15P3_11 7290-7291      G15Q1_11 7292-7293      G15Q2_11 7294-7295
        G15Q3_11 7296-7297      G15R1_11 7298-7299      G15R2_11 7300-7301
        G15R3_11 7302-7303      G15N1A_11 7304-7305     G15N2A_11 7306-7307
        G15N3A_11 7308-7309     G15S1_11 7310-7311      G15S2_11 7312-7313
        G15S3_11 7314-7315      G15T1_11 7316-7317      G15T2_11 7318-7319
        G15T3_11 7320-7321      G15U1_11 7322-7323      G15U2_11 7324-7325
        G15U3_11 7326-7327      G15J1A_11 7328-7329     G15J2A_11 7330-7331
        G15J3A_11 7332-7333     G15V1_11 7334-7335      G15V2_11 7336-7337
        G15V3_11 7338-7339      G15Y2_11 7340-7341      G15Y3_11 7342-7343
        H1_11 7344-7345         H21_11 7346-7347        H22_11 7348-7349
        H3_11 7350-7351         H6_11 7352-7353         H7_11 7354-7355
        H71_11 7356-7357        D11VYEAR 7358-7361      D11VMONTH 7362-7363
        D11VDAY 7364-7365       D11RESID 7366-7367      D11AGE 7368-7370
        D11MARRY 7371-7372      D11MARRY1 7373-7374     D11YR1 7375-7378
        D11MON1 7379-7380       D11RETIRE 7381-7382     D11RETYR 7383-7386
        D11RETPEN 7387-7390     D11INSUR 7391-7392      D11PAYIND 7393-7397
        D11PAYGOV 7398-7402     D11INSPEN 7403-7406     D11NOINSU 7407-7408
        D11A53A1 7409-7410      D11A53A3 7411-7412      D11A53A4 7413-7415
        D11A53A5 7416-7417      D11A53A6 7418-7419      D11A53B1 7420-7421
        D11A53B3 7422-7423      D11A53B4 7424-7426      D11A53B5 7427-7428
        D11A53B6 7429-7430      D11A53C1 7431-7432      D11A53C3 7433-7434
        D11A53C4 7435-7437      D11A53C5 7438-7439      D11A53C6 7440-7441
        D11A53D1 7442-7443      D11A53D3 7444-7445      D11A53D4 7446-7448
        D11A53D5 7449-7450      D11A53D6 7451-7452      D11A53E1 7453-7454
        D11A53E3 7455-7456      D11A53E4 7457-7459      D11A53E5 7460-7461
        D11A53E6 7462-7463      D11A53F1 7464-7465      D11A53F3 7466-7467
        D11A53F4 7468-7470      D11A53F5 7471-7472      D11A53F6 7473-7474
        D11A53G1 7475-7476      D11A53G3 7477-7478      D11A53G4 7479-7481
        D11A53G5 7482-7483      D11A53G6 7484-7485      D11A53H1 7486-7487
        D11A53H3 7488-7489      D11A53H4 7490-7492      D11A53H5 7493-7494
        D11A53H6 7495-7496      D11A53I1 7497-7498      D11A53I3 7499-7500
        D11A53I4 7501-7503      D11A53I5 7504-7505      D11A53I6 7506-7507
        D11A53J1 7508-7509      D11A53J3 7510-7511      D11A53J4 7512-7514
        D11A53J5 7515-7516      D11A53J6 7517-7518      D11LIVARR 7519-7520
        D11PERSON 7521-7522     D11GENER 7523-7524      D11DPLACE 7525-7526
        D11CARGIV 7527-7528     D11PCGDAY 7529-7530     D11BEDRID 7531-7532
        D11BEDDAY 7533-7536     D11ILL 7537-7538        D11DISEA1 7539-7540
        D11DIDAY1 7541-7544     D11DISEA2 7545-7546     D11DIDAY2 7547-7550
        D11DISEA3 7551-7552     D11DIDAY3 7553-7556     D11HYPERT 7557-7558
        D11DIABET 7559-7560     D11HEART 7561-7562      D11CVD 7563-7564
        D11PNEUM 7565-7566      D11TUBERC 7567-7568     D11CANCER 7569-7570
        D11GLAUCO 7571-7572     D11PROSTA 7573-7574     D11GYNECO 7575-7576
        D11GASTRI 7577-7578     D11PARKIN 7579-7580     D11BEDSOR 7581-7582
        D11DEMENT 7583-7584     D11PSYCHO 7585-7586     D11NEUROS 7587-7588
        D11ARTHRI 7589-7590     D11OTHERS 7591-7592     D11MEDICA 7593-7594
        D11FINANC 7595-7596     D11INCOME 7597-7601     D11WCFACI 7602-7603
        D11TAPWAT 7604-7605     D11BATHFA 7606-7607     D11HEATER 7608-7609
        D11TVSET 7610-7611      D11WASHMA 7612-7613     D11PHONE 7614-7615
        D11DOCTOR 7616-7617     D11LICDOC 7618-7619     D11WHOPAY 7620-7621
        D11MEDCOS 7622-7626     D11POCKET 7627-7631     D11BATHFU 7632-7633
        D11BATDAY 7634-7637     D11BATDAY1 7638-7641    D11BATDAY2 7642-7645
        D11DRESFU 7646-7647     D11DREDAY 7648-7651     D11DREDAY1 7652-7655
        D11DREDAY2 7656-7659    D11TOILFU 7660-7661     D11TOIDAY 7662-7665
        D11TOIDAY1 7666-7669    D11TOIDAY2 7670-7673    D11MOVEFU 7674-7675
        D11MOVDAY 7676-7679     D11MOVDAY1 7680-7683    D11MOVDAY2 7684-7687
        D11CONTFU 7688-7689     D11CONDAY 7690-7693     D11CONDAY1 7694-7697
        D11CONDAY2 7698-7701    D11FEEDFU 7702-7703     D11FEEDAY 7704-7707
        D11FEEDAY1 7708-7711    D11FEEDAY2 7712-7715    D11FULLDA 7716-7719
        D11CARCST 7720-7724     D11DIRCST 7725-7729     D11CARPAY 7730-7731
        D11OUTDOR 7732-7735     D11ACTDAY 7736-7739     D11SMOKE 7740-7741
        D11SMKTIM 7742-7743     D11D21B 7744-7745       D11DRINK 7746-7747
        D11KNDDRK 7748-7749     D11DRKMCH 7750-7751     D11ADVDIR 7752-7753
        D11DIRDAY 7754-7757     D11DREAM 7758-7759      D11PAIN 7760-7761
        D11UNCONS 7762-7763     D11UNCDAY 7764-7767     D11A533 7768-7769
        D11A534 7770-7773       D11A535 7774-7775       D11A536 7776-7777
        D11A537 7778-7779       D11G23 7780-7781        D11G24 7782-7783
        D11G24A 7784-7785       D11G25 7786-7787        D11G25A 7788-7789
        D11G4 7790-7791         D11G4A 7792-7793        D11G4B 7794-7795
        D11G102 7796-7798       D11G106 7799-7800       D11G1061 7801-7802
        D11G1062 7803-7804      D11G1063 7805-7806      DTH11_14 7807-7808
        YEARIN_14 7809-7812     MONTHIN_14 7813-7814    DAYIN_14 7815-7816
        V_BTHYR_14 7817-7820    V_BTHMON_14 7821-7822   RESIDENC_14 7823
        TRUEAGE_14 7824-7826    RA41_14 7827-7828       A41_14 7829-7830
        RA42_14 7831-7832       A42_14 7833             RA43_14 7834-7835
        A43_14 7836             RA51_14 7837            A51_14 7838
        RA52_14 7839-7840       A52_14 7841-7842        RA53A_14 7843-7844
        A53A1_14 7845-7846      A53A11_14 7847          A53A2_14 7848-7850
        A53A3_14 7851-7853      A53A4_14 7854-7855      A53A5_14 7856-7857
        RA53B_14 7858-7859      A53B1_14 7860-7861      A53B11_14 7862
        A53B2_14 7863-7865      A53B3_14 7866-7868      A53B4_14 7869-7870
        A53B5_14 7871-7872      RA53C_14 7873-7874      A53C1_14 7875-7876
        A53C11_14 7877          A53C2_14 7878-7880      A53C3_14 7881-7883
        A53C4_14 7884-7885      A53C5_14 7886-7887      RA53D_14 7888-7889
        A53D1_14 7890-7891      A53D11_14 7892          A53D2_14 7893-7895
        A53D3_14 7896-7898      A53D4_14 7899-7900      A53D5_14 7901-7902
        RA53E_14 7903-7904      A53E1_14 7905-7906      A53E11_14 7907
        A53E2_14 7908-7910      A53E3_14 7911-7913      A53E4_14 7914-7915
        A53E5_14 7916-7917      RA53F_14 7918-7919      A53F1_14 7920-7921
        A53F11_14 7922          A53F2_14 7923-7925      A53F3_14 7926-7928
        A53F4_14 7929-7930      A53F5_14 7931-7932      RA53G_14 7933-7934
        A53G1_14 7935-7936      A53G11_14 7937          A53G2_14 7938-7940
        A53G3_14 7941-7943      A53G4_14 7944-7945      A53G5_14 7946-7947
        RA53H_14 7948-7949      A53H1_14 7950-7951      A53H11_14 7952
        A53H2_14 7953-7955      A53H3_14 7956-7958      A53H4_14 7959-7960
        A53H5_14 7961-7962      RA53I_14 7963-7964      A53I1_14 7965-7966
        A53I11_14 7967          A53I2_14 7968-7970      A53I3_14 7971-7972
        A53I4_14 7973-7974      A53I5_14 7975-7976      RA53J_14 7977-7978
        A53J1_14 7979-7980      A53J11_14 7981          A53J2_14 7982-7984
        A53J3_14 7985-7987      A53J4_14 7988-7989      A53J5_14 7990-7991
        RA530_14 7992-7993      A530_14 7994-7995       A530A_14 7996
        RA531_14 7997-7998      A531_14 7999-8000       A531A_14 8001
        RA532_14 8002-8003      A532_14 8004-8005       RA533_14 8006-8007
        A533_14 8008            A533A_14 8009           RA534_14 8010-8011
        A534_14 8012-8015       RA535_14 8016-8017      A535_14 8018
        RA536_14 8019-8020      A536_14 8021            RA537_14 8022-8023
        A537_14 8024            A537A_14 8025           RA540_14 8026-8027
        A540_14 8028            RA541_14 8029-8030      A541_14 8031-8034
        RA542_14 8035-8036      A542_14 8037-8038       A542A_14 8039
        RA54_14 8040-8041       A54A_14 8042-8045       A54B_14 8046-8047
        B11_14 8048             B12_14 8049             B121_14 8050
        B21_14 8051             B22_14 8052             B23_14 8053
        B24_14 8054             B25_14 8055             B26_14 8056
        B27_14 8057             B28_14 8058             B29_14 8059
        B210_14 8060            C11_14 8061             C12_14 8062
        C13_14 8063             C14_14 8064             C15_14 8065
        C16_14 8066-8067        C21A_14 8068            C21B_14 8069
        C21C_14 8070            C22_14 8071-8072        C31A_14 8073
        C31B_14 8074            C31C_14 8075            C31D_14 8076
        C31E_14 8077            C32_14 8078             C41A_14 8079
        C41B_14 8080            C41C_14 8081            C51A_14 8082
        C51B_14 8083            C52_14 8084             C53A_14 8085
        C53B_14 8086            C53C_14 8087            C54_14 8088
        C55_14 8089-8090        RD1_14 8091             D1_14 8092
        RD2_14 8093             D2_14 8094-8095         RD31_14 8096
        D31_14 8097             RD32_14 8098            D32_14 8099
        RD33_14 8100-8101       D33_14 8102             D33A_14 8103
        RD34_14 8104-8105       D34_14 8106             RD4MEAT_14 8107
        D4MEAT2_14 8108         D4MEAT1_14 8109         RD4FISH_14 8110
        D4FISH2_14 8111         D4FISH1_14 8112         RD4EGG_14 8113
        D4EGG2_14 8114          D4EGG1_14 8115          RD4BEAN_14 8116
        D4BEAN2_14 8117         D4BEAN1_14 8118         RD4VEG_14 8119
        D4VEG2_14 8120          D4VEG1_14 8121          RD4SUGA_14 8122
        D4SUGA2_14 8123         D4SUGA1_14 8124         RD4TEA_14 8125
        D4TEA2_14 8126          D4TEA1_14 8127          RD4GARL_14 8128
        D4GARL2_14 8129         D4GARL1_14 8130         RD4MILK_14 8131-8132
        D4MILK1_14 8133         D4MILK2_14 8134         RD4NUT_14 8135-8136
        D4NUT1_14 8137          D4NUT2_14 8138          RD4ALGA_14 8139-8140
        D4ALGA1_14 8141         D4ALGA2_14 8142         RD4VIT_14 8143-8144
        D4VIT1_14 8145          D4VIT2_14 8146          RD4DRUG_14 8147-8148
        D4DRUG1_14 8149         D4DRUG2_14 8150         D4A_14 8151
        D4B_14 8152             RD5_14 8153             D5_14 8154
        RD6_14 8155             D6A_14 8156             D6B_14 8157
        D6C_14 8158             RD71_14 8159            D71_14 8160
        RD72_14 8161-8162       D72_14 8163             RD73_14 8164-8165
        D73_14 8166-8168        RD74_14 8169-8170       D74_14 8171-8173
        RD75_14 8174-8175       D75_14 8176-8177        RD76_14 8178-8179
        D76_14 8180             RD77_14 8181-8182       D77_14 8183
        RD78_14 8184-8185       D78_14 8186             D78A_14 8187-8188
        D78B_14 8189-8190       RD79_14 8191-8192       D79_14 8193
        D79A_14 8194-8195       D79B_14 8196-8197       RD710_14 8198-8199
        D710_14 8200            D710A_14 8201-8202      D710B_14 8203-8204
        RD81_14 8205            D81_14 8206             RD82_14 8207-8208
        D82_14 8209             RD83_14 8210-8211       D83_14 8212-8214
        RD84_14 8215-8216       D84_14 8217-8219        RD85_14 8220-8221
        D85_14 8222-8223        D85A_14 8224            RD86_14 8225-8226
        D86_14 8227-8228        RD87_14 8229-8230       D87_14 8231
        RD91_14 8232            D91_14 8233             RD92_14 8234-8235
        D92_14 8236             RD93_14 8237-8238       D93_14 8239-8241
        RD94_14 8242-8243       D94_14 8244-8246        RD101_14 8247
        D101_14 8248            RD102_14 8249-8250      D102_14 8251-8253
        RD103_14 8254-8255      D103_14 8256-8258       RD11A_14 8259
        D11A_14 8260            RD11B_14 8261           D11B_14 8262
        RD11C_14 8263           D11C_14 8264            RD11D_14 8265
        D11D_14 8266            RD11E_14 8267           D11E_14 8268
        RD11F_14 8269           D11F_14 8270            RD11G_14 8271
        D11G_14 8272            RD11H_14 8273           D11H_14 8274
        RD12_14 8275-8276       D12_14 8277-8278        RE0_14 8279-8280
        E0_14 8281              RE1_14 8282             E1_14 8283
        RE1B_14 8284-8285       E1B_14 8286-8289        RE2_14 8290
        E2_14 8291              RE2B_14 8292-8293       E2B_14 8294-8297
        RE3_14 8298             E3_14 8299              RE3B_14 8300-8301
        E3B_14 8302-8305        RE4_14 8306             E4_14 8307
        RE4B_14 8308-8309       E4B_14 8310-8313        RE5_14 8314
        E5_14 8315              RE5B_14 8316-8317       E5B_14 8318-8321
        RE6_14 8322             E6_14 8323              RE6B_14 8324-8325
        E6B_14 8326-8329        RE610_14 8330-8331      E610_14 8332-8333
        RE62_14 8334-8335       E62_14 8336-8337        RE63_14 8338-8339
        E63_14 8340-8344        RE64_14 8345-8346       E64_14 8347-8348
        E64A_14 8349            RE65_14 8350-8351       E65_14 8352-8353
        RE67_14 8354-8355       E67_14 8356-8358        RE7_14 8359-8360
        E7_14 8361              RE8_14 8362-8363        E8_14 8364
        RE9_14 8365-8366        E9_14 8367              RE10_14 8368-8369
        E10_14 8370             RE11_14 8371-8372       E11_14 8373
        RE12_14 8374-8375       E12_14 8376             RE13_14 8377-8378
        E13_14 8379             RE14_14 8380-8381       E14_14 8382
        RF1_14 8383-8384        F1_14 8385-8386         RF2_14 8387-8388
        F2_14 8389              RF21_14 8390-8391       F21_14 8392-8393
        RF211_14 8394-8395      F211_14 8396-8397       RF22_14 8398-8399
        F22_14 8400-8403        RF221_14 8404-8405      F221_14 8406-8410
        RF23_14 8411-8412       F23_14 8413-8414        RF24_14 8415-8416
        F24_14 8417             RF25A_14 8418-8419      F25A1_14 8420-8424
        F25A2_14 8425-8429      RF25B_14 8430-8431      F25B1_14 8432-8435
        F25B2_14 8436-8437      RF26_14 8438-8439       F26_14 8440-8442
        RF27_14 8443-8444       F27_14 8445             RF31_14 8446
        F31_14 8447             RF32_14 8448-8449       F32A_14 8450-8451
        F32B_14 8452-8453       F32C_14 8454-8455       F32D_14 8456-8457
        F32E_14 8458-8459       RF33_14 8460            F33_14 8461-8465
        RF340_14 8466-8467      F340_14 8468            RF34_14 8469
        F34_14 8470             RF35_14 8471-8472       F35_14 8473-8477
        RF41_14 8478            F41_14 8479             RF41A_14 8480-8481
        F41A1_14 8482           F41A11_14 8483-8486     F41A12_14 8487-8488
        F41A2_14 8489           F41A21_14 8490-8493     F41A22_14 8494-8495
        F41A3_14 8496           F41A31_14 8497-8500     F41A32_14 8501-8502
        RF41B_14 8503-8504      F41B_14 8505            F41B1_14 8506-8509
        F41B2_14 8510-8511      RF42_14 8512-8513       F42_14 8514-8515
        RF43A_14 8516-8517      F43A1_14 8518-8520      F43A2_14 8521-8522
        F43A3_14 8523-8525      F43A4_14 8526-8527      RF43B_14 8528-8529
        F43B1_14 8530-8532      F43B2_14 8533-8534      F43B3_14 8535-8537
        F43B4_14 8538-8539      RF43C_14 8540-8541      F43C1_14 8542-8544
        F43C2_14 8545-8546      F43C3_14 8547-8549      F43C4_14 8550-8551
        RF43D_14 8552-8553      F43D1_14 8554-8556      F43D2_14 8557-8558
        F43D3_14 8559-8561      F43D4_14 8562-8563      RF44_14 8564-8565
        F44_14 8566-8567        RF45_14 8568-8569       F45_14 8570-8571
        RF46_14 8572-8573       F46_14 8574-8575        RF47_14 8576-8577
        F47_14 8578             RF5_14 8579             F5_11_14 8580-8581
        RF61_14 8582            F61_14 8583             RF610_14 8584-8585
        F610_14 8586-8587       RF62_14 8588-8589       F62_14 8590
        RF63_14 8591-8592       F63_14 8593             RF64_14 8594
        F64A_14 8595            F64B_14 8596            F64C_14 8597
        F64D_14 8598            F64E_14 8599            F64F_14 8600
        F64G_14 8601            F64H_14 8602            F64I_14 8603
        RF651A1_14 8604-8605    F651A1_14 8606-8610     RF651B1_14 8611-8612
        F651B1_14 8613-8617     RF651A2_14 8618-8619    F651A2_14 8620-8624
        RF651B2_14 8625-8626    F651B2_14 8627-8631     RF6521_14 8632-8633
        F6521_14 8634           F6521T_14 8635          RF652A_14 8636-8637
        F652A_14 8638-8652 .12  RF652B_14 8653-8654     F652B_14 8655
        RF66_14 8656-8657       F66_14 8658             RF71_14 8659-8660
        F71_14 8661             RF721_14 8662-8663      F721_14 8664-8666
        RF722_14 8667-8668      F722_14 8669-8671       RF73_14 8672-8673
        F73_14 8674-8676        RF74_14 8677            F74_14 8678-8679
        RF81_14 8680-8681       F81_14 8682             RF821_14 8683-8684
        F821_14 8685-8687       RF822_14 8688-8689      F822_14 8690-8692
        RF83_14 8693-8694       F83_14 8695-8697        RF84_14 8698-8699
        F84_14 8700             RF85_14 8701            F85_14 8702-8703
        RF86_14 8704            F86_14 8705-8706        RF91_14 8707-8708
        F91_14 8709-8710        RF92A_14 8711-8712      F92A1_14 8713-8714
        F92A2_14 8715-8716      F92A3_14 8717-8718      F92A4_14 8719-8721
        F92A5_14 8722-8723      F92A6_14 8724-8725      F92A7_14 8726-8727
        RF92B_14 8728-8729      F92B1_14 8730-8731      F92B2_14 8732-8733
        F92B3_14 8734-8735      F92B4_14 8736-8738      F92B5_14 8739-8740
        F92B6_14 8741-8742      F92B7_14 8743-8744      RF92C_14 8745-8746
        F92C1_14 8747-8748      F92C2_14 8749-8750      F92C3_14 8751-8752
        F92C4_14 8753-8755      F92C5_14 8756-8757      F92C6_14 8758-8759
        F92C7_14 8760-8761      RF92D_14 8762-8763      F92D1_14 8764-8765
        F92D2_14 8766-8767      F92D3_14 8768-8769      F92D4_14 8770-8772
        F92D5_14 8773-8774      F92D6_14 8775-8776      F92D7_14 8777-8778
        RF92E_14 8779-8780      F92E1_14 8781-8782      F92E2_14 8783-8784
        F92E3_14 8785-8786      F92E4_14 8787-8789      F92E5_14 8790-8791
        F92E6_14 8792-8793      F92E7_14 8794-8795      RF92F_14 8796-8797
        F92F1_14 8798-8799      F92F2_14 8800-8801      F92F3_14 8802-8803
        F92F4_14 8804-8806      F92F5_14 8807-8808      F92F6_14 8809-8810
        F92F7_14 8811-8812      RF92G_14 8813-8814      F92G1_14 8815-8816
        F92G2_14 8817-8818      F92G3_14 8819-8820      F92G4_14 8821-8823
        F92G5_14 8824-8825      F92G6_14 8826-8827      F92G7_14 8828-8829
        RF92H_14 8830-8831      F92H1_14 8832-8833      F92H2_14 8834-8835
        F92H3_14 8836-8837      F92H4_14 8838-8840      F92H5_14 8841-8842
        F92H6_14 8843-8844      F92H7_14 8845-8846      RF92I_14 8847-8848
        F92I1_14 8849-8850      F92I2_14 8851-8852      F92I3_14 8853-8854
        F92I4_14 8855-8857      F92I5_14 8858-8859      F92I6_14 8860-8861
        F92I7_14 8862-8863      RF92J_14 8864-8865      F92J1_14 8866-8867
        F92J2_14 8868-8869      F92J3_14 8870-8871      F92J4_14 8872-8874
        F92J5_14 8875-8876      F92J6_14 8877-8878      F92J7_14 8879-8880
        JIGE_14 8881-8882       RF10_14 8883-8884       F10_14 8885-8886
        F10A_14 8887-8888       RF101_14 8889           F101_14 8890-8891
        RF102_14 8892           F102_14 8893-8894       RF103A_14 8895-8896
        F103A8_14 8897-8898     F103A1_14 8899-8900     F103A2_14 8901-8902
        F103A3_14 8903-8905     F103A4_14 8906-8907     F103A7_14 8908-8909
        F103A5_14 8910-8911     RF103B_14 8912-8913     F103B8_14 8914-8915
        F103B1_14 8916-8917     F103B2_14 8918-8919     F103B3_14 8920-8922
        F103B4_14 8923-8924     F103B7_14 8925-8926     F103B5_14 8927-8928
        RF103C_14 8929-8930     F103C8_14 8931-8932     F103C1_14 8933-8934
        F103C2_14 8935-8936     F103C3_14 8937-8939     F103C4_14 8940-8941
        F103C7_14 8942-8943     F103C5_14 8944-8945     RF103D_14 8946-8947
        F103D8_14 8948-8949     F103D1_14 8950-8951     F103D2_14 8952-8953
        F103D3_14 8954-8956     F103D4_14 8957-8958     F103D7_14 8959-8960
        F103D5_14 8961-8962     RF103E_14 8963-8964     F103E8_14 8965-8966
        F103E1_14 8967-8968     F103E2_14 8969-8970     F103E3_14 8971-8973
        F103E4_14 8974-8975     F103E7_14 8976-8977     F103E5_14 8978-8979
        RF103F_14 8980-8981     F103F8_14 8982-8983     F103F1_14 8984-8985
        F103F2_14 8986-8987     F103F3_14 8988-8990     F103F4_14 8991-8992
        F103F7_14 8993-8994     F103F5_14 8995-8996     RF103G_14 8997-8998
        F103G8_14 8999-9000     F103G1_14 9001-9002     F103G2_14 9003-9004
        F103G3_14 9005-9007     F103G4_14 9008-9009     F103G7_14 9010-9011
        F103G5_14 9012-9013     RF103H_14 9014-9015     F103H8_14 9016-9017
        F103H1_14 9018-9019     F103H2_14 9020-9021     F103H3_14 9022-9024
        F103H4_14 9025-9026     F103H7_14 9027-9028     F103H5_14 9029-9030
        RF103I_14 9031-9032     F103I8_14 9033-9034     F103I1_14 9035-9036
        F103I2_14 9037-9038     F103I3_14 9039-9041     F103I4_14 9042-9043
        F103I7_14 9044-9045     F103I5_14 9046-9047     RF103J_14 9048-9049
        F103J8_14 9050-9051     F103J1_14 9052-9053     F103J2_14 9054-9055
        F103J3_14 9056-9058     F103J4_14 9059-9060     F103J7_14 9061-9062
        F103J5_14 9063-9064     RF103K_14 9065-9066     F103K8_14 9067-9068
        F103K1_14 9069-9070     F103K2_14 9071-9072     F103K3_14 9073-9075
        F103K4_14 9076-9077     F103K7_14 9078-9079     F103K5_14 9080-9081
        RF103L_14 9082-9083     F103L8_14 9084-9085     F103L1_14 9086-9087
        F103L2_14 9088-9089     F103L3_14 9090-9092     F103L4_14 9093-9094
        F103L7_14 9095-9096     F103L5_14 9097-9098     RF103M_14 9099-9100
        F103M8_14 9101-9102     F103M1_14 9103-9104     F103M2_14 9105-9106
        F103M3_14 9107-9109     F103M4_14 9110-9111     F103M7_14 9112-9113
        F103M5_14 9114-9115     RF104_14 9116-9117      F104_14 9118-9120
        RF105_14 9121-9122      F105_14 9123-9125       F111A_14 9126-9127
        F111B_14 9128-9129      F111C_14 9130-9131      F112A_14 9132-9133
        F112B_14 9134-9135      F112C_14 9136-9137      F113A_14 9138-9139
        F113B_14 9140-9141      F113C_14 9142-9143      RF12_14 9144-9145
        F12A_14 9146-9150       F12B_14 9151-9155       F12C_14 9156-9160
        RF13_14 9161-9162       F13A_14 9163-9167       F13B_14 9168-9172
        F13C_14 9173-9177       RF14_14 9178-9179       F141_14 9180
        F142_14 9181            F143_14 9182            F144_14 9183
        F145_14 9184            F146_14 9185            F147_14 9186
        F148_14 9187            F149_14 9188            F14T_14 9189
        RF15_14 9190-9191       F151_14 9192            F152_14 9193
        F153_14 9194            F154_14 9195            F155_14 9196
        F156_14 9197            F157_14 9198            F158_14 9199
        F159_14 9200            F15T_14 9201            F16_14 9202
        RG01_14 9203-9204       G01_14 9205             RG02_14 9206-9207
        G02_14 9208-9209        RG1_14 9210-9211        G1_14 9212
        G1A_14 9213             RG21_14 9214-9215       G21_14 9216-9217
        RG22_14 9218-9219       G22_14 9220             RG23_14 9221-9222
        G23_14 9223             RG24_14 9224-9225       G24_14 9226
        RG24A_14 9227-9228      G24A_14 9229-9230       RG25_14 9231-9232
        G25_14 9233             RG25A_14 9234-9235      G25A_14 9236-9237
        RG3_14 9238-9239        G3_14 9240              RG4_14 9241-9242
        G4_14 9243              RG4A_14 9244-9245       G4A_14 9246
        RG4B_14 9247-9248       G4B_14 9249             RG5_14 9250-9251
        G511_14 9252-9254       G512_14 9255-9257       G521_14 9258-9260
        G522_14 9261-9263       G6_14 9264              G7_14 9265-9267
        G81_14 9268             G82_14 9269             G83_14 9270
        G9_14 9271              G101_14 9272-9274       G1011_14 9275-9276
        G102_14 9277            G1021_14 9278-9280      G122_14 9281-9282
        G123_14 9283-9284       G102C_14 9285-9287      RG106_14 9288-9289
        G106_14 9290            RG1061_14 9291-9292     G1061_14 9293
        RG1062_14 9294-9295     G1062_14 9296           RG1063_14 9297-9298
        G1063_14 9299           G11_14 9300             G12_14 9301-9302
        RG130_14 9303-9304      G130_14 9305            RG13_14 9306
        G131_14 9307-9308       G132_14 9309-9310       RG14A_14 9311-9312
        G14A1_14 9313-9314      G14A2_14 9315-9317      G141T_14 9318
        RG14B_14 9319-9320      G14B1_14 9321-9322      G14B2_14 9323-9325
        G142T_14 9326           RG14C_14 9327-9328      G14C1_14 9329-9330
        G14C2_14 9331-9333      G143T_14 9334           G15A1_14 9335
        G15A2_14 9336           G15A3_14 9337-9338      G15B1_14 9339
        G15B2_14 9340           G15B3_14 9341-9342      G15C1_14 9343
        G15C2_14 9344           G15C3_14 9345-9346      G15D1_14 9347
        G15D2_14 9348           G15D3_14 9349-9350      G15E1_14 9351
        G15E2_14 9352           G15E3_14 9353-9354      G15F1_14 9355
        G15F2_14 9356           G15F3_14 9357-9358      G15G1_14 9359
        G15G2_14 9360           G15G3_14 9361-9362      G15H1_14 9363
        G15H2_14 9364           G15H3_14 9365-9366      G15I1_14 9367
        G15I2_14 9368           G15I3_14 9369-9370      G15J1_14 9371
        G15J2_14 9372           G15J3_14 9373-9374      G15K1_14 9375
        G15K2_14 9376           G15K3_14 9377-9378      G15L1_14 9379
        G15L2_14 9380           G15L3_14 9381-9382      G15M1_14 9383
        G15M2_14 9384           G15M3_14 9385-9386      G15N1_14 9387
        G15N2_14 9388           G15N3_14 9389-9390      G15O1_14 9391
        G15O2_14 9392           G15O3_14 9393-9394      G15P1_14 9395
        G15P2_14 9396           G15P3_14 9397-9398      G15Q1_14 9399
        G15Q2_14 9400           G15Q3_14 9401-9402      G15R1_14 9403
        G15R2_14 9404           G15R3_14 9405-9406      G15N1A_14 9407
        G15N2A_14 9408          G15N3A_14 9409-9410     G15S1_14 9411
        G15S2_14 9412           G15S3_14 9413-9414      G15T1_14 9415
        G15T2_14 9416           G15T3_14 9417-9418      G15U1_14 9419
        G15U2_14 9420           G15U3_14 9421-9422      G15J1A_14 9423
        G15J2A_14 9424          G15J3A_14 9425-9426     G15V1_14 9427
        G15V2_14 9428           G15V3_14 9429-9430      G15Y1_14 $9431-9439
        G15Y2_14 9440-9442      G15Y3_14 9443-9444      G15YT_14 9445
        H1_14 9446              H21_14 9447             H22_14 9448-9449
        H3_14 9450              H5_14 9451-9453         H6_14 9454
        H7_14 9455              H71_14 9456-9457        D14VYEAR 9458-9461
        D14VMONTH 9462-9463     D14VDAY 9464-9465       D14AGE 9466-9468
        D14MARRY 9469-9470      D14MARRY1 9471-9472     D14YR1 $9473-9476
        D14MON1 $9477-9478      D14D22 9479-9480        D14D231 $9481-9489
        D14D232 $9490-9498      D14D233 $9499-9507      D14D234 $9508-9516
        D14D24 $9517-9525       D14D25 9526-9528        D14D26A1 9529-9530
        D14D26A2 9531-9532      D14D26A3 $9533-9535     D14D26A4 $9536-9544
        D14D26A5 9545           D14D26A6 9546-9547      D14D26A61 $9548-9549
        D14D26B1 9550-9551      D14D26B2 9552-9553      D14D26B3 9554-9556
        D14D26B4 9557           D14D26B5 9558           D14D26B6 9559-9560
        D14D26B61 $9561-9562    D14D26C1 9563-9564      D14D26C2 9565-9566
        D14D26C3 9567-9569      D14D26C4 9570           D14D26C5 9571
        D14D26C6 9572-9573      D14D26C61 9574-9575     D14D26D1 9576-9577
        D14D26D2 9578-9579      D14D26D3 9580-9582      D14D26D4 9583
        D14D26D5 9584           D14D26D6 9585-9586      D14D26D61 9587-9588
        D14D26E1 9589-9590      D14D26E2 9591-9592      D14D26E3 $9593-9595
        D14D26E4 $9596          D14D26E5 9597           D14D26E6 9598-9599
        D14D26E61 9600          D14D26F1 9601-9602      D14D26F2 9603-9604
        D14D26F3 9605-9606      D14D26F4 $9607          D14D26F5 9608
        D14D26F6 9609-9610      D14D26F61 9611          D14D26G1 9612-9613
        D14D26G11 9614          D14D26G2 9615-9616      D14D26G3 9617-9618
        D14D26G4 9619           D14D26G5 9620           D14D26G6 9621-9622
        D14D26G61 9623          D14D26H1 9624-9625      D14D26H11 9626
        D14D26H2 9627-9628      D14D26H3 9629-9630      D14D26H4 $9631
        D14D26H5 9632           D14D26H6 9633-9634      D14D26H61 9635
        D14D26I1 9636-9637      D14D26I11 9638          D14D26I2 9639-9640
        D14D26I3 9641-9642      D14D26I4 9643           D14D26I5 9644
        D14D26I6 9645-9646      D14D26I61 9647          D14D26J1 9648-9649
        D14D26J11 9650          D14D26J2 9651-9652      D14D26J3 9653
        D14D26J4 9654           D14D26J5 9655           D14D26J51 9656
        D14D26J6 9657-9658      D14D26J61 $9659-9660    D14LIVARR 9661-9662
        D14PERSON 9663-9665     D14GENER 9666-9668      D14DPLACE 9669-9670
        D14CARGIV 9671-9672     D14PCGDAY $9673-9676    D14BEDRID 9677-9678
        D14BEDDAY $9679-9682    D14ILL 9683-9684        D14DISEA1 $9685-9693
        D14DIDAY1 $9694-9697    D14DISEA2 $9698-9706    D14DIDAY2 $9707-9710
        D14DISEA3 $9711-9719    D14DIDAY3 $9720-9723    D14HYPERT 9724-9725
        D14DIABET 9726-9727     D14HEART 9728-9729      D14CVD 9730-9731
        D14PNEUM 9732-9733      D14TUBERC 9734-9735     D14CANCER 9736-9737
        D14GLAUCO 9738-9739     D14PROSTA 9740-9741     D14GYNECO 9742-9743
        D14GASTRI 9744-9745     D14PARKIN 9746-9747     D14BEDSOR 9748-9749
        D14DEMENT 9750-9751     D14PSYCHO 9752-9753     D14NEUROS 9754-9755
        D14ARTHRI 9756-9757     D14OTHERS 9758-9759     D14INCOME $9760-9768
        D14WCFACI 9769-9770     D14TAPWAT 9771-9772     D14BATHFA 9773-9774
        D14HEATER 9775-9776     D14TVSET 9777-9778      D14WASHMA 9779-9780
        D14PHONE 9781-9782      D14DOCTOR 9783-9784     D14LICDOC 9785-9786
        D14WHOPAY $9787-9788    D14MEDCOS $9789-9797    D14POCKET $9798-9802
        D14BATHFU 9803-9804     D14BATDAY $9805-9808    D14DRESFU 9809-9810
        D14DREDAY $9811-9814    D14TOILFU 9815-9816     D14TOIDAY $9817-9820
        D14MOVEFU 9821-9822     D14MOVDAY $9823-9826    D14CONTFU 9827-9828
        D14CONDAY $9829-9832    D14FEEDFU 9833-9834     D14FEEDAY $9835-9838
        D14FULLDA $9839-9847    D14CARCST $9848-9852    D14DIRCST $9853-9857
        D14CARPAY 9858-9859     D14OUTDOR 9860-9863     D14ACTDAY $9864-9867
        D14SMOKE 9868-9869      D14SMKTIM 9870-9871     D14D21B 9872-9873
        D14DRINK 9874-9875      D14KNDDRK 9876-9877     D14DRKMCH $9878-9880
        D14ADVDIR 9881-9882     D14DIRDAY 9883-9886     D14DREAM 9887-9888
        D14PAIN 9889-9890       D14UNCONS 9891-9892     D14UNCDAY $9893-9895
        D14A533 9896-9897       D14A534 $9898-9901      D14A535 9902-9903
        D14A536 9904-9905       D14A537 9906-9907       D14G23 $9908-9909
        D14G24 9910-9911        D14G24A 9912-9913       D14G25 9914-9915
        D14G25A 9916-9917       D14G4 9918-9919         D14G4A 9920-9921
        D14G4B 9922-9923        D14G102 9924-9926       D14G106 9927-9928
        D14G1061 9929-9930      D14G1062 9931-9932      D14G1063 9933-9934
        D14D45 9935-9936        D14D46 $9937            D14D47 9938
        ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id id= province code +given no. + year of the wave of the very first interview' 
   MONTH00 = 'month00 month of the interview in 2000' 
   DAY00   = 'day00 day of the interview in  2000' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'prov national code for provinces sampled' 
   TYPE    = 'type category of the interviewed respondent' 
   REPLACE = 'replace what''s the reason for replace 1998 interviewee?' 
   RELATYPE= 'relatype what kind of sibling?' 
   RESIDENC= 'residenc category of residence of the interviewee at the 2000 survey' 
   TRUEAGE = 'trueage validated age based on 2000 survey information' 
   A1      = 'a1 sex' 
   RA2     = 'ra2 proxy or not for a2' 
   A2      = 'a2 ethnic group' 
   RA41    = 'ra41 proxy or not for a41' 
   A41     = 'a41 which province were you born in?' 
   RA42    = 'ra42 proxy or not for a42' 
   A42     = 'a42 which county (city) were you born in' 
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
   D2      = 'd2 amount of staple food per day (liang,1 liang=50g)' 
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
   RD5     = 'rd5 proxy or not for d5' 
   D5      = 'd5 what kind of water usually drink?' 
   RD6     = 'rd6 proxy or not for d6a d6b d6c' 
   D6A     = 'd6a water you drank at childhood was from' 
   D6B     = 'd6b water you drank at around age 60 was from' 
   D6C     = 'd6c water you drink at present is from' 
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
   D11G    = 'd11g do you watch tv or listen to radio at present ?' 
   RD11H   = 'rd11h proxy or not for d11h' 
   D11H    = 'd11h do you participate religious activities at present?' 
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
   F32     = 'f32 could main financial support maintain your daily cost?' 
   RF33    = 'rf33 proxy or not for f33' 
   F33     = 'f33 other sources of financial support' 
   RF34    = 'rf34 proxy or not for f34' 
   F34     = 'f34 could all financial support maintain your daily cost?' 
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
   RF10    = 'rf10 proxy or not for f10' 
   F10     = 'f10 number of children ever born' 
   RF101   = 'rf101 proxy or not for f101' 
   F101    = 'f101 age when gave the first birth' 
   RF102   = 'rf102 proxy or not for f102' 
   F102    = 'f102 age when gave the last birth' 
   RF103A  = 'rf103a proxy or not for f103a1 to f103a5' 
   F103A1  = 'f103a1 sex of child living separately' 
   F103A2  = 'f103a2 child alive or not' 
   F103A3  = 'f103a3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103A4  = 'f103a4 frequent visits' 
   F103A5  = 'f103a5 residence distance' 
   RF103B  = 'rf103b proxy or not for f103b1 to f103b5' 
   F103B1  = 'f103b1 sex of child living separately' 
   F103B2  = 'f103b2 child alive or not' 
   F103B3  = 'f103b3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103B4  = 'f103b4 frequent visits' 
   F103B5  = 'f103b5 residence distance' 
   RF103C  = 'rf103c proxy or not for f103c1 to f103c5' 
   F103C1  = 'f103c1 sex of child living separately' 
   F103C2  = 'f103c2 child alive or not' 
   F103C3  = 'f103c3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103C4  = 'f103c4 frequent visits' 
   F103C5  = 'f103c5 residence distance' 
   RF103D  = 'rf103d proxy or not for f103d1 to f103d5' 
   F103D1  = 'f103d1 sex of child living separately' 
   F103D2  = 'f103d2 child alive or not' 
   F103D3  = 'f103d3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103D4  = 'f103d4 frequent visits' 
   F103D5  = 'f103d5 residence distance' 
   RF103E  = 'rf103e proxy or not for f103e1 to f103e5' 
   F103E1  = 'f103e1 sex of child living separately' 
   F103E2  = 'f103e2 child alive or not' 
   F103E3  = 'f103e3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103E4  = 'f103e4 frequent visits' 
   F103E5  = 'f103e5 residence distance' 
   RF103F  = 'rf103f proxy or not for f103f1 to f103f5' 
   F103F1  = 'f103f1 sex of child living separately' 
   F103F2  = 'f103f2 child alive or not' 
   F103F3  = 'f103f3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103F4  = 'f103f4 frequent visits' 
   F103F5  = 'f103f5 residence distance' 
   RF103G  = 'rf103g proxy or not for f103g1 to f103g5' 
   F103G1  = 'f103g1 sex of child living separately' 
   F103G2  = 'f103g2 child alive or not' 
   F103G3  = 'f103g3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103G4  = 'f103g4 frequent visits' 
   F103G5  = 'f103g5 residence distance' 
   RF103H  = 'rf103h proxy or not for f103h1 to f103h5' 
   F103H1  = 'f103h1 sex of child living separately' 
   F103H2  = 'f103h2 child alive or not' 
   F103H3  = 'f103h3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103H4  = 'f103h4 frequent visits' 
   F103H5  = 'f103h5 residence distance' 
   RF103I  = 'rf103i proxy or not for f103i1 to f103i5' 
   F103I1  = 'f103i1 sex of child living separately' 
   F103I2  = 'f103i2 child alive or not' 
   F103I3  = 'f103i3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103I4  = 'f103i4 frequent visits' 
   F103I5  = 'f103i5 residence distance' 
   RF103J  = 'rf103j proxy or not for f103j1 to f103j5' 
   F103J1  = 'f103j1 sex of child living separately' 
   F103J2  = 'f103j2 child alive or not' 
   F103J3  = 'f103j3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103J4  = 'f103j4 frequent visits' 
   F103J5  = 'f103j5 residence distance' 
   G1      = 'g1 visual function' 
   G21     = 'g21 number of natural teeth have' 
   G22     = 'g22 have false teeth?' 
   G3      = 'g3 able to use chopsticks to eat?' 
   G4      = 'g4 which hand do you normally use for eating?' 
   G51     = 'g51 systolic' 
   G52     = 'g52 diastolic' 
   G6      = 'g6 rhythm of heart' 
   G7      = 'g7 heart rate' 
   G81     = 'g81 hand behind neck' 
   G82     = 'g82 hand behind lower back' 
   G9      = 'g9 able to stand up from sitting in a chair?' 
   G10     = 'g10 weight' 
   G11     = 'g11 able to pick up a book from the floor?' 
   G12     = 'g12 steps used to turn around 360 degree without help?' 
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
   G15P1   = 'g15p1 suffering from other chronic disease?' 
   G15P2   = 'g15p2 diagnosed by hospital?' 
   G15P3   = 'g15p3 disability in daily life' 
   H1      = 'h1 was interviewee able to hear?' 
   H21     = 'h21 did interviewee able to participate physical check?' 
   H22     = 'h22 the reason of unable to participate physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H6      = 'h6 has interviewer checked whether failing to ask a question?' 
   H7      = 'h7 did anyone help the interviewee to answer question' 
   H71     = 'h71 who helped interviewee to answer question?' 
   H8      = 'h8 did interviewer take a photo for interviewee?' 
   S1      = 's1 interviewer''s opinion based on information got from the elder''s neighbors' 
   S2      = 's2 interviewer''s opinion based on information got from the elder''s neighborhood com' 
   W_2000  = 'w_2000 weight variable, estimated based on 100% age-sex-residence-specific distribution' 
   DTH00_02= 'dth00_02 status of survival, death, or lost to follow-up from the 2000 to 2002 waves' 
   MONTH_2 = 'month_2 month at the interview in 2002' 
   DAY_2   = 'day_2 day at the interview in 2002' 
   RESID_2 = 'resid_2 category of residence of the interviewee in 2002' 
   VAGE_2  = 'vage_2 validated age at 2002 survey' 
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
   D12_2   = 'd12_2 # of traveling byond home county/city in the past two years' 
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
   G13_2   = 'g13_2 # of times suffering from serious illness in the past two years' 
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
   D2COUNTY= 'd2county county of residence at the time of death' 
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
         A41_14 a41_14ff. A42 a42fffff. A42_14 a42fffff.
         A43 a43fffff. A43_14 a43fffff. A51 a51fffff.
         A51_11 a51_11ff. A51_14 a51fffff. A51_2 a51_2fff.
         A51_5 a51_5fff. A51_8 a51_8fff. A52 a52fffff.
         A52_11 a52_11ff. A52_14 a52fffff. A52_2 a52_2fff.
         A52_5 a52_5fff. A52_8 a52_8fff. A530_11 a530_11f.
         A530_14 a530_14f. A530_5 a530_5ff. A530_8 a530_8ff.
         A531_11 a531_11f. A531_14 a531_14f. A531_2 a531_2ff.
         A531_5 a531_5ff. A531_8 a531_8ff. A532_11 a532_11f.
         A532_14 a532_14f. A532_2 a532_2ff. A532_5 a532_5ff.
         A532_8 a532_8ff. A533_11 a533_11f. A533_14 a533_14f.
         A534_11 a534_11f. A534_14 a534_14f. A535_11 a535_11f.
         A535_14 a535_14f. A536_11 a535_11f. A536_14 a535_14f.
         A537_11 a537_11f. A537_14 a537_14f. A53A1 a53a1fff.
         A53A1_11 a53a1_1f. A53A1_14 a53a1fff. A53A1_2 a53a1_2f.
         A53A1_5 a53a1_5f. A53A1_8 a53a1_8f. A53A2 a53a2fff.
         A53A2_11 a53a2_1f. A53A2_14 a53a2fff. A53A2_2 a53a2_2f.
         A53A2_5 a53a2_5f. A53A2_8 a53a2_8f. A53A3 a53a3fff.
         A53A3_11 a53a3_1f. A53A3_14 a53a3fff. A53A3_2 a53a3_2f.
         A53A3_5 a53a3_5f. A53A3_8 a53a3_8f. A53A4_11 a53a4_1f.
         A53A4_14 a53a4_1_1f. A53A4_5 a53a4_5f. A53A4_8 a53a4_8f.
         A53A5_11 a53a5_1f. A53A5_14 a54bffff. A53B1 a53a1fff.
         A53B1_11 a53a1_1f. A53B1_14 a53a1fff. A53B1_2 a53a1_2f.
         A53B1_5 a53a1_5f. A53B1_8 a53a1_8f. A53B2 a53a2fff.
         A53B2_11 a53a2_1f. A53B2_14 a53a2fff. A53B2_2 a53a2_2f.
         A53B2_5 a53a2_5f. A53B2_8 a53a2_8f. A53B3 a53a3fff.
         A53B3_11 a53b3_1f. A53B3_14 a53a3fff. A53B3_2 a53a3_2f.
         A53B3_5 a53a3_5f. A53B3_8 a53b3_8f. A53B4_11 a53a4_1f.
         A53B4_14 a53a4_1_1f. A53B4_5 a53a4_5f. A53B4_8 a53a4_8f.
         A53B5_11 a53a5_1f. A53B5_14 a54bffff. A53C1 a53a1fff.
         A53C1_11 a53a1_1f. A53C1_14 a53a1fff. A53C1_2 a53a1_2f.
         A53C1_5 a53a1_5f. A53C1_8 a53a1_8f. A53C2 a53a2fff.
         A53C2_11 a53a2_1f. A53C2_14 a53a2fff. A53C2_2 a53a2_2f.
         A53C2_5 a53a2_5f. A53C2_8 a53a2_8f. A53C3 a53a3fff.
         A53C3_11 a53b3_1f. A53C3_14 a53a3fff. A53C3_2 a53a3_2f.
         A53C3_5 a53a3_5f. A53C3_8 a53b3_8f. A53C4_11 a53a4_1f.
         A53C4_14 a53a4_1_1f. A53C4_5 a53a4_5f. A53C4_8 a53a4_8f.
         A53C5_11 a53a5_1f. A53C5_14 a54bffff. A53D1 a53a1fff.
         A53D1_11 a53a1_1f. A53D1_14 a53a1fff. A53D1_2 a53a1_2f.
         A53D1_5 a53a1_5f. A53D1_8 a53a1_8f. A53D2 a53a2fff.
         A53D2_11 a53a2_1f. A53D2_14 a53a2fff. A53D2_2 a53a2_2f.
         A53D2_5 a53a2_5f. A53D2_8 a53a2_8f. A53D3 a53a3fff.
         A53D3_11 a53b3_1f. A53D3_14 a53a3fff. A53D3_2 a53a3_2f.
         A53D3_5 a53a3_5f. A53D3_8 a53b3_8f. A53D4_11 a53a4_1f.
         A53D4_14 a53a4_1_1f. A53D4_5 a53a4_5f. A53D4_8 a53a4_8f.
         A53D5_11 a53a5_1f. A53D5_14 a54bffff. A53E1 a53a1fff.
         A53E1_11 a53a1_1f. A53E1_14 a53a1fff. A53E1_2 a53a1_2f.
         A53E1_5 a53a1_5f. A53E1_8 a53a1_8f. A53E2 a53a2fff.
         A53E2_11 a53a2_1f. A53E2_14 a53a2fff. A53E2_2 a53a2_2f.
         A53E2_5 a53a2_5f. A53E2_8 a53a2_8f. A53E3 a53a3fff.
         A53E3_11 a53b3_1f. A53E3_14 a53a3fff. A53E3_2 a53a3_2f.
         A53E3_5 a53a3_5f. A53E3_8 a53b3_8f. A53E4_11 a53e4_1f.
         A53E4_14 a53a4_1_1f. A53E4_5 a53a4_5f. A53E4_8 a53a4_8f.
         A53E5_11 a53a5_1f. A53E5_14 a54bffff. A53F1 a53a1fff.
         A53F1_11 a53a1_1f. A53F1_14 a53a1fff. A53F1_2 a53a1_2f.
         A53F1_5 a53a1_5f. A53F1_8 a53a1_8f. A53F2 a53a2fff.
         A53F2_11 a53a2_1f. A53F2_14 a53a2fff. A53F2_2 a53a2_2f.
         A53F2_5 a53a2_5f. A53F2_8 a53a2_8f. A53F3 a53a3fff.
         A53F3_11 a53b3_1f. A53F3_14 a53a3fff. A53F3_2 a53a3_2f.
         A53F3_5 a53a3_5f. A53F3_8 a53b3_8f. A53F4_11 a53e4_1f.
         A53F4_14 a53a4_1_1f. A53F4_5 a53a4_5f. A53F4_8 a53a4_8f.
         A53F5_11 a53a5_1f. A53F5_14 a54bffff. A53G1 a53a1fff.
         A53G1_11 a53a1_1f. A53G1_14 a53a1fff. A53G1_2 a53a1_2f.
         A53G1_5 a53a1_5f. A53G1_8 a53a1_8f. A53G2 a53a2fff.
         A53G2_11 a53a2_1f. A53G2_14 a53a2fff. A53G2_2 a53a2_2f.
         A53G2_5 a53a2_5f. A53G2_8 a53a2_8f. A53G3 a53a3fff.
         A53G3_11 a53b3_1f. A53G3_14 a53a3fff. A53G3_2 a53a3_2f.
         A53G3_5 a53a3_5f. A53G3_8 a53b3_8f. A53G4_11 a53a4_1f.
         A53G4_14 a53a4_1_1f. A53G4_5 a53a4_5f. A53G4_8 a53a4_8f.
         A53G5_11 a53a5_1f. A53G5_14 a54bffff. A53H1 a53a1fff.
         A53H1_11 a53a1_1f. A53H1_14 a53a1fff. A53H1_2 a53a1_2f.
         A53H1_5 a53a1_5f. A53H1_8 a53a1_8f. A53H2 a53a2fff.
         A53H2_11 a53a2_1f. A53H2_14 a53a2fff. A53H2_2 a53a2_2f.
         A53H2_5 a53a2_5f. A53H2_8 a53a2_8f. A53H3 a53a3fff.
         A53H3_11 a53b3_1f. A53H3_14 a53a3fff. A53H3_2 a53a3_2f.
         A53H3_5 a53a3_5f. A53H3_8 a53b3_8f. A53H4_11 a53a4_1f.
         A53H4_14 a53a4_1_1f. A53H4_5 a53a4_5f. A53H4_8 a53a4_8f.
         A53H5_11 a53a5_1f. A53H5_14 a54bffff. A53I1 a53a1fff.
         A53I1_11 a53a1_1f. A53I1_14 a53a1fff. A53I1_2 a53a1_2f.
         A53I1_5 a53a1_5f. A53I1_8 a53a1_8f. A53I2 a53a2fff.
         A53I2_11 a53a2_1f. A53I2_14 a53a2fff. A53I2_2 a53a2_2f.
         A53I2_5 a53a2_5f. A53I2_8 a53a2_8f. A53I3 a53a3fff.
         A53I3_11 a53b3_1f. A53I3_14 a53a3fff. A53I3_2 a53a3_2f.
         A53I3_5 a53a3_5f. A53I3_8 a53b3_8f. A53I4_11 a53e4_1f.
         A53I4_14 a53a4_1_1f. A53I4_5 a53a4_5f. A53I4_8 a53a4_8f.
         A53I5_11 a53a5_1f. A53I5_14 a54bffff. A53J1 a53a1fff.
         A53J1_11 a53a1_1f. A53J1_14 a53a1fff. A53J1_2 a53a1_2f.
         A53J1_5 a53a1_5f. A53J1_8 a53a1_8f. A53J2 a53a2fff.
         A53J2_11 a53a2_1f. A53J2_14 a53a2fff. A53J2_2 a53a2_2f.
         A53J2_5 a53a2_5f. A53J2_8 a53a2_8f. A53J3 a53a3fff.
         A53J3_11 a53b3_1f. A53J3_14 a53a3fff. A53J3_2 a53a3_2f.
         A53J3_5 a53a3_5f. A53J3_8 a53b3_8f. A53J4_11 a53a4_1f.
         A53J4_14 a53a4_1_1f. A53J4_5 a53a4_5f. A53J4_8 a53a4_8f.
         A53J5_11 a53a5_1f. A53J5_14 a54bffff. A53K1 a53a1fff.
         A53K1_2 a53a1_2f. A53K1_5 a53a1_5f. A53K1_8 a53a1_8f.
         A53K2 a53a2fff. A53K2_2 a53a2_2f. A53K2_5 a53a2_5f.
         A53K2_8 a53a2_8f. A53K3 a53a3fff. A53K3_2 a53a3_2f.
         A53K3_5 a53a3_5f. A53K3_8 a53b3_8f. A53K4_5 a53a4_5f.
         A53K4_8 a53a4_8f. A53L1 a53a1fff. A53L1_2 a53a1_2f.
         A53L1_5 a53a1_5f. A53L1_8 a53a1_8f. A53L2 a53a2fff.
         A53L2_2 a53a2_2f. A53L2_5 a53a2_5f. A53L2_8 a53a2_8f.
         A53L3 a53a3fff. A53L3_2 a53a3_2f. A53L3_5 a53a3_5f.
         A53L3_8 a53b3_8f. A53L4_5 a53a4_5f. A53L4_8 a53a4_8f.
         A540_11 a540_11f. A540_14 a540_14f. A540_5 a540_5ff.
         A541_11 a541_11f. A541_14 a541_14f. A541_5 a541_5ff.
         A541_8 a541_8ff. A542_11 a542_11f. A542_14 a542_14f.
         A542_5 a542_5ff. A542_8 a542_8ff. A54A a54affff.
         A54A_11 a54a_11f. A54A_14 a54affff. A54A_2 a54a_2ff.
         A54A_5 a54a_5ff. A54A_8 a54a_8ff. A54B a54bffff.
         A54B_11 a54b_11f. A54B_14 a54bffff. A54B_2 a54b_2ff.
         A54B_5 a54b_5ff. A54B_8 a54b_8ff. B11 b11fffff.
         B11_11 b11_11ff. B11_14 b11fffff. B11_2 b11_2fff.
         B11_5 b11_5fff. B11_8 b11_8fff. B12 b11fffff.
         B121_11 b121_11f. B121_14 b121_14f. B121_2 b121_2ff.
         B121_5 b121_5ff. B121_8 b121_8ff. B12_11 b11_11ff.
         B12_14 b11fffff. B12_2 b11_2fff. B12_5 b11_5fff.
         B12_8 b11_8fff. B21 b21fffff. B210_11 b210_11f.
         B210_14 b210_14f. B21_11 b21_11ff. B21_14 b21fffff.
         B21_2 b21_2fff. B21_5 b21_5fff. B21_8 b21_8fff.
         B22 b21fffff. B22_11 b21_11ff. B22_14 b21fffff.
         B22_2 b21_2fff. B22_5 b21_5fff. B22_8 b21_8fff.
         B23 b21fffff. B23_11 b21_11ff. B23_14 b21fffff.
         B23_2 b21_2fff. B23_5 b21_5fff. B23_8 b21_8fff.
         B24 b21fffff. B24_11 b21_11ff. B24_14 b21fffff.
         B24_2 b21_2fff. B24_5 b21_5fff. B24_8 b21_8fff.
         B25 b21fffff. B25_11 b21_11ff. B25_14 b21fffff.
         B25_2 b21_2fff. B25_5 b21_5fff. B25_8 b21_8fff.
         B26 b21fffff. B26_11 b21_11ff. B26_14 b21fffff.
         B26_2 b21_2fff. B26_5 b21_5fff. B26_8 b21_8fff.
         B27 b21fffff. B27_11 b21_11ff. B27_14 b21fffff.
         B27_2 b21_2fff. B27_5 b21_5fff. B27_8 b21_8fff.
         B28_11 b28_11ff. B28_14 b28_14ff. B29_11 b28_11ff.
         B29_14 b28_14ff. C11 c11fffff. C11_11 c11_11ff.
         C11_14 c11fffff. C11_2 c11_2fff. C11_5 c11_5fff.
         C11_8 c11_8fff. C12 c11fffff. C12_11 c11_11ff.
         C12_14 c11fffff. C12_2 c11_2fff. C12_5 c11_5fff.
         C12_8 c11_8fff. C13 c11fffff. C131_2 c11_2fff.
         C13_11 c11_11ff. C13_14 c11fffff. C13_2 c11_2fff.
         C13_5 c11_5fff. C13_8 c11_8fff. C14 c11fffff.
         C14_11 c11_11ff. C14_14 c11fffff. C14_2 c11_2fff.
         C14_5 c11_5fff. C14_8 c11_8fff. C15 c11fffff.
         C15_11 c11_11ff. C15_14 c11fffff. C15_2 c11_2fff.
         C15_5 c11_5fff. C15_8 c11_8fff. C16 c16fffff.
         C161_2 c11_2fff. C162_2 c11_2fff. C163_2 c11_2fff.
         C16_11 c16_11ff. C16_14 c16fffff. C16_2 c16_2fff.
         C16_5 c16_5fff. C16_8 c16_8fff. C21A c11fffff.
         C21A_11 c11_11ff. C21A_14 c11fffff. C21A_2 c11_2fff.
         C21A_5 c11_5fff. C21A_8 c11_8fff. C21B c11fffff.
         C21B_11 c11_11ff. C21B_14 c11fffff. C21B_2 c11_2fff.
         C21B_5 c11_5fff. C21B_8 c11_8fff. C21C c11fffff.
         C21C_11 c11_11ff. C21C_14 c11fffff. C21C_2 c11_2fff.
         C21C_5 c11_5fff. C21C_8 c11_8fff. C22 c22fffff.
         C22_11 c22_11ff. C22_14 c22fffff. C22_2 c22_2fff.
         C22_5 c22_5fff. C22_8 c22_8fff. C31A c11fffff.
         C31A_11 c11_11ff. C31A_14 c11fffff. C31A_2 c11_2fff.
         C31A_5 c11_5fff. C31A_8 c11_8fff. C31B c11fffff.
         C31B_11 c11_11ff. C31B_14 c11fffff. C31B_2 c11_2fff.
         C31B_5 c11_5fff. C31B_8 c11_8fff. C31C c11fffff.
         C31C_11 c11_11ff. C31C_14 c11fffff. C31C_2 c11_2fff.
         C31C_5 c11_5fff. C31C_8 c11_8fff. C31D c11fffff.
         C31D_11 c31d_11f. C31D_14 c11fffff. C31D_2 c11_2fff.
         C31D_5 c11_5fff. C31D_8 c31d_8ff. C31E c11fffff.
         C31E_11 c11_11ff. C31E_14 c11fffff. C31E_2 c11_2fff.
         C31E_5 c11_5fff. C31E_8 c11_8fff. C32 c32fffff.
         C32_11 c32_11ff. C32_14 c32fffff. C32_2 c11_2fff.
         C32_5 c11_5fff. C32_8 c32_8fff. C41A c11fffff.
         C41A_11 c11_11ff. C41A_14 c11fffff. C41A_2 c11_2fff.
         C41A_5 c11_5fff. C41A_8 c11_8fff. C41B c11fffff.
         C41B_11 c11_11ff. C41B_14 c11fffff. C41B_2 c11_2fff.
         C41B_5 c11_5fff. C41B_8 c11_8fff. C41C c11fffff.
         C41C_11 c11_11ff. C41C_14 c11fffff. C41C_2 c11_2fff.
         C41C_5 c11_5fff. C41C_8 c11_8fff. C51A c11fffff.
         C51A_11 c11_11ff. C51A_14 c11fffff. C51A_2 c11_2fff.
         C51A_5 c11_5fff. C51A_8 c11_8fff. C51B c11fffff.
         C51B_11 c11_11ff. C51B_14 c11fffff. C51B_2 c11_2fff.
         C51B_5 c11_5fff. C51B_8 c11_8fff. C52 c52fffff.
         C521_2 c11_2fff. C52X1_11 c11_11ff. C52X1_8 c11_8fff.
         C52X2_11 c11_11ff. C52X2_8 c11_8fff. C52_11 c11_11ff.
         C52_14 c52fffff. C52_2 c11_2fff. C52_5 c11_5fff.
         C52_8 c11_8fff. C53A c53affff. C53A_11 c53a_11f.
         C53A_14 c53affff. C53A_2 c11_2fff. C53A_5 c11_5fff.
         C53A_8 c53a_8ff. C53B c53affff. C53B_11 c53a_11f.
         C53B_14 c53affff. C53B_2 c11_2fff. C53B_5 c11_5fff.
         C53B_8 c53a_8ff. C53C c53affff. C53C_11 c53a_11f.
         C53C_14 c53affff. C53C_2 c11_2fff. C53C_5 c11_5fff.
         C53C_8 c53a_8ff. C54 c54fffff. C54_11 c54_11ff.
         C54_14 c54fffff. C54_2 c54_2fff. C54_5 c54_5fff.
         C54_8 c54_8fff. C55 c55fffff. C55_11 c55_11ff.
         C55_14 c55fffff. C55_2 c55_2fff. C55_5 c55_5fff.
         C55_8 c55_8fff. D1 d1ffffff. D101 d71fffff.
         D101_11 d91_11ff. D101_14 d71fffff. D101_5 d71_5fff.
         D101_8 d91_8fff. D102 a53a2fff. D102_11 a53a2_1f.
         D102_14 a53a2fff. D102_5 a53a2_5f. D102_8 a53a2_8f.
         D103 a53a2fff. D103_11 a53a2_1f. D103_14 a53a2fff.
         D103_5 a53a2_5f. D103_8 a53a2_8f. D11A d11affff.
         D11A533 d11a533f. D11A534 d11yr1ff. D11A535 d11a535f.
         D11A536 d11a535f. D11A537 d11a537f. D11A53A1 d11a53af.
         D11A53A3 d11a53a_1f. D11A53A4 d11a53a_2f. D11A53A5 d11a53a_3f.
         D11A53A6 d11mon1f. D11A53B1 d11a53af. D11A53B3 d11a53a_1f.
         D11A53B4 d11a53a_2f. D11A53B5 d11a53a_3f. D11A53B6 d11mon1f.
         D11A53C1 d11a53af. D11A53C3 d11a53a_1f. D11A53C4 d11a53a_2f.
         D11A53C5 d11a53a_3f. D11A53C6 d11mon1f. D11A53D1 d11a53af.
         D11A53D3 d11a53a_1f. D11A53D4 d11a53a_2f. D11A53D5 d11a53a_3f.
         D11A53D6 d11mon1f. D11A53E1 d11a53af. D11A53E3 d11a53a_1f.
         D11A53E4 d11a53a_2f. D11A53E5 d11a53a_3f. D11A53E6 d11mon1f.
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
         D11A_14 d11affff. D11A_2 d11a_2ff. D11A_5 d11a_5ff.
         D11A_8 d11a_8ff. D11B d11affff. D11BATDAY d11beddf.
         D11BATDAY1 d11beddf. D11BATDAY2 d11batdf. D11BATHFA d11wcfaf.
         D11BATHFU d11bathf. D11BEDDAY d11beddf. D11BEDRID d11bedrf.
         D11BEDSOR d11hypef. D11B_11 d11a_11f. D11B_14 d11affff.
         D11B_2 d11a_2ff. D11B_5 d11a_5ff. D11B_8 d11a_8ff.
         D11C d11affff. D11CANCER d11hypef. D11CARCST d11medcf.
         D11CARGIV d11cargf. D11CARPAY d11carpf. D11CONDAY d11beddf.
         D11CONDAY1 d11batdf. D11CONDAY2 d11batdf. D11CONTFU d11contf.
         D11CVD d11hypef. D11C_11 d11a_11f. D11C_14 d11affff.
         D11C_2 d11a_2ff. D11C_5 d11a_5ff. D11C_8 d11a_8ff.
         D11D d11affff. D11D21B d11d21bf. D11DEMENT d11hypef.
         D11DIABET d11hypef. D11DIDAY1 d11didaf. D11DIDAY2 d11didaf.
         D11DIDAY3 d11didaf. D11DIRCST d11medcf. D11DIRDAY d11yr1ff.
         D11DISEA1 d11disef. D11DISEA2 d11disef. D11DISEA3 d11disef.
         D11DOCTOR d11doctf. D11DPLACE d11dplaf. D11DREAM d11dreaf.
         D11DREDAY d11beddf. D11DREDAY1 d11batdf. D11DREDAY2 d11batdf.
         D11DRESFU d11bathf. D11DRINK d11doctf. D11DRKMCH d11mon1f.
         D11D_11 d11a_11f. D11D_14 d11affff. D11D_2 d11a_2ff.
         D11D_5 d11a_5ff. D11D_8 d11a_8ff. D11E d11affff.
         D11E_11 d11a_11f. D11E_14 d11affff. D11E_2 d11a_2ff.
         D11E_5 d11a_5ff. D11E_8 d11a_8ff. D11F d11affff.
         D11FEEDAY d11beddf. D11FEEDAY1 d11batdf. D11FEEDAY2 d11batdf.
         D11FEEDFU d11bathf. D11FINANC d11finaf. D11FULLDA d11beddf.
         D11F_11 d11a_11f. D11F_14 d11affff. D11F_2 d11a_2ff.
         D11F_5 d11a_5ff. D11F_8 d11a_8ff. D11G d11affff.
         D11G102 d11g102f. D11G106 d11a535f. D11G1061 d11g106f.
         D11G1062 d11g106_1f. D11G1063 d11g106_2f. D11G23 d11g23ff.
         D11G24 d11a535f. D11G24A d11illff. D11G25 d11a535f.
         D11G25A d11illff. D11G4 d11g4fff. D11G4A d11g4aff.
         D11G4B d11g4bff. D11GASTRI d11hypef. D11GENER d11genef.
         D11GLAUCO d11hypef. D11GYNECO d11hypef. D11G_11 d11a_11f.
         D11G_14 d11affff. D11G_2 d11a_2ff. D11G_5 d11a_5ff.
         D11G_8 d11a_8ff. D11H d11affff. D11HEART d11hypef.
         D11HEATER d11wcfaf. D11HYPERT d11hypef. D11H_11 d11a_11f.
         D11H_14 d11affff. D11H_2 d11a_2ff. D11H_5 d11a_5ff.
         D11H_8 d11a_8ff. D11ILL d11illff. D11INCOME d11incof.
         D11INSPEN d11inspf. D11INSUR d11insuf. D11I_2 d11a_2ff.
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
         D11YR1 d11yr1ff. D12_11 a54b_11f. D12_14 d2ffffff.
         D12_2 d12_2fff. D12_5 d12_5fff. D12_8 a54b_8ff.
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
         D1_2 d1_2ffff. D1_5 d1_5ffff. D1_8 d1_8ffff.
         D2 d2ffffff. D2ACTDAY d2actdaf. D2ARTHRI d2hyperf.
         D2BATDAY d2batdaf. D2BATHFA d2wcfacf. D2BATHFU d2bathff.
         D2BEDDAY d2beddaf. D2BEDRID d2bedrif. D2BEDSOR d2hyperf.
         D2CARGIV d2cargif. D2CAUSE d2causef. D2CONDAY d2batdaf.
         D2CONTFU d2contff. D2COUNTY d2countf. D2CVD d2hyperf.
         D2DAYIN d2vmontf. D2DEMENT d2hyperf. D2DIABET d2hyperf.
         D2DIDAY1 d2didayf. D2DIDAY2 d2didayf. D2DIDAY3 d2didayf.
         D2DISEA1 d2diseaf. D2DISEA2 d2diseaf. D2DISEA3 d2diseaf.
         D2DOCTOR d2doctof. D2DPLACE d2dplacf. D2DREDAY d2batdaf.
         D2DRESFU d2dresff. D2DRINK d2bedrif. D2DRKMCH d2persof.
         D2FEEDAY d2batdaf. D2FEEDFU d2feedff. D2FINANC d2finanf.
         D2GASTRI d2hyperf. D2GENER d2generf. D2GLAUCO d2hyperf.
         D2HEART d2hyperf. D2HEATER d2wcfacf. D2HYPERT d2hyperf.
         D2ILL d2illfff. D2INCOME d2incomf. D2KNDDRK d2knddrf.
         D2LICDOC d2licdof. D2LIVARR d2livarf. D2MARRY d2marryf.
         D2MEDCOS d2incomf. D2MEDICA d2medicf. D2MOVDAY d2batdaf.
         D2MOVEFU d2moveff. D2MTHIN d2vmontf. D2NEUROS d2hyperf.
         D2OTHERS d2hyperf. D2OUTDOR d2outdof. D2PARKIN d2hyperf.
         D2PERSON d2persof. D2PHONE d2wcfacf. D2PNEUM d2hyperf.
         D2PROSTA d2hyperf. D2PROVIN d2provif. D2PSYCHO d2hyperf.
         D2RESID d2residf. D2RESPON d2respof. D2SEX d2sexfff.
         D2SMKTIM d2persof. D2SMOKE d2bedrif. D2TAPWAT d2wcfacf.
         D2TOIDAY d2batdaf. D2TOILFU d2toilff. D2TUBERC d2hyperf.
         D2TVSET d2wcfacf. D2VAGE d2countf. D2VDAY d2vmontf.
         D2VMONTH d2vmontf. D2VYEAR d2countf. D2WASHMA d2wcfacf.
         D2WCFACI d2wcfacf. D2WHOPAY d2whopaf. D2_11 a54b_11f.
         D2_2 d2_2ffff. D2_5 a54b_5ff. D2_8 a54b_8ff.
         D31 d31fffff. D31_11 d31_11ff. D31_14 d31fffff.
         D31_2 d31_2fff. D31_5 d31_5fff. D31_8 d31_8fff.
         D32 d31fffff. D32_11 d32_11ff. D32_14 d31fffff.
         D32_2 d31_2fff. D32_5 d31_5fff. D32_8 d32_8fff.
         D33_11 d33_11ff. D33_14 d33_14ff. D33_8 d33_8fff.
         D34_11 d34_11ff. D34_14 d34_14ff. D34_8 d34_8fff.
         D4ALGA1_11 d4meat2_2f. D4ALGA1_14 d4milk1f. D4ALGA1_8 d4meat2_1f.
         D4ALGA2_11 d4meat2_2f. D4ALGA2_14 d4milk1f. D4ALGA2_8 d4meat2_1f.
         D4A_14 d4a_14ff. D4BEAN1 d4meat1f. D4BEAN1_11 d4meat2_2f.
         D4BEAN1_14 d4meat1f. D4BEAN1_8 d4meat2_1f. D4BEAN2 d4meat2f.
         D4BEAN2_11 d4meat2_2f. D4BEAN2_14 d4meat2f. D4BEAN2_8 d4meat2_1f.
         D4BEN2_2 d4mt2_2f. D4BEN2_5 d4mt2_5f. D4B_14 d4b_14ff.
         D4DRUG1_11 d4drug1_1f. D4DRUG1_14 d4drug1_2f. D4DRUG1_8 d4drug1f.
         D4DRUG2_11 d4drug1_1f. D4DRUG2_14 d4drug1_2f. D4DRUG2_8 d4drug1f.
         D4EGG1 d4meat1f. D4EGG1_11 d4meat2_2f. D4EGG1_14 d4meat1f.
         D4EGG1_8 d4meat2_1f. D4EGG2 d4meat2f. D4EGG2_11 d4meat2_2f.
         D4EGG2_14 d4meat2f. D4EGG2_2 d4mt2_2f. D4EGG2_5 d4mt2_5f.
         D4EGG2_8 d4meat2_1f. D4FISH1 d4meat1f. D4FISH1_11 d4meat2_2f.
         D4FISH1_14 d4meat1f. D4FISH1_8 d4meat2_1f. D4FISH2 d4meat2f.
         D4FISH2_11 d4meat2_2f. D4FISH2_14 d4meat2f. D4FISH2_8 d4meat2_1f.
         D4FSH2_2 d4mt2_2f. D4FSH2_5 d4mt2_5f. D4GAR2_2 d4mt2_2f.
         D4GAR2_5 d4mt2_5f. D4GARL1 d4meat1f. D4GARL1_11 d4meat2_2f.
         D4GARL1_14 d4meat1f. D4GARL1_8 d4meat2_1f. D4GARL2 d4meat2f.
         D4GARL2_11 d4meat2_2f. D4GARL2_14 d4meat2f. D4GARL2_8 d4meat2_1f.
         D4MEAT1 d4meat1f. D4MEAT1_11 d4meat2_2f. D4MEAT1_14 d4meat1f.
         D4MEAT1_8 d4meat2_1f. D4MEAT2 d4meat2f. D4MEAT2_11 d4meat2_2f.
         D4MEAT2_14 d4meat2f. D4MEAT2_8 d4meat2_1f. D4MILK1_11 d4meat2_2f.
         D4MILK1_14 d4milk1f. D4MILK1_8 d4meat2_1f. D4MILK2_11 d4meat2_2f.
         D4MILK2_14 d4milk1f. D4MILK2_8 d4meat2_1f. D4MT2_2 d4mt2_2f.
         D4MT2_5 d4mt2_5f. D4NUT1_11 d4meat2_2f. D4NUT1_14 d4milk1f.
         D4NUT1_8 d4meat2_1f. D4NUT2_11 d4meat2_2f. D4NUT2_14 d4milk1f.
         D4NUT2_8 d4meat2_1f. D4SUG2_2 d4mt2_2f. D4SUG2_5 d4mt2_5f.
         D4SUGA1 d4meat1f. D4SUGA1_11 d4meat2_2f. D4SUGA1_14 d4meat1f.
         D4SUGA1_8 d4meat2_1f. D4SUGA2 d4meat2f. D4SUGA2_11 d4meat2_2f.
         D4SUGA2_14 d4meat2f. D4SUGA2_8 d4meat2_1f. D4TEA1 d4meat1f.
         D4TEA1_11 d4meat2_2f. D4TEA1_14 d4meat1f. D4TEA1_8 d4meat2_1f.
         D4TEA2 d4meat2f. D4TEA2_11 d4meat2_2f. D4TEA2_14 d4meat2f.
         D4TEA2_2 d4mt2_2f. D4TEA2_5 d4mt2_5f. D4TEA2_8 d4meat2_1f.
         D4VEG1 d4meat1f. D4VEG1_11 d4meat2_2f. D4VEG1_14 d4meat1f.
         D4VEG1_8 d4meat2_1f. D4VEG2 d4meat2f. D4VEG2_11 d4meat2_2f.
         D4VEG2_14 d4meat2f. D4VEG2_2 d4mt2_2f. D4VEG2_5 d4mt2_5f.
         D4VEG2_8 d4meat2_1f. D4VIT1_11 d4meat2_2f. D4VIT1_14 d4milk1f.
         D4VIT1_8 d4meat2_1f. D4VIT2_11 d4meat2_2f. D4VIT2_14 d4milk1f.
         D4VIT2_8 d4meat2_1f. D5 d5ffffff. D5ACTDAY d5vyearf.
         D5ADVDIR d5bedrif. D5BATDAY d5batdaf. D5BATHFA d5wcfacf.
         D5BATHFU d5bathff. D5BEDDAY d5beddaf. D5BEDRID d5bedrif.
         D5CARCST d5medcof. D5CARGIV d5cargif. D5CARPAY d5carpaf.
         D5CAUSE d5causef. D5CONDAY d5batdaf. D5CONTFU d5contff.
         D5DAYIN d5vmontf. D5DIDAY1 d5didayf. D5DIDAY2 d5didayf.
         D5DIDAY3 d5didayf. D5DIRCST d5medcof. D5DIRDAY d5dirdaf.
         D5DISEA1 d5diseaf. D5DISEA2 d5diseaf. D5DISEA3 d5diseaf.
         D5DOCTOR d5doctof. D5DPLACE d5dplacf. D5DREAM d5dreamf.
         D5DREDAY d5batdaf. D5DRESFU d5dresff. D5DRINK d5bedrif.
         D5DRKMCH d5smktif. D5FEEDAY d5batdaf. D5FEEDFU d5feedff.
         D5FINANC d5finanf. D5FULLDA d5vyearf. D5GENER d5generf.
         D5HEATER d5wcfacf. D5ILL d5pcgdaf. D5INCOME d5incomf.
         D5KNDDRK d5knddrf. D5LICDOC d5licdof. D5LIVARR d5livarf.
         D5MARRY d5marryf. D5MEDCOS d5medcof. D5MEDICA d5medicf.
         D5MOVDAY d5batdaf. D5MOVEFU d5moveff. D5MTHIN d5vmontf.
         D5OUTDOR d5vyearf. D5PAIN d5painff. D5PCGDAY d5pcgdaf.
         D5PERSON d5vmontf. D5PHONE d5wcfacf. D5POCKET d5medcof.
         D5RESID d5residf. D5RESPON d5respof. D5SEX d5sexfff.
         D5SMKTIM d5smktif. D5SMOKE d5bedrif. D5TAPWAT d5wcfacf.
         D5TOIDAY d5batdaf. D5TOILFU d5toilff. D5TVSET d5wcfacf.
         D5UNCDAY d5dirdaf. D5UNCONS d5bedrif. D5VDAY d5vmontf.
         D5VMONTH d5vmontf. D5VYEAR d5vyearf. D5WASHMA d5wcfacf.
         D5WCFACI d5wcfacf. D5WHOPAY d5whopaf. D5_11 d5_11fff.
         D5_14 d5ffffff. D5_2 d5_2ffff. D5_5 d5_5ffff.
         D5_8 d5_8ffff. D6A d6afffff. D6A_11 d6a_11ff.
         D6A_14 d6afffff. D6A_8 d6a_8fff. D6B d6afffff.
         D6B_11 d6a_11ff. D6B_14 d6afffff. D6B_8 d6a_8fff.
         D6C d6cfffff. D6C_11 d6a_11ff. D6C_14 d6cfffff.
         D6C_2 d6c_2fff. D6C_5 d6c_5fff. D6C_8 d6a_8fff.
         D71 d71fffff. D710A_11 d78a_11f. D710A_14 d78a_14f.
         D710B_11 d78a_11f. D710B_14 d78a_14f. D710_11 a535_11f.
         D710_14 a535_14f. D71_11 d71_11ff. D71_14 d71fffff.
         D71_2 d71_2fff. D71_5 d71_5fff. D71_8 d71_8fff.
         D72 d71fffff. D72_11 d71_11ff. D72_14 d71fffff.
         D72_5 d71_5fff. D72_8 d71_8fff. D73 a53a2fff.
         D73_11 a53a2_1f. D73_14 a53a2fff. D73_5 a53a2_5f.
         D73_8 a53a2_8f. D74 a53a2fff. D74_11 a53a2_1f.
         D74_14 a53a2fff. D74_2 a53a2_2f. D74_5 a53a2_5f.
         D74_8 a53a2_8f. D75 a54bffff. D75_11 a53a5_1f.
         D75_14 a54bffff. D75_2 a54b_2ff. D75_5 d75_5fff.
         D75_8 d75_8fff. D76_11 d76_11ff. D76_14 d76_14ff.
         D77_11 d77_11ff. D77_14 d77_14ff. D78A_11 d78a_11f.
         D78A_14 d78a_14f. D78B_11 d78a_11f. D78B_14 d78a_14f.
         D78_11 a535_11f. D78_14 a535_14f. D79A_11 d78a_11f.
         D79A_14 d78a_14f. D79B_11 d78a_11f. D79B_14 d78a_14f.
         D79_11 a535_11f. D79_14 a535_14f. D81 d71fffff.
         D81_11 d71_11ff. D81_14 d71fffff. D81_2 d71_2fff.
         D81_5 d71_5fff. D81_8 d71_8fff. D82 d71fffff.
         D82_11 d71_11ff. D82_14 d71fffff. D82_5 d71_5fff.
         D82_8 d71_8fff. D83 a53a2fff. D83_11 a53a2_1f.
         D83_14 a53a2fff. D83_5 a53a2_5f. D83_8 a53a2_8f.
         D84 a53a2fff. D84_11 a53a2_1f. D84_14 a53a2fff.
         D84_2 a53a2_2f. D84_5 a53a2_5f. D84_8 a53a2_8f.
         D85 d85fffff. D85_11 d85_11ff. D85_14 d85fffff.
         D85_2 d85_2fff. D85_5 d85_5fff. D85_8 d85_8fff.
         D86 a54bffff. D86_11 a53a5_1f. D86_14 a54bffff.
         D86_2 a54b_2ff. D86_5 d75_5fff. D86_8 d75_8fff.
         D87_11 a535_11f. D87_14 a535_14f. D8ACTDAY d8batdaf.
         D8ADVDIR d8doctof. D8ARTHRI d8hyperf. D8BATDAY d8batdaf.
         D8BATHFA d8wcfacf. D8BATHFU d8bathff. D8BEDDAY d8beddaf.
         D8BEDRID d8bedrif. D8BEDSOR d8hyperf. D8CANCER d8hyperf.
         D8CARCST d8medcof. D8CARGIV d8cargif. D8CARPAY d8carpaf.
         D8CONDAY d8batdaf. D8CONTFU d8contff. D8CVD d8hyperf.
         D8DEMENT d8hyperf. D8DIABET d8hyperf. D8DIDAY1 d8didayf.
         D8DIDAY2 d8didayf. D8DIDAY3 d8didayf. D8DIRCST d8medcof.
         D8DIRDAY d8dirdaf. D8DISEA1 d8diseaf. D8DISEA2 d8diseaf.
         D8DISEA3 d8diseaf. D8DOCTOR d8doctof. D8DPLACE d8dplacf.
         D8DREAM d8dreamf. D8DREDAY d8batdaf. D8DRESFU d8bathff.
         D8DRINK d8doctof. D8DRKMCH d8smktif. D8FEEDAY d8batdaf.
         D8FEEDFU d8bathff. D8FINANC d8finanf. D8FULLDA d8batdaf.
         D8GASTRI d8hyperf. D8GENER d8generf. D8GLAUCO d8hyperf.
         D8GYNECO d8hyperf. D8HEART d8hyperf. D8HEATER d8wcfacf.
         D8HYPERT d8hyperf. D8ILL d8illfff. D8INCOME d8incomf.
         D8KNDDRK d8knddrf. D8LICDOC d8licdof. D8LIVARR d8livarf.
         D8MARRY d8marryf. D8MEDCOS d8medcof. D8MEDICA d8medicf.
         D8MOVDAY d8batdaf. D8MOVEFU d8bathff. D8NEUROS d8hyperf.
         D8OTHERS d8hyperf. D8OUTDOR d8batdaf. D8PAIN d8painff.
         D8PARKIN d8hyperf. D8PERSON d8persof. D8PHONE d8wcfacf.
         D8PNEUM d8hyperf. D8POCKET d8medcof. D8PROSTA d8hyperf.
         D8PSYCHO d8hyperf. D8RESID d8residf. D8SEX d8sexfff.
         D8SMKTIM d8smktif. D8SMOKE d8doctof. D8TAPWAT d8wcfacf.
         D8TOIDAY d8batdaf. D8TOILFU d8bathff. D8TUBERC d8hyperf.
         D8TVSET d8wcfacf. D8UNCDAY d8uncdaf. D8UNCONS d8bedrif.
         D8VDAY d8vdayff. D8WASHMA d8wcfacf. D8WCFACI d8wcfacf.
         D8WHOPAY d8whopaf. D91 d71fffff. D91_11 d91_11ff.
         D91_14 d71fffff. D91_2 d71_2fff. D91_5 d71_5fff.
         D91_8 d91_8fff. D92 d71fffff. D92_11 d91_11ff.
         D92_14 d71fffff. D92_5 d71_5fff. D92_8 d91_8fff.
         D93 a53a2fff. D93_11 a53a2_1f. D93_14 a53a2fff.
         D93_5 a53a2_5f. D93_8 a53a2_8f. D94 a53a2fff.
         D94_11 a53a2_1f. D94_14 a53a2fff. D94_2 a53a2_2f.
         D94_5 a53a2_5f. D94_8 a53a2_8f. DAYIN_11 monthinf.
         DAY_2 month_2f. DAY_5 month_5f. DAY_8 month_8f.
         DTH00_02 dth00_0f. DTH02_05 dth02_0f. DTH05_08 dth05_0f.
         DTH08_11 dth08_1f. DTH11_14 dth11_1f. E0_11 e0_11fff.
         E0_14 e0_14fff. E1 e1ffffff. E10_11 e7_11fff.
         E10_14 e7_14fff. E10_2 e7_2ffff. E10_5 e7_5ffff.
         E10_8 e7_8ffff. E11_11 e7_11fff. E11_14 e7_14fff.
         E11_2 e7_2ffff. E11_5 e7_5ffff. E11_8 e7_8ffff.
         E12_11 e7_11fff. E12_14 e12_14ff. E12_2 e7_2ffff.
         E12_5 e7_5ffff. E12_8 e7_8ffff. E13_11 e7_11fff.
         E13_14 e7_14fff. E13_2 e7_2ffff. E13_5 e7_5ffff.
         E13_8 e7_8ffff. E14_11 e7_11fff. E14_14 e12_14ff.
         E14_2 e7_2ffff. E14_5 e7_5ffff. E14_8 e7_8ffff.
         E1A_2 e1a_2fff. E1B_11 e1b_11ff. E1B_14 e1b_14ff.
         E1B_5 e1b_5fff. E1B_8 e1b_8fff. E1_11 e1_11fff.
         E1_14 e1ffffff. E1_2 e1_2ffff. E1_5 e1_5ffff.
         E1_8 e1_8ffff. E2 e2ffffff. E2A_2 e1a_2fff.
         E2B_11 e1b_11ff. E2B_14 e1b_14ff. E2B_5 e1b_5fff.
         E2B_8 e1b_8fff. E2_11 e2_11fff. E2_14 e2ffffff.
         E2_2 e2_2ffff. E2_5 e2_5ffff. E2_8 e2_8ffff.
         E3 e3ffffff. E3A_2 e1a_2fff. E3B_11 e1b_11ff.
         E3B_14 e1b_14ff. E3B_5 e1b_5fff. E3B_8 e1b_8fff.
         E3_11 e3_11fff. E3_14 e3ffffff. E3_2 e3_2ffff.
         E3_5 e3_5ffff. E3_8 e3_8ffff. E4 e4ffffff.
         E4A_2 e1a_2fff. E4B_11 e1b_11ff. E4B_14 e1b_14ff.
         E4B_5 e1b_5fff. E4B_8 e1b_8fff. E4_11 e4_11fff.
         E4_14 e4ffffff. E4_2 e4_2ffff. E4_5 e4_5ffff.
         E4_8 e4_8ffff. E5 e5ffffff. E5A_2 e1a_2fff.
         E5B_11 e1b_11ff. E5B_14 e1b_14ff. E5B_5 e1b_5fff.
         E5B_8 e1b_8fff. E5_11 e5_11fff. E5_14 e5ffffff.
         E5_2 e5_2ffff. E5_5 e5_5ffff. E5_8 e5_8ffff.
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
         E6B_8 e6b_8fff. E6_11 e6_11fff. E6_14 e6ffffff.
         E6_2 e6_2ffff. E6_5 e6_5ffff. E6_8 e6_8ffff.
         E7_11 e7_11fff. E7_14 e7_14fff. E7_2 e7_2ffff.
         E7_5 e7_5ffff. E7_8 e7_8ffff. E8_11 e7_11fff.
         E8_14 e7_14fff. E8_2 e7_2ffff. E8_5 e7_5ffff.
         E8_8 e7_8ffff. E9_11 e7_11fff. E9_14 e7_14fff.
         E9_2 e7_2ffff. E9_5 e7_5ffff. E9_8 e7_8ffff.
         F1 f1ffffff. F10 d2ffffff. F101 a54bffff.
         F101_11 a53a5_1f. F101_14 a54bffff. F101_8 d75_8fff.
         F102 a54bffff. F102_11 a53a5_1f. F102_14 a54bffff.
         F102_8 d75_8fff. F1030A_11 a535_11f. F1030B1_11 f901b1_f.
         F1030B2_11 f901b1_f. F1030B3_11 f901b1_f. F1030_11 f41a12_f.
         F1031A_11 a535_11f. F1031B1_11 f901b1_f. F1031B2_11 f1031b2f.
         F1031B3_11 f1031b2f. F1031_11 f41a12_f. F1032_11 f1032_1f.
         F1033_11 f1033_1f. F103A1 f92a2fff. F103A1_11 a53a3_1f.
         F103A1_14 f92a2fff. F103A1_5 f92a2_5f. F103A1_8 a53a3_8f.
         F103A2 f92a3fff. F103A2_11 f103a2__1f. F103A2_14 f92a3fff.
         F103A2_5 f103a8_f. F103A2_8 f103a2_f. F103A3 a53a2fff.
         F103A3_11 a53a5_1f. F103A3_14 a53a2fff. F103A3_5 a53a2_5f.
         F103A3_8 d75_8fff. F103A4 f92a5fff. F103A4_11 f92a3_1f.
         F103A4_14 f92a5fff. F103A4_5 a532_5ff. F103A4_8 f92a3_8f.
         F103A5 f92a6fff. F103A5_11 f103a5__2f. F103A5_14 f92a6fff.
         F103A5_5 f103a5_f. F103A5_8 f103a5__1f. F103A6_5 d75_5fff.
         F103A7_11 f92a3_1f. F103A7_14 f92a3fff. F103A7_5 a532_5ff.
         F103A7_8 f92a3_8f. F103A8_11 f92a3_1f. F103A8_14 f92a3fff.
         F103A8_5 f103a8_f. F103A8_8 f92a3_8f. F103B1 f92a2fff.
         F103B1_11 a53a3_1f. F103B1_14 f92a2fff. F103B1_5 f92a2_5f.
         F103B1_8 a53a3_8f. F103B2 f92a3fff. F103B2_11 f103a2__1f.
         F103B2_14 f92a3fff. F103B2_5 f103a8_f. F103B2_8 f103a2_f.
         F103B3 a53a2fff. F103B3_11 a53a5_1f. F103B3_14 a53a2fff.
         F103B3_5 a53a2_5f. F103B3_8 d75_8fff. F103B4 f92a5fff.
         F103B4_11 f92a3_1f. F103B4_14 f92a5fff. F103B4_5 a532_5ff.
         F103B4_8 f92a3_8f. F103B5 f92a6fff. F103B5_11 f103a5__2f.
         F103B5_14 f92a6fff. F103B5_5 f103a5_f. F103B5_8 f103a5__1f.
         F103B6_5 d75_5fff. F103B7_11 f92a3_1f. F103B7_14 f92a3fff.
         F103B7_5 a532_5ff. F103B7_8 f92a3_8f. F103B8_11 f92a3_1f.
         F103B8_14 f92a3fff. F103B8_5 f103a8_f. F103B8_8 f92a3_8f.
         F103C1 f92a2fff. F103C1_11 a53a3_1f. F103C1_14 f92a2fff.
         F103C1_5 f92a2_5f. F103C1_8 a53a3_8f. F103C2 f92a3fff.
         F103C2_11 f103a2__1f. F103C2_14 f92a3fff. F103C2_5 f103a8_f.
         F103C2_8 f103a2_f. F103C3 a53a2fff. F103C3_11 a53a5_1f.
         F103C3_14 a53a2fff. F103C3_5 a53a2_5f. F103C3_8 d75_8fff.
         F103C4 f92a5fff. F103C4_11 f92a3_1f. F103C4_14 f92a5fff.
         F103C4_5 a532_5ff. F103C4_8 f92a3_8f. F103C5 f92a6fff.
         F103C5_11 f103a5__2f. F103C5_14 f92a6fff. F103C5_5 f103a5_f.
         F103C5_8 f103a5__1f. F103C6_5 f103c6_f. F103C7_11 f92a3_1f.
         F103C7_14 f92a3fff. F103C7_5 a532_5ff. F103C7_8 f92a3_8f.
         F103C8_11 f92a3_1f. F103C8_14 f92a3fff. F103C8_5 f103a8_f.
         F103C8_8 f92a3_8f. F103D1 f92a2fff. F103D1_11 a53a3_1f.
         F103D1_14 f92a2fff. F103D1_5 f92a2_5f. F103D1_8 a53a3_8f.
         F103D2 f92a3fff. F103D2_11 f103a2__1f. F103D2_14 f92a3fff.
         F103D2_5 f103a8_f. F103D2_8 f103a2_f. F103D3 a53a2fff.
         F103D3_11 a53a5_1f. F103D3_14 a53a2fff. F103D3_5 a53a2_5f.
         F103D3_8 d75_8fff. F103D4 f92a5fff. F103D4_11 f92a3_1f.
         F103D4_14 f92a5fff. F103D4_5 a532_5ff. F103D4_8 f92a3_8f.
         F103D5 f92a6fff. F103D5_11 f103a5__2f. F103D5_14 f92a6fff.
         F103D5_5 f103a5_f. F103D5_8 f103a5__1f. F103D6_5 d75_5fff.
         F103D7_11 f92a3_1f. F103D7_14 f92a3fff. F103D7_5 a532_5ff.
         F103D7_8 f92a3_8f. F103D8_11 f92a3_1f. F103D8_14 f92a3fff.
         F103D8_5 f103a8_f. F103D8_8 f92a3_8f. F103E1 f92a2fff.
         F103E1_11 a53a3_1f. F103E1_14 f92a2fff. F103E1_5 f92a2_5f.
         F103E1_8 a53a3_8f. F103E2 f92a3fff. F103E2_11 f103a2__1f.
         F103E2_14 f92a3fff. F103E2_5 f103a8_f. F103E2_8 f103a2_f.
         F103E3 a53a2fff. F103E3_11 a53a5_1f. F103E3_14 a53a2fff.
         F103E3_5 a53a2_5f. F103E3_8 d75_8fff. F103E4 f92a5fff.
         F103E4_11 f92a3_1f. F103E4_14 f92a5fff. F103E4_5 a532_5ff.
         F103E4_8 f92a3_8f. F103E5 f92a6fff. F103E5_11 f103a5__2f.
         F103E5_14 f92a6fff. F103E5_5 f103a5_f. F103E5_8 f103a5__1f.
         F103E6_5 d75_5fff. F103E7_11 f92a3_1f. F103E7_14 f92a3fff.
         F103E7_5 a532_5ff. F103E7_8 f92a3_8f. F103E8_11 f92a3_1f.
         F103E8_14 f92a3fff. F103E8_5 f103a8_f. F103E8_8 f92a3_8f.
         F103F1 f92a2fff. F103F1_11 a53a3_1f. F103F1_14 f92a2fff.
         F103F1_5 f92a2_5f. F103F1_8 a53a3_8f. F103F2 f92a3fff.
         F103F2_11 f103a2__1f. F103F2_14 f92a3fff. F103F2_5 f103a8_f.
         F103F2_8 f103a2_f. F103F3 a53a2fff. F103F3_11 a53a5_1f.
         F103F3_14 a53a2fff. F103F3_5 a53a2_5f. F103F3_8 d75_8fff.
         F103F4 f92a5fff. F103F4_11 f92a3_1f. F103F4_14 f92a5fff.
         F103F4_5 a532_5ff. F103F4_8 f92a3_8f. F103F5 f92a6fff.
         F103F5_11 f103a5__2f. F103F5_14 f92a6fff. F103F5_5 f103a5_f.
         F103F5_8 f103a5__1f. F103F6_5 d75_5fff. F103F7_11 f92a3_1f.
         F103F7_14 f92a3fff. F103F7_5 a532_5ff. F103F7_8 f92a3_8f.
         F103F8_11 f92a3_1f. F103F8_14 f92a3fff. F103F8_5 f103a8_f.
         F103F8_8 f92a3_8f. F103G1 f92a2fff. F103G1_11 a53a3_1f.
         F103G1_14 f92a2fff. F103G1_5 f92a2_5f. F103G1_8 a53a3_8f.
         F103G2 f92a3fff. F103G2_11 f103a2__1f. F103G2_14 f92a3fff.
         F103G2_5 f103a8_f. F103G2_8 f103a2_f. F103G3 a53a2fff.
         F103G3_11 a53a5_1f. F103G3_14 a53a2fff. F103G3_5 a53a2_5f.
         F103G3_8 d75_8fff. F103G4 f92a5fff. F103G4_11 f92a3_1f.
         F103G4_14 f92a5fff. F103G4_5 a532_5ff. F103G4_8 f92a3_8f.
         F103G5 f92a6fff. F103G5_11 f103a5__2f. F103G5_14 f92a6fff.
         F103G5_5 f103a5_f. F103G5_8 f103a5__1f. F103G6_5 f103c6_f.
         F103G7_11 f92a3_1f. F103G7_14 f92a3fff. F103G7_5 a532_5ff.
         F103G7_8 f92a3_8f. F103G8_11 f92a3_1f. F103G8_14 f92a3fff.
         F103G8_5 f103a8_f. F103G8_8 f92a3_8f. F103H1 f92a2fff.
         F103H1_11 a53a3_1f. F103H1_14 f92a2fff. F103H1_5 f92a2_5f.
         F103H1_8 a53a3_8f. F103H2 f92a3fff. F103H2_11 f103a2__1f.
         F103H2_14 f92a3fff. F103H2_5 f103a8_f. F103H2_8 f103a2_f.
         F103H3 a53a2fff. F103H3_11 a53a5_1f. F103H3_14 a53a2fff.
         F103H3_5 a53a2_5f. F103H3_8 d75_8fff. F103H4 f92a5fff.
         F103H4_11 f92a3_1f. F103H4_14 f92a5fff. F103H4_5 a532_5ff.
         F103H4_8 f92a3_8f. F103H5 f92a6fff. F103H5_11 f103a5__2f.
         F103H5_14 f92a6fff. F103H5_5 f103a5_f. F103H5_8 f103a5__1f.
         F103H6_5 f103c6_f. F103H7_11 f92a3_1f. F103H7_14 f92a3fff.
         F103H7_5 a532_5ff. F103H7_8 f92a3_8f. F103H8_11 f92a3_1f.
         F103H8_14 f92a3fff. F103H8_5 f103a8_f. F103H8_8 f92a3_8f.
         F103I1 f92a2fff. F103I1_11 a53a3_1f. F103I1_14 f92a2fff.
         F103I1_5 f92a2_5f. F103I1_8 a53a3_8f. F103I2 f92a3fff.
         F103I2_11 f103a2__1f. F103I2_14 f92a3fff. F103I2_5 f103a8_f.
         F103I2_8 f103a2_f. F103I3 a53a2fff. F103I3_11 a53a5_1f.
         F103I3_14 a53a2fff. F103I3_5 a53a2_5f. F103I3_8 d75_8fff.
         F103I4 f92a5fff. F103I4_11 f92a3_1f. F103I4_14 f92a5fff.
         F103I4_5 a532_5ff. F103I4_8 f92a3_8f. F103I5 f92a6fff.
         F103I5_11 f103a5__2f. F103I5_14 f92a6fff. F103I5_5 f103a5_f.
         F103I5_8 f103a5__1f. F103I6_5 f103c6_f. F103I7_11 f92a3_1f.
         F103I7_14 f92a3fff. F103I7_5 a532_5ff. F103I7_8 f92a3_8f.
         F103I8_11 f92a3_1f. F103I8_14 f92a3fff. F103I8_5 f103a8_f.
         F103I8_8 f92a3_8f. F103J1 f92a2fff. F103J1_11 a53a3_1f.
         F103J1_14 f92a2fff. F103J1_5 f92a2_5f. F103J1_8 a53a3_8f.
         F103J2 f92a3fff. F103J2_11 f103a2__1f. F103J2_14 f92a3fff.
         F103J2_5 f103a8_f. F103J2_8 f103a2_f. F103J3 a53a2fff.
         F103J3_11 a53a5_1f. F103J3_14 a53a2fff. F103J3_5 a53a2_5f.
         F103J3_8 d75_8fff. F103J4 f92a5fff. F103J4_11 f92a3_1f.
         F103J4_14 f92a5fff. F103J4_5 a532_5ff. F103J4_8 f92a3_8f.
         F103J5 f92a6fff. F103J5_11 f103a5__2f. F103J5_14 f92a6fff.
         F103J5_5 f103a5_f. F103J5_8 f103a5__1f. F103J6_5 f103c6_f.
         F103J7_11 f92a3_1f. F103J7_14 f92a3fff. F103J7_5 a532_5ff.
         F103J7_8 f92a3_8f. F103J8_11 f92a3_1f. F103J8_14 f92a3fff.
         F103J8_5 f103a8_f. F103J8_8 f92a3_8f. F103K1_11 a53a3_1f.
         F103K1_14 f92a2fff. F103K1_5 f92a2_5f. F103K1_8 a53a3_8f.
         F103K2_11 f103a2__1f. F103K2_14 f103k2_f. F103K2_5 f103a8_f.
         F103K2_8 f103a2_f. F103K3_11 a53a5_1f. F103K3_14 a53a2fff.
         F103K3_5 a53a2_5f. F103K3_8 d75_8fff. F103K4_11 f92a3_1f.
         F103K4_14 f92a3fff. F103K4_5 a532_5ff. F103K4_8 f92a3_8f.
         F103K5_11 f103a5__2f. F103K5_14 f103k5_f. F103K5_5 f103a5_f.
         F103K5_8 f103a5__1f. F103K6_5 f103c6_f. F103K7_11 f92a3_1f.
         F103K7_14 f92a3fff. F103K7_5 a532_5ff. F103K7_8 f92a3_8f.
         F103K8_11 f92a3_1f. F103K8_14 f92a3fff. F103K8_5 f103a8_f.
         F103K8_8 f92a3_8f. F103L1_11 a53a3_1f. F103L1_14 f92a2fff.
         F103L1_5 f92a2_5f. F103L1_8 a53a3_8f. F103L2_11 f103a2__1f.
         F103L2_14 f103k2_f. F103L2_5 f103a8_f. F103L2_8 f103a2_f.
         F103L3_11 a53a5_1f. F103L3_14 a53a2fff. F103L3_5 a53a2_5f.
         F103L3_8 d75_8fff. F103L4_11 f92a3_1f. F103L4_14 f92a3fff.
         F103L4_5 a532_5ff. F103L4_8 f92a3_8f. F103L5_11 f103a5__2f.
         F103L5_14 f103k5_f. F103L5_5 f103a5_f. F103L5_8 f103a5__1f.
         F103L6_5 f103c6_f. F103L7_11 f92a3_1f. F103L7_14 f92a3fff.
         F103L7_5 a532_5ff. F103L7_8 f92a3_8f. F103L8_11 f92a3_1f.
         F103L8_14 f92a3fff. F103L8_5 f103a8_f. F103L8_8 f92a3_8f.
         F103M1_11 a53a3_1f. F103M1_14 f92a2fff. F103M1_5 f92a2_5f.
         F103M1_8 a53a3_8f. F103M2_11 f103a2__1f. F103M2_14 f103k2_f.
         F103M2_5 f103a8_f. F103M2_8 f103a2_f. F103M3_11 a53a5_1f.
         F103M3_14 a53a2fff. F103M3_5 a53a2_5f. F103M3_8 d75_8fff.
         F103M4_11 f92a3_1f. F103M4_14 f92a3fff. F103M4_5 a532_5ff.
         F103M4_8 f92a3_8f. F103M5_11 f103a5__2f. F103M5_14 f103k5_f.
         F103M5_5 f103a5_f. F103M5_8 f103a5__1f. F103M6_5 f103c6_f.
         F103M7_11 f92a3_1f. F103M7_14 f92a3fff. F103M7_5 a532_5ff.
         F103M7_8 f92a3_8f. F103M8_11 f92a3_1f. F103M8_14 f92a3fff.
         F103M8_5 f103a8_f. F103M8_8 f92a3_8f. F103_11 a54b_11f.
         F103_8 a54b_8ff. F104_14 f104_14f. F104_2 f104_2ff.
         F105_14 f104_14f. F105_2 f104_2ff. F10A_11 a54b_11f.
         F10A_14 a54bffff. F10A_8 a54b_8ff. F10_11 a54b_11f.
         F10_14 d2ffffff. F10_8 a54b_8ff. F111A_11 f111a_1f.
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
         F16_8 f16_8fff. F1_14 f1ffffff. F1_8 a54b_8ff.
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
         F31_11 f31_11ff. F31_14 f31fffff. F31_2 f31_2fff.
         F31_5 f31_5fff. F31_8 f31_8fff. F32 f32fffff.
         F32A_11 f31_11ff. F32A_14 f32a_14f. F32A_5 f31_5fff.
         F32A_8 f31_8fff. F32B_11 f31_11ff. F32B_14 f32a_14f.
         F32B_5 f31_5fff. F32B_8 f31_8fff. F32C_11 f31_11ff.
         F32C_14 f32a_14f. F32C_5 f31_5fff. F32C_8 f31_8fff.
         F32D_11 f31_11ff. F32D_14 f32a_14f. F32D_5 f31_5fff.
         F32D_8 f31_8fff. F32E_11 f31_11ff. F32E_14 f32a_14f.
         F32E_5 f31_5fff. F32E_8 f31_8fff. F32_2 vage_2ff.
         F33 f33fffff. F33_11 f23_11ff. F33_14 f33fffff.
         F33_2 f21_2fff. F33_5 d71_5fff. F33_8 f23_8fff.
         F34 f34fffff. F340_11 f340_11f. F340_14 f340_14f.
         F340_5 f340_5ff. F340_8 f340_8ff. F34_11 f34_11ff.
         F34_14 f34fffff. F34_2 f34_2fff. F34_5 f34_5fff.
         F34_8 f34_8fff. F35_11 f35_11ff. F35_14 f35_14ff.
         F35_2 f35_2fff. F35_5 f35_5fff. F35_8 f35_8fff.
         F41 f41fffff. F41A11_11 a534_11f. F41A11_14 a534_14f.
         F41A12_11 f41a12_f. F41A12_14 f41a12__1f. F41A1_11 a535_11f.
         F41A1_14 a535_14f. F41A21_11 a534_11f. F41A21_14 a534_14f.
         F41A22_11 f41a12_f. F41A22_14 f41a12__1f. F41A2_11 a535_11f.
         F41A2_14 a535_14f. F41A31_11 a534_11f. F41A31_14 a534_14f.
         F41A32_11 f41a12_f. F41A32_14 f41a12__1f. F41A3_11 a535_11f.
         F41A3_14 a535_14f. F41B1_11 a534_11f. F41B1_14 a534_14f.
         F41B2_11 f41a12_f. F41B2_14 f41a12__1f. F41B_11 a535_11f.
         F41B_14 a535_14f. F41_11 f41_11ff. F41_14 f41fffff.
         F41_2 f41_2fff. F41_5 f41_5fff. F41_8 f41_8fff.
         F42 a54bffff. F42_11 a53a5_1f. F42_14 a54bffff.
         F42_5 d75_5fff. F42_8 d75_8fff. F43A1 a53a2fff.
         F43A1_11 a53a2_1f. F43A1_14 a53a2fff. F43A1_5 a53a2_5f.
         F43A1_8 a53a2_8f. F43A2 f43a2fff. F43A2_11 f43a2_1f.
         F43A2_14 f43a2fff. F43A2_5 f43a2_5f. F43A2_8 f43a2_8f.
         F43A3 a53a2fff. F43A3_11 a53a2_1f. F43A3_14 a53a2fff.
         F43A3_5 a53a2_5f. F43A3_8 a53a2_8f. F43A4 f43a4fff.
         F43A4_11 f43a4_1f. F43A4_14 f43a4fff. F43A4_5 f43a4_5f.
         F43A4_8 f43a4_8f. F43B1 a53a2fff. F43B1_11 a53a2_1f.
         F43B1_14 a53a2fff. F43B1_5 a53a2_5f. F43B1_8 a53a2_8f.
         F43B2 f43a2fff. F43B2_11 f43a2_1f. F43B2_14 f43a2fff.
         F43B2_5 f43a2_5f. F43B2_8 f43a2_8f. F43B3 a53a2fff.
         F43B3_11 a53a2_1f. F43B3_14 a53a2fff. F43B3_5 a53a2_5f.
         F43B3_8 a53a2_8f. F43B4 f43a4fff. F43B4_11 f43a4_1f.
         F43B4_14 f43a4fff. F43B4_5 f43a4_5f. F43B4_8 f43a4_8f.
         F43C1 a53a2fff. F43C1_11 a53a2_1f. F43C1_14 a53a2fff.
         F43C1_5 a53a2_5f. F43C1_8 a53a2_8f. F43C2 f43a2fff.
         F43C2_11 f43a2_1f. F43C2_14 f43a2fff. F43C2_5 f43a2_5f.
         F43C2_8 f43a2_8f. F43C3 a53a2fff. F43C3_11 a53a2_1f.
         F43C3_14 a53a2fff. F43C3_5 a53a2_5f. F43C3_8 a53a2_8f.
         F43C4 f43a4fff. F43C4_11 f43a4_1f. F43C4_14 f43a4fff.
         F43C4_5 f43a4_5f. F43C4_8 f43a4_8f. F43D1 a53a2fff.
         F43D1_11 a53a2_1f. F43D1_14 a53a2fff. F43D1_5 a53a2_5f.
         F43D1_8 a53a2_8f. F43D2 f43a2fff. F43D2_11 f43a2_1f.
         F43D2_14 f43a2fff. F43D2_5 f43a2_5f. F43D2_8 f43a2_8f.
         F43D3 a53a2fff. F43D3_11 a53a2_1f. F43D3_14 a53a2fff.
         F43D3_5 a53a2_5f. F43D3_8 a53a2_8f. F43D4 f43a4fff.
         F43D4_11 f43a4_1f. F43D4_14 f43a4fff. F43D4_5 f43a4_5f.
         F43D4_8 f43a4_8f. F44 a54bffff. F44_11 a53a5_1f.
         F44_14 a54bffff. F44_5 d75_5fff. F44_8 d75_8fff.
         F45 f45fffff. F45_11 f45_11ff. F45_14 f45fffff.
         F45_2 f45_2fff. F45_5 f45_5fff. F45_8 f45_8fff.
         F46_11 f46_11ff. F46_14 f46_14ff. F46_5 f46_5fff.
         F46_8 f46_8fff. F47_11 f47_11ff. F47_14 f47_14ff.
         F47_8 f47_8fff. F5 f5ffffff. F5_11 f5_11fff.
         F5_11_14 f5ffffff. F5_2 f5_2ffff. F5_5 f5_5ffff.
         F5_8 f5_8ffff. F61 f61fffff. F610_11 f610_11f.
         F610_14 f610_14f. F610_5 f610_5ff. F610_8 f610_8ff.
         F61_11 d71_11ff. F61_14 f61fffff. F61_2 f21_2fff.
         F61_5 d71_5fff. F61_8 d71_8fff. F62 f62fffff.
         F62_11 f62_11ff. F62_14 f62fffff. F62_8 f62_8fff.
         F63 f62fffff. F63_11 f62_11ff. F63_14 f62fffff.
         F63_8 f62_8fff. F64 f64fffff. F64A_11 f64a_11f.
         F64A_14 f64a_14f. F64A_5 f64a_5ff. F64A_8 f64a_8ff.
         F64B_11 f64a_11f. F64B_14 f64a_14f. F64B_5 f64a_5ff.
         F64B_8 f64a_8ff. F64C_11 f64a_11f. F64C_14 f64a_14f.
         F64C_5 f64a_5ff. F64C_8 f64a_8ff. F64D_11 f64a_11f.
         F64D_14 f64a_14f. F64D_5 f64a_5ff. F64D_8 f64a_8ff.
         F64E1_11 f64e1_1f. F64E_14 f64a_14f. F64E_5 f64a_5ff.
         F64E_8 f64a_8ff. F64F1_11 f64e1_1f. F64F_14 f64a_14f.
         F64F_5 f64a_5ff. F64F_8 f64a_8ff. F64G1_11 f64e1_1f.
         F64G_14 f64a_14f. F64G_5 f64a_5ff. F64G_8 f64a_8ff.
         F64H1_11 f64e1_1f. F64H_14 f64a_14f. F64H_5 f64a_5ff.
         F64H_8 f64a_8ff. F64I_11 f64i_11f. F64I_14 f64a_14f.
         F64I_5 f64a_5ff. F64I_8 f64i_8ff. F64_2 f64_2fff.
         F65 f65fffff. F651A1_11 f651a1_f. F651A1_14 f35_14ff.
         F651A2_11 f651a1_f. F651A2_14 f35_14ff. F651A_5 f651a_5f.
         F651A_8 f651a_8f. F651B1_11 f651a1_f. F651B1_14 f35_14ff.
         F651B2_11 f651a1_f. F651B2_14 f35_14ff. F651B_5 f651a_5f.
         F651B_8 f651a_8f. F6521_11 f6521_1f. F6521_14 f6521_1_1f.
         F652A_11 yearin_f. F652B_11 a535_11f. F652B_14 a535_14f.
         F652_5 f652_5ff. F652_8 f652_8ff. F65_2 f65_2fff.
         F66 d71fffff. F66_11 d91_11ff. F66_14 d71fffff.
         F66_8 d91_8fff. F71 f71fffff. F71_11 d91_11ff.
         F71_14 f71fffff. F71_5 f71_5fff. F71_8 d91_8fff.
         F72 f72fffff. F721_11 a53a2_1f. F721_14 a53a2fff.
         F721_5 a53a2_5f. F721_8 a53a2_8f. F722A_11 d91_11ff.
         F722_11 a53a2_1f. F722_14 a53a2fff. F722_5 a53a2_5f.
         F722_8 a53a2_8f. F73 a53a2fff. F73_11 a53a2_1f.
         F73_14 a53a2fff. F73_5 a53a2_5f. F73_8 a53a2_8f.
         F74_11 a54b_11f. F74_14 d2ffffff. F74_5 a54b_5ff.
         F74_8 a54b_8ff. F81 f71fffff. F81_11 d91_11ff.
         F81_14 f71fffff. F81_5 f71_5fff. F81_8 d91_8fff.
         F82 f72fffff. F821_11 a53a2_1f. F821_14 a53a2fff.
         F821_5 a53a2_5f. F821_8 a53a2_8f. F822A_11 d91_11ff.
         F822_11 a53a2_1f. F822_14 a53a2fff. F822_5 a53a2_5f.
         F822_8 a53a2_8f. F83 a53a2fff. F83_11 a53a2_1f.
         F83_14 a53a2fff. F83_5 a53a2_5f. F83_8 a53a2_8f.
         F84 f84fffff. F84_11 f84_11ff. F84_14 f84fffff.
         F84_8 f84_8fff. F85_11 f84_11ff. F85_14 f85_14ff.
         F85_5 f85_5fff. F85_8 f84_8fff. F86_11 a54b_11f.
         F86_14 d2ffffff. F86_5 a54b_5ff. F86_8 a54b_8ff.
         F9 d2ffffff. F901A_11 a535_11f. F901B1_11 f901b1_f.
         F901B2_11 f901b1_f. F901B3_11 f901b1_f. F901_11 f41a12_f.
         F902A_11 a535_11f. F902B1_11 f901b1_f. F902B2_11 f901b1_f.
         F902B3_11 f901b1_f. F902_11 f41a12_f. F91 d2ffffff.
         F91_11 a54b_11f. F91_14 d2ffffff. F91_8 a54b_8ff.
         F92A1 a54bffff. F92A1_11 a53a5_1f. F92A1_14 a54bffff.
         F92A1_5 d75_5fff. F92A1_8 d75_8fff. F92A2 f92a2fff.
         F92A2_11 a53a3_1f. F92A2_14 f92a2fff. F92A2_5 f92a2_5f.
         F92A2_8 a53a3_8f. F92A3 f92a3fff. F92A3_11 f92a3_1f.
         F92A3_14 f92a3fff. F92A3_5 f92a3_5f. F92A3_8 f92a3_8f.
         F92A4 a53a2fff. F92A4_11 a53a2_1f. F92A4_14 a53a2fff.
         F92A4_5 a53a2_5f. F92A4_8 a53a2_8f. F92A5 f92a5fff.
         F92A5_11 f92a5_1f. F92A5_14 f92a5fff. F92A5_5 f92a5_5f.
         F92A5_8 f92a5_8f. F92A6 f92a6fff. F92A6_11 f92a3_1f.
         F92A6_14 f92a6fff. F92A6_5 a532_5ff. F92A6_8 f92a3_8f.
         F92A7_11 f92a3_1f. F92A7_14 f92a3fff. F92B1 a54bffff.
         F92B1_11 a53a5_1f. F92B1_14 a54bffff. F92B1_5 d75_5fff.
         F92B1_8 d75_8fff. F92B2 f92a2fff. F92B2_11 a53a3_1f.
         F92B2_14 f92a2fff. F92B2_5 f92a2_5f. F92B2_8 a53a3_8f.
         F92B3 f92a3fff. F92B3_11 f92a3_1f. F92B3_14 f92a3fff.
         F92B3_5 f92a3_5f. F92B3_8 f92a3_8f. F92B4 a53a2fff.
         F92B4_11 a53a2_1f. F92B4_14 a53a2fff. F92B4_5 a53a2_5f.
         F92B4_8 a53a2_8f. F92B5 f92a5fff. F92B5_11 f92a5_1f.
         F92B5_14 f92a5fff. F92B5_5 f92a5_5f. F92B5_8 f92a5_8f.
         F92B6 f92a6fff. F92B6_11 f92a3_1f. F92B6_14 f92a6fff.
         F92B6_5 a532_5ff. F92B6_8 f92a3_8f. F92B7_11 f92a3_1f.
         F92B7_14 f92a3fff. F92C1 a54bffff. F92C1_11 a53a5_1f.
         F92C1_14 a54bffff. F92C1_5 d75_5fff. F92C1_8 d75_8fff.
         F92C2 f92a2fff. F92C2_11 a53a3_1f. F92C2_14 f92a2fff.
         F92C2_5 f92a2_5f. F92C2_8 a53a3_8f. F92C3 f92a3fff.
         F92C3_11 f92a3_1f. F92C3_14 f92a3fff. F92C3_5 f92a3_5f.
         F92C3_8 f92a3_8f. F92C4 a53a2fff. F92C4_11 a53a2_1f.
         F92C4_14 a53a2fff. F92C4_5 a53a2_5f. F92C4_8 a53a2_8f.
         F92C5 f92a5fff. F92C5_11 f92a5_1f. F92C5_14 f92a5fff.
         F92C5_5 f92a5_5f. F92C5_8 f92a5_8f. F92C6 f92a6fff.
         F92C6_11 f92a3_1f. F92C6_14 f92a6fff. F92C6_5 a532_5ff.
         F92C6_8 f92a3_8f. F92C7_11 f92a3_1f. F92C7_14 f92a3fff.
         F92D1 a54bffff. F92D1_11 a53a5_1f. F92D1_14 a54bffff.
         F92D1_5 d75_5fff. F92D1_8 d75_8fff. F92D2 f92a2fff.
         F92D2_11 a53a3_1f. F92D2_14 f92a2fff. F92D2_5 f92a2_5f.
         F92D2_8 a53a3_8f. F92D3 f92a3fff. F92D3_11 f92a3_1f.
         F92D3_14 f92a3fff. F92D3_5 f92a3_5f. F92D3_8 f92a3_8f.
         F92D4 a53a2fff. F92D4_11 a53a2_1f. F92D4_14 a53a2fff.
         F92D4_5 a53a2_5f. F92D4_8 a53a2_8f. F92D5 f92a5fff.
         F92D5_11 f92a5_1f. F92D5_14 f92a5fff. F92D5_5 f92a5_5f.
         F92D5_8 f92a5_8f. F92D6 f92a6fff. F92D6_11 f92a3_1f.
         F92D6_14 f92a6fff. F92D6_5 a532_5ff. F92D6_8 f92a3_8f.
         F92D7_11 f92a3_1f. F92D7_14 f92a3fff. F92E1 a54bffff.
         F92E1_11 a53a5_1f. F92E1_14 a54bffff. F92E1_5 d75_5fff.
         F92E1_8 d75_8fff. F92E2 f92a2fff. F92E2_11 a53a3_1f.
         F92E2_14 f92a2fff. F92E2_5 f92a2_5f. F92E2_8 a53a3_8f.
         F92E3 f92a3fff. F92E3_11 f92a3_1f. F92E3_14 f92a3fff.
         F92E3_5 f92a3_5f. F92E3_8 f92a3_8f. F92E4 a53a2fff.
         F92E4_11 a53a2_1f. F92E4_14 a53a2fff. F92E4_5 a53a2_5f.
         F92E4_8 a53a2_8f. F92E5 f92a5fff. F92E5_11 f92a5_1f.
         F92E5_14 f92a5fff. F92E5_5 f92a5_5f. F92E5_8 f92a5_8f.
         F92E6 f92a6fff. F92E6_11 f92a3_1f. F92E6_14 f92a6fff.
         F92E6_5 a532_5ff. F92E6_8 f92a3_8f. F92E7_11 f92a3_1f.
         F92E7_14 f92a3fff. F92F1 a54bffff. F92F1_11 a53a5_1f.
         F92F1_14 a54bffff. F92F1_5 d75_5fff. F92F1_8 d75_8fff.
         F92F2 f92a2fff. F92F2_11 a53a3_1f. F92F2_14 f92a2fff.
         F92F2_5 f92a2_5f. F92F2_8 a53a3_8f. F92F3 f92a3fff.
         F92F3_11 f92a3_1f. F92F3_14 f92a3fff. F92F3_5 f92a3_5f.
         F92F3_8 f92a3_8f. F92F4 a53a2fff. F92F4_11 a53a2_1f.
         F92F4_14 a53a2fff. F92F4_5 a53a2_5f. F92F4_8 a53a2_8f.
         F92F5 f92a5fff. F92F5_11 f92a5_1f. F92F5_14 f92a5fff.
         F92F5_5 f92a5_5f. F92F5_8 f92a5_8f. F92F6 f92a6fff.
         F92F6_11 f92a3_1f. F92F6_14 f92a6fff. F92F6_5 a532_5ff.
         F92F6_8 f92a3_8f. F92F7_11 f92a3_1f. F92F7_14 f92a3fff.
         F92G1 a54bffff. F92G1_11 a53a5_1f. F92G1_14 a54bffff.
         F92G1_5 d75_5fff. F92G1_8 d75_8fff. F92G2 f92a2fff.
         F92G2_11 a53a3_1f. F92G2_14 f92a2fff. F92G2_5 f92a2_5f.
         F92G2_8 a53a3_8f. F92G3 f92a3fff. F92G3_11 f92a3_1f.
         F92G3_14 f92a3fff. F92G3_5 f92a3_5f. F92G3_8 f92a3_8f.
         F92G4 a53a2fff. F92G4_11 a53a2_1f. F92G4_14 a53a2fff.
         F92G4_5 a53a2_5f. F92G4_8 a53a2_8f. F92G5 f92a5fff.
         F92G5_11 f92a5_1f. F92G5_14 f92a5fff. F92G5_5 f92a5_5f.
         F92G5_8 f92a5_8f. F92G6 f92a6fff. F92G6_11 f92a3_1f.
         F92G6_14 f92a6fff. F92G6_5 a532_5ff. F92G6_8 f92a3_8f.
         F92G7_11 f92a3_1f. F92G7_14 f92a3fff. F92H1 a54bffff.
         F92H1_11 a53a5_1f. F92H1_14 a54bffff. F92H1_5 d75_5fff.
         F92H1_8 d75_8fff. F92H2 f92a2fff. F92H2_11 a53a3_1f.
         F92H2_14 f92a2fff. F92H2_5 f92a2_5f. F92H2_8 a53a3_8f.
         F92H3 f92a3fff. F92H3_11 f92a3_1f. F92H3_14 f92a3fff.
         F92H3_5 f92a3_5f. F92H3_8 f92a3_8f. F92H4 a53a2fff.
         F92H4_11 a53a2_1f. F92H4_14 a53a2fff. F92H4_5 a53a2_5f.
         F92H4_8 a53a2_8f. F92H5 f92a5fff. F92H5_11 f92a5_1f.
         F92H5_14 f92a5fff. F92H5_5 f92a5_5f. F92H5_8 f92a5_8f.
         F92H6 f92a6fff. F92H6_11 f92a3_1f. F92H6_14 f92a6fff.
         F92H6_5 a532_5ff. F92H6_8 f92a3_8f. F92H7_11 f92a3_1f.
         F92H7_14 f92a3fff. F92I1 a54bffff. F92I1_11 a53a5_1f.
         F92I1_14 a54bffff. F92I1_5 d75_5fff. F92I1_8 d75_8fff.
         F92I2 f92a2fff. F92I2_11 a53a3_1f. F92I2_14 f92a2fff.
         F92I2_5 f92a2_5f. F92I2_8 a53a3_8f. F92I3 f92a3fff.
         F92I3_11 f92a3_1f. F92I3_14 f92a3fff. F92I3_5 f92a3_5f.
         F92I3_8 f92a3_8f. F92I4 a53a2fff. F92I4_11 a53a2_1f.
         F92I4_14 a53a2fff. F92I4_5 a53a2_5f. F92I4_8 a53a2_8f.
         F92I5 f92a5fff. F92I5_11 f92a5_1f. F92I5_14 f92a5fff.
         F92I5_5 f92a5_5f. F92I5_8 f92a5_8f. F92I6 f92a6fff.
         F92I6_11 f92a3_1f. F92I6_14 f92a6fff. F92I6_5 a532_5ff.
         F92I6_8 f92a3_8f. F92I7_11 f92a3_1f. F92I7_14 f92a3fff.
         F92J1 a54bffff. F92J1_11 a53a5_1f. F92J1_14 a54bffff.
         F92J1_5 d75_5fff. F92J1_8 d75_8fff. F92J2 f92a2fff.
         F92J2_11 a53a3_1f. F92J2_14 f92a2fff. F92J2_5 f92a2_5f.
         F92J2_8 a53a3_8f. F92J3 f92a3fff. F92J3_11 f92a3_1f.
         F92J3_14 f92a3fff. F92J3_5 f92a3_5f. F92J3_8 f92a3_8f.
         F92J4 a53a2fff. F92J4_11 a53a2_1f. F92J4_14 a53a2fff.
         F92J4_5 a53a2_5f. F92J4_8 a53a2_8f. F92J5 f92a5fff.
         F92J5_11 f92a5_1f. F92J5_14 f92a5fff. F92J5_5 f92a5_5f.
         F92J5_8 f92a5_8f. F92J6 f92a6fff. F92J6_11 f92a3_1f.
         F92J6_14 f92a6fff. F92J6_5 a532_5ff. F92J6_8 f92a3_8f.
         F92J7_11 f92a3_1f. F92J7_14 f92a3fff. F92K1_5 d75_5fff.
         F92K2_5 f92a2_5f. F92K3_5 f92a3_5f. F92K4_5 a53a2_5f.
         F92K5_5 f92a5_5f. F92K6_5 a532_5ff. F9A_11 a54b_11f.
         F9A_5 d75_5fff. F9A_8 a54b_8ff. F9_11 a54b_11f.
         F9_8 a54b_8ff. G01_11 g01_11ff. G01_14 g01_14ff.
         G01_5 g01_5fff. G01_8 g01_8fff. G02_11 a54b_11f.
         G02_14 d2ffffff. G02_5 a54b_5ff. G02_8 a54b_8ff.
         G1 g1ffffff. G10 g51fffff. G1011_11 a54b_11f.
         G1011_14 d2ffffff. G101_11 g511_11f. G101_14 f72fffff.
         G101_2 g51_2fff. G101_5 g51_5fff. G101_8 g511_8ff.
         G1021_11 g511_11f. G1021_14 f72fffff. G1021_8 g511_8ff.
         G102A_2 g51_2fff. G102B_11 g7_11fff. G102B_2 g51_2fff.
         G102C_11 g102c_1f. G102C_14 g102c_1_1f. G102_11 d91_11ff.
         G102_14 f71fffff. G102_5 g51_5fff. G1061_11 g1061_1f.
         G1061_14 g1061_1_1f. G1062_11 g1062_1f. G1062_14 g1062_1_1f.
         G1063_11 g1063_1f. G1063_14 g1063_1_1f. G106_11 d91_11ff.
         G106_14 f71fffff. G11 g11fffff. G11_11 g11_11ff.
         G11_14 g11fffff. G11_2 g11_2fff. G11_5 g11_5fff.
         G11_8 g11_8fff. G12 g12fffff. G122_11 g511_11f.
         G122_14 d2ffffff. G122_8 g511_8ff. G123_11 g511_11f.
         G123_14 d2ffffff. G123_8 g511_8ff. G12_11 g12_11ff.
         G12_14 g12fffff. G12_2 g12_2fff. G12_5 g12_5fff.
         G12_8 g12_8fff. G13 g13fffff. G130_11 d91_11ff.
         G130_14 f71fffff. G130_5 d71_5fff. G130_8 d91_8fff.
         G131_11 g131_11f. G131_14 g13fffff. G131_8 g131_8ff.
         G132_11 g132_11f. G132_14 g132_14f. G132_8 g132_8ff.
         G13_2 g13_2fff. G13_5 g13_5fff. G14A1 g14a1fff.
         G14A1_11 g14a1_1f. G14A1_14 g14a1fff. G14A1_2 g14a1_2f.
         G14A1_5 g14a1_5f. G14A1_8 g14a1_8f. G14A2 g14a2fff.
         G14A2_11 g14a2_1f. G14A2_14 g14a2fff. G14A2_2 g14a2_2f.
         G14A2_5 g14a2_5f. G14A2_8 g14a2_8f. G14B1 g14a1fff.
         G14B1_11 g14a1_1f. G14B1_14 g14a1fff. G14B1_2 g14a1_2f.
         G14B1_5 g14a1_5f. G14B1_8 g14a1_8f. G14B2 g14a2fff.
         G14B2_11 g14a2_1f. G14B2_14 g14a2fff. G14B2_2 g14a2_2f.
         G14B2_5 g14a2_5f. G14B2_8 g14a2_8f. G14C1 g14a1fff.
         G14C1_11 g14a1_1f. G14C1_14 g14a1fff. G14C1_2 g14a1_2f.
         G14C1_5 g14a1_5f. G14C1_8 g14a1_8f. G14C2 g14a2fff.
         G14C2_11 g14a2_1f. G14C2_14 g14a2fff. G14C2_2 g14a2_2f.
         G14C2_5 g14a2_5f. G14C2_8 g14a2_8f. G15A1 g15a1fff.
         G15A1_11 g15a1_1f. G15A1_14 g15a1fff. G15A1_2 g15a1_2f.
         G15A1_5 g15a1_5f. G15A1_8 g15a1_8f. G15A2 d71fffff.
         G15A2_11 d71_11ff. G15A2_14 d71fffff. G15A2_2 f21_2fff.
         G15A2_5 d71_5fff. G15A2_8 d71_8fff. G15A3 g15a3fff.
         G15A3_11 g15a3_1f. G15A3_14 g15a3fff. G15A3_2 g15a3_2f.
         G15A3_5 g15a3_5f. G15A3_8 g15a3_8f. G15B1 g15a1fff.
         G15B1_11 g15a1_1f. G15B1_14 g15a1fff. G15B1_2 g15a1_2f.
         G15B1_5 g15a1_5f. G15B1_8 g15a1_8f. G15B2 d71fffff.
         G15B2_11 d71_11ff. G15B2_14 d71fffff. G15B2_2 f21_2fff.
         G15B2_5 d71_5fff. G15B2_8 d71_8fff. G15B3 g15a3fff.
         G15B3_11 g15a3_1f. G15B3_14 g15a3fff. G15B3_2 g15a3_2f.
         G15B3_5 g15a3_5f. G15B3_8 g15a3_8f. G15C1 g15a1fff.
         G15C1_11 g15a1_1f. G15C1_14 g15a1fff. G15C1_2 g15a1_2f.
         G15C1_5 g15a1_5f. G15C1_8 g15a1_8f. G15C2 d71fffff.
         G15C2_11 d71_11ff. G15C2_14 d71fffff. G15C2_2 f21_2fff.
         G15C2_5 d71_5fff. G15C2_8 d71_8fff. G15C3 g15a3fff.
         G15C3_11 g15a3_1f. G15C3_14 g15a3fff. G15C3_2 g15a3_2f.
         G15C3_5 g15a3_5f. G15C3_8 g15a3_8f. G15D1 g15a1fff.
         G15D1_11 g15a1_1f. G15D1_14 g15a1fff. G15D1_2 g15a1_2f.
         G15D1_5 g15a1_5f. G15D1_8 g15a1_8f. G15D2 d71fffff.
         G15D2_11 d71_11ff. G15D2_14 d71fffff. G15D2_2 f21_2fff.
         G15D2_5 d71_5fff. G15D2_8 d71_8fff. G15D3 g15a3fff.
         G15D3_11 g15a3_1f. G15D3_14 g15a3fff. G15D3_2 g15a3_2f.
         G15D3_5 g15a3_5f. G15D3_8 g15a3_8f. G15E1 g15a1fff.
         G15E1_11 g15a1_1f. G15E1_14 g15a1fff. G15E1_2 g15a1_2f.
         G15E1_5 g15a1_5f. G15E1_8 g15a1_8f. G15E2 d71fffff.
         G15E2_11 d71_11ff. G15E2_14 d71fffff. G15E2_2 f21_2fff.
         G15E2_5 d71_5fff. G15E2_8 d71_8fff. G15E3 g15a3fff.
         G15E3_11 g15a3_1f. G15E3_14 g15a3fff. G15E3_2 g15a3_2f.
         G15E3_5 g15a3_5f. G15E3_8 g15a3_8f. G15F1 g15a1fff.
         G15F1_11 g15a1_1f. G15F1_14 g15a1fff. G15F1_2 g15a1_2f.
         G15F1_5 g15a1_5f. G15F1_8 g15a1_8f. G15F2 d71fffff.
         G15F2_11 d91_11ff. G15F2_14 d71fffff. G15F2_2 f21_2fff.
         G15F2_5 d71_5fff. G15F2_8 d91_8fff. G15F3 g15a3fff.
         G15F3_11 g15f3_1f. G15F3_14 g15a3fff. G15F3_2 g15a3_2f.
         G15F3_5 g15a3_5f. G15F3_8 g15f3_8f. G15G1 g15a1fff.
         G15G1_11 g15a1_1f. G15G1_14 g15a1fff. G15G1_2 g15a1_2f.
         G15G1_5 g15a1_5f. G15G1_8 g15a1_8f. G15G2 d71fffff.
         G15G2_11 d71_11ff. G15G2_14 d71fffff. G15G2_2 f21_2fff.
         G15G2_5 d71_5fff. G15G2_8 d71_8fff. G15G3 g15a3fff.
         G15G3_11 g15a3_1f. G15G3_14 g15a3fff. G15G3_2 g15a3_2f.
         G15G3_5 g15a3_5f. G15G3_8 g15a3_8f. G15H1 g15a1fff.
         G15H1_11 g15a1_1f. G15H1_14 g15a1fff. G15H1_2 g15a1_2f.
         G15H1_5 g15a1_5f. G15H1_8 g15a1_8f. G15H2 d71fffff.
         G15H2_11 d71_11ff. G15H2_14 d71fffff. G15H2_2 f21_2fff.
         G15H2_5 d71_5fff. G15H2_8 d71_8fff. G15H3 g15a3fff.
         G15H3_11 g15a3_1f. G15H3_14 g15a3fff. G15H3_2 g15a3_2f.
         G15H3_5 g15a3_5f. G15H3_8 g15a3_8f. G15I1 g15a1fff.
         G15I1_11 g15a1_1f. G15I1_14 g15a1fff. G15I1_2 g15a1_2f.
         G15I1_5 g15a1_5f. G15I1_8 g15a1_8f. G15I2 d71fffff.
         G15I2_11 d71_11ff. G15I2_14 d71fffff. G15I2_2 f21_2fff.
         G15I2_5 d71_5fff. G15I2_8 d71_8fff. G15I3 g15a3fff.
         G15I3_11 g15a3_1f. G15I3_14 g15a3fff. G15I3_2 g15a3_2f.
         G15I3_5 g15a3_5f. G15I3_8 g15a3_8f. G15J1 g15a1fff.
         G15J1A_11 g15n1a_f. G15J1A_14 g15q1_1f. G15J1_11 g15a1_1f.
         G15J1_14 g15a1fff. G15J1_2 g15a1_2f. G15J1_5 g15a1_5f.
         G15J1_8 g15a1_8f. G15J2 d71fffff. G15J2A_11 g15n1a_f.
         G15J2A_14 g15q1_1f. G15J2_11 d71_11ff. G15J2_14 d71fffff.
         G15J2_2 f21_2fff. G15J2_5 d71_5fff. G15J2_8 d71_8fff.
         G15J3 g15a3fff. G15J3A_11 g15n3a_f. G15J3A_14 g15q3_1f.
         G15J3_11 g15a3_1f. G15J3_14 g15a3fff. G15J3_2 g15a3_2f.
         G15J3_5 g15a3_5f. G15J3_8 g15a3_8f. G15K1 g15a1fff.
         G15K1_11 g15a1_1f. G15K1_14 g15a1fff. G15K1_2 g15a1_2f.
         G15K1_5 g15a1_5f. G15K1_8 g15a1_8f. G15K2 d71fffff.
         G15K2_11 d71_11ff. G15K2_14 d71fffff. G15K2_2 f21_2fff.
         G15K2_5 d71_5fff. G15K2_8 d71_8fff. G15K3 g15a3fff.
         G15K3_11 g15f3_1f. G15K3_14 g15a3fff. G15K3_2 g15a3_2f.
         G15K3_5 g15a3_5f. G15K3_8 g15f3_8f. G15L1 g15a1fff.
         G15L1_11 g15a1_1f. G15L1_14 g15a1fff. G15L1_2 g15a1_2f.
         G15L1_5 g15a1_5f. G15L1_8 g15a1_8f. G15L2 d71fffff.
         G15L2_11 d71_11ff. G15L2_14 d71fffff. G15L2_2 f21_2fff.
         G15L2_5 d71_5fff. G15L2_8 d71_8fff. G15L3 g15a3fff.
         G15L3_11 g15a3_1f. G15L3_14 g15a3fff. G15L3_2 g15a3_2f.
         G15L3_5 g15a3_5f. G15L3_8 g15a3_8f. G15M1 g15a1fff.
         G15M1_11 g15a1_1f. G15M1_14 g15a1fff. G15M1_2 g15a1_2f.
         G15M1_5 g15a1_5f. G15M1_8 g15a1_8f. G15M2 d71fffff.
         G15M2_11 d71_11ff. G15M2_14 d71fffff. G15M2_2 f21_2fff.
         G15M2_5 d71_5fff. G15M2_8 d71_8fff. G15M3 g15a3fff.
         G15M3_11 g15a3_1f. G15M3_14 g15a3fff. G15M3_2 g15a3_2f.
         G15M3_5 g15a3_5f. G15M3_8 g15a3_8f. G15N1 g15a1fff.
         G15N1A_11 g15n1a_f. G15N1A_14 g15q1_1f. G15N1_11 g15a1_1f.
         G15N1_14 g15a1fff. G15N1_2 g15a1_2f. G15N1_5 g15a1_5f.
         G15N1_8 g15a1_8f. G15N2 d71fffff. G15N2A_11 g15n1a_f.
         G15N2A_14 g15q1_1f. G15N2_11 d71_11ff. G15N2_14 d71fffff.
         G15N2_2 f21_2fff. G15N2_5 d71_5fff. G15N2_8 d71_8fff.
         G15N3 g15a3fff. G15N3A_11 g15n3a_f. G15N3A_14 g15q3_1f.
         G15N3_11 g15a3_1f. G15N3_14 g15a3fff. G15N3_2 g15a3_2f.
         G15N3_5 g15a3_5f. G15N3_8 g15a3_8f. G15O1 g15a1fff.
         G15O1_11 g15a1_1f. G15O1_14 g15a1fff. G15O1_2 g15a1_2f.
         G15O1_5 g15a1_5f. G15O1_8 g15a1_8f. G15O2 d71fffff.
         G15O2_11 d71_11ff. G15O2_14 d71fffff. G15O2_2 f21_2fff.
         G15O2_5 d71_5fff. G15O2_8 d71_8fff. G15O3 g15a3fff.
         G15O3_11 g15a3_1f. G15O3_14 g15a3fff. G15O3_2 g15a3_2f.
         G15O3_5 g15a3_5f. G15O3_8 g15a3_8f. G15P1 g15p1fff.
         G15P1_11 g15a1_1f. G15P1_14 g15p1fff. G15P1_2 g15a1_2f.
         G15P1_5 g15a1_5f. G15P1_8 g15a1_8f. G15P2 g15p2fff.
         G15P2_11 d71_11ff. G15P2_14 d71fffff. G15P2_2 f21_2fff.
         G15P2_5 d71_5fff. G15P2_8 d71_8fff. G15P3 g15a3fff.
         G15P3_11 g15a3_1f. G15P3_14 g15a3fff. G15P3_2 g15a3_2f.
         G15P3_5 g15a3_5f. G15P3_8 g15a3_8f. G15Q1_11 g15a1_1f.
         G15Q1_14 g15q1_1f. G15Q1_2 g15a1_2f. G15Q1_5 g15a1_5f.
         G15Q1_8 g15a1_8f. G15Q2_11 d71_11ff. G15Q2_14 g15q1_1f.
         G15Q2_2 f21_2fff. G15Q2_5 d71_5fff. G15Q2_8 d71_8fff.
         G15Q3_11 g15a3_1f. G15Q3_14 g15q3_1f. G15Q3_2 g15a3_2f.
         G15Q3_5 g15a3_5f. G15Q3_8 g15a3_8f. G15R1_11 g15a1_1f.
         G15R1_14 g15q1_1f. G15R1_2 g15a1_2f. G15R1_5 g15a1_5f.
         G15R1_8 g15a1_8f. G15R2_11 d71_11ff. G15R2_14 g15q1_1f.
         G15R2_2 f21_2fff. G15R2_5 d71_5fff. G15R2_8 d71_8fff.
         G15R3_11 g15a3_1f. G15R3_14 g15q3_1f. G15R3_2 g15a3_2f.
         G15R3_5 g15a3_5f. G15R3_8 g15a3_8f. G15S1_11 g15a1_1f.
         G15S1_14 g15q1_1f. G15S1_2 g15a1_2f. G15S1_5 g15a1_5f.
         G15S1_8 g15a1_8f. G15S2_11 d71_11ff. G15S2_14 g15q1_1f.
         G15S2_2 f21_2fff. G15S2_5 d71_5fff. G15S2_8 d71_8fff.
         G15S3_11 g15a3_1f. G15S3_14 g15q3_1f. G15S3_2 g15a3_2f.
         G15S3_5 g15a3_5f. G15S3_8 g15a3_8f. G15T1_11 g15a1_1f.
         G15T1_14 g15q1_1f. G15T1_2 g15a1_2f. G15T1_5 g15a1_5f.
         G15T1_8 g15a1_8f. G15T2_11 d71_11ff. G15T2_14 g15q1_1f.
         G15T2_2 f21_2fff. G15T2_5 d71_5fff. G15T2_8 d71_8fff.
         G15T3_11 g15a3_1f. G15T3_14 g15q3_1f. G15T3_2 g15a3_2f.
         G15T3_5 g15a3_5f. G15T3_8 g15a3_8f. G15U1_11 g15a1_1f.
         G15U1_14 g15q1_1f. G15U1_2 g15a1_2f. G15U1_5 g15a1_5f.
         G15U1_8 g15a1_8f. G15U2_11 d71_11ff. G15U2_14 g15q1_1f.
         G15U2_2 f21_2fff. G15U2_5 d71_5fff. G15U2_8 d71_8fff.
         G15U3_11 g15a3_1f. G15U3_14 g15q3_1f. G15U3_2 g15a3_2f.
         G15U3_5 g15a3_5f. G15U3_8 g15a3_8f. G15V1_11 g15a1_1f.
         G15V1_14 g15q1_1f. G15V1_2 g15a1_2f. G15V1_5 g15a1_5f.
         G15V1_8 g15a1_8f. G15V2_11 d91_11ff. G15V2_14 g15q1_1f.
         G15V2_2 f21_2fff. G15V2_5 d71_5fff. G15V2_8 d91_8fff.
         G15V3_11 g15f3_1f. G15V3_14 g15q3_1f. G15V3_2 g15a3_2f.
         G15V3_5 g15a3_5f. G15V3_8 g15f3_8f. G15W1_2 g15a1_2f.
         G15W1_5 g15a1_5f. G15W2_2 f21_2fff. G15W2_5 d71_5fff.
         G15W3_2 g15a3_2f. G15W3_5 g15a3_5f. G15Y2_11 g15n1a_f.
         G15Y2_14 f26_14ff. G15Y3_11 g15n3a_f. G15Y3_14 g15q3_1f.
         G1_11 g1_11fff. G1_14 g1ffffff. G1_2 g1_2ffff.
         G1_5 g1_5ffff. G1_8 g1_8ffff. G21 g21fffff.
         G21_11 a54b_11f. G21_14 g21fffff. G21_2 g21_2fff.
         G21_5 d12_5fff. G21_8 a54b_8ff. G22 d71fffff.
         G22_11 d91_11ff. G22_14 d71fffff. G22_2 f21_2fff.
         G22_5 d71_5fff. G22_8 d91_8fff. G23_11 g23_11ff.
         G23_14 g23_14ff. G24A_11 f41a12_f. G24A_14 f41a12__1f.
         G24_11 a535_11f. G24_14 a535_14f. G25A_11 f41a12_f.
         G25A_14 f41a12__1f. G25_11 a535_11f. G25_14 a535_14f.
         G3 d71fffff. G3_11 d91_11ff. G3_14 d71fffff.
         G3_2 g3_2ffff. G3_5 d71_5fff. G3_8 d91_8fff.
         G4 g4ffffff. G4A_11 g4a_11ff. G4A_14 g4a_14ff.
         G4B_11 g4b_11ff. G4B_14 g4b_14ff. G4_11 g4_11fff.
         G4_14 g4ffffff. G4_2 g4_2ffff. G4_5 g4_5ffff.
         G4_8 g4_8ffff. G51 g51fffff. G511_11 g511_11f.
         G511_14 g511_14f. G511_8 g511_8ff. G512_11 g511_11f.
         G512_14 g511_14f. G512_8 g511_8ff. G51_2 g51_2fff.
         G51_5 g51_5fff. G52 g51fffff. G521_11 g511_11f.
         G521_14 g511_14f. G521_8 g511_8ff. G522_11 g511_11f.
         G522_14 g511_14f. G522_8 g511_8ff. G52_2 g51_2fff.
         G52_5 g51_5fff. G6 g6ffffff. G6_11 g6_11fff.
         G6_14 g6ffffff. G6_2 g6_2ffff. G6_5 g6_5ffff.
         G7 g51fffff. G71_8 g511_8ff. G72_8 g511_8ff.
         G7_11 g7_11fff. G7_14 g51fffff. G7_2 g51_2fff.
         G7_5 g51_5fff. G81 g81fffff. G81_11 g81_11ff.
         G81_14 g81fffff. G81_2 g81_2fff. G81_5 g81_5fff.
         G81_8 g81_8fff. G82 g81fffff. G82_11 g81_11ff.
         G82_14 g81fffff. G82_2 g81_2fff. G82_5 g81_5fff.
         G82_8 g81_8fff. G83_11 g83_11ff. G83_14 g83_14ff.
         G83_2 g81_2fff. G83_5 g83_5fff. G83_8 g83_8fff.
         G9 g9ffffff. G9_11 g9_11fff. G9_14 g9ffffff.
         G9_2 g9_2ffff. G9_5 g9_5ffff. G9_8 g9_8ffff.
         H1 h1ffffff. H1_11 h1_11fff. H1_14 h1ffffff.
         H1_2 h1_2ffff. H1_5 h1_5ffff. H1_8 h1_8ffff.
         H21 h21fffff. H21_11 h21_11ff. H21_14 h21fffff.
         H21_2 h21_2fff. H21_5 h21_5fff. H21_8 h21_8fff.
         H22 h22fffff. H22_11 h22_11ff. H22_14 h22fffff.
         H22_2 h22_2fff. H22_5 h22_5fff. H22_8 h22_8fff.
         H3 h3ffffff. H3_11 h3_11fff. H3_14 h3ffffff.
         H3_2 h3_2ffff. H3_5 h3_5ffff. H3_8 h3_8ffff.
         H5_14 h5_14fff. H6 d71fffff. H6_11 d71_11ff.
         H6_14 d71fffff. H6_2 f21_2fff. H6_5 d71_5fff.
         H6_8 d71_8fff. H7 d71fffff. H71 h71fffff.
         H71_11 h71_11ff. H71_14 h71fffff. H71_2 h71_2fff.
         H71_5 h71_5fff. H71_8 h71_8fff. H7_11 d71_11ff.
         H7_14 d71fffff. H7_2 f21_2fff. H7_5 d71_5fff.
         H7_8 d71_8fff. H8 d71fffff. H8_2 f21_2fff.
         JIGE_11 a54b_11f. JIGE_14 a54bffff. JIGE_8 a54b_8ff.
         MONTHIN_11 monthinf. MONTH_2 month_2f. MONTH_5 month_5f.
         MONTH_8 month_8f. PROV provffff. RA2 ra2fffff.
         RA41 ra2fffff. RA41_14 ra2fffff. RA42 ra2fffff.
         RA42_14 ra2fffff. RA43 ra2fffff. RA43_14 ra2fffff.
         RA51 ra51ffff. RA51_11 ra51_11f. RA51_14 ra51ffff.
         RA51_2 ra51_2ff. RA51_5 ra51_5ff. RA51_8 ra51_8ff.
         RA52 ra2fffff. RA52_11 ra52_11f. RA52_14 ra2fffff.
         RA52_2 ra52_2ff. RA52_5 ra52_5ff. RA52_8 ra52_8ff.
         RA530_11 ra52_11f. RA530_14 ra2fffff. RA530_5 ra52_5ff.
         RA530_8 ra52_8ff. RA531_11 ra52_11f. RA531_14 ra2fffff.
         RA531_2 ra52_2ff. RA531_5 ra52_5ff. RA531_8 ra52_8ff.
         RA532_11 ra52_11f. RA532_14 ra2fffff. RA532_2 ra52_2ff.
         RA532_5 ra52_5ff. RA532_8 ra52_8ff. RA533_11 ra52_11f.
         RA533_14 ra2fffff. RA534_11 ra52_11f. RA534_14 ra2fffff.
         RA535_11 ra52_11f. RA535_14 ra2fffff. RA536_11 ra52_11f.
         RA536_14 ra2fffff. RA537_11 ra52_11f. RA537_14 ra2fffff.
         RA53A ra2fffff. RA53A_11 ra52_11f. RA53A_14 ra2fffff.
         RA53A_2 ra52_2ff. RA53A_5 ra52_5ff. RA53A_8 ra52_8ff.
         RA53B ra2fffff. RA53B_11 ra52_11f. RA53B_14 ra2fffff.
         RA53B_2 ra52_2ff. RA53B_5 ra52_5ff. RA53B_8 ra52_8ff.
         RA53C ra2fffff. RA53C_11 ra52_11f. RA53C_14 ra2fffff.
         RA53C_2 ra52_2ff. RA53C_5 ra52_5ff. RA53C_8 ra52_8ff.
         RA53D ra2fffff. RA53D_11 ra52_11f. RA53D_14 ra2fffff.
         RA53D_2 ra52_2ff. RA53D_5 ra52_5ff. RA53D_8 ra52_8ff.
         RA53E ra2fffff. RA53E_11 ra52_11f. RA53E_14 ra2fffff.
         RA53E_2 ra52_2ff. RA53E_5 ra52_5ff. RA53E_8 ra52_8ff.
         RA53F ra2fffff. RA53F_11 ra52_11f. RA53F_14 ra2fffff.
         RA53F_2 ra52_2ff. RA53F_5 ra52_5ff. RA53F_8 ra52_8ff.
         RA53G ra2fffff. RA53G_11 ra52_11f. RA53G_14 ra2fffff.
         RA53G_2 ra52_2ff. RA53G_5 ra52_5ff. RA53G_8 ra52_8ff.
         RA53H ra2fffff. RA53H_11 ra52_11f. RA53H_14 ra2fffff.
         RA53H_2 ra52_2ff. RA53H_5 ra52_5ff. RA53H_8 ra52_8ff.
         RA53I ra2fffff. RA53I_11 ra52_11f. RA53I_14 ra2fffff.
         RA53I_2 ra52_2ff. RA53I_5 ra52_5ff. RA53I_8 ra52_8ff.
         RA53J ra2fffff. RA53J_11 ra52_11f. RA53J_14 ra2fffff.
         RA53J_2 ra52_2ff. RA53J_5 ra52_5ff. RA53J_8 ra52_8ff.
         RA53K ra2fffff. RA53K_2 ra52_2ff. RA53K_5 ra52_5ff.
         RA53K_8 ra52_8ff. RA53L ra2fffff. RA53L_2 ra52_2ff.
         RA53L_5 ra52_5ff. RA53L_8 ra52_8ff. RA54 ra2fffff.
         RA540_11 ra52_11f. RA540_14 ra2fffff. RA540_5 ra52_5ff.
         RA541_11 ra52_11f. RA541_14 ra2fffff. RA541_5 ra52_5ff.
         RA541_8 ra52_8ff. RA542_11 ra52_11f. RA542_14 ra2fffff.
         RA542_5 ra52_5ff. RA542_8 ra52_8ff. RA54_11 ra52_11f.
         RA54_14 ra2fffff. RA54_2 ra52_2ff. RA54_5 ra52_5ff.
         RA54_8 ra52_8ff. RD1 rd1fffff. RD101 ra51ffff.
         RD101_11 ra51_11f. RD101_14 ra51ffff. RD101_5 ra51_5ff.
         RD101_8 ra51_8ff. RD102 ra2fffff. RD102_11 ra52_11f.
         RD102_14 ra2fffff. RD102_5 ra52_5ff. RD102_8 ra52_8ff.
         RD103 ra2fffff. RD103_11 ra52_11f. RD103_14 ra2fffff.
         RD103_5 ra52_5ff. RD103_8 ra52_8ff. RD11A ra51ffff.
         RD11A_11 ra51_11f. RD11A_14 ra51ffff. RD11A_2 ra51_2ff.
         RD11A_5 ra51_5ff. RD11A_8 ra51_8ff. RD11B ra51ffff.
         RD11B_11 ra51_11f. RD11B_14 ra51ffff. RD11B_2 ra51_2ff.
         RD11B_5 ra51_5ff. RD11B_8 ra51_8ff. RD11C ra51ffff.
         RD11C_11 ra51_11f. RD11C_14 ra51ffff. RD11C_2 ra51_2ff.
         RD11C_5 ra51_5ff. RD11C_8 ra51_8ff. RD11D ra51ffff.
         RD11D_11 ra51_11f. RD11D_14 ra51ffff. RD11D_2 ra51_2ff.
         RD11D_5 ra51_5ff. RD11D_8 ra51_8ff. RD11E ra51ffff.
         RD11E_11 ra51_11f. RD11E_14 ra51ffff. RD11E_2 ra51_2ff.
         RD11E_5 ra51_5ff. RD11E_8 ra51_8ff. RD11F ra51ffff.
         RD11F_11 ra51_11f. RD11F_14 ra51ffff. RD11F_2 ra51_2ff.
         RD11F_5 ra51_5ff. RD11F_8 ra51_8ff. RD11G ra51ffff.
         RD11G_11 ra51_11f. RD11G_14 ra51ffff. RD11G_2 ra51_2ff.
         RD11G_5 ra51_5ff. RD11G_8 ra51_8ff. RD11H ra51ffff.
         RD11H_11 ra51_11f. RD11H_14 ra51ffff. RD11H_2 ra51_2ff.
         RD11H_5 ra51_5ff. RD11H_8 ra51_8ff. RD11I_2 ra51_2ff.
         RD12_11 rd12_11f. RD12_14 ra2fffff. RD12_2 ra51_2ff.
         RD12_5 ra51_5ff. RD12_8 rd12_8ff. RD1_11 rd1_11ff.
         RD1_14 rd1fffff. RD1_2 ra51_2ff. RD1_5 ra51_5ff.
         RD1_8 rd1_8fff. RD2 ra51ffff. RD2_11 ra51_11f.
         RD2_14 ra51ffff. RD2_2 ra51_2ff. RD2_5 ra51_5ff.
         RD2_8 ra51_8ff. RD31 ra51ffff. RD31_11 ra51_11f.
         RD31_14 ra51ffff. RD31_2 ra51_2ff. RD31_5 ra51_5ff.
         RD31_8 ra51_8ff. RD32 ra51ffff. RD32_11 ra51_11f.
         RD32_14 ra51ffff. RD32_2 ra51_2ff. RD32_5 ra51_5ff.
         RD32_8 ra51_8ff. RD33_11 ra51_11f. RD33_14 ra2fffff.
         RD33_8 ra51_8ff. RD34_11 ra51_11f. RD34_14 ra2fffff.
         RD34_8 ra51_8ff. RD4ALGA_11 ra51_11f. RD4ALGA_14 ra2fffff.
         RD4ALGA_8 ra51_8ff. RD4BEAN ra51ffff. RD4BEAN_11 ra51_11f.
         RD4BEAN_14 ra51ffff. RD4BEAN_8 ra51_8ff. RD4BEN_2 ra51_2ff.
         RD4BEN_5 ra51_5ff. RD4DRUG_11 ra51_11f. RD4DRUG_14 ra2fffff.
         RD4DRUG_8 ra51_8ff. RD4EGG ra51ffff. RD4EGG_11 ra51_11f.
         RD4EGG_14 ra51ffff. RD4EGG_2 ra51_2ff. RD4EGG_5 ra51_5ff.
         RD4EGG_8 ra51_8ff. RD4FISH ra51ffff. RD4FISH_11 ra51_11f.
         RD4FISH_14 ra51ffff. RD4FISH_8 ra51_8ff. RD4FSH_2 ra51_2ff.
         RD4FSH_5 ra51_5ff. RD4GARL ra51ffff. RD4GARL_11 ra51_11f.
         RD4GARL_14 ra51ffff. RD4GARL_8 ra51_8ff. RD4GAR_2 ra51_2ff.
         RD4GAR_5 ra51_5ff. RD4MEAT ra51ffff. RD4MEAT_11 ra51_11f.
         RD4MEAT_14 ra51ffff. RD4MEAT_8 ra51_8ff. RD4MILK_14 ra2fffff.
         RD4MT_2 ra51_2ff. RD4MT_5 ra51_5ff. RD4NUT_11 ra51_11f.
         RD4NUT_14 ra2fffff. RD4NUT_8 ra51_8ff. RD4SUGA ra51ffff.
         RD4SUGA_11 ra51_11f. RD4SUGA_14 ra51ffff. RD4SUGA_8 ra51_8ff.
         RD4SUG_2 ra51_2ff. RD4SUG_5 ra51_5ff. RD4TEA ra51ffff.
         RD4TEA_11 ra51_11f. RD4TEA_14 ra51ffff. RD4TEA_2 ra51_2ff.
         RD4TEA_5 ra51_5ff. RD4TEA_8 ra51_8ff. RD4VEG ra51ffff.
         RD4VEG_11 ra51_11f. RD4VEG_14 ra51ffff. RD4VEG_2 ra51_2ff.
         RD4VEG_5 ra51_5ff. RD4VEG_8 ra51_8ff. RD4VIT_11 ra51_11f.
         RD4VIT_14 ra2fffff. RD4VIT_8 ra51_8ff. RD5 ra51ffff.
         RD5_11 ra51_11f. RD5_14 ra51ffff. RD5_2 ra51_2ff.
         RD5_5 ra51_5ff. RD5_8 ra51_8ff. RD6 ra51ffff.
         RD6_11 ra51_11f. RD6_14 ra51ffff. RD6_2 ra51_2ff.
         RD6_5 ra51_5ff. RD6_8 ra51_8ff. RD71 ra51ffff.
         RD710_11 ra52_11f. RD710_14 ra2fffff. RD71_11 ra51_11f.
         RD71_14 ra51ffff. RD71_2 ra51_2ff. RD71_5 ra51_5ff.
         RD71_8 ra51_8ff. RD72 ra2fffff. RD72_11 ra51_11f.
         RD72_14 ra2fffff. RD72_5 ra51_5ff. RD72_8 ra51_8ff.
         RD73 ra2fffff. RD73_11 ra52_11f. RD73_14 ra2fffff.
         RD73_5 ra52_5ff. RD73_8 ra52_8ff. RD74 ra2fffff.
         RD74_11 ra52_11f. RD74_14 ra2fffff. RD74_2 ra52_2ff.
         RD74_5 ra52_5ff. RD74_8 ra52_8ff. RD75 ra2fffff.
         RD75_11 ra52_11f. RD75_14 ra2fffff. RD75_2 ra52_2ff.
         RD75_5 ra52_5ff. RD75_8 ra52_8ff. RD76_11 ra52_11f.
         RD76_14 ra2fffff. RD77_11 ra52_11f. RD77_14 ra2fffff.
         RD78_11 ra52_11f. RD78_14 ra2fffff. RD79_11 ra52_11f.
         RD79_14 ra2fffff. RD81 ra51ffff. RD81_11 ra51_11f.
         RD81_14 ra51ffff. RD81_2 ra51_2ff. RD81_5 ra51_5ff.
         RD81_8 ra51_8ff. RD82 ra2fffff. RD82_11 ra51_11f.
         RD82_14 ra2fffff. RD82_5 ra51_5ff. RD82_8 ra51_8ff.
         RD83 ra2fffff. RD83_11 ra52_11f. RD83_14 ra2fffff.
         RD83_5 ra52_5ff. RD83_8 ra52_8ff. RD84 ra2fffff.
         RD84_11 ra52_11f. RD84_14 ra2fffff. RD84_2 ra52_2ff.
         RD84_5 ra52_5ff. RD84_8 ra52_8ff. RD85 ra2fffff.
         RD85_11 ra52_11f. RD85_14 ra2fffff. RD85_2 ra52_2ff.
         RD85_5 ra52_5ff. RD85_8 ra52_8ff. RD86 ra2fffff.
         RD86_11 ra51_11f. RD86_14 ra2fffff. RD86_2 ra52_2ff.
         RD86_5 ra52_5ff. RD86_8 ra51_8ff. RD87_11 ra52_11f.
         RD87_14 ra2fffff. RD91 ra51ffff. RD91_11 ra51_11f.
         RD91_14 ra51ffff. RD91_2 ra51_2ff. RD91_5 ra51_5ff.
         RD91_8 ra51_8ff. RD92 ra2fffff. RD92_11 ra52_11f.
         RD92_14 ra2fffff. RD92_5 ra52_5ff. RD92_8 ra52_8ff.
         RD93 ra2fffff. RD93_11 ra52_11f. RD93_14 ra2fffff.
         RD93_5 ra52_5ff. RD93_8 ra52_8ff. RD94 ra2fffff.
         RD94_11 ra52_11f. RD94_14 ra2fffff. RD94_2 ra52_2ff.
         RD94_5 ra52_5ff. RD94_8 ra52_8ff. RDEMILK_11 ra51_11f.
         RDEMILK_8 ra51_8ff. RE0_11 ra52_11f. RE0_14 ra2fffff.
         RE1 ra51ffff. RE10_11 ra51_11f. RE10_14 ra2fffff.
         RE10_2 ra51_2ff. RE10_5 ra51_5ff. RE10_8 ra51_8ff.
         RE11_11 ra51_11f. RE11_14 ra2fffff. RE11_2 ra51_2ff.
         RE11_5 ra51_5ff. RE11_8 ra51_8ff. RE12_11 ra51_11f.
         RE12_14 ra2fffff. RE12_2 ra51_2ff. RE12_5 ra51_5ff.
         RE12_8 ra51_8ff. RE13_11 ra51_11f. RE13_14 ra2fffff.
         RE13_2 ra51_2ff. RE13_5 ra51_5ff. RE13_8 ra51_8ff.
         RE14_11 ra51_11f. RE14_14 ra2fffff. RE14_2 ra51_2ff.
         RE14_5 ra51_5ff. RE14_8 ra51_8ff. RE1A_2 ra51_2ff.
         RE1B_11 ra51_11f. RE1B_14 ra2fffff. RE1B_5 ra52_5ff.
         RE1B_8 ra51_8ff. RE1_11 ra51_11f. RE1_14 re1_14ff.
         RE1_2 ra51_2ff. RE1_5 ra51_5ff. RE1_8 ra51_8ff.
         RE2 ra51ffff. RE2A_2 ra52_2ff. RE2B_11 ra51_11f.
         RE2B_14 ra2fffff. RE2B_5 ra52_5ff. RE2B_8 ra51_8ff.
         RE2_11 ra51_11f. RE2_14 re1_14ff. RE2_2 ra51_2ff.
         RE2_5 ra51_5ff. RE2_8 ra51_8ff. RE3 ra51ffff.
         RE3A_2 ra52_2ff. RE3B_11 ra51_11f. RE3B_14 ra2fffff.
         RE3B_5 ra52_5ff. RE3B_8 ra51_8ff. RE3_11 ra51_11f.
         RE3_14 re1_14ff. RE3_2 ra51_2ff. RE3_5 ra51_5ff.
         RE3_8 ra51_8ff. RE4 ra51ffff. RE4A_2 ra52_2ff.
         RE4B_11 ra51_11f. RE4B_14 ra2fffff. RE4B_5 ra52_5ff.
         RE4B_8 ra51_8ff. RE4_11 ra51_11f. RE4_14 re1_14ff.
         RE4_2 ra51_2ff. RE4_5 ra51_5ff. RE4_8 ra51_8ff.
         RE5 ra51ffff. RE5A_2 ra52_2ff. RE5B_11 ra51_11f.
         RE5B_14 ra2fffff. RE5B_5 ra52_5ff. RE5B_8 ra51_8ff.
         RE5_11 ra51_11f. RE5_14 re1_14ff. RE5_2 ra51_2ff.
         RE5_5 ra51_5ff. RE5_8 ra51_8ff. RE6 ra51ffff.
         RE610_11 ra51_11f. RE610_14 ra2fffff. RE610_5 ra52_5ff.
         RE610_8 ra51_8ff. RE62_11 ra51_11f. RE62_14 ra2fffff.
         RE62_5 ra52_5ff. RE62_8 ra51_8ff. RE63_11 ra51_11f.
         RE63_14 ra2fffff. RE63_5 ra52_5ff. RE63_8 ra51_8ff.
         RE64_11 ra51_11f. RE64_14 ra2fffff. RE64_5 ra52_5ff.
         RE64_8 ra51_8ff. RE65_11 ra51_11f. RE65_14 ra2fffff.
         RE65_5 ra52_5ff. RE65_8 ra51_8ff. RE66_5 ra52_5ff.
         RE67_11 ra51_11f. RE67_14 ra2fffff. RE67_5 ra52_5ff.
         RE67_8 ra51_8ff. RE6A_2 ra52_2ff. RE6B_11 ra51_11f.
         RE6B_14 ra2fffff. RE6B_5 ra52_5ff. RE6B_8 ra51_8ff.
         RE6_11 ra51_11f. RE6_14 re1_14ff. RE6_2 ra51_2ff.
         RE6_5 ra51_5ff. RE6_8 ra51_8ff. RE7_11 ra51_11f.
         RE7_14 ra2fffff. RE7_2 ra51_2ff. RE7_5 ra51_5ff.
         RE7_8 ra51_8ff. RE8_11 ra51_11f. RE8_14 ra2fffff.
         RE8_2 ra51_2ff. RE8_5 ra51_5ff. RE8_8 ra51_8ff.
         RE9_11 ra51_11f. RE9_14 ra2fffff. RE9_2 ra51_2ff.
         RE9_5 ra51_5ff. RE9_8 ra51_8ff. RELATYPE relatypf.
         REPLACE replacef. RESIC_11 resic_1f. RESIDENC residenf.
         RESIDENC_14 residenf. RESID_2 resid_2f. RESID_5 resid_5f.
         RESID_8 resid_8f. RF1 ra2fffff. RF10 ra2fffff.
         RF101 ra51ffff. RF101_11 ra52_11f. RF101_14 ra51ffff.
         RF101_8 ra52_8ff. RF102 ra51ffff. RF102_11 ra52_11f.
         RF102_14 ra51ffff. RF102_8 ra52_8ff. RF1030A_11 ra52_11f.
         RF1030_11 ra52_11f. RF1031A_11 ra52_11f. RF1031_11 ra52_11f.
         RF1032_11 ra52_11f. RF1033_11 ra52_11f. RF103A ra2fffff.
         RF103A_11 ra52_11f. RF103A_14 ra2fffff. RF103A_5 ra52_5ff.
         RF103A_8 ra52_8ff. RF103B ra2fffff. RF103B_11 ra52_11f.
         RF103B_14 ra2fffff. RF103B_5 ra52_5ff. RF103B_8 ra52_8ff.
         RF103C ra2fffff. RF103C_11 ra52_11f. RF103C_14 ra2fffff.
         RF103C_5 ra52_5ff. RF103C_8 ra52_8ff. RF103D ra2fffff.
         RF103D_11 ra52_11f. RF103D_14 ra2fffff. RF103D_5 ra52_5ff.
         RF103D_8 ra52_8ff. RF103E ra2fffff. RF103E_11 ra52_11f.
         RF103E_14 ra2fffff. RF103E_5 ra52_5ff. RF103E_8 ra52_8ff.
         RF103F ra2fffff. RF103F_11 ra52_11f. RF103F_14 ra2fffff.
         RF103F_5 ra52_5ff. RF103F_8 ra52_8ff. RF103G ra2fffff.
         RF103G_11 ra52_11f. RF103G_14 ra2fffff. RF103G_5 ra52_5ff.
         RF103G_8 ra52_8ff. RF103H ra2fffff. RF103H_11 ra52_11f.
         RF103H_14 ra2fffff. RF103H_5 ra52_5ff. RF103H_8 ra52_8ff.
         RF103I ra2fffff. RF103I_11 ra52_11f. RF103I_14 ra2fffff.
         RF103I_5 ra52_5ff. RF103I_8 ra52_8ff. RF103J ra2fffff.
         RF103J_11 ra52_11f. RF103J_14 ra2fffff. RF103J_5 ra52_5ff.
         RF103J_8 ra52_8ff. RF103K_11 ra52_11f. RF103K_14 ra2fffff.
         RF103K_5 ra52_5ff. RF103K_8 ra52_8ff. RF103L_11 ra52_11f.
         RF103L_14 ra2fffff. RF103L_5 ra52_5ff. RF103L_8 ra52_8ff.
         RF103M_11 ra52_11f. RF103M_14 ra2fffff. RF103M_5 ra52_5ff.
         RF103M_8 ra52_8ff. RF104_14 ra2fffff. RF104_2 ra52_2ff.
         RF105_14 ra2fffff. RF105_2 ra52_2ff. RF10_11 ra52_11f.
         RF10_14 ra2fffff. RF10_8 ra52_8ff. RF111_2 ra51_2ff.
         RF111_5 ra51_5ff. RF111_8 ra51_8ff. RF112_2 ra51_2ff.
         RF112_5 ra51_5ff. RF112_8 ra51_8ff. RF113_2 ra51_2ff.
         RF113_5 ra51_5ff. RF113_8 ra51_8ff. RF12_11 ra52_11f.
         RF12_14 ra2fffff. RF12_2 ra52_2ff. RF12_5 ra52_5ff.
         RF12_8 ra52_8ff. RF13_11 ra52_11f. RF13_14 ra2fffff.
         RF13_2 ra52_2ff. RF13_5 ra52_5ff. RF13_8 ra52_8ff.
         RF14_11 ra51_11f. RF14_14 ra2fffff. RF14_5 ra51_5ff.
         RF14_8 ra51_8ff. RF15_11 ra51_11f. RF15_14 ra2fffff.
         RF15_5 ra51_5ff. RF15_8 ra51_8ff. RF1_14 ra2fffff.
         RF1_8 ra52_8ff. RF2 ra2fffff. RF211_11 ra52_11f.
         RF211_14 ra2fffff. RF211_2 ra52_2ff. RF211_5 ra52_5ff.
         RF211_8 ra52_8ff. RF21_11 ra52_11f. RF21_14 ra2fffff.
         RF21_2 ra51_2ff. RF21_8 ra52_8ff. RF221_11 ra52_11f.
         RF221_14 ra2fffff. RF22_11 ra52_11f. RF22_14 ra2fffff.
         RF22_2 ra52_2ff. RF22_5 ra52_5ff. RF22_8 ra52_8ff.
         RF23_11 ra52_11f. RF23_14 ra2fffff. RF23_2 ra52_2ff.
         RF23_5 ra52_5ff. RF23_8 ra52_8ff. RF24_11 ra52_11f.
         RF24_14 ra2fffff. RF25A_14 ra2fffff. RF25B_11 ra52_11f.
         RF25B_14 ra2fffff. RF25_11 ra52_11f. RF26_11 ra52_11f.
         RF26_14 ra2fffff. RF27_11 ra52_11f. RF27_14 ra2fffff.
         RF2_14 ra2fffff. RF2_8 ra52_8ff. RF31 ra51ffff.
         RF31_11 ra51_11f. RF31_14 ra51ffff. RF31_2 ra51_2ff.
         RF31_5 ra51_5ff. RF31_8 ra51_8ff. RF32_11 ra51_11f.
         RF32_14 ra2fffff. RF32_2 ra51_2ff. RF32_5 ra51_5ff.
         RF32_8 ra51_8ff. RF33 ra51ffff. RF33_11 ra51_11f.
         RF33_14 ra51ffff. RF33_2 ra51_2ff. RF33_5 ra51_5ff.
         RF33_8 ra51_8ff. RF34 ra51ffff. RF340_11 ra51_11f.
         RF340_14 ra2fffff. RF340_5 ra51_5ff. RF340_8 ra51_8ff.
         RF34_11 ra51_11f. RF34_14 ra51ffff. RF34_2 ra51_2ff.
         RF34_5 ra51_5ff. RF34_8 ra51_8ff. RF35_11 ra51_11f.
         RF35_14 ra2fffff. RF35_2 ra51_2ff. RF35_5 ra51_5ff.
         RF35_8 ra51_8ff. RF41 ra51ffff. RF41A_11 ra52_11f.
         RF41A_14 ra2fffff. RF41B_11 ra52_11f. RF41B_14 ra2fffff.
         RF41_11 ra51_11f. RF41_14 ra51ffff. RF41_2 ra51_2ff.
         RF41_5 ra51_5ff. RF41_8 ra51_8ff. RF42 ra2fffff.
         RF42_11 ra52_11f. RF42_14 ra2fffff. RF42_5 ra52_5ff.
         RF42_8 ra52_8ff. RF43A ra2fffff. RF43A_11 ra52_11f.
         RF43A_14 ra2fffff. RF43A_5 ra52_5ff. RF43A_8 ra52_8ff.
         RF43B ra2fffff. RF43B_11 ra52_11f. RF43B_14 ra2fffff.
         RF43B_5 ra52_5ff. RF43B_8 ra52_8ff. RF43C ra2fffff.
         RF43C_11 ra52_11f. RF43C_14 ra2fffff. RF43C_5 ra52_5ff.
         RF43C_8 ra52_8ff. RF43D ra2fffff. RF43D_11 ra52_11f.
         RF43D_14 ra2fffff. RF43D_5 ra52_5ff. RF43D_8 ra52_8ff.
         RF44 ra2fffff. RF44_11 ra52_11f. RF44_14 ra2fffff.
         RF44_5 ra52_5ff. RF44_8 ra52_8ff. RF45 ra2fffff.
         RF45_11 ra52_11f. RF45_14 ra2fffff. RF45_2 ra52_2ff.
         RF45_5 ra52_5ff. RF45_8 ra52_8ff. RF46_11 ra52_11f.
         RF46_14 ra2fffff. RF46_5 ra52_5ff. RF46_8 ra52_8ff.
         RF47_11 rd1_11ff. RF47_14 ra2fffff. RF47_8 rd1_8fff.
         RF5 ra51ffff. RF5_11 ra51_11f. RF5_14 ra51ffff.
         RF5_2 ra51_2ff. RF5_5 ra51_5ff. RF5_8 ra51_8ff.
         RF61 ra51ffff. RF610_11 ra51_11f. RF610_14 ra2fffff.
         RF610_5 ra51_5ff. RF610_8 ra51_8ff. RF61_11 ra51_11f.
         RF61_14 ra51ffff. RF61_2 ra51_2ff. RF61_5 ra51_5ff.
         RF61_8 ra51_8ff. RF62 ra2fffff. RF62_11 ra51_11f.
         RF62_14 ra2fffff. RF62_8 ra51_8ff. RF63 ra2fffff.
         RF63_11 ra51_11f. RF63_14 ra2fffff. RF63_8 ra51_8ff.
         RF64 ra51ffff. RF64_11 ra51_11f. RF64_14 ra51ffff.
         RF64_2 ra51_2ff. RF64_5 ra51_5ff. RF64_8 ra51_8ff.
         RF65 ra51ffff. RF651A1_11 ra52_11f. RF651A1_14 ra2fffff.
         RF651A2_11 ra52_11f. RF651A2_14 ra2fffff. RF651A_5 ra51_5ff.
         RF651A_8 ra51_8ff. RF651B1_11 ra52_11f. RF651B1_14 ra2fffff.
         RF651B2_11 ra52_11f. RF651B2_14 ra2fffff. RF651B_5 ra51_5ff.
         RF651B_8 ra51_8ff. RF6521_11 ra52_11f. RF6521_14 ra2fffff.
         RF652A_11 ra52_11f. RF652A_14 ra2fffff. RF652B_11 ra52_11f.
         RF652B_14 ra2fffff. RF652_5 ra52_5ff. RF652_8 ra51_8ff.
         RF65_2 ra51_2ff. RF66 ra2fffff. RF66_11 ra52_11f.
         RF66_14 ra2fffff. RF66_8 ra52_8ff. RF71 ra2fffff.
         RF71_11 ra52_11f. RF71_14 ra2fffff. RF71_5 ra51_5ff.
         RF71_8 ra52_8ff. RF72 ra2fffff. RF721_11 ra52_11f.
         RF721_14 ra2fffff. RF721_5 ra52_5ff. RF721_8 ra52_8ff.
         RF722_11 ra52_11f. RF722_14 ra2fffff. RF722_5 ra52_5ff.
         RF722_8 ra52_8ff. RF73 ra2fffff. RF73_11 ra52_11f.
         RF73_14 ra2fffff. RF73_5 ra52_5ff. RF73_8 ra52_8ff.
         RF74_11 ra51_11f. RF74_14 ra51ffff. RF74_5 ra51_5ff.
         RF74_8 ra51_8ff. RF81 ra2fffff. RF81_11 ra52_11f.
         RF81_14 ra2fffff. RF81_5 ra51_5ff. RF81_8 ra52_8ff.
         RF82 ra2fffff. RF821_11 ra52_11f. RF821_14 ra2fffff.
         RF821_5 ra52_5ff. RF821_8 ra52_8ff. RF822_11 ra52_11f.
         RF822_14 ra2fffff. RF822_5 ra52_5ff. RF822_8 ra52_8ff.
         RF83 ra2fffff. RF83_11 ra52_11f. RF83_14 ra2fffff.
         RF83_5 ra52_5ff. RF83_8 ra52_8ff. RF84 ra2fffff.
         RF84_11 ra51_11f. RF84_14 ra2fffff. RF84_8 ra51_8ff.
         RF85_11 ra51_11f. RF85_14 ra51ffff. RF85_5 ra51_5ff.
         RF85_8 ra51_8ff. RF86_11 ra51_11f. RF86_14 ra51ffff.
         RF86_5 ra51_5ff. RF86_8 ra51_8ff. RF9 ra2fffff.
         RF901A_11 ra52_11f. RF901_11 ra52_11f. RF902A_11 ra52_11f.
         RF902_11 ra52_11f. RF91 ra2fffff. RF91_11 ra52_11f.
         RF91_14 ra2fffff. RF91_8 ra52_8ff. RF92A ra2fffff.
         RF92A_11 ra52_11f. RF92A_14 ra2fffff. RF92A_5 ra52_5ff.
         RF92A_8 ra52_8ff. RF92B ra2fffff. RF92B_11 ra52_11f.
         RF92B_14 ra2fffff. RF92B_5 ra52_5ff. RF92B_8 ra52_8ff.
         RF92C ra2fffff. RF92C_11 ra52_11f. RF92C_14 ra2fffff.
         RF92C_5 ra52_5ff. RF92C_8 ra52_8ff. RF92D ra2fffff.
         RF92D_11 ra52_11f. RF92D_14 ra2fffff. RF92D_5 ra52_5ff.
         RF92D_8 ra52_8ff. RF92E ra2fffff. RF92E_11 ra52_11f.
         RF92E_14 ra2fffff. RF92E_5 ra52_5ff. RF92E_8 ra52_8ff.
         RF92F ra2fffff. RF92F_11 ra52_11f. RF92F_14 ra2fffff.
         RF92F_5 ra52_5ff. RF92F_8 ra52_8ff. RF92G ra2fffff.
         RF92G_11 ra52_11f. RF92G_14 ra2fffff. RF92G_5 ra52_5ff.
         RF92G_8 ra52_8ff. RF92H ra2fffff. RF92H_11 ra52_11f.
         RF92H_14 ra2fffff. RF92H_5 ra52_5ff. RF92H_8 ra52_8ff.
         RF92I ra2fffff. RF92I_11 ra52_11f. RF92I_14 ra2fffff.
         RF92I_5 ra52_5ff. RF92I_8 ra52_8ff. RF92J ra2fffff.
         RF92J_11 ra52_11f. RF92J_14 ra2fffff. RF92J_5 ra52_5ff.
         RF92J_8 ra52_8ff. RF92K_5 ra52_5ff. RF9_11 ra52_11f.
         RF9_5 ra52_5ff. RF9_8 ra52_8ff. RG01_11 ra52_11f.
         RG01_14 ra2fffff. RG01_5 ra51_5ff. RG02_11 ra51_11f.
         RG02_14 ra2fffff. RG02_5 ra51_5ff. RG02_8 ra51_8ff.
         RG101_2 ra51_2ff. RG101_8 ra51_8ff. RG102_8 ra51_8ff.
         RG1061_11 ra52_11f. RG1061_14 ra2fffff. RG1062_11 ra52_11f.
         RG1062_14 ra2fffff. RG1063_11 ra52_11f. RG1063_14 ra2fffff.
         RG106_11 ra52_11f. RG106_14 ra2fffff. RG13 ra51ffff.
         RG130_11 ra52_11f. RG130_14 ra2fffff. RG130_5 ra51_5ff.
         RG13_11 ra52_11f. RG13_14 ra51ffff. RG13_2 ra51_2ff.
         RG13_5 ra51_5ff. RG13_8 ra51_8ff. RG14A_11 ra51_11f.
         RG14A_14 ra2fffff. RG14A_5 ra52_5ff. RG14A_8 ra51_8ff.
         RG14B_11 ra51_11f. RG14B_14 ra2fffff. RG14B_5 ra52_5ff.
         RG14B_8 ra51_8ff. RG14C_11 ra51_11f. RG14C_14 ra2fffff.
         RG14C_5 ra52_5ff. RG14C_8 ra51_8ff. RG15A_8 ra51_8ff.
         RG15B_8 ra51_8ff. RG15C_8 ra51_8ff. RG15D_8 ra51_8ff.
         RG15E_8 ra51_8ff. RG15F_8 ra51_8ff. RG15G_8 ra51_8ff.
         RG15H_8 ra51_8ff. RG15I_8 ra51_8ff. RG15J_8 ra51_8ff.
         RG15K_8 ra51_8ff. RG15L_8 ra51_8ff. RG15M_8 ra51_8ff.
         RG15N_8 ra51_8ff. RG15O_8 ra51_8ff. RG15P_8 ra51_8ff.
         RG15Q_8 ra51_8ff. RG15R_8 ra51_8ff. RG15S_8 ra51_8ff.
         RG15T_8 ra51_8ff. RG15U_8 ra51_8ff. RG15V_8 ra51_8ff.
         RG1_11 ra52_11f. RG1_14 ra2fffff. RG21_11 ra51_11f.
         RG21_14 ra2fffff. RG21_8 ra51_8ff. RG22_11 ra51_11f.
         RG22_14 ra2fffff. RG22_8 ra51_8ff. RG23_11 ra52_11f.
         RG23_14 ra2fffff. RG24A_11 ra52_11f. RG24A_14 ra2fffff.
         RG24_11 ra52_11f. RG24_14 ra2fffff. RG25A_11 ra52_11f.
         RG25A_14 ra2fffff. RG25_11 ra52_11f. RG25_14 ra2fffff.
         RG3_11 ra51_11f. RG3_14 ra2fffff. RG3_8 ra51_8ff.
         RG4A_11 ra52_11f. RG4A_14 ra2fffff. RG4B_11 ra52_11f.
         RG4B_14 ra2fffff. RG4_11 ra51_11f. RG4_14 ra2fffff.
         RG4_8 ra51_8ff. RG51_8 ra51_8ff. RG52_8 ra51_8ff.
         RG5_11 ra52_11f. RG5_14 ra2fffff. S1 s1ffffff.
         S2 s1ffffff. TYPE typeffff. VAGE_11 yearin_f.
         VAGE_2 vage_2ff. VAGE_5 vage_5ff. YEARIN_11 yearin_f.
    ;
*/

RUN ;
