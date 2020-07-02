/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0004: 2005-2014 LONGITUDINAL DATA, VERSION 1)
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
 | "c:\temp\36692-0004-data.txt").
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
VALUE d14licdf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE a53a3fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 9='(9) missing';
VALUE a541_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) for survivors, not applicable for the deceased persons'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE g14a2_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) bedridden all the year around' 999='(999) missing';
VALUE c31dffff  0='(0) wrong' 1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE c54_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE c22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE f25a1_1f  -1='(-0001) not applicable' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d8marryf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 8='(8) don''t know' 9='(9) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5) beer' 6='(6) others'
                9='(9) missing';
VALUE a542ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 9='(9) missing';
VALUE g83_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE h5ffffff  888='(888) don''t know' 999='(999) missing';
VALUE d14carpf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE rd12ffff  0='(0)  without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d33_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) vegetable grease'
                2='(2) gingili grease' 3='(3) lard' 4='(4) other animal''s fat' 8='(8) don''t know'
                9='(9) missing';
VALUE f16fffff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (/with spouse)and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE f103a2_f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 3='(3) unknown' 8='(8) don''t know' 9='(9) missing';
VALUE a542_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children & their spouses'
                4='(4) grandchildren & their spouses' 5='(5) public & collectives' 6='(6) others'
                8='(8) don''t know' 9='(9) missing';
VALUE e6b_8fff  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) for survivors, not applicable for the deceased persons'
                -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d11contf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE d11a53a_2f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) don''t know' 999='(999) missing';
VALUE dth08_1f  -9='(-9) lost to follow-up in the 2011/2012 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2011/2012 survey' 1='(1) died before the 2011/2012 survey'
                2='(2) surviving at 2011 survey but died before 2012 survey';
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
VALUE c55_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
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
VALUE a53a4fff  -1='(-1) not applicable' 1='(1) no education' 2='(2) primary school'
                3='(3) middle school' 4='(4) high school' 5='(5) collage or above' 9='(9) missing';
VALUE e4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE e62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE a537_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) never cooking'
                1='(1) gas: from underground pipes' 2='(2) gas: bottled, tank, or lp' 3='(3) electricity'
                4='(4) fuel oil, kerosene, etc' 5='(5) coal or coke' 6='(6) charcoal'
                7='(7) solar energy' 8='(8) firewood or straw' 9='(9) other';
VALUE rd12_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0)  without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d8knddrf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5) beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d4drug1_2f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f46fffff  -1='(-1) not applicable' 1='(1) yes full time' 2='(2) yes part time'
                3='(3) no' 9='(9) missing';
VALUE f64a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE e1b_11ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) not able to answer' 9998='(9998) more than 100000 days'
                9999='(9999) missing';
VALUE f31fffff  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 99='(99) missing';
VALUE c54_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially' 9='(9) missing';
VALUE g23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) do not brush'
                1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE f35_8fff  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) for survivors, not applicable for the deceased persons'
                99998='(99998) more than 100000' 99999='(99999) missing';
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
VALUE f103j6ff  -1='(-1) not applicable' 0='(00) UNDOCUMENTED CODE' 88='(88) don''t know'
                99='(99) missing';
VALUE d11vyeaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors';
VALUE c11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE d1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) rice' 2='(2) corn(maize)'
                3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat' 5='(5) other'
                9='(9) missing';
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
VALUE a541ffff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE e4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with assistance' 3='(3) bedridden' 9='(9) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE d8sexfff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) male'
                2='(2) female';
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
VALUE e63fffff  -1='(-0001) not applicable' 88888='(88888) do not know'
                99999='(99999) missing';
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
VALUE g13fffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE d11g23ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day' 3='(3) twice a day'
                4='(4) three or more times a day ' 8='(8) do not know' 9='(9) not applicable (no teeth)';
VALUE f16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                9='(9) missing';
VALUE d32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d11a535f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE b28_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE d8bedrif  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
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
VALUE f41_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
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
VALUE b11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4) seldom'
                5='(5) never' 8='(8) not able to answer' 9='(9) missing';
VALUE f111afff  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) do not know' 99='(99) missing';
VALUE g83_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) only left arm'
                2='(2) only right arm' 3='(3) two arms' 4='(4) neither left nor right arms'
                8='(8) don''t know' 9='(9) missing';
VALUE h3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) surprisingly healthy' 2='(2) relatively healthy' 3='(3) moderately ill'
                4='(4) very ill' 9='(9) missing';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE a41fffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian'
                36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) henan'
                44='(44) guangdong' 45='(45) guangxi' 46='(46)  hainan' 50='(50) chongqing'
                51='(51) sichuan' 52='(52) guizhou' 53='(53) yunnan' 54='(54)  tibet' 61='(61) shaanxi'
                62='(62) gansu' 63='(63)  qinghai' 64='(64)  ningxia' 65='(65)  xinjiang'
                71='(71) taiwan' 81='(81) hongkong' 90='(90) north korea' 91='(91) south korea'
                92='(92) berman' 93='(93) indonesia' 94='(94)  japan' 95='(95) vietnam' 96='(96) others'
                98='(98) don''t know' 99='(99) missing';
VALUE g1063_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) suddenly (over a few days)'
                2='(2) over a few months' 3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE e1ffffff  1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE g6ffffff  1='(1) regular' 2='(2) irregular' 9='(9) missing';
VALUE d11beddf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE g15a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE g102c_1f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                998='(998) more than 1000' 999='(999) missing';
VALUE d14g4fff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f41a12_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) do not know'
                99='(99) missing';
VALUE f64a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) no' 1='(1) yes'
                9='(9) missing';
VALUE g01_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE e1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) one part assistance' 3='(3) more than one part assistance' 9='(9) missing';
VALUE d8residf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) city'
                2='(2) town' 3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE a52_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                99='(99) missing';
VALUE f103a5_f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE d11retif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) retired (worker) '
                2='(2) retired (cadre) ' 3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE b21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) always' 2='(2) often'
                3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE d31fffff  1='(1) almost everyday' 2='(2) except winter' 3='(3) occasionally'
                4='(4) rarely or never' 9='(9) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE f46_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE a530_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) purchased' 2='(2) self-built' 3='(3) inherited'
                4='(4) welfare-oriented public housing' 5='(5) rented' 6='(6) subleased' 7='(7) others'
                8='(8) don''t know' 9='(9) missing';
VALUE h21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE re1_14ff  0='(0) without proxy';
VALUE f652_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                0='(00) UNDOCUMENTED CODE' 1='(01) public free medical services'
                2='(02) collective medical services' 3='(03) state and collective subsidies'
                4='(04) medical insurance' 5='(05) self' 6='(06) spouse' 7='(07) children'
                8='(08) no money to pay' 9='(09) others' 99='(99) missing';
VALUE d14doctf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE e65_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE d71_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                9='(9) missing';
VALUE a53a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d77_14ff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE e3_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE f1031b3f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                0='(000) UNDOCUMENTED CODE' 888='(888) do not know' 999='(999) missing';
VALUE f92a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g511_14f  888='(888) do not know' 999='(999) missing';
VALUE f47_14ff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) do not know' 9='(9) missing';
VALUE d11yr1ff  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d11g4fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE f1033_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) no child who live in other village/district/city' 8='(8) not able to answer'
                9='(9) missing';
VALUE b121_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) much better'
                2='(2) a little better' 3='(3) no change' 4='(4) a little worse' 5='(5) much worse'
                8='(8) not able to answer' 9='(9)  missing';
VALUE f151ffff  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE g9ffffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                9='(9) missing';
VALUE f111a_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(00) spouse'
                1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d14a533f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d6a_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) from a well'
                2='(2) from a river or lake' 3='(3) from a spring' 4='(4) from a pond or pool'
                5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no'
                3='(3) not sick (only for the elderly from the 1998 & 2000  waves)'
                8='(8) did not answer (only for those firstly interviewed in 2002 o' 9='(9) missing';
VALUE d8finanf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) retirement wage'
                2='(2) spouse' 3='(3) children' 4='(4) grandchildren' 5='(5) other relative''s'
                6='(6) state/local govenments or collectives' 7='(7) own work' 8='(8) others'
                9='(9) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 9='(9) missing';
VALUE e64fffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children and their spouses' 4='(4) grandchildren and their spouses'
                5='(5) public and collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE f21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE g7_11fff  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) do not know'
                999='(999) missing';
VALUE a530ffff  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 9='(9) missing';
VALUE f64i_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) no' 1='(1) yes'
                8='(8) don''t know' 9='(9) missing';
VALUE g12_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                88='(88) can''t turn around' 99='(99) missing';
VALUE a2ffffff  1='(1) han' 2='(2) hui' 3='(3) zhuang' 4='(4) yao' 5='(5) korea'
                6='(6) man' 7='(7) mongolia' 8='(8) others' 9='(9) missing';
VALUE d4meat2f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                9='(9) missing';
VALUE d91_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE f12a_8ff  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) for survivors, not applicable for the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) don''t know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE b210_14f  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE d11whopf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE c22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE d75_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE f141_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE g4a_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE f5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(01) spouse'
                2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law'
                6='(06) son and daughter' 7='(07) grandchildren' 8='(08) other relatives'
                9='(09) friends and neighbors' 10='(10) social services' 11='(11) live-in care giver'
                12='(12) nobody' 88='(88) don''t know' 99='(99) missing';
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
VALUE d8livarf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) institution'
                1='(1) alone due to never married' 2='(2) alone due to widowed or divorced'
                3='(3) with spouse only' 4='(4) with married children and/or grandchildren'
                5='(5) with grandchildren only' 6='(6) with unmarried children and/or offspring'
                7='(7) other relatives' 8='(8) others' 9='(9) missing';
VALUE d11dplaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE rd1_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) without proxy'
                1='(1) with proxy';
VALUE f2ffffff  0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE f12affff  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE g1ffffff  1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see'
                4='(4) blind' 9='(9) missing';
VALUE c31d_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) unable to do' 9='(9) missing';
VALUE d8whopaf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(01) free public medical services' 2='(02) self' 3='(03) spouse'
                4='(04) children or grandchilren' 5='(05) cooperative medical scheme'
                6='(06) state or collectives subsidy' 7='(07) medical insurance'
                8='(08) no money go to hospital' 9='(09) others' 88='(88) do not know' 99='(99) missing';
VALUE f64e1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d11carpf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE d8wcfacf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE d14d26a_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE a531ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 9='(9) missing';
VALUE g23_14ff  0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day'
                3='(3) twice a day' 4='(4) three or more times a day ' 8='(8) do not know'
                9='(9) not applicable (no teeth)';
VALUE d11a53af  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE f34fffff  1='(1) yes' 2='(2) no' 3='(3) so so' 4='(4) UNDOCUMENTED CODE'
                5='(5) UNDOCUMENTED CODE' 8='(8) don''t know' 9='(9) missing';
VALUE g15a3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 9='(9) missing';
VALUE f47_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d4a_14ff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE e2_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE d14knddf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE e62_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) willing to do' 2='(2) without patience' 3='(3) need respite care'
                4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE a52_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                99='(99) missing';
VALUE g15a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE g83fffff  1='(1) only left arm' 2='(2) only right arm' 3='(3) two arms'
                4='(4) neither left nor right arms' 9='(9) missing';
VALUE d1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) rice'
                2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)' 4='(4) rice and wheat'
                5='(5) other' 9='(9) missing';
VALUE f84_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
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
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
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
VALUE f92a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE d11a_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE d8beddaf  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9999='(9999) missing';
VALUE e64_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE g511_11f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' 888='(888) don''t know'
                999='(999) missing';
VALUE b21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) always'
                2='(2) often' 3='(3) sometimes' 4='(4)  seldom' 5='(5) never' 8='(8)  not able to answer'
                9='(9) missing';
VALUE g1062_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE a537_14f  0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE d8bathff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE d85_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f41fffff  1='(1) currently married and living with spouse' 2='(2) separated'
                3='(3)  divorced' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f211ffff  1='(1) yes, retired as a normally retiree'
                2='(2) yes, retired as a high officer' 3='(3) no' 9='(9) missing';
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
VALUE ra41ffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d14hypef  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE a53a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d8doctof  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) no' 2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE b210_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) all day long'
                2='(2) most of the day' 3='(3) about half of the day' 4='(4) less than half of the day'
                8='(8) not able to answer' 9='(9) missing';
VALUE f6521_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE g1063_1_1f  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE g131_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) no serious illness'
                88='(88) bedridden all the year around' 99='(99) missing';
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
VALUE a53a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -7='(-07) for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
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
VALUE d11incof  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' -1='(-0001) not applicable'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f43a2_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE d32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) except winter' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE c16fffff  88='(88) not able to answer' 99='(99) missing';
VALUE d8didayf  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) do not know' 9998='(9998) more than 10000 days'
                9999='(9999) missing';
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
VALUE c31d_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE a54a_8ff  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) for survivors, not applicable for the deceased persons'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d6afffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE d76_14ff  1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE g1061_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) left' 2='(2) right'
                3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE d4meat2_1f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) almost everyday'
                2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f610ffff  -1='(-1) not applicable (not sick)' 1='(1) no money'
                2='(2) far from hospital' 3='(3) inconvenience in movement' 4='(4) nobody to go with'
                5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE g01_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 8='(8) not able to answer'
                9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE d11retpf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE g14a1fff  -1='(-01) not applicable' 1='(001) hypertension' 2='(002) diabetes'
                3='(003) heart diseases' 4='(004) stroke, cvd'
                5='(005)  bronchitis, emphysema, asthma, pneumonia' 6='(006) pulmonary tuberculosis'
                7='(007) cataract' 8='(008) glaucoma' 9='(009) cancer' 10='(010) prostate tumor'
                11='(011)  gastric or duodenal ulcer' 12='(012) parkinson''s disease' 13='(013) bedsore'
                14='(014) arthritis' 15='(015) dementia' 160='(160) other'
                161='(161) diseases difficult to classify' 164='(164) psychosis' 165='(165) orthopedic'
                166='(166) internal medical disease' 167='(167) dermatosis'
                168='(168) five organs disease' 169='(169) gynecological disease' 888='(888) don''t know'
                999='(999) missing';
VALUE d8cargif  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) spouse'
                1='(1) children/their spouses' 2='(2) grandchildren/their spouses'
                3='(3) other family members' 4='(4) friends' 5='(5) social service providers'
                6='(6) nurse/maid' 7='(7) no body ' 8='(8) do not need care' 9='(9) missing';
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
VALUE f45fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d8dirdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE f27_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) not worth'
                2='(2) not necessary' 3='(3) cannot afford to the payment' 8='(8) do not know'
                9='(9) missing';
VALUE f6521_1_1f  1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE e64_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) spouse' 3='(3) children and their spouses'
                4='(4) grandchildren and their spouses' 5='(5) public and collectives' 6='(6) others'
                8='(8) not able to answer' 9='(9) missing';
VALUE d8painff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) very painful'
                2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful' 5='(5) peaceful'
                6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE d11finaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relative''s' 6='(6) state/local govenments or collectives' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE e63_11ff  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) not able to answer' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE a53b3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
VALUE f27_14ff  1='(1) not worth' 2='(2) not necessary'
                3='(3) cannot afford to the payment' 8='(8) do not know' 9='(9) missing';
VALUE a53a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE a535_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9) missing';
VALUE d8medicf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) yes' 2='(2) no'
                3='(3) was not sick' 8='(8) don''t know' 9='(9) missing';
VALUE f901b1_f  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE g102c_1_1f  888='(888) do not know' 998='(998) more than 1000' 999='(999) missing';
VALUE provffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang' 31='(31) shanghai'
                32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi'
                37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) henan' 44='(44) guangdong'
                45='(45) guangxi' 50='(50) chongqing' 51='(51) sichuan' 61='(61) shaanxi';
VALUE f23_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE g4_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE d11a53a_3f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) no education' 2='(2) attend school but not graduated from primary school'
                3='(3) primary school' 4='(4) middle school' 5='(5) high school' 6='(6) collage or above'
                8='(8) don''t know' 9='(9) missing';
VALUE d8contff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE rd1fffff  0='(0) without proxy' 1='(1) with proxy';
VALUE g9_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without using hands'
                2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d14g102f  -9='(-09) lost to follow-up in the 2014 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE e6_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE a54bffff  88='(88) don''t know' 99='(99) missing';
VALUE f151_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) not able to answer' 9='(9) missing';
VALUE d14bedrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d6cfffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 9='(9) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                9='(9) missing';
VALUE d11insuf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE e0_14fff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE h1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE a54affff  8888='(8888) don''t know' 9999='(9999) missing';
VALUE f43a4fff  -1='(-1) not applicable' 1='(1) good' 2='(2) so so' 3='(3) bad'
                8='(8) don''t know' 9='(9) missing';
VALUE d14cargf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body' 9='(9) do not need care';
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000' 3='(3) elder first interviewed in 2002'
                4='(4) elder first interviewed in 2005 to replace those lost to fol'
                5='(5) newly added elder in 2005' 6='(6) sibling of 1,2,3,4,5' 9='(9) missing';
VALUE d4milk1f  1='(1) almost everyday' 2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE month_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 99='(99) missing';
VALUE d8hyperf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE d8medcof  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) do not know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g1061_1_1f  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE e7_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE ra51_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) without proxy'
                1='(1) with proxy' 9='(9) missing';
VALUE d5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE b28_14ff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE g132_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
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
VALUE e5_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2)  occasional accidents' 3='(3) incontinent'
                9='(9) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) rice and wheat' 5='(5) other' 9='(9) missing';
VALUE g4a_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE a534_14f  8888='(8888) do not know' 9999='(9999) missing';
VALUE d14a535f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE e6ffffff  1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding'
                9='(9) missing';
VALUE a53a1fff  -1='(-1) not applicable' 0='(0) spouse' 1='(1) child'
                2='(2) spouse of child' 3='(3) grandchild' 4='(4)  spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d8carpaf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors'
                1='(01) medical insurance' 2='(02) self' 3='(03) spouse' 4='(04) children/grandchildren'
                5='(05) state or collectives' 6='(06) others' 88='(88) don''t know' 99='(99) missing';
VALUE b11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very good' 2='(2) good'
                3='(3) so so' 4='(4) bad' 5='(5)  very bad' 8='(8) not able to answer' 9='(9) missing';
VALUE f43a4_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE f35fffff  99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f71fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE yearin_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased';
VALUE h21_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) partially able to' 9='(9) missing';
VALUE f651a_8f  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) for survivors, not applicable for the deceased persons'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g51fffff  999='(999) missing';
VALUE f84_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE g14a1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
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
VALUE h1_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, without hearing aid'
                2='(2) yes, but needs hearing aid' 3='(3) partly, despite hearing aid' 4='(4) no'
                9='(9) missing';
VALUE a53b3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 9='(9) missing';
VALUE d14g106_1f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE e1b_8fff  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) for survivors, not applicable for the deceased persons'
                -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 100000 days' 9999='(9999) missing';
VALUE g9_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE g4b_14ff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE d11g4aff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never writing' 8='(8) don''t know' 9='(9) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE f651afff  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE c11_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) not able to answer' 9='(9) missing';
VALUE d8batdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) do not know' 9998='(9998) more than 10000' 9999='(9999) missing';
VALUE d14a537f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE e610ffff  -1='(-1) not applicable' 1='(01) spouse' 2='(02) son'
                3='(03) daughter-in-law' 4='(04) daughter' 5='(05) son-in-law' 6='(06) son and daughter'
                7='(07) grandchild(ren)' 8='(08) other relative(s)' 9='(09) neighbors'
                10='(10) social services' 11='(11) housekeeper' 12='(12) nobody' 88='(88) do not know'
                99='(99) missing';
VALUE d8licdof  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE f41a12__1f  88='(88) do not know' 99='(99) missing';
VALUE f141_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) don''t know ' 9='(9) missing';
VALUE f34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) very rich'
                2='(2) rich' 3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know'
                9='(9) missing';
VALUE d11marrf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE d34_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) insipidity'
                2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE h71_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE e7ffffff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                9='(9) missing';
VALUE resic_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural';
VALUE f43a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) good' 2='(2) so so' 3='(3) bad' 8='(8) don''t know' 9='(9) missing';
VALUE d34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) insipidity' 2='(2) salty'
                3='(3) sweet' 4='(4) hot' 5='(5) crude' 6='(6) do not have all the above tastes'
                8='(8) don''t know' 9='(9) missing';
VALUE f66fffff  1='(1) yes' 2='(2) no' 8='(8) did not answer' 9='(9) missing';
VALUE e67_8fff  -9='(-09) lost to follow-up in the 2008 survey'
                -7='(-07) for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 888='(888) not able to answer' 999='(999) missing';
VALUE a533_14f  1='(1) detached house' 2='(2) duplex/triplex'
                3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE d91_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE e3_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) assistance in cleaning or arranging clothes'
                3='(3) don''t use toilet' 9='(9) missing';
VALUE e67_11ff  -9='(-09) lost to follow-up in the 2011 survey'
                -8='(-08) died or lost to follow-up in previous waves'
                -7='(-07) for survivors, not applicable for deceased' -1='(-01) not applicable'
                888='(888) not able to answer' 999='(999) missing';
VALUE d14marrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE a51_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) with household member(s)'
                2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE g132_14f  88='(88) bedridden all the year around' 99='(99) missing';
VALUE e66fffff  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
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
                22='(22) hepatitis' 23='(23) other' 24='(24) UNDOCUMENTED CODE'
                25='(25) UNDOCUMENTED CODE' 66='(66) natural senescence without reporting any disease'
                88='(88) don''t know' 99='(99) missing';
VALUE f2_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture, forestry, animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE f41_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) currently married and living with spouse' 2='(2) separated' 3='(3)  divorced'
                4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE f45_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE e63_8fff  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) for survivors, not applicable for the deceased persons'
                -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d8incomf  -9='(-0009) lost to follow-up in the 2008 survey'
                -7='(-0007) the deceased persons only, not applicable to survivors'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE e62fffff  -1='(-1) not applicable' 1='(1) willing to do' 2='(2) without patience'
                3='(3) need respite care' 4='(4) unwilling to do' 5='(5) don''t know' 9='(9) missing';
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
VALUE f21fffff  1='(1) yes, receive a normal pension as a retired worker'
                2='(2) yes, receive a pension as a high government officer' 3='(3) no' 9='(9) missing';
VALUE a531_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) self' 2='(2) children' 3='(3) grandchildren' 4='(4) other relatives'
                5='(5) others' 8='(8) don''t know' 9='(9) missing';
VALUE d14d26af  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4) spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE g14b1_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
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
VALUE a53a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4)  spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE a51_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution' 9='(9) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE f103a5ff  -1='(-1) not applicable' 0='(0) co-reside with the sampled elder'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE d14painf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE f47_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) very good'
                2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad' 9='(9) missing';
VALUE e7_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes'
                2='(2) a little difficult' 3='(3) unable to do so' 9='(9) missing';
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
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
VALUE g15a1fff  1='(1) yes' 2='(2) no' 3='(3) don''t know' 9='(9) missing';
VALUE f5ffffff  1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchildren'
                8='(08) other relatives' 9='(09) friends and neighbors' 10='(10) social services'
                11='(11) live-in care giver' 12='(12) nobody' 99='(99) missing';
VALUE f12a_11f  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for survivors, not applicable for deceased' -1='(-0001) not applicable'
                88888='(88888) don''t know' 99998='(99998) more than 100000' 99999='(99999) missing';
VALUE h3ffffff  1='(1) surprisingly healthy' 2='(2) relatively healthy'
                3='(3) moderately ill' 4='(4) very ill' 9='(9) missing';
VALUE h71_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE d8diseaf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                0='(00) no' 1='(01) hypertension' 2='(02) diabetes' 3='(03) heart diseases'
                4='(04) stroke, cvd' 5='(05)  bronchitis, emphysema, asthma, pneumonia'
                6='(06) pulmonary tuberculosis' 7='(07) cancer' 8='(08) glaucoma, cataracts'
                9='(09) prostate tumor' 10='(10) gynecological diseases'
                11='(11) gastric or duodenal ulcer' 12='(12) parkinson''s disease' 13='(13) bedsore'
                14='(14) dementia' 15='(15) psychosis' 16='(16) neuropathy' 17='(17) arthritis'
                18='(18) other' 88='(88) don''t know' 99='(99) missing';
VALUE a53a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE f31_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE d8uncdaf  -9='(-009) lost to follow-up in the 2008 survey'
                -7='(-007) the deceased persons only, not applicable to survivors'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d75fffff  -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE d76_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) within 5 minutes'
                2='(2) 6-30 minutes' 3='(3) 31-60 minutes' 4='(4) after 60 minutes' 8='(8) do not know '
                9='(9) missing';
VALUE g15a3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 9='(9) missing';
VALUE c32_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(0) wrong' 1='(1) correct'
                8='(8) can''t use pen to draw the figure' 9='(9) not able to do this (disabled)';
VALUE a540_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE d11bathf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE g15n1a__1f  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
VALUE e65fffff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) do not know' 9='(9) missing';
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
VALUE e610_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchild(ren)'
                8='(08) other relative(s)' 9='(09) neighbors' 10='(10) social services'
                11='(11) housekeeper' 12='(12) nobody' 88='(88) not able to answer' 99='(99) missing';
VALUE d8generf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 9='(9) missing';
VALUE d11a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) almost everyday'
                2='(2) not daily, but once for a week' 3='(3) not weekly, but at least once for a month'
                4='(4) not monthly, but sometimes' 5='(5) never' 9='(9) missing';
VALUE f340_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE a54b_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 88='(88) don''t know'
                99='(99) missing';
VALUE f62_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes' 2='(2) no'
                3='(3) UNDOCUMENTED CODE' 8='(8) didn''t answer' 9='(9) missing';
VALUE g01fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE c16_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                88='(88) not able to answer' 99='(99) missing';
VALUE dth05_0f  -9='(-9) lost to follow-up in the 2008 survey'
                0='(0) surviving at the 2008 survey' 1='(1) died before the 2008 survey';
VALUE d11g106_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE d11didaf  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) do not know' 9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE a532_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) missing';
VALUE d14vdayf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE f340ffff  1='(1) make decisions on almost all spending in household'
                2='(2) make decisions on own and small other spending in household'
                3='(3) make decisions on almost all spending in household'
                4='(4) can''t make decisions on any spending ' 5='(5) don''t know' 9='(9) missing';
VALUE ra52_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE d4meat1f  1='(1) almost everyday' 2='(2) occasionally' 3='(3) rarely or never'
                8='(8) don''t know' 9='(9) missing';
VALUE d11knddf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE f103a8ff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) do not know'
                9='(9) missing';
VALUE a54a_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' 8888='(8888) don''t know'
                9999='(9999) missing';
VALUE ra52_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE h22_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE g1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see' 4='(4) blind'
                8='(8) don''t know' 9='(9) missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE g15a1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                3='(3) don''t know' 9='(9)  missing';
VALUE a532_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) missing';
VALUE d8dplacf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) home'
                2='(2) hospital' 3='(3) institutions' 4='(4) others' 9='(9) missing';
VALUE d11doctf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE g15w3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) so so' 3='(3) no'
                9='(9) missing';
VALUE g11fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 9='(9) missing';
VALUE g11_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) yes, standing'
                2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know' 9='(9) missing';
VALUE d14dresf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE d77_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) at much less risk'
                2='(2) at less risk' 3='(3) at the same risk' 4='(4) at higher risk'
                5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE d8dreamf  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 1='(1) no' 2='(2) yes'
                3='(3) do not know' 8='(8) don''t know' 9='(9) missing';
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
VALUE e67fffff  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE a53a4_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) UNDOCUMENTED CODE' 1='(1) no education'
                2='(2) attend school but not graduated from primary school' 3='(3) primary school'
                4='(4) middle school' 5='(5) high school' 6='(6) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE g15n1a_f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes' 2='(2) no'
                8='(8) do not know' 9='(9)  missing';
VALUE d11affff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE d11illff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE f92a5fff  -1='(-1) not applicable' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE e1_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 9='(9) missing';
VALUE g15f3_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d11licdf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE a54b_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) don''t know'
                99='(99) missing';
VALUE g4b_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE c32_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) can''t use pen to draw the figure'
                9='(9) not able to do this (disabled)';
VALUE g15n3a__1f  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE g4ffffff  1='(1) right-handed' 2='(2) left-handed' 9='(9) missing';
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
VALUE g511_8ff  -9='(-09) lost to follow-up in the 2008 survey'
                -7='(-07) for survivors, not applicable for the deceased persons' 888='(888) don''t know'
                999='(999) missing';
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
VALUE f23_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 9='(9) missing';
VALUE d11resif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) city' 2='(2) town'
                3='(3) rural' 8='(8) do not know' 9='(9) missing';
VALUE f652ffff  -1='(-1) not applicable' 1='(01) public free medical services'
                2='(02) cooperative medical scheme' 3='(03) state and collective subsidies'
                4='(04) medical insurance' 5='(05) self' 6='(06) spouse' 7='(07) children'
                8='(08) no money to pay' 9='(09) others' 99='(99) missing';
VALUE h22_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) visually impaired, but can hear' 2='(2) hearing impaired, but can see'
                3='(3) visually and hearing impaired' 4='(4) paralyzed'
                5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE d4drug1f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE d14dreaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE e65_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                1='(1) full meet' 2='(2) so so' 3='(3) unable to meet' 8='(8) not able to answer'
                9='(9) missing';
VALUE d11marr_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE g4_8ffff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE g12_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) can''t turn around'
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
VALUE d8persof  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) don''t know'
                99='(99) missing';
VALUE a540ffff  -1='(-1) not applicalbe'
                1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) don''t own house/apartment but want to separate from children'
                4='(4) easy contact with other older persons' 5='(5) others' 9='(9) missing';
VALUE f34_14ff  1='(1) yes' 2='(2) no' 3='(3) so so' 8='(8) don''t know' 9='(9) missing';
VALUE d11dreaf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE f46_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) yes full time' 2='(2) yes part time' 3='(3) no' 9='(9) missing';
VALUE d5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) boiled water'
                2='(2) un-boiled water' 9='(9) missing';
VALUE f340_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 9='(9) missing';
VALUE e6_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2) with some help' 3='(3) need feeding' 9='(9) missing';
VALUE a541_11f  -9='(-009) lost to follow-up in the 2011 survey'
                -8='(-008) died or lost to follow-up in previous waves'
                -7='(-007) for survivors, not applicable for deceased' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE g131_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                0='(00) no serious illness' 88='(88) bedridden all the year around' 99='(99) missing';
VALUE d11g4bff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE f111bfff  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                77='(77) did not answer';
VALUE monthinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 99='(99) missing';
VALUE g81_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) right hand'
                2='(2) left hand' 3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know'
                9='(9) missing';
VALUE d11g106f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE f64affff  0='(0) no' 1='(1) yes' 9='(9) missing';
VALUE a43fffff  1='(1) urban' 2='(2) rural' 9='(9) missing';
VALUE e0_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) yes, strongly limited'
                2='(2) yes, limited' 3='(3) not limited' 8='(8) do not know' 9='(9) missing';
VALUE e5_11fff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) without assistance'
                2='(2)  occasional accidents' 3='(3) incontinent' 9='(9) missing';
VALUE f31_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(01) retirement wages' 2='(02) spouse' 3='(03) child(ren)' 4='(04) grandchild(ren)'
                5='(05) other relative(s)' 6='(06) local government or community' 7='(07) work by self'
                8='(08) others' 9='(09) no other means' 99='(99) missing';
VALUE d12fffff  99='(99) missing';
VALUE f141ffff  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE e1bfffff  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
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
VALUE f610_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable (not sick)'
                1='(1) no money' 2='(2) far from hospital' 3='(3) inconvenience to travel'
                4='(4) nobody to go with' 5='(5) didn''t want to go' 6='(6) other' 9='(9) missing';
VALUE f103a5__1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                0='(0) co-residence' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE f21_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) retired (worker)' 2='(2) retired  (cadre)' 3='(3) no' 9='(9) missing';
VALUE f34_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) very rich' 2='(2) rich'
                3='(3) so so' 4='(4) poor' 5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE d34_14ff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE g15f3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) rather serious' 2='(2) more or less' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE f92a5_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) same village' 2='(2) same town/district' 3='(3) same county/city'
                4='(4) county/city near by' 5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g14a2_8f  -9='(-09) lost to follow-up in the 2008 survey'
                -7='(-07) for survivors, not applicable for the deceased persons'
                -1='(-01) not applicable' 888='(888) bedridden all the year around' 999='(999) missing';
VALUE d4drug1_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) almost everyday'
                2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE f92a3_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE d85_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) very strong liquor' 2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine'
                5='(5)  beer' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE a53a5_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 9='(9) missing';
VALUE d8vdayff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' 88='(88) do not know'
                99='(99) missing';
VALUE d14livaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home'
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE d8smktif  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE g132_11f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased'
                88='(88) bedridden all the year around' 99='(99) missing';
VALUE d11medcf  -9='(-0009) lost to follow-up in the 2011 survey'
                -8='(-0008) died or lost to follow-up in previous waves'
                -7='(-0007) for deceased, not applicable for survivors' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
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
VALUE f43a2_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' -1='(-1) not applicable'
                1='(1) married' 2='(2) divorced' 3='(3) widowed' 8='(8) don''t know' 9='(9) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE b121ffff  1='(1) much better' 2='(2) a little better' 3='(3) no change'
                4='(4) a little worse' 5='(5) much worse' 8='(8) not able to answer' 9='(9)  missing';
VALUE resid_8f  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) city'
                2='(2) town' 3='(3) rural';
VALUE c16_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 88='(88) not able to answer'
                99='(99) missing';
VALUE c53a_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 0='(0) wrong'
                1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE d31_8fff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons' 1='(1) almost everyday'
                2='(2) quite often' 3='(3) occasionally' 4='(4) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE g81_11ff  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 1='(1) right hand' 2='(2) left hand'
                3='(3) both hands' 4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
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
VALUE d11medif  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) was not sick' 8='(8) do not know' 9='(9) missing';
VALUE d11noinf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) not worth' 2='(2) not necessary' 3='(3) cannot afford to pay' 4='(4) not sure'
                8='(8) do not know' 9='(9) missing';
VALUE d11cargf  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) spouse'
                2='(2) children/their spouses' 3='(3) grandchildren/their spouses'
                4='(4) other family members' 5='(5) friends' 6='(6) social service providers'
                7='(7) nurse/maid' 8='(8) no body ' 9='(9) do not need care';
VALUE f610_8ff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) for survivors, not applicable for the deceased persons'
                -1='(-1) not applicable (not sick)' 1='(1) no money' 2='(2) far from hospital'
                3='(3) inconvenience to travel' 4='(4) nobody to go with' 5='(5) didn''t want to go'
                6='(6) other' 9='(9) missing';
VALUE f111a_1f  -9='(-9) lost to follow-up in the 2011 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                -7='(-7) for survivors, not applicable for deceased' 0='(00) spouse' 1='(01) son'
                2='(02) daughter' 3='(03) daughter-in-law' 4='(04) son-in-law'
                5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE d8illfff  -9='(-9) lost to follow-up in the 2008 survey'
                -7='(-7) the deceased persons only, not applicable to survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE d14genef  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0004;
INFILE "&VERSION\DS0004\36692-0004-Data.txt" LRECL=7907;
INPUT
       ID 1-8                  MONTHIN 9-10
        DAYIN 11-12             V_BTHYR 13-16           V_BTHMON 17-18
        PROV 19-20              TYPE 21                 RESIDENC 22
        TRUEAGE 23-25           A1 26                   A2 27
        RA41 28                 A41 29-30               RA42 31
        A42 32                  RA43 33                 A43 34
        RA51 35                 A51 36                  RA52 37-38
        A52 39-40               RA53A 41-42             A53A1 43-44
        A53A2 45-47             A53A3 48-49             A53A4 50-51
        RA53B 52-53             A53B1 54-55             A53B2 56-58
        A53B3 59-60             A53B4 61-62             RA53C 63-64
        A53C1 65-66             A53C2 67-69             A53C3 70-71
        A53C4 72-73             RA53D 74-75             A53D1 76-77
        A53D2 78-80             A53D3 81-82             A53D4 83-84
        RA53E 85-86             A53E1 87-88             A53E2 89-91
        A53E3 92-93             A53E4 94-95             RA53F 96-97
        A53F1 98-99             A53F2 100-102           A53F3 103-104
        A53F4 105-106           RA53G 107-108           A53G1 109-110
        A53G2 111-113           A53G3 114-115           A53G4 116-117
        RA53H 118-119           A53H1 120-121           A53H2 122-124
        A53H3 125-126           A53H4 127-128           RA53I 129-130
        A53I1 131-132           A53I2 133-135           A53I3 136-137
        A53I4 138-139           RA53J 140-141           A53J1 142-143
        A53J2 144-146           A53J3 147-148           A53J4 149-150
        RA53K 151-152           A53K1 153-154           A53K2 155-157
        A53K3 158-159           A53K4 160-161           RA53L 162-163
        A53L1 164-165           A53L2 166-168           A53L3 169-170
        A53L4 171-172           RA530 173-174           A530 175-176
        RA531 177-178           A531 179-180            RA532 181-182
        A532 183-184            RA540 185-186           A540 187-188
        RA541 189-190           A541 191-194            RA542 195-196
        A542 197-198            RA54 199-200            A54A 201-204
        A54B 205-206            B11 207                 B12 208
        B121 209                B21 210                 B22 211
        B23 212                 B24 213                 B25 214
        B26 215                 B27 216                 C11 217
        C12 218                 C13 219                 C14 220
        C15 221                 C16 222-223             C21A 224
        C21B 225                C21C 226                C22 227-228
        C31A 229                C31B 230                C31C 231
        C31D 232                C31E 233                C32 234
        C41A 235                C41B 236                C41C 237
        C51A 238                C51B 239                C52 240
        C53A 241                C53B 242                C53C 243
        C54 244                 C55 245-246             RD1 247
        D1 248                  RD2 249                 D2 250-251
        RD31 252                D31 253                 RD32 254
        D32 255                 RD4MEAT 256             D4MEAT1 257
        D4MEAT2 258             RD4FISH 259             D4FISH1 260
        D4FISH2 261             RD4EGG 262              D4EGG1 263
        D4EGG2 264              RD4BEAN 265             D4BEAN1 266
        D4BEAN2 267             RD4VEG 268              D4VEG1 269
        D4VEG2 270              RD4SUGA 271             D4SUGA1 272
        D4SUGA2 273             RD4TEA 274              D4TEA1 275
        D4TEA2 276              RD4GARL 277             D4GARL1 278
        D4GARL2 279             RD5 280                 D5 281
        RD6 282                 D6A 283                 D6B 284
        D6C 285                 RD71 286                D71 287
        RD72 288                D72 289                 RD73 290-291
        D73 292-294             RD74 295-296            D74 297-299
        RD75 300-301            D75 302-303             RD81 304
        D81 305                 RD82 306                D82 307
        RD83 308-309            D83 310-312             RD84 313-314
        D84 315-317             RD85 318-319            D85 320-321
        RD86 322-323            D86 324-325             RD91 326
        D91 327                 RD92 328-329            D92 330
        RD93 331-332            D93 333-335             RD94 336-337
        D94 338-340             RD101 341               D101 342
        RD102 343-344           D102 345-347            RD103 348-349
        D103 350-352            RD11A 353               D11A 354
        RD11B 355               D11B 356                RD11C 357
        D11C 358                RD11D 359               D11D 360
        RD11E 361               D11E 362                RD11F 363
        D11F 364                RD11G 365               D11G 366
        RD11H 367               D11H 368                RD12 369
        D12 370-371             RE1 372                 E1 373
        RE1B 374-375            E1B 376-379             RE2 380
        E2 381                  RE2B 382-383            E2B 384-387
        RE3 388                 E3 389                  RE3B 390-391
        E3B 392-395             RE4 396                 E4 397
        RE4B 398-399            E4B 400-403             RE5 404
        E5 405                  RE5B 406-407            E5B 408-411
        RE6 412                 E6 413                  RE6B 414-415
        E6B 416-419             RE610 420-421           E610 422-423
        RE62 424-425            E62 426-427             RE63 428-429
        E63 430-434             RE64 435-436            E64 437-438
        RE65 439-440            E65 441-442             RE66 443-444
        E66 445-446             RE67 447-448            E67 449-451
        RE7 452                 E7 453                  RE8 454
        E8 455                  RE9 456                 E9 457
        RE10 458                E10 459                 RE11 460
        E11 461                 RE12 462                E12 463
        RE13 464                E13 465                 RE14 466
        E14 467                 RF1 468                 F1 469-470
        RF2 471-472             F2 473                  RF21 474-475
        F21 476                 RF211 477-478           F211 479-480
        RF22 481-482            F22 483-486             RF23 487-488
        F23 489-490             RF31 491                F31 492-493
        RF32 494                F32A 495-496            F32B 497-498
        F32C 499-500            F32D 501-502            F32E 503-504
        RF33 505                F33 506                 RF340 507
        F340 508                RF34 509                F34 510
        RF35 511                F35 512-516             RF41 517
        F41 518                 RF42 519-520            F42 521-522
        RF43A 523-524           F43A1 525-527           F43A2 528-529
        F43A3 530-532           F43A4 533-534           RF43B 535-536
        F43B1 537-539           F43B2 540-541           F43B3 542-544
        F43B4 545-546           RF43C 547-548           F43C1 549-551
        F43C2 552-553           F43C3 554-556           F43C4 557-558
        RF43D 559-560           F43D1 561-563           F43D2 564-565
        F43D3 566-568           F43D4 569-570           RF44 571-572
        F44 573-574             RF45 575-576            F45 577-578
        RF46 579-580            F46 581-582             RF5 583
        F5 584-585              RF61 586                F61 587
        RF610 588-589           F610 590-591            RF62 592
        F62 593                 RF63 594                F63 595
        RF64 596                F64A 597                F64B 598
        F64C 599                F64D 600                F64E 601
        F64F 602                F64G 603                F64H 604
        F64I 605                RF651A 606              F651A 607-611
        RF651B 612              F651B 613-617           RF652 618-619
        F652 620-621            RF66 622-623            F66 624
        RF71 625-626            F71 627                 RF721 628-629
        F721 630-632            RF722 633-634           F722 635-637
        RF73 638-639            F73 640-642             RF74 643
        F74 644-645             RF81 646-647            F81 648
        RF821 649-650           F821 651-653            RF822 654-655
        F822 656-658            RF83 659-660            F83 661-663
        RF84 664                F84 665                 RF85 666
        F85 667                 RF86 668                F86 669-670
        RF9 671-672             F9 673-674              F9A 675-676
        RF91 677-678            F91 679-680             RF92A 681-682
        F92A1 683-684           F92A2 685-686           F92A3 687-688
        F92A4 689-691           F92A5 692-693           F92A6 694-695
        RF92B 696-697           F92B1 698-699           F92B2 700-701
        F92B3 702-703           F92B4 704-706           F92B5 707-708
        F92B6 709-710           RF92C 711-712           F92C1 713-714
        F92C2 715-716           F92C3 717-718           F92C4 719-721
        F92C5 722-723           F92C6 724-725           RF92D 726-727
        F92D1 728-729           F92D2 730-731           F92D3 732-733
        F92D4 734-736           F92D5 737-738           F92D6 739-740
        RF92E 741-742           F92E1 743-744           F92E2 745-746
        F92E3 747-748           F92E4 749-751           F92E5 752-753
        F92E6 754-755           RF92F 756-757           F92F1 758-759
        F92F2 760-761           F92F3 762-763           F92F4 764-766
        F92F5 767-768           F92F6 769-770           RF92G 771-772
        F92G1 773-774           F92G2 775-776           F92G3 777-778
        F92G4 779-781           F92G5 782-783           F92G6 784-785
        RF92H 786-787           F92H1 788-789           F92H2 790-791
        F92H3 792-793           F92H4 794-796           F92H5 797-798
        F92H6 799-800           RF92I 801-802           F92I1 803-804
        F92I2 805-806           F92I3 807-808           F92I4 809-811
        F92I5 812-813           F92I6 814-815           RF92J 816-817
        F92J1 818-819           F92J2 820-821           F92J3 822-823
        F92J4 824-826           F92J5 827-828           F92J6 829-830
        RF92K 831-832           F92K1 833-834           F92K2 835-836
        F92K3 837-838           F92K4 839-841           F92K5 842-843
        F92K6 844-845           RF10 846-847            F10 848-849
        F10A 850-851            RF101 852-853           F101 854-855
        RF102 856-857           F102 858-859            RF103A 860-861
        F103A6 862-863          F103A8 864-865          F103A1 866-867
        F103A2 868-869          F103A3 870-872          F103A4 873-874
        F103A7 875-876          F103A5 877-878          RF103B 879-880
        F103B6 881-882          F103B8 883-884          F103B1 885-886
        F103B2 887-888          F103B3 889-891          F103B4 892-893
        F103B7 894-895          F103B5 896-897          RF103C 898-899
        F103C6 900-901          F103C8 902-903          F103C1 904-905
        F103C2 906-907          F103C3 908-910          F103C4 911-912
        F103C7 913-914          F103C5 915-916          RF103D 917-918
        F103D6 919-920          F103D8 921-922          F103D1 923-924
        F103D2 925-926          F103D3 927-929          F103D4 930-931
        F103D7 932-933          F103D5 934-935          RF103E 936-937
        F103E6 938-939          F103E8 940-941          F103E1 942-943
        F103E2 944-945          F103E3 946-948          F103E4 949-950
        F103E7 951-952          F103E5 953-954          RF103F 955-956
        F103F6 957-958          F103F8 959-960          F103F1 961-962
        F103F2 963-964          F103F3 965-967          F103F4 968-969
        F103F7 970-971          F103F5 972-973          RF103G 974-975
        F103G6 976-977          F103G8 978-979          F103G1 980-981
        F103G2 982-983          F103G3 984-986          F103G4 987-988
        F103G7 989-990          F103G5 991-992          RF103H 993-994
        F103H6 995-996          F103H8 997-998          F103H1 999-1000
        F103H2 1001-1002        F103H3 1003-1005        F103H4 1006-1007
        F103H7 1008-1009        F103H5 1010-1011        RF103I 1012-1013
        F103I6 1014-1015        F103I8 1016-1017        F103I1 1018-1019
        F103I2 1020-1021        F103I3 1022-1024        F103I4 1025-1026
        F103I7 1027-1028        F103I5 1029-1030        RF103J 1031-1032
        F103J6 1033-1034        F103J8 1035-1036        F103J1 1037-1038
        F103J2 1039-1040        F103J3 1041-1043        F103J4 1044-1045
        F103J7 1046-1047        F103J5 1048-1049        RF103K 1050-1051
        F103K6 1052-1053        F103K8 1054-1055        F103K1 1056-1057
        F103K2 1058-1059        F103K3 1060-1062        F103K4 1063-1064
        F103K7 1065-1066        F103K5 1067-1068        RF103L 1069-1070
        F103L6 1071-1072        F103L8 1073-1074        F103L1 1075-1076
        F103L2 1077-1078        F103L3 1079-1081        F103L4 1082-1083
        F103L7 1084-1085        F103L5 1086-1087        RF103M 1088-1089
        F103M6 1090-1091        F103M8 1092-1093        F103M1 1094-1095
        F103M2 1096-1097        F103M3 1098-1100        F103M4 1101-1102
        F103M7 1103-1104        F103M5 1105-1106        RF104 1107-1108
        F104 1109-1111          RF105 1112-1113         F105 1114-1116
        RF111 1117              F111A 1118-1119         F111B 1120-1121
        F111C 1122-1123         RF112 1124              F112A 1125-1126
        F112B 1127-1128         F112C 1129-1130         RF113 1131
        F113A 1132-1133         F113B 1134-1135         F113C 1136-1137
        RF12 1138-1139          F12A 1140-1144          F12B 1145-1149
        F12C 1150-1154          RF13 1155-1156          F13A 1157-1161
        F13B 1162-1166          F13C 1167-1171          RF14 1172
        F141 1173               F142 1174               F143 1175
        F144 1176               F145 1177               F146 1178
        F147 1179               F148 1180               F149 1181
        RF15 1182               F151 1183               F152 1184
        F153 1185               F154 1186               F155 1187
        F156 1188               F157 1189               F158 1190
        F159 1191               F16 1192                RG01 1193
        G01 1194                RG02 1195               G02 1196-1197
        G1 1198                 G21 1199-1200           G22 1201
        G3 1202                 G4 1203                 G51 1204-1206
        G52 1207-1209           G6 1210                 G7 1211-1213
        G81 1214                G82 1215                G83 1216
        G9 1217                 G101 1218-1220          G102 1221-1223
        G11 1224                G12 1225-1226           RG130 1227
        G130 1228               RG13 1229               G13 1230-1231
        RG14A 1232-1233         G14A1 1234-1236         G14A2 1237-1239
        RG14B 1240-1241         G14B1 1242-1244         G14B2 1245-1247
        RG14C 1248-1249         G14C1 1250-1252         G14C2 1253-1255
        G15A1 1256              G15A2 1257              G15A3 1258-1259
        G15B1 1260              G15B2 1261              G15B3 1262-1263
        G15C1 1264              G15C2 1265              G15C3 1266-1267
        G15D1 1268              G15D2 1269              G15D3 1270-1271
        G15E1 1272              G15E2 1273              G15E3 1274-1275
        G15F1 1276              G15F2 1277              G15F3 1278-1279
        G15G1 1280              G15G2 1281              G15G3 1282-1283
        G15H1 1284              G15H2 1285              G15H3 1286-1287
        G15I1 1288              G15I2 1289              G15I3 1290-1291
        G15J1 1292              G15J2 1293              G15J3 1294-1295
        G15K1 1296              G15K2 1297              G15K3 1298-1299
        G15L1 1300              G15L2 1301              G15L3 1302-1303
        G15M1 1304              G15M2 1305              G15M3 1306-1307
        G15N1 1308              G15N2 1309              G15N3 1310-1311
        G15O1 1312              G15O2 1313              G15O3 1314-1315
        G15P1 1316              G15P2 1317              G15P3 1318-1319
        G15Q1 1320              G15Q2 1321              G15Q3 1322-1323
        G15R1 1324              G15R2 1325              G15R3 1326-1327
        G15S1 1328              G15S2 1329              G15S3 1330-1331
        G15T1 1332              G15T2 1333              G15T3 1334-1335
        G15U1 1336              G15U2 1337              G15U3 1338-1339
        G15V1 1340              G15V2 1341              G15V3 1342-1343
        G15W1 1344              G15W2 1345              G15W3 1346-1347
        H1 1348                 H21 1349                H22 1350-1351
        H3 1352                 H5 1353-1355            H6 1356
        H7 1357                 H71 1358-1359           W_2005 1360-1374 .13
        DTH05_08 1375-1376      YEAR_8 1377-1380        MONTH_8 1381-1382
        DAY_8 1383-1384         RESID_8 1385-1386       VAGE_8 1387-1389
        RA51_8 1390-1391        A51_8 1392-1393         RA52_8 1394-1395
        A52_8 1396-1397         RA53A_8 1398-1399       A53A1_8 1400-1401
        A53A3_8 1402-1403       A53A2_8 1404-1406       A53A4_8 1407-1408
        RA53B_8 1409-1410       A53B1_8 1411-1412       A53B3_8 1413-1414
        A53B2_8 1415-1417       A53B4_8 1418-1419       RA53C_8 1420-1421
        A53C1_8 1422-1423       A53C3_8 1424-1425       A53C2_8 1426-1428
        A53C4_8 1429-1430       RA53D_8 1431-1432       A53D1_8 1433-1434
        A53D3_8 1435-1436       A53D2_8 1437-1439       A53D4_8 1440-1441
        RA53E_8 1442-1443       A53E1_8 1444-1445       A53E3_8 1446-1447
        A53E2_8 1448-1450       A53E4_8 1451-1452       RA53F_8 1453-1454
        A53F1_8 1455-1456       A53F3_8 1457-1458       A53F2_8 1459-1461
        A53F4_8 1462-1463       RA53G_8 1464-1465       A53G1_8 1466-1467
        A53G3_8 1468-1469       A53G2_8 1470-1472       A53G4_8 1473-1474
        RA53H_8 1475-1476       A53H1_8 1477-1478       A53H3_8 1479-1480
        A53H2_8 1481-1483       A53H4_8 1484-1485       RA53I_8 1486-1487
        A53I1_8 1488-1489       A53I3_8 1490-1491       A53I2_8 1492-1494
        A53I4_8 1495-1496       RA53J_8 1497-1498       A53J1_8 1499-1500
        A53J11_8 $1501          A53J3_8 1502-1503       A53J2_8 1504-1506
        A53J4_8 1507-1508       RA53K_8 1509-1510       A53K1_8 1511-1512
        A53K11_8 $1513          A53K3_8 1514-1515       A53K2_8 1516-1518
        A53K4_8 1519-1520       RA53L_8 1521-1522       A53L1_8 1523-1524
        A53L11_8 $1525          A53L3_8 1526-1527       A53L2_8 1528-1530
        A53L4_8 1531-1532       RA530_8 1533-1534       A530_8 1535-1536
        RA531_8 1537-1538       A531_8 1539-1540        RA532_8 1541-1542
        A532_8 1543-1544        RA541_8 1545-1546       A541_8 1547-1550
        RA542_8 1551-1552       A542_8 1553-1554        RA54_8 1555-1556
        A54A_8 1557-1560        A54B_8 1561-1562        B11_8 1563-1564
        B12_8 1565-1566         B121_8 1567-1568        B21_8 1569-1570
        B22_8 1571-1572         B23_8 1573-1574         B24_8 1575-1576
        B25_8 1577-1578         B26_8 1579-1580         B27_8 1581-1582
        C11_8 1583-1584         C12_8 1585-1586         C13_8 1587-1588
        C14_8 1589-1590         C15_8 1591-1592         C16_8 1593-1594
        C21A_8 1595-1596        C21B_8 1597-1598        C21C_8 1599-1600
        C22_8 1601-1602         C31A_8 1603-1604        C31B_8 1605-1606
        C31C_8 1607-1608        C31D_8 1609-1610        C31E_8 1611-1612
        C32_8 1613-1614         C41A_8 1615-1616        C41B_8 1617-1618
        C41C_8 1619-1620        C51A_8 1621-1622        C51B_8 1623-1624
        C52_8 1625-1626         C52X1_8 1627-1628       C52X2_8 1629-1630
        C53A_8 1631-1632        C53B_8 1633-1634        C53C_8 1635-1636
        C54_8 1637-1638         C55_8 1639-1640         RD1_8 1641-1642
        D1_8 1643-1644          RD2_8 1645-1646         D2_8 1647-1648
        RD31_8 1649-1650        D31_8 1651-1652         RD32_8 1653-1654
        D32_8 1655-1656         RD33_8 1657-1658        D33_8 1659-1660
        RD34_8 1661-1662        D34_8 1663-1664         RD4MEAT_8 1665-1666
        D4MEAT2_8 1667-1668     D4MEAT1_8 1669-1670     RD4FISH_8 1671-1672
        D4FISH2_8 1673-1674     D4FISH1_8 1675-1676     RD4EGG_8 1677-1678
        D4EGG2_8 1679-1680      D4EGG1_8 1681-1682      RD4BEAN_8 1683-1684
        D4BEAN2_8 1685-1686     D4BEAN1_8 1687-1688     RD4VEG_8 1689-1690
        D4VEG2_8 1691-1692      D4VEG1_8 1693-1694      RD4SUGA_8 1695-1696
        D4SUGA2_8 1697-1698     D4SUGA1_8 1699-1700     RD4TEA_8 1701-1702
        D4TEA2_8 1703-1704      D4TEA1_8 1705-1706      RD4GARL_8 1707-1708
        D4GARL2_8 1709-1710     D4GARL1_8 1711-1712     RDEMILK_8 1713-1714
        D4MILK1_8 1715-1716     D4MILK2_8 1717-1718     RD4NUT_8 1719-1720
        D4NUT1_8 1721-1722      D4NUT2_8 1723-1724      RD4ALGA_8 1725-1726
        D4ALGA1_8 1727-1728     D4ALGA2_8 1729-1730     RD4VIT_8 1731-1732
        D4VIT1_8 1733-1734      D4VIT2_8 1735-1736      RD4DRUG_8 1737-1738
        D4DRUG1_8 1739-1740     D4DRUG2_8 1741-1742     RD5_8 1743-1744
        D5_8 1745-1746          RD6_8 1747-1748         D6A_8 1749-1750
        D6B_8 1751-1752         D6C_8 1753-1754         RD71_8 1755-1756
        D71_8 1757-1758         RD72_8 1759-1760        D72_8 1761-1762
        RD73_8 1763-1764        D73_8 1765-1767         RD74_8 1768-1769
        D74_8 1770-1772         RD75_8 1773-1774        D75_8 1775-1776
        RD81_8 1777-1778        D81_8 1779-1780         RD82_8 1781-1782
        D82_8 1783-1784         RD83_8 1785-1786        D83_8 1787-1789
        RD84_8 1790-1791        D84_8 1792-1794         RD85_8 1795-1796
        D85_8 1797-1798         RD86_8 1799-1800        D86_8 1801-1802
        RD91_8 1803-1804        D91_8 1805-1806         RD92_8 1807-1808
        D92_8 1809-1810         RD93_8 1811-1812        D93_8 1813-1815
        RD94_8 1816-1817        D94_8 1818-1820         RD101_8 1821-1822
        D101_8 1823-1824        RD102_8 1825-1826       D102_8 1827-1829
        RD103_8 1830-1831       D103_8 1832-1834        RD11A_8 1835-1836
        D11A_8 1837-1838        RD11B_8 1839-1840       D11B_8 1841-1842
        RD11C_8 1843-1844       D11C_8 1845-1846        RD11D_8 1847-1848
        D11D_8 1849-1850        RD11E_8 1851-1852       D11E_8 1853-1854
        RD11F_8 1855-1856       D11F_8 1857-1858        RD11G_8 1859-1860
        D11G_8 1861-1862        RD11H_8 1863-1864       D11H_8 1865-1866
        RD12_8 1867-1868        D12_8 1869-1870         RE6_8 1871-1872
        E6_8 1873-1874          RE6B_8 1875-1876        E6B_8 1877-1880
        RE1_8 1881-1882         E1_8 1883-1884          RE1B_8 1885-1886
        E1B_8 1887-1890         RE2_8 1891-1892         E2_8 1893-1894
        RE2B_8 1895-1896        E2B_8 1897-1900         RE3_8 1901-1902
        E3_8 1903-1904          RE3B_8 1905-1906        E3B_8 1907-1910
        RE4_8 1911-1912         E4_8 1913-1914          RE4B_8 1915-1916
        E4B_8 1917-1920         RE5_8 1921-1922         E5_8 1923-1924
        RE5B_8 1925-1926        E5B_8 1927-1930         RE610_8 1931-1932
        E610_8 1933-1934        RE62_8 1935-1936        E62_8 1937-1938
        RE63_8 1939-1940        E63_8 1941-1945         RE64_8 1946-1947
        E64_8 1948-1949         RE65_8 1950-1951        E65_8 1952-1953
        RE67_8 1954-1955        E67_8 1956-1958         RE7_8 1959-1960
        E7_8 1961-1962          RE8_8 1963-1964         E8_8 1965-1966
        RE9_8 1967-1968         E9_8 1969-1970          RE10_8 1971-1972
        E10_8 1973-1974         RE11_8 1975-1976        E11_8 1977-1978
        RE12_8 1979-1980        E12_8 1981-1982         RE13_8 1983-1984
        E13_8 1985-1986         RE14_8 1987-1988        E14_8 1989-1990
        RF1_8 1991-1992         F1_8 1993-1994          RF2_8 1995-1996
        F2_8 1997-1998          F2T_8 $1999             RF21_8 2000-2001
        F21_8 2002-2003         RF211_8 2004-2005       F211_8 2006-2007
        RF22_8 2008-2009        F22_8 2010-2013         RF23_8 2014-2015
        F23_8 2016-2017         RF31_8 2018-2019        F31_8 2020-2021
        RF32_8 2022-2023        F32A_8 2024-2025        F32B_8 2026-2027
        F32C_8 2028-2029        F32D_8 2030-2031        F32E_8 2032-2033
        RF33_8 2034-2035        F33_8 2036-2037         RF340_8 2038-2039
        F340_8 2040-2041        RF34_8 2042-2043        F34_8 2044-2045
        RF35_8 2046-2047        F35_8 2048-2052         RF41_8 2053-2054
        F41_8 2055-2056         RF42_8 2057-2058        F42_8 2059-2060
        RF43A_8 2061-2062       F43A1_8 2063-2065       F43A2_8 2066-2067
        F43A3_8 2068-2070       F43A4_8 2071-2072       RF43B_8 2073-2074
        F43B1_8 2075-2077       F43B2_8 2078-2079       F43B3_8 2080-2082
        F43B4_8 2083-2084       RF43C_8 2085-2086       F43C1_8 2087-2089
        F43C2_8 2090-2091       F43C3_8 2092-2094       F43C4_8 2095-2096
        RF43D_8 2097-2098       F43D1_8 2099-2101       F43D2_8 2102-2103
        F43D3_8 2104-2106       F43D4_8 2107-2108       RF44_8 2109-2110
        F44_8 2111-2112         RF45_8 2113-2114        F45_8 2115-2116
        RF46_8 2117-2118        F46_8 2119-2120         RF47_8 2121-2122
        F47_8 2123-2124         RF5_8 2125-2126         F5_8 2127-2128
        RF61_8 2129-2130        F61_8 2131-2132         RF610_8 2133-2134
        F610_8 2135-2136        RF62_8 2137-2138        F62_8 2139-2140
        RF63_8 2141-2142        F63_8 2143-2144         RF64_8 2145-2146
        F64A_8 2147-2148        F64B_8 2149-2150        F64C_8 2151-2152
        F64D_8 2153-2154        F64E_8 2155-2156        F64F_8 2157-2158
        F64G_8 2159-2160        F64H_8 2161-2162        F64I_8 2163-2164
        RF651A_8 2165-2166      F651A_8 2167-2171       RF651B_8 2172-2173
        F651B_8 2174-2178       RF652_8 2179-2180       F652_8 2181-2182
        RF66_8 2183-2184        F66_8 2185-2186         RF71_8 2187-2188
        F71_8 2189-2190         RF721_8 2191-2192       F721_8 2193-2195
        RF722_8 2196-2197       F722_8 2198-2200        RF73_8 2201-2202
        F73_8 2203-2205         RF74_8 2206-2207        F74_8 2208-2209
        RF81_8 2210-2211        F81_8 2212-2213         RF821_8 2214-2215
        F821_8 2216-2218        RF822_8 2219-2220       F822_8 2221-2223
        RF83_8 2224-2225        F83_8 2226-2228         RF84_8 2229-2230
        F84_8 2231-2232         RF85_8 2233-2234        F85_8 2235-2236
        RF86_8 2237-2238        F86_8 2239-2240         RF9_8 2241-2242
        F9_8 2243-2244          F9A_8 2245-2246         RF91_8 2247-2248
        F91_8 2249-2250         RF92A_8 2251-2252       F92A1_8 2253-2254
        F92A2_8 2255-2256       F92A3_8 2257-2258       F92A4_8 2259-2261
        F92A5_8 2262-2263       F92A6_8 2264-2265       RF92B_8 2266-2267
        F92B1_8 2268-2269       F92B2_8 2270-2271       F92B3_8 2272-2273
        F92B4_8 2274-2276       F92B5_8 2277-2278       F92B6_8 2279-2280
        RF92C_8 2281-2282       F92C1_8 2283-2284       F92C2_8 2285-2286
        F92C3_8 2287-2288       F92C4_8 2289-2291       F92C5_8 2292-2293
        F92C6_8 2294-2295       RF92D_8 2296-2297       F92D1_8 2298-2299
        F92D2_8 2300-2301       F92D3_8 2302-2303       F92D4_8 2304-2306
        F92D5_8 2307-2308       F92D6_8 2309-2310       RF92E_8 2311-2312
        F92E1_8 2313-2314       F92E2_8 2315-2316       F92E3_8 2317-2318
        F92E4_8 2319-2321       F92E5_8 2322-2323       F92E6_8 2324-2325
        RF92F_8 2326-2327       F92F1_8 2328-2329       F92F2_8 2330-2331
        F92F3_8 2332-2333       F92F4_8 2334-2336       F92F5_8 2337-2338
        F92F6_8 2339-2340       RF92G_8 2341-2342       F92G1_8 2343-2344
        F92G2_8 2345-2346       F92G3_8 2347-2348       F92G4_8 2349-2351
        F92G5_8 2352-2353       F92G6_8 2354-2355       RF92H_8 2356-2357
        F92H1_8 2358-2359       F92H2_8 2360-2361       F92H3_8 2362-2363
        F92H4_8 2364-2366       F92H5_8 2367-2368       F92H6_8 2369-2370
        RF92I_8 2371-2372       F92I1_8 2373-2374       F92I2_8 2375-2376
        F92I3_8 2377-2378       F92I4_8 2379-2381       F92I5_8 2382-2383
        F92I6_8 2384-2385       RF92J_8 2386-2387       F92J1_8 2388-2389
        F92J2_8 2390-2391       F92J3_8 2392-2393       F92J4_8 2394-2396
        F92J5_8 2397-2398       F92J6_8 2399-2400       JIGE_8 2401-2402
        RF10_8 2403-2404        F10_8 2405-2406         F10A_8 2407-2408
        RF101_8 2409-2410       F101_8 2411-2412        RF102_8 2413-2414
        F102_8 2415-2416        F103_8 2417-2418        RF103A_8 2419-2420
        F103A8_8 2421-2422      F103A1_8 2423-2424      F103A2_8 2425-2426
        F103A3_8 2427-2428      F103A4_8 2429-2430      F103A7_8 2431-2432
        F103A5_8 2433-2434      RF103B_8 2435-2436      F103B8_8 2437-2438
        F103B1_8 2439-2440      F103B2_8 2441-2442      F103B3_8 2443-2444
        F103B4_8 2445-2446      F103B7_8 2447-2448      F103B5_8 2449-2450
        RF103C_8 2451-2452      F103C8_8 2453-2454      F103C1_8 2455-2456
        F103C2_8 2457-2458      F103C3_8 2459-2460      F103C4_8 2461-2462
        F103C7_8 2463-2464      F103C5_8 2465-2466      RF103D_8 2467-2468
        F103D8_8 2469-2470      F103D1_8 2471-2472      F103D2_8 2473-2474
        F103D3_8 2475-2476      F103D4_8 2477-2478      F103D7_8 2479-2480
        F103D5_8 2481-2482      RF103E_8 2483-2484      F103E8_8 2485-2486
        F103E1_8 2487-2488      F103E2_8 2489-2490      F103E3_8 2491-2492
        F103E4_8 2493-2494      F103E7_8 2495-2496      F103E5_8 2497-2498
        RF103F_8 2499-2500      F103F8_8 2501-2502      F103F1_8 2503-2504
        F103F2_8 2505-2506      F103F3_8 2507-2508      F103F4_8 2509-2510
        F103F7_8 2511-2512      F103F5_8 2513-2514      RF103G_8 2515-2516
        F103G8_8 2517-2518      F103G1_8 2519-2520      F103G2_8 2521-2522
        F103G3_8 2523-2524      F103G4_8 2525-2526      F103G7_8 2527-2528
        F103G5_8 2529-2530      RF103H_8 2531-2532      F103H8_8 2533-2534
        F103H1_8 2535-2536      F103H2_8 2537-2538      F103H3_8 2539-2540
        F103H4_8 2541-2542      F103H7_8 2543-2544      F103H5_8 2545-2546
        RF103I_8 2547-2548      F103I8_8 2549-2550      F103I1_8 2551-2552
        F103I2_8 2553-2554      F103I3_8 2555-2556      F103I4_8 2557-2558
        F103I7_8 2559-2560      F103I5_8 2561-2562      RF103J_8 2563-2564
        F103J8_8 2565-2566      F103J1_8 2567-2568      F103J2_8 2569-2570
        F103J3_8 2571-2572      F103J4_8 2573-2574      F103J7_8 2575-2576
        F103J5_8 2577-2578      RF103K_8 2579-2580      F103K8_8 2581-2582
        F103K1_8 2583-2584      F103K2_8 2585-2586      F103K3_8 2587-2588
        F103K4_8 2589-2590      F103K7_8 2591-2592      F103K5_8 2593-2594
        RF103L_8 2595-2596      F103L8_8 2597-2598      F103L1_8 2599-2600
        F103L2_8 2601-2602      F103L3_8 2603-2604      F103L4_8 2605-2606
        F103L7_8 2607-2608      F103L5_8 2609-2610      RF103M_8 2611-2612
        F103M8_8 2613-2614      F103M1_8 2615-2616      F103M2_8 2617-2618
        F103M3_8 2619-2620      F103M4_8 2621-2622      F103M7_8 2623-2624
        F103M5_8 2625-2626      RF111_8 2627-2628       F111A_8 2629-2630
        F111B_8 2631-2632       F111C_8 2633-2634       RF112_8 2635-2636
        F112A_8 2637-2638       F112B_8 2639-2640       F112C_8 2641-2642
        RF113_8 2643-2644       F113A_8 2645-2646       F113B_8 2647-2648
        F113C_8 2649-2650       RF12_8 2651-2652        F12A_8 2653-2657
        F12B_8 2658-2662        F12C_8 2663-2667        RF13_8 2668-2669
        F13A_8 2670-2674        F13B_8 2675-2679        F13C_8 2680-2684
        RF14_8 2685-2686        F141_8 2687-2688        F142_8 2689-2690
        F143_8 2691-2692        F144_8 2693-2694        F145_8 2695-2696
        F146_8 2697-2698        F147_8 2699-2700        F148_8 2701-2702
        F149_8 2703-2704        RF15_8 2705-2706        F151_8 2707-2708
        F152_8 2709-2710        F153_8 2711-2712        F154_8 2713-2714
        F155_8 2715-2716        F156_8 2717-2718        F157_8 2719-2720
        F158_8 2721-2722        F159_8 2723-2724        F16_8 2725-2726
        G01_8 2727-2728         RG02_8 2729-2730        G02_8 2731-2732
        G1_8 2733-2734          RG21_8 2735-2736        G21_8 2737-2738
        RG22_8 2739-2740        G22_8 2741-2742         RG3_8 2743-2744
        G3_8 2745-2746          RG4_8 2747-2748         G4_8 2749-2750
        RG51_8 2751-2752        G511_8 2753-2755        G512_8 2756-2758
        RG52_8 2759-2760        G521_8 2761-2763        G522_8 2764-2766
        G71_8 2767-2769         G72_8 2770-2772         G81_8 2773-2774
        G82_8 2775-2776         G83_8 2777-2778         G9_8 2779-2780
        RG101_8 2781-2782       G101_8 2783-2785        RG102_8 2786-2787
        G1021_8 2788-2790       G122_8 2791-2793        G123_8 2794-2796
        G11_8 2797-2798         G12_8 2799-2800         G130_8 2801-2802
        RG13_8 2803-2804        G131_8 2805-2806        G132_8 2807-2808
        RG14A_8 2809-2810       G14A1_8 2811-2812       G14A2_8 2813-2815
        RG14B_8 2816-2817       G14B1_8 2818-2819       G14B2_8 2820-2822
        RG14C_8 2823-2824       G14C1_8 2825-2826       G14C2_8 2827-2829
        RG15A_8 2830-2831       G15A1_8 2832-2833       G15A2_8 2834-2835
        G15A3_8 2836-2837       RG15B_8 2838-2839       G15B1_8 2840-2841
        G15B2_8 2842-2843       G15B3_8 2844-2845       RG15C_8 2846-2847
        G15C1_8 2848-2849       G15C2_8 2850-2851       G15C3_8 2852-2853
        RG15D_8 2854-2855       G15D1_8 2856-2857       G15D2_8 2858-2859
        G15D3_8 2860-2861       RG15E_8 2862-2863       G15E1_8 2864-2865
        G15E2_8 2866-2867       G15E3_8 2868-2869       RG15F_8 2870-2871
        G15F1_8 2872-2873       G15F2_8 2874-2875       G15F3_8 2876-2877
        RG15G_8 2878-2879       G15G1_8 2880-2881       G15G2_8 2882-2883
        G15G3_8 2884-2885       RG15H_8 2886-2887       G15H1_8 2888-2889
        G15H2_8 2890-2891       G15H3_8 2892-2893       RG15I_8 2894-2895
        G15I1_8 2896-2897       G15I2_8 2898-2899       G15I3_8 2900-2901
        RG15J_8 2902-2903       G15J1_8 2904-2905       G15J2_8 2906-2907
        G15J3_8 2908-2909       RG15K_8 2910-2911       G15K1_8 2912-2913
        G15K2_8 2914-2915       G15K3_8 2916-2917       RG15L_8 2918-2919
        G15L1_8 2920-2921       G15L2_8 2922-2923       G15L3_8 2924-2925
        RG15M_8 2926-2927       G15M1_8 2928-2929       G15M2_8 2930-2931
        G15M3_8 2932-2933       RG15N_8 2934-2935       G15N1_8 2936-2937
        G15N2_8 2938-2939       G15N3_8 2940-2941       RG15O_8 2942-2943
        G15O1_8 2944-2945       G15O2_8 2946-2947       G15O3_8 2948-2949
        RG15P_8 2950-2951       G15P1_8 2952-2953       G15P2_8 2954-2955
        G15P3_8 2956-2957       RG15Q_8 2958-2959       G15Q1_8 2960-2961
        G15Q2_8 2962-2963       G15Q3_8 2964-2965       RG15R_8 2966-2967
        G15R1_8 2968-2969       G15R2_8 2970-2971       G15R3_8 2972-2973
        RG15S_8 2974-2975       G15S1_8 2976-2977       G15S2_8 2978-2979
        G15S3_8 2980-2981       RG15T_8 2982-2983       G15T1_8 2984-2985
        G15T2_8 2986-2987       G15T3_8 2988-2989       RG15U_8 2990-2991
        G15U1_8 2992-2993       G15U2_8 2994-2995       G15U3_8 2996-2997
        RG15V_8 2998-2999       G15V1_8 3000-3001       G15V2_8 3002-3003
        G15V3_8 3004-3005       H1_8 3006-3007          H21_8 3008-3009
        H22_8 3010-3011         H3_8 3012-3013          H6_8 3014-3015
        H7_8 3016-3017          H71_8 3018-3019         D8VYEAR 3020-3023
        D8VMONTH 3024-3025      D8VDAY 3026-3027        D8RESID 3028-3029
        D8SEX 3030-3031         D8MARRY 3032-3033       D8LIVARR 3034-3035
        D8PERSON 3036-3037      D8GENER 3038-3039       D8DPLACE 3040-3041
        D8CARGIV 3042-3043      D8PCGDAY 3044-3045      D8BEDRID 3046-3047
        D8BEDDAY 3048-3051      D8ILL 3052-3053         D8DISEA1 3054-3055
        D8DIDAY1 3056-3059      D8DISEA2 3060-3061      D8DIDAY2 3062-3065
        D8DISEA3 3066-3067      D8DIDAY3 3068-3071      D8HYPERT 3072-3073
        D8DIABET 3074-3075      D8HEART 3076-3077       D8CVD 3078-3079
        D8PNEUM 3080-3081       D8TUBERC 3082-3083      D8CANCER 3084-3085
        D8GLAUCO 3086-3087      D8PROSTA 3088-3089      D8GYNECO 3090-3091
        D8GASTRI 3092-3093      D8PARKIN 3094-3095      D8BEDSOR 3096-3097
        D8DEMENT 3098-3099      D8PSYCHO 3100-3101      D8NEUROS 3102-3103
        D8ARTHRI 3104-3105      D8OTHERS 3106-3107      D8MEDICA 3108-3109
        D8FINANC 3110-3111      D8INCOME 3112-3116      D8WCFACI 3117-3118
        D8TAPWAT 3119-3120      D8BATHFA 3121-3122      D8HEATER 3123-3124
        D8TVSET 3125-3126       D8WASHMA 3127-3128      D8PHONE 3129-3130
        D8DOCTOR 3131-3132      D8LICDOC 3133-3134      D8WHOPAY 3135-3136
        D8MEDCOS 3137-3141      D8POCKET 3142-3146      D8BATHFU 3147-3148
        D8BATDAY 3149-3152      D8DRESFU 3153-3154      D8DREDAY 3155-3158
        D8TOILFU 3159-3160      D8TOIDAY 3161-3164      D8MOVEFU 3165-3166
        D8MOVDAY 3167-3170      D8CONTFU 3171-3172      D8CONDAY 3173-3176
        D8FEEDFU 3177-3178      D8FEEDAY 3179-3182      D8FULLDA 3183-3186
        D8CARCST 3187-3191      D8DIRCST 3192-3196      D8CARPAY 3197-3198
        D8OUTDOR 3199-3202      D8ACTDAY 3203-3206      D8SMOKE 3207-3208
        D8SMKTIM 3209-3210      D8DRINK 3211-3212       D8KNDDRK 3213-3214
        D8DRKMCH 3215-3216      D8ADVDIR 3217-3218      D8DIRDAY 3219-3222
        D8DREAM 3223-3224       D8PAIN 3225-3226        D8UNCONS 3227-3228
        D8UNCDAY 3229-3232      DTH08_11 3233-3234      YEARIN_11 3235-3238
        MONTHIN_11 3239-3240    DAYIN_11 3241-3242      RESIC_11 3243-3244
        VAGE_11 3245-3247       RA51_11 3248-3249       A51_11 3250-3251
        RA52_11 3252-3253       A52_11 3254-3255        RA53A_11 3256-3257
        A53A1_11 3258-3259      A53A3_11 3260-3261      A53A2_11 3262-3264
        A53A4_11 3265-3266      A53A5_11 3267-3268      RA53B_11 3269-3270
        A53B1_11 3271-3272      A53B3_11 3273-3274      A53B2_11 3275-3277
        A53B4_11 3278-3279      A53B5_11 3280-3281      RA53C_11 3282-3283
        A53C1_11 3284-3285      A53C3_11 3286-3287      A53C2_11 3288-3290
        A53C4_11 3291-3292      A53C5_11 3293-3294      RA53D_11 3295-3296
        A53D1_11 3297-3298      A53D3_11 3299-3300      A53D2_11 3301-3303
        A53D4_11 3304-3305      A53D5_11 3306-3307      RA53E_11 3308-3309
        A53E1_11 3310-3311      A53E3_11 3312-3313      A53E2_11 3314-3316
        A53E4_11 3317-3318      A53E5_11 3319-3320      RA53F_11 3321-3322
        A53F1_11 3323-3324      A53F3_11 3325-3326      A53F2_11 3327-3329
        A53F4_11 3330-3331      A53F5_11 3332-3333      RA53G_11 3334-3335
        A53G1_11 3336-3337      A53G3_11 3338-3339      A53G2_11 3340-3342
        A53G4_11 3343-3344      A53G5_11 3345-3346      RA53H_11 3347-3348
        A53H1_11 3349-3350      A53H3_11 3351-3352      A53H2_11 3353-3355
        A53H4_11 3356-3357      A53H5_11 3358-3359      RA53I_11 3360-3361
        A53I1_11 3362-3363      A53I3_11 3364-3365      A53I2_11 3366-3368
        A53I4_11 3369-3370      A53I5_11 3371-3372      RA53J_11 3373-3374
        A53J1_11 3375-3376      A53J11_11 $3377         A53J3_11 3378-3379
        A53J2_11 3380-3382      A53J4_11 3383-3384      A53J5_11 3385-3386
        RA530_11 3387-3388      A530_11 3389-3390       RA531_11 3391-3392
        A531_11 3393-3394       RA532_11 3395-3396      A532_11 3397-3398
        RA533_11 3399-3400      A533_11 3401-3402       A533A_11 $3403
        RA534_11 3404-3405      A534_11 3406-3409       RA535_11 3410-3411
        A535_11 3412-3413       RA536_11 3414-3415      A536_11 3416-3417
        RA537_11 3418-3419      A537_11 3420-3421       RA540_11 3422-3423
        A540_11 3424-3425       RA541_11 3426-3427      A541_11 3428-3431
        RA542_11 3432-3433      A542_11 3434-3435       A542A_11 $3436
        RA54_11 3437-3438       A54A_11 3439-3442       A54B_11 3443-3444
        B11_11 3445-3446        B12_11 3447-3448        B121_11 3449-3450
        B21_11 3451-3452        B22_11 3453-3454        B23_11 3455-3456
        B24_11 3457-3458        B25_11 3459-3460        B26_11 3461-3462
        B27_11 3463-3464        B28_11 3465-3466        B29_11 3467-3468
        B210_11 3469-3470       C11_11 3471-3472        C12_11 3473-3474
        C13_11 3475-3476        C14_11 3477-3478        C15_11 3479-3480
        C16_11 3481-3482        C21A_11 3483-3484       C21B_11 3485-3486
        C21C_11 3487-3488       C22_11 3489-3490        C31A_11 3491-3492
        C31B_11 3493-3494       C31C_11 3495-3496       C31D_11 3497-3498
        C31E_11 3499-3500       C32_11 3501-3502        C41A_11 3503-3504
        C41B_11 3505-3506       C41C_11 3507-3508       C51A_11 3509-3510
        C51B_11 3511-3512       C52_11 3513-3514        C52X1_11 3515-3516
        C52X2_11 3517-3518      C53A_11 3519-3520       C53B_11 3521-3522
        C53C_11 3523-3524       C54_11 3525-3526        C55_11 3527-3528
        RD1_11 3529-3530        D1_11 3531-3532         RD2_11 3533-3534
        D2_11 3535-3536         RD31_11 3537-3538       D31_11 3539-3540
        RD32_11 3541-3542       D32_11 3543-3544        RD33_11 3545-3546
        D33_11 3547-3548        D33A_11 $3549           RD34_11 3550-3551
        D34_11 3552-3553        RD4MEAT_11 3554-3555    D4MEAT2_11 3556-3557
        D4MEAT1_11 3558-3559    RD4FISH_11 3560-3561    D4FISH2_11 3562-3563
        D4FISH1_11 3564-3565    RD4EGG_11 3566-3567     D4EGG2_11 3568-3569
        D4EGG1_11 3570-3571     RD4BEAN_11 3572-3573    D4BEAN2_11 3574-3575
        D4BEAN1_11 3576-3577    RD4VEG_11 3578-3579     D4VEG2_11 3580-3581
        D4VEG1_11 3582-3583     RD4SUGA_11 3584-3585    D4SUGA2_11 3586-3587
        D4SUGA1_11 3588-3589    RD4TEA_11 3590-3591     D4TEA2_11 3592-3593
        D4TEA1_11 3594-3595     RD4GARL_11 3596-3597    D4GARL2_11 3598-3599
        D4GARL1_11 3600-3601    RDEMILK_11 3602-3603    D4MILK1_11 3604-3605
        D4MILK2_11 3606-3607    RD4NUT_11 3608-3609     D4NUT1_11 3610-3611
        D4NUT2_11 3612-3613     RD4ALGA_11 3614-3615    D4ALGA1_11 3616-3617
        D4ALGA2_11 3618-3619    RD4VIT_11 3620-3621     D4VIT1_11 3622-3623
        D4VIT2_11 3624-3625     RD4DRUG_11 3626-3627    D4DRUG1_11 3628-3629
        D4DRUG2_11 3630-3631    RD5_11 3632-3633        D5_11 3634-3635
        RD6_11 3636-3637        D6A_11 3638-3639        D6B_11 3640-3641
        D6C_11 3642-3643        RD71_11 3644-3645       D71_11 3646-3647
        RD72_11 3648-3649       D72_11 3650-3651        RD73_11 3652-3653
        D73_11 3654-3656        RD74_11 3657-3658       D74_11 3659-3661
        RD75_11 3662-3663       D75_11 3664-3665        RD76_11 3666-3667
        D76_11 3668-3669        RD77_11 3670-3671       D77_11 3672-3673
        RD78_11 3674-3675       D78_11 3676-3677        D78A_11 3678-3679
        D78B_11 3680-3681       RD79_11 3682-3683       D79_11 3684-3685
        D79A_11 3686-3687       D79B_11 3688-3689       RD710_11 3690-3691
        D710_11 3692-3693       D710A_11 3694-3695      D710B_11 3696-3697
        RD81_11 3698-3699       D81_11 3700-3701        RD82_11 3702-3703
        D82_11 3704-3705        RD83_11 3706-3707       D83_11 3708-3710
        RD84_11 3711-3712       D84_11 3713-3715        RD85_11 3716-3717
        D85_11 3718-3719        RD86_11 3720-3721       D86_11 3722-3723
        RD87_11 3724-3725       D87_11 3726-3727        RD91_11 3728-3729
        D91_11 3730-3731        RD92_11 3732-3733       D92_11 3734-3735
        RD93_11 3736-3737       D93_11 3738-3740        RD94_11 3741-3742
        D94_11 3743-3745        RD101_11 3746-3747      D101_11 3748-3749
        RD102_11 3750-3751      D102_11 3752-3754       RD103_11 3755-3756
        D103_11 3757-3759       RD11A_11 3760-3761      D11A_11 3762-3763
        RD11B_11 3764-3765      D11B_11 3766-3767       RD11C_11 3768-3769
        D11C_11 3770-3771       RD11D_11 3772-3773      D11D_11 3774-3775
        RD11E_11 3776-3777      D11E_11 3778-3779       RD11F_11 3780-3781
        D11F_11 3782-3783       RD11G_11 3784-3785      D11G_11 3786-3787
        RD11H_11 3788-3789      D11H_11 3790-3791       RD12_11 3792-3793
        D12_11 3794-3795        RE0_11 3796-3797        E0_11 3798-3799
        RE1_11 3800-3801        E1_11 3802-3803         RE1B_11 3804-3805
        E1B_11 3806-3809        RE2_11 3810-3811        E2_11 3812-3813
        RE2B_11 3814-3815       E2B_11 3816-3819        RE3_11 3820-3821
        E3_11 3822-3823         RE3B_11 3824-3825       E3B_11 3826-3829
        RE4_11 3830-3831        E4_11 3832-3833         RE4B_11 3834-3835
        E4B_11 3836-3839        RE5_11 3840-3841        E5_11 3842-3843
        RE5B_11 3844-3845       E5B_11 3846-3849        RE6_11 3850-3851
        E6_11 3852-3853         RE6B_11 3854-3855       E6B_11 3856-3859
        RE610_11 3860-3861      E610_11 3862-3863       RE62_11 3864-3865
        E62_11 3866-3867        RE63_11 3868-3869       E63_11 3870-3874
        RE64_11 3875-3876       E64_11 3877-3878        E64A_11 $3879
        RE65_11 3880-3881       E65_11 3882-3883        RE67_11 3884-3885
        E67_11 3886-3888        RE7_11 3889-3890        E7_11 3891-3892
        RE8_11 3893-3894        E8_11 3895-3896         RE9_11 3897-3898
        E9_11 3899-3900         RE10_11 3901-3902       E10_11 3903-3904
        RE11_11 3905-3906       E11_11 3907-3908        RE12_11 3909-3910
        E12_11 3911-3912        RE13_11 3913-3914       E13_11 3915-3916
        RE14_11 3917-3918       E14_11 3919-3920        RF21_11 3921-3922
        F21_11 3923-3924        RF211_11 3925-3926      F211_11 3927-3928
        RF22_11 3929-3930       F22_11 3931-3934        RF221_11 3935-3936
        F221_11 3937-3941       RF23_11 3942-3943       F23_11 3944-3945
        RF24_11 3946-3947       F24_11 3948-3949        RF25_11 3950-3951
        F251_11 3952-3956       F252_11 3957-3961       RF25B_11 3962-3963
        F25B1_11 3964-3967      F25B2_11 3968-3969      RF26_11 3970-3971
        F26_11 3972-3975        RF27_11 3976-3977       F27_11 3978-3979
        RF31_11 3980-3981       F31_11 3982-3983        RF32_11 3984-3985
        F32A_11 3986-3987       F32B_11 3988-3989       F32C_11 3990-3991
        F32D_11 3992-3993       F32E_11 3994-3995       RF33_11 3996-3997
        F33_11 3998-3999        RF340_11 4000-4001      F340_11 4002-4003
        RF34_11 4004-4005       F34_11 4006-4007        RF35_11 4008-4009
        F35_11 4010-4014        RF41_11 4015-4016       F41_11 4017-4018
        RF41A_11 4019-4020      F41A1_11 4021-4022      F41A11_11 4023-4026
        F41A12_11 4027-4028     F41A2_11 4029-4030      F41A21_11 4031-4034
        F41A22_11 4035-4036     F41A3_11 4037-4038      F41A31_11 4039-4042
        F41A32_11 4043-4044     RF41B_11 4045-4046      F41B_11 4047-4048
        F41B1_11 4049-4052      F41B2_11 4053-4054      RF42_11 4055-4056
        F42_11 4057-4058        RF43A_11 4059-4060      F43A1_11 4061-4063
        F43A2_11 4064-4065      F43A3_11 4066-4068      F43A4_11 4069-4070
        RF43B_11 4071-4072      F43B1_11 4073-4075      F43B2_11 4076-4077
        F43B3_11 4078-4080      F43B4_11 4081-4082      RF43C_11 4083-4084
        F43C1_11 4085-4087      F43C2_11 4088-4089      F43C3_11 4090-4092
        F43C4_11 4093-4094      RF43D_11 4095-4096      F43D1_11 4097-4099
        F43D2_11 4100-4101      F43D3_11 4102-4104      F43D4_11 4105-4106
        RF44_11 4107-4108       F44_11 4109-4110        RF45_11 4111-4112
        F45_11 4113-4114        RF46_11 4115-4116       F46_11 4117-4118
        RF47_11 4119-4120       F47_11 4121-4122        RF5_11 4123-4124
        F5_11 4125-4126         RF61_11 4127-4128       F61_11 4129-4130
        RF610_11 4131-4132      F610_11 4133-4134       RF62_11 4135-4136
        F62_11 4137-4138        RF63_11 4139-4140       F63_11 4141-4142
        RF64_11 4143-4144       F64A_11 4145-4146       F64B_11 4147-4148
        F64C_11 4149-4150       F64D_11 4151-4152       F64E1_11 4153-4154
        F64F1_11 4155-4156      F64G1_11 4157-4158      F64H1_11 4159-4160
        F64I_11 4161-4162       RF651A1_11 4163-4164    F651A1_11 4165-4169
        RF651B1_11 4170-4171    F651B1_11 4172-4176     RF651A2_11 4177-4178
        F651A2_11 4179-4183     RF651B2_11 4184-4185    F651B2_11 4186-4190
        RF6521_11 4191-4192     F6521_11 4193-4194      RF652A_11 4195-4196
        F652A_11 4197-4211 .12  RF652B_11 4212-4213     F652B_11 4214-4215
        RF66_11 4216-4217       F66_11 4218-4219        RF71_11 4220-4221
        F71_11 4222-4223        RF721_11 4224-4225      F721_11 4226-4228
        RF722_11 4229-4230      F722_11 4231-4233       F722A_11 4234-4235
        RF73_11 4236-4237       F73_11 4238-4240        RF74_11 4241-4242
        F74_11 4243-4244        RF81_11 4245-4246       F81_11 4247-4248
        RF821_11 4249-4250      F821_11 4251-4253       RF822_11 4254-4255
        F822_11 4256-4258       F822A_11 4259-4260      RF83_11 4261-4262
        F83_11 4263-4265        RF84_11 4266-4267       F84_11 4268-4269
        RF85_11 4270-4271       F85_11 4272-4273        RF86_11 4274-4275
        F86_11 4276-4277        RF9_11 4278-4279        F9_11 4280-4281
        F9A_11 4282-4283        RF901_11 4284-4285      F901_11 4286-4287
        RF901A_11 4288-4289     F901A_11 4290-4291      F901B1_11 4292-4294
        F901B2_11 4295-4297     F901B3_11 4298-4300     RF902_11 4301-4302
        F902_11 4303-4304       RF902A_11 4305-4306     F902A_11 4307-4308
        F902B1_11 4309-4311     F902B2_11 4312-4314     F902B3_11 4315-4317
        RF91_11 4318-4319       F91_11 4320-4321        RF92A_11 4322-4323
        F92A1_11 4324-4325      F92A2_11 4326-4327      F92A3_11 4328-4329
        F92A4_11 4330-4332      F92A5_11 4333-4334      F92A6_11 4335-4336
        F92A7_11 4337-4338      RF92B_11 4339-4340      F92B1_11 4341-4342
        F92B2_11 4343-4344      F92B3_11 4345-4346      F92B4_11 4347-4349
        F92B5_11 4350-4351      F92B6_11 4352-4353      F92B7_11 4354-4355
        RF92C_11 4356-4357      F92C1_11 4358-4359      F92C2_11 4360-4361
        F92C3_11 4362-4363      F92C4_11 4364-4366      F92C5_11 4367-4368
        F92C6_11 4369-4370      F92C7_11 4371-4372      RF92D_11 4373-4374
        F92D1_11 4375-4376      F92D2_11 4377-4378      F92D3_11 4379-4380
        F92D4_11 4381-4383      F92D5_11 4384-4385      F92D6_11 4386-4387
        F92D7_11 4388-4389      RF92E_11 4390-4391      F92E1_11 4392-4393
        F92E2_11 4394-4395      F92E3_11 4396-4397      F92E4_11 4398-4400
        F92E5_11 4401-4402      F92E6_11 4403-4404      F92E7_11 4405-4406
        RF92F_11 4407-4408      F92F1_11 4409-4410      F92F2_11 4411-4412
        F92F3_11 4413-4414      F92F4_11 4415-4417      F92F5_11 4418-4419
        F92F6_11 4420-4421      F92F7_11 4422-4423      RF92G_11 4424-4425
        F92G1_11 4426-4427      F92G2_11 4428-4429      F92G3_11 4430-4431
        F92G4_11 4432-4434      F92G5_11 4435-4436      F92G6_11 4437-4438
        F92G7_11 4439-4440      RF92H_11 4441-4442      F92H1_11 4443-4444
        F92H2_11 4445-4446      F92H3_11 4447-4448      F92H4_11 4449-4451
        F92H5_11 4452-4453      F92H6_11 4454-4455      F92H7_11 4456-4457
        RF92I_11 4458-4459      F92I1_11 4460-4461      F92I2_11 4462-4463
        F92I3_11 4464-4465      F92I4_11 4466-4468      F92I5_11 4469-4470
        F92I6_11 4471-4472      F92I7_11 4473-4474      RF92J_11 4475-4476
        F92J1_11 4477-4478      F92J2_11 4479-4480      F92J3_11 4481-4482
        F92J4_11 4483-4485      F92J5_11 4486-4487      F92J6_11 4488-4489
        F92J7_11 4490-4491      JIGE_11 4492-4493       RF10_11 4494-4495
        F10_11 4496-4497        F10A_11 4498-4499       RF101_11 4500-4501
        F101_11 4502-4503       RF102_11 4504-4505      F102_11 4506-4507
        F103_11 4508-4509       RF1030_11 4510-4511     F1030_11 4512-4513
        RF1030A_11 4514-4515    F1030A_11 4516-4517     F1030B1_11 4518-4520
        F1030B2_11 4521-4523    F1030B3_11 4524-4526    RF1031_11 4527-4528
        F1031_11 4529-4530      RF1031A_11 4531-4532    F1031A_11 4533-4534
        F1031B1_11 4535-4537    F1031B2_11 4538-4540    F1031B3_11 4541-4543
        RF103A_11 4544-4545     F103A8_11 4546-4547     F103A1_11 4548-4549
        F103A2_11 4550-4551     F103A3_11 4552-4553     F103A4_11 4554-4555
        F103A7_11 4556-4557     F103A5_11 4558-4559     RF103B_11 4560-4561
        F103B8_11 4562-4563     F103B1_11 4564-4565     F103B2_11 4566-4567
        F103B3_11 4568-4569     F103B4_11 4570-4571     F103B7_11 4572-4573
        F103B5_11 4574-4575     RF103C_11 4576-4577     F103C8_11 4578-4579
        F103C1_11 4580-4581     F103C2_11 4582-4583     F103C3_11 4584-4585
        F103C4_11 4586-4587     F103C7_11 4588-4589     F103C5_11 4590-4591
        RF103D_11 4592-4593     F103D8_11 4594-4595     F103D1_11 4596-4597
        F103D2_11 4598-4599     F103D3_11 4600-4601     F103D4_11 4602-4603
        F103D7_11 4604-4605     F103D5_11 4606-4607     RF103E_11 4608-4609
        F103E8_11 4610-4611     F103E1_11 4612-4613     F103E2_11 4614-4615
        F103E3_11 4616-4617     F103E4_11 4618-4619     F103E7_11 4620-4621
        F103E5_11 4622-4623     RF103F_11 4624-4625     F103F8_11 4626-4627
        F103F1_11 4628-4629     F103F2_11 4630-4631     F103F3_11 4632-4633
        F103F4_11 4634-4635     F103F7_11 4636-4637     F103F5_11 4638-4639
        RF103G_11 4640-4641     F103G8_11 4642-4643     F103G1_11 4644-4645
        F103G2_11 4646-4647     F103G3_11 4648-4649     F103G4_11 4650-4651
        F103G7_11 4652-4653     F103G5_11 4654-4655     RF103H_11 4656-4657
        F103H8_11 4658-4659     F103H1_11 4660-4661     F103H2_11 4662-4663
        F103H3_11 4664-4665     F103H4_11 4666-4667     F103H7_11 4668-4669
        F103H5_11 4670-4671     RF103I_11 4672-4673     F103I8_11 4674-4675
        F103I1_11 4676-4677     F103I2_11 4678-4679     F103I3_11 4680-4681
        F103I4_11 4682-4683     F103I7_11 4684-4685     F103I5_11 4686-4687
        RF103J_11 4688-4689     F103J8_11 4690-4691     F103J1_11 4692-4693
        F103J2_11 4694-4695     F103J3_11 4696-4697     F103J4_11 4698-4699
        F103J7_11 4700-4701     F103J5_11 4702-4703     RF103K_11 4704-4705
        F103K8_11 4706-4707     F103K1_11 4708-4709     F103K2_11 4710-4711
        F103K3_11 4712-4713     F103K4_11 4714-4715     F103K7_11 4716-4717
        F103K5_11 4718-4719     RF103L_11 4720-4721     F103L8_11 4722-4723
        F103L1_11 4724-4725     F103L2_11 4726-4727     F103L3_11 4728-4729
        F103L4_11 4730-4731     F103L7_11 4732-4733     F103L5_11 4734-4735
        RF103M_11 4736-4737     F103M8_11 4738-4739     F103M1_11 4740-4741
        F103M2_11 4742-4743     F103M3_11 4744-4745     F103M4_11 4746-4747
        F103M7_11 4748-4749     F103M5_11 4750-4751     RF1032_11 4752-4753
        F1032_11 4754-4755      RF1033_11 4756-4757     F1033_11 4758-4759
        F111A_11 4760-4761      F111B_11 4762-4763      F111C_11 4764-4765
        F112A_11 4766-4767      F112B_11 4768-4769      F112C_11 4770-4771
        F113A_11 4772-4773      F113B_11 4774-4775      F113C_11 4776-4777
        RF12_11 4778-4779       F12A_11 4780-4784       F12B_11 4785-4789
        F12C_11 4790-4794       RF13_11 4795-4796       F13A_11 4797-4801
        F13B_11 4802-4806       F13C_11 4807-4811       RF14_11 4812-4813
        F141_11 4814-4815       F142_11 4816-4817       F143_11 4818-4819
        F144_11 4820-4821       F145_11 4822-4823       F146_11 4824-4825
        F147_11 4826-4827       F148_11 4828-4829       F149_11 4830-4831
        F14T_11 $4832           RF15_11 4833-4834       F151_11 4835-4836
        F152_11 4837-4838       F153_11 4839-4840       F154_11 4841-4842
        F155_11 4843-4844       F156_11 4845-4846       F157_11 4847-4848
        F158_11 4849-4850       F159_11 4851-4852       F15T_11 $4853
        F16_11 4854-4855        RG01_11 4856-4857       G01_11 4858-4859
        RG02_11 4860-4861       G02_11 4862-4876 .12    RG1_11 4877-4878
        G1_11 4879-4880         G1A_11 $4881            RG21_11 4882-4883
        G21_11 4884-4885        RG22_11 4886-4887       G22_11 4888-4889
        RG23_11 4890-4891       G23_11 4892-4893        RG24_11 4894-4895
        G24_11 4896-4897        RG24A_11 4898-4899      G24A_11 4900-4901
        RG25_11 4902-4903       G25_11 4904-4905        RG25A_11 4906-4907
        G25A_11 4908-4909       RG3_11 4910-4911        G3_11 4912-4913
        RG4_11 4914-4915        G4_11 4916-4917         RG4A_11 4918-4919
        G4A_11 4920-4921        RG4B_11 4922-4923       G4B_11 4924-4925
        RG5_11 4926-4927        G511_11 4928-4930       G512_11 4931-4933
        G521_11 4934-4936       G522_11 4937-4939       G6_11 4940-4941
        G7_11 4942-4944         G81_11 4945-4946        G82_11 4947-4948
        G83_11 4949-4950        G9_11 4951-4952         G101_11 4953-4955
        G1011_11 4956-4957      G102_11 4958-4959       G1021_11 4960-4962
        G122_11 4963-4965       G123_11 4966-4968       G102B_11 4969-4971
        G102C_11 4972-4974      RG106_11 4975-4976      G106_11 4977-4978
        RG1061_11 4979-4980     G1061_11 4981-4982      RG1062_11 4983-4984
        G1062_11 4985-4986      RG1063_11 4987-4988     G1063_11 4989-4990
        G11_11 4991-4992        G12_11 4993-4994        RG130_11 4995-4996
        G130_11 4997-4998       RG13_11 4999-5000       G131_11 5001-5002
        G132_11 5003-5004       RG14A_11 5005-5006      G14A1_11 5007-5008
        G14A2_11 5009-5011      RG14B_11 5012-5013      G14B1_11 5014-5015
        G14B2_11 5016-5018      RG14C_11 5019-5020      G14C1_11 5021-5022
        G14C2_11 5023-5025      G15A1_11 5026-5027      G15A2_11 5028-5029
        G15A3_11 5030-5031      G15B1_11 5032-5033      G15B2_11 5034-5035
        G15B3_11 5036-5037      G15C1_11 5038-5039      G15C2_11 5040-5041
        G15C3_11 5042-5043      G15D1_11 5044-5045      G15D2_11 5046-5047
        G15D3_11 5048-5049      G15E1_11 5050-5051      G15E2_11 5052-5053
        G15E3_11 5054-5055      G15F1_11 5056-5057      G15F2_11 5058-5059
        G15F3_11 5060-5061      G15G1_11 5062-5063      G15G2_11 5064-5065
        G15G3_11 5066-5067      G15H1_11 5068-5069      G15H2_11 5070-5071
        G15H3_11 5072-5073      G15I1_11 5074-5075      G15I2_11 5076-5077
        G15I3_11 5078-5079      G15J1_11 5080-5081      G15J2_11 5082-5083
        G15J3_11 5084-5085      G15K1_11 5086-5087      G15K2_11 5088-5089
        G15K3_11 5090-5091      G15L1_11 5092-5093      G15L2_11 5094-5095
        G15L3_11 5096-5097      G15M1_11 5098-5099      G15M2_11 5100-5101
        G15M3_11 5102-5103      G15N1_11 5104-5105      G15N2_11 5106-5107
        G15N3_11 5108-5109      G15O1_11 5110-5111      G15O2_11 5112-5113
        G15O3_11 5114-5115      G15P1_11 5116-5117      G15P2_11 5118-5119
        G15P3_11 5120-5121      G15Q1_11 5122-5123      G15Q2_11 5124-5125
        G15Q3_11 5126-5127      G15R1_11 5128-5129      G15R2_11 5130-5131
        G15R3_11 5132-5133      G15N1A_11 5134-5135     G15N2A_11 5136-5137
        G15N3A_11 5138-5139     G15S1_11 5140-5141      G15S2_11 5142-5143
        G15S3_11 5144-5145      G15T1_11 5146-5147      G15T2_11 5148-5149
        G15T3_11 5150-5151      G15U1_11 5152-5153      G15U2_11 5154-5155
        G15U3_11 5156-5157      G15J1A_11 5158-5159     G15J2A_11 5160-5161
        G15J3A_11 5162-5163     G15V1_11 5164-5165      G15V2_11 5166-5167
        G15V3_11 5168-5169      G15Y2_11 5170-5171      G15Y3_11 5172-5173
        H1_11 5174-5175         H21_11 5176-5177        H22_11 5178-5179
        H3_11 5180-5181         H6_11 5182-5183         H7_11 5184-5185
        H71_11 5186-5187        D11VYEAR 5188-5191      D11VMONTH 5192-5193
        D11VDAY 5194-5195       D11RESID 5196-5197      D11AGE 5198-5200
        D11MARRY 5201-5202      D11MARRY1 5203-5204     D11YR1 5205-5208
        D11MON1 5209-5210       D11RETIRE 5211-5212     D11RETYR 5213-5216
        D11RETPEN 5217-5220     D11INSUR 5221-5222      D11PAYIND 5223-5227
        D11PAYGOV 5228-5232     D11INSPEN 5233-5236     D11NOINSU 5237-5238
        D11A53A1 5239-5240      D11A53A3 5241-5242      D11A53A4 5243-5245
        D11A53A5 5246-5247      D11A53A6 5248-5249      D11A53B1 5250-5251
        D11A53B3 5252-5253      D11A53B4 5254-5256      D11A53B5 5257-5258
        D11A53B6 5259-5260      D11A53C1 5261-5262      D11A53C3 5263-5264
        D11A53C4 5265-5267      D11A53C5 5268-5269      D11A53C6 5270-5271
        D11A53D1 5272-5273      D11A53D3 5274-5275      D11A53D4 5276-5278
        D11A53D5 5279-5280      D11A53D6 5281-5282      D11A53E1 5283-5284
        D11A53E3 5285-5286      D11A53E4 5287-5289      D11A53E5 5290-5291
        D11A53E6 5292-5293      D11A53F1 5294-5295      D11A53F3 5296-5297
        D11A53F4 5298-5300      D11A53F5 5301-5302      D11A53F6 5303-5304
        D11A53G1 5305-5306      D11A53G3 5307-5308      D11A53G4 5309-5311
        D11A53G5 5312-5313      D11A53G6 5314-5315      D11A53H1 5316-5317
        D11A53H3 5318-5319      D11A53H4 5320-5322      D11A53H5 5323-5324
        D11A53H6 5325-5326      D11A53I1 5327-5328      D11A53I3 5329-5330
        D11A53I4 5331-5333      D11A53I5 5334-5335      D11A53I6 5336-5337
        D11A53J1 5338-5339      D11A53J3 5340-5341      D11A53J4 5342-5344
        D11A53J5 5345-5346      D11A53J6 5347-5348      D11LIVARR 5349-5350
        D11PERSON 5351-5352     D11GENER 5353-5354      D11DPLACE 5355-5356
        D11CARGIV 5357-5358     D11PCGDAY 5359-5360     D11BEDRID 5361-5362
        D11BEDDAY 5363-5366     D11ILL 5367-5368        D11DISEA1 5369-5370
        D11DIDAY1 5371-5374     D11DISEA2 5375-5376     D11DIDAY2 5377-5380
        D11DISEA3 5381-5382     D11DIDAY3 5383-5386     D11HYPERT 5387-5388
        D11DIABET 5389-5390     D11HEART 5391-5392      D11CVD 5393-5394
        D11PNEUM 5395-5396      D11TUBERC 5397-5398     D11CANCER 5399-5400
        D11GLAUCO 5401-5402     D11PROSTA 5403-5404     D11GYNECO 5405-5406
        D11GASTRI 5407-5408     D11PARKIN 5409-5410     D11BEDSOR 5411-5412
        D11DEMENT 5413-5414     D11PSYCHO 5415-5416     D11NEUROS 5417-5418
        D11ARTHRI 5419-5420     D11OTHERS 5421-5422     D11MEDICA 5423-5424
        D11FINANC 5425-5426     D11INCOME 5427-5431     D11WCFACI 5432-5433
        D11TAPWAT 5434-5435     D11BATHFA 5436-5437     D11HEATER 5438-5439
        D11TVSET 5440-5441      D11WASHMA 5442-5443     D11PHONE 5444-5445
        D11DOCTOR 5446-5447     D11LICDOC 5448-5449     D11WHOPAY 5450-5451
        D11MEDCOS 5452-5456     D11POCKET 5457-5461     D11BATHFU 5462-5463
        D11BATDAY 5464-5467     D11BATDAY1 5468-5471    D11BATDAY2 5472-5475
        D11DRESFU 5476-5477     D11DREDAY 5478-5481     D11DREDAY1 5482-5485
        D11DREDAY2 5486-5489    D11TOILFU 5490-5491     D11TOIDAY 5492-5495
        D11TOIDAY1 5496-5499    D11TOIDAY2 5500-5503    D11MOVEFU 5504-5505
        D11MOVDAY 5506-5509     D11MOVDAY1 5510-5513    D11MOVDAY2 5514-5517
        D11CONTFU 5518-5519     D11CONDAY 5520-5523     D11CONDAY1 5524-5527
        D11CONDAY2 5528-5531    D11FEEDFU 5532-5533     D11FEEDAY 5534-5537
        D11FEEDAY1 5538-5541    D11FEEDAY2 5542-5545    D11FULLDA 5546-5549
        D11CARCST 5550-5554     D11DIRCST 5555-5559     D11CARPAY 5560-5561
        D11OUTDOR 5562-5565     D11ACTDAY 5566-5569     D11SMOKE 5570-5571
        D11SMKTIM 5572-5573     D11D21B 5574-5575       D11DRINK 5576-5577
        D11KNDDRK 5578-5579     D11DRKMCH 5580-5594 .12 D11ADVDIR 5595-5596
        D11DIRDAY 5597-5600     D11DREAM 5601-5602      D11PAIN 5603-5604
        D11UNCONS 5605-5606     D11UNCDAY 5607-5610     D11A533 5611-5612
        D11A534 5613-5616       D11A535 5617-5618       D11A536 5619-5620
        D11A537 5621-5622       D11G23 5623-5624        D11G24 5625-5626
        D11G24A 5627-5628       D11G25 5629-5630        D11G25A 5631-5632
        D11G4 5633-5634         D11G4A 5635-5636        D11G4B 5637-5638
        D11G102 5639-5641       D11G106 5642-5643       D11G1061 5644-5645
        D11G1062 5646-5647      D11G1063 5648-5649      DTH11_14 5650-5651
        YEARIN_14 5652-5655     MONTHIN_14 5656-5657    DAYIN_14 5658-5659
        V_BTHYR_14 5660-5663    V_BTHMON_14 5664-5665   RESIDENC_14 5666
        TRUEAGE_14 5667-5669    RA41_14 5670            A41_14 5671-5672
        RA42_14 5673            A42_14 5674             RA43_14 5675
        A43_14 5676             RA51_14 5677            A51_14 5678
        RA52_14 5679-5680       A52_14 5681-5682        RA53A_14 5683-5684
        A53A1_14 5685-5686      A53A11_14 5687          A53A2_14 5688-5690
        A53A3_14 5691-5693      A53A4_14 5694-5695      A53A5_14 5696-5697
        RA53B_14 5698-5699      A53B1_14 5700-5701      A53B11_14 5702
        A53B2_14 5703-5705      A53B3_14 5706-5708      A53B4_14 5709-5710
        A53B5_14 5711-5712      RA53C_14 5713-5714      A53C1_14 5715-5716
        A53C11_14 5717          A53C2_14 5718-5720      A53C3_14 5721-5725 .1
        A53C4_14 5726-5727      A53C5_14 5728-5729      RA53D_14 5730-5731
        A53D1_14 5732-5733      A53D11_14 5734          A53D2_14 5735-5737
        A53D3_14 5738-5740      A53D4_14 5741-5742      A53D5_14 5743-5744
        RA53E_14 5745-5746      A53E1_14 5747-5748      A53E11_14 5749
        A53E2_14 5750-5752      A53E3_14 5753-5755      A53E4_14 5756-5757
        A53E5_14 5758-5759      RA53F_14 5760-5761      A53F1_14 5762-5763
        A53F11_14 5764          A53F2_14 5765-5767      A53F3_14 5768-5772 .1
        A53F4_14 5773-5774      A53F5_14 5775-5776      RA53G_14 5777-5778
        A53G1_14 5779-5780      A53G11_14 5781          A53G2_14 5782-5784
        A53G3_14 5785-5787      A53G4_14 5788-5789      A53G5_14 5790-5791
        RA53H_14 5792-5793      A53H1_14 5794-5795      A53H11_14 5796
        A53H2_14 5797-5799      A53H3_14 5800-5802      A53H4_14 5803-5804
        A53H5_14 5805-5806      RA53I_14 5807-5808      A53I1_14 5809-5810
        A53I11_14 5811          A53I2_14 5812-5814      A53I3_14 5815-5817
        A53I4_14 5818-5819      A53I5_14 5820-5821      RA53J_14 5822-5823
        A53J1_14 5824-5825      A53J11_14 5826          A53J2_14 5827-5829
        A53J3_14 5830-5832      A53J4_14 5833-5834      A53J5_14 5835-5836
        RA530_14 5837-5838      A530_14 5839-5840       A530A_14 5841
        RA531_14 5842-5843      A531_14 5844-5845       A531A_14 5846
        RA532_14 5847-5848      A532_14 5849-5850       RA533_14 5851-5852
        A533_14 5853            A533A_14 5854           RA534_14 5855-5856
        A534_14 5857-5860       RA535_14 5861-5862      A535_14 5863
        RA536_14 5864-5865      A536_14 5866            RA537_14 5867-5868
        A537_14 5869            A537A_14 5870           RA540_14 5871-5872
        A540_14 5873-5874       RA541_14 5875-5876      A541_14 5877-5880
        RA542_14 5881-5882      A542_14 5883-5884       A542A_14 5885
        RA54_14 5886-5887       A54A_14 5888-5891       A54B_14 5892-5893
        B11_14 5894             B12_14 5895             B121_14 5896
        B21_14 5897             B22_14 5898             B23_14 5899
        B24_14 5900             B25_14 5901             B26_14 5902
        B27_14 5903             B28_14 5904             B29_14 5905
        B210_14 5906            C11_14 5907             C12_14 5908
        C13_14 5909             C14_14 5910             C15_14 5911
        C16_14 5912-5913        C21A_14 5914            C21B_14 5915
        C21C_14 5916            C22_14 5917-5918        C31A_14 5919
        C31B_14 5920            C31C_14 5921            C31D_14 5922
        C31E_14 5923            C32_14 5924             C41A_14 5925
        C41B_14 5926            C41C_14 5927            C51A_14 5928
        C51B_14 5929            C52_14 5930             C53A_14 5931
        C53B_14 5932            C53C_14 5933            C54_14 5934
        C55_14 5935-5936        RD1_14 5937             D1_14 5938
        RD2_14 5939             D2_14 5940-5943 .1      RD31_14 5944
        D31_14 5945             RD32_14 5946            D32_14 5947
        RD33_14 5948-5949       D33_14 5950             D33A_14 5951
        RD34_14 5952-5953       D34_14 5954             RD4MEAT_14 5955
        D4MEAT2_14 5956         D4MEAT1_14 5957         RD4FISH_14 5958
        D4FISH2_14 5959         D4FISH1_14 5960         RD4EGG_14 5961
        D4EGG2_14 5962          D4EGG1_14 5963          RD4BEAN_14 5964
        D4BEAN2_14 5965         D4BEAN1_14 5966         RD4VEG_14 5967
        D4VEG2_14 5968          D4VEG1_14 5969          RD4SUGA_14 5970
        D4SUGA2_14 5971         D4SUGA1_14 5972         RD4TEA_14 5973
        D4TEA2_14 5974          D4TEA1_14 5975          RD4GARL_14 5976
        D4GARL2_14 5977         D4GARL1_14 5978         RD4MILK_14 5979-5980
        D4MILK1_14 5981         D4MILK2_14 5982         RD4NUT_14 5983-5984
        D4NUT1_14 5985          D4NUT2_14 5986          RD4ALGA_14 5987-5988
        D4ALGA1_14 5989         D4ALGA2_14 5990         RD4VIT_14 5991-5992
        D4VIT1_14 5993          D4VIT2_14 5994          RD4DRUG_14 5995-5996
        D4DRUG1_14 5997         D4DRUG2_14 5998         D4A_14 5999
        D4B_14 6000             RD5_14 6001             D5_14 6002
        RD6_14 6003             D6A_14 6004             D6B_14 6005
        D6C_14 6006             RD71_14 6007            D71_14 6008
        RD72_14 6009            D72_14 6010             RD73_14 6011-6012
        D73_14 6013-6015        RD74_14 6016-6017       D74_14 6018-6020
        RD75_14 6021-6022       D75_14 6023-6024        RD76_14 6025-6026
        D76_14 6027             RD77_14 6028-6029       D77_14 6030
        RD78_14 6031-6032       D78_14 6033             D78A_14 6034-6037 .1
        D78B_14 6038-6039       RD79_14 6040-6041       D79_14 6042
        D79A_14 6043-6046 .1    D79B_14 6047-6048       RD710_14 6049-6050
        D710_14 6051            D710A_14 6052-6055 .1   D710B_14 6056-6057
        RD81_14 6058            D81_14 6059             RD82_14 6060
        D82_14 6061             RD83_14 6062-6063       D83_14 6064-6066
        RD84_14 6067-6068       D84_14 6069-6071        RD85_14 6072-6073
        D85_14 6074-6075        D85A_14 6076            RD86_14 6077
        D86_14 6078-6092 .12    RD87_14 6093-6094       D87_14 6095
        RD91_14 6096            D91_14 6097             RD92_14 6098-6099
        D92_14 6100             RD93_14 6101-6102       D93_14 6103-6105
        RD94_14 6106-6107       D94_14 6108-6110        RD101_14 6111
        D101_14 6112            RD102_14 6113-6114      D102_14 6115-6117
        RD103_14 6118-6119      D103_14 6120-6122       RD11A_14 6123
        D11A_14 6124            RD11B_14 6125           D11B_14 6126
        RD11C_14 6127           D11C_14 6128            RD11D_14 6129
        D11D_14 6130            RD11E_14 6131           D11E_14 6132
        RD11F_14 6133           D11F_14 6134            RD11G_14 6135
        D11G_14 6136            RD11H_14 6137           D11H_14 6138
        RD12_14 6139            D12_14 6140-6141        RE0_14 6142-6143
        E0_14 6144              RE1_14 6145             E1_14 6146
        RE1B_14 6147-6148       E1B_14 6149-6152        RE2_14 6153
        E2_14 6154              RE2B_14 6155-6156       E2B_14 6157-6160
        RE3_14 6161             E3_14 6162              RE3B_14 6163-6164
        E3B_14 6165-6168        RE4_14 6169             E4_14 6170
        RE4B_14 6171-6172       E4B_14 6173-6176        RE5_14 6177
        E5_14 6178              RE5B_14 6179-6180       E5B_14 6181-6184
        RE6_14 6185             E6_14 6186              RE6B_14 6187-6188
        E6B_14 6189-6192        RE610_14 6193-6194      E610_14 6195-6196
        RE62_14 6197-6198       E62_14 6199-6200        RE63_14 6201-6202
        E63_14 6203-6207        RE64_14 6208-6209       E64_14 6210-6211
        E64A_14 6212            RE65_14 6213-6214       E65_14 6215-6216
        RE67_14 6217-6218       E67_14 6219-6221        RE7_14 6222
        E7_14 6223              RE8_14 6224             E8_14 6225
        RE9_14 6226             E9_14 6227              RE10_14 6228
        E10_14 6229             RE11_14 6230            E11_14 6231
        RE12_14 6232            E12_14 6233             RE13_14 6234
        E13_14 6235             RE14_14 6236            E14_14 6237
        RF1_14 6238             F1_14 6239-6240         RF2_14 6241-6242
        F2_14 6243              RF21_14 6244-6245       F21_14 6246
        RF211_14 6247-6248      F211_14 6249            RF22_14 6250-6251
        F22_14 6252-6255        RF221_14 6256-6257      F221_14 6258-6262
        RF23_14 6263-6264       F23_14 6265-6266        RF24_14 6267-6268
        F24_14 6269             RF25A_14 6270-6271      F25A1_14 6272-6276
        F25A2_14 6277-6282      RF25B_14 6283-6284      F25B1_14 6285-6288
        F25B2_14 6289-6290      RF26_14 6291-6292       F26_14 6293-6295
        RF27_14 6296-6297       F27_14 6298             RF31_14 6299
        F31_14 6300-6301        RF32_14 6302            F32A_14 6303-6304
        F32B_14 6305-6306       F32C_14 6307-6308       F32D_14 6309-6310
        F32E_14 6311-6312       RF33_14 6313            F33_14 6314
        RF340_14 6315           F340_14 6316            RF34_14 6317
        F34_14 6318             RF35_14 6319            F35_14 6320-6324
        RF41_14 6325            F41_14 6326             RF41A_14 6327-6328
        F41A1_14 6329           F41A11_14 6330-6333     F41A12_14 6334-6335
        F41A2_14 6336           F41A21_14 6337-6340     F41A22_14 6341-6342
        F41A3_14 6343           F41A31_14 6344-6347     F41A32_14 6348-6349
        RF41B_14 6350-6351      F41B_14 6352            F41B1_14 6353-6356
        F41B2_14 6357-6358      RF42_14 6359-6360       F42_14 6361-6362
        RF43A_14 6363-6364      F43A1_14 6365-6367      F43A2_14 6368-6369
        F43A3_14 6370-6372      F43A4_14 6373-6374      RF43B_14 6375-6376
        F43B1_14 6377-6379      F43B2_14 6380-6381      F43B3_14 6382-6384
        F43B4_14 6385-6386      RF43C_14 6387-6388      F43C1_14 6389-6391
        F43C2_14 6392-6393      F43C3_14 6394-6396      F43C4_14 6397-6398
        RF43D_14 6399-6400      F43D1_14 6401-6403      F43D2_14 6404-6405
        F43D3_14 6406-6408      F43D4_14 6409-6410      RF44_14 6411-6412
        F44_14 6413-6414        RF45_14 6415-6416       F45_14 6417-6418
        RF46_14 6419-6420       F46_14 6421-6422        RF47_14 6423-6424
        F47_14 6425             RF5_14 6426             F5_11_14 6427-6428
        RF61_14 6429            F61_14 6430             RF610_14 6431-6432
        F610_14 6433-6434       RF62_14 6435            F62_14 6436
        RF63_14 6437            F63_14 6438             RF64_14 6439
        F64A_14 6440            F64B_14 6441            F64C_14 6442
        F64D_14 6443            F64E_14 6444            F64F_14 6445
        F64G_14 6446            F64H_14 6447            F64I_14 6448
        RF651A1_14 6449-6450    F651A1_14 6451-6455     RF651B1_14 6456-6457
        F651B1_14 6458-6462     RF651A2_14 6463-6464    F651A2_14 6465-6470
        RF651B2_14 6471-6472    F651B2_14 6473-6477     RF6521_14 6478-6479
        F6521_14 6480           F6521T_14 6481          RF652A_14 6482-6483
        F652A_14 6484-6498 .12  RF652B_14 6499-6500     F652B_14 6501
        RF66_14 6502-6503       F66_14 6504             RF71_14 6505-6506
        F71_14 6507             RF721_14 6508-6509      F721_14 6510-6512
        RF722_14 6513-6514      F722_14 6515-6517       RF73_14 6518-6519
        F73_14 6520-6522        RF74_14 6523            F74_14 6524-6525
        RF81_14 6526-6527       F81_14 6528             RF821_14 6529-6530
        F821_14 6531-6533       RF822_14 6534-6535      F822_14 6536-6538
        RF83_14 6539-6540       F83_14 6541-6555 .11    RF84_14 6556
        F84_14 6557             RF85_14 6558            F85_14 6559
        RF86_14 6560            F86_14 6561-6562        RF91_14 6563-6564
        F91_14 6565-6566        RF92A_14 6567-6568      F92A1_14 6569-6570
        F92A2_14 6571-6572      F92A3_14 6573-6574      F92A4_14 6575-6577
        F92A5_14 6578-6579      F92A6_14 6580-6581      F92A7_14 6582-6583
        RF92B_14 6584-6585      F92B1_14 6586-6587      F92B2_14 6588-6589
        F92B3_14 6590-6591      F92B4_14 6592-6594      F92B5_14 6595-6596
        F92B6_14 6597-6598      F92B7_14 6599-6600      RF92C_14 6601-6602
        F92C1_14 6603-6604      F92C2_14 6605-6606      F92C3_14 6607-6608
        F92C4_14 6609-6611      F92C5_14 6612-6613      F92C6_14 6614-6615
        F92C7_14 6616-6617      RF92D_14 6618-6619      F92D1_14 6620-6621
        F92D2_14 6622-6623      F92D3_14 6624-6625      F92D4_14 6626-6628
        F92D5_14 6629-6630      F92D6_14 6631-6632      F92D7_14 6633-6634
        RF92E_14 6635-6636      F92E1_14 6637-6638      F92E2_14 6639-6640
        F92E3_14 6641-6642      F92E4_14 6643-6645      F92E5_14 6646-6647
        F92E6_14 6648-6649      F92E7_14 6650-6651      RF92F_14 6652-6653
        F92F1_14 6654-6655      F92F2_14 6656-6657      F92F3_14 6658-6659
        F92F4_14 6660-6662      F92F5_14 6663-6664      F92F6_14 6665-6666
        F92F7_14 6667-6668      RF92G_14 6669-6670      F92G1_14 6671-6672
        F92G2_14 6673-6674      F92G3_14 6675-6676      F92G4_14 6677-6679
        F92G5_14 6680-6681      F92G6_14 6682-6683      F92G7_14 6684-6685
        RF92H_14 6686-6687      F92H1_14 6688-6689      F92H2_14 6690-6691
        F92H3_14 6692-6693      F92H4_14 6694-6696      F92H5_14 6697-6698
        F92H6_14 6699-6700      F92H7_14 6701-6702      RF92I_14 6703-6704
        F92I1_14 6705-6706      F92I2_14 6707-6708      F92I3_14 6709-6710
        F92I4_14 6711-6713      F92I5_14 6714-6715      F92I6_14 6716-6717
        F92I7_14 6718-6719      RF92J_14 6720-6721      F92J1_14 6722-6723
        F92J2_14 6724-6725      F92J3_14 6726-6727      F92J4_14 6728-6730
        F92J5_14 6731-6732      F92J6_14 6733-6734      F92J7_14 6735-6736
        JIGE_14 6737-6738       RF10_14 6739-6740       F10_14 6741-6742
        F10A_14 6743-6744       RF101_14 6745-6746      F101_14 6747-6748
        RF102_14 6749-6750      F102_14 6751-6752       RF103A_14 6753-6754
        F103A8_14 6755-6756     F103A1_14 6757-6758     F103A2_14 6759-6760
        F103A3_14 6761-6775 .11 F103A4_14 6776-6777     F103A7_14 6778-6779
        F103A5_14 6780-6781     RF103B_14 6782-6783     F103B8_14 6784-6785
        F103B1_14 6786-6787     F103B2_14 6788-6789     F103B3_14 6790-6804 .11
        F103B4_14 6805-6806     F103B7_14 6807-6808     F103B5_14 6809-6810
        RF103C_14 6811-6812     F103C8_14 6813-6814     F103C1_14 6815-6816
        F103C2_14 6817-6818     F103C3_14 6819-6833 .11 F103C4_14 6834-6835
        F103C7_14 6836-6837     F103C5_14 6838-6839     RF103D_14 6840-6841
        F103D8_14 6842-6843     F103D1_14 6844-6845     F103D2_14 6846-6847
        F103D3_14 6848-6862 .11 F103D4_14 6863-6864     F103D7_14 6865-6866
        F103D5_14 6867-6868     RF103E_14 6869-6870     F103E8_14 6871-6872
        F103E1_14 6873-6874     F103E2_14 6875-6876     F103E3_14 6877-6879
        F103E4_14 6880-6881     F103E7_14 6882-6883     F103E5_14 6884-6885
        RF103F_14 6886-6887     F103F8_14 6888-6889     F103F1_14 6890-6891
        F103F2_14 6892-6893     F103F3_14 6894-6896     F103F4_14 6897-6898
        F103F7_14 6899-6900     F103F5_14 6901-6902     RF103G_14 6903-6904
        F103G8_14 6905-6906     F103G1_14 6907-6908     F103G2_14 6909-6910
        F103G3_14 6911-6913     F103G4_14 6914-6915     F103G7_14 6916-6917
        F103G5_14 6918-6919     RF103H_14 6920-6921     F103H8_14 6922-6923
        F103H1_14 6924-6925     F103H2_14 6926-6927     F103H3_14 6928-6930
        F103H4_14 6931-6932     F103H7_14 6933-6934     F103H5_14 6935-6936
        RF103I_14 6937-6938     F103I8_14 6939-6940     F103I1_14 6941-6942
        F103I2_14 6943-6944     F103I3_14 6945-6947     F103I4_14 6948-6949
        F103I7_14 6950-6951     F103I5_14 6952-6953     RF103J_14 6954-6955
        F103J8_14 6956-6957     F103J1_14 6958-6959     F103J2_14 6960-6961
        F103J3_14 6962-6964     F103J4_14 6965-6966     F103J7_14 6967-6968
        F103J5_14 6969-6970     RF103K_14 6971-6972     F103K8_14 6973-6974
        F103K1_14 6975-6976     F103K2_14 6977-6978     F103K3_14 6979-6981
        F103K4_14 6982-6983     F103K7_14 6984-6985     F103K5_14 6986-6987
        RF103L_14 6988-6989     F103L8_14 6990-6991     F103L1_14 6992-6993
        F103L2_14 6994-6995     F103L3_14 6996-6998     F103L4_14 6999-7000
        F103L7_14 7001-7002     F103L5_14 7003-7004     RF103M_14 7005-7006
        F103M8_14 7007-7008     F103M1_14 7009-7010     F103M2_14 7011-7012
        F103M3_14 7013-7015     F103M4_14 7016-7017     F103M7_14 7018-7019
        F103M5_14 7020-7021     RF104_14 7022-7023      F104_14 7024-7026
        RF105_14 7027-7028      F105_14 7029-7031       F111A_14 7032-7033
        F111B_14 7034-7035      F111C_14 7036-7037      F112A_14 7038-7039
        F112B_14 7040-7041      F112C_14 7042-7043      F113A_14 7044-7045
        F113B_14 7046-7047      F113C_14 7048-7049      RF12_14 7050-7051
        F12A_14 7052-7056       F12B_14 7057-7061       F12C_14 7062-7066
        RF13_14 7067-7068       F13A_14 7069-7073       F13B_14 7074-7078
        F13C_14 7079-7083       RF14_14 7084            F141_14 7085
        F142_14 7086            F143_14 7087            F144_14 7088
        F145_14 7089            F146_14 7090            F147_14 7091
        F148_14 7092            F149_14 7093            F14T_14 7094
        RF15_14 7095            F151_14 7096            F152_14 7097
        F153_14 7098            F154_14 7099            F155_14 7100
        F156_14 7101            F157_14 7102            F158_14 7103
        F159_14 7104            F15T_14 7105            F16_14 7106
        RG01_14 7107            G01_14 7108             RG02_14 7109
        G02_14 7110-7111        RG1_14 7112-7113        G1_14 7114
        G1A_14 7115             RG21_14 7116-7117       G21_14 7118-7119
        RG22_14 7120-7121       G22_14 7122             RG23_14 7123-7124
        G23_14 7125             RG24_14 7126-7127       G24_14 7128
        RG24A_14 7129-7130      G24A_14 7131-7132       RG25_14 7133-7134
        G25_14 7135             RG25A_14 7136-7137      G25A_14 7138-7139
        RG3_14 7140-7141        G3_14 7142              RG4_14 7143-7144
        G4_14 7145              RG4A_14 7146-7147       G4A_14 7148
        RG4B_14 7149-7150       G4B_14 7151             RG5_14 7152-7153
        G511_14 7154-7156       G512_14 7157-7159       G521_14 7160-7162
        G522_14 7163-7165       G6_14 7166              G7_14 7167-7169
        G81_14 7170             G82_14 7171             G83_14 7172
        G9_14 7173              G101_14 7174-7176       G1011_14 7177-7178
        G102_14 7179-7181       G1021_14 7182-7184      G122_14 7185-7187
        G123_14 7188-7190       G102C_14 7191-7193      RG106_14 7194-7195
        G106_14 7196            RG1061_14 7197-7198     G1061_14 7199
        RG1062_14 7200-7201     G1062_14 7202           RG1063_14 7203-7204
        G1063_14 7205           G11_14 7206             G12_14 7207-7208
        RG130_14 7209           G130_14 7210            RG13_14 7211
        G131_14 7212-7213       G132_14 7214-7215       RG14A_14 7216-7217
        G14A1_14 7218-7220      G14A2_14 7221-7224      G141T_14 7225
        RG14B_14 7226-7227      G14B1_14 7228-7230      G14B2_14 7231-7233
        G142T_14 7234           RG14C_14 7235-7236      G14C1_14 7237-7239
        G14C2_14 7240-7242      G143T_14 7243           G15A1_14 7244
        G15A2_14 7245           G15A3_14 7246-7247      G15B1_14 7248
        G15B2_14 7249           G15B3_14 7250-7251      G15C1_14 7252
        G15C2_14 7253           G15C3_14 7254-7255      G15D1_14 7256
        G15D2_14 7257           G15D3_14 7258-7259      G15E1_14 7260
        G15E2_14 7261           G15E3_14 7262-7263      G15F1_14 7264
        G15F2_14 7265           G15F3_14 7266-7267      G15G1_14 7268
        G15G2_14 7269           G15G3_14 7270-7271      G15H1_14 7272
        G15H2_14 7273           G15H3_14 7274-7275      G15I1_14 7276
        G15I2_14 7277           G15I3_14 7278-7279      G15J1_14 7280-7281
        G15J2_14 7282           G15J3_14 7283-7284      G15K1_14 7285
        G15K2_14 7286           G15K3_14 7287-7288      G15L1_14 7289
        G15L2_14 7290           G15L3_14 7291-7292      G15M1_14 7293
        G15M2_14 7294           G15M3_14 7295-7296      G15N1_14 7297
        G15N2_14 7298           G15N3_14 7299-7300      G15O1_14 7301
        G15O2_14 7302           G15O3_14 7303-7304      G15P1_14 7305
        G15P2_14 7306           G15P3_14 7307-7308      G15Q1_14 7309
        G15Q2_14 7310           G15Q3_14 7311-7312      G15R1_14 7313
        G15R2_14 7314           G15R3_14 7315-7316      G15N1A_14 7317
        G15N2A_14 7318          G15N3A_14 7319-7320     G15S1_14 7321
        G15S2_14 7322           G15S3_14 7323-7324      G15T1_14 7325
        G15T2_14 7326           G15T3_14 7327-7328      G15U1_14 7329-7330
        G15U2_14 7331-7332      G15U3_14 7333-7334      G15J1A_14 7335
        G15J2A_14 7336          G15J3A_14 7337-7338     G15V1_14 7339
        G15V2_14 7340           G15V3_14 7341-7342      G15Y1_14 $7343-7351
        G15Y2_14 7352-7354      G15Y3_14 7355-7356      G15YT_14 7357
        H1_14 7358              H21_14 7359             H22_14 7360-7361
        H3_14 7362              H5_14 7363-7365         H6_14 7366
        H7_14 7367              H71_14 7368-7369        D14VYEAR 7370-7373
        D14VMONTH 7374-7375     D14VDAY 7376-7377       D14AGE 7378-7380
        D14MARRY 7381-7382      D14MARRY1 7383-7384     D14YR1 $7385-7388
        D14MON1 $7389-7390      D14D22 7391-7392        D14D231 $7393-7401
        D14D232 $7402-7410      D14D233 $7411-7419      D14D234 $7420-7428
        D14D24 $7429-7437       D14D25 7438-7440        D14D26A1 7441-7442
        D14D26A2 7443-7444      D14D26A3 $7445-7453     D14D26A4 $7454-7462
        D14D26A5 7463-7465      D14D26A6 7466-7467      D14D26A61 $7468-7470
        D14D26B1 7471-7472      D14D26B2 7473-7474      D14D26B3 7475-7477
        D14D26B4 7478-7480      D14D26B5 7481-7483      D14D26B6 7484-7485
        D14D26B61 $7486-7487    D14D26C1 7488-7489      D14D26C2 7490-7491
        D14D26C3 7492-7494      D14D26C4 7495-7497      D14D26C5 7498-7500
        D14D26C6 7501-7502      D14D26C61 7503-7504     D14D26D1 7505-7506
        D14D26D2 7507-7508      D14D26D3 7509-7511      D14D26D4 7512-7514
        D14D26D5 7515-7517      D14D26D6 7518-7519      D14D26D61 7520-7521
        D14D26E1 7522-7523      D14D26E2 7524-7525      D14D26E3 $7526-7528
        D14D26E4 $7529-7537     D14D26E5 7538-7540      D14D26E6 7541-7542
        D14D26E61 7543          D14D26F1 7544-7545      D14D26F2 7546-7547
        D14D26F3 7548-7550      D14D26F4 $7551-7559     D14D26F5 7560
        D14D26F6 7561-7562      D14D26F61 7563          D14D26G1 7564-7565
        D14D26G11 7566          D14D26G2 7567-7568      D14D26G3 7569-7571
        D14D26G4 7572           D14D26G5 7573           D14D26G6 7574-7575
        D14D26G61 7576-7577     D14D26H1 7578-7579      D14D26H11 7580
        D14D26H2 7581-7582      D14D26H3 7583-7585      D14D26H4 $7586
        D14D26H5 7587           D14D26H6 7588-7589      D14D26H61 7590-7591
        D14D26I1 7592-7593      D14D26I11 7594          D14D26I2 7595-7596
        D14D26I3 7597-7598      D14D26I4 7599           D14D26I5 7600
        D14D26I6 7601-7602      D14D26I61 7603-7604     D14D26J1 7605-7606
        D14D26J11 7607          D14D26J2 7608-7609      D14D26J3 7610-7611
        D14D26J4 7612           D14D26J5 7613           D14D26J51 7614
        D14D26J6 7615-7616      D14D26J61 $7617-7619    D14LIVARR 7620-7621
        D14PERSON 7622-7624     D14GENER 7625-7627      D14DPLACE 7628-7629
        D14CARGIV 7630-7631     D14PCGDAY $7632-7635    D14BEDRID 7636-7637
        D14BEDDAY $7638-7646    D14ILL 7647-7648        D14DISEA1 $7649-7657
        D14DIDAY1 $7658-7662    D14DISEA2 $7663-7671    D14DIDAY2 $7672-7675
        D14DISEA3 $7676-7684    D14DIDAY3 $7685-7688    D14HYPERT 7689-7690
        D14DIABET 7691-7692     D14HEART 7693-7694      D14CVD 7695-7696
        D14PNEUM 7697-7698      D14TUBERC 7699-7700     D14CANCER 7701-7702
        D14GLAUCO 7703-7704     D14PROSTA 7705-7706     D14GYNECO 7707-7708
        D14GASTRI 7709-7710     D14PARKIN 7711-7712     D14BEDSOR 7713-7714
        D14DEMENT 7715-7716     D14PSYCHO 7717-7718     D14NEUROS 7719-7720
        D14ARTHRI 7721-7722     D14OTHERS 7723-7724     D14INCOME $7725-7733
        D14WCFACI 7734-7735     D14TAPWAT 7736-7737     D14BATHFA 7738-7739
        D14HEATER 7740-7741     D14TVSET 7742-7743      D14WASHMA 7744-7745
        D14PHONE 7746-7747      D14DOCTOR 7748-7749     D14LICDOC 7750-7751
        D14WHOPAY $7752-7754    D14MEDCOS $7755-7763    D14POCKET $7764-7768
        D14BATHFU 7769-7770     D14BATDAY $7771-7774    D14DRESFU 7775-7776
        D14DREDAY $7777-7780    D14TOILFU 7781-7782     D14TOIDAY $7783-7786
        D14MOVEFU 7787-7788     D14MOVDAY $7789-7792    D14CONTFU 7793-7794
        D14CONDAY $7795-7798    D14FEEDFU 7799-7800     D14FEEDAY $7801-7804
        D14FULLDA $7805-7813    D14CARCST $7814-7818    D14DIRCST $7819-7824
        D14CARPAY 7825-7827     D14OUTDOR 7828-7831     D14ACTDAY $7832-7835
        D14SMOKE 7836-7837      D14SMKTIM 7838-7839     D14D21B 7840-7841
        D14DRINK 7842-7843      D14KNDDRK 7844-7845     D14DRKMCH $7846-7848
        D14ADVDIR 7849-7850     D14DIRDAY 7851-7854     D14DREAM 7855-7856
        D14PAIN 7857-7858       D14UNCONS 7859-7860     D14UNCDAY $7861-7863
        D14A533 7864-7865       D14A534 $7866-7869      D14A535 7870-7871
        D14A536 7872-7873       D14A537 7874-7876       D14G23 $7877-7878
        D14G24 7879-7880        D14G24A 7881-7882       D14G25 7883-7884
        D14G25A 7885-7886       D14G4 7887-7888         D14G4A 7889-7890
        D14G4B 7891-7892        D14G102 7893-7895       D14G106 7896-7897
        D14G1061 7898-7899      D14G1062 7900-7901      D14G1063 7902-7903
        D14D45 7904-7905        D14D46 $7906            D14D47 7907
        ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id id, province code +given no. + year of the wave of the very first interview' 
   MONTHIN = 'monthin month of the 2005 interview' 
   DAYIN   = 'dayin day of the 2005 interview' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'prov national code for provinces sampled' 
   TYPE    = 'type category of the interviewed respondent' 
   RESIDENC= 'residenc category of residence of the interviewee in 2005' 
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
   RA53A   = 'ra53a proxy or not for a53a1, a53a2, a53a3, a53a4' 
   A53A1   = 'a53a1 relationship between you and 1st person you living with currently' 
   A53A2   = 'a53a2 age of 1st person you living with currently' 
   A53A3   = 'a53a3 sex of 1st person you living with currently' 
   A53A4   = 'a53a4 educational attainment of 1st person you living with currently' 
   RA53B   = 'ra53b proxy or not for a53b1, a53b2, a53b3, a53b4' 
   A53B1   = 'a53b1 relationship between you and 2nd person you living with currently' 
   A53B2   = 'a53b2 age of 2nd person you living with currently' 
   A53B3   = 'a53b3 sex of 2nd person you living with currently' 
   A53B4   = 'a53b4 educational attainment of 2nd person you living with currently' 
   RA53C   = 'ra53c proxy or not for a53c1, a53c2, a53c3, a53c4' 
   A53C1   = 'a53c1 relationship between you and 3rd person you living with currently' 
   A53C2   = 'a53c2 age of 3rd person you living with currently' 
   A53C3   = 'a53c3 sex of 3rd person you living with currently' 
   A53C4   = 'a53c4 educational attainment of 3rd person you living with currently' 
   RA53D   = 'ra53d proxy or not for a53d1, a53d2, a53d3, a53d4' 
   A53D1   = 'a53d1 relationship between you and 4th person you living with currently' 
   A53D2   = 'a53d2 age of 4th person you living with currently' 
   A53D3   = 'a53d3 sex of 4th person you living with currently' 
   A53D4   = 'a53d4 educational attainment of 4th person you living with currently' 
   RA53E   = 'ra53e proxy or not for a53e1, a53e2, a53e3, a53e4' 
   A53E1   = 'a53e1 relationship between you and 5th person you living with currently' 
   A53E2   = 'a53e2 age of 5th person you living with currently' 
   A53E3   = 'a53e3 sex of 5th person you living with currently' 
   A53E4   = 'a53e4 educational attainment of 5th person you living with currently' 
   RA53F   = 'ra53f proxy or not for a53f1, a53f2, a53f3, a53f4' 
   A53F1   = 'a53f1 relationship between you and 6th person you living with currently' 
   A53F2   = 'a53f2 age of 6th person you living with currently' 
   A53F3   = 'a53f3 sex of 6th person you living with currently' 
   A53F4   = 'a53f4 educational attainment of 6th person you living with currently' 
   RA53G   = 'ra53g proxy or not for a53g1, a53g2, a53g3, a53g4' 
   A53G1   = 'a53g1 relationship between you and 7th person you living with currently' 
   A53G2   = 'a53g2 age of 7th person you living with currently' 
   A53G3   = 'a53g3 sex of 7th person you living with currently' 
   A53G4   = 'a53g4 educational attainment of 7th person you living with currently' 
   RA53H   = 'ra53h proxy or not for a53h1, a53h2, a53h3, a53h4' 
   A53H1   = 'a53h1 relationship between you and 8th person you living with currently' 
   A53H2   = 'a53h2 age of 8th person you living with currently' 
   A53H3   = 'a53h3 sex of 8th person you living with currently' 
   A53H4   = 'a53h4 educational attainment of 8th person you living with currently' 
   RA53I   = 'ra53i proxy or not for a53i1, a53i2, a53i3, a53i4' 
   A53I1   = 'a53i1 relationship between you and 9th person you living with currently' 
   A53I2   = 'a53i2 age of 9th person you living with currently' 
   A53I3   = 'a53i3 sex of 9th person you living with currently' 
   A53I4   = 'a53i4 educational attainment of 9th person you living with currently' 
   RA53J   = 'ra53j proxy or not for a53j1, a53j2, a53j3, a53j4' 
   A53J1   = 'a53j1 relationship between you and 10th person you living with currently' 
   A53J2   = 'a53j2 age of 10th person you living with currently' 
   A53J3   = 'a53j3 sex of 10th person you living with currently' 
   A53J4   = 'a53j4 educational attainment of 10th person you living with currently' 
   RA53K   = 'ra53k proxy or not for a53k1, a53k2, a53k3, a53k4' 
   A53K1   = 'a53k1 relationship between you and 11th person you living with currently' 
   A53K2   = 'a53k2 age of 11th person you living with currently' 
   A53K3   = 'a53k3 sex of 11th person you living with currently' 
   A53K4   = 'a53k4 educational attainment of 11th person you living with currently' 
   RA53L   = 'ra53l proxy or not for a53l1, a53l2, a53l3,a53l4' 
   A53L1   = 'a53l1 relationship between you and 12th person you living with currently' 
   A53L2   = 'a53l2 age of 12th person you living with currently' 
   A53L3   = 'a53l3 sex of 12th person you living with currently' 
   A53L4   = 'a53l4 educational attainment of 12th person you living with currently' 
   RA530   = 'ra530 proxy or not for a530' 
   A530    = 'a530 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531   = 'ra531 proxy or not for a531' 
   A531    = 'a531 under whose name your current house/apartment purchased or rented' 
   RA532   = 'ra532 proxy or not for a532' 
   A532    = 'a532 do you (and your spouse) have your own bedroom?' 
   RA540   = 'ra540 proxy or not for a540' 
   A540    = 'a540 the primary reason that the elder live in an institution' 
   RA541   = 'ra541 proxy or not for a541' 
   A541    = 'a541 the average monthly cost for the elder living in an institution' 
   RA542   = 'ra542 proxy or not for a542' 
   A542    = 'a542 who mainly paid for the cost?' 
   RA54    = 'ra54 proxy or not for a54a a54b' 
   A54A    = 'a54a year of being admitted to an institution or living alone' 
   A54B    = 'a54b month of being admitted to an institution or living alone' 
   B11     = 'b11 self-rated quality of life' 
   B12     = 'b12 self-rated health' 
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
   RD2     = 'rd2 proxy or not for d2' 
   D2      = 'd2 amount of staple food per day (liang) (1 liang=50g)' 
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
   D4BEAN2 = 'd4bean2 how often eat food made from bean at present?' 
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
   D86     = 'd86 how much per day if drink (or drank)?' 
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
   D103    = 'd103 age when quitting doing physical labor' 
   RD11A   = 'rd11a proxy or not for d11a' 
   D11A    = 'd11a do you do house work at present?' 
   RD11B   = 'rd11b proxy or not for d11b' 
   D11B    = 'd11b do you any outdoor activities at present?' 
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
   D11H    = 'd11h do you take part in some social activities at present?' 
   RD12    = 'rd12 proxy or not for d12' 
   D12     = 'd12 # of traveling beyond home county/city in the past two years' 
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
   RE6     = 're6 proxy or not for e6' 
   E6      = 'e6 feeding' 
   RE6B    = 're6b proxy or not for e6b' 
   E6B     = 'e6b # of days needing assistance in feeding' 
   RE610   = 're610 proxy or not for e610' 
   E610    = 'e610 primary caregiver when the elder needs assistance in above six tasks' 
   RE62    = 're62 proxy or not for e62' 
   E62     = 'e62 willingness of the primary caregiver when he/she provided such cares' 
   RE63    = 're63 proxy or not for e63' 
   E63     = 'e63 total direct cost paid for caregiving last week' 
   RE64    = 're64 proxy or not for e64' 
   E64     = 'e64 who mainly pay for the cost?' 
   RE65    = 're65 proxy or not for e65' 
   E65     = 'e65 does the elderly think that helps in six tasks he/she received could meet his/he' 
   RE66    = 're66 proxy or not for e66' 
   E66     = 'e66 how many children, grandchildren and their spouses helped the elder in above six' 
   RE67    = 're67 proxy or not for e67' 
   E67     = 'e67 how many hours did the (grand)children and their spouses help the elder last wee' 
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
   F23     = 'f23 are you still engaged in paid jobs now?' 
   RF31    = 'rf31 proxy or not for f31' 
   F31     = 'f31 main source of financial support' 
   RF32    = 'rf32 proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A    = 'f32a first of other financial support sources' 
   F32B    = 'f32b second of other financial support sources' 
   F32C    = 'f32c third of other financial support sources' 
   F32D    = 'f32d forth of other financial support sources' 
   F32E    = 'f32e fifth of other financial support sources' 
   RF33    = 'rf33 proxy or not for f33' 
   F33     = 'f33 does all financial support sufficiently pay your daily cost?' 
   RF340   = 'rf340 proxy or not for f340' 
   F340    = 'f340 your power in decision-making on financial spending in the household' 
   RF34    = 'rf34 proxy or not for f34' 
   F34     = 'f34 how do you rate your economic status compared with other local people?' 
   RF35    = 'rf35 proxy or not for f35' 
   F35     = 'f35 income per capita of your household last year' 
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
   F46     = 'f46 dose your spouse has paid job at present?' 
   RF5     = 'rf5 proxy or not for f5' 
   F5      = 'f5 who take care of you when you are sick?' 
   RF61    = 'rf61 proxy or not for f61' 
   F61     = 'f61 get adequate medical service at present when in serious illness' 
   RF610   = 'rf610 proxy or not for f610' 
   F610    = 'f610 main reason not visit doctor when necessary' 
   RF62    = 'rf62 proxy or not for f62' 
   F62     = 'f62 got adequate medical service at around age 60' 
   RF63    = 'rf63 proxy or not for 63' 
   F63     = 'f63 got adequate medical service in childhood' 
   RF64    = 'rf64 proxy or not for f64' 
   F64A    = 'f64a do you have retirment wage at present?' 
   F64B    = 'f64b do you have pension at present?' 
   F64C    = 'f64c do you have private old age insurance at present?' 
   F64D    = 'f64d can you access to public free medical services at present?' 
   F64E    = 'f64e can you access to the cooperative medical scheme at present?' 
   F64F    = 'f64f do you have basic medical insurance at present?' 
   F64G    = 'f64g do you have severe disease insurance at present?' 
   F64H    = 'f64h do you have life insurance at present?' 
   F64I    = 'f64i do you other social security or private insurance at present?' 
   RF651A  = 'rf651a proxy or not for f651a' 
   F651A   = 'f651a how much did you spend on medical care services last year?' 
   RF651B  = 'rf651b proxy or not for f651b' 
   F651B   = 'f651b how much did your family pay for your medical care services last year?' 
   RF652   = 'rf652 proxy or not for f652' 
   F652    = 'f652 who mainly paid for the cost?' 
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
   F9      = 'f9 number of siblings' 
   F9A     = 'f9a number of siblings alive' 
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
   RF92K   = 'rf92k proxy or not for f92k1 to f92k6' 
   F92K1   = 'f92k1 birth order of the sibling' 
   F92K2   = 'f92k2 sex of the sibling' 
   F92K3   = 'f92k3 sibling alive' 
   F92K4   = 'f92k4 sibling''s age at present if alive, or age at death if died' 
   F92K5   = 'f92k5 residence distance' 
   F92K6   = 'f92k6 frequent visits' 
   RF10    = 'rf10 proxy or not for f10 and f10a' 
   F10     = 'f10 number of children ever born' 
   F10A    = 'f10a number of male children ever born' 
   RF101   = 'rf101 proxy or not for f101' 
   F101    = 'f101 age at gaving the first child' 
   RF102   = 'rf102 proxy or not for f102' 
   F102    = 'f102 age at gaving the last child' 
   RF103A  = 'rf103a proxy or not for f103a1 to f103a8' 
   F103A6  = 'f103a6 birth order of the child' 
   F103A8  = 'f103a8 biological child' 
   F103A1  = 'f103a1 sex of the child' 
   F103A2  = 'f103a2 child alive or not' 
   F103A3  = 'f103a3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103A4  = 'f103a4 frequent visits' 
   F103A7  = 'f103a7 contact' 
   F103A5  = 'f103a5 residence distance' 
   RF103B  = 'rf103b proxy or not for f103b1 to f103b8' 
   F103B6  = 'f103b6 birth order of the child' 
   F103B8  = 'f103b8 biological child' 
   F103B1  = 'f103b1 sex of the child' 
   F103B2  = 'f103b2 child alive or not' 
   F103B3  = 'f103b3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103B4  = 'f103b4 frequent visits' 
   F103B7  = 'f103b7 contact' 
   F103B5  = 'f103b5 residence distance' 
   RF103C  = 'rf103c proxy or not for f103c1 to f103c8' 
   F103C6  = 'f103c6 birth order of the child' 
   F103C8  = 'f103c8 biological child' 
   F103C1  = 'f103c1 sex of the child' 
   F103C2  = 'f103c2 child alive or not' 
   F103C3  = 'f103c3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103C4  = 'f103c4 frequent visits' 
   F103C7  = 'f103c7 contact' 
   F103C5  = 'f103c5 residence distance' 
   RF103D  = 'rf103d proxy or not for f103d1 to f103d8' 
   F103D6  = 'f103d6 birth order of the child' 
   F103D8  = 'f103d8 biological child' 
   F103D1  = 'f103d1 sex of the child' 
   F103D2  = 'f103d2 child alive or not' 
   F103D3  = 'f103d3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103D4  = 'f103d4 frequent visits' 
   F103D7  = 'f103d7 contact' 
   F103D5  = 'f103d5 residence distance' 
   RF103E  = 'rf103e proxy or not for f103e1 to f103e8' 
   F103E6  = 'f103e6 birth order of the child' 
   F103E8  = 'f103e8 biological child' 
   F103E1  = 'f103e1 sex of the child' 
   F103E2  = 'f103e2 child alive or not' 
   F103E3  = 'f103e3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103E4  = 'f103e4 frequent visits' 
   F103E7  = 'f103e7 contact' 
   F103E5  = 'f103e5 residence distance' 
   RF103F  = 'rf103f proxy or not for f103f1 to f103f8' 
   F103F6  = 'f103f6 birth order of the child' 
   F103F8  = 'f103f8 biological child' 
   F103F1  = 'f103f1 sex of the child' 
   F103F2  = 'f103f2 child alive or not' 
   F103F3  = 'f103f3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103F4  = 'f103f4 frequent visits' 
   F103F7  = 'f103f7 contact' 
   F103F5  = 'f103f5 residence distance' 
   RF103G  = 'rf103g proxy or not for f103g1 to f103g8' 
   F103G6  = 'f103g6 birth order of the child' 
   F103G8  = 'f103g8 biological child' 
   F103G1  = 'f103g1 sex of the child' 
   F103G2  = 'f103g2 child alive or not' 
   F103G3  = 'f103g3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103G4  = 'f103g4 frequent visits' 
   F103G7  = 'f103g7 contact' 
   F103G5  = 'f103g5 residence distance' 
   RF103H  = 'rf103h proxy or not for f103h1 to f103h8' 
   F103H6  = 'f103h6 birth order of the child' 
   F103H8  = 'f103h8 biological child' 
   F103H1  = 'f103h1 sex of the child' 
   F103H2  = 'f103h2 child alive or not' 
   F103H3  = 'f103h3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103H4  = 'f103h4 frequent visits' 
   F103H7  = 'f103h7 contact' 
   F103H5  = 'f103h5 residence distance' 
   RF103I  = 'rf103i proxy or not for f103i1 to f103i8' 
   F103I6  = 'f103i6 birth order of the child' 
   F103I8  = 'f103i8 biological child' 
   F103I1  = 'f103i1 sex of the child' 
   F103I2  = 'f103i2 child alive or not' 
   F103I3  = 'f103i3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103I4  = 'f103i4 frequent visits' 
   F103I7  = 'f103i7 contact' 
   F103I5  = 'f103i5 residence distance' 
   RF103J  = 'rf103j proxy or not for f103j1 to f103j8' 
   F103J6  = 'f103j6 birth order of the child' 
   F103J8  = 'f103j8 biological child' 
   F103J1  = 'f103j1 sex of the child' 
   F103J2  = 'f103j2 child alive or not' 
   F103J3  = 'f103j3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103J4  = 'f103j4 frequent visits' 
   F103J7  = 'f103j7 contact' 
   F103J5  = 'f103j5 residence distance' 
   RF103K  = 'rf103k proxy or not for f103k1 to f103k8' 
   F103K6  = 'f103k6 birth order of the child' 
   F103K8  = 'f103k8 biological child' 
   F103K1  = 'f103k1 sex of the child' 
   F103K2  = 'f103k2 child alive or not' 
   F103K3  = 'f103k3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103K4  = 'f103k4 frequent visits' 
   F103K7  = 'f103k7 contact' 
   F103K5  = 'f103k5 residence distance' 
   RF103L  = 'rf103l proxy or not for f103l1 to f103l8' 
   F103L6  = 'f103l6 birth order of the child' 
   F103L8  = 'f103l8 biological child' 
   F103L1  = 'f103l1 sex of the child' 
   F103L2  = 'f103l2 child alive or not' 
   F103L3  = 'f103l3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103L4  = 'f103l4 frequent visits' 
   F103L7  = 'f103l7 contact' 
   F103L5  = 'f103l5 residence distance' 
   RF103M  = 'rf103m proxy or not for f103m1 to f103m8' 
   F103M6  = 'f103m6 birth order of the child' 
   F103M8  = 'f103m8 biological child' 
   F103M1  = 'f103m1 sex of the child' 
   F103M2  = 'f103m2 child alive or not' 
   F103M3  = 'f103m3 child''s age at present if alive, or the age the child would be if s/he were stil' 
   F103M4  = 'f103m4 frequent visits' 
   F103M7  = 'f103m7 contact' 
   F103M5  = 'f103m5 residence distance' 
   RF104   = 'rf104 proxy or not for f104' 
   F104    = 'f104 if your 1st child died, what would his/her age be at present if she/he were aliv' 
   RF105   = 'rf105 proxy or not for f105' 
   F105    = 'f105 if your last child died, what would his/her age be at present if she/he were ali' 
   RF111   = 'rf111 proxy or not for f111a to f111c' 
   F111A   = 'f111a the first person to whom you usurally talk frequently in daily life' 
   F111B   = 'f111b the second person to whom you usurally talk frequently in daily life' 
   F111C   = 'f111c the third person to whom you usurally talk frequently in daily life' 
   RF112   = 'rf112 proxy or not for f112a to f112c' 
   F112A   = 'f112a the first person to whom you talk first when you need to tell something of your' 
   F112B   = 'f112b the second person to whom you talk first when you need to tell something of your' 
   F112C   = 'f112c the third person to whom you talk first when you need to tell something of your' 
   RF113   = 'rf113 proxy or not for f113a to f113c' 
   F113A   = 'f113a the first person you asking first for help when you have problem/difficulties' 
   F113B   = 'f113b the second person you asking first for help when you have problem/difficulties' 
   F113C   = 'f113c the third person you asking first for help when you have problem/difficulties' 
   RF12    = 'rf12 proxy or not for f12a to f12c' 
   F12A    = 'f12a how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B    = 'f12b how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C    = 'f12c how much did you receive from your grandchild(ren) last year?' 
   RF13    = 'rf13 proxy or not for f13a to f13c' 
   F13A    = 'f13a how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B    = 'f13b how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C    = 'f13c how much did you give to your grandchild(ren)in last year?' 
   RF14    = 'rf14 proxy or not for f14' 
   F141    = 'f141 is personal care service available in your community?' 
   F142    = 'f142 is home visit service available in your community?' 
   F143    = 'f143 is psychological consulting service available in your community?' 
   F144    = 'f144 is daily shopping service available in your community?' 
   F145    = 'f145 is social and recreation service available in your community?' 
   F146    = 'f146 is human rights consulting service available in your community?' 
   F147    = 'f147 is healthcare education service available in your community?' 
   F148    = 'f148 is neighborhood-relation service available in your community?' 
   F149    = 'f149 is any other social service available in your community?' 
   RF15    = 'rf15 proxy or not for f15' 
   F151    = 'f151 do you expect your community provide personal care services?' 
   F152    = 'f152 do you expect your community provide home visit services?' 
   F153    = 'f153 do you expect your community provide psychological consulting services?' 
   F154    = 'f154 do you expect your community provide daily shopping services?' 
   F155    = 'f155 do you expect your community provide social and recreation activities?' 
   F156    = 'f156 do you expect your community provide human rights consulting services?' 
   F157    = 'f157 do you expect your community provide healthcare education service?' 
   F158    = 'f158 do you expect your community provide neighborhood-relation services?' 
   F159    = 'f159 do you expect your community provide other social services?' 
   F16     = 'f16 what kind of living arrangement do you like best?' 
   RG01    = 'rg01 proxy or not for g01' 
   G01     = 'g01 how about the quality of your sleep?' 
   RG02    = 'rg02 proxy or not for g02' 
   G02     = 'g02 how long do you sleep normally?' 
   G1      = 'g1 visual function' 
   G21     = 'g21 number of natural teeth' 
   G22     = 'g22 have false teeth?' 
   G3      = 'g3 able to use chopsticks to eat?' 
   G4      = 'g4 hemisphere dominance' 
   G51     = 'g51 systolic' 
   G52     = 'g52 diastolic' 
   G6      = 'g6 rhythm of heart' 
   G7      = 'g7 heart rate' 
   G81     = 'g81 hand behind neck' 
   G82     = 'g82 hand behind lower back' 
   G83     = 'g83 hold-up arms' 
   G9      = 'g9 able to stand up from sitting in a chair?' 
   G101    = 'g101 weight' 
   G102    = 'g102 stature when the elder was young' 
   G11     = 'g11 able to pick up a book from the floor?' 
   G12     = 'g12 steps used to turn around 360 degree without help?' 
   RG130   = 'rg130 with proxy or not for g13' 
   G130    = 'g130 feel not-well in the past two weeks?' 
   RG13    = 'rg13 with proxy or not for g13' 
   G13     = 'g13 # of times suffering from serious illness in the past two years' 
   RG14A   = 'rg14a with proxy or not for g14a1 and g14a2' 
   G14A1   = 'g14a1 name of disease suffering at the first time' 
   G14A2   = 'g14a2 days lasted for the first time' 
   RG14B   = 'rg14b with proxy or not for g14b1 and g14b2' 
   G14B1   = 'g14b1 name of disease suffering at the second time' 
   G14B2   = 'g14b2 days lasted for the second time' 
   RG14C   = 'rg14c with proxy or not for g14c1 and g14c2' 
   G14C1   = 'g14c1 name of disease suffering at the last time' 
   G14C2   = 'g14c2 days lasted for the last time' 
   G15A1   = 'g15a1 suffering from hypertension?' 
   G15A2   = 'g15a2 diagnosed by hospital?' 
   G15A3   = 'g15a3 disability in daily life' 
   G15B1   = 'g15b1 suffering from diabetes?' 
   G15B2   = 'g15b2 diagnosed by hospital?' 
   G15B3   = 'g15b3 disability in daily life' 
   G15C1   = 'g15c1 suffering from heart disease?' 
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
   G15P1   = 'g15p1 suffering from other disease difficult to classify?' 
   G15P2   = 'g15p2 diagnosed by hospital?' 
   G15P3   = 'g15p3 disability in daily life' 
   G15Q1   = 'g15q1 suffering from psychosis?' 
   G15Q2   = 'g15q2 diagnosed by hospital?' 
   G15Q3   = 'g15q3 disability in daily life' 
   G15R1   = 'g15r1 suffering from orthopedic disease?' 
   G15R2   = 'g15r2 diagnosed by hospital?' 
   G15R3   = 'g15r3 disability in daily life' 
   G15S1   = 'g15s1 suffering from internal medical disease?' 
   G15S2   = 'g15s2 diagnosed by hospital?' 
   G15S3   = 'g15s3 disability in daily life' 
   G15T1   = 'g15t1 suffering from dermatosis?' 
   G15T2   = 'g15t2 diagnosed by hospital?' 
   G15T3   = 'g15t3 disability in daily life' 
   G15U1   = 'g15u1 suffering from five organs diseases?' 
   G15U2   = 'g15u2 diagnosed by hospital?' 
   G15U3   = 'g15u3 disability in daily life' 
   G15V1   = 'g15v1 suffering from gynecological disease?' 
   G15V2   = 'g15v2 diagnosed by hospital?' 
   G15V3   = 'g15v3 disability in daily life' 
   G15W1   = 'g15w1 suffering from other diseases?' 
   G15W2   = 'g15w2 diagnosed by hospital?' 
   G15W3   = 'g15w3 disability in daily life' 
   H1      = 'h1 was interviewee able to hear?' 
   H21     = 'h21 did interviewee able to participate physical check?' 
   H22     = 'h22 the reason of unable to participate physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H5      = 'h5 age reported by interviewer' 
   H6      = 'h6 has interviewer checked if  failing to ask a question?' 
   H7      = 'h7 did anyone help the interviewee to answer question' 
   H71     = 'h71 who helped interviewee to answer question?' 
   W_2005  = 'w_2005 weight variable, estimated based on 100% age-sex-residence-specific distribution' 
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
         A51_11 a51_11ff. A51_14 a51fffff. A51_8 a51_8fff.
         A52 a52fffff. A52_11 a52_11ff. A52_14 a52fffff.
         A52_8 a52_8fff. A530 a530ffff. A530_11 a530_11f.
         A530_14 a530ffff. A530_8 a530_8ff. A531 a531ffff.
         A531_11 a531_11f. A531_14 a531ffff. A531_8 a531_8ff.
         A532 a532ffff. A532_11 a532_11f. A532_14 a532ffff.
         A532_8 a532_8ff. A533_11 a533_11f. A533_14 a533_14f.
         A534_11 a534_11f. A534_14 a534_14f. A535_11 a535_11f.
         A535_14 f151ffff. A536_11 a535_11f. A536_14 f151ffff.
         A537_11 a537_11f. A537_14 a537_14f. A53A1 a53a1fff.
         A53A1_11 a53a1_1f. A53A1_14 a53a1fff. A53A1_8 a53a1_8f.
         A53A2 a53a2fff. A53A2_11 a53a2_1f. A53A2_14 a53a2fff.
         A53A2_8 a53a2_8f. A53A3 a53a3fff. A53A3_11 a53a3_1f.
         A53A3_14 a53a3fff. A53A3_8 a53a3_8f. A53A4 a53a4fff.
         A53A4_11 a53a4_1f. A53A4_14 a53a4fff. A53A4_8 a53a4_8f.
         A53A5_11 a53a5_1f. A53A5_14 d75fffff. A53B1 a53a1fff.
         A53B1_11 a53a1_1f. A53B1_14 a53a1fff. A53B1_8 a53a1_8f.
         A53B2 a53a2fff. A53B2_11 a53a2_1f. A53B2_14 a53a2fff.
         A53B2_8 a53a2_8f. A53B3 a53a3fff. A53B3_11 a53b3_1f.
         A53B3_14 a53a3fff. A53B3_8 a53b3_8f. A53B4 a53a4fff.
         A53B4_11 a53a4_1f. A53B4_14 a53a4fff. A53B4_8 a53a4_8f.
         A53B5_11 a53a5_1f. A53B5_14 d75fffff. A53C1 a53a1fff.
         A53C1_11 a53a1_1f. A53C1_14 a53a1fff. A53C1_8 a53a1_8f.
         A53C2 a53a2fff. A53C2_11 a53a2_1f. A53C2_14 a53a2fff.
         A53C2_8 a53a2_8f. A53C3 a53a3fff. A53C3_11 a53b3_1f.
         A53C3_14 a53a3fff. A53C3_8 a53b3_8f. A53C4 a53a4fff.
         A53C4_11 a53a4_1f. A53C4_14 a53a4fff. A53C4_8 a53a4_8f.
         A53C5_11 a53a5_1f. A53C5_14 d75fffff. A53D1 a53a1fff.
         A53D1_11 a53a1_1f. A53D1_14 a53a1fff. A53D1_8 a53a1_8f.
         A53D2 a53a2fff. A53D2_11 a53a2_1f. A53D2_14 a53a2fff.
         A53D2_8 a53a2_8f. A53D3 a53a3fff. A53D3_11 a53b3_1f.
         A53D3_14 a53a3fff. A53D3_8 a53b3_8f. A53D4 a53a4fff.
         A53D4_11 a53a4_1f. A53D4_14 a53a4fff. A53D4_8 a53a4_8f.
         A53D5_11 a53a5_1f. A53D5_14 d75fffff. A53E1 a53a1fff.
         A53E1_11 a53a1_1f. A53E1_14 a53a1fff. A53E1_8 a53a1_8f.
         A53E2 a53a2fff. A53E2_11 a53a2_1f. A53E2_14 a53a2fff.
         A53E2_8 a53a2_8f. A53E3 a53a3fff. A53E3_11 a53b3_1f.
         A53E3_14 a53a3fff. A53E3_8 a53b3_8f. A53E4 a53a4fff.
         A53E4_11 a53a4_1f. A53E4_14 a53a4fff. A53E4_8 a53a4_8f.
         A53E5_11 a53a5_1f. A53E5_14 d75fffff. A53F1 a53a1fff.
         A53F1_11 a53a1_1f. A53F1_14 a53a1fff. A53F1_8 a53a1_8f.
         A53F2 a53a2fff. A53F2_11 a53a2_1f. A53F2_14 a53a2fff.
         A53F2_8 a53a2_8f. A53F3 a53a3fff. A53F3_11 a53b3_1f.
         A53F3_14 a53a3fff. A53F3_8 a53b3_8f. A53F4 a53a4fff.
         A53F4_11 a53a4_1f. A53F4_14 a53a4fff. A53F4_8 a53a4_8f.
         A53F5_11 a53a5_1f. A53F5_14 d75fffff. A53G1 a53a1fff.
         A53G1_11 a53a1_1f. A53G1_14 a53a1fff. A53G1_8 a53a1_8f.
         A53G2 a53a2fff. A53G2_11 a53a2_1f. A53G2_14 a53a2fff.
         A53G2_8 a53a2_8f. A53G3 a53a3fff. A53G3_11 a53b3_1f.
         A53G3_14 a53a3fff. A53G3_8 a53b3_8f. A53G4 a53a4fff.
         A53G4_11 a53a4_1f. A53G4_14 a53a4fff. A53G4_8 a53a4_8f.
         A53G5_11 a53a5_1f. A53G5_14 d75fffff. A53H1 a53a1fff.
         A53H1_11 a53a1_1f. A53H1_14 a53a1fff. A53H1_8 a53a1_8f.
         A53H2 a53a2fff. A53H2_11 a53a2_1f. A53H2_14 a53a2fff.
         A53H2_8 a53a2_8f. A53H3 a53a3fff. A53H3_11 a53b3_1f.
         A53H3_14 a53a3fff. A53H3_8 a53b3_8f. A53H4 a53a4fff.
         A53H4_11 a53a4_1f. A53H4_14 a53a4fff. A53H4_8 a53a4_8f.
         A53H5_11 a53a5_1f. A53H5_14 d75fffff. A53I1 a53a1fff.
         A53I1_11 a53a1_1f. A53I1_14 a53a1fff. A53I1_8 a53a1_8f.
         A53I2 a53a2fff. A53I2_11 a53a2_1f. A53I2_14 a53a2fff.
         A53I2_8 a53a2_8f. A53I3 a53a3fff. A53I3_11 a53b3_1f.
         A53I3_14 a53a3fff. A53I3_8 a53b3_8f. A53I4 a53a4fff.
         A53I4_11 a53a4_1f. A53I4_14 a53a4fff. A53I4_8 a53a4_8f.
         A53I5_11 a53a5_1f. A53I5_14 d75fffff. A53J1 a53a1fff.
         A53J1_11 a53a1_1f. A53J1_14 a53a1fff. A53J1_8 a53a1_8f.
         A53J2 a53a2fff. A53J2_11 a53a2_1f. A53J2_14 a53a2fff.
         A53J2_8 a53a2_8f. A53J3 a53a3fff. A53J3_11 a53b3_1f.
         A53J3_14 a53a3fff. A53J3_8 a53b3_8f. A53J4 a53a4fff.
         A53J4_11 a53a4_1f. A53J4_14 a53a4fff. A53J4_8 a53a4_8f.
         A53J5_11 a53a5_1f. A53J5_14 d75fffff. A53K1 a53a1fff.
         A53K1_8 a53a1_8f. A53K2 a53a2fff. A53K2_8 a53a2_8f.
         A53K3 a53a3fff. A53K3_8 a53b3_8f. A53K4 a53a4fff.
         A53K4_8 a53a4_8f. A53L1 a53a1fff. A53L1_8 a53a1_8f.
         A53L2 a53a2fff. A53L2_8 a53a2_8f. A53L3 a53a3fff.
         A53L3_8 a53b3_8f. A53L4 a53a4fff. A53L4_8 a53a4_8f.
         A540 a540ffff. A540_11 a540_11f. A540_14 a540ffff.
         A541 a541ffff. A541_11 a541_11f. A541_14 a541ffff.
         A541_8 a541_8ff. A542 a542ffff. A542_11 a542_11f.
         A542_14 a542ffff. A542_8 a542_8ff. A54A a54affff.
         A54A_11 a54a_11f. A54A_14 a54affff. A54A_8 a54a_8ff.
         A54B a54bffff. A54B_11 a54b_11f. A54B_14 a54bffff.
         A54B_8 a54b_8ff. B11 b11fffff. B11_11 b11_11ff.
         B11_14 b11fffff. B11_8 b11_8fff. B12 b11fffff.
         B121 b121ffff. B121_11 b121_11f. B121_14 b121ffff.
         B121_8 b121_8ff. B12_11 b11_11ff. B12_14 b11fffff.
         B12_8 b11_8fff. B21 b21fffff. B210_11 b210_11f.
         B210_14 b210_14f. B21_11 b21_11ff. B21_14 b21fffff.
         B21_8 b21_8fff. B22 b21fffff. B22_11 b21_11ff.
         B22_14 b21fffff. B22_8 b21_8fff. B23 b21fffff.
         B23_11 b21_11ff. B23_14 b21fffff. B23_8 b21_8fff.
         B24 b21fffff. B24_11 b21_11ff. B24_14 b21fffff.
         B24_8 b21_8fff. B25 b21fffff. B25_11 b21_11ff.
         B25_14 b21fffff. B25_8 b21_8fff. B26 b21fffff.
         B26_11 b21_11ff. B26_14 b21fffff. B26_8 b21_8fff.
         B27 b21fffff. B27_11 b21_11ff. B27_14 b21fffff.
         B27_8 b21_8fff. B28_11 b28_11ff. B28_14 b28_14ff.
         B29_11 b28_11ff. B29_14 b28_14ff. C11 c11fffff.
         C11_11 c11_11ff. C11_14 c11fffff. C11_8 c11_8fff.
         C12 c11fffff. C12_11 c11_11ff. C12_14 c11fffff.
         C12_8 c11_8fff. C13 c11fffff. C13_11 c11_11ff.
         C13_14 c11fffff. C13_8 c11_8fff. C14 c11fffff.
         C14_11 c11_11ff. C14_14 c11fffff. C14_8 c11_8fff.
         C15 c11fffff. C15_11 c11_11ff. C15_14 c11fffff.
         C15_8 c11_8fff. C16 c16fffff. C16_11 c16_11ff.
         C16_14 c16fffff. C16_8 c16_8fff. C21A c11fffff.
         C21A_11 c11_11ff. C21A_14 c11fffff. C21A_8 c11_8fff.
         C21B c11fffff. C21B_11 c11_11ff. C21B_14 c11fffff.
         C21B_8 c11_8fff. C21C c11fffff. C21C_11 c11_11ff.
         C21C_14 c11fffff. C21C_8 c11_8fff. C22 c22fffff.
         C22_11 c22_11ff. C22_14 c22fffff. C22_8 c22_8fff.
         C31A c11fffff. C31A_11 c11_11ff. C31A_14 c11fffff.
         C31A_8 c11_8fff. C31B c11fffff. C31B_11 c11_11ff.
         C31B_14 c11fffff. C31B_8 c11_8fff. C31C c11fffff.
         C31C_11 c11_11ff. C31C_14 c11fffff. C31C_8 c11_8fff.
         C31D c31dffff. C31D_11 c31d_11f. C31D_14 c31dffff.
         C31D_8 c31d_8ff. C31E c11fffff. C31E_11 c11_11ff.
         C31E_14 c11fffff. C31E_8 c11_8fff. C32 c11fffff.
         C32_11 c32_11ff. C32_14 c11fffff. C32_8 c32_8fff.
         C41A c11fffff. C41A_11 c11_11ff. C41A_14 c11fffff.
         C41A_8 c11_8fff. C41B c11fffff. C41B_11 c11_11ff.
         C41B_14 c11fffff. C41B_8 c11_8fff. C41C c11fffff.
         C41C_11 c11_11ff. C41C_14 c11fffff. C41C_8 c11_8fff.
         C51A c11fffff. C51A_11 c11_11ff. C51A_14 c11fffff.
         C51A_8 c11_8fff. C51B c11fffff. C51B_11 c11_11ff.
         C51B_14 c11fffff. C51B_8 c11_8fff. C52 c11fffff.
         C52X1_11 c11_11ff. C52X1_8 c11_8fff. C52X2_11 c11_11ff.
         C52X2_8 c11_8fff. C52_11 c11_11ff. C52_14 c11fffff.
         C52_8 c11_8fff. C53A c53affff. C53A_11 c53a_11f.
         C53A_14 c53affff. C53A_8 c53a_8ff. C53B c53affff.
         C53B_11 c53a_11f. C53B_14 c53affff. C53B_8 c53a_8ff.
         C53C c53affff. C53C_11 c53a_11f. C53C_14 c53affff.
         C53C_8 c53a_8ff. C54 c54fffff. C54_11 c54_11ff.
         C54_14 c54fffff. C54_8 c54_8fff. C55 c55fffff.
         C55_11 c55_11ff. C55_14 c55fffff. C55_8 c55_8fff.
         D1 d1ffffff. D101 d71fffff. D101_11 d91_11ff.
         D101_14 d71fffff. D101_8 d91_8fff. D102 a53a2fff.
         D102_11 a53a2_1f. D102_14 a53a2fff. D102_8 a53a2_8f.
         D103 a53a2fff. D103_11 a53a2_1f. D103_14 a53a2fff.
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
         D11A_8 d11a_8ff. D11B d11affff. D11BATDAY d11beddf.
         D11BATDAY1 d11beddf. D11BATDAY2 d11batdf. D11BATHFA d11wcfaf.
         D11BATHFU d11bathf. D11BEDDAY d11beddf. D11BEDRID d11bedrf.
         D11BEDSOR d11hypef. D11B_11 d11a_11f. D11B_14 d11affff.
         D11B_8 d11a_8ff. D11C d11affff. D11CANCER d11hypef.
         D11CARCST d11medcf. D11CARGIV d11cargf. D11CARPAY d11carpf.
         D11CONDAY d11beddf. D11CONDAY1 d11batdf. D11CONDAY2 d11batdf.
         D11CONTFU d11contf. D11CVD d11hypef. D11C_11 d11a_11f.
         D11C_14 d11affff. D11C_8 d11a_8ff. D11D d11affff.
         D11D21B d11d21bf. D11DEMENT d11hypef. D11DIABET d11hypef.
         D11DIDAY1 d11didaf. D11DIDAY2 d11didaf. D11DIDAY3 d11didaf.
         D11DIRCST d11medcf. D11DIRDAY d11yr1ff. D11DISEA1 d11disef.
         D11DISEA2 d11disef. D11DISEA3 d11disef. D11DOCTOR d11doctf.
         D11DPLACE d11dplaf. D11DREAM d11dreaf. D11DREDAY d11beddf.
         D11DREDAY1 d11batdf. D11DREDAY2 d11batdf. D11DRESFU d11bathf.
         D11DRINK d11doctf. D11DRKMCH d11mon1f. D11D_11 d11a_11f.
         D11D_14 d11affff. D11D_8 d11a_8ff. D11E d11affff.
         D11E_11 d11a_11f. D11E_14 d11affff. D11E_8 d11a_8ff.
         D11F d11affff. D11FEEDAY d11beddf. D11FEEDAY1 d11batdf.
         D11FEEDAY2 d11batdf. D11FEEDFU d11bathf. D11FINANC d11finaf.
         D11FULLDA d11beddf. D11F_11 d11a_11f. D11F_14 d11affff.
         D11F_8 d11a_8ff. D11G d11affff. D11G102 d11g102f.
         D11G106 d11a535f. D11G1061 d11g106f. D11G1062 d11g106_1f.
         D11G1063 d11g106_2f. D11G23 d11g23ff. D11G24 d11a535f.
         D11G24A d11illff. D11G25 d11a535f. D11G25A d11illff.
         D11G4 d11g4fff. D11G4A d11g4aff. D11G4B d11g4bff.
         D11GASTRI d11hypef. D11GENER d11genef. D11GLAUCO d11hypef.
         D11GYNECO d11hypef. D11G_11 d11a_11f. D11G_14 d11affff.
         D11G_8 d11a_8ff. D11H d11affff. D11HEART d11hypef.
         D11HEATER d11wcfaf. D11HYPERT d11hypef. D11H_11 d11a_11f.
         D11H_14 d11affff. D11H_8 d11a_8ff. D11ILL d11illff.
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
         D11YR1 d11yr1ff. D12 d12fffff. D12_11 a54b_11f.
         D12_14 d12fffff. D12_8 a54b_8ff. D14A533 d14a533f.
         D14A535 d14a535f. D14A536 d14a535f. D14A537 d14a537f.
         D14ADVDIR d14doctf. D14AGE d14vyeaf. D14ARTHRI d14hypef.
         D14BATHFA d14wcfaf. D14BATHFU d14bathf. D14BEDRID d14bedrf.
         D14BEDSOR d14hypef. D14CANCER d14hypef. D14CARGIV d14cargf.
         D14CARPAY d14carpf. D14CONTFU d14contf. D14CVD d14hypef.
         D14D21B d14d21bf. D14D22 d14marr_1f. D14D26A1 d14d26af.
         D14D26A2 d14d26a_1f. D14D26A6 d14d26a_2f. D14D26B1 d14d26af.
         D14D26B2 d14d26a_1f. D14D26B6 d14d26a_2f. D14D26C1 d14d26af.
         D14D26C2 d14d26a_1f. D14D26C6 d14d26a_2f. D14D26D1 d14d26af.
         D14D26D2 d14d26a_1f. D14D26D6 d14d26a_2f. D14D26E1 d14d26af.
         D14D26E2 d14d26a_1f. D14D26E6 d14d26a_2f. D14D26F1 d14d26af.
         D14D26F2 d14d26a_1f. D14D26F6 d14d26a_2f. D14D26G1 d14d26af.
         D14D26G2 d14d26a_1f. D14D26G6 d14d26a_2f. D14D26H1 d14d26af.
         D14D26H2 d14d26a_1f. D14D26H6 d14d26a_2f. D14D26I1 d14d26af.
         D14D26I2 d14d26a_1f. D14D26I6 d14d26a_2f. D14D26J1 d14d26af.
         D14D26J2 d14d26a_1f. D14D26J6 d14d26a_2f. D14D45 d14g106f.
         D14DEMENT d14hypef. D14DIABET d14hypef. D14DIRDAY d14dirdf.
         D14DOCTOR d14doctf. D14DPLACE d14dplaf. D14DREAM d14dreaf.
         D14DRESFU d14dresf. D14DRINK d14doctf. D14FEEDFU d14dresf.
         D14G102 d14g102f. D14G106 d14g106f. D14G1061 d14g106_1f.
         D14G1062 d14g106_2f. D14G1063 d14g106_3f. D14G24 d14a535f.
         D14G24A d14illff. D14G25 d14a535f. D14G25A d14illff.
         D14G4 d14g4fff. D14G4A d14g4aff. D14G4B d14g4bff.
         D14GASTRI d14hypef. D14GENER d14genef. D14GLAUCO d14hypef.
         D14GYNECO d14hypef. D14HEART d14hypef. D14HEATER d14wcfaf.
         D14HYPERT d14hypef. D14ILL d14illff. D14KNDDRK d14knddf.
         D14LICDOC d14licdf. D14LIVARR d14livaf. D14MARRY d14marrf.
         D14MARRY1 d14marr_1f. D14MOVEFU d14bathf. D14NEUROS d14hypef.
         D14OTHERS d14hypef. D14OUTDOR d14outdf. D14PAIN d14painf.
         D14PARKIN d14hypef. D14PERSON d14vdayf. D14PHONE d14tapwf.
         D14PNEUM d14hypef. D14PROSTA d14hypef. D14PSYCHO d14hypef.
         D14SMKTIM d14d26a_2f. D14SMOKE d14smokf. D14TAPWAT d14tapwf.
         D14TOILFU d14dresf. D14TUBERC d14hypef. D14TVSET d14tapwf.
         D14UNCONS d14doctf. D14VDAY d14vdayf. D14VMONTH d14vyeaf.
         D14VYEAR d14vyeaf. D14WASHMA d14tapwf. D14WCFACI d14wcfaf.
         D1_11 d1_11fff. D1_14 d1ffffff. D1_8 d1_8ffff.
         D2 a54bffff. D2_11 a54b_11f. D2_8 a54b_8ff.
         D31 d31fffff. D31_11 d31_11ff. D31_14 d31fffff.
         D31_8 d31_8fff. D32 d31fffff. D32_11 d32_11ff.
         D32_14 d31fffff. D32_8 d32_8fff. D33_11 d33_11ff.
         D33_14 d33_14ff. D33_8 d33_8fff. D34_11 d34_11ff.
         D34_14 d34_14ff. D34_8 d34_8fff. D4ALGA1_11 d4meat2_2f.
         D4ALGA1_14 d4milk1f. D4ALGA1_8 d4meat2_1f. D4ALGA2_11 d4meat2_2f.
         D4ALGA2_14 d4milk1f. D4ALGA2_8 d4meat2_1f. D4A_14 d4a_14ff.
         D4BEAN1 d4meat1f. D4BEAN1_11 d4meat2_2f. D4BEAN1_14 d4meat1f.
         D4BEAN1_8 d4meat2_1f. D4BEAN2 d4meat2f. D4BEAN2_11 d4meat2_2f.
         D4BEAN2_14 d4meat2f. D4BEAN2_8 d4meat2_1f. D4B_14 d4b_14ff.
         D4DRUG1_11 d4drug1_1f. D4DRUG1_14 d4drug1_2f. D4DRUG1_8 d4drug1f.
         D4DRUG2_11 d4drug1_1f. D4DRUG2_14 d4drug1_2f. D4DRUG2_8 d4drug1f.
         D4EGG1 d4meat1f. D4EGG1_11 d4meat2_2f. D4EGG1_14 d4meat1f.
         D4EGG1_8 d4meat2_1f. D4EGG2 d4meat2f. D4EGG2_11 d4meat2_2f.
         D4EGG2_14 d4meat2f. D4EGG2_8 d4meat2_1f. D4FISH1 d4meat1f.
         D4FISH1_11 d4meat2_2f. D4FISH1_14 d4meat1f. D4FISH1_8 d4meat2_1f.
         D4FISH2 d4meat2f. D4FISH2_11 d4meat2_2f. D4FISH2_14 d4meat2f.
         D4FISH2_8 d4meat2_1f. D4GARL1 d4meat1f. D4GARL1_11 d4meat2_2f.
         D4GARL1_14 d4meat1f. D4GARL1_8 d4meat2_1f. D4GARL2 d4meat2f.
         D4GARL2_11 d4meat2_2f. D4GARL2_14 d4meat2f. D4GARL2_8 d4meat2_1f.
         D4MEAT1 d4meat1f. D4MEAT1_11 d4meat2_2f. D4MEAT1_14 d4meat1f.
         D4MEAT1_8 d4meat2_1f. D4MEAT2 d4meat2f. D4MEAT2_11 d4meat2_2f.
         D4MEAT2_14 d4meat2f. D4MEAT2_8 d4meat2_1f. D4MILK1_11 d4meat2_2f.
         D4MILK1_14 d4milk1f. D4MILK1_8 d4meat2_1f. D4MILK2_11 d4meat2_2f.
         D4MILK2_14 d4milk1f. D4MILK2_8 d4meat2_1f. D4NUT1_11 d4meat2_2f.
         D4NUT1_14 d4milk1f. D4NUT1_8 d4meat2_1f. D4NUT2_11 d4meat2_2f.
         D4NUT2_14 d4milk1f. D4NUT2_8 d4meat2_1f. D4SUGA1 d4meat1f.
         D4SUGA1_11 d4meat2_2f. D4SUGA1_14 d4meat1f. D4SUGA1_8 d4meat2_1f.
         D4SUGA2 d4meat2f. D4SUGA2_11 d4meat2_2f. D4SUGA2_14 d4meat2f.
         D4SUGA2_8 d4meat2_1f. D4TEA1 d4meat1f. D4TEA1_11 d4meat2_2f.
         D4TEA1_14 d4meat1f. D4TEA1_8 d4meat2_1f. D4TEA2 d4meat2f.
         D4TEA2_11 d4meat2_2f. D4TEA2_14 d4meat2f. D4TEA2_8 d4meat2_1f.
         D4VEG1 d4meat1f. D4VEG1_11 d4meat2_2f. D4VEG1_14 d4meat1f.
         D4VEG1_8 d4meat2_1f. D4VEG2 d4meat2f. D4VEG2_11 d4meat2_2f.
         D4VEG2_14 d4meat2f. D4VEG2_8 d4meat2_1f. D4VIT1_11 d4meat2_2f.
         D4VIT1_14 d4milk1f. D4VIT1_8 d4meat2_1f. D4VIT2_11 d4meat2_2f.
         D4VIT2_14 d4milk1f. D4VIT2_8 d4meat2_1f. D5 d5ffffff.
         D5_11 d5_11fff. D5_14 d5ffffff. D5_8 d5_8ffff.
         D6A d6afffff. D6A_11 d6a_11ff. D6A_14 d6afffff.
         D6A_8 d6a_8fff. D6B d6afffff. D6B_11 d6a_11ff.
         D6B_14 d6afffff. D6B_8 d6a_8fff. D6C d6cfffff.
         D6C_11 d6a_11ff. D6C_14 d6cfffff. D6C_8 d6a_8fff.
         D71 d71fffff. D710A_11 d78a_11f. D710A_14 e66fffff.
         D710B_11 d78a_11f. D710B_14 e66fffff. D710_11 a535_11f.
         D710_14 f151ffff. D71_11 d71_11ff. D71_14 d71fffff.
         D71_8 d71_8fff. D72 d71fffff. D72_11 d71_11ff.
         D72_14 d71fffff. D72_8 d71_8fff. D73 a53a2fff.
         D73_11 a53a2_1f. D73_14 a53a2fff. D73_8 a53a2_8f.
         D74 a53a2fff. D74_11 a53a2_1f. D74_14 a53a2fff.
         D74_8 a53a2_8f. D75 d75fffff. D75_11 a53a5_1f.
         D75_14 d75fffff. D75_8 d75_8fff. D76_11 d76_11ff.
         D76_14 d76_14ff. D77_11 d77_11ff. D77_14 d77_14ff.
         D78A_11 d78a_11f. D78A_14 e66fffff. D78B_11 d78a_11f.
         D78B_14 e66fffff. D78_11 a535_11f. D78_14 f151ffff.
         D79A_11 d78a_11f. D79A_14 e66fffff. D79B_11 d78a_11f.
         D79B_14 e66fffff. D79_11 a535_11f. D79_14 f151ffff.
         D81 d71fffff. D81_11 d71_11ff. D81_14 d71fffff.
         D81_8 d71_8fff. D82 d71fffff. D82_11 d71_11ff.
         D82_14 d71fffff. D82_8 d71_8fff. D83 a53a2fff.
         D83_11 a53a2_1f. D83_14 a53a2fff. D83_8 a53a2_8f.
         D84 a53a2fff. D84_11 a53a2_1f. D84_14 a53a2fff.
         D84_8 a53a2_8f. D85 d85fffff. D85_11 d85_11ff.
         D85_14 d85fffff. D85_8 d85_8fff. D86 d75fffff.
         D86_11 a53a5_1f. D86_14 d75fffff. D86_8 d75_8fff.
         D87_11 a535_11f. D87_14 f151ffff. D8ACTDAY d8batdaf.
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
         D91_14 d71fffff. D91_8 d91_8fff. D92 d71fffff.
         D92_11 d91_11ff. D92_14 d71fffff. D92_8 d91_8fff.
         D93 a53a2fff. D93_11 a53a2_1f. D93_14 a53a2fff.
         D93_8 a53a2_8f. D94 a53a2fff. D94_11 a53a2_1f.
         D94_14 a53a2fff. D94_8 a53a2_8f. DAYIN_11 monthinf.
         DAY_8 month_8f. DTH05_08 dth05_0f. DTH08_11 dth08_1f.
         DTH11_14 dth11_1f. E0_11 e0_11fff. E0_14 e0_14fff.
         E1 e1ffffff. E10 e7ffffff. E10_11 e7_11fff.
         E10_14 e7ffffff. E10_8 e7_8ffff. E11 e7ffffff.
         E11_11 e7_11fff. E11_14 e7ffffff. E11_8 e7_8ffff.
         E12 e7ffffff. E12_11 e7_11fff. E12_14 e7ffffff.
         E12_8 e7_8ffff. E13 e7ffffff. E13_11 e7_11fff.
         E13_14 e7ffffff. E13_8 e7_8ffff. E14 e7ffffff.
         E14_11 e7_11fff. E14_14 e7ffffff. E14_8 e7_8ffff.
         E1B e1bfffff. E1B_11 e1b_11ff. E1B_14 e1bfffff.
         E1B_8 e1b_8fff. E1_11 e1_11fff. E1_14 e1ffffff.
         E1_8 e1_8ffff. E2 e2ffffff. E2B e1bfffff.
         E2B_11 e1b_11ff. E2B_14 e1bfffff. E2B_8 e1b_8fff.
         E2_11 e2_11fff. E2_14 e2ffffff. E2_8 e2_8ffff.
         E3 e3ffffff. E3B e1bfffff. E3B_11 e1b_11ff.
         E3B_14 e1bfffff. E3B_8 e1b_8fff. E3_11 e3_11fff.
         E3_14 e3ffffff. E3_8 e3_8ffff. E4 e4ffffff.
         E4B e1bfffff. E4B_11 e1b_11ff. E4B_14 e1bfffff.
         E4B_8 e1b_8fff. E4_11 e4_11fff. E4_14 e4ffffff.
         E4_8 e4_8ffff. E5 e5ffffff. E5B e1bfffff.
         E5B_11 e1b_11ff. E5B_14 e1bfffff. E5B_8 e1b_8fff.
         E5_11 e5_11fff. E5_14 e5ffffff. E5_8 e5_8ffff.
         E6 e6ffffff. E610 e610ffff. E610_11 e610_11f.
         E610_14 e610ffff. E610_8 e610_8ff. E62 e62fffff.
         E62_11 e62_11ff. E62_14 e62fffff. E62_8 e62_8fff.
         E63 e63fffff. E63_11 e63_11ff. E63_14 e63fffff.
         E63_8 e63_8fff. E64 e64fffff. E64_11 e64_11ff.
         E64_14 e64fffff. E64_8 e64_8fff. E65 e65fffff.
         E65_11 e65_11ff. E65_14 e65fffff. E65_8 e65_8fff.
         E66 e66fffff. E67 e67fffff. E67_11 e67_11ff.
         E67_14 e67fffff. E67_8 e67_8fff. E6B e1bfffff.
         E6B_11 e6b_11ff. E6B_14 e1bfffff. E6B_8 e6b_8fff.
         E6_11 e6_11fff. E6_14 e6ffffff. E6_8 e6_8ffff.
         E7 e7ffffff. E7_11 e7_11fff. E7_14 e7ffffff.
         E7_8 e7_8ffff. E8 e7ffffff. E8_11 e7_11fff.
         E8_14 e7ffffff. E8_8 e7_8ffff. E9 e7ffffff.
         E9_11 e7_11fff. E9_14 e7ffffff. E9_8 e7_8ffff.
         F1 a54bffff. F10 a54bffff. F101 d75fffff.
         F101_11 a53a5_1f. F101_14 d75fffff. F101_8 d75_8fff.
         F102 d75fffff. F102_11 a53a5_1f. F102_14 d75fffff.
         F102_8 d75_8fff. F1030A_11 a535_11f. F1030B1_11 f901b1_f.
         F1030B2_11 f901b1_f. F1030B3_11 f901b1_f. F1030_11 f41a12_f.
         F1031A_11 a535_11f. F1031B1_11 f901b1_f. F1031B2_11 f901b1_f.
         F1031B3_11 f1031b3f. F1031_11 f41a12_f. F1032_11 f1032_1f.
         F1033_11 f1033_1f. F103A1 f92a2fff. F103A1_11 a53a3_1f.
         F103A1_14 f92a2fff. F103A1_8 a53a3_8f. F103A2 f103a8ff.
         F103A2_11 f103a2__1f. F103A2_14 f103a8ff. F103A2_8 f103a2_f.
         F103A3 a53a2fff. F103A3_11 a53a5_1f. F103A3_14 a53a2fff.
         F103A3_8 d75_8fff. F103A4 a532ffff. F103A4_11 f92a3_1f.
         F103A4_14 a532ffff. F103A4_8 f92a3_8f. F103A5 f103a5ff.
         F103A5_11 f103a5__1f. F103A5_14 f103a5ff. F103A5_8 f103a5_f.
         F103A6 d75fffff. F103A7 a532ffff. F103A7_11 f92a3_1f.
         F103A7_14 a532ffff. F103A7_8 f92a3_8f. F103A8 f103a8ff.
         F103A8_11 f92a3_1f. F103A8_14 f103a8ff. F103A8_8 f92a3_8f.
         F103B1 f92a2fff. F103B1_11 a53a3_1f. F103B1_14 f92a2fff.
         F103B1_8 a53a3_8f. F103B2 f103a8ff. F103B2_11 f103a2__1f.
         F103B2_14 f103a8ff. F103B2_8 f103a2_f. F103B3 a53a2fff.
         F103B3_11 a53a5_1f. F103B3_14 a53a2fff. F103B3_8 d75_8fff.
         F103B4 a532ffff. F103B4_11 f92a3_1f. F103B4_14 a532ffff.
         F103B4_8 f92a3_8f. F103B5 f103a5ff. F103B5_11 f103a5__1f.
         F103B5_14 f103a5ff. F103B5_8 f103a5_f. F103B6 d75fffff.
         F103B7 a532ffff. F103B7_11 f92a3_1f. F103B7_14 a532ffff.
         F103B7_8 f92a3_8f. F103B8 f103a8ff. F103B8_11 f92a3_1f.
         F103B8_14 f103a8ff. F103B8_8 f92a3_8f. F103C1 f92a2fff.
         F103C1_11 a53a3_1f. F103C1_14 f92a2fff. F103C1_8 a53a3_8f.
         F103C2 f103a8ff. F103C2_11 f103a2__1f. F103C2_14 f103a8ff.
         F103C2_8 f103a2_f. F103C3 a53a2fff. F103C3_11 a53a5_1f.
         F103C3_14 a53a2fff. F103C3_8 d75_8fff. F103C4 a532ffff.
         F103C4_11 f92a3_1f. F103C4_14 a532ffff. F103C4_8 f92a3_8f.
         F103C5 f103a5ff. F103C5_11 f103a5__1f. F103C5_14 f103a5ff.
         F103C5_8 f103a5_f. F103C6 d75fffff. F103C7 a532ffff.
         F103C7_11 f92a3_1f. F103C7_14 a532ffff. F103C7_8 f92a3_8f.
         F103C8 f103a8ff. F103C8_11 f92a3_1f. F103C8_14 f103a8ff.
         F103C8_8 f92a3_8f. F103D1 f92a2fff. F103D1_11 a53a3_1f.
         F103D1_14 f92a2fff. F103D1_8 a53a3_8f. F103D2 f103a8ff.
         F103D2_11 f103a2__1f. F103D2_14 f103a8ff. F103D2_8 f103a2_f.
         F103D3 a53a2fff. F103D3_11 a53a5_1f. F103D3_14 a53a2fff.
         F103D3_8 d75_8fff. F103D4 a532ffff. F103D4_11 f92a3_1f.
         F103D4_14 a532ffff. F103D4_8 f92a3_8f. F103D5 f103a5ff.
         F103D5_11 f103a5__1f. F103D5_14 f103a5ff. F103D5_8 f103a5_f.
         F103D6 d75fffff. F103D7 a532ffff. F103D7_11 f92a3_1f.
         F103D7_14 a532ffff. F103D7_8 f92a3_8f. F103D8 f103a8ff.
         F103D8_11 f92a3_1f. F103D8_14 f103a8ff. F103D8_8 f92a3_8f.
         F103E1 f92a2fff. F103E1_11 a53a3_1f. F103E1_14 f92a2fff.
         F103E1_8 a53a3_8f. F103E2 f103a8ff. F103E2_11 f103a2__1f.
         F103E2_14 f103a8ff. F103E2_8 f103a2_f. F103E3 a53a2fff.
         F103E3_11 a53a5_1f. F103E3_14 a53a2fff. F103E3_8 d75_8fff.
         F103E4 a532ffff. F103E4_11 f92a3_1f. F103E4_14 a532ffff.
         F103E4_8 f92a3_8f. F103E5 f103a5ff. F103E5_11 f103a5__1f.
         F103E5_14 f103a5ff. F103E5_8 f103a5_f. F103E6 d75fffff.
         F103E7 a532ffff. F103E7_11 f92a3_1f. F103E7_14 a532ffff.
         F103E7_8 f92a3_8f. F103E8 f103a8ff. F103E8_11 f92a3_1f.
         F103E8_14 f103a8ff. F103E8_8 f92a3_8f. F103F1 f92a2fff.
         F103F1_11 a53a3_1f. F103F1_14 f92a2fff. F103F1_8 a53a3_8f.
         F103F2 f103a8ff. F103F2_11 f103a2__1f. F103F2_14 f103a8ff.
         F103F2_8 f103a2_f. F103F3 a53a2fff. F103F3_11 a53a5_1f.
         F103F3_14 a53a2fff. F103F3_8 d75_8fff. F103F4 a532ffff.
         F103F4_11 f92a3_1f. F103F4_14 a532ffff. F103F4_8 f92a3_8f.
         F103F5 f103a5ff. F103F5_11 f103a5__1f. F103F5_14 f103a5ff.
         F103F5_8 f103a5_f. F103F6 d75fffff. F103F7 a532ffff.
         F103F7_11 f92a3_1f. F103F7_14 a532ffff. F103F7_8 f92a3_8f.
         F103F8 f103a8ff. F103F8_11 f92a3_1f. F103F8_14 f103a8ff.
         F103F8_8 f92a3_8f. F103G1 f92a2fff. F103G1_11 a53a3_1f.
         F103G1_14 f92a2fff. F103G1_8 a53a3_8f. F103G2 f103a8ff.
         F103G2_11 f103a2__1f. F103G2_14 f103a8ff. F103G2_8 f103a2_f.
         F103G3 a53a2fff. F103G3_11 a53a5_1f. F103G3_14 a53a2fff.
         F103G3_8 d75_8fff. F103G4 a532ffff. F103G4_11 f92a3_1f.
         F103G4_14 a532ffff. F103G4_8 f92a3_8f. F103G5 f103a5ff.
         F103G5_11 f103a5__1f. F103G5_14 f103a5ff. F103G5_8 f103a5_f.
         F103G6 d75fffff. F103G7 a532ffff. F103G7_11 f92a3_1f.
         F103G7_14 a532ffff. F103G7_8 f92a3_8f. F103G8 f103a8ff.
         F103G8_11 f92a3_1f. F103G8_14 f103a8ff. F103G8_8 f92a3_8f.
         F103H1 f92a2fff. F103H1_11 a53a3_1f. F103H1_14 f92a2fff.
         F103H1_8 a53a3_8f. F103H2 f103a8ff. F103H2_11 f103a2__1f.
         F103H2_14 f103a8ff. F103H2_8 f103a2_f. F103H3 a53a2fff.
         F103H3_11 a53a5_1f. F103H3_14 a53a2fff. F103H3_8 d75_8fff.
         F103H4 a532ffff. F103H4_11 f92a3_1f. F103H4_14 a532ffff.
         F103H4_8 f92a3_8f. F103H5 f103a5ff. F103H5_11 f103a5__1f.
         F103H5_14 f103a5ff. F103H5_8 f103a5_f. F103H6 d75fffff.
         F103H7 a532ffff. F103H7_11 f92a3_1f. F103H7_14 a532ffff.
         F103H7_8 f92a3_8f. F103H8 f103a8ff. F103H8_11 f92a3_1f.
         F103H8_14 f103a8ff. F103H8_8 f92a3_8f. F103I1 f92a2fff.
         F103I1_11 a53a3_1f. F103I1_14 f92a2fff. F103I1_8 a53a3_8f.
         F103I2 f103a8ff. F103I2_11 f103a2__1f. F103I2_14 f103a8ff.
         F103I2_8 f103a2_f. F103I3 a53a2fff. F103I3_11 a53a5_1f.
         F103I3_14 a53a2fff. F103I3_8 d75_8fff. F103I4 a532ffff.
         F103I4_11 f92a3_1f. F103I4_14 a532ffff. F103I4_8 f92a3_8f.
         F103I5 f103a5ff. F103I5_11 f103a5__1f. F103I5_14 f103a5ff.
         F103I5_8 f103a5_f. F103I6 d75fffff. F103I7 a532ffff.
         F103I7_11 f92a3_1f. F103I7_14 a532ffff. F103I7_8 f92a3_8f.
         F103I8 f103a8ff. F103I8_11 f92a3_1f. F103I8_14 f103a8ff.
         F103I8_8 f92a3_8f. F103J1 f92a2fff. F103J1_11 a53a3_1f.
         F103J1_14 f92a2fff. F103J1_8 a53a3_8f. F103J2 f103a8ff.
         F103J2_11 f103a2__1f. F103J2_14 f103a8ff. F103J2_8 f103a2_f.
         F103J3 a53a2fff. F103J3_11 a53a5_1f. F103J3_14 a53a2fff.
         F103J3_8 d75_8fff. F103J4 a532ffff. F103J4_11 f92a3_1f.
         F103J4_14 a532ffff. F103J4_8 f92a3_8f. F103J5 f103a5ff.
         F103J5_11 f103a5__1f. F103J5_14 f103a5ff. F103J5_8 f103a5_f.
         F103J6 f103j6ff. F103J7 a532ffff. F103J7_11 f92a3_1f.
         F103J7_14 a532ffff. F103J7_8 f92a3_8f. F103J8 f103a8ff.
         F103J8_11 f92a3_1f. F103J8_14 f103a8ff. F103J8_8 f92a3_8f.
         F103K1 f92a2fff. F103K1_11 a53a3_1f. F103K1_14 f92a2fff.
         F103K1_8 a53a3_8f. F103K2 f103a8ff. F103K2_11 f103a2__1f.
         F103K2_14 f103a8ff. F103K2_8 f103a2_f. F103K3 a53a2fff.
         F103K3_11 a53a5_1f. F103K3_14 a53a2fff. F103K3_8 d75_8fff.
         F103K4 a532ffff. F103K4_11 f92a3_1f. F103K4_14 a532ffff.
         F103K4_8 f92a3_8f. F103K5 f103a5ff. F103K5_11 f103a5__1f.
         F103K5_14 f103a5ff. F103K5_8 f103a5_f. F103K6 d75fffff.
         F103K7 a532ffff. F103K7_11 f92a3_1f. F103K7_14 a532ffff.
         F103K7_8 f92a3_8f. F103K8 f103a8ff. F103K8_11 f92a3_1f.
         F103K8_14 f103a8ff. F103K8_8 f92a3_8f. F103L1 f92a2fff.
         F103L1_11 a53a3_1f. F103L1_14 f92a2fff. F103L1_8 a53a3_8f.
         F103L2 f103a8ff. F103L2_11 f103a2__1f. F103L2_14 f103a8ff.
         F103L2_8 f103a2_f. F103L3 a53a2fff. F103L3_11 a53a5_1f.
         F103L3_14 a53a2fff. F103L3_8 d75_8fff. F103L4 a532ffff.
         F103L4_11 f92a3_1f. F103L4_14 a532ffff. F103L4_8 f92a3_8f.
         F103L5 f103a5ff. F103L5_11 f103a5__1f. F103L5_14 f103a5ff.
         F103L5_8 f103a5_f. F103L6 f103j6ff. F103L7 a532ffff.
         F103L7_11 f92a3_1f. F103L7_14 a532ffff. F103L7_8 f92a3_8f.
         F103L8 f103a8ff. F103L8_11 f92a3_1f. F103L8_14 f103a8ff.
         F103L8_8 f92a3_8f. F103M1 f92a2fff. F103M1_11 a53a3_1f.
         F103M1_14 f92a2fff. F103M1_8 a53a3_8f. F103M2 f103a8ff.
         F103M2_11 f103a2__1f. F103M2_14 f103a8ff. F103M2_8 f103a2_f.
         F103M3 a53a2fff. F103M3_11 a53a5_1f. F103M3_14 a53a2fff.
         F103M3_8 d75_8fff. F103M4 a532ffff. F103M4_11 f92a3_1f.
         F103M4_14 a532ffff. F103M4_8 f92a3_8f. F103M5 f103a5ff.
         F103M5_11 f103a5__1f. F103M5_14 f103a5ff. F103M5_8 f103a5_f.
         F103M6 d75fffff. F103M7 a532ffff. F103M7_11 f92a3_1f.
         F103M7_14 a532ffff. F103M7_8 f92a3_8f. F103M8 f103a8ff.
         F103M8_11 f92a3_1f. F103M8_14 f103a8ff. F103M8_8 f92a3_8f.
         F103_11 a54b_11f. F103_8 a54b_8ff. F104 a53a2fff.
         F104_14 a53a2fff. F105 a53a2fff. F105_14 a53a2fff.
         F10A a54bffff. F10A_11 a54b_11f. F10A_14 a54bffff.
         F10A_8 a54b_8ff. F10_11 a54b_11f. F10_14 a54bffff.
         F10_8 a54b_8ff. F111A f111afff. F111A_11 f111a_1f.
         F111A_14 f111afff. F111A_8 f111a_8f. F111B f111bfff.
         F111B_11 f111a_1f. F111B_14 f111bfff. F111B_8 f111a_8f.
         F111C f111bfff. F111C_11 f111a_1f. F111C_14 f111bfff.
         F111C_8 f111a_8f. F112A f111afff. F112A_11 f111a_1f.
         F112A_14 f111afff. F112A_8 f111a_8f. F112B f111bfff.
         F112B_11 f111a_1f. F112B_14 f111bfff. F112B_8 f111a_8f.
         F112C f111bfff. F112C_11 f111a_1f. F112C_14 f111bfff.
         F112C_8 f111a_8f. F113A f111afff. F113A_11 f111a_1f.
         F113A_14 f111afff. F113A_8 f111a_8f. F113B f111bfff.
         F113B_11 f111a_1f. F113B_14 f111bfff. F113B_8 f111a_8f.
         F113C f111bfff. F113C_11 f111a_1f. F113C_14 f111bfff.
         F113C_8 f111a_8f. F12A f12affff. F12A_11 f12a_11f.
         F12A_14 f12affff. F12A_8 f12a_8ff. F12B f12affff.
         F12B_11 f12a_11f. F12B_14 f12affff. F12B_8 f12a_8ff.
         F12C f12affff. F12C_11 f12a_11f. F12C_14 f12affff.
         F12C_8 f12a_8ff. F13A f12affff. F13A_11 f12a_11f.
         F13A_14 f12affff. F13A_8 f12a_8ff. F13B f12affff.
         F13B_11 f12a_11f. F13B_14 f12affff. F13B_8 f12a_8ff.
         F13C f12affff. F13C_11 f12a_11f. F13C_14 f12affff.
         F13C_8 f12a_8ff. F141 f141ffff. F141_11 f141_11f.
         F141_14 f141ffff. F141_8 f141_8ff. F142 f141ffff.
         F142_11 f141_11f. F142_14 f141ffff. F142_8 f141_8ff.
         F143 f141ffff. F143_11 f141_11f. F143_14 f141ffff.
         F143_8 f141_8ff. F144 f141ffff. F144_11 f141_11f.
         F144_14 f141ffff. F144_8 f141_8ff. F145 f141ffff.
         F145_11 f141_11f. F145_14 f141ffff. F145_8 f141_8ff.
         F146 f141ffff. F146_11 f141_11f. F146_14 f141ffff.
         F146_8 f141_8ff. F147 f141ffff. F147_11 f141_11f.
         F147_14 f141ffff. F147_8 f141_8ff. F148 f141ffff.
         F148_11 f141_11f. F148_14 f141ffff. F148_8 f141_8ff.
         F149 f141ffff. F149_11 f141_11f. F149_14 f141ffff.
         F149_8 f141_8ff. F151 f151ffff. F151_11 b28_11ff.
         F151_14 f151ffff. F151_8 f151_8ff. F152 f151ffff.
         F152_11 b28_11ff. F152_14 f151ffff. F152_8 f151_8ff.
         F153 f151ffff. F153_11 b28_11ff. F153_14 f151ffff.
         F153_8 f151_8ff. F154 f151ffff. F154_11 b28_11ff.
         F154_14 f151ffff. F154_8 f151_8ff. F155 f151ffff.
         F155_11 b28_11ff. F155_14 f151ffff. F155_8 f151_8ff.
         F156 f151ffff. F156_11 b28_11ff. F156_14 f151ffff.
         F156_8 f151_8ff. F157 f151ffff. F157_11 b28_11ff.
         F157_14 f151ffff. F157_8 f151_8ff. F158 f151ffff.
         F158_11 b28_11ff. F158_14 f151ffff. F158_8 f151_8ff.
         F159 f151ffff. F159_11 b28_11ff. F159_14 f151ffff.
         F159_8 f151_8ff. F16 f16fffff. F16_11 f16_11ff.
         F16_14 f16fffff. F16_8 f16_8fff. F1_14 a54bffff.
         F1_8 a54b_8ff. F2 f2ffffff. F21 f21fffff.
         F211 f211ffff. F211_11 f21_11ff. F211_14 f211ffff.
         F211_8 f21_8fff. F21_11 f21_11ff. F21_14 f21fffff.
         F21_8 f21_8fff. F22 e1bfffff. F221_11 f221_11f.
         F221_14 f221_14f. F22_11 a541_11f. F22_14 e1bfffff.
         F22_8 a541_8ff. F23 a532ffff. F23_11 f23_11ff.
         F23_14 a532ffff. F23_8 f23_8fff. F24_11 a535_11f.
         F24_14 f151ffff. F251_11 f251_11f. F252_11 f251_11f.
         F25A1_14 f25a1_1f. F25A2_14 f25a1_1f. F25B1_11 f25b1_1f.
         F25B1_14 e1bfffff. F25B2_11 d78a_11f. F25B2_14 e66fffff.
         F26_11 f25b1_1f. F26_14 f26_14ff. F27_11 f27_11ff.
         F27_14 f27_14ff. F2_14 f2ffffff. F2_8 f2_8ffff.
         F31 f31fffff. F31_11 f31_11ff. F31_14 f31fffff.
         F31_8 f31_8fff. F32A f31fffff. F32A_11 f31_11ff.
         F32A_14 f31fffff. F32A_8 f31_8fff. F32B f31fffff.
         F32B_11 f31_11ff. F32B_14 f31fffff. F32B_8 f31_8fff.
         F32C f31fffff. F32C_11 f31_11ff. F32C_14 f31fffff.
         F32C_8 f31_8fff. F32D f31fffff. F32D_11 f31_11ff.
         F32D_14 f31fffff. F32D_8 f31_8fff. F32E f31fffff.
         F32E_11 f31_11ff. F32E_14 f31fffff. F32E_8 f31_8fff.
         F33 d71fffff. F33_11 f23_11ff. F33_14 d71fffff.
         F33_8 f23_8fff. F34 f34fffff. F340 f340ffff.
         F340_11 f340_11f. F340_14 f340ffff. F340_8 f340_8ff.
         F34_11 f34_11ff. F34_14 f34_14ff. F34_8 f34_8fff.
         F35 f35fffff. F35_11 f35_11ff. F35_14 f35fffff.
         F35_8 f35_8fff. F41 f41fffff. F41A11_11 a534_11f.
         F41A11_14 a534_14f. F41A12_11 f41a12_f. F41A12_14 f41a12__1f.
         F41A1_11 a535_11f. F41A1_14 f151ffff. F41A21_11 a534_11f.
         F41A21_14 a534_14f. F41A22_11 f41a12_f. F41A22_14 f41a12__1f.
         F41A2_11 a535_11f. F41A2_14 f151ffff. F41A31_11 a534_11f.
         F41A31_14 a534_14f. F41A32_11 f41a12_f. F41A32_14 f41a12__1f.
         F41A3_11 a535_11f. F41A3_14 f151ffff. F41B1_11 a534_11f.
         F41B1_14 a534_14f. F41B2_11 f41a12_f. F41B2_14 f41a12__1f.
         F41B_11 a535_11f. F41B_14 f151ffff. F41_11 f41_11ff.
         F41_14 f41fffff. F41_8 f41_8fff. F42 d75fffff.
         F42_11 a53a5_1f. F42_14 d75fffff. F42_8 d75_8fff.
         F43A1 a53a2fff. F43A1_11 a53a2_1f. F43A1_14 a53a2fff.
         F43A1_8 a53a2_8f. F43A2 f43a2fff. F43A2_11 f43a2_1f.
         F43A2_14 f43a2fff. F43A2_8 f43a2_8f. F43A3 a53a2fff.
         F43A3_11 a53a2_1f. F43A3_14 a53a2fff. F43A3_8 a53a2_8f.
         F43A4 f43a4fff. F43A4_11 f43a4_1f. F43A4_14 f43a4fff.
         F43A4_8 f43a4_8f. F43B1 a53a2fff. F43B1_11 a53a2_1f.
         F43B1_14 a53a2fff. F43B1_8 a53a2_8f. F43B2 f43a2fff.
         F43B2_11 f43a2_1f. F43B2_14 f43a2fff. F43B2_8 f43a2_8f.
         F43B3 a53a2fff. F43B3_11 a53a2_1f. F43B3_14 a53a2fff.
         F43B3_8 a53a2_8f. F43B4 f43a4fff. F43B4_11 f43a4_1f.
         F43B4_14 f43a4fff. F43B4_8 f43a4_8f. F43C1 a53a2fff.
         F43C1_11 a53a2_1f. F43C1_14 a53a2fff. F43C1_8 a53a2_8f.
         F43C2 f43a2fff. F43C2_11 f43a2_1f. F43C2_14 f43a2fff.
         F43C2_8 f43a2_8f. F43C3 a53a2fff. F43C3_11 a53a2_1f.
         F43C3_14 a53a2fff. F43C3_8 a53a2_8f. F43C4 f43a4fff.
         F43C4_11 f43a4_1f. F43C4_14 f43a4fff. F43C4_8 f43a4_8f.
         F43D1 a53a2fff. F43D1_11 a53a2_1f. F43D1_14 a53a2fff.
         F43D1_8 a53a2_8f. F43D2 f43a2fff. F43D2_11 f43a2_1f.
         F43D2_14 f43a2fff. F43D2_8 f43a2_8f. F43D3 a53a2fff.
         F43D3_11 a53a2_1f. F43D3_14 a53a2fff. F43D3_8 a53a2_8f.
         F43D4 f43a4fff. F43D4_11 f43a4_1f. F43D4_14 f43a4fff.
         F43D4_8 f43a4_8f. F44 d75fffff. F44_11 a53a5_1f.
         F44_14 d75fffff. F44_8 d75_8fff. F45 f45fffff.
         F45_11 f45_11ff. F45_14 f45fffff. F45_8 f45_8fff.
         F46 f46fffff. F46_11 f46_11ff. F46_14 f46fffff.
         F46_8 f46_8fff. F47_11 f47_11ff. F47_14 f47_14ff.
         F47_8 f47_8fff. F5 f5ffffff. F5_11 f5_11fff.
         F5_11_14 f5ffffff. F5_8 f5_8ffff. F61 d71fffff.
         F610 f610ffff. F610_11 f610_11f. F610_14 f610ffff.
         F610_8 f610_8ff. F61_11 d71_11ff. F61_14 d71fffff.
         F61_8 d71_8fff. F62 f62fffff. F62_11 f62_11ff.
         F62_14 f62fffff. F62_8 f62_8fff. F63 f62fffff.
         F63_11 f62_11ff. F63_14 f62fffff. F63_8 f62_8fff.
         F64A f64affff. F64A_11 f64a_11f. F64A_14 f64affff.
         F64A_8 f64a_8ff. F64B f64affff. F64B_11 f64a_11f.
         F64B_14 f64affff. F64B_8 f64a_8ff. F64C f64affff.
         F64C_11 f64a_11f. F64C_14 f64affff. F64C_8 f64a_8ff.
         F64D f64affff. F64D_11 f64a_11f. F64D_14 f64affff.
         F64D_8 f64a_8ff. F64E f64affff. F64E1_11 f64e1_1f.
         F64E_14 f64affff. F64E_8 f64a_8ff. F64F f64affff.
         F64F1_11 f64e1_1f. F64F_14 f64affff. F64F_8 f64a_8ff.
         F64G f64affff. F64G1_11 f64e1_1f. F64G_14 f64affff.
         F64G_8 f64a_8ff. F64H f64affff. F64H1_11 f64e1_1f.
         F64H_14 f64affff. F64H_8 f64a_8ff. F64I f64affff.
         F64I_11 f64i_11f. F64I_14 f64affff. F64I_8 f64i_8ff.
         F651A f651afff. F651A1_11 f651a1_f. F651A1_14 f651afff.
         F651A2_11 f651a1_f. F651A2_14 f651afff. F651A_8 f651a_8f.
         F651B f651afff. F651B1_11 f651a1_f. F651B1_14 f651afff.
         F651B2_11 f651a1_f. F651B2_14 f651afff. F651B_8 f651a_8f.
         F652 f652ffff. F6521_11 f6521_1f. F6521_14 f6521_1_1f.
         F652A_11 yearin_f. F652B_11 a535_11f. F652B_14 f151ffff.
         F652_8 f652_8ff. F66 f66fffff. F66_11 d91_11ff.
         F66_14 f66fffff. F66_8 d91_8fff. F71 f71fffff.
         F71_11 d91_11ff. F71_14 f71fffff. F71_8 d91_8fff.
         F721 a53a2fff. F721_11 a53a2_1f. F721_14 a53a2fff.
         F721_8 a53a2_8f. F722 a53a2fff. F722A_11 d91_11ff.
         F722_11 a53a2_1f. F722_14 a53a2fff. F722_8 a53a2_8f.
         F73 a53a2fff. F73_11 a53a2_1f. F73_14 a53a2fff.
         F73_8 a53a2_8f. F74 a54bffff. F74_11 a54b_11f.
         F74_14 a54bffff. F74_8 a54b_8ff. F81 f71fffff.
         F81_11 d91_11ff. F81_14 f71fffff. F81_8 d91_8fff.
         F821 a53a2fff. F821_11 a53a2_1f. F821_14 a53a2fff.
         F821_8 a53a2_8f. F822 a53a2fff. F822A_11 d91_11ff.
         F822_11 a53a2_1f. F822_14 a53a2fff. F822_8 a53a2_8f.
         F83 a53a2fff. F83_11 a53a2_1f. F83_14 a53a2fff.
         F83_8 a53a2_8f. F84 f2ffffff. F84_11 f84_11ff.
         F84_14 f2ffffff. F84_8 f84_8fff. F85 f2ffffff.
         F85_11 f84_11ff. F85_14 f2ffffff. F85_8 f84_8fff.
         F86 a54bffff. F86_11 a54b_11f. F86_14 a54bffff.
         F86_8 a54b_8ff. F9 a54bffff. F901A_11 a535_11f.
         F901B1_11 f901b1_f. F901B2_11 f901b1_f. F901B3_11 f901b1_f.
         F901_11 f41a12_f. F902A_11 a535_11f. F902B1_11 f901b1_f.
         F902B2_11 f901b1_f. F902B3_11 f901b1_f. F902_11 f41a12_f.
         F91 a54bffff. F91_11 a54b_11f. F91_14 a54bffff.
         F91_8 a54b_8ff. F92A1 d75fffff. F92A1_11 a53a5_1f.
         F92A1_14 d75fffff. F92A1_8 d75_8fff. F92A2 f92a2fff.
         F92A2_11 a53a3_1f. F92A2_14 f92a2fff. F92A2_8 a53a3_8f.
         F92A3 f92a3fff. F92A3_11 f92a3_1f. F92A3_14 f92a3fff.
         F92A3_8 f92a3_8f. F92A4 a53a2fff. F92A4_11 a53a2_1f.
         F92A4_14 a53a2fff. F92A4_8 a53a2_8f. F92A5 f92a5fff.
         F92A5_11 f92a5_1f. F92A5_14 f92a5fff. F92A5_8 f92a5_8f.
         F92A6 a532ffff. F92A6_11 f92a3_1f. F92A6_14 a532ffff.
         F92A6_8 f92a3_8f. F92A7_11 f92a3_1f. F92A7_14 f92a3fff.
         F92B1 d75fffff. F92B1_11 a53a5_1f. F92B1_14 d75fffff.
         F92B1_8 d75_8fff. F92B2 f92a2fff. F92B2_11 a53a3_1f.
         F92B2_14 f92a2fff. F92B2_8 a53a3_8f. F92B3 f92a3fff.
         F92B3_11 f92a3_1f. F92B3_14 f92a3fff. F92B3_8 f92a3_8f.
         F92B4 a53a2fff. F92B4_11 a53a2_1f. F92B4_14 a53a2fff.
         F92B4_8 a53a2_8f. F92B5 f92a5fff. F92B5_11 f92a5_1f.
         F92B5_14 f92a5fff. F92B5_8 f92a5_8f. F92B6 a532ffff.
         F92B6_11 f92a3_1f. F92B6_14 a532ffff. F92B6_8 f92a3_8f.
         F92B7_11 f92a3_1f. F92B7_14 f92a3fff. F92C1 d75fffff.
         F92C1_11 a53a5_1f. F92C1_14 d75fffff. F92C1_8 d75_8fff.
         F92C2 f92a2fff. F92C2_11 a53a3_1f. F92C2_14 f92a2fff.
         F92C2_8 a53a3_8f. F92C3 f92a3fff. F92C3_11 f92a3_1f.
         F92C3_14 f92a3fff. F92C3_8 f92a3_8f. F92C4 a53a2fff.
         F92C4_11 a53a2_1f. F92C4_14 a53a2fff. F92C4_8 a53a2_8f.
         F92C5 f92a5fff. F92C5_11 f92a5_1f. F92C5_14 f92a5fff.
         F92C5_8 f92a5_8f. F92C6 a532ffff. F92C6_11 f92a3_1f.
         F92C6_14 a532ffff. F92C6_8 f92a3_8f. F92C7_11 f92a3_1f.
         F92C7_14 f92a3fff. F92D1 d75fffff. F92D1_11 a53a5_1f.
         F92D1_14 d75fffff. F92D1_8 d75_8fff. F92D2 f92a2fff.
         F92D2_11 a53a3_1f. F92D2_14 f92a2fff. F92D2_8 a53a3_8f.
         F92D3 f92a3fff. F92D3_11 f92a3_1f. F92D3_14 f92a3fff.
         F92D3_8 f92a3_8f. F92D4 a53a2fff. F92D4_11 a53a2_1f.
         F92D4_14 a53a2fff. F92D4_8 a53a2_8f. F92D5 f92a5fff.
         F92D5_11 f92a5_1f. F92D5_14 f92a5fff. F92D5_8 f92a5_8f.
         F92D6 a532ffff. F92D6_11 f92a3_1f. F92D6_14 a532ffff.
         F92D6_8 f92a3_8f. F92D7_11 f92a3_1f. F92D7_14 f92a3fff.
         F92E1 d75fffff. F92E1_11 a53a5_1f. F92E1_14 d75fffff.
         F92E1_8 d75_8fff. F92E2 f92a2fff. F92E2_11 a53a3_1f.
         F92E2_14 f92a2fff. F92E2_8 a53a3_8f. F92E3 f92a3fff.
         F92E3_11 f92a3_1f. F92E3_14 f92a3fff. F92E3_8 f92a3_8f.
         F92E4 a53a2fff. F92E4_11 a53a2_1f. F92E4_14 a53a2fff.
         F92E4_8 a53a2_8f. F92E5 f92a5fff. F92E5_11 f92a5_1f.
         F92E5_14 f92a5fff. F92E5_8 f92a5_8f. F92E6 a532ffff.
         F92E6_11 f92a3_1f. F92E6_14 a532ffff. F92E6_8 f92a3_8f.
         F92E7_11 f92a3_1f. F92E7_14 f92a3fff. F92F1 d75fffff.
         F92F1_11 a53a5_1f. F92F1_14 d75fffff. F92F1_8 d75_8fff.
         F92F2 f92a2fff. F92F2_11 a53a3_1f. F92F2_14 f92a2fff.
         F92F2_8 a53a3_8f. F92F3 f92a3fff. F92F3_11 f92a3_1f.
         F92F3_14 f92a3fff. F92F3_8 f92a3_8f. F92F4 a53a2fff.
         F92F4_11 a53a2_1f. F92F4_14 a53a2fff. F92F4_8 a53a2_8f.
         F92F5 f92a5fff. F92F5_11 f92a5_1f. F92F5_14 f92a5fff.
         F92F5_8 f92a5_8f. F92F6 a532ffff. F92F6_11 f92a3_1f.
         F92F6_14 a532ffff. F92F6_8 f92a3_8f. F92F7_11 f92a3_1f.
         F92F7_14 f92a3fff. F92G1 d75fffff. F92G1_11 a53a5_1f.
         F92G1_14 d75fffff. F92G1_8 d75_8fff. F92G2 f92a2fff.
         F92G2_11 a53a3_1f. F92G2_14 f92a2fff. F92G2_8 a53a3_8f.
         F92G3 f92a3fff. F92G3_11 f92a3_1f. F92G3_14 f92a3fff.
         F92G3_8 f92a3_8f. F92G4 a53a2fff. F92G4_11 a53a2_1f.
         F92G4_14 a53a2fff. F92G4_8 a53a2_8f. F92G5 f92a5fff.
         F92G5_11 f92a5_1f. F92G5_14 f92a5fff. F92G5_8 f92a5_8f.
         F92G6 a532ffff. F92G6_11 f92a3_1f. F92G6_14 a532ffff.
         F92G6_8 f92a3_8f. F92G7_11 f92a3_1f. F92G7_14 f92a3fff.
         F92H1 d75fffff. F92H1_11 a53a5_1f. F92H1_14 d75fffff.
         F92H1_8 d75_8fff. F92H2 f92a2fff. F92H2_11 a53a3_1f.
         F92H2_14 f92a2fff. F92H2_8 a53a3_8f. F92H3 f92a3fff.
         F92H3_11 f92a3_1f. F92H3_14 f92a3fff. F92H3_8 f92a3_8f.
         F92H4 a53a2fff. F92H4_11 a53a2_1f. F92H4_14 a53a2fff.
         F92H4_8 a53a2_8f. F92H5 f92a5fff. F92H5_11 f92a5_1f.
         F92H5_14 f92a5fff. F92H5_8 f92a5_8f. F92H6 a532ffff.
         F92H6_11 f92a3_1f. F92H6_14 a532ffff. F92H6_8 f92a3_8f.
         F92H7_11 f92a3_1f. F92H7_14 f92a3fff. F92I1 d75fffff.
         F92I1_11 a53a5_1f. F92I1_14 d75fffff. F92I1_8 d75_8fff.
         F92I2 f92a2fff. F92I2_11 a53a3_1f. F92I2_14 f92a2fff.
         F92I2_8 a53a3_8f. F92I3 f92a3fff. F92I3_11 f92a3_1f.
         F92I3_14 f92a3fff. F92I3_8 f92a3_8f. F92I4 a53a2fff.
         F92I4_11 a53a2_1f. F92I4_14 a53a2fff. F92I4_8 a53a2_8f.
         F92I5 f92a5fff. F92I5_11 f92a5_1f. F92I5_14 f92a5fff.
         F92I5_8 f92a5_8f. F92I6 a532ffff. F92I6_11 f92a3_1f.
         F92I6_14 a532ffff. F92I6_8 f92a3_8f. F92I7_11 f92a3_1f.
         F92I7_14 f92a3fff. F92J1 d75fffff. F92J1_11 a53a5_1f.
         F92J1_14 d75fffff. F92J1_8 d75_8fff. F92J2 f92a2fff.
         F92J2_11 a53a3_1f. F92J2_14 f92a2fff. F92J2_8 a53a3_8f.
         F92J3 f92a3fff. F92J3_11 f92a3_1f. F92J3_14 f92a3fff.
         F92J3_8 f92a3_8f. F92J4 a53a2fff. F92J4_11 a53a2_1f.
         F92J4_14 a53a2fff. F92J4_8 a53a2_8f. F92J5 f92a5fff.
         F92J5_11 f92a5_1f. F92J5_14 f92a5fff. F92J5_8 f92a5_8f.
         F92J6 a532ffff. F92J6_11 f92a3_1f. F92J6_14 a532ffff.
         F92J6_8 f92a3_8f. F92J7_11 f92a3_1f. F92J7_14 f92a3fff.
         F92K1 d75fffff. F92K2 f92a2fff. F92K3 f92a3fff.
         F92K4 a53a2fff. F92K5 f92a5fff. F92K6 a532ffff.
         F9A d75fffff. F9A_11 a54b_11f. F9A_8 a54b_8ff.
         F9_11 a54b_11f. F9_8 a54b_8ff. G01 g01fffff.
         G01_11 g01_11ff. G01_14 g01fffff. G01_8 g01_8fff.
         G02 a54bffff. G02_11 a54b_11f. G02_14 a54bffff.
         G02_8 a54b_8ff. G1 g1ffffff. G101 g51fffff.
         G1011_11 a54b_11f. G1011_14 a54bffff. G101_11 g511_11f.
         G101_14 g51fffff. G101_8 g511_8ff. G102 g51fffff.
         G1021_11 g511_11f. G1021_14 h5ffffff. G1021_8 g511_8ff.
         G102B_11 g7_11fff. G102C_11 g102c_1f. G102C_14 g102c_1_1f.
         G102_11 d91_11ff. G102_14 g51fffff. G1061_11 g1061_1f.
         G1061_14 g1061_1_1f. G1062_11 g1062_1f. G1062_14 g1062_1_1f.
         G1063_11 g1063_1f. G1063_14 g1063_1_1f. G106_11 d91_11ff.
         G106_14 f71fffff. G11 g11fffff. G11_11 g11_11ff.
         G11_14 g11fffff. G11_8 g11_8fff. G12 g12fffff.
         G122_11 g511_11f. G122_14 a54bffff. G122_8 g511_8ff.
         G123_11 g511_11f. G123_14 a54bffff. G123_8 g511_8ff.
         G12_11 g12_11ff. G12_14 g12fffff. G12_8 g12_8fff.
         G13 g13fffff. G130 d71fffff. G130_11 d91_11ff.
         G130_14 d71fffff. G130_8 d91_8fff. G131_11 g131_11f.
         G131_14 g13fffff. G131_8 g131_8ff. G132_11 g132_11f.
         G132_14 g132_14f. G132_8 g132_8ff. G14A1 g14a1fff.
         G14A1_11 g14a1_1f. G14A1_14 g14a1fff. G14A1_8 g14a1_8f.
         G14A2 g14a2fff. G14A2_11 g14a2_1f. G14A2_14 g14a2fff.
         G14A2_8 g14a2_8f. G14B1 g14a1fff. G14B1_11 g14a1_1f.
         G14B1_14 g14a1fff. G14B1_8 g14b1_8f. G14B2 g14a2fff.
         G14B2_11 g14a2_1f. G14B2_14 g14a2fff. G14B2_8 g14a2_8f.
         G14C1 g14a1fff. G14C1_11 g14c1_1f. G14C1_14 g14a1fff.
         G14C1_8 g14b1_8f. G14C2 g14a2fff. G14C2_11 g14a2_1f.
         G14C2_14 g14a2fff. G14C2_8 g14a2_8f. G15A1 g15a1fff.
         G15A1_11 g15a1_1f. G15A1_14 g15a1fff. G15A1_8 g15a1_8f.
         G15A2 d71fffff. G15A2_11 d71_11ff. G15A2_14 d71fffff.
         G15A2_8 d71_8fff. G15A3 g15a3fff. G15A3_11 g15a3_1f.
         G15A3_14 g15a3fff. G15A3_8 g15a3_8f. G15B1 g15a1fff.
         G15B1_11 g15a1_1f. G15B1_14 g15a1fff. G15B1_8 g15a1_8f.
         G15B2 d71fffff. G15B2_11 d71_11ff. G15B2_14 d71fffff.
         G15B2_8 d71_8fff. G15B3 g15a3fff. G15B3_11 g15a3_1f.
         G15B3_14 g15a3fff. G15B3_8 g15a3_8f. G15C1 g15a1fff.
         G15C1_11 g15a1_1f. G15C1_14 g15a1fff. G15C1_8 g15a1_8f.
         G15C2 d71fffff. G15C2_11 d71_11ff. G15C2_14 d71fffff.
         G15C2_8 d71_8fff. G15C3 g15a3fff. G15C3_11 g15a3_1f.
         G15C3_14 g15a3fff. G15C3_8 g15a3_8f. G15D1 g15a1fff.
         G15D1_11 g15a1_1f. G15D1_14 g15a1fff. G15D1_8 g15a1_8f.
         G15D2 d71fffff. G15D2_11 d71_11ff. G15D2_14 d71fffff.
         G15D2_8 d71_8fff. G15D3 g15a3fff. G15D3_11 g15a3_1f.
         G15D3_14 g15a3fff. G15D3_8 g15a3_8f. G15E1 g15a1fff.
         G15E1_11 g15a1_1f. G15E1_14 g15a1fff. G15E1_8 g15a1_8f.
         G15E2 d71fffff. G15E2_11 d71_11ff. G15E2_14 d71fffff.
         G15E2_8 d71_8fff. G15E3 g15a3fff. G15E3_11 g15a3_1f.
         G15E3_14 g15a3fff. G15E3_8 g15a3_8f. G15F1 g15a1fff.
         G15F1_11 g15a1_1f. G15F1_14 g15a1fff. G15F1_8 g15a1_8f.
         G15F2 d71fffff. G15F2_11 d91_11ff. G15F2_14 d71fffff.
         G15F2_8 d91_8fff. G15F3 g15a3fff. G15F3_11 g15f3_1f.
         G15F3_14 g15a3fff. G15F3_8 g15f3_8f. G15G1 g15a1fff.
         G15G1_11 g15a1_1f. G15G1_14 g15a1fff. G15G1_8 g15a1_8f.
         G15G2 d71fffff. G15G2_11 d71_11ff. G15G2_14 d71fffff.
         G15G2_8 d71_8fff. G15G3 g15a3fff. G15G3_11 g15a3_1f.
         G15G3_14 g15a3fff. G15G3_8 g15a3_8f. G15H1 g15a1fff.
         G15H1_11 g15a1_1f. G15H1_14 g15a1fff. G15H1_8 g15a1_8f.
         G15H2 d71fffff. G15H2_11 d71_11ff. G15H2_14 d71fffff.
         G15H2_8 d71_8fff. G15H3 g15a3fff. G15H3_11 g15a3_1f.
         G15H3_14 g15a3fff. G15H3_8 g15a3_8f. G15I1 g15a1fff.
         G15I1_11 g15a1_1f. G15I1_14 g15a1fff. G15I1_8 g15a1_8f.
         G15I2 d71fffff. G15I2_11 d71_11ff. G15I2_14 d71fffff.
         G15I2_8 d71_8fff. G15I3 g15a3fff. G15I3_11 g15a3_1f.
         G15I3_14 g15a3fff. G15I3_8 g15a3_8f. G15J1 g15a1fff.
         G15J1A_11 g15n1a_f. G15J1A_14 g15n1a__1f. G15J1_11 g15a1_1f.
         G15J1_14 g15a1fff. G15J1_8 g15a1_8f. G15J2 d71fffff.
         G15J2A_11 g15n1a_f. G15J2A_14 g15n1a__1f. G15J2_11 d71_11ff.
         G15J2_14 d71fffff. G15J2_8 d71_8fff. G15J3 g15a3fff.
         G15J3A_11 g15n3a_f. G15J3A_14 g15n3a__1f. G15J3_11 g15a3_1f.
         G15J3_14 g15a3fff. G15J3_8 g15a3_8f. G15K1 g15a1fff.
         G15K1_11 g15a1_1f. G15K1_14 g15a1fff. G15K1_8 g15a1_8f.
         G15K2 d71fffff. G15K2_11 d71_11ff. G15K2_14 d71fffff.
         G15K2_8 d71_8fff. G15K3 g15a3fff. G15K3_11 g15f3_1f.
         G15K3_14 g15a3fff. G15K3_8 g15f3_8f. G15L1 g15a1fff.
         G15L1_11 g15a1_1f. G15L1_14 g15a1fff. G15L1_8 g15a1_8f.
         G15L2 d71fffff. G15L2_11 d71_11ff. G15L2_14 d71fffff.
         G15L2_8 d71_8fff. G15L3 g15a3fff. G15L3_11 g15a3_1f.
         G15L3_14 g15a3fff. G15L3_8 g15a3_8f. G15M1 g15a1fff.
         G15M1_11 g15a1_1f. G15M1_14 g15a1fff. G15M1_8 g15a1_8f.
         G15M2 d71fffff. G15M2_11 d71_11ff. G15M2_14 d71fffff.
         G15M2_8 d71_8fff. G15M3 g15a3fff. G15M3_11 g15a3_1f.
         G15M3_14 g15a3fff. G15M3_8 g15a3_8f. G15N1 g15a1fff.
         G15N1A_11 g15n1a_f. G15N1A_14 g15n1a__1f. G15N1_11 g15a1_1f.
         G15N1_14 g15a1fff. G15N1_8 g15a1_8f. G15N2 d71fffff.
         G15N2A_11 g15n1a_f. G15N2A_14 g15n1a__1f. G15N2_11 d71_11ff.
         G15N2_14 d71fffff. G15N2_8 d71_8fff. G15N3 g15a3fff.
         G15N3A_11 g15n3a_f. G15N3A_14 g15n3a__1f. G15N3_11 g15a3_1f.
         G15N3_14 g15a3fff. G15N3_8 g15a3_8f. G15O1 g15a1fff.
         G15O1_11 g15a1_1f. G15O1_14 g15a1fff. G15O1_8 g15a1_8f.
         G15O2 d71fffff. G15O2_11 d71_11ff. G15O2_14 d71fffff.
         G15O2_8 d71_8fff. G15O3 g15a3fff. G15O3_11 g15a3_1f.
         G15O3_14 g15a3fff. G15O3_8 g15a3_8f. G15P1 g15a1fff.
         G15P1_11 g15a1_1f. G15P1_14 g15a1fff. G15P1_8 g15a1_8f.
         G15P2 d71fffff. G15P2_11 d71_11ff. G15P2_14 d71fffff.
         G15P2_8 d71_8fff. G15P3 g15a3fff. G15P3_11 g15a3_1f.
         G15P3_14 g15a3fff. G15P3_8 g15a3_8f. G15Q1 g15a1fff.
         G15Q1_11 g15a1_1f. G15Q1_14 g15a1fff. G15Q1_8 g15a1_8f.
         G15Q2 d71fffff. G15Q2_11 d71_11ff. G15Q2_14 d71fffff.
         G15Q2_8 d71_8fff. G15Q3 g15a3fff. G15Q3_11 g15a3_1f.
         G15Q3_14 g15a3fff. G15Q3_8 g15a3_8f. G15R1 g15a1fff.
         G15R1_11 g15a1_1f. G15R1_14 g15a1fff. G15R1_8 g15a1_8f.
         G15R2 d71fffff. G15R2_11 d71_11ff. G15R2_14 d71fffff.
         G15R2_8 d71_8fff. G15R3 g15a3fff. G15R3_11 g15a3_1f.
         G15R3_14 g15a3fff. G15R3_8 g15a3_8f. G15S1 g15a1fff.
         G15S1_11 g15a1_1f. G15S1_14 g15a1fff. G15S1_8 g15a1_8f.
         G15S2 d71fffff. G15S2_11 d71_11ff. G15S2_14 d71fffff.
         G15S2_8 d71_8fff. G15S3 g15a3fff. G15S3_11 g15a3_1f.
         G15S3_14 g15a3fff. G15S3_8 g15a3_8f. G15T1 g15a1fff.
         G15T1_11 g15a1_1f. G15T1_14 g15a1fff. G15T1_8 g15a1_8f.
         G15T2 d71fffff. G15T2_11 d71_11ff. G15T2_14 d71fffff.
         G15T2_8 d71_8fff. G15T3 g15a3fff. G15T3_11 g15a3_1f.
         G15T3_14 g15a3fff. G15T3_8 g15a3_8f. G15U1 g15a1fff.
         G15U1_11 g15a1_1f. G15U1_14 g15a1fff. G15U1_8 g15a1_8f.
         G15U2 d71fffff. G15U2_11 d71_11ff. G15U2_14 d71fffff.
         G15U2_8 d71_8fff. G15U3 g15a3fff. G15U3_11 g15a3_1f.
         G15U3_14 g15a3fff. G15U3_8 g15a3_8f. G15V1 g15a1fff.
         G15V1_11 g15a1_1f. G15V1_14 g15a1fff. G15V1_8 g15a1_8f.
         G15V2 d71fffff. G15V2_11 d91_11ff. G15V2_14 d71fffff.
         G15V2_8 d91_8fff. G15V3 g15a3fff. G15V3_11 g15f3_1f.
         G15V3_14 g15a3fff. G15V3_8 g15f3_8f. G15W1 g15a1fff.
         G15W2 d71fffff. G15W3 g15w3fff. G15Y2_11 g15n1a_f.
         G15Y2_14 f26_14ff. G15Y3_11 g15n3a_f. G15Y3_14 g15n3a__1f.
         G1_11 g1_11fff. G1_14 g1ffffff. G1_8 g1_8ffff.
         G21 d12fffff. G21_11 a54b_11f. G21_14 d12fffff.
         G21_8 a54b_8ff. G22 d71fffff. G22_11 d91_11ff.
         G22_14 d71fffff. G22_8 d91_8fff. G23_11 g23_11ff.
         G23_14 g23_14ff. G24A_11 f41a12_f. G24A_14 f41a12__1f.
         G24_11 a535_11f. G24_14 f151ffff. G25A_11 f41a12_f.
         G25A_14 f41a12__1f. G25_11 a535_11f. G25_14 f151ffff.
         G3 d71fffff. G3_11 d91_11ff. G3_14 d71fffff.
         G3_8 d91_8fff. G4 g4ffffff. G4A_11 g4a_11ff.
         G4A_14 g4a_14ff. G4B_11 g4b_11ff. G4B_14 g4b_14ff.
         G4_11 g4_11fff. G4_14 g4ffffff. G4_8 g4_8ffff.
         G51 g51fffff. G511_11 g511_11f. G511_14 g511_14f.
         G511_8 g511_8ff. G512_11 g511_11f. G512_14 g511_14f.
         G512_8 g511_8ff. G52 g51fffff. G521_11 g511_11f.
         G521_14 g511_14f. G521_8 g511_8ff. G522_11 g511_11f.
         G522_14 g511_14f. G522_8 g511_8ff. G6 g6ffffff.
         G6_11 g6_11fff. G6_14 g6ffffff. G7 g51fffff.
         G71_8 g511_8ff. G72_8 g511_8ff. G7_11 g7_11fff.
         G7_14 g51fffff. G81 g81fffff. G81_11 g81_11ff.
         G81_14 g81fffff. G81_8 g81_8fff. G82 g81fffff.
         G82_11 g81_11ff. G82_14 g81fffff. G82_8 g81_8fff.
         G83 g83fffff. G83_11 g83_11ff. G83_14 g83fffff.
         G83_8 g83_8fff. G9 g9ffffff. G9_11 g9_11fff.
         G9_14 g9ffffff. G9_8 g9_8ffff. H1 h1ffffff.
         H1_11 h1_11fff. H1_14 h1ffffff. H1_8 h1_8ffff.
         H21 h21fffff. H21_11 h21_11ff. H21_14 h21fffff.
         H21_8 h21_8fff. H22 h22fffff. H22_11 h22_11ff.
         H22_14 h22fffff. H22_8 h22_8fff. H3 h3ffffff.
         H3_11 h3_11fff. H3_14 h3ffffff. H3_8 h3_8ffff.
         H5 h5ffffff. H5_14 h5ffffff. H6 d71fffff.
         H6_11 d71_11ff. H6_14 d71fffff. H6_8 d71_8fff.
         H7 d71fffff. H71 h71fffff. H71_11 h71_11ff.
         H71_14 h71fffff. H71_8 h71_8fff. H7_11 d71_11ff.
         H7_14 d71fffff. H7_8 d71_8fff. JIGE_11 a54b_11f.
         JIGE_14 d75fffff. JIGE_8 a54b_8ff. MONTHIN_11 monthinf.
         MONTH_8 month_8f. PROV provffff. RA41 ra41ffff.
         RA41_14 ra41ffff. RA42 ra41ffff. RA42_14 ra41ffff.
         RA43 ra41ffff. RA43_14 ra41ffff. RA51 ra41ffff.
         RA51_11 ra51_11f. RA51_14 ra41ffff. RA51_8 ra51_8ff.
         RA52 ra52ffff. RA52_11 ra52_11f. RA52_14 ra52ffff.
         RA52_8 ra52_8ff. RA530 ra52ffff. RA530_11 ra52_11f.
         RA530_14 ra52ffff. RA530_8 ra52_8ff. RA531 ra52ffff.
         RA531_11 ra52_11f. RA531_14 ra52ffff. RA531_8 ra52_8ff.
         RA532 ra52ffff. RA532_11 ra52_11f. RA532_14 ra52ffff.
         RA532_8 ra52_8ff. RA533_11 ra52_11f. RA533_14 ra52ffff.
         RA534_11 ra52_11f. RA534_14 ra52ffff. RA535_11 ra52_11f.
         RA535_14 ra52ffff. RA536_11 ra52_11f. RA536_14 ra52ffff.
         RA537_11 ra52_11f. RA537_14 ra52ffff. RA53A ra52ffff.
         RA53A_11 ra52_11f. RA53A_14 ra52ffff. RA53A_8 ra52_8ff.
         RA53B ra52ffff. RA53B_11 ra52_11f. RA53B_14 ra52ffff.
         RA53B_8 ra52_8ff. RA53C ra52ffff. RA53C_11 ra52_11f.
         RA53C_14 ra52ffff. RA53C_8 ra52_8ff. RA53D ra52ffff.
         RA53D_11 ra52_11f. RA53D_14 ra52ffff. RA53D_8 ra52_8ff.
         RA53E ra52ffff. RA53E_11 ra52_11f. RA53E_14 ra52ffff.
         RA53E_8 ra52_8ff. RA53F ra52ffff. RA53F_11 ra52_11f.
         RA53F_14 ra52ffff. RA53F_8 ra52_8ff. RA53G ra52ffff.
         RA53G_11 ra52_11f. RA53G_14 ra52ffff. RA53G_8 ra52_8ff.
         RA53H ra52ffff. RA53H_11 ra52_11f. RA53H_14 ra52ffff.
         RA53H_8 ra52_8ff. RA53I ra52ffff. RA53I_11 ra52_11f.
         RA53I_14 ra52ffff. RA53I_8 ra52_8ff. RA53J ra52ffff.
         RA53J_11 ra52_11f. RA53J_14 ra52ffff. RA53J_8 ra52_8ff.
         RA53K ra52ffff. RA53K_8 ra52_8ff. RA53L ra52ffff.
         RA53L_8 ra52_8ff. RA54 ra52ffff. RA540 ra52ffff.
         RA540_11 ra52_11f. RA540_14 ra52ffff. RA541 ra52ffff.
         RA541_11 ra52_11f. RA541_14 ra52ffff. RA541_8 ra52_8ff.
         RA542 ra52ffff. RA542_11 ra52_11f. RA542_14 ra52ffff.
         RA542_8 ra52_8ff. RA54_11 ra52_11f. RA54_14 ra52ffff.
         RA54_8 ra52_8ff. RD1 rd1fffff. RD101 ra41ffff.
         RD101_11 ra51_11f. RD101_14 ra41ffff. RD101_8 ra51_8ff.
         RD102 ra52ffff. RD102_11 ra52_11f. RD102_14 ra52ffff.
         RD102_8 ra52_8ff. RD103 ra52ffff. RD103_11 ra52_11f.
         RD103_14 ra52ffff. RD103_8 ra52_8ff. RD11A ra41ffff.
         RD11A_11 ra51_11f. RD11A_14 ra41ffff. RD11A_8 ra51_8ff.
         RD11B ra41ffff. RD11B_11 ra51_11f. RD11B_14 ra41ffff.
         RD11B_8 ra51_8ff. RD11C ra41ffff. RD11C_11 ra51_11f.
         RD11C_14 ra41ffff. RD11C_8 ra51_8ff. RD11D ra41ffff.
         RD11D_11 ra51_11f. RD11D_14 ra41ffff. RD11D_8 ra51_8ff.
         RD11E ra41ffff. RD11E_11 ra51_11f. RD11E_14 ra41ffff.
         RD11E_8 ra51_8ff. RD11F ra41ffff. RD11F_11 ra51_11f.
         RD11F_14 ra41ffff. RD11F_8 ra51_8ff. RD11G ra41ffff.
         RD11G_11 ra51_11f. RD11G_14 ra41ffff. RD11G_8 ra51_8ff.
         RD11H ra41ffff. RD11H_11 ra51_11f. RD11H_14 ra41ffff.
         RD11H_8 ra51_8ff. RD12 rd12ffff. RD12_11 rd12_11f.
         RD12_14 rd12ffff. RD12_8 rd12_8ff. RD1_11 rd1_11ff.
         RD1_14 rd1fffff. RD1_8 rd1_8fff. RD2 ra41ffff.
         RD2_11 ra51_11f. RD2_14 ra41ffff. RD2_8 ra51_8ff.
         RD31 ra41ffff. RD31_11 ra51_11f. RD31_14 ra41ffff.
         RD31_8 ra51_8ff. RD32 ra41ffff. RD32_11 ra51_11f.
         RD32_14 ra41ffff. RD32_8 ra51_8ff. RD33_11 ra51_11f.
         RD33_14 ra52ffff. RD33_8 ra51_8ff. RD34_11 ra51_11f.
         RD34_14 ra52ffff. RD34_8 ra51_8ff. RD4ALGA_11 ra51_11f.
         RD4ALGA_14 ra52ffff. RD4ALGA_8 ra51_8ff. RD4BEAN ra41ffff.
         RD4BEAN_11 ra51_11f. RD4BEAN_14 ra41ffff. RD4BEAN_8 ra51_8ff.
         RD4DRUG_11 ra51_11f. RD4DRUG_14 ra52ffff. RD4DRUG_8 ra51_8ff.
         RD4EGG ra41ffff. RD4EGG_11 ra51_11f. RD4EGG_14 ra41ffff.
         RD4EGG_8 ra51_8ff. RD4FISH ra41ffff. RD4FISH_11 ra51_11f.
         RD4FISH_14 ra41ffff. RD4FISH_8 ra51_8ff. RD4GARL ra41ffff.
         RD4GARL_11 ra51_11f. RD4GARL_14 ra41ffff. RD4GARL_8 ra51_8ff.
         RD4MEAT ra41ffff. RD4MEAT_11 ra51_11f. RD4MEAT_14 ra41ffff.
         RD4MEAT_8 ra51_8ff. RD4MILK_14 ra52ffff. RD4NUT_11 ra51_11f.
         RD4NUT_14 ra52ffff. RD4NUT_8 ra51_8ff. RD4SUGA ra41ffff.
         RD4SUGA_11 ra51_11f. RD4SUGA_14 ra41ffff. RD4SUGA_8 ra51_8ff.
         RD4TEA ra41ffff. RD4TEA_11 ra51_11f. RD4TEA_14 ra41ffff.
         RD4TEA_8 ra51_8ff. RD4VEG ra41ffff. RD4VEG_11 ra51_11f.
         RD4VEG_14 ra41ffff. RD4VEG_8 ra51_8ff. RD4VIT_11 ra51_11f.
         RD4VIT_14 ra52ffff. RD4VIT_8 ra51_8ff. RD5 ra41ffff.
         RD5_11 ra51_11f. RD5_14 ra41ffff. RD5_8 ra51_8ff.
         RD6 ra41ffff. RD6_11 ra51_11f. RD6_14 ra41ffff.
         RD6_8 ra51_8ff. RD71 ra41ffff. RD710_11 ra52_11f.
         RD710_14 ra52ffff. RD71_11 ra51_11f. RD71_14 ra41ffff.
         RD71_8 ra51_8ff. RD72 ra41ffff. RD72_11 ra51_11f.
         RD72_14 ra41ffff. RD72_8 ra51_8ff. RD73 ra52ffff.
         RD73_11 ra52_11f. RD73_14 ra52ffff. RD73_8 ra52_8ff.
         RD74 ra52ffff. RD74_11 ra52_11f. RD74_14 ra52ffff.
         RD74_8 ra52_8ff. RD75 ra52ffff. RD75_11 ra52_11f.
         RD75_14 ra52ffff. RD75_8 ra52_8ff. RD76_11 ra52_11f.
         RD76_14 ra52ffff. RD77_11 ra52_11f. RD77_14 ra52ffff.
         RD78_11 ra52_11f. RD78_14 ra52ffff. RD79_11 ra52_11f.
         RD79_14 ra52ffff. RD81 ra41ffff. RD81_11 ra51_11f.
         RD81_14 ra41ffff. RD81_8 ra51_8ff. RD82 ra41ffff.
         RD82_11 ra51_11f. RD82_14 ra41ffff. RD82_8 ra51_8ff.
         RD83 ra52ffff. RD83_11 ra52_11f. RD83_14 ra52ffff.
         RD83_8 ra52_8ff. RD84 ra52ffff. RD84_11 ra52_11f.
         RD84_14 ra52ffff. RD84_8 ra52_8ff. RD85 ra52ffff.
         RD85_11 ra52_11f. RD85_14 ra52ffff. RD85_8 ra52_8ff.
         RD86 ra41ffff. RD86_11 ra51_11f. RD86_14 ra41ffff.
         RD86_8 ra51_8ff. RD87_11 ra52_11f. RD87_14 ra52ffff.
         RD91 ra41ffff. RD91_11 ra51_11f. RD91_14 ra41ffff.
         RD91_8 ra51_8ff. RD92 ra52ffff. RD92_11 ra52_11f.
         RD92_14 ra52ffff. RD92_8 ra52_8ff. RD93 ra52ffff.
         RD93_11 ra52_11f. RD93_14 ra52ffff. RD93_8 ra52_8ff.
         RD94 ra52ffff. RD94_11 ra52_11f. RD94_14 ra52ffff.
         RD94_8 ra52_8ff. RDEMILK_11 ra51_11f. RDEMILK_8 ra51_8ff.
         RE0_11 ra52_11f. RE0_14 ra52ffff. RE1 ra41ffff.
         RE10 ra41ffff. RE10_11 ra51_11f. RE10_14 re1_14ff.
         RE10_8 ra51_8ff. RE11 ra41ffff. RE11_11 ra51_11f.
         RE11_14 re1_14ff. RE11_8 ra51_8ff. RE12 ra41ffff.
         RE12_11 ra51_11f. RE12_14 re1_14ff. RE12_8 ra51_8ff.
         RE13 ra41ffff. RE13_11 ra51_11f. RE13_14 re1_14ff.
         RE13_8 ra51_8ff. RE14 ra41ffff. RE14_11 ra51_11f.
         RE14_14 re1_14ff. RE14_8 ra51_8ff. RE1B ra52ffff.
         RE1B_11 ra51_11f. RE1B_14 ra52ffff. RE1B_8 ra51_8ff.
         RE1_11 ra51_11f. RE1_14 re1_14ff. RE1_8 ra51_8ff.
         RE2 ra41ffff. RE2B ra52ffff. RE2B_11 ra51_11f.
         RE2B_14 ra52ffff. RE2B_8 ra51_8ff. RE2_11 ra51_11f.
         RE2_14 re1_14ff. RE2_8 ra51_8ff. RE3 ra41ffff.
         RE3B ra52ffff. RE3B_11 ra51_11f. RE3B_14 ra52ffff.
         RE3B_8 ra51_8ff. RE3_11 ra51_11f. RE3_14 re1_14ff.
         RE3_8 ra51_8ff. RE4 ra41ffff. RE4B ra52ffff.
         RE4B_11 ra51_11f. RE4B_14 ra52ffff. RE4B_8 ra51_8ff.
         RE4_11 ra51_11f. RE4_14 re1_14ff. RE4_8 ra51_8ff.
         RE5 ra41ffff. RE5B ra52ffff. RE5B_11 ra51_11f.
         RE5B_14 ra52ffff. RE5B_8 ra51_8ff. RE5_11 ra51_11f.
         RE5_14 re1_14ff. RE5_8 ra51_8ff. RE6 ra41ffff.
         RE610 ra52ffff. RE610_11 ra51_11f. RE610_14 ra52ffff.
         RE610_8 ra51_8ff. RE62 ra52ffff. RE62_11 ra51_11f.
         RE62_14 ra52ffff. RE62_8 ra51_8ff. RE63 ra52ffff.
         RE63_11 ra51_11f. RE63_14 ra52ffff. RE63_8 ra51_8ff.
         RE64 ra52ffff. RE64_11 ra51_11f. RE64_14 ra52ffff.
         RE64_8 ra51_8ff. RE65 ra52ffff. RE65_11 ra51_11f.
         RE65_14 ra52ffff. RE65_8 ra51_8ff. RE66 ra52ffff.
         RE67 ra52ffff. RE67_11 ra51_11f. RE67_14 ra52ffff.
         RE67_8 ra51_8ff. RE6B ra52ffff. RE6B_11 ra51_11f.
         RE6B_14 ra52ffff. RE6B_8 ra51_8ff. RE6_11 ra51_11f.
         RE6_14 re1_14ff. RE6_8 ra51_8ff. RE7 ra41ffff.
         RE7_11 ra51_11f. RE7_14 re1_14ff. RE7_8 ra51_8ff.
         RE8 ra41ffff. RE8_11 ra51_11f. RE8_14 re1_14ff.
         RE8_8 ra51_8ff. RE9 ra41ffff. RE9_11 ra51_11f.
         RE9_14 re1_14ff. RE9_8 ra51_8ff. RESIC_11 resic_1f.
         RESIDENC residenf. RESIDENC_14 residenf. RESID_8 resid_8f.
         RF1 ra41ffff. RF10 ra52ffff. RF101 ra52ffff.
         RF101_11 ra52_11f. RF101_14 ra52ffff. RF101_8 ra52_8ff.
         RF102 ra52ffff. RF102_11 ra52_11f. RF102_14 ra52ffff.
         RF102_8 ra52_8ff. RF1030A_11 ra52_11f. RF1030_11 ra52_11f.
         RF1031A_11 ra52_11f. RF1031_11 ra52_11f. RF1032_11 ra52_11f.
         RF1033_11 ra52_11f. RF103A ra52ffff. RF103A_11 ra52_11f.
         RF103A_14 ra52ffff. RF103A_8 ra52_8ff. RF103B ra52ffff.
         RF103B_11 ra52_11f. RF103B_14 ra52ffff. RF103B_8 ra52_8ff.
         RF103C ra52ffff. RF103C_11 ra52_11f. RF103C_14 ra52ffff.
         RF103C_8 ra52_8ff. RF103D ra52ffff. RF103D_11 ra52_11f.
         RF103D_14 ra52ffff. RF103D_8 ra52_8ff. RF103E ra52ffff.
         RF103E_11 ra52_11f. RF103E_14 ra52ffff. RF103E_8 ra52_8ff.
         RF103F ra52ffff. RF103F_11 ra52_11f. RF103F_14 ra52ffff.
         RF103F_8 ra52_8ff. RF103G ra52ffff. RF103G_11 ra52_11f.
         RF103G_14 ra52ffff. RF103G_8 ra52_8ff. RF103H ra52ffff.
         RF103H_11 ra52_11f. RF103H_14 ra52ffff. RF103H_8 ra52_8ff.
         RF103I ra52ffff. RF103I_11 ra52_11f. RF103I_14 ra52ffff.
         RF103I_8 ra52_8ff. RF103J ra52ffff. RF103J_11 ra52_11f.
         RF103J_14 ra52ffff. RF103J_8 ra52_8ff. RF103K ra52ffff.
         RF103K_11 ra52_11f. RF103K_14 ra52ffff. RF103K_8 ra52_8ff.
         RF103L ra52ffff. RF103L_11 ra52_11f. RF103L_14 ra52ffff.
         RF103L_8 ra52_8ff. RF103M ra52ffff. RF103M_11 ra52_11f.
         RF103M_14 ra52ffff. RF103M_8 ra52_8ff. RF104 ra52ffff.
         RF104_14 ra52ffff. RF105 ra52ffff. RF105_14 ra52ffff.
         RF10_11 ra52_11f. RF10_14 ra52ffff. RF10_8 ra52_8ff.
         RF111 ra41ffff. RF111_8 ra51_8ff. RF112 ra41ffff.
         RF112_8 ra51_8ff. RF113 ra41ffff. RF113_8 ra51_8ff.
         RF12 ra52ffff. RF12_11 ra52_11f. RF12_14 ra52ffff.
         RF12_8 ra52_8ff. RF13 ra52ffff. RF13_11 ra52_11f.
         RF13_14 ra52ffff. RF13_8 ra52_8ff. RF14 ra41ffff.
         RF14_11 ra51_11f. RF14_14 ra41ffff. RF14_8 ra51_8ff.
         RF15 ra41ffff. RF15_11 ra51_11f. RF15_14 ra41ffff.
         RF15_8 ra51_8ff. RF1_14 ra41ffff. RF1_8 ra52_8ff.
         RF2 ra52ffff. RF21 ra52ffff. RF211 ra52ffff.
         RF211_11 ra52_11f. RF211_14 ra52ffff. RF211_8 ra52_8ff.
         RF21_11 ra52_11f. RF21_14 ra52ffff. RF21_8 ra52_8ff.
         RF22 ra52ffff. RF221_11 ra52_11f. RF221_14 ra52ffff.
         RF22_11 ra52_11f. RF22_14 ra52ffff. RF22_8 ra52_8ff.
         RF23 ra52ffff. RF23_11 ra52_11f. RF23_14 ra52ffff.
         RF23_8 ra52_8ff. RF24_11 ra52_11f. RF24_14 ra52ffff.
         RF25A_14 ra52ffff. RF25B_11 ra52_11f. RF25B_14 ra52ffff.
         RF25_11 ra52_11f. RF26_11 ra52_11f. RF26_14 ra52ffff.
         RF27_11 ra52_11f. RF27_14 ra52ffff. RF2_14 ra52ffff.
         RF2_8 ra52_8ff. RF31 ra41ffff. RF31_11 ra51_11f.
         RF31_14 ra41ffff. RF31_8 ra51_8ff. RF32 ra41ffff.
         RF32_11 ra51_11f. RF32_14 ra41ffff. RF32_8 ra51_8ff.
         RF33 ra41ffff. RF33_11 ra51_11f. RF33_14 ra41ffff.
         RF33_8 ra51_8ff. RF34 ra41ffff. RF340 ra41ffff.
         RF340_11 ra51_11f. RF340_14 ra41ffff. RF340_8 ra51_8ff.
         RF34_11 ra51_11f. RF34_14 ra41ffff. RF34_8 ra51_8ff.
         RF35 ra41ffff. RF35_11 ra51_11f. RF35_14 ra41ffff.
         RF35_8 ra51_8ff. RF41 ra41ffff. RF41A_11 ra52_11f.
         RF41A_14 ra52ffff. RF41B_11 ra52_11f. RF41B_14 ra52ffff.
         RF41_11 ra51_11f. RF41_14 ra41ffff. RF41_8 ra51_8ff.
         RF42 ra52ffff. RF42_11 ra52_11f. RF42_14 ra52ffff.
         RF42_8 ra52_8ff. RF43A ra52ffff. RF43A_11 ra52_11f.
         RF43A_14 ra52ffff. RF43A_8 ra52_8ff. RF43B ra52ffff.
         RF43B_11 ra52_11f. RF43B_14 ra52ffff. RF43B_8 ra52_8ff.
         RF43C ra52ffff. RF43C_11 ra52_11f. RF43C_14 ra52ffff.
         RF43C_8 ra52_8ff. RF43D ra52ffff. RF43D_11 ra52_11f.
         RF43D_14 ra52ffff. RF43D_8 ra52_8ff. RF44 ra52ffff.
         RF44_11 ra52_11f. RF44_14 ra52ffff. RF44_8 ra52_8ff.
         RF45 ra52ffff. RF45_11 ra52_11f. RF45_14 ra52ffff.
         RF45_8 ra52_8ff. RF46 ra52ffff. RF46_11 ra52_11f.
         RF46_14 ra52ffff. RF46_8 ra52_8ff. RF47_11 rd1_11ff.
         RF47_14 ra52ffff. RF47_8 rd1_8fff. RF5 ra41ffff.
         RF5_11 ra51_11f. RF5_14 ra41ffff. RF5_8 ra51_8ff.
         RF61 ra41ffff. RF610 ra52ffff. RF610_11 ra51_11f.
         RF610_14 ra52ffff. RF610_8 ra51_8ff. RF61_11 ra51_11f.
         RF61_14 ra41ffff. RF61_8 ra51_8ff. RF62 ra41ffff.
         RF62_11 ra51_11f. RF62_14 ra41ffff. RF62_8 ra51_8ff.
         RF63 ra41ffff. RF63_11 ra51_11f. RF63_14 ra41ffff.
         RF63_8 ra51_8ff. RF64 ra41ffff. RF64_11 ra51_11f.
         RF64_14 ra41ffff. RF64_8 ra51_8ff. RF651A ra41ffff.
         RF651A1_11 ra52_11f. RF651A1_14 ra52ffff. RF651A2_11 ra52_11f.
         RF651A2_14 ra52ffff. RF651A_8 ra51_8ff. RF651B ra41ffff.
         RF651B1_11 ra52_11f. RF651B1_14 ra52ffff. RF651B2_11 ra52_11f.
         RF651B2_14 ra52ffff. RF651B_8 ra51_8ff. RF652 ra52ffff.
         RF6521_11 ra52_11f. RF6521_14 ra52ffff. RF652A_11 ra52_11f.
         RF652A_14 ra52ffff. RF652B_11 ra52_11f. RF652B_14 ra52ffff.
         RF652_8 ra51_8ff. RF66 ra52ffff. RF66_11 ra52_11f.
         RF66_14 ra52ffff. RF66_8 ra52_8ff. RF71 ra52ffff.
         RF71_11 ra52_11f. RF71_14 ra52ffff. RF71_8 ra52_8ff.
         RF721 ra52ffff. RF721_11 ra52_11f. RF721_14 ra52ffff.
         RF721_8 ra52_8ff. RF722 ra52ffff. RF722_11 ra52_11f.
         RF722_14 ra52ffff. RF722_8 ra52_8ff. RF73 ra52ffff.
         RF73_11 ra52_11f. RF73_14 ra52ffff. RF73_8 ra52_8ff.
         RF74 ra41ffff. RF74_11 ra51_11f. RF74_14 ra41ffff.
         RF74_8 ra51_8ff. RF81 ra52ffff. RF81_11 ra52_11f.
         RF81_14 ra52ffff. RF81_8 ra52_8ff. RF821 ra52ffff.
         RF821_11 ra52_11f. RF821_14 ra52ffff. RF821_8 ra52_8ff.
         RF822 ra52ffff. RF822_11 ra52_11f. RF822_14 ra52ffff.
         RF822_8 ra52_8ff. RF83 ra52ffff. RF83_11 ra52_11f.
         RF83_14 ra52ffff. RF83_8 ra52_8ff. RF84 ra41ffff.
         RF84_11 ra51_11f. RF84_14 ra41ffff. RF84_8 ra51_8ff.
         RF85 ra41ffff. RF85_11 ra51_11f. RF85_14 ra41ffff.
         RF85_8 ra51_8ff. RF86 ra41ffff. RF86_11 ra51_11f.
         RF86_14 ra41ffff. RF86_8 ra51_8ff. RF9 ra52ffff.
         RF901A_11 ra52_11f. RF901_11 ra52_11f. RF902A_11 ra52_11f.
         RF902_11 ra52_11f. RF91 ra52ffff. RF91_11 ra52_11f.
         RF91_14 ra52ffff. RF91_8 ra52_8ff. RF92A ra52ffff.
         RF92A_11 ra52_11f. RF92A_14 ra52ffff. RF92A_8 ra52_8ff.
         RF92B ra52ffff. RF92B_11 ra52_11f. RF92B_14 ra52ffff.
         RF92B_8 ra52_8ff. RF92C ra52ffff. RF92C_11 ra52_11f.
         RF92C_14 ra52ffff. RF92C_8 ra52_8ff. RF92D ra52ffff.
         RF92D_11 ra52_11f. RF92D_14 ra52ffff. RF92D_8 ra52_8ff.
         RF92E ra52ffff. RF92E_11 ra52_11f. RF92E_14 ra52ffff.
         RF92E_8 ra52_8ff. RF92F ra52ffff. RF92F_11 ra52_11f.
         RF92F_14 ra52ffff. RF92F_8 ra52_8ff. RF92G ra52ffff.
         RF92G_11 ra52_11f. RF92G_14 ra52ffff. RF92G_8 ra52_8ff.
         RF92H ra52ffff. RF92H_11 ra52_11f. RF92H_14 ra52ffff.
         RF92H_8 ra52_8ff. RF92I ra52ffff. RF92I_11 ra52_11f.
         RF92I_14 ra52ffff. RF92I_8 ra52_8ff. RF92J ra52ffff.
         RF92J_11 ra52_11f. RF92J_14 ra52ffff. RF92J_8 ra52_8ff.
         RF92K ra52ffff. RF9_11 ra52_11f. RF9_8 ra52_8ff.
         RG01 ra41ffff. RG01_11 ra52_11f. RG01_14 ra41ffff.
         RG02 ra41ffff. RG02_11 ra51_11f. RG02_14 ra41ffff.
         RG02_8 ra51_8ff. RG101_8 ra51_8ff. RG102_8 ra51_8ff.
         RG1061_11 ra52_11f. RG1061_14 ra52ffff. RG1062_11 ra52_11f.
         RG1062_14 ra52ffff. RG1063_11 ra52_11f. RG1063_14 ra52ffff.
         RG106_11 ra52_11f. RG106_14 ra52ffff. RG13 ra41ffff.
         RG130 ra41ffff. RG130_11 ra52_11f. RG130_14 ra41ffff.
         RG13_11 ra52_11f. RG13_14 ra41ffff. RG13_8 ra51_8ff.
         RG14A ra52ffff. RG14A_11 ra51_11f. RG14A_14 ra52ffff.
         RG14A_8 ra51_8ff. RG14B ra52ffff. RG14B_11 ra51_11f.
         RG14B_14 ra52ffff. RG14B_8 ra51_8ff. RG14C ra52ffff.
         RG14C_11 ra51_11f. RG14C_14 ra52ffff. RG14C_8 ra51_8ff.
         RG15A_8 ra51_8ff. RG15B_8 ra51_8ff. RG15C_8 ra51_8ff.
         RG15D_8 ra51_8ff. RG15E_8 ra51_8ff. RG15F_8 ra51_8ff.
         RG15G_8 ra51_8ff. RG15H_8 ra51_8ff. RG15I_8 ra51_8ff.
         RG15J_8 ra51_8ff. RG15K_8 ra51_8ff. RG15L_8 ra51_8ff.
         RG15M_8 ra51_8ff. RG15N_8 ra51_8ff. RG15O_8 ra51_8ff.
         RG15P_8 ra51_8ff. RG15Q_8 ra51_8ff. RG15R_8 ra51_8ff.
         RG15S_8 ra51_8ff. RG15T_8 ra51_8ff. RG15U_8 ra51_8ff.
         RG15V_8 ra51_8ff. RG1_11 ra52_11f. RG1_14 ra52ffff.
         RG21_11 ra51_11f. RG21_14 ra52ffff. RG21_8 ra51_8ff.
         RG22_11 ra51_11f. RG22_14 ra52ffff. RG22_8 ra51_8ff.
         RG23_11 ra52_11f. RG23_14 ra52ffff. RG24A_11 ra52_11f.
         RG24A_14 ra52ffff. RG24_11 ra52_11f. RG24_14 ra52ffff.
         RG25A_11 ra52_11f. RG25A_14 ra52ffff. RG25_11 ra52_11f.
         RG25_14 ra52ffff. RG3_11 ra51_11f. RG3_14 ra52ffff.
         RG3_8 ra51_8ff. RG4A_11 ra52_11f. RG4A_14 ra52ffff.
         RG4B_11 ra52_11f. RG4B_14 ra52ffff. RG4_11 ra51_11f.
         RG4_14 ra52ffff. RG4_8 ra51_8ff. RG51_8 ra51_8ff.
         RG52_8 ra51_8ff. RG5_11 ra52_11f. RG5_14 ra52ffff.
         TYPE typeffff. VAGE_11 yearin_f. YEARIN_11 yearin_f.
    ;
*/

RUN ;
