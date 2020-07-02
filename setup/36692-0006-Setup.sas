/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |         (DATASET 0006: 2011-2014 LONGITUDINAL DATA, VERSION 1)
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
 | "c:\temp\36692-0006-data.txt").
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
VALUE d14licdf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) licensed with college degree' 2='(2) licensed without college degree'
                3='(3) unlicensed' 8='(8) do not know' 9='(9) missing';
VALUE a541ffff  -1='(-001) not applicable' 8888='(8888) don''t know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE a535ffff  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE f6521fff  1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE d14a533f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) detached house'
                2='(2) duplex/triplex' 3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE c31dffff  0='(0) wrong' 1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE d11medif  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 3='(3) was not sick' 8='(8) do not know' 9='(9) missing';
VALUE g01fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE f64affff  0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE f251ffff  -1='(-0001) not applicable' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
VALUE d14vdayf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 88='(88) do not know'
                99='(99) missing';
VALUE g14a1fff  -1='(-1) not applicable' 1='(01) hypertension' 2='(02) diabetes'
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
VALUE f27fffff  1='(1) not worth' 2='(2) not necessary'
                3='(3) cannot afford to the payment' 8='(8) do not know' 9='(9) missing';
VALUE g101ffff  888='(888) don''t know' 999='(999) missing';
VALUE d14carpf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) medical insurance' 2='(2) self' 3='(3) spouse' 4='(4) children/grandchildren'
                5='(5) state or collectives' 6='(6) others' 8='(8) do not know' 9='(9) missing';
VALUE g102cfff  888='(888) do not know' 998='(998) more than 1000' 999='(999) missing';
VALUE a540ffff  1='(1) no child or child is unavailable for caregiving'
                2='(2) don''t want to bother children'
                3='(3) no own house/apartment but want to separate with children'
                4='(4) able to interact with other old persons' 5='(5) others' 8='(8) do not know'
                9='(9) missing';
VALUE f610ffff  -1='(-1) not applicable (not sick)' 1='(1) no money'
                2='(2) far from hospital' 3='(3) inconvenience to travel' 4='(4) nobody to go with'
                5='(5) didn''t want to go' 6='(6) other' 8='(8) do not know' 9='(9) missing';
VALUE a2ffffff  1='(1) han' 2='(2) hui' 3='(3) zhuang' 4='(4) yao' 5='(5) korea'
                6='(6) man' 7='(7) mongolia' 8='(8) others' 9='(9) missing';
VALUE a532ffff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) do not know'
                9='(9) missing';
VALUE d14g102f  -9='(-09) lost to follow-up in the 2014 survey'
                -7='(-07) for deceased, not applicable for survivors' -1='(-01) not applicable'
                888='(888) do not know' 999='(999) missing';
VALUE b210ffff  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 8='(8) do not know'
                9='(9) missing';
VALUE d14bedrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) no' 2='(2) yes'
                8='(8) do not know' 9='(9) missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE a54bffff  88='(88) don''t know' 99='(99) missing';
VALUE g4afffff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e6bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d14dplaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) home' 2='(2) hospital'
                3='(3) institutions' 4='(4) others' 8='(8) do not know' 9='(9) missing';
VALUE d4b_14ff  1='(1) Green tea' 2='(2) Red tea (black tea)' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE f221ffff  88888='(88888) do not know' 99999='(99999) missing';
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
VALUE e0ffffff  1='(1) yes, strongly limited' 2='(2) yes, limited' 3='(3) not limited'
                8='(8) do not know' 9='(9) missing';
VALUE e67fffff  -1='(-01) not applicable' 888='(888) not able to answer'
                998='(998) more than 1000' 999='(999) missing';
VALUE f211ffff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 9='(9) missing';
VALUE e12fffff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                8='(8) do not know' 9='(9) missing';
VALUE a54affff  8888='(8888) don''t know' 9999='(9999) missing';
VALUE f12affff  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
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
VALUE d14dresf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE g1061fff  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 8='(8) do not know'
                9='(9) missing';
VALUE d14illff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) do not know' 99='(99) missing';
VALUE g81fffff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE f34fffff  1='(1) very rich' 2='(2) rich' 3='(3) so so' 4='(4) poor'
                5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE f21fffff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE f901b1ff  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE d4drug1f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE e65fffff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) not able to answer' 9='(9) missing';
VALUE b28fffff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE d11affff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE d14d26a_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                88='(88) don''t know' 99='(99) missing';
VALUE d14d26a_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) male' 2='(2) female' 8='(8) don''t know' 9='(9) missing';
VALUE d14bathf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) fully independent' 2='(2) partially independent' 3='(3) fully dependent'
                8='(8) do not know' 9='(9) missing';
VALUE e63fffff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE d14wcfaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE g23fffff  0='(0) do not brush' 1='(1) occasionally' 2='(2) once a day'
                3='(3) twice a day' 4='(4) three or more times a day ' 8='(8) do not know'
                9='(9) not applicable (no teeth)';
VALUE c11fffff  0='(0) wrong' 1='(1) correct' 8='(8) not able to answer' 9='(9) missing';
VALUE f92a5fff  -1='(-1) not applicable' 1='(1) same village' 2='(2) same town/district'
                3='(3) same county/city' 4='(4) county/city near by' 5='(5) elsewhere'
                8='(8) don''t know' 9='(9) missing';
VALUE f31fffff  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 99='(99) missing';
VALUE a534ffff  8888='(8888) do not know' 9999='(9999) missing';
VALUE d1ffffff  1='(1) rice' 2='(2) corn(maize)' 3='(3) wheat (noodles and bread etc.)'
                4='(4) rice and wheat' 5='(5) other' 9='(9) missing';
VALUE d14a535f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE h1ffffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 9='(9) missing';
VALUE d14marr_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) yes' 2='(2) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d14d21bf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know' 9='(9) missing';
VALUE e6ffffff  1='(1) without assistance' 2='(2) with some help' 3='(3) need feeding'
                9='(9) missing';
VALUE g15a3fff  -1='(-1) not applicable' 1='(1) rather serious' 2='(2) more or less'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE a53a1fff  -1='(-1) not applicable' 0='(0) spouse' 1='(1) child'
                2='(2) spouse of child' 3='(3) grandchild' 4='(4)  spouse of grandchild'
                5='(5) great grandchild or spouse of great grandchild' 6='(6) sibling'
                7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE a530ffff  -1='(-1) not applicable' 1='(1) purchased' 2='(2) self-built'
                3='(3) inherited' 4='(4) welfare-oriented public housing' 5='(5) rented'
                6='(6) subleased' 7='(7) others' 8='(8) don''t know' 9='(9) missing';
VALUE e2ffffff  1='(1) without assistance' 2='(2) need assistance for trying shoes'
                3='(3)  assistance in getting clothes and getting dressed' 9='(9) missing';
VALUE d4a_14ff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE d91fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE c55fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
                9='(9) missing';
VALUE d14knddf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) liquor' 2='(2) wine' 3='(3) rice wine' 4='(4) others' 8='(8) don''t know'
                9='(9) missing';
VALUE provffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang' 31='(31) shanghai'
                32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian' 36='(36) jiangxi'
                37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan' 44='(44) guangdong'
                45='(45) guangxi' 46='(46) hainan' 50='(50) chongqing' 51='(51) sichuan'
                61='(61) shaanxi';
VALUE f43a2fff  -1='(-1) not applicable' 1='(1) married' 2='(2) divorced' 3='(3) widowed'
                8='(8) don''t know' 9='(9) missing';
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
VALUE d33fffff  1='(1) vegetable grease' 2='(2) gingili grease' 3='(3) lard'
                4='(4) other animal''s fat' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_3f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) suddenly (over a few days)' 2='(2) over a few months' 3='(3) over a few years'
                8='(8) do not know' 9='(9) missing';
VALUE f22fffff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE d14g106_1f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know' 9='(9) missing';
VALUE dth11_1f  -9='(-9) lost to follow-up in the 2014 survey'
                -8='(-8) died or lost to follow-up in previous waves'
                0='(0) surviving at the 2014 survey' 1='(1) died before the 2014 survey';
VALUE d14outdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' 8888='(8888) do not know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE g4bfffff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE d14g4bff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 3='(3) never brushing teeth' 8='(8) don''t know' 9='(9) missing';
VALUE f35fffff  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE g1062fff  1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE g6ffffff  1='(1) regular' 2='(2) irregular' 8='(8) do not know' 9='(9) missing';
VALUE d14g106_2f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE d14contf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) able to control' 2='(2) occasional accidents'
                3='(3) catheter was used or was incontinent' 8='(8) do not know' 9='(9) missing';
VALUE d14dreaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 3='(3) not sure' 8='(8) do not know' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no' 8='(8) didn''t answer' 9='(9) missing';
VALUE g9ffffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                8='(8) don''t know' 9='(9) missing';
VALUE d14a537f  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE g131ffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE f41a12ff  88='(88) do not know' 99='(99) missing';
VALUE h3ffffff  1='(1) surprisingly healthy' 2='(2) relatively healthy'
                3='(3) moderately ill' 4='(4) very ill' 8='(8) do not know' 9='(9) missing';
VALUE f41fffff  1='(1) currently married and living with spouse'
                2='(2) married but not living with spouse' 3='(3)  divorced' 4='(4) widowed'
                5='(5) never married' 8='(8) do not know' 9='(9) missing';
VALUE e3ffffff  1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE f45fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) professional'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE e62fffff  -1='(-1) not applicable' 1='(1) willing to do' 2='(2) without patience'
                3='(3) need respite care' 4='(4) unwilling to do' 8='(8) don''t know' 9='(9) missing';
VALUE e7ffffff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                9='(9) missing';
VALUE f2ffffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture, forestry, animal husbandry or fishery worker' 5='(5) houseworker'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d11finaf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) retirement wage' 2='(2) spouse' 3='(3) children' 4='(4) grandchildren'
                5='(5) other relative''s' 6='(6) state/local govenments or collectives' 7='(7) own work'
                8='(8) others' 9='(9) missing';
VALUE a53a3fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
                9='(9) missing';
VALUE h22fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) did not wish to participate'
                6='(6) could not understand due to cognitive impairment'
                7='(7) suffering from illness at moment' 8='(8) others' 9='(9) missing';
VALUE a537ffff  0='(0) never cooking' 1='(1) gas: from underground pipes'
                2='(2) gas: bottled, tank, or lp' 3='(3) electricity' 4='(4) fuel oil, kerosene, etc'
                5='(5) coal or coke' 6='(6) charcoal' 7='(7) solar energy' 8='(8) firewood or straw'
                9='(9) other';
VALUE a533ffff  1='(1) detached house' 2='(2) duplex/triplex'
                3='(3) low rise apartment (1-3 floors)'
                4='(4) high rise apartment (>3 floors, without elevators)'
                5='(5) high rise apartment (>3 floors, with elevators)' 6='(6) mobile home / trailer'
                7='(7) other' 8='(8) do not know' 9='(9) missing';
VALUE rd91ffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE f103a5ff  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g11fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE d14marrf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors'
                1='(1) married  living with the spouse' 2='(2) married but not living with the spouse'
                3='(3) divorce' 4='(4) widowed' 5='(5) never married' 9='(9) missing';
VALUE g1ffffff  1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see'
                4='(4) blind' 8='(8) don''t know' 9='(9) missing';
VALUE g132ffff  88='(88) bedridden all the year around' 99='(99) missing';
VALUE a52fffff  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE a53a2fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE d14hypef  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 0='(0) no' 1='(1) yes'
                8='(8) do not know' 9='(9) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4)  seldom'
                5='(5) never' 8='(8)  not able to answer' 9='(9) missing';
VALUE monthinf  99='(99) missing';
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE f103a2ff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
                8='(8) don''t know' 9='(9) missing';
VALUE e1ffffff  1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 8='(8) do not know' 9='(9) missing';
VALUE f1032fff  1='(1) yes' 2='(2) no'
                3='(3) no child who is not in corsidence with me but live in the sa'
                8='(8) not able to answer' 9='(9) missing';
VALUE f141ffff  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE g4ffffff  1='(1) right-handed' 2='(2) left-handed' 8='(8) don''t know'
                9='(9) missing';
VALUE f25b1fff  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE d14g106f  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) yes'
                2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE d14d26af  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                0='(0) spouse' 1='(1) child' 2='(2) spouse of child' 3='(3) grandchild'
                4='(4) spouse of grandchild' 5='(5) great grandchild or spouse of great grandchild'
                6='(6) sibling' 7='(7) parent or parent-in-law' 8='(8) other' 9='(9) missing';
VALUE d34fffff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE d14g4fff  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) right-handed'
                2='(2) left-handed' 8='(8) don''t know' 9='(9) missing';
VALUE g1063fff  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE f46fffff  -1='(-1) not applicable' 1='(1) yes full time' 2='(2) yes part time'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE a531ffff  -1='(-1) not applicable' 1='(1) self or spouse' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 8='(8) don''t know'
                9='(9) missing';
VALUE d14painf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable'
                1='(1) very painful' 2='(2) painful' 3='(3) so so' 4='(4) relatively peaceful'
                5='(5) peaceful' 6='(6) difficult to say' 8='(8) don''t know' 9='(9) missing';
VALUE f111afff  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE a51fffff  1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution'
                9='(9) missing';
VALUE f1033fff  1='(1) yes' 2='(2) no'
                3='(3) no child who live in other village/district/city' 8='(8) not able to answer'
                9='(9) missing';
VALUE d14dirdf  -9='(-009) lost to follow-up in the 2014 survey'
                -7='(-007) for deceased, not applicable for survivors' -1='(-001) not applicable'
                8888='(8888) don''t know' 9999='(9999) missing';
VALUE d14livaf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) nursing home'
                2='(2) never-married and alone' 3='(3) widowed and alone' 4='(4) with old spouse only'
                5='(5) with married child (including grandchildren)'
                6='(6) with married grandchild (not including child)'
                7='(7) with unmarried child/grandchild' 8='(8) other relative' 9='(9) other';
VALUE a43fffff  1='(1) urban' 2='(2) rural' 8='(8) don''t know' 9='(9) missing';
VALUE f16fffff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                8='(8) do not know' 9='(9) missing';
VALUE g14a2fff  -1='(-01) not applicable' 888='(888) bedridden all the year around'
                999='(999) missing';
VALUE re1_14ff  0='(0) without proxy';
VALUE c22fffff  -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE f32affff  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 88='(88) do not know' 99='(99) missing';
VALUE d14smokf  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE e1bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 100000 days' 9999='(9999) missing';
VALUE d14doctf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 1='(1) no'
                2='(2) yes' 8='(8) do not know' 9='(9) missing';
VALUE f340ffff  0='(0) make decisions on some of the main spending  in my household'
                1='(1) make decisions on almost all spending in my household'
                2='(2) make decisions on some of the non-main spending in my househ'
                3='(3) make decisions only on own spending' 4='(4) cannot make decisons on any spending '
                5='(5) don''t know' 8='(8) do not know' 9='(9) missing';
VALUE d31fffff  1='(1) almost everyday' 2='(2) quite often' 3='(3) occasionally'
                4='(4) rarely or never' 8='(8) don''t know' 9='(9) missing';
VALUE d11cffff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 8='(8) do not know' 9='(9) missing';
VALUE a53a4fff  -1='(-1) not applicable' 0='(0) no education'
                1='(1) attend school but not graduated from primary school' 2='(2) primary school'
                3='(3) middle school' 4='(4) high school' 5='(5) collage or above' 8='(8) don''t know'
                9='(9) missing';
VALUE c16fffff  88='(88) not able to answer' 99='(99) missing';
VALUE a53a5fff  -1='(-1) not applicable' 88='(88) don''t know' 99='(99) missing';
VALUE e4ffffff  1='(1) without assistance' 2='(2) with assistance' 3='(3) bedridden'
                9='(9) missing';
VALUE d32fffff  1='(1) almost everyday' 2='(2) except winter' 3='(3) occasionally'
                4='(4) rarely or never' 8='(8) don''t know' 9='(9) missing';
VALUE b121ffff  1='(1) much better' 2='(2) a little better' 3='(3) no change'
                4='(4) a little worse' 5='(5) much worse' 8='(8) not able to answer' 9='(9)  missing';
VALUE e64fffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children and their spouses' 4='(4) grandchildren and their spouses'
                5='(5) public and collectives' 6='(6) others' 8='(8) not able to answer' 9='(9) missing';
VALUE d6afffff  1='(1) from a well' 2='(2) from a river or lake' 3='(3) from a spring'
                4='(4) from a pond or pool' 5='(5) tap water' 8='(8) don''t know' 9='(9) missing';
VALUE h5ffffff  888='(888) don''t know';
VALUE d77fffff  1='(1) at much less risk' 2='(2) at less risk' 3='(3) at the same risk'
                4='(4) at higher risk' 5='(5) at much higher risk' 8='(8) do not know' 9='(9) missing';
VALUE a41fffff  11='(11) beijing' 12='(12) tianjin' 13='(13) hebei' 14='(14) shanxi'
                15='(15) inner mongolia' 21='(21) liaoning' 22='(22) jilin' 23='(23) helongjiang'
                31='(31) shanghai' 32='(32) jiangsu' 33='(33) zhejiang' 34='(34) anhui' 35='(35) fujian'
                36='(36) jiangxi' 37='(37) shangdong' 41='(41) henan' 42='(42) hubei' 43='(43) hunan'
                44='(44) guangdong' 45='(45) guangxi' 46='(46)  hainan' 50='(50) chongqing'
                51='(51) sichuan' 52='(52)  guizhou' 53='(53) yunnan' 54='(54)  tibet' 61='(61) shaanxi'
                62='(62) gansu' 63='(63)  qinghai' 64='(64)  ningxia' 65='(65)  xinjiang'
                71='(71) taiwan' 81='(81) hongkong' 88='(88) don''t know' 90='(90) north korea'
                91='(91) south korea' 92='(92) burma' 93='(93) indonesia' 94='(94)  japan'
                95='(95) vietnam' 96='(96) others' 99='(99) missing';
VALUE d76fffff  1='(1) within 5 minutes' 2='(2) 6-30 minutes' 3='(3) 31-60 minutes'
                4='(4) after 60 minutes' 8='(8) do not know ' 9='(9) missing';
VALUE g15a1fff  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9)  missing';
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000' 3='(3) elder first interviewed in 2002'
                4='(4) elder first interviewed in 2005' 5='(5) elder first interviewed in 2008'
                6='(6) newly added elder to replace deceased, migrated, refusal, or'
                7='(7) newly added centenarian or newly added elder aged 65 to 68'
                8='(8) sibling aged 80+ of another interviewee aged 80+' 9='(9) missing';
VALUE relatypf  -1='(-1) not applicable' 1='(1) full sibling' 2='(2) half sibling'
                3='(3) adopted sibling' 4='(4) others' 9='(9) missing';
VALUE g511ffff  888='(888) do not know' 999='(999) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                8='(8) don''t know' 9='(9) missing';
VALUE f47fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) do not know' 9='(9) missing';
VALUE d14tapwf  -9='(-9) lost to follow-up in the 2014 survey'
                -7='(-7) for deceased, not applicable for survivors' -1='(-1) not applicable' 0='(0) no'
                1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE a542ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f5ffffff  1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchildren'
                8='(08) other relatives' 9='(09) friends and neighbors' 10='(10) social services'
                11='(11) live-in care giver' 12='(12) nobody' 88='(88) don''t know' 99='(99) missing';
VALUE f84fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE d14genef  -9='(-9) lost to follow-up in the 2014survey'
                -7='(-7) for deceased, not applicable for survivors' 1='(1) one generation'
                2='(2) two generations' 3='(3) three generation household'
                4='(4) four or more gernerations' 8='(8) do not know' 9='(9) missing';
VALUE ra41ffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                9='(9) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0006;
INFILE "&VERSION\DS0006\36692-0006-Data.txt" LRECL=4244;
INPUT
       ID 1-8                  YEARIN 9-12
        MONTHIN 13-14           DAYIN 15-16             V_BTHYR 17-20
        V_BTHMON 21-22          PROV 23-24              TYPE 25
        RELATYPE 26-27          YB222 28-35             RESIDENC 36
        TRUEAGE 37-39           A1 40                   A2 41
        RA41 42-43              A41 44-45               RA42 46-47
        A42 48                  RA43 49-50              A43 51
        RA51 52-53              A51 54                  RA52 55-56
        A52 57-58               RA53A 59-60             A53A1 61-62
        A53A3 63-64             A53A2 65-67             A53A4 68-69
        A53A5 70-71             RA53B 72-73             A53B1 74-75
        A53B3 76-77             A53B2 78-80             A53B4 81-82
        A53B5 83-84             RA53C 85-86             A53C1 87-88
        A53C3 89-90             A53C2 91-93             A53C4 94-95
        A53C5 96-97             RA53D 98-99             A53D1 100-101
        A53D3 102-103           A53D2 104-106           A53D4 107-108
        A53D5 109-110           RA53E 111-112           A53E1 113-114
        A53E3 115-116           A53E2 117-119           A53E4 120-121
        A53E5 122-123           RA53F 124-125           A53F1 126-127
        A53F3 128-129           A53F2 130-132           A53F4 133-134
        A53F5 135-136           RA53G 137-138           A53G1 139-140
        A53G3 141-142           A53G2 143-147 .1        A53G4 148-149
        A53G5 150-151           RA53H 152-153           A53H1 154-155
        A53H3 156-157           A53H2 158-160           A53H4 161-162
        A53H5 163-164           RA53I 165-166           A53I1 167-168
        A53I3 169-170           A53I2 171-173           A53I4 174-175
        A53I5 176-177           RA53J 178-179           A53J1 180-181
        A53J3 182-183           A53J2 184-186           A53J4 187-188
        A53J5 189-190           RA530 191-192           A530 193-194
        RA531 195-196           A531 197-198            RA532 199-200
        A532 201-202            RA533 203-204           A533 205
        A533A $206              RA534 207-208           A534 209-212
        RA535 213-214           A535 215                RA536 216-217
        A536 218                RA537 219-220           A537 221
        RA540 222-223           A540 224                RA541 225-226
        A541 227-230            RA542 231-232           A542 233-234
        A542A $235              RA54 236-237            A54A 238-241
        A54B 242-243            B11 244                 B12 245
        B121 246                B21 247                 B22 248
        B23 249                 B24 250                 B25 251
        B26 252                 B27 253                 B28 254
        B29 255                 B210 256                C11 257
        C12 258                 C13 259                 C14 260
        C15 261                 C16 262-263             C21A 264
        C21B 265                C21C 266                C22 267-268
        C31A 269                C31B 270                C31C 271
        C31D 272                C31E 273                C32 274
        C41A 275                C41B 276                C41C 277
        C51A 278                C51B 279                C52 280
        C52X1 281               C52X2 282               C53A 283
        C53B 284                C53C 285                C54 286
        C55 287-288             RD1 289-290             D1 291
        RD2 292-293             D2 294-308 .12          RD31 309-310
        D31 311                 RD32 312-313            D32 314
        RD33 315-316            D33 317                 D33A $318
        RD34 319-320            D34 321                 RD4MEAT 322-323
        D4MEAT2 324             D4MEAT1 325             RD4FISH 326-327
        D4FISH2 328             D4FISH1 329             RD4EGG 330-331
        D4EGG2 332              D4EGG1 333              RD4BEAN 334-335
        D4BEAN2 336             D4BEAN1 337             RD4VEG 338-339
        D4VEG2 340              D4VEG1 341              RD4SUGA 342-343
        D4SUGA2 344             D4SUGA1 345             RD4TEA 346-347
        D4TEA2 348              D4TEA1 349              RD4GARL 350-351
        D4GARL2 352             D4GARL1 353             RDEMILK 354-355
        D4MILK1 356             D4MILK2 357             RD4NUT 358-359
        D4NUT1 360              D4NUT2 361              RD4ALGA 362-363
        D4ALGA1 364             D4ALGA2 365             RD4VIT 366-367
        D4VIT1 368              D4VIT2 369              RD4DRUG 370-371
        D4DRUG1 372             D4DRUG2 373             RD5 374-375
        D5 376                  RD6 377-378             D6A 379
        D6B 380                 D6C 381                 RD71 382-383
        D71 384                 RD72 385-386            D72 387
        RD73 388-389            D73 390-392             RD74 393-394
        D74 395-397             RD75 398-399            D75 400-401
        RD76 402-403            D76 404                 RD77 405-406
        D77 407                 RD78 408-409            D78 410
        D78A 411-414 .1         D78B 415-416            RD79 417-418
        D79 419                 D79A 420-423 .1         D79B 424-425
        RD710 426-427           D710 428                D710A 429-443 .12
        D710B 444-445           RD81 446-447            D81 448
        RD82 449-450            D82 451                 RD83 452-453
        D83 454-456             RD84 457-458            D84 459-461
        RD85 462-463            D85 464-465             RD86 466-467
        D86 468-482 .12         RD87 483-484            D87 485
        RD91 486                D91 487                 RD92 488-489
        D92 490                 RD93 491-492            D93 493-495
        RD94 496-497            D94 498-500             RD101 501-502
        D101 503                RD102 504-505           D102 506-508
        RD103 509-510           D103 511-513            RD11A 514-515
        D11A 516                RD11B 517-518           D11B 519
        RD11C 520-521           D11C 522                RD11D 523-524
        D11D 525                RD11E 526-527           D11E 528
        RD11F 529-530           D11F 531                RD11G 532-533
        D11G 534                RD11H 535-536           D11H 537
        RD12 538-539            D12 540-541             RE0 542-543
        E0 544                  RE1 545-546             E1 547
        RE1B 548-549            E1B 550-553             RE2 554-555
        E2 556                  RE2B 557-558            E2B 559-562
        RE3 563-564             E3 565                  RE3B 566-567
        E3B 568-571             RE4 572-573             E4 574
        RE4B 575-576            E4B 577-580             RE5 581-582
        E5 583                  RE5B 584-585            E5B 586-589
        RE6 590-591             E6 592                  RE6B 593-594
        E6B 595-598             RE610 599-600           E610 601-602
        RE62 603-604            E62 605-606             RE63 607-608
        E63 609-613             RE64 614-615            E64 616-617
        E64A $618               RE65 619-620            E65 621-622
        RE67 623-624            E67 625-627             RE7 628-629
        E7 630                  RE8 631-632             E8 633
        RE9 634-635             E9 636                  RE10 637-638
        E10 639                 RE11 640-641            E11 642
        RE12 643-644            E12 645                 RE13 646-647
        E13 648                 RE14 649-650            E14 651
        RF1 652-653             F1 654-655              RF2 656-657
        F2 658-659              RF21 660-661            F21 662-663
        RF211 664-665           F211 666-667            RF22 668-669
        F22 670-673             RF221 674-675           F221 676-680
        RF23 681-682            F23 683-684             RF24 685-686
        F24 687                 RF25 688-689            F251 690-694
        F252 695-699            RF25B 700-701           F25B1 702-705
        F25B2 706-707           RF26 708-709            F26 710-713
        RF27 714-715            F27 716                 RF31 717-718
        F31 719-720             RF32 721-722            F32A 723-724
        F32B 725-726            F32C 727-728            F32D 729-730
        F32E 731-732            RF33 733-734            F33 735-736
        RF340 737-738           F340 739                RF34 740-741
        F34 742                 RF35 743-744            F35 745-749
        RF41 750-751            F41 752                 RF41A 753-754
        F41A1 755               F41A11 756-759          F41A12 760-761
        F41A2 762               F41A21 763-766          F41A22 767-768
        F41A3 769               F41A31 770-773          F41A32 774-775
        RF41B 776-777           F41B 778                F41B1 779-782
        F41B2 783-784           RF42 785-786            F42 787-788
        RF43A 789-790           F43A1 791-793           F43A2 794-795
        F43A3 796-798           F43A4 799-800           RF43B 801-802
        F43B1 803-805           F43B2 806-807           F43B3 808-810
        F43B4 811-812           RF43C 813-814           F43C1 815-817
        F43C2 818-819           F43C3 820-822           F43C4 823-824
        RF43D 825-826           F43D1 827-829           F43D2 830-831
        F43D3 832-834           F43D4 835-836           RF44 837-838
        F44 839-840             RF45 841-842            F45 843-844
        RF46 845-846            F46 847-848             RF47 849-850
        F47 851                 RF5 852-853             F5 854-855
        RF61 856-857            F61 858                 RF610 859-860
        F610 861-862            RF62 863-864            F62 865
        RF63 866-867            F63 868                 RF64 869-870
        F64A 871                F64B 872                F64C 873
        F64D 874                F64E1 875               F64F1 876
        F64G1 877               F64H1 878               F64I 879
        RF651A1 880-881         F651A1 882-886          RF651B1 887-888
        F651B1 889-893          RF651A2 894-895         F651A2 896-900
        RF651B2 901-902         F651B2 903-907          RF6521 908-909
        F6521 910               RF652A 911-912          F652A 913-927 .11
        RF652B 928-929          F652B 930               RF66 931-932
        F66 933                 RF71 934-935            F71 936
        RF721 937-938           F721 939-941            RF722 942-943
        F722 944-946            F722A 947               RF73 948-949
        F73 950-952             RF74 953                F74 954-955
        RF81 956-957            F81 958                 RF821 959-960
        F821 961-963            RF822 964-965           F822 966-968
        F822A 969               RF83 970-971            F83 972-974
        RF84 975                F84 976-977             RF85 978
        F85 979-980             RF86 981                F86 982-983
        RF9 984-985             F9 986-987              F9A 988-989
        RF901 990-991           F901 992-993            RF901A 994-995
        F901A 996               F901B1 997-999          F901B2 1000-1002
        F901B3 1003-1005        RF902 1006-1007         F902 1008-1009
        RF902A 1010-1011        F902A 1012              F902B1 1013-1015
        F902B2 1016-1018        F902B3 1019-1021        RF91 1022-1023
        F91 1024-1025           RF92A 1026-1027         F92A1 1028-1029
        F92A2 1030-1031         F92A3 1032-1033         F92A4 1034-1036
        F92A5 1037-1038         F92A6 1039-1040         F92A7 1041-1042
        RF92B 1043-1044         F92B1 1045-1046         F92B2 1047-1048
        F92B3 1049-1050         F92B4 1051-1053         F92B5 1054-1055
        F92B6 1056-1057         F92B7 1058-1059         RF92C 1060-1061
        F92C1 1062-1063         F92C2 1064-1065         F92C3 1066-1067
        F92C4 1068-1070         F92C5 1071-1072         F92C6 1073-1074
        F92C7 1075-1076         RF92D 1077-1078         F92D1 1079-1080
        F92D2 1081-1082         F92D3 1083-1084         F92D4 1085-1087
        F92D5 1088-1089         F92D6 1090-1091         F92D7 1092-1093
        RF92E 1094-1095         F92E1 1096-1097         F92E2 1098-1099
        F92E3 1100-1101         F92E4 1102-1104         F92E5 1105-1106
        F92E6 1107-1108         F92E7 1109-1110         RF92F 1111-1112
        F92F1 1113-1114         F92F2 1115-1116         F92F3 1117-1118
        F92F4 1119-1121         F92F5 1122-1123         F92F6 1124-1125
        F92F7 1126-1127         RF92G 1128-1129         F92G1 1130-1131
        F92G2 1132-1133         F92G3 1134-1135         F92G4 1136-1138
        F92G5 1139-1140         F92G6 1141-1142         F92G7 1143-1144
        RF92H 1145-1146         F92H1 1147-1148         F92H2 1149-1150
        F92H3 1151-1152         F92H4 1153-1155         F92H5 1156-1157
        F92H6 1158-1159         F92H7 1160-1161         RF92I 1162-1163
        F92I1 1164-1165         F92I2 1166-1167         F92I3 1168-1169
        F92I4 1170-1172         F92I5 1173-1174         F92I6 1175-1176
        F92I7 1177-1178         RF92J 1179-1180         F92J1 1181-1182
        F92J2 1183-1184         F92J3 1185-1186         F92J4 1187-1189
        F92J5 1190-1191         F92J6 1192-1193         F92J7 1194-1195
        JIGE 1196-1197          RF10 1198-1199          F10 1200-1201
        F10A 1202-1203          RF101 1204-1205         F101 1206-1207
        RF102 1208-1209         F102 1210-1211          F103 1212-1213
        RF1030 1214-1215        F1030 1216-1217         RF1030A 1218-1219
        F1030A 1220             F1030B1 1221-1223       F1030B2 1224-1226
        F1030B3 1227-1229       RF1031 1230-1231        F1031 1232-1233
        RF1031A 1234-1235       F1031A 1236             F1031B1 1237-1239
        F1031B2 1240-1242       F1031B3 1243-1245       RF103A 1246-1247
        F103A8 1248-1249        F103A1 1250-1251        F103A2 1252-1253
        F103A3 1254-1256        F103A4 1257-1258        F103A7 1259-1260
        F103A5 1261-1262        RF103B 1263-1264        F103B8 1265-1266
        F103B1 1267-1268        F103B2 1269-1270        F103B3 1271-1273
        F103B4 1274-1275        F103B7 1276-1277        F103B5 1278-1279
        RF103C 1280-1281        F103C8 1282-1283        F103C1 1284-1285
        F103C2 1286-1287        F103C3 1288-1290        F103C4 1291-1292
        F103C7 1293-1294        F103C5 1295-1296        RF103D 1297-1298
        F103D8 1299-1300        F103D1 1301-1302        F103D2 1303-1304
        F103D3 1305-1307        F103D4 1308-1309        F103D7 1310-1311
        F103D5 1312-1313        RF103E 1314-1315        F103E8 1316-1317
        F103E1 1318-1319        F103E2 1320-1321        F103E3 1322-1324
        F103E4 1325-1326        F103E7 1327-1328        F103E5 1329-1330
        RF103F 1331-1332        F103F8 1333-1334        F103F1 1335-1336
        F103F2 1337-1338        F103F3 1339-1343 .1     F103F4 1344-1345
        F103F7 1346-1347        F103F5 1348-1349        RF103G 1350-1351
        F103G8 1352-1353        F103G1 1354-1355        F103G2 1356-1357
        F103G3 1358-1362 .1     F103G4 1363-1364        F103G7 1365-1366
        F103G5 1367-1368        RF103H 1369-1370        F103H8 1371-1372
        F103H1 1373-1374        F103H2 1375-1376        F103H3 1377-1391 .11
        F103H4 1392-1393        F103H7 1394-1395        F103H5 1396-1397
        RF103I 1398-1399        F103I8 1400-1401        F103I1 1402-1403
        F103I2 1404-1405        F103I3 1406-1408        F103I4 1409-1410
        F103I7 1411-1412        F103I5 1413-1414        RF103J 1415-1416
        F103J8 1417-1418        F103J1 1419-1420        F103J2 1421-1422
        F103J3 1423-1425        F103J4 1426-1427        F103J7 1428-1429
        F103J5 1430-1431        RF103K 1432-1433        F103K8 1434-1435
        F103K1 1436-1437        F103K2 1438-1439        F103K3 1440-1442
        F103K4 1443-1444        F103K7 1445-1446        F103K5 1447-1448
        RF103L 1449-1450        F103L8 1451-1452        F103L1 1453-1454
        F103L2 1455-1456        F103L3 1457-1459        F103L4 1460-1461
        F103L7 1462-1463        F103L5 1464-1465        RF103M 1466-1467
        F103M8 1468-1469        F103M1 1470-1471        F103M2 1472-1473
        F103M3 1474-1476        F103M4 1477-1478        F103M7 1479-1480
        F103M5 1481-1482        RF1032 1483-1484        F1032 1485
        RF1033 1486-1487        F1033 1488              F111A 1489-1490
        F111B 1491-1492         F111C 1493-1494         F112A 1495-1496
        F112B 1497-1498         F112C 1499-1500         F113A 1501-1502
        F113B 1503-1504         F113C 1505-1506         RF12 1507-1508
        F12A 1509-1513          F12B 1514-1518          F12C 1519-1523
        RF13 1524-1525          F13A 1526-1530          F13B 1531-1535
        F13C 1536-1540          RF14 1541-1542          F141 1543
        F142 1544               F143 1545               F144 1546
        F145 1547               F146 1548               F147 1549
        F148 1550               F149 1551               RF15 1552-1553
        F151 1554               F152 1555               F153 1556
        F154 1557               F155 1558               F156 1559
        F157 1560               F158 1561               F159 1562
        F16 1563                RG01 1564-1565          G01 1566
        RG02 1567-1568          G02 1569-1583 .12       RG1 1584-1585
        G1 1586                 G1A $1587               RG21 1588-1589
        G21 1590-1591           RG22 1592-1593          G22 1594
        RG23 1595-1596          G23 1597                RG24 1598-1599
        G24 1600                RG24A 1601-1602         G24A 1603-1604
        RG25 1605-1606          G25 1607                RG25A 1608-1609
        G25A 1610-1611          RG3 1612-1613           G3 1614
        RG4 1615-1616           G4 1617                 RG4A 1618-1619
        G4A 1620                RG4B 1621-1622          G4B 1623
        RG5 1624-1625           G511 1626-1628          G512 1629-1631
        G521 1632-1634          G522 1635-1637          G6 1638
        G7 1639-1641            G81 1642                G82 1643
        G83 1644                G9 1645                 G101 1646-1660 .11
        G1011 1661-1662         G102 1663               G1021 1664-1666
        G122 1667-1668          G123 1669-1670          G102B 1671-1673
        G102C 1674-1676         RG106 1677-1678         G106 1679
        RG1061 1680-1681        G1061 1682              RG1062 1683-1684
        G1062 1685              RG1063 1686-1687        G1063 1688
        G11 1689                G12 1690-1691           RG130 1692-1693
        G130 1694               RG13 1695-1696          G131 1697-1698
        G132 1699-1700          RG14A 1701-1702         G14A1 1703-1704
        G14A2 1705-1708         G141T $1709             RG14B 1710-1711
        G14B1 1712-1713         G14B2 1714-1716         G142T $1717
        RG14C 1718-1719         G14C1 1720-1721         G14C2 1722-1724
        G143T $1725             G15A1 1726              G15A2 1727
        G15A3 1728-1729         G15B1 1730              G15B2 1731
        G15B3 1732-1733         G15C1 1734              G15C2 1735
        G15C3 1736-1737         G15D1 1738              G15D2 1739
        G15D3 1740-1741         G15E1 1742              G15E2 1743
        G15E3 1744-1745         G15F1 1746              G15F2 1747
        G15F3 1748-1749         G15G1 1750              G15G2 1751
        G15G3 1752-1753         G15H1 1754              G15H2 1755
        G15H3 1756-1757         G15I1 1758              G15I2 1759
        G15I3 1760-1761         G15J1 1762              G15J2 1763
        G15J3 1764-1765         G15K1 1766              G15K2 1767
        G15K3 1768-1769         G15L1 1770              G15L2 1771
        G15L3 1772-1773         G15M1 1774              G15M2 1775
        G15M3 1776-1777         G15N1 1778              G15N2 1779
        G15N3 1780-1781         G15O1 1782              G15O2 1783
        G15O3 1784-1785         G15P1 1786              G15P2 1787
        G15P3 1788-1789         G15Q1 1790              G15Q2 1791
        G15Q3 1792-1793         G15R1 1794              G15R2 1795
        G15R3 1796-1797         G15N1A 1798             G15N2A 1799
        G15N3A 1800-1801        G15S1 1802              G15S2 1803
        G15S3 1804-1805         G15T1 1806              G15T2 1807
        G15T3 1808-1809         G15U1 1810              G15U2 1811
        G15U3 1812-1813         G15J1A 1814             G15J2A 1815
        G15J3A 1816-1817        G15V1 1818              G15V2 1819
        G15V3 1820-1821         G15Y1 $1822-1830        G15Y2 1831
        G15Y3 1832-1833         H1 1834                 H21 1835
        H22 1836-1837           H3 1838                 H5 1839-1841
        H6 1842                 H7 1843                 H71 1844-1845
        W_2011 1846-1860 .12    DTH11_14 1861-1862      YEARIN_14 1863-1866
        MONTHIN_14 1867-1868    DAYIN_14 1869-1870      V_BTHYR_14 1871-1874
        V_BTHMON_14 1875-1876   RESIDENC_14 1877        TRUEAGE_14 1878-1880
        RA41_14 1881-1882       A41_14 1883-1884        RA42_14 1885-1886
        A42_14 1887             RA43_14 1888-1889       A43_14 1890
        RA51_14 1891-1892       A51_14 1893             RA52_14 1894-1895
        A52_14 1896-1897        RA53A_14 1898-1899      A53A1_14 1900-1901
        A53A11_14 1902          A53A2_14 1903-1905      A53A3_14 1906-1908
        A53A4_14 1909-1910      A53A5_14 1911-1912      RA53B_14 1913-1914
        A53B1_14 1915-1916      A53B11_14 1917          A53B2_14 1918-1920
        A53B3_14 1921-1923      A53B4_14 1924-1925      A53B5_14 1926-1927
        RA53C_14 1928-1929      A53C1_14 1930-1931      A53C11_14 1932
        A53C2_14 1933-1935      A53C3_14 1936-1940 .1   A53C4_14 1941-1942
        A53C5_14 1943-1944      RA53D_14 1945-1946      A53D1_14 1947-1948
        A53D11_14 1949          A53D2_14 1950-1952      A53D3_14 1953-1967 .11
        A53D4_14 1968-1969      A53D5_14 1970-1971      RA53E_14 1972-1973
        A53E1_14 1974-1975      A53E11_14 1976          A53E2_14 1977-1979
        A53E3_14 1980-1982      A53E4_14 1983-1984      A53E5_14 1985-1986
        RA53F_14 1987-1988      A53F1_14 1989-1990      A53F11_14 1991
        A53F2_14 1992-1994      A53F3_14 1995-1999 .1   A53F4_14 2000-2001
        A53F5_14 2002-2003      RA53G_14 2004-2005      A53G1_14 2006-2007
        A53G11_14 2008          A53G2_14 2009-2011      A53G3_14 2012-2014
        A53G4_14 2015-2016      A53G5_14 2017-2018      RA53H_14 2019-2020
        A53H1_14 2021-2022      A53H11_14 2023          A53H2_14 2024-2026
        A53H3_14 2027-2029      A53H4_14 2030-2031      A53H5_14 2032-2033
        RA53I_14 2034-2035      A53I1_14 2036-2037      A53I11_14 2038
        A53I2_14 2039-2041      A53I3_14 2042-2044      A53I4_14 2045-2046
        A53I5_14 2047-2048      RA53J_14 2049-2050      A53J1_14 2051-2052
        A53J11_14 2053          A53J2_14 2054-2056      A53J3_14 2057-2059
        A53J4_14 2060-2061      A53J5_14 2062-2063      RA530_14 2064-2065
        A530_14 2066-2067       A530A_14 2068           RA531_14 2069-2070
        A531_14 2071-2072       A531A_14 2073           RA532_14 2074-2075
        A532_14 2076-2077       RA533_14 2078-2079      A533_14 2080
        A533A_14 2081           RA534_14 2082-2083      A534_14 2084-2087
        RA535_14 2088-2089      A535_14 2090            RA536_14 2091-2092
        A536_14 2093            RA537_14 2094-2095      A537_14 2096
        A537A_14 2097           RA540_14 2098-2099      A540_14 2100
        RA541_14 2101-2102      A541_14 2103-2106       RA542_14 2107-2108
        A542_14 2109-2110       A542A_14 2111           RA54_14 2112-2113
        A54A_14 2114-2117       A54B_14 2118-2119       B11_14 2120
        B12_14 2121             B121_14 2122            B21_14 2123
        B22_14 2124             B23_14 2125             B24_14 2126
        B25_14 2127             B26_14 2128             B27_14 2129
        B28_14 2130             B29_14 2131             B210_14 2132
        C11_14 2133             C12_14 2134             C13_14 2135
        C14_14 2136             C15_14 2137             C16_14 2138-2139
        C21A_14 2140            C21B_14 2141            C21C_14 2142
        C22_14 2143-2144        C31A_14 2145            C31B_14 2146
        C31C_14 2147            C31D_14 2148            C31E_14 2149
        C32_14 2150             C41A_14 2151            C41B_14 2152
        C41C_14 2153            C51A_14 2154            C51B_14 2155
        C52_14 2156             C53A_14 2157            C53B_14 2158
        C53C_14 2159            C54_14 2160             C55_14 2161-2162
        RD1_14 2163-2164        D1_14 2165              RD2_14 2166-2167
        D2_14 2168-2171 .1      RD31_14 2172-2173       D31_14 2174
        RD32_14 2175-2176       D32_14 2177             RD33_14 2178-2179
        D33_14 2180             D33A_14 2181            RD34_14 2182-2183
        D34_14 2184             RD4MEAT_14 2185-2186    D4MEAT2_14 2187
        D4MEAT1_14 2188         RD4FISH_14 2189-2190    D4FISH2_14 2191
        D4FISH1_14 2192         RD4EGG_14 2193-2194     D4EGG2_14 2195
        D4EGG1_14 2196          RD4BEAN_14 2197-2198    D4BEAN2_14 2199
        D4BEAN1_14 2200         RD4VEG_14 2201-2202     D4VEG2_14 2203
        D4VEG1_14 2204          RD4SUGA_14 2205-2206    D4SUGA2_14 2207
        D4SUGA1_14 2208         RD4TEA_14 2209-2210     D4TEA2_14 2211
        D4TEA1_14 2212          RD4GARL_14 2213-2214    D4GARL2_14 2215
        D4GARL1_14 2216         RD4MILK_14 2217-2218    D4MILK1_14 2219
        D4MILK2_14 2220         RD4NUT_14 2221-2222     D4NUT1_14 2223
        D4NUT2_14 2224          RD4ALGA_14 2225-2226    D4ALGA1_14 2227
        D4ALGA2_14 2228         RD4VIT_14 2229-2230     D4VIT1_14 2231
        D4VIT2_14 2232          RD4DRUG_14 2233-2234    D4DRUG1_14 2235
        D4DRUG2_14 2236         D4A_14 2237             D4B_14 2238
        RD5_14 2239-2240        D5_14 2241              RD6_14 2242-2243
        D6A_14 2244             D6B_14 2245             D6C_14 2246
        RD71_14 2247-2248       D71_14 2249             RD72_14 2250-2251
        D72_14 2252             RD73_14 2253-2254       D73_14 2255-2257
        RD74_14 2258-2259       D74_14 2260-2262        RD75_14 2263-2264
        D75_14 2265-2266        RD76_14 2267-2268       D76_14 2269
        RD77_14 2270-2271       D77_14 2272             RD78_14 2273-2274
        D78_14 2275             D78A_14 2276-2279 .1    D78B_14 2280-2281
        RD79_14 2282-2283       D79_14 2284             D79A_14 2285-2288 .1
        D79B_14 2289-2290       RD710_14 2291-2292      D710_14 2293
        D710A_14 2294-2297 .1   D710B_14 2298-2299      RD81_14 2300-2301
        D81_14 2302             RD82_14 2303-2304       D82_14 2305
        RD83_14 2306-2307       D83_14 2308-2310        RD84_14 2311-2312
        D84_14 2313-2315        RD85_14 2316-2317       D85_14 2318-2319
        D85A_14 2320            RD86_14 2321-2322       D86_14 2323-2337 .12
        RD87_14 2338-2339       D87_14 2340             RD91_14 2341
        D91_14 2342             RD92_14 2343-2344       D92_14 2345
        RD93_14 2346-2347       D93_14 2348-2350        RD94_14 2351-2352
        D94_14 2353-2355        RD101_14 2356-2357      D101_14 2358
        RD102_14 2359-2360      D102_14 2361-2363       RD103_14 2364-2365
        D103_14 2366-2368       RD11A_14 2369-2370      D11A_14 2371
        RD11B_14 2372-2373      D11B_14 2374            RD11C_14 2375-2376
        D11C_14 2377            RD11D_14 2378-2379      D11D_14 2380
        RD11E_14 2381-2382      D11E_14 2383            RD11F_14 2384-2385
        D11F_14 2386            RD11G_14 2387-2388      D11G_14 2389
        RD11H_14 2390-2391      D11H_14 2392            RD12_14 2393-2394
        D12_14 2395-2396        RE0_14 2397-2398        E0_14 2399
        RE1_14 2400             E1_14 2401              RE1B_14 2402-2403
        E1B_14 2404-2407        RE2_14 2408             E2_14 2409
        RE2B_14 2410-2411       E2B_14 2412-2415        RE3_14 2416
        E3_14 2417              RE3B_14 2418-2419       E3B_14 2420-2423
        RE4_14 2424             E4_14 2425              RE4B_14 2426-2427
        E4B_14 2428-2431        RE5_14 2432             E5_14 2433
        RE5B_14 2434-2435       E5B_14 2436-2439        RE6_14 2440
        E6_14 2441              RE6B_14 2442-2443       E6B_14 2444-2447
        RE610_14 2448-2449      E610_14 2450-2451       RE62_14 2452-2453
        E62_14 2454-2455        RE63_14 2456-2457       E63_14 2458-2462
        RE64_14 2463-2464       E64_14 2465-2466        E64A_14 2467
        RE65_14 2468-2469       E65_14 2470-2471        RE67_14 2472-2473
        E67_14 2474-2476        RE7_14 2477-2478        E7_14 2479
        RE8_14 2480-2481        E8_14 2482              RE9_14 2483-2484
        E9_14 2485              RE10_14 2486-2487       E10_14 2488
        RE11_14 2489-2490       E11_14 2491             RE12_14 2492-2493
        E12_14 2494             RE13_14 2495-2496       E13_14 2497
        RE14_14 2498-2499       E14_14 2500             RF1_14 2501-2502
        F1_14 2503-2504         RF2_14 2505-2506        F2_14 2507-2508
        RF21_14 2509-2510       F21_14 2511-2512        RF211_14 2513-2514
        F211_14 2515-2516       RF22_14 2517-2518       F22_14 2519-2522
        RF221_14 2523-2524      F221_14 2525-2529       RF23_14 2530-2531
        F23_14 2532-2533        RF24_14 2534-2535       F24_14 2536
        RF25A_14 2537-2538      F25A1_14 2539-2543      F25A2_14 2544-2549
        RF25B_14 2550-2551      F25B1_14 2552-2555      F25B2_14 2556-2557
        RF26_14 2558-2559       F26_14 2560-2562        RF27_14 2563-2564
        F27_14 2565             RF31_14 2566-2567       F31_14 2568-2569
        RF32_14 2570-2571       F32A_14 2572-2573       F32B_14 2574-2575
        F32C_14 2576-2577       F32D_14 2578-2579       F32E_14 2580-2581
        RF33_14 2582-2583       F33_14 2584-2585        RF340_14 2586-2587
        F340_14 2588            RF34_14 2589-2590       F34_14 2591
        RF35_14 2592-2593       F35_14 2594-2598        RF41_14 2599-2600
        F41_14 2601             RF41A_14 2602-2603      F41A1_14 2604
        F41A11_14 2605-2608     F41A12_14 2609-2610     F41A2_14 2611
        F41A21_14 2612-2615     F41A22_14 2616-2617     F41A3_14 2618
        F41A31_14 2619-2622     F41A32_14 2623-2624     RF41B_14 2625-2626
        F41B_14 2627            F41B1_14 2628-2631      F41B2_14 2632-2633
        RF42_14 2634-2635       F42_14 2636-2637        RF43A_14 2638-2639
        F43A1_14 2640-2642      F43A2_14 2643-2644      F43A3_14 2645-2647
        F43A4_14 2648-2649      RF43B_14 2650-2651      F43B1_14 2652-2654
        F43B2_14 2655-2656      F43B3_14 2657-2659      F43B4_14 2660-2661
        RF43C_14 2662-2663      F43C1_14 2664-2666      F43C2_14 2667-2668
        F43C3_14 2669-2671      F43C4_14 2672-2673      RF43D_14 2674-2675
        F43D1_14 2676-2678      F43D2_14 2679-2680      F43D3_14 2681-2683
        F43D4_14 2684-2685      RF44_14 2686-2687       F44_14 2688-2689
        RF45_14 2690-2691       F45_14 2692-2693        RF46_14 2694-2695
        F46_14 2696-2697        RF47_14 2698-2699       F47_14 2700
        RF5_14 2701-2702        F5_11_14 2703-2704      RF61_14 2705-2706
        F61_14 2707             RF610_14 2708-2709      F610_14 2710-2711
        RF62_14 2712-2713       F62_14 2714             RF63_14 2715-2716
        F63_14 2717             RF64_14 2718-2719       F64A_14 2720
        F64B_14 2721            F64C_14 2722            F64D_14 2723
        F64E_14 2724            F64F_14 2725            F64G_14 2726
        F64H_14 2727            F64I_14 2728            RF651A1_14 2729-2730
        F651A1_14 2731-2735     RF651B1_14 2736-2737    F651B1_14 2738-2742
        RF651A2_14 2743-2744    F651A2_14 2745-2750     RF651B2_14 2751-2752
        F651B2_14 2753-2757     RF6521_14 2758-2759     F6521_14 2760
        F6521T_14 2761          RF652A_14 2762-2763     F652A_14 2764-2778 .11
        RF652B_14 2779-2780     F652B_14 2781           RF66_14 2782-2783
        F66_14 2784             RF71_14 2785-2786       F71_14 2787
        RF721_14 2788-2789      F721_14 2790-2792       RF722_14 2793-2794
        F722_14 2795-2797       RF73_14 2798-2799       F73_14 2800-2802
        RF74_14 2803            F74_14 2804-2807 .1     RF81_14 2808-2809
        F81_14 2810             RF821_14 2811-2812      F821_14 2813-2815
        RF822_14 2816-2817      F822_14 2818-2820       RF83_14 2821-2822
        F83_14 2823-2837 .11    RF84_14 2838            F84_14 2839-2840
        RF85_14 2841            F85_14 2842-2843        RF86_14 2844
        F86_14 2845-2846        RF91_14 2847-2848       F91_14 2849-2850
        RF92A_14 2851-2852      F92A1_14 2853-2854      F92A2_14 2855-2856
        F92A3_14 2857-2858      F92A4_14 2859-2861      F92A5_14 2862-2863
        F92A6_14 2864-2865      F92A7_14 2866-2867      RF92B_14 2868-2869
        F92B1_14 2870-2871      F92B2_14 2872-2873      F92B3_14 2874-2875
        F92B4_14 2876-2878      F92B5_14 2879-2880      F92B6_14 2881-2882
        F92B7_14 2883-2884      RF92C_14 2885-2886      F92C1_14 2887-2888
        F92C2_14 2889-2890      F92C3_14 2891-2892      F92C4_14 2893-2895
        F92C5_14 2896-2897      F92C6_14 2898-2899      F92C7_14 2900-2901
        RF92D_14 2902-2903      F92D1_14 2904-2905      F92D2_14 2906-2907
        F92D3_14 2908-2909      F92D4_14 2910-2912      F92D5_14 2913-2914
        F92D6_14 2915-2916      F92D7_14 2917-2918      RF92E_14 2919-2920
        F92E1_14 2921-2922      F92E2_14 2923-2924      F92E3_14 2925-2926
        F92E4_14 2927-2929      F92E5_14 2930-2931      F92E6_14 2932-2933
        F92E7_14 2934-2935      RF92F_14 2936-2937      F92F1_14 2938-2939
        F92F2_14 2940-2941      F92F3_14 2942-2943      F92F4_14 2944-2946
        F92F5_14 2947-2948      F92F6_14 2949-2950      F92F7_14 2951-2952
        RF92G_14 2953-2954      F92G1_14 2955-2956      F92G2_14 2957-2958
        F92G3_14 2959-2960      F92G4_14 2961-2963      F92G5_14 2964-2965
        F92G6_14 2966-2967      F92G7_14 2968-2969      RF92H_14 2970-2971
        F92H1_14 2972-2973      F92H2_14 2974-2975      F92H3_14 2976-2977
        F92H4_14 2978-2980      F92H5_14 2981-2982      F92H6_14 2983-2984
        F92H7_14 2985-2986      RF92I_14 2987-2988      F92I1_14 2989-2990
        F92I2_14 2991-2992      F92I3_14 2993-2994      F92I4_14 2995-2997
        F92I5_14 2998-2999      F92I6_14 3000-3001      F92I7_14 3002-3003
        RF92J_14 3004-3005      F92J1_14 3006-3007      F92J2_14 3008-3009
        F92J3_14 3010-3011      F92J4_14 3012-3014      F92J5_14 3015-3016
        F92J6_14 3017-3018      F92J7_14 3019-3020      JIGE_14 3021-3022
        RF10_14 3023-3024       F10_14 3025-3026        F10A_14 3027-3028
        RF101_14 3029-3030      F101_14 3031-3032       RF102_14 3033-3034
        F102_14 3035-3036       RF103A_14 3037-3038     F103A8_14 3039-3040
        F103A1_14 3041-3042     F103A2_14 3043-3044     F103A3_14 3045-3059 .11
        F103A4_14 3060-3061     F103A7_14 3062-3063     F103A5_14 3064-3065
        RF103B_14 3066-3067     F103B8_14 3068-3069     F103B1_14 3070-3071
        F103B2_14 3072-3073     F103B3_14 3074-3088 .11 F103B4_14 3089-3090
        F103B7_14 3091-3092     F103B5_14 3093-3094     RF103C_14 3095-3096
        F103C8_14 3097-3098     F103C1_14 3099-3100     F103C2_14 3101-3102
        F103C3_14 3103-3117 .11 F103C4_14 3118-3119     F103C7_14 3120-3121
        F103C5_14 3122-3123     RF103D_14 3124-3125     F103D8_14 3126-3127
        F103D1_14 3128-3129     F103D2_14 3130-3131     F103D3_14 3132-3146 .11
        F103D4_14 3147-3148     F103D7_14 3149-3150     F103D5_14 3151-3152
        RF103E_14 3153-3154     F103E8_14 3155-3156     F103E1_14 3157-3158
        F103E2_14 3159-3160     F103E3_14 3161-3163     F103E4_14 3164-3165
        F103E7_14 3166-3167     F103E5_14 3168-3169     RF103F_14 3170-3171
        F103F8_14 3172-3173     F103F1_14 3174-3175     F103F2_14 3176-3177
        F103F3_14 3178-3180     F103F4_14 3181-3182     F103F7_14 3183-3184
        F103F5_14 3185-3186     RF103G_14 3187-3188     F103G8_14 3189-3190
        F103G1_14 3191-3192     F103G2_14 3193-3194     F103G3_14 3195-3197
        F103G4_14 3198-3199     F103G7_14 3200-3201     F103G5_14 3202-3203
        RF103H_14 3204-3205     F103H8_14 3206-3207     F103H1_14 3208-3209
        F103H2_14 3210-3211     F103H3_14 3212-3214     F103H4_14 3215-3216
        F103H7_14 3217-3218     F103H5_14 3219-3220     RF103I_14 3221-3222
        F103I8_14 3223-3224     F103I1_14 3225-3226     F103I2_14 3227-3228
        F103I3_14 3229-3231     F103I4_14 3232-3233     F103I7_14 3234-3235
        F103I5_14 3236-3237     RF103J_14 3238-3239     F103J8_14 3240-3241
        F103J1_14 3242-3243     F103J2_14 3244-3245     F103J3_14 3246-3248
        F103J4_14 3249-3250     F103J7_14 3251-3252     F103J5_14 3253-3254
        RF103K_14 3255-3256     F103K8_14 3257-3258     F103K1_14 3259-3260
        F103K2_14 3261-3262     F103K3_14 3263-3265     F103K4_14 3266-3267
        F103K7_14 3268-3269     F103K5_14 3270-3271     RF103L_14 3272-3273
        F103L8_14 3274-3275     F103L1_14 3276-3277     F103L2_14 3278-3279
        F103L3_14 3280-3282     F103L4_14 3283-3284     F103L7_14 3285-3286
        F103L5_14 3287-3288     RF103M_14 3289-3290     F103M8_14 3291-3292
        F103M1_14 3293-3294     F103M2_14 3295-3296     F103M3_14 3297-3299
        F103M4_14 3300-3301     F103M7_14 3302-3303     F103M5_14 3304-3305
        RF104_14 3306-3307      F104_14 3308-3310       RF105_14 3311-3312
        F105_14 3313-3315       F111A_14 3316-3317      F111B_14 3318-3319
        F111C_14 3320-3321      F112A_14 3322-3323      F112B_14 3324-3325
        F112C_14 3326-3327      F113A_14 3328-3329      F113B_14 3330-3331
        F113C_14 3332-3333      RF12_14 3334-3335       F12A_14 3336-3340
        F12B_14 3341-3345       F12C_14 3346-3350       RF13_14 3351-3352
        F13A_14 3353-3357       F13B_14 3358-3362       F13C_14 3363-3367
        RF14_14 3368-3369       F141_14 3370            F142_14 3371
        F143_14 3372            F144_14 3373            F145_14 3374
        F146_14 3375            F147_14 3376            F148_14 3377
        F149_14 3378            F14T_14 3379            RF15_14 3380-3381
        F151_14 3382            F152_14 3383            F153_14 3384
        F154_14 3385            F155_14 3386            F156_14 3387
        F157_14 3388            F158_14 3389            F159_14 3390
        F15T_14 3391            F16_14 3392             RG01_14 3393-3394
        G01_14 3395             RG02_14 3396-3397       G02_14 3398-3399
        RG1_14 3400-3401        G1_14 3402              G1A_14 3403
        RG21_14 3404-3405       G21_14 3406-3407        RG22_14 3408-3409
        G22_14 3410-3411        RG23_14 3412-3413       G23_14 3414
        RG24_14 3415-3416       G24_14 3417             RG24A_14 3418-3419
        G24A_14 3420-3421       RG25_14 3422-3423       G25_14 3424
        RG25A_14 3425-3426      G25A_14 3427-3428       RG3_14 3429-3430
        G3_14 3431              RG4_14 3432-3433        G4_14 3434
        RG4A_14 3435-3436       G4A_14 3437             RG4B_14 3438-3439
        G4B_14 3440             RG5_14 3441-3442        G511_14 3443-3445
        G512_14 3446-3448       G521_14 3449-3451       G522_14 3452-3454
        G6_14 3455              G7_14 3456-3458         G81_14 3459
        G82_14 3460             G83_14 3461             G9_14 3462
        G101_14 3463-3477 .11   G1011_14 3478-3481 .1   G102_14 3482
        G1021_14 3483-3485      G122_14 3486-3488       G123_14 3489-3493 .1
        G102C_14 3494-3496      RG106_14 3497-3498      G106_14 3499
        RG1061_14 3500-3501     G1061_14 3502           RG1062_14 3503-3504
        G1062_14 3505           RG1063_14 3506-3507     G1063_14 3508
        G11_14 3509             G12_14 3510-3511        RG130_14 3512-3513
        G130_14 3514            RG13_14 3515-3516       G131_14 3517-3518
        G132_14 3519-3520       RG14A_14 3521-3522      G14A1_14 3523-3524
        G14A2_14 3525-3528      G141T_14 3529           RG14B_14 3530-3531
        G14B1_14 3532-3533      G14B2_14 3534-3536      G142T_14 3537
        RG14C_14 3538-3539      G14C1_14 3540-3541      G14C2_14 3542-3544
        G143T_14 3545           G15A1_14 3546           G15A2_14 3547
        G15A3_14 3548-3549      G15B1_14 3550           G15B2_14 3551
        G15B3_14 3552-3553      G15C1_14 3554           G15C2_14 3555
        G15C3_14 3556-3557      G15D1_14 3558           G15D2_14 3559
        G15D3_14 3560-3561      G15E1_14 3562           G15E2_14 3563
        G15E3_14 3564-3565      G15F1_14 3566           G15F2_14 3567
        G15F3_14 3568-3569      G15G1_14 3570           G15G2_14 3571
        G15G3_14 3572-3573      G15H1_14 3574           G15H2_14 3575
        G15H3_14 3576-3577      G15I1_14 3578           G15I2_14 3579
        G15I3_14 3580-3581      G15J1_14 3582-3583      G15J2_14 3584
        G15J3_14 3585-3586      G15K1_14 3587           G15K2_14 3588
        G15K3_14 3589-3590      G15L1_14 3591           G15L2_14 3592
        G15L3_14 3593-3594      G15M1_14 3595           G15M2_14 3596
        G15M3_14 3597-3598      G15N1_14 3599           G15N2_14 3600
        G15N3_14 3601-3602      G15O1_14 3603           G15O2_14 3604
        G15O3_14 3605-3606      G15P1_14 3607           G15P2_14 3608
        G15P3_14 3609-3610      G15Q1_14 3611           G15Q2_14 3612
        G15Q3_14 3613-3614      G15R1_14 3615           G15R2_14 3616
        G15R3_14 3617-3618      G15N1A_14 3619          G15N2A_14 3620
        G15N3A_14 3621-3622     G15S1_14 3623           G15S2_14 3624
        G15S3_14 3625-3626      G15T1_14 3627           G15T2_14 3628
        G15T3_14 3629-3630      G15U1_14 3631-3632      G15U2_14 3633-3634
        G15U3_14 3635-3636      G15J1A_14 3637          G15J2A_14 3638
        G15J3A_14 3639-3640     G15V1_14 3641           G15V2_14 3642
        G15V3_14 3643-3644      G15Y1_14 $3645-3653     G15Y2_14 3654-3656
        G15Y3_14 3657-3658      G15YT_14 3659           H1_14 3660
        H21_14 3661             H22_14 3662-3663        H3_14 3664
        H5_14 3665-3667         H6_14 3668              H7_14 3669
        H71_14 3670-3671        D14VYEAR 3672-3675      D14VMONTH 3676-3677
        D14VDAY 3678-3679       D14AGE 3680-3682        D14MARRY 3683-3684
        D14MARRY1 3685-3686     D14YR1 $3687-3690       D14MON1 $3691-3692
        D14D22 3693-3694        D14D231 $3695-3703      D14D232 $3704-3712
        D14D233 $3713-3721      D14D234 $3722-3730      D14D24 $3731-3739
        D14D25 3740-3742        D14D26A1 3743-3745      D14D26A2 3746-3747
        D14D26A3 $3748-3756     D14D26A4 $3757-3765     D14D26A5 3766-3768
        D14D26A6 3769-3770      D14D26A61 $3771-3775    D14D26B1 3776-3777
        D14D26B2 3778-3779      D14D26B3 3780-3782      D14D26B4 3783-3785
        D14D26B5 3786-3788      D14D26B6 3789-3790      D14D26B61 $3791-3793
        D14D26C1 3794-3795      D14D26C2 3796-3797      D14D26C3 3798-3800
        D14D26C4 3801-3803      D14D26C5 3804-3806      D14D26C6 3807-3808
        D14D26C61 3809-3810     D14D26D1 3811-3812      D14D26D2 3813-3814
        D14D26D3 3815-3817      D14D26D4 3818-3820      D14D26D5 3821-3823
        D14D26D6 3824-3825      D14D26D61 3826-3828     D14D26E1 3829-3830
        D14D26E2 3831-3832      D14D26E3 $3833-3835     D14D26E4 $3836-3844
        D14D26E5 3845-3847      D14D26E6 3848-3849      D14D26E61 3850-3851
        D14D26F1 3852-3853      D14D26F2 3854-3855      D14D26F3 3856-3858
        D14D26F4 $3859-3867     D14D26F5 3868           D14D26F6 3869-3870
        D14D26F61 3871-3872     D14D26G1 3873-3874      D14D26G11 3875
        D14D26G2 3876-3877      D14D26G3 3878-3880      D14D26G4 3881
        D14D26G5 3882           D14D26G6 3883-3884      D14D26G61 3885-3886
        D14D26H1 3887-3888      D14D26H11 3889          D14D26H2 3890-3891
        D14D26H3 3892-3894      D14D26H4 $3895-3903     D14D26H5 3904
        D14D26H6 3905-3906      D14D26H61 3907-3908     D14D26I1 3909-3910
        D14D26I11 3911          D14D26I2 3912-3913      D14D26I3 3914-3915
        D14D26I4 3916           D14D26I5 3917           D14D26I6 3918-3919
        D14D26I61 3920-3921     D14D26J1 3922-3923      D14D26J11 3924
        D14D26J2 3925-3926      D14D26J3 3927-3928      D14D26J4 3929
        D14D26J5 3930           D14D26J51 3931          D14D26J6 3932-3933
        D14D26J61 $3934-3936    D14LIVARR 3937-3938     D14PERSON 3939-3941
        D14GENER 3942-3944      D14DPLACE 3945-3946     D14CARGIV 3947-3948
        D14PCGDAY $3949-3952    D14BEDRID 3953-3954     D14BEDDAY $3955-3963
        D14ILL 3964-3965        D14DISEA1 $3966-3974    D14DIDAY1 $3975-3983
        D14DISEA2 $3984-3992    D14DIDAY2 $3993-4001    D14DISEA3 $4002-4010
        D14DIDAY3 $4011-4014    D14HYPERT 4015-4016     D14DIABET 4017-4018
        D14HEART 4019-4020      D14CVD 4021-4022        D14PNEUM 4023-4024
        D14TUBERC 4025-4026     D14CANCER 4027-4028     D14GLAUCO 4029-4030
        D14PROSTA 4031-4032     D14GYNECO 4033-4034     D14GASTRI 4035-4036
        D14PARKIN 4037-4038     D14BEDSOR 4039-4040     D14DEMENT 4041-4042
        D14PSYCHO 4043-4044     D14NEUROS 4045-4046     D14ARTHRI 4047-4048
        D14OTHERS 4049-4050     D11MEDICA 4051-4052     D11FINANC 4053-4054
        D14INCOME $4055-4063    D14WCFACI 4064-4065     D14TAPWAT 4066-4067
        D14BATHFA 4068-4069     D14HEATER 4070-4071     D14TVSET 4072-4073
        D14WASHMA 4074-4075     D14PHONE 4076-4077      D14DOCTOR 4078-4080
        D14LICDOC 4081-4082     D14WHOPAY $4083-4085    D14MEDCOS $4086-4091
        D14POCKET $4092-4096    D14BATHFU 4097-4098     D14BATDAY $4099-4102
        D14DRESFU 4103-4104     D14DREDAY $4105-4108    D14TOILFU 4109-4110
        D14TOIDAY $4111-4114    D14MOVEFU 4115-4116     D14MOVDAY $4117-4120
        D14CONTFU 4121-4122     D14CONDAY $4123-4126    D14FEEDFU 4127-4128
        D14FEEDAY $4129-4132    D14FULLDA $4133-4137    D14CARCST $4138-4146
        D14DIRCST $4147-4153    D14CARPAY 4154-4156     D14OUTDOR 4157-4160
        D14ACTDAY $4161-4164    D14SMOKE 4165-4166      D14SMKTIM 4167-4168
        D14D21B 4169-4170       D14DRINK 4171-4172      D14KNDDRK 4173-4174
        D14DRKMCH $4175-4177    D14ADVDIR 4178-4179     D14DIRDAY 4180-4183
        D14DREAM 4184-4185      D14PAIN 4186-4187       D14UNCONS 4188-4189
        D14UNCDAY $4190-4192    D14A533 4193-4194       D14A534 $4195-4198
        D14A535 4199-4200       D14A536 4201-4202       D14A537 4203-4205
        D14G23 $4206-4207       D14G24 4208-4209        D14G24A 4210-4211
        D14G25 4212-4213        D14G25A 4214-4215       D14G4 4216-4217
        D14G4A 4218-4219        D14G4B 4220-4221        D14G102 4222-4224
        D14G106 4225-4226       D14G1061 4227-4228      D14G1062 4229-4230
        D14G1063 4231-4232      D14D45 4233-4234        D14D46 $4235-4243
        D14D47 4244             ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id, province code +given no. + year of the wave of the very first interview' 
   YEARIN  = 'year of the 2011/2012 interview' 
   MONTHIN = 'month of the 2011/2012 interview' 
   DAYIN   = 'day of the 2011/2012 interview' 
   V_BTHYR = 'v_bthyr validated birth year' 
   V_BTHMON= 'v_bthmon validated birth month' 
   PROV    = 'national code for provinces sampled' 
   TYPE    = 'category of the interviewee' 
   RELATYPE= 'category of the interviewed respondent' 
   YB222   = 'code of the interviewed oldest-old respondent' 
   RESIDENC= 'category of residence of the interviewee in 2011' 
   TRUEAGE = 'trueage validated age' 
   A1      = 'sex' 
   A2      = 'ethnic group' 
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
   RA53A   = 'ra53a proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4, a53a5' 
   A53A1   = 'a53a1 relationship between you and 1st person you living with currently' 
   A53A3   = 'a53a3 sex of 1st person living with you currently' 
   A53A2   = 'a53a2 age of 1st person living with you currently' 
   A53A4   = 'a53a4 education level of 1st person living with you currently' 
   A53A5   = 'a53a5 # of cigarettes 1st person usuallysmoke per day inside home' 
   RA53B   = 'ra53b proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4, a53b5' 
   A53B1   = 'a53b1 relationship between you and 2nd person living with you currently' 
   A53B3   = 'a53b3 sex of 2nd person living with you currently' 
   A53B2   = 'a53b2 age of 2nd person living with you currently' 
   A53B4   = 'a53b4 education level of 2nd person living with you currently' 
   A53B5   = 'a53b5 # of cigarettes 2nd person usuallysmoke per day inside home' 
   RA53C   = 'ra53c proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4, a53c5' 
   A53C1   = 'a53c1 relationship between you and 3rd person living with you currently' 
   A53C3   = 'a53c3 sex of 3rd person living with you currently' 
   A53C2   = 'a53c2 age of 3rd person living with you currently' 
   A53C4   = 'a53c4 education level of 3rd person living with you currently' 
   A53C5   = 'a53c5 # of cigarettes 3rd person usuallysmoke per day inside home' 
   RA53D   = 'ra53d proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4, a53d5' 
   A53D1   = 'a53d1 relationship between you and 4th person living with you currently' 
   A53D3   = 'a53d3 sex of 4th person living with you currently' 
   A53D2   = 'a53d2 age of 4th person living with you currently' 
   A53D4   = 'a53d4 education level of 4th person living with you currently' 
   A53D5   = 'a53d5 # of cigarettes 4th person usuallysmoke per day inside home' 
   RA53E   = 'ra53e proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4, a53e5' 
   A53E1   = 'a53e1 relationship between you and 5th person living with you currently' 
   A53E3   = 'a53e3 sex of 5th person living with you currently' 
   A53E2   = 'a53e2 age of 5th person living with you currently' 
   A53E4   = 'a53e4 education level of 5th person living with you currently' 
   A53E5   = 'a53e5 # of cigarettes 5th person usuallysmoke per day inside home' 
   RA53F   = 'ra53f proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4, a53f5' 
   A53F1   = 'a53f1 relationship between you and 6th person living with you currently' 
   A53F3   = 'a53f3 sex of 6th person living with you currently' 
   A53F2   = 'a53f2 age of 6th person living with you currently' 
   A53F4   = 'a53f4 education level of 6th person living with you currently' 
   A53F5   = 'a53f5 # of cigarettes 6th person usuallysmoke per day inside home' 
   RA53G   = 'ra53g proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4, a53g5' 
   A53G1   = 'a53g1 relationship between you and 7th person living with you currently' 
   A53G3   = 'a53g3 sex of 7th person living with you currently' 
   A53G2   = 'a53g2 age of 7th person living with you currently' 
   A53G4   = 'a53g4 education level of 7th person living with you currently' 
   A53G5   = 'a53g5 # of cigarettes 7th person usuallysmoke per day inside home' 
   RA53H   = 'ra53h proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4, a53h5' 
   A53H1   = 'a53h1 relationship between you and 8th person living with you currently' 
   A53H3   = 'a53h3 sex of 8th person living with you currently' 
   A53H2   = 'a53h2 age of 8th person living with you currently' 
   A53H4   = 'a53h4 education level of 8th person living with you currently' 
   A53H5   = 'a53h5 # of cigarettes 8th person usuallysmoke per day inside home' 
   RA53I   = 'ra53i proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4, a53i5' 
   A53I1   = 'a53i1 relationship between you and 9th person living with you currently' 
   A53I3   = 'a53i3 sex of 9th person living with you currently' 
   A53I2   = 'a53i2 age of 9th person living with you currently' 
   A53I4   = 'a53i4 education level of 9th person living with you currently' 
   A53I5   = 'a53i5 # of cigarettes 9th person usuallysmoke per day inside home' 
   RA53J   = 'ra53j proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4, a53j5' 
   A53J1   = 'a53j1 relationship between you and 10th person living with you currently' 
   A53J3   = 'a53j3 sex of 10th person living with you currently' 
   A53J2   = 'a53j2 age of 10th person living with you currently' 
   A53J4   = 'a53j4 education level of 10th person living with you currently' 
   A53J5   = 'a53j5 # of cigarettes 10th person usuallysmoke per day inside home' 
   RA530   = 'ra530 proxy or not for a530' 
   A530    = 'a530 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531   = 'ra531 proxy or not for a531' 
   A531    = 'a531 under whose name your current house/apartment purchased or rented' 
   RA532   = 'ra532 proxy or not for a532' 
   A532    = 'a532 do you (and your spouse) have your own bedroom?' 
   RA533   = 'ra533 proxy or not for a533' 
   A533    = 'a533 what type of dwelling is your home?' 
   A533A   = 'a533a other type of dwelling' 
   RA534   = 'ra534 proxy or not for a534' 
   A534    = 'a534 what is the approximate year your home was built?' 
   RA535   = 'ra535 proxy or not for a535' 
   A535    = 'a535 during past 1 year, was your home damaged from broken pipes or heavy rain?' 
   RA536   = 'ra536 proxy or not for a536' 
   A536    = 'a536 does your home frequently have a mildew odor or musty smell?' 
   RA537   = 'ra537 proxy or not for a537' 
   A537    = 'a537 which fuels are normally used for cooking in your home?' 
   RA540   = 'ra540 proxy or not for a540' 
   A540    = 'a540 the primary reason that you live in an institution (elderly center, elderly home' 
   RA541   = 'ra541 proxy or not for a541' 
   A541    = 'a541 the average monthly cost for the elder living in an institution' 
   RA542   = 'ra542 proxy or not for a542' 
   A542    = 'a542 who mainly paid for the cost?' 
   A542A   = 'a542a other people mainly paid for the cost' 
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
   B28     = 'b28 have you felt sad, blue, or depressed for two weeks or more in last 12 months?' 
   B29     = 'b29 have you lost interest in most things like hobbies, work, or similar activities' 
   B210    = 'b210 how much of the day did these feelings usually last?' 
   C11     = 'c11 what time of day is it right now?' 
   C12     = 'c12 what is the animal year of this year?' 
   C13     = 'c13 what is the date of the mid-autumn festival?' 
   C14     = 'c14 what is the season right now?' 
   C15     = 'c15 what is the name of this county or district?' 
   C16     = 'c16 # of kinds of food named in one minute' 
   C21A    = 'c21a repeat the name of "table" at first attempt' 
   C21B    = 'c21b repeat the name of "apple" at first attempt' 
   C21C    = 'c21c repeat the name of "clothes" at first attempt' 
   C22     = 'c22 attempts to repeat the names of three objects correctly' 
   C31A    = 'c31a $20-$3=?' 
   C31B    = 'c31b $20-$3-$3=?' 
   C31C    = 'c31c $20-$3-$3-$3=?' 
   C31D    = 'c31d $20-$3-$3-$3-$3=?' 
   C31E    = 'c31e $20-$3-$3-$3-$3-$3=?' 
   C32     = 'c32 draw the figure following the example' 
   C41A    = 'c41a repeat the name of "table" a while later' 
   C41B    = 'c41b repeat the name of "apple" a while later' 
   C41C    = 'c41c repeat the name of "clothes" a while later' 
   C51A    = 'c51a name "pen"' 
   C51B    = 'c51b name "watch"' 
   C52     = 'c52 repeat a sentence' 
   C52X1   = 'act as the meaning of a sentence' 
   C52X2   = 'write a complete sentence' 
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
   D33A    = 'd33a other kind of grease you mainly use' 
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
   RD76    = 'rd76 proxy or not for d76' 
   D76     = 'd76 how soon after you wake up do you smoke your first cigarette?' 
   RD77    = 'rd77 proxy or not for d77' 
   D77     = 'd77 what do you think about your chances of being diagnosed with lung cancer?' 
   RD78    = 'rd78 proxy or not for d78' 
   D78     = 'd78 during childhood, were you exposed to smoke from other people at home?' 
   D78A    = 'd78a if yes, for how many hours per day?' 
   D78B    = 'd78b if yes, for how many years?' 
   RD79    = 'rd79 proxy or not for d79' 
   D79     = 'd79 during young/middle-ages, were you exposed to smoke from others at home?' 
   D79A    = 'd79a if yes, for how many hours per day?' 
   D79B    = 'd79b if yes, for how many years?' 
   RD710   = 'rd710 proxy or not for d710' 
   D710    = 'd710 in social settings such as restaurant, were you exposed to smoke from others?' 
   D710A   = 'd710a if yes, for how many hours per day?' 
   D710B   = 'd710b if yes, for how many years?' 
   RD81    = 'rd81 proxy or not for d81' 
   D81     = 'd81 drink or not at present?' 
   RD82    = 'rd82 proxy or not for d82' 
   D82     = 'd82 drank or not in the past?' 
   RD83    = 'rd83 proxy or not for d83' 
   D83     = 'd83 age when began drinking' 
   RD84    = 'rd84 proxy or not for d84' 
   D84     = 'd84 age when quit drinking if not drinking at present' 
   RD85    = 'rd85 proxy or not for d85' 
   D85     = 'd85 what kind of alcohol you drink (drank) ?' 
   RD86    = 'rd86 proxy or not for d86' 
   D86     = 'd86 how much per day do you drink (or drank)?' 
   RD87    = 'rd87 proxy or not for d87' 
   D87     = 'd87 when stop drinking, do you feel anxious for most of the day for at least 2 days?' 
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
   RE0     = 're0 proxy or not for e0' 
   E0      = 'e0 for the last 6 months, were you limited in activities because of health problem?' 
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
   E610    = 'e610 primary caregiver when the elder need assistance in above six tasks' 
   RE62    = 're62 proxy or not for e62' 
   E62     = 'e62 the willingness of the primary caregiver when providing such care' 
   RE63    = 're63 proxy or not for e63' 
   E63     = 'e63 the total direct cost paid for caregiving last week' 
   RE64    = 're64 proxy or not for e64' 
   E64     = 'e64 who mainly pays the above cost?' 
   E64A    = 'e64a othe people who pays the above cost' 
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
   F21     = 'f21 do you have a retirement pension?' 
   RF211   = 'rf211 proxy or not for f211' 
   F211    = 'f211 are you retired?' 
   RF22    = 'rf22 proxy or not for f22' 
   F22     = 'f22 which year did you retire?' 
   RF221   = 'rf221 proxy or not for f221' 
   F221    = 'f221 if retired, what is your monthly retirement pension?' 
   RF23    = 'rf23 proxy or not for f23' 
   F23     = 'f23 are you still engaged in paid jobs after retirement?' 
   RF24    = 'rf24 proxy or not for f24' 
   F24     = 'f24 do you have public old age insurance?' 
   RF25    = 'rf25 proxy or not for f25a' 
   F251    = 'f251 what is the annual payment by individual if taking part in old age insurance?' 
   F252    = 'f252 what is the annual subsidy by government if taking part in old age insurance?' 
   RF25B   = 'rf25b proxy or not for f25b' 
   F25B1   = 'f25b1 which year did you take part in public old age insurance?' 
   F25B2   = 'f25b2 which month did you take part in public old age insurance?' 
   RF26    = 'rf26 proxy or not for f26' 
   F26     = 'f26 what is your monthly pension from old age insurance at present?' 
   RF27    = 'rf27 proxy or not for f27' 
   F27     = 'f27 what''s the reason that you did not take part in old age insurance?' 
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
   RF41A   = 'rf41a proxy or not for f41a' 
   F41A1   = 'f41a1 did you experience the event of spouse passing-away after 2008 survey?' 
   F41A11  = 'f41a11 if yes, which year to be widowed?' 
   F41A12  = 'f41a12 if yes, which month to be widowed?' 
   F41A2   = 'f41a2 did you experience the event of divorcement after 2008 survey?' 
   F41A21  = 'f41a21 if yes, which year to be divorced?' 
   F41A22  = 'f41a22 if yes, which month to be divorced?' 
   F41A3   = 'f41a3 did you experience the event of remarriage after 2008 survey?' 
   F41A31  = 'f41a31 if yes, which year to be remarried?' 
   F41A32  = 'f41a32 if yes, which month to be remarried?' 
   RF41B   = 'rf41b proxy or not for f41b' 
   F41B    = 'f41b do you have cohabited partner but not formally married at present?' 
   F41B1   = 'f41b1 if yes, which year to be cohabited?' 
   F41B2   = 'f41b2 if yes, which month to be cohabited?' 
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
   RF64    = 'rf64 proxy or not for f64a-f64t' 
   F64A    = 'f64a do you have retirement pension at present' 
   F64B    = 'f64b do you have public old-age insurance at present' 
   F64C    = 'f64c do you have private or commercial old-age insurance at present' 
   F64D    = 'f64d do you have public free medical services at present' 
   F64E1   = 'f64e1 do you have medical insurance for urban workers at present' 
   F64F1   = 'f64f1 do you have collective medical insurance for urban residents at present' 
   F64G1   = 'f64g1 do you have the new rural cooperative medical insurance at present' 
   F64H1   = 'f64h1 do you have commercial medical insurance at present' 
   F64I    = 'f64i do you have other social security or private insurance at present' 
   RF651A1 = 'rf651a1 proxy or not for f651a1' 
   F651A1  = 'f651a1 how much money did you spend on outpatient costs last year?' 
   RF651B1 = 'rf651b1 proxy or not for f651b1' 
   F651B1  = 'f651b1 how much money did your family pay for outpatient costs last year?' 
   RF651A2 = 'rf651a2 proxy or not for f651a2' 
   F651A2  = 'f651a2 how much money did you spend on inpatient costs last year?' 
   RF651B2 = 'rf651b2 proxy or not for f651b2' 
   F651B2  = 'f651b2 how much money did your family pay for inpatient costs last year?' 
   RF6521  = 'rf6521 proxy or not for f6521' 
   F6521   = 'f6521 who mainly paid the cost?' 
   RF652A  = 'rf652a proxy or not for f652a' 
   F652A   = 'f652a how far from your home to the nearest hospital (in kilometres)?' 
   RF652B  = 'rf652b proxy or not for f652b' 
   F652B   = 'f652b do you have regular phycial examination once every year?' 
   RF66    = 'rf66 proxy or not for f66' 
   F66     = 'often went to bed hungry as a child' 
   RF71    = 'rf71 proxy or not for f71' 
   F71     = 'f71 mother alive or not' 
   RF721   = 'rf721 proxy or not for f721' 
   F721    = 'f721 mother''s age if alive' 
   RF722   = 'rf722 proxy or not for f722' 
   F722    = 'f722 mother''s age at death' 
   F722A   = 'if passed away, did she pass away after the date of 2008/2009 survey?' 
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
   F822A   = 'if passed away, did he pass away after the date of 2008/2009 survey?' 
   RF83    = 'rf83 proxy or not for f83' 
   F83     = 'f83 respondent''s age at father''s death' 
   RF84    = 'rf84 proxy or not for f84' 
   F84     = 'f84 father''s main occupation before age 60' 
   RF85    = 'rf85 proxy or not for f85' 
   F85     = 'f85 father''s main occupation in your childhood' 
   RF86    = 'rf86 proxy or not for f86' 
   F86     = 'f86 years of schooling your father received' 
   RF9     = 'proxy or not for f9' 
   F9      = 'number of biological siblings' 
   F9A     = 'number of biological siblings alive' 
   RF901   = 'proxy or not for f901' 
   F901    = 'number of biological brothers alive at present' 
   RF901A  = 'proxy or not for f901a-f901b3' 
   F901A   = 'are there any biological brothers aged 80+ alive at present?' 
   F901B1  = 'age of the oldest biological brother alive at present' 
   F901B2  = 'age of the second oldest biological brother alive at present' 
   F901B3  = 'age of the third oldest biological brother alive at present' 
   RF902   = 'proxy or not for f902' 
   F902    = 'number of biological sisters alive at present' 
   RF902A  = 'proxy or not for f902a-f902b3' 
   F902A   = 'are there any biological sisters aged 80+ alive at present?' 
   F902B1  = 'age of the oldest biological sister alive at present' 
   F902B2  = 'age of the second oldest biological sister alive at present' 
   F902B3  = 'age of the third oldest biological sister alive at present' 
   RF91    = 'rf91 proxy or not for f91' 
   F91     = 'birth order of respondent' 
   RF92A   = 'rf92a proxy or not for f92a1 to f92a7' 
   F92A1   = 'f92a1 birth order of the 1st sibling' 
   F92A2   = 'f92a2 sex of the 1st sibling' 
   F92A3   = 'f92a3 the 1st sibling alive or not' 
   F92A4   = 'f92a4 sibling''s age at present if alive, or age at death if died' 
   F92A5   = 'f92a5 residence distance' 
   F92A6   = 'f92a6 frequent visits' 
   F92A7   = 'f92a7 contact with the 1st sibling' 
   RF92B   = 'rf92b proxy or not for f92b1 to f92b7' 
   F92B1   = 'f92b1 birth order of the 2nd sibling' 
   F92B2   = 'f92b2 sex of the 2nd sibling' 
   F92B3   = 'f92b3 the 2nd sibling alive or not' 
   F92B4   = 'f92b4 sibling''s age at present if alive, or age at death if died' 
   F92B5   = 'f92b5 residence distance' 
   F92B6   = 'f92b6 frequent visits' 
   F92B7   = 'f92b7 contact with the 2nd sibling' 
   RF92C   = 'rf92c proxy or not for f92c1 to f92c7' 
   F92C1   = 'f92c1 birth order of the 3rd sibling' 
   F92C2   = 'f92c2 sex of the 3rd sibling' 
   F92C3   = 'f92c3 the 3rd sibling alive or not' 
   F92C4   = 'f92c4 sibling''s age at present if alive, or age at death if died' 
   F92C5   = 'f92c5 residence distance' 
   F92C6   = 'f92c6 frequent visits' 
   F92C7   = 'f92c7 contact with the 3rd sibling' 
   RF92D   = 'rf92d proxy or not for f92d1 to f92d7' 
   F92D1   = 'f92d1 birth order of the 4th sibling' 
   F92D2   = 'f92d2 sex of the 4th sibling' 
   F92D3   = 'f92d3 the 4th sibling alive or not' 
   F92D4   = 'f92d4 sibling''s age at present if alive, or age at death if died' 
   F92D5   = 'f92d5 residence distance' 
   F92D6   = 'f92d6 frequent visits' 
   F92D7   = 'f92d7 contact with the 4th sibling' 
   RF92E   = 'rf92e proxy or not for f92e1 to f92e7' 
   F92E1   = 'f92e1 birth order of the 5th sibling' 
   F92E2   = 'f92e2 sex of the 5th sibling' 
   F92E3   = 'f92e3 the 5th sibling alive or not' 
   F92E4   = 'f92e4 sibling''s age at present if alive, or age at death if died' 
   F92E5   = 'f92e5 residence distance' 
   F92E6   = 'f92e6 frequent visits' 
   F92E7   = 'f92e7 contact with the 5th sibling' 
   RF92F   = 'rf92f proxy or not for f92f1 to f92f7' 
   F92F1   = 'f92f1 birth order of the 6th sibling' 
   F92F2   = 'f92f2 sex of the 6th sibling' 
   F92F3   = 'f92f3 the 6th sibling alive or not' 
   F92F4   = 'f92f4 sibling''s age at present if alive, or age at death if died' 
   F92F5   = 'f92f5 residence distance' 
   F92F6   = 'f92f6 frequent visits' 
   F92F7   = 'f92f7 contact with the 6th sibling' 
   RF92G   = 'rf92g proxy or not for f92g1 to f92g7' 
   F92G1   = 'f92g1 birth order of the 7th sibling' 
   F92G2   = 'f92g2 sex of the 7th sibling' 
   F92G3   = 'f92g3 the 7th sibling alive or not' 
   F92G4   = 'f92g4 sibling''s age at present if alive, or age at death if died' 
   F92G5   = 'f92g5 residence distance' 
   F92G6   = 'f92g6 frequent visits' 
   F92G7   = 'f92g7 contact with the 7th sibling' 
   RF92H   = 'rf92h proxy or not for f92h1 to f92h7' 
   F92H1   = 'f92h1 birth order of the 8th sibling' 
   F92H2   = 'f92h2 sex of the 8th sibling' 
   F92H3   = 'f92h3 the 8th sibling alive or not' 
   F92H4   = 'f92h4 sibling''s age at present if alive, or age at death if died' 
   F92H5   = 'f92h5 residence distance' 
   F92H6   = 'f92h6 frequent visits' 
   F92H7   = 'f92h7 contact with the 8th sibling' 
   RF92I   = 'rf92i proxy or not for f92i1 to f92i7' 
   F92I1   = 'f92i1 birth order of the 9th sibling' 
   F92I2   = 'f92i2 sex of the 9th sibling' 
   F92I3   = 'f92i3 the 9th sibling alive or not' 
   F92I4   = 'f92i4 sibling''s age at present if alive, or age at death if died' 
   F92I5   = 'f92i5 residence distance' 
   F92I6   = 'f92i6 frequent visits' 
   F92I7   = 'f92i7 contact with the 9th sibling' 
   RF92J   = 'rf92j proxy or not for f92j1 to f92j7' 
   F92J1   = 'f92j1 birth order of the 10th sibling' 
   F92J2   = 'f92j2 sex of the 10th sibling' 
   F92J3   = 'f92j3 the 10th sibling alive or not' 
   F92J4   = 'f92j4 sibling''s age at present if alive, or age at death if died' 
   F92J5   = 'f92j5 residence distance' 
   F92J6   = 'f92j6 frequent visits' 
   F92J7   = 'f92j7 contact with the 10th sibling' 
   JIGE    = 'jige number of siblings alive who are 80+ years old' 
   RF10    = 'rf10 proxy or not for f10 and f10a' 
   F10     = 'f10 number of children ever born' 
   F10A    = 'f10a number of male children ever born' 
   RF101   = 'rf101 proxy or not for f101' 
   F101    = 'f101 age at first birth' 
   RF102   = 'rf102 proxy or not for f102' 
   F102    = 'f102 age at last birth' 
   F103    = 'number of children, including deceased and non-biological children' 
   RF1030  = 'proxy or not for f1030' 
   F1030   = 'number of sons alive at present' 
   RF1030A = 'proxy or not for f1030a-f1030b3' 
   F1030A  = 'are there any sons aged 80+ alive at present?' 
   F1030B1 = 'f1030b1 age of the oldest son alive at present' 
   F1030B2 = 'age of the second oldest son alive at present' 
   F1030B3 = 'age of the third oldest son alive at present' 
   RF1031  = 'proxy or not for f1031' 
   F1031   = 'number of daughters alive at present' 
   RF1031A = 'proxy or not for f1031a-f1031b3' 
   F1031A  = 'are there any daughters aged 80+ alive at present?' 
   F1031B1 = 'age of the oldest daughter alive at present' 
   F1031B2 = 'age of the second oldest daughter alive at present' 
   F1031B3 = 'age of the third oldest daughter alive at present' 
   RF103A  = 'rf103a proxy or not for f103a1 to f103a8' 
   F103A8  = 'f103a8 1st child is biological or not?' 
   F103A1  = 'f103a1 sex of the 1st child' 
   F103A2  = 'f103a2 the 1st child alive or not' 
   F103A3  = 'f103a3 the 1st child''s age at present if alive, or age the child would be if s/he alive' 
   F103A4  = 'f103a4 frequent visits of the 1st child' 
   F103A7  = 'f103a7 contact with the 1st child' 
   F103A5  = 'f103a5 residence distance of the 1st child' 
   RF103B  = 'rf103b proxy or not for f103b1 to f103b8' 
   F103B8  = 'f103b8 2nd child is biological or not?' 
   F103B1  = 'f103b1 sex of the 2nd child' 
   F103B2  = 'f103b2 the 2nd child alive or not' 
   F103B3  = 'f103b3 the 2nd child''s age at present if alive, or age the child would be if s/he alive' 
   F103B4  = 'f103b4 frequent visits of the 2nd child' 
   F103B7  = 'f103b7 contact with the 2nd child' 
   F103B5  = 'f103b5 residence distance of the 2nd child' 
   RF103C  = 'rf103c proxy or not for f103c1 to f103c8' 
   F103C8  = 'f103c8 3rd child is biological or not?' 
   F103C1  = 'f103c1 sex of the 3rd child' 
   F103C2  = 'f103c2 the 3rd child alive or not' 
   F103C3  = 'f103c3 the 3rd child''s age at present if alive, or age the child would be if s/he alive' 
   F103C4  = 'f103c4 frequent visits of the 3rd child' 
   F103C7  = 'f103c7 contact with the 3rd child' 
   F103C5  = 'f103c5 residence distance of the 3rd child' 
   RF103D  = 'rf103d proxy or not for f103d1 to f103d8' 
   F103D8  = 'f103d8 4th child is biological or not?' 
   F103D1  = 'f103d1 sex of the 4th child' 
   F103D2  = 'f103d2 the 4th child alive or not' 
   F103D3  = 'f103d3 the 4th child''s age at present if alive, or age the child would be if s/he alive' 
   F103D4  = 'f103d4 frequent visits of the 4th child' 
   F103D7  = 'f103d7 contact with the 4th child' 
   F103D5  = 'f103d5 residence distance of the 4th child' 
   RF103E  = 'rf103e proxy or not for f103e1 to f103e8' 
   F103E8  = 'f103e8 5th child is biological or not?' 
   F103E1  = 'f103e1 sex of the 5th child' 
   F103E2  = 'f103e2 the 5th child alive or not' 
   F103E3  = 'f103e3 the 5th child''s age at present if alive, or age the child would be if s/he alive' 
   F103E4  = 'f103e4 frequent visits of the 5th child' 
   F103E7  = 'f103e7 contact with the 5th child' 
   F103E5  = 'f103e5 residence distance of the 5th child' 
   RF103F  = 'rf103f proxy or not for f103f1 to f103f8' 
   F103F8  = 'f103f8 6th child is biological or not?' 
   F103F1  = 'f103f1 sex of the 6th child' 
   F103F2  = 'f103f2 the 6th child alive or not' 
   F103F3  = 'f103f3 the 6th child''s age at present if alive, or age the child would be if s/he alive' 
   F103F4  = 'f103f4 frequent visits of the 6th child' 
   F103F7  = 'f103f7 contact with the 6th child' 
   F103F5  = 'f103f5 residence distance of the 6th child' 
   RF103G  = 'rf103g proxy or not for f103g1 to f103g8' 
   F103G8  = 'f103g8 7th child is biological or not?' 
   F103G1  = 'f103g1 sex of the 7th child' 
   F103G2  = 'f103g2 the 7th child alive or not' 
   F103G3  = 'f103g3 the 7th child''s age at present if alive, or age the child would be if s/he alive' 
   F103G4  = 'f103g4 frequent visits of the 7th child' 
   F103G7  = 'f103g7 contact with the 7th child' 
   F103G5  = 'f103g5 residence distance of the 7th child' 
   RF103H  = 'rf103h proxy or not for f103h1 to f103h8' 
   F103H8  = 'f103h8 8th child is biological or not?' 
   F103H1  = 'f103h1 sex of the 8th child' 
   F103H2  = 'f103h2 the 8th child alive or not' 
   F103H3  = 'f103h3 the 8th child''s age at present if alive, or age the child would be if s/he alive' 
   F103H4  = 'f103h4 frequent visits of the 8th child' 
   F103H7  = 'f103h7 contact with the 8th child' 
   F103H5  = 'f103h5 residence distance of the 8th child' 
   RF103I  = 'rf103i proxy or not for f103i1 to f103i8' 
   F103I8  = 'f103i8 9th child is biological or not?' 
   F103I1  = 'f103i1 sex of the 9th child' 
   F103I2  = 'f103i2 the 9th child alive or not' 
   F103I3  = 'f103i3 the 9th child''s age at present if alive, or age the child would be if s/he alive' 
   F103I4  = 'f103i4 frequent visits of the 9th child' 
   F103I7  = 'f103i7 contact with the 9th child' 
   F103I5  = 'f103i5 residence distance of the 9th child' 
   RF103J  = 'rf103j proxy or not for f103j1 to f103j8' 
   F103J8  = 'f103j8 10th child is biological or not?' 
   F103J1  = 'f103j1 sex of the 10th child' 
   F103J2  = 'f103j2 the 10th child alive or not' 
   F103J3  = 'f103j3 the 10th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103J4  = 'f103j4 frequent visits of the 10th child' 
   F103J7  = 'f103j7 contact with the 10th child' 
   F103J5  = 'f103j5 residence distance of the 10th child' 
   RF103K  = 'rf103k proxy or not for f103k1 to f103k8' 
   F103K8  = 'f103k8 11th child is biological or not?' 
   F103K1  = 'f103k1 sex of the 11th child' 
   F103K2  = 'f103k2 the 11th child alive or not' 
   F103K3  = 'f103k3 the 11th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103K4  = 'f103k4 frequent visits of the 11th child' 
   F103K7  = 'f103k7 contact with the 11th child' 
   F103K5  = 'f103k5 residence distance of the 11th child' 
   RF103L  = 'rf103l proxy or not for f103l1 to f103l8' 
   F103L8  = 'f103l8 12th child is biological or not?' 
   F103L1  = 'f103l1 sex of the 12th child' 
   F103L2  = 'f103l2 the 12th child alive or not' 
   F103L3  = 'f103l3 the 12th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103L4  = 'f103l4 frequent visits of the 12th child' 
   F103L7  = 'f103l7 contact with the 12th child' 
   F103L5  = 'f103l5 residence distance of the 12th child' 
   RF103M  = 'rf103m proxy or not for f103m1 to f103m8' 
   F103M8  = 'f103m8 13th child is biological or not?' 
   F103M1  = 'f103m1 sex of the 13th child' 
   F103M2  = 'f103m2 the 13th child alive or not' 
   F103M3  = 'f103m3 the 13th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103M4  = 'f103m4 frequent visits of the 13th child' 
   F103M7  = 'f103m7 contact with the 13th child' 
   F103M5  = 'f103m5 residence distance of the 13th child' 
   RF1032  = 'proxy or not for f1032' 
   F1032   = 'do children who live in same village but not in coresidence frequently visit you' 
   RF1033  = 'proxy or not for f1033' 
   F1033   = 'do your children who live in other village/district/city frequently visit you?' 
   F111A   = 'f111a the first person to whom you usually talk frequently in daily life' 
   F111B   = 'f111b the second person to whom you usually talk frequently in daily life' 
   F111C   = 'f111c the third person to whom you usually talk frequently in daily life' 
   F112A   = 'f112a 1st person to whom you talk first when you need to share your thoughts' 
   F112B   = 'f112b 2nd person to whom you talk first when you need to share your thoughts' 
   F112C   = 'f112c 3rd person to whom you talk first when you need to share your thoughts' 
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
   RG01    = 'rg01 proxy or not for g01' 
   G01     = 'g01 how about the quality of your sleep?' 
   RG02    = 'rg02 proxy or not for g02' 
   G02     = 'g02 how long do you sleep normally?' 
   RG1     = 'rg1 proxy or not for g1' 
   G1      = 'g1 visual function: can you see the break in the circle?' 
   G1A     = 'g1a if so, where is the break located?' 
   RG21    = 'rg21 proxy or not for g21' 
   G21     = 'g21 number of natural teeth' 
   RG22    = 'rg22 proxy or not for g22' 
   G22     = 'g22 have false teeth?' 
   RG23    = 'rg23 proxy or not for g23' 
   G23     = 'g23 how often do you brush your teeth every day?' 
   RG24    = 'rg24 proxy or not for g24' 
   G24     = 'g24 during the past 6 months, did you have a toothache more than once?' 
   RG24A   = 'rg24a proxy or not for g24a' 
   G24A    = 'g24a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG25    = 'rg25 proxy or not for g25' 
   G25     = 'g25 during the past 6 months, did you have pain in jaw joint or so more than once?' 
   RG25A   = 'rg25a proxy or not for g25a' 
   G25A    = 'g25a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG3     = 'rg3 proxy or not for g3' 
   G3      = 'g3 able to use chopsticks to eat?' 
   RG4     = 'rg4 proxy or not for g4' 
   G4      = 'g4 which hand do you normally use for eating?' 
   RG4A    = 'rg4a proxy or not for g4a' 
   G4A     = 'g4a which hand do you normally use for writing?' 
   RG4B    = 'rg4b proxy or not for g4b' 
   G4B     = 'g4b which hand do you normally use for brushing your teeth?' 
   RG5     = 'rg5 proxy or not for g5' 
   G511    = 'g511 blood pressure test for the 1st time: systolic' 
   G512    = 'g512 blood pressure test for the 1st time: diastolic' 
   G521    = 'g521 blood pressure test for the 2nd time: systolic' 
   G522    = 'g522 blood pressure test for the 2nd time: diastolic' 
   G6      = 'g6 rhythm of heart' 
   G7      = 'g7 heart rate (in beats/min)' 
   G81     = 'g81 hand behind neck' 
   G82     = 'g82 hand behind lower back' 
   G83     = 'g83 hold-up arms' 
   G9      = 'g9 able to stand up from sitting in a chair?' 
   G101    = 'g101 weight (kilograms)' 
   G1011   = 'g1011 calf curcumference (cm)' 
   G102    = 'g102 is the participant hunchbacked?' 
   G1021   = 'g1021 directly measured height of the interviewee' 
   G122    = 'g122 height measured from top of the right arm bone to top of the right shoulder' 
   G123    = 'g123 height measured from the right knee joint to the ground' 
   G102B   = 'self-reported height' 
   G102C   = 'g102c waist circumference' 
   RG106   = 'rg106 proxy or not for g106' 
   G106    = 'g106 do you have any difficulty with your hearing?' 
   RG1061  = 'rg1061 proxy or not for g1061' 
   G1061   = 'g1061 in which ear(s) do you have a hearing difficulty?' 
   RG1062  = 'rg1062 proxy or not for g1062' 
   G1062   = 'g1062 at what age did you first notice a hearing difficulty?' 
   RG1063  = 'rg1063 proxy or not for g1063' 
   G1063   = 'g1063 how quickly did your hearing difficulty develop?' 
   G11     = 'g11 able to pick up a book from the floor?' 
   G12     = 'g12 steps used to turn around 360 with help?' 
   RG130   = 'rg130 proxy or not for g130' 
   G130    = 'g130 feel not-well within the past two weeks?' 
   RG13    = 'rg13 with proxy or not for g131' 
   G131    = 'g131 # of times suffering from serious illness within the past two years' 
   G132    = 'g132 # of times in hospitals' 
   RG14A   = 'rg14a with proxy or not for g14a1 and g14a2' 
   G14A1   = 'g14a1 name of disease suffered at 1st hospital visit' 
   G14A2   = 'g14a2 1st time, number of days in hospital or bedridden' 
   G141T   = 'g141t the name of other diseases beyond g14a1 at the first time' 
   RG14B   = 'rg14b with proxy or not for g14b1 and g14b2' 
   G14B1   = 'g14b1 name of disease suffered at 2nd hospital visit' 
   G14B2   = 'g14b2 2nd time, number of days in hospital or bedridden' 
   G142T   = 'g142t the name of other diseases beyond g14b1 at the second time' 
   RG14C   = 'rg14c with proxy or not for g14c1 and g14c2' 
   G14C1   = 'g14c1 name of disease suffered at the last hospital visit' 
   G14C2   = 'g14c2 last time, days in hospital or bedridden' 
   G143T   = 'g143t the name of other diseases beyond g14c1 at the last time' 
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
   G15P1   = 'g15p1 suffering from epilepsy?' 
   G15P2   = 'g15p2 diagnosed by hospital?' 
   G15P3   = 'g15p3 disability in daily life' 
   G15Q1   = 'g15q1 suffering from cholecystitis, cholelith disease?' 
   G15Q2   = 'g15q2 diagnosed by hospital?' 
   G15Q3   = 'g15q3 disability in daily life' 
   G15R1   = 'g15r1 suffering from blood disease?' 
   G15R2   = 'g15r2 diagnosed by hospital?' 
   G15R3   = 'g15r3 disability in daily life' 
   G15N1A  = 'g15n1a suffering from rheumatism or rheumatoid disease?' 
   G15N2A  = 'g15n2a diagnosed by hospital?' 
   G15N3A  = 'g15n3a disability in daily life' 
   G15S1   = 'g15s1 suffering from chronic nephritis?' 
   G15S2   = 'g15s2 diagnosed by hospital?' 
   G15S3   = 'g15s3 disability in daily life' 
   G15T1   = 'g15t1 suffering from galactophore disease?' 
   G15T2   = 'g15t2 diagnosed by hospital?' 
   G15T3   = 'g15t3 disability in daily life' 
   G15U1   = 'g15u1 suffering from uterine tumor?' 
   G15U2   = 'g15u2 diagnosed by hospital?' 
   G15U3   = 'g15u3 disability in daily life' 
   G15J1A  = 'g15j1a suffering from hyperplasia of prostate gland?' 
   G15J2A  = 'g15j2a diagnosed by hospital?' 
   G15J3A  = 'g15j3a disability in daily life' 
   G15V1   = 'g15v1 suffering from hepatitis?' 
   G15V2   = 'g15v2 diagnosed by hospital?' 
   G15V3   = 'g15v3 disability in daily life' 
   G15Y1   = 'g15y1 other diseases beyond g15a-g15v?' 
   G15Y2   = 'g15y2 diagnosed by hospital?' 
   G15Y3   = 'g15y3 disability in daily life' 
   H1      = 'h1 was interviewee able to hear?' 
   H21     = 'h21 did interviewee able to participate in physical check?' 
   H22     = 'h22 the reason for inability to participate in physical check' 
   H3      = 'h3 the health of interviewee rated by interviewer' 
   H5      = 'h5 confirm the age and copy to the 1st page' 
   H6      = 'h6 has interviewer checked for failure to ask a question?' 
   H7      = 'h7 did anyone help the interviewee to answer question' 
   H71     = 'h71 who helped the interviewee to answer questions?' 
   W_2011  = 'weight variable, based on age-sex-residence-specific distrib of 2010 census' 
   DTH11_14= 'status of survival, death, or lost to follow-up from 2011/2012 to 2014 waves' 
   YEARIN_14= 'year of the 2014 interview' 
   MONTHIN_14= 'month of the 2014 interview' 
   DAYIN_14= 'day of the 2014 interview' 
   V_BTHYR_14= 'v_bthyr_14 validated birth year' 
   V_BTHMON_14= 'v_bthmon_14 validated birth month' 
   RESIDENC_14= 'category of residence of the interviewee in 2014' 
   TRUEAGE_14= 'trueage_14 validated age' 
   RA41_14 = 'ra41_14 proxy or not for a41' 
   A41_14  = 'a41_14 which province were you born in?' 
   RA42_14 = 'ra42_14 proxy or not for a42' 
   A42_14  = 'a42_14 was the country (city) you born in the same as current address?' 
   RA43_14 = 'ra43_14 proxy or not for a43' 
   A43_14  = 'a43_14 was the place of birth an urban area or a rural area at time of birth' 
   RA51_14 = 'ra51_14 proxy or not for a51' 
   A51_14  = 'a51_14 co-residence of interviewee' 
   RA52_14 = 'ra52_14 proxy or not for a52' 
   A52_14  = 'a52_14 how many people are living with you?' 
   RA53A_14= 'ra53a_14 proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4, a53a5' 
   A53A1_14= 'a53a1_14 relationship between you and 1st person you living with currently' 
   A53A11_14= 'other relationship between you and 1st person you living with currently' 
   A53A2_14= 'a53a2_14 sex of 1st person living with you currently' 
   A53A3_14= 'a53a3_14 age of 1st person living with you currently' 
   A53A4_14= 'a53a4_14 education level of 1st person living with you currently' 
   A53A5_14= 'a53a5_14 # of cigarettes 1st person usuallysmoke per day inside home' 
   RA53B_14= 'ra53b_14 proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4, a53b5' 
   A53B1_14= 'a53b1_14 relationship between you and 2nd person living with you currently' 
   A53B11_14= 'other relationship between you and 2nd person living with you currently' 
   A53B2_14= 'a53b2_14 sex of 2nd person living with you currently' 
   A53B3_14= 'a53b3_14 age of 2nd person living with you currently' 
   A53B4_14= 'a53b4_14 education level of 2nd person living with you currently' 
   A53B5_14= 'a53b5_14 # of cigarettes 2nd person usuallysmoke per day inside home' 
   RA53C_14= 'ra53c_14 proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4, a53c5' 
   A53C1_14= 'a53c1_14 relationship between you and 3rd person living with you currently' 
   A53C11_14= 'other relationship between you and 3rd person living with you currently' 
   A53C2_14= 'a53c2_14 sex of 3rd person living with you currently' 
   A53C3_14= 'a53c3_14 age of 3rd person living with you currently' 
   A53C4_14= 'a53c4_14 education level of 3rd person living with you currently' 
   A53C5_14= 'a53c5_14 # of cigarettes 3rd person usuallysmoke per day inside home' 
   RA53D_14= 'ra53d_14 proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4, a53d5' 
   A53D1_14= 'a53d1_14 relationship between you and 4th person living with you currently' 
   A53D11_14= 'other relationship between you and 4th person living with you currently' 
   A53D2_14= 'a53d2_14 sex of 4th person living with you currently' 
   A53D3_14= 'a53d3_14 age of 4th person living with you currently' 
   A53D4_14= 'a53d4_14 education level of 4th person living with you currently' 
   A53D5_14= 'a53d5_14 # of cigarettes 4th person usuallysmoke per day inside home' 
   RA53E_14= 'ra53e_14 proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4, a53e5' 
   A53E1_14= 'a53e1_14 relationship between you and 5th person living with you currently' 
   A53E11_14= 'other relationship between you and 5th person living with you currently' 
   A53E2_14= 'a53e2_14 sex of 5th person living with you currently' 
   A53E3_14= 'a53e3_14 age of 5th person living with you currently' 
   A53E4_14= 'a53e4_14 education level of 5th person living with you currently' 
   A53E5_14= 'a53e5_14 # of cigarettes 5th person usuallysmoke per day inside home' 
   RA53F_14= 'ra53f_14 proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4, a53f5' 
   A53F1_14= 'a53f1_14 relationship between you and 6th person living with you currently' 
   A53F11_14= 'other relationship between you and 6th person living with you currently' 
   A53F2_14= 'a53f2_14 sex of 6th person living with you currently' 
   A53F3_14= 'a53f3_14 age of 6th person living with you currently' 
   A53F4_14= 'a53f4_14 education level of 6th person living with you currently' 
   A53F5_14= 'a53f5_14 # of cigarettes 6th person usuallysmoke per day inside home' 
   RA53G_14= 'ra53g_14 proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4, a53g5' 
   A53G1_14= 'a53g1_14 relationship between you and 7th person living with you currently' 
   A53G11_14= 'other relationship between you and 7th person living with you currently' 
   A53G2_14= 'a53g2_14 sex of 7th person living with you currently' 
   A53G3_14= 'a53g3_14 age of 7th person living with you currently' 
   A53G4_14= 'a53g4_14 education level of 7th person living with you currently' 
   A53G5_14= 'a53g5_14 # of cigarettes 7th person usuallysmoke per day inside home' 
   RA53H_14= 'ra53h_14 proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4, a53h5' 
   A53H1_14= 'a53h1_14 relationship between you and 8th person living with you currently' 
   A53H11_14= 'other relationship between you and 8th person living with you currently' 
   A53H2_14= 'a53h2_14 sex of 8th person living with you currently' 
   A53H3_14= 'a53h3_14 age of 8th person living with you currently' 
   A53H4_14= 'a53h4_14 education level of 8th person living with you currently' 
   A53H5_14= 'a53h5_14 # of cigarettes 8th person usuallysmoke per day inside home' 
   RA53I_14= 'ra53i_14 proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4, a53i5' 
   A53I1_14= 'a53i1_14 relationship between you and 9th person living with you currently' 
   A53I11_14= 'other relationship between you and 9th person living with you currently' 
   A53I2_14= 'a53i2_14 sex of 9th person living with you currently' 
   A53I3_14= 'a53i3_14 age of 9th person living with you currently' 
   A53I4_14= 'a53i4_14 education level of 9th person living with you currently' 
   A53I5_14= 'a53i5_14 # of cigarettes 9th person usuallysmoke per day inside home' 
   RA53J_14= 'ra53j_14 proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4, a53j5' 
   A53J1_14= 'a53j1_14 relationship between you and 10th person living with you currently' 
   A53J11_14= 'other relationship between you and 10th person living with you currently' 
   A53J2_14= 'a53j2_14 sex of 10th person living with you currently' 
   A53J3_14= 'a53j3_14 age of 10th person living with you currently' 
   A53J4_14= 'a53j4_14 education level of 10th person living with you currently' 
   A53J5_14= 'a53j5_14 # of cigarettes 10th person usuallysmoke per day inside home' 
   RA530_14= 'ra530_14 proxy or not for a530' 
   A530_14 = 'a530_14 is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   A530A_14= 'other types for your owing the house/apartment' 
   RA531_14= 'ra531_14 proxy or not for a531' 
   A531_14 = 'a531_14 under whose name your current house/apartment purchased or rented' 
   A531A_14= 'other name for your the house/apartment purchased or rented' 
   RA532_14= 'ra532_14 proxy or not for a532' 
   A532_14 = 'a532_14 do you (and your spouse) have your own bedroom?' 
   RA533_14= 'ra533_14 proxy or not for a533' 
   A533_14 = 'a533_14 what type of dwelling is your home?' 
   A533A_14= 'a533a_14 other type of dwelling' 
   RA534_14= 'ra534_14 proxy or not for a534' 
   A534_14 = 'a534_14 what is the approximate year your home was built?' 
   RA535_14= 'ra535_14 proxy or not for a535' 
   A535_14 = 'a535_14 during past 1 year, was your home damaged from broken pipes or heavy rain?' 
   RA536_14= 'ra536_14 proxy or not for a536' 
   A536_14 = 'a536_14 does your home frequently have a mildew odor or musty smell?' 
   RA537_14= 'ra537_14 proxy or not for a537' 
   A537_14 = 'a537_14 which fuels are normally used for cooking in your home?' 
   A537A_14= 'a537a_14 other kinds beyond a537' 
   RA540_14= 'ra540_14 proxy or not for a540' 
   A540_14 = 'a540_14 the primary reason that you live in an institution (elderly center, elderly home' 
   RA541_14= 'ra541_14 proxy or not for a541' 
   A541_14 = 'a541_14 the average monthly cost for the elder living in an institution' 
   RA542_14= 'ra542_14 proxy or not for a542' 
   A542_14 = 'a542_14 who mainly paid for the cost?' 
   A542A_14= 'a542a_14 other people mainly paid for the cost' 
   RA54_14 = 'ra54_14 proxy or not for a54a a54b' 
   A54A_14 = 'a54a_14 year of being admitted to the institution or living alone' 
   A54B_14 = 'a54b_14 month of being admitted to the institution or living alone' 
   B11_14  = 'b11_14 self-reported quality of life' 
   B12_14  = 'b12_14 self-reported health' 
   B121_14 = 'b121_14 do you feel any change of your health since last year' 
   B21_14  = 'b21_14 look on the bright side of things' 
   B22_14  = 'b22_14 keep my belongings neat and clean' 
   B23_14  = 'b23_14 feel fearful or anxious' 
   B24_14  = 'b24_14 feel lonely and isolated' 
   B25_14  = 'b25_14 make own decision' 
   B26_14  = 'b26_14 feel useless with age' 
   B27_14  = 'b27_14 be happy as younger' 
   B28_14  = 'b28_14 have you felt sad, blue, or depressed for two weeks or more in last 12 months?' 
   B29_14  = 'b29_14 have you lost interest in most things like hobbies, work, or similar activities' 
   B210_14 = 'b210_14 how much of the day did these feelings usually last?' 
   C11_14  = 'c11_14 what time of day is it right now?' 
   C12_14  = 'c12_14 what is the animal year of this year?' 
   C13_14  = 'c13_14 what is the date of the mid-autumn festival?' 
   C14_14  = 'c14_14 what is the season right now?' 
   C15_14  = 'c15_14 what is the name of this county or district?' 
   C16_14  = 'c16_14 # of kinds of food named in one minute' 
   C21A_14 = 'c21a_14 repeat the name of "table" at first attempt' 
   C21B_14 = 'c21b_14 repeat the name of "apple" at first attempt' 
   C21C_14 = 'c21c_14 repeat the name of "clothes" at first attempt' 
   C22_14  = 'c22_14 attempts to repeat the names of three objects correctly' 
   C31A_14 = 'c31a_14 $20-$3=?' 
   C31B_14 = 'c31b_14 $20-$3-$3=?' 
   C31C_14 = 'c31c_14 $20-$3-$3-$3=?' 
   C31D_14 = 'c31d_14 $20-$3-$3-$3-$3=?' 
   C31E_14 = 'c31e_14 $20-$3-$3-$3-$3-$3=?' 
   C32_14  = 'c32_14 draw the figure following the example' 
   C41A_14 = 'c41a_14 repeat the name of "table" a while later' 
   C41B_14 = 'c41b_14 repeat the name of "apple" a while later' 
   C41C_14 = 'c41c_14 repeat the name of "clothes" a while later' 
   C51A_14 = 'c51a_14 name "pen"' 
   C51B_14 = 'c51b_14 name "watch"' 
   C52_14  = 'c52_14 repeat a sentence' 
   C53A_14 = 'c53a_14 taking paper using right hand' 
   C53B_14 = 'c53b_14 fold paper' 
   C53C_14 = 'c53c_14 put paper on the floor' 
   C54_14  = 'c54_14 was the interviewee able to answer sections b and c?' 
   C55_14  = 'c55_14 what is the main reason unable to answer questions?' 
   RD1_14  = 'rd1_14 proxy or not for d1' 
   D1_14   = 'd1_14 staple food' 
   RD2_14  = 'rd2_14  proxy or not for d2' 
   D2_14   = 'd2_14 amount of staple food per day (liang)' 
   RD31_14 = 'rd31_14 proxy or not for d31' 
   D31_14  = 'd31_14 how often eat fresh fruit?' 
   RD32_14 = 'rd32_14 proxy or not for d32' 
   D32_14  = 'd32_14 how often eat vegetables?' 
   RD33_14 = 'rd33_14 proxy or not for d33' 
   D33_14  = 'd33_14 what kind of grease do you mainly use for cooking?' 
   D33A_14 = 'd33a_14 other kind of grease you mainly use' 
   RD34_14 = 'rd34_14 proxy or not for d34' 
   D34_14  = 'd34_14 main flavor you have' 
   RD4MEAT_14= 'rd4meat_14 proxy or not for d4meat1 and d4meat2' 
   D4MEAT2_14= 'd4meat2_14 how often eat meat at present?' 
   D4MEAT1_14= 'd4meat1_14 how often ate meat at around age 60?' 
   RD4FISH_14= 'rd4fish_14 proxy or not for d4fish1 and d4fish2' 
   D4FISH2_14= 'd4fish2_14 how often eat fish at present?' 
   D4FISH1_14= 'd4fish1_14 how often ate fish at around age 60?' 
   RD4EGG_14= 'rd4egg_14 proxy or not for d4egg1 and d4egg2' 
   D4EGG2_14= 'd4egg2_14 how often eat eggs at present?' 
   D4EGG1_14= 'd4egg1_14 how often ate eggs at around age 60?' 
   RD4BEAN_14= 'rd4bean_14 proxy or not for d4bean1 and d4bean2' 
   D4BEAN2_14= 'd4bean2_14 how often eat food made from beans at present?' 
   D4BEAN1_14= 'd4bean1_14 how often ate food made from beans at around age 60?' 
   RD4VEG_14= 'rd4veg_14 proxy or not for d4veg1 and d4veg2' 
   D4VEG2_14= 'd4veg2_14 how often eat salt-preserved vegetables at present' 
   D4VEG1_14= 'd4veg1_14 how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA_14= 'rd4suga_14 proxy or not for d4suga1 and d4suga2' 
   D4SUGA2_14= 'd4suga2_14 how often eat sugar at present' 
   D4SUGA1_14= 'd4suga1_14 how often ate sugar at around age 60' 
   RD4TEA_14= 'rd4tea_14 proxy or not for d4tea1 and d4tea2' 
   D4TEA2_14= 'd4tea2_14 how often drink tea at present' 
   D4TEA1_14= 'd4tea1_14 how often drank tea at around age 60' 
   RD4GARL_14= 'rd4garl_14 proxy or not for d4garl1 and d4garl2' 
   D4GARL2_14= 'd4garl2_14 how often eat garlic at present' 
   D4GARL1_14= 'd4garl1_14 how often ate garlic at around age 60' 
   RD4MILK_14= 'rd4milk_14 proxy or not for d4milk1 and d4milk2' 
   D4MILK1_14= 'd4milk1_14 how often eat milk products at present' 
   D4MILK2_14= 'd4milk2_14 how often ate milk products at around age 60' 
   RD4NUT_14= 'rd4nut_14 proxy or not for d4nut1 and d4nut2' 
   D4NUT1_14= 'd4nut1_14 how often eat nut products at present' 
   D4NUT2_14= 'd4nut2_14 how often ate nut products at around age 60' 
   RD4ALGA_14= 'rd4alga_14 proxy or not for d4alga1 and d4alga2' 
   D4ALGA1_14= 'd4alga1_14 how often eat mushroom or algae at present' 
   D4ALGA2_14= 'd4alga2_14 how often ate mushroom or algae at around age 60' 
   RD4VIT_14= 'rd4vit_14 proxy or not for d4vit1 and d4vit2' 
   D4VIT1_14= 'd4vit1_14 how often eat vitamins (a/c/e) at present' 
   D4VIT2_14= 'd4vit2_14 how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG_14= 'rd4drug_14 proxy or not for d4drug1 and d4drug2' 
   D4DRUG1_14= 'd4drug1_14 how often eat medicinal plants at present' 
   D4DRUG2_14= 'd4drug2_14 how often ate medicinal plants at around age 60' 
   D4A_14  = 'what kind of tea usually drink at present?' 
   D4B_14  = 'what kind of tea usually drink at around age 60?' 
   RD5_14  = 'rd5_14 proxy or not for d5' 
   D5_14   = 'd5_14 what kind of water usually drink?' 
   RD6_14  = 'rd6_14 proxy or not for d6a d6b d6c' 
   D6A_14  = 'd6a_14 main source of water drank during childhood' 
   D6B_14  = 'd6b_14 main source of water drank at around age 60' 
   D6C_14  = 'd6c_14 main source of drinking water at present' 
   RD71_14 = 'rd71_14 proxy or not for d71' 
   D71_14  = 'd71_14 smoke or not at present?' 
   RD72_14 = 'rd72_14 proxy or not for d72' 
   D72_14  = 'd72_14 smoked or not in the past?' 
   RD73_14 = 'rd73_14 proxy or not for d73' 
   D73_14  = 'd73_14 age when began smoking' 
   RD74_14 = 'rd74_14 proxy or not for d74' 
   D74_14  = 'd74_14 age when quit smoking if not smoking at present' 
   RD75_14 = 'rd75_14 proxy or not for d75' 
   D75_14  = 'd75_14 number of times smoke (or smoked) per day' 
   RD76_14 = 'rd76_14 proxy or not for d76' 
   D76_14  = 'd76_14 how soon after you wake up do you smoke your first cigarette?' 
   RD77_14 = 'rd77_14 proxy or not for d77' 
   D77_14  = 'd77_14 what do you think about your chances of being diagnosed with lung cancer?' 
   RD78_14 = 'rd78_14 proxy or not for d78' 
   D78_14  = 'd78_14 during childhood, were you exposed to smoke from other people at home?' 
   D78A_14 = 'd78a_14 if yes, for how many hours per day?' 
   D78B_14 = 'd78b_14 if yes, for how many years?' 
   RD79_14 = 'rd79_14 proxy or not for d79' 
   D79_14  = 'd79_14 during young/middle-ages, were you exposed to smoke from others at home?' 
   D79A_14 = 'd79a_14 if yes, for how many hours per day?' 
   D79B_14 = 'd79b_14 if yes, for how many years?' 
   RD710_14= 'rd710_14 proxy or not for d710' 
   D710_14 = 'd710_14 in social settings such as restaurant, were you exposed to smoke from others?' 
   D710A_14= 'd710a_14 if yes, for how many hours per day?' 
   D710B_14= 'd710b_14 if yes, for how many years?' 
   RD81_14 = 'rd81_14 proxy or not for d81' 
   D81_14  = 'd81_14 drink or not at present?' 
   RD82_14 = 'rd82_14 proxy or not for d82' 
   D82_14  = 'd82_14 drank or not in the past?' 
   RD83_14 = 'rd83_14 proxy or not for d83' 
   D83_14  = 'd83_14 age when began drinking' 
   RD84_14 = 'rd84_14 proxy or not for d84' 
   D84_14  = 'd84_14 age when quit drinking if not drinking at present' 
   RD85_14 = 'rd85_14 proxy or not for d85' 
   D85_14  = 'd85_14 what kind of alcohol you drink (drank) ?' 
   D85A_14 = 'other kind of alcohol' 
   RD86_14 = 'rd86_14 proxy or not for d86' 
   D86_14  = 'd86_14 how much per day do you drink (or drank)?' 
   RD87_14 = 'rd87_14 proxy or not for d87' 
   D87_14  = 'd87_14 when stop drinking, do you feel anxious for most of the day for at least 2 days?' 
   RD91_14 = 'rd91_14 proxy or not for d91' 
   D91_14  = 'd91_14 exercise or not at present?' 
   RD92_14 = 'rd92_14 proxy or not for d92' 
   D92_14  = 'd92_14 exercised or not in the past?' 
   RD93_14 = 'rd93_14 proxy or not for d93' 
   D93_14  = 'd93_14 age when started to exercise' 
   RD94_14 = 'rd94_14 proxy or not for d94' 
   D94_14  = 'd94_14 age when quit exercise if not exercising at present' 
   RD101_14= 'rd101_14 proxy or not for d101' 
   D101_14 = 'd101_14 have you done physical labor regularly?' 
   RD102_14= 'rd102_14 proxy or not for d102' 
   D102_14 = 'd102_14 age when began doing physical labor' 
   RD103_14= 'rd103_14 proxy or not for d103' 
   D103_14 = 'd103_14 age when stopped doing physical labor' 
   RD11A_14= 'rd11a_14 proxy or not for d11a' 
   D11A_14 = 'd11a_14 do you do house work at present?' 
   RD11B_14= 'rd11b_14 proxy or not for d11b' 
   D11B_14 = 'd11b_14 do you grow vegetables & do other field work at present?' 
   RD11C_14= 'rd11c_14 proxy or not for d11c' 
   D11C_14 = 'd11c_14 do you do garden work' 
   RD11D_14= 'rd11d_14 proxy or not for d11d' 
   D11D_14 = 'd11d_14 do you read newspapers/books at present?' 
   RD11E_14= 'rd11e_14 proxy or not for d11e' 
   D11E_14 = 'd11e_14 do you raise domestic animals/pets at present?' 
   RD11F_14= 'rd11f_14 proxy or not for d11f' 
   D11F_14 = 'd11f_14 do you play cards/mah-jongg at present?' 
   RD11G_14= 'rd11g_14 proxy or not for d11g' 
   D11G_14 = 'd11g_14 do you watch tv or listen to radio at present ?' 
   RD11H_14= 'rd11h_14 proxy or not for d11h' 
   D11H_14 = 'd11h_14 do you take part in some social activities at present?' 
   RD12_14 = 'rd12_14 proxy or not for d12' 
   D12_14  = 'd12_14 # of times traveling beyond home county/city in the past two years' 
   RE0_14  = 're0_14 proxy or not for e0' 
   E0_14   = 'e0_14 for the last 6 months, were you limited in activities because of health problem?' 
   RE1_14  = 're1_14 proxy or not for e1' 
   E1_14   = 'e1_14 bathing' 
   RE1B_14 = 're1b_14 proxy or not for e1b' 
   E1B_14  = 'e1b_14 # of days needing assistance in bathing' 
   RE2_14  = 're2_14 proxy or not for e2' 
   E2_14   = 'e2_14 dressing' 
   RE2B_14 = 're2b_14 proxy or not for e2b' 
   E2B_14  = 'e2b_14 # of days needing assistance in dressing' 
   RE3_14  = 're3_14 proxy or not for e3' 
   E3_14   = 'e3_14 toileting' 
   RE3B_14 = 're3b_14 proxy or not for e3b' 
   E3B_14  = 'e3b_14 # of days needing assistance in toileting' 
   RE4_14  = 're4_14 proxy or not for e4' 
   E4_14   = 'e4_14 indoor transferring' 
   RE4B_14 = 're4b_14 proxy or not for e4b' 
   E4B_14  = 'e4b_14 # of days needing assistance in indoor transferring' 
   RE5_14  = 're5_14 proxy or not for e5' 
   E5_14   = 'e5_14 continence' 
   RE5B_14 = 're5b_14 proxy or not for e5b' 
   E5B_14  = 'e5b_14 # of days needing assistance in continence' 
   RE6_14  = 're6_14 proxy or not for e6' 
   E6_14   = 'e6_14 feeding' 
   RE6B_14 = 're6b_14 proxy or not for e6b' 
   E6B_14  = 'e6b_14 # of days needing assistance in feeding' 
   RE610_14= 're610_14 proxy or not for e610' 
   E610_14 = 'e610_14 primary caregiver when the elder need assistance in above six tasks' 
   RE62_14 = 're62_14 proxy or not for e62' 
   E62_14  = 'e62_14 the willingness of the primary caregiver when providing such care' 
   RE63_14 = 're63_14 proxy or not for e63' 
   E63_14  = 'e63_14 the total direct cost paid for caregiving last week' 
   RE64_14 = 're64_14 proxy or not for e64' 
   E64_14  = 'e64_14 who mainly pays the above cost?' 
   E64A_14 = 'e64a_14 othe people who pays the above cost' 
   RE65_14 = 're65_14 proxy or not for e65' 
   E65_14  = 'e65_14 does the help received for the six above tasks meet his/her needs?' 
   RE67_14 = 're67_14 proxy or not for e67' 
   E67_14  = 'e67_14 how many hours did the (grand)children help the elder last week?' 
   RE7_14  = 're7_14 proxy or not for e7' 
   E7_14   = 'e7_14 able to go outside to visit neighbors?' 
   RE8_14  = 're8_14 proxy or not for e8' 
   E8_14   = 'e8_14 able to go shopping by yourself?' 
   RE9_14  = 're9_14 proxy or not for e9' 
   E9_14   = 'e9_14 able to make food by yourself?' 
   RE10_14 = 're10_14 proxy or not for e10' 
   E10_14  = 'e10_14 able to wash clothes by yourself?' 
   RE11_14 = 're11_14 proxy or not for e11' 
   E11_14  = 'e11_14 able to walk one kilometer?' 
   RE12_14 = 're12_14 proxy or not for e12' 
   E12_14  = 'e12_14 able to carry 5kg weight?' 
   RE13_14 = 're13_14 proxy or not for e13' 
   E13_14  = 'e13_14 able to crouch and stand three times?' 
   RE14_14 = 're14_14 proxy or not for e14' 
   E14_14  = 'e14_14 able to take public transportation?' 
   RF1_14  = 'rf1_14 proxy or not for f1' 
   F1_14   = 'f1_14 years of schooling' 
   RF2_14  = 'rf2_14 proxy or not for f2' 
   F2_14   = 'f2_14 main occupation before age 60' 
   RF21_14 = 'rf21_14 proxy or not for f21' 
   F21_14  = 'f21_14 do you have a retirement pension?' 
   RF211_14= 'rf211_14 proxy or not for f211' 
   F211_14 = 'f211_14 are you retired?' 
   RF22_14 = 'rf22_14 proxy or not for f22' 
   F22_14  = 'f22_14 which year did you retire?' 
   RF221_14= 'rf221_14 proxy or not for f221' 
   F221_14 = 'f221_14 if retired, what is your monthly retirement pension?' 
   RF23_14 = 'rf23_14 proxy or not for f23' 
   F23_14  = 'f23_14 are you still engaged in paid jobs after retirement?' 
   RF24_14 = 'rf24_14 proxy or not for f24' 
   F24_14  = 'f24_14 do you have public old age insurance?' 
   RF25A_14= 'rf25a_14 proxy or not for f25a' 
   F25A1_14= 'f25a1_14 what is the annual payment by individual if taking part in old age insurance?' 
   F25A2_14= 'f25a2_14 what is the annual subsidy by government if taking part in old age insurance?' 
   RF25B_14= 'rf25b_14 proxy or not for f25b' 
   F25B1_14= 'f25b1_14 which year did you take part in public old age insurance?' 
   F25B2_14= 'f25b2_14 which month did you take part in public old age insurance?' 
   RF26_14 = 'rf26_14 proxy or not for f26' 
   F26_14  = 'f26_14 what is your monthly pension from old age insurance at present?' 
   RF27_14 = 'rf27_14 proxy or not for f27' 
   F27_14  = 'f27_14 what''s the reason that you did not take part in old age insurance?' 
   RF31_14 = 'rf31_14 proxy or not for f31' 
   F31_14  = 'f31_14 main source of financial support' 
   RF32_14 = 'rf32_14 proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A_14 = 'f32a_14 first of other financial support sources' 
   F32B_14 = 'f32b_14 second of other financial support sources' 
   F32C_14 = 'f32c_14 third of other financial support sources' 
   F32D_14 = 'f32d_14 fourth of other financial support sources' 
   F32E_14 = 'f32e_14 fifth of other financial support sources' 
   RF33_14 = 'rf33_14 proxy or not for f33' 
   F33_14  = 'f33_14 is all of the financial support sufficient to pay for daily expenses?' 
   RF340_14= 'rf340_14 proxy or not for f340' 
   F340_14 = 'f340_14 your power in decision-making on financial spending in the household' 
   RF34_14 = 'rf34_14 proxy or not for f34' 
   F34_14  = 'f34_14 how do you rate your economic status compared with other local people?' 
   RF35_14 = 'rf35_14 proxy or not for f35' 
   F35_14  = 'f35_14 total income of your household last year' 
   RF41_14 = 'rf41_14 proxy or not for f41' 
   F41_14  = 'f41_14 current marital status' 
   RF41A_14= 'rf41a_14 proxy or not for f41a' 
   F41A1_14= 'f41a1_14 did you experience the event of spouse passing-away after 2008 survey?' 
   F41A11_14= 'f41a11_14 if yes, which year to be widowed?' 
   F41A12_14= 'f41a12_14 if yes, which month to be widowed?' 
   F41A2_14= 'f41a2_14 did you experience the event of divorcement after 2008 survey?' 
   F41A21_14= 'f41a21_14 if yes, which year to be divorced?' 
   F41A22_14= 'f41a22_14 if yes, which month to be divorced?' 
   F41A3_14= 'f41a3_14 did you experience the event of remarriage after 2008 survey?' 
   F41A31_14= 'f41a31_14 if yes, which year to be remarried?' 
   F41A32_14= 'f41a32_14 if yes, which month to be remarried?' 
   RF41B_14= 'rf41b_14 proxy or not for f41b' 
   F41B_14 = 'f41b_14 do you have cohabited partner but not formally married at present?' 
   F41B1_14= 'f41b1_14 if yes, which year to be cohabited?' 
   F41B2_14= 'f41b2_14 if yes, which month to be cohabited?' 
   RF42_14 = 'rf42_14 proxy or not for f42' 
   F42_14  = 'f42_14 how many times have you been married?' 
   RF43A_14= 'rf43a_14 proxy or not for f43a1 to f43a4' 
   F43A1_14= 'f43a1_14 age at the 1st marriage' 
   F43A2_14= 'f43a2_14 current status of the 1st marriage' 
   F43A3_14= 'f43a3_14 age at the 1st marriage dissolution' 
   F43A4_14= 'f43a4_14 quality of the 1st marriage' 
   RF43B_14= 'rf43b_14 proxy or not for f43b1 to f43b4' 
   F43B1_14= 'f43b1_14 age at the 2nd marriage' 
   F43B2_14= 'f43b2_14 current status of the 2nd marriage' 
   F43B3_14= 'f43b3_14 age at the 2nd marriage dissolution' 
   F43B4_14= 'f43b4_14 quality of the 2nd marriage' 
   RF43C_14= 'rf43c_14 proxy or not for f43c1 to f43c4' 
   F43C1_14= 'f43c1_14 age at the 3rd marriage' 
   F43C2_14= 'f43c2_14 current status of the 3rd marriage' 
   F43C3_14= 'f43c3_14 age at the 3rd marriage dissolution' 
   F43C4_14= 'f43c4_14 quality of the 3rd marriage' 
   RF43D_14= 'rf43d_14 proxy or not for f43d1 to f43d4' 
   F43D1_14= 'f43d1_14 age at the latest marriage' 
   F43D2_14= 'f43d2_14 current status of the latest marriage' 
   F43D3_14= 'f43d3_14 age at the latest marriage dissolution' 
   F43D4_14= 'f43d4_14 quality of the latest marriage' 
   RF44_14 = 'rf44_14 proxy or not for f44' 
   F44_14  = 'f44_14 years of schooling of the latest spouse' 
   RF45_14 = 'rf45_14 proxy or not for f45' 
   F45_14  = 'f45_14 main occupation of the latest spouse before age 60' 
   RF46_14 = 'rf46_14 proxy or not for f46' 
   F46_14  = 'f46_14 does your spouse have a paid job at present?' 
   RF47_14 = 'rf47_14 proxy or not for f47' 
   F47_14  = 'f47_14 current health status of your spouse' 
   RF5_14  = 'rf5_14 proxy or not for f5' 
   F5_11_14= 'f5_11_14 who take care of you when you are sick?' 
   RF61_14 = 'rf61_14 proxy or not for f61' 
   F61_14  = 'f61_14 get adequate medical service at present' 
   RF610_14= 'rf610_14 proxy or not for f610' 
   F610_14 = 'f610_14 main reason not to visit doctor when necessary' 
   RF62_14 = 'rf62_14 proxy or not for f62' 
   F62_14  = 'f62_14 got adequate medical treatment at around age 60' 
   RF63_14 = 'rf63_14 proxy or not for 63' 
   F63_14  = 'f63_14 got adequate medical treatment in childhood' 
   RF64_14 = 'rf64_14 proxy or not for f64a-f64t' 
   F64A_14 = 'f64a_14 do you have retirement pension at present' 
   F64B_14 = 'f64b_14 do you have public old-age insurance at present' 
   F64C_14 = 'f64c_14 do you have private or commercial old-age insurance at present' 
   F64D_14 = 'f64d_14 do you have public free medical services at present' 
   F64E_14 = 'f64e_14 do you have medical insurance for urban workers at present' 
   F64F_14 = 'f64f_14 do you have collective medical insurance for urban residents at present' 
   F64G_14 = 'f64g_14 do you have the new rural cooperative medical insurance at present' 
   F64H_14 = 'f64h_14 do you have commercial medical insurance at present' 
   F64I_14 = 'f64i_14 do you have other social security or private insurance at present' 
   RF651A1_14= 'rf651a1_14 proxy or not for f651a1' 
   F651A1_14= 'f651a1_14 how much money did you spend on outpatient costs last year?' 
   RF651B1_14= 'rf651b1_14 proxy or not for f651b1' 
   F651B1_14= 'f651b1_14 how much money did your family pay for outpatient costs last year?' 
   RF651A2_14= 'rf651a2_14 proxy or not for f651a2' 
   F651A2_14= 'f651a2_14 how much money did you spend on inpatient costs last year?' 
   RF651B2_14= 'rf651b2_14 proxy or not for f651b2' 
   F651B2_14= 'f651b2_14 how much money did your family pay for inpatient costs last year?' 
   RF6521_14= 'rf6521_14 proxy or not for f6521' 
   F6521_14= 'f6521_14 who mainly paid the cost?' 
   F6521T_14= 'other people who mainly paid the cost' 
   RF652A_14= 'rf652a_14 proxy or not for f652a' 
   F652A_14= 'f652a_14 how far from your home to the nearest hospital (in kilometres)?' 
   RF652B_14= 'rf652b_14 proxy or not for f652b' 
   F652B_14= 'f652b_14 do you have regular phycial examination once every year?' 
   RF66_14 = 'rf66_14 proxy or not for f66' 
   F66_14  = 'often went to bed hungry as a child' 
   RF71_14 = 'rf71_14 proxy or not for f71' 
   F71_14  = 'f71_14 mother alive or not' 
   RF721_14= 'rf721_14 proxy or not for f721' 
   F721_14 = 'f721_14 mother''s age if alive' 
   RF722_14= 'rf722_14 proxy or not for f722' 
   F722_14 = 'f722_14 mother''s age at death' 
   RF73_14 = 'rf73_14 proxy or not for f73' 
   F73_14  = 'f73_14 respondent''s age at mother''s death' 
   RF74_14 = 'rf74_14 proxy or not for f74' 
   F74_14  = 'f74_14 how many years did your mother attend school?' 
   RF81_14 = 'rf81_14 proxy or not for f81' 
   F81_14  = 'f81_14 father alive or not' 
   RF821_14= 'rf821_14 proxy or not for f821' 
   F821_14 = 'f821_14 father''s age if alive' 
   RF822_14= 'rf822_14 proxy or not for f822' 
   F822_14 = 'f822_14 father''s age at death' 
   RF83_14 = 'rf83_14 proxy or not for f83' 
   F83_14  = 'f83_14 respondent''s age at father''s death' 
   RF84_14 = 'rf84_14 proxy or not for f84' 
   F84_14  = 'f84_14 father''s main occupation before age 60' 
   RF85_14 = 'rf85_14 proxy or not for f85' 
   F85_14  = 'f85_14 father''s main occupation in your childhood' 
   RF86_14 = 'rf86_14 proxy or not for f86' 
   F86_14  = 'f86_14 years of schooling your father received' 
   RF91_14 = 'rf91_14 proxy or not for f91' 
   F91_14  = 'Birth order of respondent' 
   RF92A_14= 'rf92a_14 proxy or not for f92a1 to f92a7' 
   F92A1_14= 'f92a1_14 birth order of the 1st sibling' 
   F92A2_14= 'f92a2_14 sex of the 1st sibling' 
   F92A3_14= 'f92a3_14 the 1st sibling alive or not' 
   F92A4_14= 'f92a4_14 sibling''s age at present if alive, or age at death if died' 
   F92A5_14= 'f92a5_14 residence distance' 
   F92A6_14= 'f92a6_14 frequent visits' 
   F92A7_14= 'f92a7_14 contact with the 1st sibling' 
   RF92B_14= 'rf92b_14 proxy or not for f92b1 to f92b7' 
   F92B1_14= 'f92b1_14 birth order of the 2nd sibling' 
   F92B2_14= 'f92b2_14 sex of the 2nd sibling' 
   F92B3_14= 'f92b3_14 the 2nd sibling alive or not' 
   F92B4_14= 'f92b4_14 sibling''s age at present if alive, or age at death if died' 
   F92B5_14= 'f92b5_14 residence distance' 
   F92B6_14= 'f92b6_14 frequent visits' 
   F92B7_14= 'f92b7_14 contact with the 2nd sibling' 
   RF92C_14= 'rf92c_14 proxy or not for f92c1 to f92c7' 
   F92C1_14= 'f92c1_14 birth order of the 3rd sibling' 
   F92C2_14= 'f92c2_14 sex of the 3rd sibling' 
   F92C3_14= 'f92c3_14 the 3rd sibling alive or not' 
   F92C4_14= 'f92c4_14 sibling''s age at present if alive, or age at death if died' 
   F92C5_14= 'f92c5_14 residence distance' 
   F92C6_14= 'f92c6_14 frequent visits' 
   F92C7_14= 'f92c7_14 contact with the 3rd sibling' 
   RF92D_14= 'rf92d_14 proxy or not for f92d1 to f92d7' 
   F92D1_14= 'f92d1_14 birth order of the 4th sibling' 
   F92D2_14= 'f92d2_14 sex of the 4th sibling' 
   F92D3_14= 'f92d3_14 the 4th sibling alive or not' 
   F92D4_14= 'f92d4_14 sibling''s age at present if alive, or age at death if died' 
   F92D5_14= 'f92d5_14 residence distance' 
   F92D6_14= 'f92d6_14 frequent visits' 
   F92D7_14= 'f92d7_14 contact with the 4th sibling' 
   RF92E_14= 'rf92e_14 proxy or not for f92e1 to f92e7' 
   F92E1_14= 'f92e1_14 birth order of the 5th sibling' 
   F92E2_14= 'f92e2_14 sex of the 5th sibling' 
   F92E3_14= 'f92e3_14 the 5th sibling alive or not' 
   F92E4_14= 'f92e4_14 sibling''s age at present if alive, or age at death if died' 
   F92E5_14= 'f92e5_14 residence distance' 
   F92E6_14= 'f92e6_14 frequent visits' 
   F92E7_14= 'f92e7_14 contact with the 5th sibling' 
   RF92F_14= 'rf92f_14 proxy or not for f92f1 to f92f7' 
   F92F1_14= 'f92f1_14 birth order of the 6th sibling' 
   F92F2_14= 'f92f2_14 sex of the 6th sibling' 
   F92F3_14= 'f92f3_14 the 6th sibling alive or not' 
   F92F4_14= 'f92f4_14 sibling''s age at present if alive, or age at death if died' 
   F92F5_14= 'f92f5_14 residence distance' 
   F92F6_14= 'f92f6_14 frequent visits' 
   F92F7_14= 'f92f7_14 contact with the 6th sibling' 
   RF92G_14= 'rf92g_14 proxy or not for f92g1 to f92g7' 
   F92G1_14= 'f92g1_14 birth order of the 7th sibling' 
   F92G2_14= 'f92g2_14 sex of the 7th sibling' 
   F92G3_14= 'f92g3_14 the 7th sibling alive or not' 
   F92G4_14= 'f92g4_14 sibling''s age at present if alive, or age at death if died' 
   F92G5_14= 'f92g5_14 residence distance' 
   F92G6_14= 'f92g6_14 frequent visits' 
   F92G7_14= 'f92g7_14 contact with the 7th sibling' 
   RF92H_14= 'rf92h_14 proxy or not for f92h1 to f92h7' 
   F92H1_14= 'f92h1_14 birth order of the 8th sibling' 
   F92H2_14= 'f92h2_14 sex of the 8th sibling' 
   F92H3_14= 'f92h3_14 the 8th sibling alive or not' 
   F92H4_14= 'f92h4_14 sibling''s age at present if alive, or age at death if died' 
   F92H5_14= 'f92h5_14 residence distance' 
   F92H6_14= 'f92h6_14 frequent visits' 
   F92H7_14= 'f92h7_14 contact with the 8th sibling' 
   RF92I_14= 'rf92i_14 proxy or not for f92i1 to f92i7' 
   F92I1_14= 'f92i1_14 birth order of the 9th sibling' 
   F92I2_14= 'f92i2_14 sex of the 9th sibling' 
   F92I3_14= 'f92i3_14 the 9th sibling alive or not' 
   F92I4_14= 'f92i4_14 sibling''s age at present if alive, or age at death if died' 
   F92I5_14= 'f92i5_14 residence distance' 
   F92I6_14= 'f92i6_14 frequent visits' 
   F92I7_14= 'f92i7_14 contact with the 9th sibling' 
   RF92J_14= 'rf92j_14 proxy or not for f92j1 to f92j7' 
   F92J1_14= 'f92j1_14 birth order of the 10th sibling' 
   F92J2_14= 'f92j2_14 sex of the 10th sibling' 
   F92J3_14= 'f92j3_14 the 10th sibling alive or not' 
   F92J4_14= 'f92j4_14 sibling''s age at present if alive, or age at death if died' 
   F92J5_14= 'f92j5_14 residence distance' 
   F92J6_14= 'f92j6_14 frequent visits' 
   F92J7_14= 'f92j7_14 contact with the 10th sibling' 
   JIGE_14 = 'jige_14 number of siblings alive who are 80+ years old' 
   RF10_14 = 'rf10_14 proxy or not for f10 and f10a' 
   F10_14  = 'f10_14 number of children ever born' 
   F10A_14 = 'f10a_14 number of male children ever born' 
   RF101_14= 'rf101_14 proxy or not for f101' 
   F101_14 = 'f101_14 age at first birth' 
   RF102_14= 'rf102_14 proxy or not for f102' 
   F102_14 = 'f102_14 age at last birth' 
   RF103A_14= 'rf103a_14 proxy or not for f103a1 to f103a8' 
   F103A8_14= 'f103a8_14 1st child is biological or not?' 
   F103A1_14= 'f103a1_14 sex of the 1st child' 
   F103A2_14= 'f103a2_14 the 1st child alive or not' 
   F103A3_14= 'f103a3_14 the 1st child''s age at present if alive, or age the child would be if s/he alive' 
   F103A4_14= 'f103a4_14 frequent visits of the 1st child' 
   F103A7_14= 'f103a7_14 contact with the 1st child' 
   F103A5_14= 'f103a5_14 residence distance of the 1st child' 
   RF103B_14= 'rf103b_14 proxy or not for f103b1 to f103b8' 
   F103B8_14= 'f103b8_14 2nd child is biological or not?' 
   F103B1_14= 'f103b1_14 sex of the 2nd child' 
   F103B2_14= 'f103b2_14 the 2nd child alive or not' 
   F103B3_14= 'f103b3_14 the 2nd child''s age at present if alive, or age the child would be if s/he alive' 
   F103B4_14= 'f103b4_14 frequent visits of the 2nd child' 
   F103B7_14= 'f103b7_14 contact with the 2nd child' 
   F103B5_14= 'f103b5_14 residence distance of the 2nd child' 
   RF103C_14= 'rf103c_14 proxy or not for f103c1 to f103c8' 
   F103C8_14= 'f103c8_14 3rd child is biological or not?' 
   F103C1_14= 'f103c1_14 sex of the 3rd child' 
   F103C2_14= 'f103c2_14 the 3rd child alive or not' 
   F103C3_14= 'f103c3_14 the 3rd child''s age at present if alive, or age the child would be if s/he alive' 
   F103C4_14= 'f103c4_14 frequent visits of the 3rd child' 
   F103C7_14= 'f103c7_14 contact with the 3rd child' 
   F103C5_14= 'f103c5_14 residence distance of the 3rd child' 
   RF103D_14= 'rf103d_14 proxy or not for f103d1 to f103d8' 
   F103D8_14= 'f103d8_14 4th child is biological or not?' 
   F103D1_14= 'f103d1_14 sex of the 4th child' 
   F103D2_14= 'f103d2_14 the 4th child alive or not' 
   F103D3_14= 'f103d3_14 the 4th child''s age at present if alive, or age the child would be if s/he alive' 
   F103D4_14= 'f103d4_14 frequent visits of the 4th child' 
   F103D7_14= 'f103d7_14 contact with the 4th child' 
   F103D5_14= 'f103d5_14 residence distance of the 4th child' 
   RF103E_14= 'rf103e_14 proxy or not for f103e1 to f103e8' 
   F103E8_14= 'f103e8_14 5th child is biological or not?' 
   F103E1_14= 'f103e1_14 sex of the 5th child' 
   F103E2_14= 'f103e2_14 the 5th child alive or not' 
   F103E3_14= 'f103e3_14 the 5th child''s age at present if alive, or age the child would be if s/he alive' 
   F103E4_14= 'f103e4_14 frequent visits of the 5th child' 
   F103E7_14= 'f103e7_14 contact with the 5th child' 
   F103E5_14= 'f103e5_14 residence distance of the 5th child' 
   RF103F_14= 'rf103f_14 proxy or not for f103f1 to f103f8' 
   F103F8_14= 'f103f8_14 6th child is biological or not?' 
   F103F1_14= 'f103f1_14 sex of the 6th child' 
   F103F2_14= 'f103f2_14 the 6th child alive or not' 
   F103F3_14= 'f103f3_14 the 6th child''s age at present if alive, or age the child would be if s/he alive' 
   F103F4_14= 'f103f4_14 frequent visits of the 6th child' 
   F103F7_14= 'f103f7_14 contact with the 6th child' 
   F103F5_14= 'f103f5_14 residence distance of the 6th child' 
   RF103G_14= 'rf103g_14 proxy or not for f103g1 to f103g8' 
   F103G8_14= 'f103g8_14 7th child is biological or not?' 
   F103G1_14= 'f103g1_14 sex of the 7th child' 
   F103G2_14= 'f103g2_14 the 7th child alive or not' 
   F103G3_14= 'f103g3_14 the 7th child''s age at present if alive, or age the child would be if s/he alive' 
   F103G4_14= 'f103g4_14 frequent visits of the 7th child' 
   F103G7_14= 'f103g7_14 contact with the 7th child' 
   F103G5_14= 'f103g5_14 residence distance of the 7th child' 
   RF103H_14= 'rf103h_14 proxy or not for f103h1 to f103h8' 
   F103H8_14= 'f103h8_14 8th child is biological or not?' 
   F103H1_14= 'f103h1_14 sex of the 8th child' 
   F103H2_14= 'f103h2_14 the 8th child alive or not' 
   F103H3_14= 'f103h3_14 the 8th child''s age at present if alive, or age the child would be if s/he alive' 
   F103H4_14= 'f103h4_14 frequent visits of the 8th child' 
   F103H7_14= 'f103h7_14 contact with the 8th child' 
   F103H5_14= 'f103h5_14 residence distance of the 8th child' 
   RF103I_14= 'rf103i_14 proxy or not for f103i1 to f103i8' 
   F103I8_14= 'f103i8_14 9th child is biological or not?' 
   F103I1_14= 'f103i1_14 sex of the 9th child' 
   F103I2_14= 'f103i2_14 the 9th child alive or not' 
   F103I3_14= 'f103i3_14 the 9th child''s age at present if alive, or age the child would be if s/he alive' 
   F103I4_14= 'f103i4_14 frequent visits of the 9th child' 
   F103I7_14= 'f103i7_14 contact with the 9th child' 
   F103I5_14= 'f103i5_14 residence distance of the 9th child' 
   RF103J_14= 'rf103j_14 proxy or not for f103j1 to f103j8' 
   F103J8_14= 'f103j8_14 10th child is biological or not?' 
   F103J1_14= 'f103j1_14 sex of the 10th child' 
   F103J2_14= 'f103j2_14 the 10th child alive or not' 
   F103J3_14= 'f103j3_14 the 10th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103J4_14= 'f103j4_14 frequent visits of the 10th child' 
   F103J7_14= 'f103j7_14 contact with the 10th child' 
   F103J5_14= 'f103j5_14 residence distance of the 10th child' 
   RF103K_14= 'rf103k_14 proxy or not for f103k1 to f103k8' 
   F103K8_14= 'f103k8_14 11th child is biological or not?' 
   F103K1_14= 'f103k1_14 sex of the 11th child' 
   F103K2_14= 'f103k2_14 the 11th child alive or not' 
   F103K3_14= 'f103k3_14 the 11th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103K4_14= 'f103k4_14 frequent visits of the 11th child' 
   F103K7_14= 'f103k7_14 contact with the 11th child' 
   F103K5_14= 'f103k5_14 residence distance of the 11th child' 
   RF103L_14= 'rf103l_14 proxy or not for f103l1 to f103l8' 
   F103L8_14= 'f103l8_14 12th child is biological or not?' 
   F103L1_14= 'f103l1_14 sex of the 12th child' 
   F103L2_14= 'f103l2_14 the 12th child alive or not' 
   F103L3_14= 'f103l3_14 the 12th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103L4_14= 'f103l4_14 frequent visits of the 12th child' 
   F103L7_14= 'f103l7_14 contact with the 12th child' 
   F103L5_14= 'f103l5_14 residence distance of the 12th child' 
   RF103M_14= 'rf103m_14 proxy or not for f103m1 to f103m8' 
   F103M8_14= 'f103m8_14 13th child is biological or not?' 
   F103M1_14= 'f103m1_14 sex of the 13th child' 
   F103M2_14= 'f103m2_14 the 13th child alive or not' 
   F103M3_14= 'f103m3_14 the 13th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103M4_14= 'f103m4_14 frequent visits of the 13th child' 
   F103M7_14= 'f103m7_14 contact with the 13th child' 
   F103M5_14= 'f103m5_14 residence distance of the 13th child' 
   RF104_14= 'proxy or not for f104' 
   F104_14 = 'f104_14 age of the oldest son alive at present' 
   RF105_14= 'proxy or not for f105' 
   F105_14 = 'age of the youngest son alive at present' 
   F111A_14= 'f111a_14 the first person to whom you usually talk frequently in daily life' 
   F111B_14= 'f111b_14 the second person to whom you usually talk frequently in daily life' 
   F111C_14= 'f111c_14 the third person to whom you usually talk frequently in daily life' 
   F112A_14= 'f112a_14 1st person to whom you talk first when you need to share your thoughts' 
   F112B_14= 'f112b_14 2nd person to whom you talk first when you need to share your thoughts' 
   F112C_14= 'f112c_14 3rd person to whom you talk first when you need to share your thoughts' 
   F113A_14= 'f113a_14 1st person you ask for help when you have problem/difficulties' 
   F113B_14= 'f113b_14 2nd person you ask for help when you have problem/difficulties' 
   F113C_14= 'f113c_14 3rd person you ask for help when you have problem/difficulties' 
   RF12_14 = 'rf12_14 proxy or not for f12a to f12c' 
   F12A_14 = 'f12a_14 how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B_14 = 'f12b_14 how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C_14 = 'f12c_14 how much did you receive from your grandchild(ren) last year?' 
   RF13_14 = 'rf13_14 proxy or not for f13a to f13c' 
   F13A_14 = 'f13a_14 how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B_14 = 'f13b_14 how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C_14 = 'f13c_14 how much did you give to your grandchild(ren)in last year?' 
   RF14_14 = 'rf14_14 proxy or not for f14' 
   F141_14 = 'f141_14 are personal care services available in your community?' 
   F142_14 = 'f142_14 are home visit services available in your community?' 
   F143_14 = 'f143_14 are psychological consulting services available in your community?' 
   F144_14 = 'f144_14 are daily shopping services available in your community?' 
   F145_14 = 'f145_14 are social and recreation services available in your community?' 
   F146_14 = 'f146_14 are legal aid services available in your community?' 
   F147_14 = 'f147_14 are healthcare education services available in your community?' 
   F148_14 = 'f148_14 are neighborhood-relation services available in your community?' 
   F149_14 = 'f149_14 are any other social services available in your community?' 
   F14T_14 = 'other service beyond f141-f149' 
   RF15_14 = 'rf15_14 proxy or not for f15' 
   F151_14 = 'f151_14 do you expect your community to provide personal care services?' 
   F152_14 = 'f152_14 do you expect your community to provide home visit services?' 
   F153_14 = 'f153_14 do you expect your community to provide psychological consulting services?' 
   F154_14 = 'f154_14 do you expect your community to provide daily shopping services?' 
   F155_14 = 'f155_14 do you expect your community to provide social and recreation activities?' 
   F156_14 = 'f156_14 do you expect your community provide legal aid services?' 
   F157_14 = 'f157_14 do you expect your community to provide healthcare education service?' 
   F158_14 = 'f158_14 do you expect your community to provide neighborhood-relation services?' 
   F159_14 = 'f159_14 do you expect your community to provide other social services?' 
   F15T_14 = 'other service beyond f151-f159' 
   F16_14  = 'f16_14 what kind of living arrangement do you like best?' 
   RG01_14 = 'rg01_14 proxy or not for g01' 
   G01_14  = 'g01_14 how about the quality of your sleep?' 
   RG02_14 = 'rg02_14 proxy or not for g02' 
   G02_14  = 'g02_14 how long do you sleep normally?' 
   RG1_14  = 'rg1_14 proxy or not for g1' 
   G1_14   = 'g1_14 visual function: can you see the break in the circle?' 
   G1A_14  = 'g1a_14 if so, where is the break located?' 
   RG21_14 = 'rg21_14 proxy or not for g21' 
   G21_14  = 'g21_14 number of natural teeth' 
   RG22_14 = 'rg22_14 proxy or not for g22' 
   G22_14  = 'g22_14 have false teeth?' 
   RG23_14 = 'rg23_14 proxy or not for g23' 
   G23_14  = 'g23_14 how often do you brush your teeth every day?' 
   RG24_14 = 'rg24_14 proxy or not for g24' 
   G24_14  = 'g24_14 during the past 6 months, did you have a toothache more than once?' 
   RG24A_14= 'rg24a_14 proxy or not for g24a' 
   G24A_14 = 'g24a_14 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG25_14 = 'rg25_14 proxy or not for g25' 
   G25_14  = 'g25_14 during the past 6 months, did you have pain in jaw joint or so more than once?' 
   RG25A_14= 'rg25a_14 proxy or not for g25a' 
   G25A_14 = 'g25a_14 on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG3_14  = 'rg3_14 proxy or not for g3' 
   G3_14   = 'g3_14 able to use chopsticks to eat?' 
   RG4_14  = 'rg4_14 proxy or not for g4' 
   G4_14   = 'g4_14 which hand do you normally use for eating?' 
   RG4A_14 = 'rg4a_14 proxy or not for g4a' 
   G4A_14  = 'g4a_14 which hand do you normally use for writing?' 
   RG4B_14 = 'rg4b_14 proxy or not for g4b' 
   G4B_14  = 'g4b_14 which hand do you normally use for brushing your teeth?' 
   RG5_14  = 'rg5_14 proxy or not for g5' 
   G511_14 = 'g511_14 blood pressure test for the 1st time: systolic' 
   G512_14 = 'g512_14 blood pressure test for the 1st time: diastolic' 
   G521_14 = 'g521_14 blood pressure test for the 2nd time: systolic' 
   G522_14 = 'g522_14 blood pressure test for the 2nd time: diastolic' 
   G6_14   = 'g6_14 rhythm of heart' 
   G7_14   = 'g7_14 heart rate (in beats/min)' 
   G81_14  = 'g81_14 hand behind neck' 
   G82_14  = 'g82_14 hand behind lower back' 
   G83_14  = 'g83_14 hold-up arms' 
   G9_14   = 'g9_14 able to stand up from sitting in a chair?' 
   G101_14 = 'g101_14 weight (kilograms)' 
   G1011_14= 'g1011_14 calf curcumference (cm)' 
   G102_14 = 'g102_14 is the participant hunchbacked?' 
   G1021_14= 'g1021_14 directly measured height of the interviewee' 
   G122_14 = 'g122_14 height measured from top of the right arm bone to top of the right shoulder' 
   G123_14 = 'g123_14 height measured from the right knee joint to the ground' 
   G102C_14= 'g102c_14 waist circumference' 
   RG106_14= 'rg106_14 proxy or not for g106' 
   G106_14 = 'g106_14 do you have any difficulty with your hearing?' 
   RG1061_14= 'rg1061_14 proxy or not for g1061' 
   G1061_14= 'g1061_14 in which ear(s) do you have a hearing difficulty?' 
   RG1062_14= 'rg1062_14 proxy or not for g1062' 
   G1062_14= 'g1062_14 at what age did you first notice a hearing difficulty?' 
   RG1063_14= 'rg1063_14 proxy or not for g1063' 
   G1063_14= 'g1063_14 how quickly did your hearing difficulty develop?' 
   G11_14  = 'g11_14 able to pick up a book from the floor?' 
   G12_14  = 'g12_14 steps used to turn around 360 with help?' 
   RG130_14= 'rg130_14 proxy or not for g130' 
   G130_14 = 'g130_14 feel not-well within the past two weeks?' 
   RG13_14 = 'rg13_14 with proxy or not for g131' 
   G131_14 = 'g131_14 # of times suffering from serious illness within the past two years' 
   G132_14 = 'g132_14 # of times in hospitals' 
   RG14A_14= 'rg14a_14 with proxy or not for g14a1 and g14a2' 
   G14A1_14= 'g14a1_14 name of disease suffered at 1st hospital visit' 
   G14A2_14= 'g14a2_14 1st time, number of days in hospital or bedridden' 
   G141T_14= 'g141t_14 the name of other diseases beyond g14a1 at the first time' 
   RG14B_14= 'rg14b_14 with proxy or not for g14b1 and g14b2' 
   G14B1_14= 'g14b1_14 name of disease suffered at 2nd hospital visit' 
   G14B2_14= 'g14b2_14 2nd time, number of days in hospital or bedridden' 
   G142T_14= 'g142t_14 the name of other diseases beyond g14b1 at the second time' 
   RG14C_14= 'rg14c_14 with proxy or not for g14c1 and g14c2' 
   G14C1_14= 'g14c1_14 name of disease suffered at the last hospital visit' 
   G14C2_14= 'g14c2_14 last time, days in hospital or bedridden' 
   G143T_14= 'g143t_14 the name of other diseases beyond g14c1 at the last time' 
   G15A1_14= 'g15a1_14 suffering from hypertension?' 
   G15A2_14= 'g15a2_14 diagnosed by hospital?' 
   G15A3_14= 'g15a3_14 disability in daily life' 
   G15B1_14= 'g15b1_14 suffering from diabetes?' 
   G15B2_14= 'g15b2_14 diagnosed by hospital?' 
   G15B3_14= 'g15b3_14 disability in daily life' 
   G15C1_14= 'g15c1_14 suffering from heart disease?' 
   G15C2_14= 'g15c2_14 diagnosed by hospital?' 
   G15C3_14= 'g15c3_14 disability in daily life' 
   G15D1_14= 'g15d1_14 suffering from stroke or cvd?' 
   G15D2_14= 'g15d2_14 diagnosed by hospital?' 
   G15D3_14= 'g15d3_14 disability in daily life' 
   G15E1_14= 'g15e1_14 suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2_14= 'g15e2_14 diagnosed by hospital?' 
   G15E3_14= 'g15e3_14 disability in daily life' 
   G15F1_14= 'g15f1_14 suffering from tuberculosis?' 
   G15F2_14= 'g15f2_14 diagnosed by hospital?' 
   G15F3_14= 'g15f3_14 disability in daily life' 
   G15G1_14= 'g15g1_14 suffering from cataract?' 
   G15G2_14= 'g15g2_14 diagnosed by hospital?' 
   G15G3_14= 'g15g3_14 disability in daily life' 
   G15H1_14= 'g15h1_14 suffering from glaucoma?' 
   G15H2_14= 'g15h2_14 diagnosed by hospital?' 
   G15H3_14= 'g15h3_14 disability in daily life' 
   G15I1_14= 'g15i1_14 suffering from cancer?' 
   G15I2_14= 'g15i2_14 diagnosed by hospital?' 
   G15I3_14= 'g15i3_14 disability in daily life' 
   G15J1_14= 'g15j1_14 suffering from prostate tumor?' 
   G15J2_14= 'g15j2_14 diagnosed by hospital?' 
   G15J3_14= 'g15j3_14 disability in daily life' 
   G15K1_14= 'g15k1_14 suffering from gastric or duodenal ulcer?' 
   G15K2_14= 'g15k2_14 diagnosed by hospital?' 
   G15K3_14= 'g15k3_14 disability in daily life' 
   G15L1_14= 'g15l1_14 suffering from parkinson''s disease?' 
   G15L2_14= 'g15l2_14 diagnosed by hospital?' 
   G15L3_14= 'g15l3_14 disability in daily life' 
   G15M1_14= 'g15m1_14 suffering from bedsore?' 
   G15M2_14= 'g15m2_14 diagnosed by hospital?' 
   G15M3_14= 'g15m3_14 disability in daily life' 
   G15N1_14= 'g15n1_14 suffering from arthritis?' 
   G15N2_14= 'g15n2_14 diagnosed by hospital?' 
   G15N3_14= 'g15n3_14 disability in daily life' 
   G15O1_14= 'g15o1_14 suffering from dementia?' 
   G15O2_14= 'g15o2_14 diagnosed by hospital?' 
   G15O3_14= 'g15o3_14 disability in daily life' 
   G15P1_14= 'g15p1_14 suffering from epilepsy?' 
   G15P2_14= 'g15p2_14 diagnosed by hospital?' 
   G15P3_14= 'g15p3_14 disability in daily life' 
   G15Q1_14= 'g15q1_14 suffering from cholecystitis, cholelith disease?' 
   G15Q2_14= 'g15q2_14 diagnosed by hospital?' 
   G15Q3_14= 'g15q3_14 disability in daily life' 
   G15R1_14= 'g15r1_14 suffering from blood disease?' 
   G15R2_14= 'g15r2_14 diagnosed by hospital?' 
   G15R3_14= 'g15r3_14 disability in daily life' 
   G15N1A_14= 'g15n1a_14 suffering from rheumatism or rheumatoid disease?' 
   G15N2A_14= 'g15n2a_14 diagnosed by hospital?' 
   G15N3A_14= 'g15n3a_14 disability in daily life' 
   G15S1_14= 'g15s1_14 suffering from chronic nephritis?' 
   G15S2_14= 'g15s2_14 diagnosed by hospital?' 
   G15S3_14= 'g15s3_14 disability in daily life' 
   G15T1_14= 'g15t1_14 suffering from galactophore disease?' 
   G15T2_14= 'g15t2_14 diagnosed by hospital?' 
   G15T3_14= 'g15t3_14 disability in daily life' 
   G15U1_14= 'g15u1_14 suffering from uterine tumor?' 
   G15U2_14= 'g15u2_14 diagnosed by hospital?' 
   G15U3_14= 'g15u3_14 disability in daily life' 
   G15J1A_14= 'g15j1a_14 suffering from hyperplasia of prostate gland?' 
   G15J2A_14= 'g15j2a_14 diagnosed by hospital?' 
   G15J3A_14= 'g15j3a_14 disability in daily life' 
   G15V1_14= 'g15v1_14 suffering from hepatitis?' 
   G15V2_14= 'g15v2_14 diagnosed by hospital?' 
   G15V3_14= 'g15v3_14 disability in daily life' 
   G15Y1_14= 'g15y1_14 other diseases beyond g15a-g15v?' 
   G15Y2_14= 'g15y2_14 diagnosed by hospital?' 
   G15Y3_14= 'g15y3_14 disability in daily life' 
   G15YT_14= 'other disease specified in g15y' 
   H1_14   = 'h1_14 was interviewee able to hear?' 
   H21_14  = 'h21_14 did interviewee able to participate in physical check?' 
   H22_14  = 'h22_14 the reason for inability to participate in physical check' 
   H3_14   = 'h3_14 the health of interviewee rated by interviewer' 
   H5_14   = 'h5_14 confirm the age and copy to the 1st page' 
   H6_14   = 'h6_14 has interviewer checked for failure to ask a question?' 
   H7_14   = 'h7_14 did anyone help the interviewee to answer question' 
   H71_14  = 'h71_14 who helped the interviewee to answer questions?' 
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
   D11MEDICA= 'got timely medication prior to death' 
   D11FINANC= 'main financial source prior to death' 
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
         A51_14 a51fffff. A52 a52fffff. A52_14 a52fffff.
         A530 a530ffff. A530_14 a530ffff. A531 a531ffff.
         A531_14 a531ffff. A532 a532ffff. A532_14 a532ffff.
         A533 a533ffff. A533_14 a533ffff. A534 a534ffff.
         A534_14 a534ffff. A535 a535ffff. A535_14 a535ffff.
         A536 a535ffff. A536_14 a535ffff. A537 a537ffff.
         A537_14 a537ffff. A53A1 a53a1fff. A53A1_14 a53a1fff.
         A53A2 a53a2fff. A53A2_14 a53a2fff. A53A3 a53a3fff.
         A53A3_14 a53a3fff. A53A4 a53a4fff. A53A4_14 a53a4fff.
         A53A5 a53a5fff. A53A5_14 a53a5fff. A53B1 a53a1fff.
         A53B1_14 a53a1fff. A53B2 a53a2fff. A53B2_14 a53a2fff.
         A53B3 a53a3fff. A53B3_14 a53a3fff. A53B4 a53a4fff.
         A53B4_14 a53a4fff. A53B5 a53a5fff. A53B5_14 a53a5fff.
         A53C1 a53a1fff. A53C1_14 a53a1fff. A53C2 a53a2fff.
         A53C2_14 a53a2fff. A53C3 a53a3fff. A53C3_14 a53a3fff.
         A53C4 a53a4fff. A53C4_14 a53a4fff. A53C5 a53a5fff.
         A53C5_14 a53a5fff. A53D1 a53a1fff. A53D1_14 a53a1fff.
         A53D2 a53a2fff. A53D2_14 a53a2fff. A53D3 a53a3fff.
         A53D3_14 a53a3fff. A53D4 a53a4fff. A53D4_14 a53a4fff.
         A53D5 a53a5fff. A53D5_14 a53a5fff. A53E1 a53a1fff.
         A53E1_14 a53a1fff. A53E2 a53a2fff. A53E2_14 a53a2fff.
         A53E3 a53a3fff. A53E3_14 a53a3fff. A53E4 a53a4fff.
         A53E4_14 a53a4fff. A53E5 a53a5fff. A53E5_14 a53a5fff.
         A53F1 a53a1fff. A53F1_14 a53a1fff. A53F2 a53a2fff.
         A53F2_14 a53a2fff. A53F3 a53a3fff. A53F3_14 a53a3fff.
         A53F4 a53a4fff. A53F4_14 a53a4fff. A53F5 a53a5fff.
         A53F5_14 a53a5fff. A53G1 a53a1fff. A53G1_14 a53a1fff.
         A53G2 a53a2fff. A53G2_14 a53a2fff. A53G3 a53a3fff.
         A53G3_14 a53a3fff. A53G4 a53a4fff. A53G4_14 a53a4fff.
         A53G5 a53a5fff. A53G5_14 a53a5fff. A53H1 a53a1fff.
         A53H1_14 a53a1fff. A53H2 a53a2fff. A53H2_14 a53a2fff.
         A53H3 a53a3fff. A53H3_14 a53a3fff. A53H4 a53a4fff.
         A53H4_14 a53a4fff. A53H5 a53a5fff. A53H5_14 a53a5fff.
         A53I1 a53a1fff. A53I1_14 a53a1fff. A53I2 a53a2fff.
         A53I2_14 a53a2fff. A53I3 a53a3fff. A53I3_14 a53a3fff.
         A53I4 a53a4fff. A53I4_14 a53a4fff. A53I5 a53a5fff.
         A53I5_14 a53a5fff. A53J1 a53a1fff. A53J1_14 a53a1fff.
         A53J2 a53a2fff. A53J2_14 a53a2fff. A53J3 a53a3fff.
         A53J3_14 a53a3fff. A53J4 a53a4fff. A53J4_14 a53a4fff.
         A53J5 a53a5fff. A53J5_14 a53a5fff. A540 a540ffff.
         A540_14 a540ffff. A541 a541ffff. A541_14 a541ffff.
         A542 a542ffff. A542_14 a542ffff. A54A a54affff.
         A54A_14 a54affff. A54B a54bffff. A54B_14 a54bffff.
         B11 b11fffff. B11_14 b11fffff. B12 b11fffff.
         B121 b121ffff. B121_14 b121ffff. B12_14 b11fffff.
         B21 b21fffff. B210 b210ffff. B210_14 b210ffff.
         B21_14 b21fffff. B22 b21fffff. B22_14 b21fffff.
         B23 b21fffff. B23_14 b21fffff. B24 b21fffff.
         B24_14 b21fffff. B25 b21fffff. B25_14 b21fffff.
         B26 b21fffff. B26_14 b21fffff. B27 b21fffff.
         B27_14 b21fffff. B28 b28fffff. B28_14 b28fffff.
         B29 b28fffff. B29_14 b28fffff. C11 c11fffff.
         C11_14 c11fffff. C12 c11fffff. C12_14 c11fffff.
         C13 c11fffff. C13_14 c11fffff. C14 c11fffff.
         C14_14 c11fffff. C15 c11fffff. C15_14 c11fffff.
         C16 c16fffff. C16_14 c16fffff. C21A c11fffff.
         C21A_14 c11fffff. C21B c11fffff. C21B_14 c11fffff.
         C21C c11fffff. C21C_14 c11fffff. C22 c22fffff.
         C22_14 c22fffff. C31A c11fffff. C31A_14 c11fffff.
         C31B c11fffff. C31B_14 c11fffff. C31C c11fffff.
         C31C_14 c11fffff. C31D c31dffff. C31D_14 c31dffff.
         C31E c11fffff. C31E_14 c11fffff. C32 c11fffff.
         C32_14 c11fffff. C41A c11fffff. C41A_14 c11fffff.
         C41B c11fffff. C41B_14 c11fffff. C41C c11fffff.
         C41C_14 c11fffff. C51A c11fffff. C51A_14 c11fffff.
         C51B c11fffff. C51B_14 c11fffff. C52 c11fffff.
         C52X1 c11fffff. C52X2 c11fffff. C52_14 c11fffff.
         C53A c53affff. C53A_14 c53affff. C53B c53affff.
         C53B_14 c53affff. C53C c53affff. C53C_14 c53affff.
         C54 c54fffff. C54_14 c54fffff. C55 c55fffff.
         C55_14 c55fffff. D1 d1ffffff. D101 d91fffff.
         D101_14 d91fffff. D102 a53a2fff. D102_14 a53a2fff.
         D103 a53a2fff. D103_14 a53a2fff. D11A d11affff.
         D11A_14 d11affff. D11B d11affff. D11B_14 d11affff.
         D11C d11cffff. D11C_14 d11cffff. D11D d11affff.
         D11D_14 d11affff. D11E d11affff. D11E_14 d11affff.
         D11F d11cffff. D11FINANC d11finaf. D11F_14 d11cffff.
         D11G d11affff. D11G_14 d11affff. D11H d11cffff.
         D11H_14 d11cffff. D11MEDICA d11medif. D12 a54bffff.
         D12_14 a54bffff. D14A533 d14a533f. D14A535 d14a535f.
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
         D14WASHMA d14tapwf. D14WCFACI d14wcfaf. D1_14 d1ffffff.
         D2 a54bffff. D31 d31fffff. D31_14 d31fffff.
         D32 d32fffff. D32_14 d32fffff. D33 d33fffff.
         D33_14 d33fffff. D34 d34fffff. D34_14 d34fffff.
         D4ALGA1 d4meat2f. D4ALGA1_14 d4meat2f. D4ALGA2 d4meat2f.
         D4ALGA2_14 d4meat2f. D4A_14 d4a_14ff. D4BEAN1 d4meat2f.
         D4BEAN1_14 d4meat2f. D4BEAN2 d4meat2f. D4BEAN2_14 d4meat2f.
         D4B_14 d4b_14ff. D4DRUG1 d4drug1f. D4DRUG1_14 d4drug1f.
         D4DRUG2 d4drug1f. D4DRUG2_14 d4drug1f. D4EGG1 d4meat2f.
         D4EGG1_14 d4meat2f. D4EGG2 d4meat2f. D4EGG2_14 d4meat2f.
         D4FISH1 d4meat2f. D4FISH1_14 d4meat2f. D4FISH2 d4meat2f.
         D4FISH2_14 d4meat2f. D4GARL1 d4meat2f. D4GARL1_14 d4meat2f.
         D4GARL2 d4meat2f. D4GARL2_14 d4meat2f. D4MEAT1 d4meat2f.
         D4MEAT1_14 d4meat2f. D4MEAT2 d4meat2f. D4MEAT2_14 d4meat2f.
         D4MILK1 d4meat2f. D4MILK1_14 d4meat2f. D4MILK2 d4meat2f.
         D4MILK2_14 d4meat2f. D4NUT1 d4meat2f. D4NUT1_14 d4meat2f.
         D4NUT2 d4meat2f. D4NUT2_14 d4meat2f. D4SUGA1 d4meat2f.
         D4SUGA1_14 d4meat2f. D4SUGA2 d4meat2f. D4SUGA2_14 d4meat2f.
         D4TEA1 d4meat2f. D4TEA1_14 d4meat2f. D4TEA2 d4meat2f.
         D4TEA2_14 d4meat2f. D4VEG1 d4meat2f. D4VEG1_14 d4meat2f.
         D4VEG2 d4meat2f. D4VEG2_14 d4meat2f. D4VIT1 d4meat2f.
         D4VIT1_14 d4meat2f. D4VIT2 d4meat2f. D4VIT2_14 d4meat2f.
         D5 d5ffffff. D5_14 d5ffffff. D6A d6afffff.
         D6A_14 d6afffff. D6B d6afffff. D6B_14 d6afffff.
         D6C d6afffff. D6C_14 d6afffff. D71 d71fffff.
         D710 a535ffff. D710A a52fffff. D710A_14 a52fffff.
         D710B a52fffff. D710B_14 a52fffff. D710_14 a535ffff.
         D71_14 d71fffff. D72 d71fffff. D72_14 d71fffff.
         D73 a53a2fff. D73_14 a53a2fff. D74 a53a2fff.
         D74_14 a53a2fff. D75 a53a5fff. D75_14 a53a5fff.
         D76 d76fffff. D76_14 d76fffff. D77 d77fffff.
         D77_14 d77fffff. D78 a535ffff. D78A a52fffff.
         D78A_14 a52fffff. D78B a52fffff. D78B_14 a52fffff.
         D78_14 a535ffff. D79 a535ffff. D79A a52fffff.
         D79A_14 a52fffff. D79B a52fffff. D79B_14 a52fffff.
         D79_14 a535ffff. D81 a535ffff. D81_14 a535ffff.
         D82 a535ffff. D82_14 a535ffff. D83 a53a2fff.
         D83_14 a53a2fff. D84 a53a2fff. D84_14 a53a2fff.
         D85 d85fffff. D85_14 d85fffff. D86 a53a5fff.
         D86_14 a53a5fff. D87 a535ffff. D87_14 a535ffff.
         D91 d91fffff. D91_14 d91fffff. D92 d91fffff.
         D92_14 d91fffff. D93 a53a2fff. D93_14 a53a2fff.
         D94 a53a2fff. D94_14 a53a2fff. DAYIN monthinf.
         DTH11_14 dth11_1f. E0 e0ffffff. E0_14 e0ffffff.
         E1 e1ffffff. E10 e7ffffff. E10_14 e7ffffff.
         E11 e7ffffff. E11_14 e7ffffff. E12 e12fffff.
         E12_14 e12fffff. E13 e7ffffff. E13_14 e7ffffff.
         E14 e12fffff. E14_14 e12fffff. E1B e1bfffff.
         E1B_14 e1bfffff. E1_14 e1ffffff. E2 e2ffffff.
         E2B e1bfffff. E2B_14 e1bfffff. E2_14 e2ffffff.
         E3 e3ffffff. E3B e1bfffff. E3B_14 e1bfffff.
         E3_14 e3ffffff. E4 e4ffffff. E4B e1bfffff.
         E4B_14 e1bfffff. E4_14 e4ffffff. E5 e5ffffff.
         E5B e1bfffff. E5B_14 e1bfffff. E5_14 e5ffffff.
         E6 e6ffffff. E610 e610ffff. E610_14 e610ffff.
         E62 e62fffff. E62_14 e62fffff. E63 e63fffff.
         E63_14 e63fffff. E64 e64fffff. E64_14 e64fffff.
         E65 e65fffff. E65_14 e65fffff. E67 e67fffff.
         E67_14 e67fffff. E6B e6bfffff. E6B_14 e6bfffff.
         E6_14 e6ffffff. E7 e7ffffff. E7_14 e7ffffff.
         E8 e7ffffff. E8_14 e7ffffff. E9 e7ffffff.
         E9_14 e7ffffff. F1 a54bffff. F10 a54bffff.
         F101 a53a5fff. F101_14 a53a5fff. F102 a53a5fff.
         F102_14 a53a5fff. F103 a54bffff. F1030 f41a12ff.
         F1030A a535ffff. F1030B1 f901b1ff. F1030B2 f901b1ff.
         F1030B3 f901b1ff. F1031 f41a12ff. F1031A a535ffff.
         F1031B1 f901b1ff. F1031B2 f901b1ff. F1031B3 f901b1ff.
         F1032 f1032fff. F1033 f1033fff. F103A1 a53a3fff.
         F103A1_14 a53a3fff. F103A2 f103a2ff. F103A2_14 f103a2ff.
         F103A3 a53a2fff. F103A3_14 a53a2fff. F103A4 f92a3fff.
         F103A4_14 f92a3fff. F103A5 f103a5ff. F103A5_14 f103a5ff.
         F103A7 f92a3fff. F103A7_14 f92a3fff. F103A8 f92a3fff.
         F103A8_14 f92a3fff. F103B1 a53a3fff. F103B1_14 a53a3fff.
         F103B2 f103a2ff. F103B2_14 f103a2ff. F103B3 a53a2fff.
         F103B3_14 a53a2fff. F103B4 f92a3fff. F103B4_14 f92a3fff.
         F103B5 f103a5ff. F103B5_14 f103a5ff. F103B7 f92a3fff.
         F103B7_14 f92a3fff. F103B8 f92a3fff. F103B8_14 f92a3fff.
         F103C1 a53a3fff. F103C1_14 a53a3fff. F103C2 f103a2ff.
         F103C2_14 f103a2ff. F103C3 a53a2fff. F103C3_14 a53a2fff.
         F103C4 f92a3fff. F103C4_14 f92a3fff. F103C5 f103a5ff.
         F103C5_14 f103a5ff. F103C7 f92a3fff. F103C7_14 f92a3fff.
         F103C8 f92a3fff. F103C8_14 f92a3fff. F103D1 a53a3fff.
         F103D1_14 a53a3fff. F103D2 f103a2ff. F103D2_14 f103a2ff.
         F103D3 a53a2fff. F103D3_14 a53a2fff. F103D4 f92a3fff.
         F103D4_14 f92a3fff. F103D5 f103a5ff. F103D5_14 f103a5ff.
         F103D7 f92a3fff. F103D7_14 f92a3fff. F103D8 f92a3fff.
         F103D8_14 f92a3fff. F103E1 a53a3fff. F103E1_14 a53a3fff.
         F103E2 f103a2ff. F103E2_14 f103a2ff. F103E3 a53a2fff.
         F103E3_14 a53a2fff. F103E4 f92a3fff. F103E4_14 f92a3fff.
         F103E5 f103a5ff. F103E5_14 f103a5ff. F103E7 f92a3fff.
         F103E7_14 f92a3fff. F103E8 f92a3fff. F103E8_14 f92a3fff.
         F103F1 a53a3fff. F103F1_14 a53a3fff. F103F2 f103a2ff.
         F103F2_14 f103a2ff. F103F3 a53a2fff. F103F3_14 a53a2fff.
         F103F4 f92a3fff. F103F4_14 f92a3fff. F103F5 f103a5ff.
         F103F5_14 f103a5ff. F103F7 f92a3fff. F103F7_14 f92a3fff.
         F103F8 f92a3fff. F103F8_14 f92a3fff. F103G1 a53a3fff.
         F103G1_14 a53a3fff. F103G2 f103a2ff. F103G2_14 f103a2ff.
         F103G3 a53a2fff. F103G3_14 a53a2fff. F103G4 f92a3fff.
         F103G4_14 f92a3fff. F103G5 f103a5ff. F103G5_14 f103a5ff.
         F103G7 f92a3fff. F103G7_14 f92a3fff. F103G8 f92a3fff.
         F103G8_14 f92a3fff. F103H1 a53a3fff. F103H1_14 a53a3fff.
         F103H2 f103a2ff. F103H2_14 f103a2ff. F103H3 a53a2fff.
         F103H3_14 a53a2fff. F103H4 f92a3fff. F103H4_14 f92a3fff.
         F103H5 f103a5ff. F103H5_14 f103a5ff. F103H7 f92a3fff.
         F103H7_14 f92a3fff. F103H8 f92a3fff. F103H8_14 f92a3fff.
         F103I1 a53a3fff. F103I1_14 a53a3fff. F103I2 f103a2ff.
         F103I2_14 f103a2ff. F103I3 a53a2fff. F103I3_14 a53a2fff.
         F103I4 f92a3fff. F103I4_14 f92a3fff. F103I5 f103a5ff.
         F103I5_14 f103a5ff. F103I7 f92a3fff. F103I7_14 f92a3fff.
         F103I8 f92a3fff. F103I8_14 f92a3fff. F103J1 a53a3fff.
         F103J1_14 a53a3fff. F103J2 f103a2ff. F103J2_14 f103a2ff.
         F103J3 a53a2fff. F103J3_14 a53a2fff. F103J4 f92a3fff.
         F103J4_14 f92a3fff. F103J5 f103a5ff. F103J5_14 f103a5ff.
         F103J7 f92a3fff. F103J7_14 f92a3fff. F103J8 f92a3fff.
         F103J8_14 f92a3fff. F103K1 a53a3fff. F103K1_14 a53a3fff.
         F103K2 f103a2ff. F103K2_14 f103a2ff. F103K3 a53a2fff.
         F103K3_14 a53a2fff. F103K4 f92a3fff. F103K4_14 f92a3fff.
         F103K5 f103a5ff. F103K5_14 f103a5ff. F103K7 f92a3fff.
         F103K7_14 f92a3fff. F103K8 f92a3fff. F103K8_14 f92a3fff.
         F103L1 a53a3fff. F103L1_14 a53a3fff. F103L2 f103a2ff.
         F103L2_14 f103a2ff. F103L3 a53a2fff. F103L3_14 a53a2fff.
         F103L4 f92a3fff. F103L4_14 f92a3fff. F103L5 f103a5ff.
         F103L5_14 f103a5ff. F103L7 f92a3fff. F103L7_14 f92a3fff.
         F103L8 f92a3fff. F103L8_14 f92a3fff. F103M1 a53a3fff.
         F103M1_14 a53a3fff. F103M2 f103a2ff. F103M2_14 f103a2ff.
         F103M3 a53a2fff. F103M3_14 a53a2fff. F103M4 f92a3fff.
         F103M4_14 f92a3fff. F103M5 f103a5ff. F103M5_14 f103a5ff.
         F103M7 f92a3fff. F103M7_14 f92a3fff. F103M8 f92a3fff.
         F103M8_14 f92a3fff. F104_14 f901b1ff. F105_14 f901b1ff.
         F10A a53a5fff. F10A_14 a53a5fff. F10_14 a54bffff.
         F111A f111afff. F111A_14 f111afff. F111B f111afff.
         F111B_14 f111afff. F111C f111afff. F111C_14 f111afff.
         F112A f111afff. F112A_14 f111afff. F112B f111afff.
         F112B_14 f111afff. F112C f111afff. F112C_14 f111afff.
         F113A f111afff. F113A_14 f111afff. F113B f111afff.
         F113B_14 f111afff. F113C f111afff. F113C_14 f111afff.
         F12A f12affff. F12A_14 f12affff. F12B f12affff.
         F12B_14 f12affff. F12C f12affff. F12C_14 f12affff.
         F13A f12affff. F13A_14 f12affff. F13B f12affff.
         F13B_14 f12affff. F13C f12affff. F13C_14 f12affff.
         F141 f141ffff. F141_14 f141ffff. F142 f141ffff.
         F142_14 f141ffff. F143 f141ffff. F143_14 f141ffff.
         F144 f141ffff. F144_14 f141ffff. F145 f141ffff.
         F145_14 f141ffff. F146 f141ffff. F146_14 f141ffff.
         F147 f141ffff. F147_14 f141ffff. F148 f141ffff.
         F148_14 f141ffff. F149 f141ffff. F149_14 f141ffff.
         F151 b28fffff. F151_14 b28fffff. F152 b28fffff.
         F152_14 b28fffff. F153 b28fffff. F153_14 b28fffff.
         F154 b28fffff. F154_14 b28fffff. F155 b28fffff.
         F155_14 b28fffff. F156 b28fffff. F156_14 b28fffff.
         F157 b28fffff. F157_14 b28fffff. F158 b28fffff.
         F158_14 b28fffff. F159 b28fffff. F159_14 b28fffff.
         F16 f16fffff. F16_14 f16fffff. F1_14 a54bffff.
         F2 f2ffffff. F21 f21fffff. F211 f211ffff.
         F211_14 f211ffff. F21_14 f21fffff. F22 f22fffff.
         F221 f221ffff. F221_14 f221ffff. F22_14 f22fffff.
         F23 a532ffff. F23_14 a532ffff. F24 a535ffff.
         F24_14 a535ffff. F251 f251ffff. F252 f251ffff.
         F25A1_14 f251ffff. F25A2_14 f251ffff. F25B1 f25b1fff.
         F25B1_14 f25b1fff. F25B2 a52fffff. F25B2_14 a52fffff.
         F26 f25b1fff. F26_14 f26_14ff. F27 f27fffff.
         F27_14 f27fffff. F2_14 f2ffffff. F31 f31fffff.
         F31_14 f31fffff. F32A f32affff. F32A_14 f32affff.
         F32B f32affff. F32B_14 f32affff. F32C f32affff.
         F32C_14 f32affff. F32D f32affff. F32D_14 f32affff.
         F32E f32affff. F32E_14 f32affff. F33 a532ffff.
         F33_14 a532ffff. F34 f34fffff. F340 f340ffff.
         F340_14 f340ffff. F34_14 f34fffff. F35 f35fffff.
         F35_14 f35fffff. F41 f41fffff. F41A1 a535ffff.
         F41A11 a534ffff. F41A11_14 a534ffff. F41A12 f41a12ff.
         F41A12_14 f41a12ff. F41A1_14 a535ffff. F41A2 a535ffff.
         F41A21 a534ffff. F41A21_14 a534ffff. F41A22 f41a12ff.
         F41A22_14 f41a12ff. F41A2_14 a535ffff. F41A3 a535ffff.
         F41A31 a534ffff. F41A31_14 a534ffff. F41A32 f41a12ff.
         F41A32_14 f41a12ff. F41A3_14 a535ffff. F41B a535ffff.
         F41B1 a534ffff. F41B1_14 a534ffff. F41B2 f41a12ff.
         F41B2_14 f41a12ff. F41B_14 a535ffff. F41_14 f41fffff.
         F42 a53a5fff. F42_14 a53a5fff. F43A1 a53a2fff.
         F43A1_14 a53a2fff. F43A2 f43a2fff. F43A2_14 f43a2fff.
         F43A3 a53a2fff. F43A3_14 a53a2fff. F43A4 f43a4fff.
         F43A4_14 f43a4fff. F43B1 a53a2fff. F43B1_14 a53a2fff.
         F43B2 f43a2fff. F43B2_14 f43a2fff. F43B3 a53a2fff.
         F43B3_14 a53a2fff. F43B4 f43a4fff. F43B4_14 f43a4fff.
         F43C1 a53a2fff. F43C1_14 a53a2fff. F43C2 f43a2fff.
         F43C2_14 f43a2fff. F43C3 a53a2fff. F43C3_14 a53a2fff.
         F43C4 f43a4fff. F43C4_14 f43a4fff. F43D1 a53a2fff.
         F43D1_14 a53a2fff. F43D2 f43a2fff. F43D2_14 f43a2fff.
         F43D3 a53a2fff. F43D3_14 a53a2fff. F43D4 f43a4fff.
         F43D4_14 f43a4fff. F44 a53a5fff. F44_14 a53a5fff.
         F45 f45fffff. F45_14 f45fffff. F46 f46fffff.
         F46_14 f46fffff. F47 f47fffff. F47_14 f47fffff.
         F5 f5ffffff. F5_11_14 f5ffffff. F61 a535ffff.
         F610 f610ffff. F610_14 f610ffff. F61_14 a535ffff.
         F62 f62fffff. F62_14 f62fffff. F63 f62fffff.
         F63_14 f62fffff. F64A f64affff. F64A_14 f64affff.
         F64B f64affff. F64B_14 f64affff. F64C f64affff.
         F64C_14 f64affff. F64D f64affff. F64D_14 f64affff.
         F64E1 f64affff. F64E_14 f64affff. F64F1 f64affff.
         F64F_14 f64affff. F64G1 f64affff. F64G_14 f64affff.
         F64H1 f64affff. F64H_14 f64affff. F64I f64affff.
         F64I_14 f64affff. F651A1 f35fffff. F651A1_14 f35fffff.
         F651A2 f35fffff. F651A2_14 f35fffff. F651B1 f35fffff.
         F651B1_14 f35fffff. F651B2 f35fffff. F651B2_14 f35fffff.
         F6521 f6521fff. F6521_14 f6521fff. F652B a535ffff.
         F652B_14 a535ffff. F66 d91fffff. F66_14 d91fffff.
         F71 d91fffff. F71_14 d91fffff. F721 a53a2fff.
         F721_14 a53a2fff. F722 a53a2fff. F722A d91fffff.
         F722_14 a53a2fff. F73 a53a2fff. F73_14 a53a2fff.
         F74 a54bffff. F74_14 a54bffff. F81 d91fffff.
         F81_14 d91fffff. F821 a53a2fff. F821_14 a53a2fff.
         F822 a53a2fff. F822A d91fffff. F822_14 a53a2fff.
         F83 a53a2fff. F83_14 a53a2fff. F84 f84fffff.
         F84_14 f84fffff. F85 f84fffff. F85_14 f84fffff.
         F86 a54bffff. F86_14 a54bffff. F9 a54bffff.
         F901 f41a12ff. F901A a535ffff. F901B1 f901b1ff.
         F901B2 f901b1ff. F901B3 f901b1ff. F902 f41a12ff.
         F902A a535ffff. F902B1 f901b1ff. F902B2 f901b1ff.
         F902B3 f901b1ff. F91 a54bffff. F91_14 a54bffff.
         F92A1 a53a5fff. F92A1_14 a53a5fff. F92A2 a53a3fff.
         F92A2_14 a53a3fff. F92A3 f92a3fff. F92A3_14 f92a3fff.
         F92A4 a53a2fff. F92A4_14 a53a2fff. F92A5 f92a5fff.
         F92A5_14 f92a5fff. F92A6 f92a3fff. F92A6_14 f92a3fff.
         F92A7 f92a3fff. F92A7_14 f92a3fff. F92B1 a53a5fff.
         F92B1_14 a53a5fff. F92B2 a53a3fff. F92B2_14 a53a3fff.
         F92B3 f92a3fff. F92B3_14 f92a3fff. F92B4 a53a2fff.
         F92B4_14 a53a2fff. F92B5 f92a5fff. F92B5_14 f92a5fff.
         F92B6 f92a3fff. F92B6_14 f92a3fff. F92B7 f92a3fff.
         F92B7_14 f92a3fff. F92C1 a53a5fff. F92C1_14 a53a5fff.
         F92C2 a53a3fff. F92C2_14 a53a3fff. F92C3 f92a3fff.
         F92C3_14 f92a3fff. F92C4 a53a2fff. F92C4_14 a53a2fff.
         F92C5 f92a5fff. F92C5_14 f92a5fff. F92C6 f92a3fff.
         F92C6_14 f92a3fff. F92C7 f92a3fff. F92C7_14 f92a3fff.
         F92D1 a53a5fff. F92D1_14 a53a5fff. F92D2 a53a3fff.
         F92D2_14 a53a3fff. F92D3 f92a3fff. F92D3_14 f92a3fff.
         F92D4 a53a2fff. F92D4_14 a53a2fff. F92D5 f92a5fff.
         F92D5_14 f92a5fff. F92D6 f92a3fff. F92D6_14 f92a3fff.
         F92D7 f92a3fff. F92D7_14 f92a3fff. F92E1 a53a5fff.
         F92E1_14 a53a5fff. F92E2 a53a3fff. F92E2_14 a53a3fff.
         F92E3 f92a3fff. F92E3_14 f92a3fff. F92E4 a53a2fff.
         F92E4_14 a53a2fff. F92E5 f92a5fff. F92E5_14 f92a5fff.
         F92E6 f92a3fff. F92E6_14 f92a3fff. F92E7 f92a3fff.
         F92E7_14 f92a3fff. F92F1 a53a5fff. F92F1_14 a53a5fff.
         F92F2 a53a3fff. F92F2_14 a53a3fff. F92F3 f92a3fff.
         F92F3_14 f92a3fff. F92F4 a53a2fff. F92F4_14 a53a2fff.
         F92F5 f92a5fff. F92F5_14 f92a5fff. F92F6 f92a3fff.
         F92F6_14 f92a3fff. F92F7 f92a3fff. F92F7_14 f92a3fff.
         F92G1 a53a5fff. F92G1_14 a53a5fff. F92G2 a53a3fff.
         F92G2_14 a53a3fff. F92G3 f92a3fff. F92G3_14 f92a3fff.
         F92G4 a53a2fff. F92G4_14 a53a2fff. F92G5 f92a5fff.
         F92G5_14 f92a5fff. F92G6 f92a3fff. F92G6_14 f92a3fff.
         F92G7 f92a3fff. F92G7_14 f92a3fff. F92H1 a53a5fff.
         F92H1_14 a53a5fff. F92H2 a53a3fff. F92H2_14 a53a3fff.
         F92H3 f92a3fff. F92H3_14 f92a3fff. F92H4 a53a2fff.
         F92H4_14 a53a2fff. F92H5 f92a5fff. F92H5_14 f92a5fff.
         F92H6 f92a3fff. F92H6_14 f92a3fff. F92H7 f92a3fff.
         F92H7_14 f92a3fff. F92I1 a53a5fff. F92I1_14 a53a5fff.
         F92I2 a53a3fff. F92I2_14 a53a3fff. F92I3 f92a3fff.
         F92I3_14 f92a3fff. F92I4 a53a2fff. F92I4_14 a53a2fff.
         F92I5 f92a5fff. F92I5_14 f92a5fff. F92I6 f92a3fff.
         F92I6_14 f92a3fff. F92I7 f92a3fff. F92I7_14 f92a3fff.
         F92J1 a53a5fff. F92J1_14 a53a5fff. F92J2 a53a3fff.
         F92J2_14 a53a3fff. F92J3 f92a3fff. F92J3_14 f92a3fff.
         F92J4 a53a2fff. F92J4_14 a53a2fff. F92J5 f92a5fff.
         F92J5_14 f92a5fff. F92J6 f92a3fff. F92J6_14 f92a3fff.
         F92J7 f92a3fff. F92J7_14 f92a3fff. F9A a54bffff.
         G01 g01fffff. G01_14 g01fffff. G02 a54bffff.
         G02_14 a54bffff. G1 g1ffffff. G101 g101ffff.
         G1011 a54bffff. G1011_14 a54bffff. G101_14 g101ffff.
         G102 d91fffff. G1021 g101ffff. G1021_14 g101ffff.
         G102B g511ffff. G102C g102cfff. G102C_14 g102cfff.
         G102_14 d91fffff. G106 d91fffff. G1061 g1061fff.
         G1061_14 g1061fff. G1062 g1062fff. G1062_14 g1062fff.
         G1063 g1063fff. G1063_14 g1063fff. G106_14 d91fffff.
         G11 g11fffff. G11_14 g11fffff. G12 g12fffff.
         G122 a54bffff. G122_14 a54bffff. G123 a54bffff.
         G123_14 a54bffff. G12_14 g12fffff. G130 d91fffff.
         G130_14 d91fffff. G131 g131ffff. G131_14 g131ffff.
         G132 g132ffff. G132_14 g132ffff. G14A1 g14a1fff.
         G14A1_14 g14a1fff. G14A2 g14a2fff. G14A2_14 g14a2fff.
         G14B1 g14a1fff. G14B1_14 g14a1fff. G14B2 g14a2fff.
         G14B2_14 g14a2fff. G14C1 g14a1fff. G14C1_14 g14a1fff.
         G14C2 g14a2fff. G14C2_14 g14a2fff. G15A1 g15a1fff.
         G15A1_14 g15a1fff. G15A2 g15a1fff. G15A2_14 g15a1fff.
         G15A3 g15a3fff. G15A3_14 g15a3fff. G15B1 g15a1fff.
         G15B1_14 g15a1fff. G15B2 g15a1fff. G15B2_14 g15a1fff.
         G15B3 g15a3fff. G15B3_14 g15a3fff. G15C1 g15a1fff.
         G15C1_14 g15a1fff. G15C2 g15a1fff. G15C2_14 g15a1fff.
         G15C3 g15a3fff. G15C3_14 g15a3fff. G15D1 g15a1fff.
         G15D1_14 g15a1fff. G15D2 g15a1fff. G15D2_14 g15a1fff.
         G15D3 g15a3fff. G15D3_14 g15a3fff. G15E1 g15a1fff.
         G15E1_14 g15a1fff. G15E2 g15a1fff. G15E2_14 g15a1fff.
         G15E3 g15a3fff. G15E3_14 g15a3fff. G15F1 g15a1fff.
         G15F1_14 g15a1fff. G15F2 g15a1fff. G15F2_14 g15a1fff.
         G15F3 g15a3fff. G15F3_14 g15a3fff. G15G1 g15a1fff.
         G15G1_14 g15a1fff. G15G2 g15a1fff. G15G2_14 g15a1fff.
         G15G3 g15a3fff. G15G3_14 g15a3fff. G15H1 g15a1fff.
         G15H1_14 g15a1fff. G15H2 g15a1fff. G15H2_14 g15a1fff.
         G15H3 g15a3fff. G15H3_14 g15a3fff. G15I1 g15a1fff.
         G15I1_14 g15a1fff. G15I2 g15a1fff. G15I2_14 g15a1fff.
         G15I3 g15a3fff. G15I3_14 g15a3fff. G15J1 g15a1fff.
         G15J1A g15a1fff. G15J1A_14 g15a1fff. G15J1_14 g15a1fff.
         G15J2 g15a1fff. G15J2A g15a1fff. G15J2A_14 g15a1fff.
         G15J2_14 g15a1fff. G15J3 g15a3fff. G15J3A g15a3fff.
         G15J3A_14 g15a3fff. G15J3_14 g15a3fff. G15K1 g15a1fff.
         G15K1_14 g15a1fff. G15K2 g15a1fff. G15K2_14 g15a1fff.
         G15K3 g15a3fff. G15K3_14 g15a3fff. G15L1 g15a1fff.
         G15L1_14 g15a1fff. G15L2 g15a1fff. G15L2_14 g15a1fff.
         G15L3 g15a3fff. G15L3_14 g15a3fff. G15M1 g15a1fff.
         G15M1_14 g15a1fff. G15M2 g15a1fff. G15M2_14 g15a1fff.
         G15M3 g15a3fff. G15M3_14 g15a3fff. G15N1 g15a1fff.
         G15N1A g15a1fff. G15N1A_14 g15a1fff. G15N1_14 g15a1fff.
         G15N2 g15a1fff. G15N2A g15a1fff. G15N2A_14 g15a1fff.
         G15N2_14 g15a1fff. G15N3 g15a3fff. G15N3A g15a3fff.
         G15N3A_14 g15a3fff. G15N3_14 g15a3fff. G15O1 g15a1fff.
         G15O1_14 g15a1fff. G15O2 g15a1fff. G15O2_14 g15a1fff.
         G15O3 g15a3fff. G15O3_14 g15a3fff. G15P1 g15a1fff.
         G15P1_14 g15a1fff. G15P2 g15a1fff. G15P2_14 g15a1fff.
         G15P3 g15a3fff. G15P3_14 g15a3fff. G15Q1 g15a1fff.
         G15Q1_14 g15a1fff. G15Q2 g15a1fff. G15Q2_14 g15a1fff.
         G15Q3 g15a3fff. G15Q3_14 g15a3fff. G15R1 g15a1fff.
         G15R1_14 g15a1fff. G15R2 g15a1fff. G15R2_14 g15a1fff.
         G15R3 g15a3fff. G15R3_14 g15a3fff. G15S1 g15a1fff.
         G15S1_14 g15a1fff. G15S2 g15a1fff. G15S2_14 g15a1fff.
         G15S3 g15a3fff. G15S3_14 g15a3fff. G15T1 g15a1fff.
         G15T1_14 g15a1fff. G15T2 g15a1fff. G15T2_14 g15a1fff.
         G15T3 g15a3fff. G15T3_14 g15a3fff. G15U1 g15a1fff.
         G15U1_14 g15a1fff. G15U2 g15a1fff. G15U2_14 g15a1fff.
         G15U3 g15a3fff. G15U3_14 g15a3fff. G15V1 g15a1fff.
         G15V1_14 g15a1fff. G15V2 g15a1fff. G15V2_14 g15a1fff.
         G15V3 g15a3fff. G15V3_14 g15a3fff. G15Y2 g15a1fff.
         G15Y2_14 f26_14ff. G15Y3 g15a3fff. G15Y3_14 g15a3fff.
         G1_14 g1ffffff. G21 a54bffff. G21_14 a54bffff.
         G22 d91fffff. G22_14 d91fffff. G23 g23fffff.
         G23_14 g23fffff. G24 a535ffff. G24A f41a12ff.
         G24A_14 f41a12ff. G24_14 a535ffff. G25 a535ffff.
         G25A f41a12ff. G25A_14 f41a12ff. G25_14 a535ffff.
         G3 d91fffff. G3_14 d91fffff. G4 g4ffffff.
         G4A g4afffff. G4A_14 g4afffff. G4B g4bfffff.
         G4B_14 g4bfffff. G4_14 g4ffffff. G511 g511ffff.
         G511_14 g511ffff. G512 g511ffff. G512_14 g511ffff.
         G521 g511ffff. G521_14 g511ffff. G522 g511ffff.
         G522_14 g511ffff. G6 g6ffffff. G6_14 g6ffffff.
         G7 g511ffff. G7_14 g511ffff. G81 g81fffff.
         G81_14 g81fffff. G82 g81fffff. G82_14 g81fffff.
         G83 g81fffff. G83_14 g81fffff. G9 g9ffffff.
         G9_14 g9ffffff. H1 h1ffffff. H1_14 h1ffffff.
         H21 h21fffff. H21_14 h21fffff. H22 h22fffff.
         H22_14 h22fffff. H3 h3ffffff. H3_14 h3ffffff.
         H5 h5ffffff. H5_14 h5ffffff. H6 d71fffff.
         H6_14 d71fffff. H7 a535ffff. H71 h71fffff.
         H71_14 h71fffff. H7_14 a535ffff. JIGE a53a5fff.
         JIGE_14 a53a5fff. MONTHIN monthinf. PROV provffff.
         RA41 ra41ffff. RA41_14 ra41ffff. RA42 ra41ffff.
         RA42_14 ra41ffff. RA43 ra41ffff. RA43_14 ra41ffff.
         RA51 ra41ffff. RA51_14 ra41ffff. RA52 ra41ffff.
         RA52_14 ra41ffff. RA530 ra41ffff. RA530_14 ra41ffff.
         RA531 ra41ffff. RA531_14 ra41ffff. RA532 ra41ffff.
         RA532_14 ra41ffff. RA533 ra41ffff. RA533_14 ra41ffff.
         RA534 ra41ffff. RA534_14 ra41ffff. RA535 ra41ffff.
         RA535_14 ra41ffff. RA536 ra41ffff. RA536_14 ra41ffff.
         RA537 ra41ffff. RA537_14 ra41ffff. RA53A ra41ffff.
         RA53A_14 ra41ffff. RA53B ra41ffff. RA53B_14 ra41ffff.
         RA53C ra41ffff. RA53C_14 ra41ffff. RA53D ra41ffff.
         RA53D_14 ra41ffff. RA53E ra41ffff. RA53E_14 ra41ffff.
         RA53F ra41ffff. RA53F_14 ra41ffff. RA53G ra41ffff.
         RA53G_14 ra41ffff. RA53H ra41ffff. RA53H_14 ra41ffff.
         RA53I ra41ffff. RA53I_14 ra41ffff. RA53J ra41ffff.
         RA53J_14 ra41ffff. RA54 ra41ffff. RA540 ra41ffff.
         RA540_14 ra41ffff. RA541 ra41ffff. RA541_14 ra41ffff.
         RA542 ra41ffff. RA542_14 ra41ffff. RA54_14 ra41ffff.
         RD1 ra41ffff. RD101 ra41ffff. RD101_14 ra41ffff.
         RD102 ra41ffff. RD102_14 ra41ffff. RD103 ra41ffff.
         RD103_14 ra41ffff. RD11A ra41ffff. RD11A_14 ra41ffff.
         RD11B ra41ffff. RD11B_14 ra41ffff. RD11C ra41ffff.
         RD11C_14 ra41ffff. RD11D ra41ffff. RD11D_14 ra41ffff.
         RD11E ra41ffff. RD11E_14 ra41ffff. RD11F ra41ffff.
         RD11F_14 ra41ffff. RD11G ra41ffff. RD11G_14 ra41ffff.
         RD11H ra41ffff. RD11H_14 ra41ffff. RD12 ra41ffff.
         RD12_14 ra41ffff. RD1_14 ra41ffff. RD2 ra41ffff.
         RD2_14 ra41ffff. RD31 ra41ffff. RD31_14 ra41ffff.
         RD32 ra41ffff. RD32_14 ra41ffff. RD33 ra41ffff.
         RD33_14 ra41ffff. RD34 ra41ffff. RD34_14 ra41ffff.
         RD4ALGA ra41ffff. RD4ALGA_14 ra41ffff. RD4BEAN ra41ffff.
         RD4BEAN_14 ra41ffff. RD4DRUG ra41ffff. RD4DRUG_14 ra41ffff.
         RD4EGG ra41ffff. RD4EGG_14 ra41ffff. RD4FISH ra41ffff.
         RD4FISH_14 ra41ffff. RD4GARL ra41ffff. RD4GARL_14 ra41ffff.
         RD4MEAT ra41ffff. RD4MEAT_14 ra41ffff. RD4MILK_14 ra41ffff.
         RD4NUT ra41ffff. RD4NUT_14 ra41ffff. RD4SUGA ra41ffff.
         RD4SUGA_14 ra41ffff. RD4TEA ra41ffff. RD4TEA_14 ra41ffff.
         RD4VEG ra41ffff. RD4VEG_14 ra41ffff. RD4VIT ra41ffff.
         RD4VIT_14 ra41ffff. RD5 ra41ffff. RD5_14 ra41ffff.
         RD6 ra41ffff. RD6_14 ra41ffff. RD71 ra41ffff.
         RD710 ra41ffff. RD710_14 ra41ffff. RD71_14 ra41ffff.
         RD72 ra41ffff. RD72_14 ra41ffff. RD73 ra41ffff.
         RD73_14 ra41ffff. RD74 ra41ffff. RD74_14 ra41ffff.
         RD75 ra41ffff. RD75_14 ra41ffff. RD76 ra41ffff.
         RD76_14 ra41ffff. RD77 ra41ffff. RD77_14 ra41ffff.
         RD78 ra41ffff. RD78_14 ra41ffff. RD79 ra41ffff.
         RD79_14 ra41ffff. RD81 ra41ffff. RD81_14 ra41ffff.
         RD82 ra41ffff. RD82_14 ra41ffff. RD83 ra41ffff.
         RD83_14 ra41ffff. RD84 ra41ffff. RD84_14 ra41ffff.
         RD85 ra41ffff. RD85_14 ra41ffff. RD86 ra41ffff.
         RD86_14 ra41ffff. RD87 ra41ffff. RD87_14 ra41ffff.
         RD91 rd91ffff. RD91_14 rd91ffff. RD92 ra41ffff.
         RD92_14 ra41ffff. RD93 ra41ffff. RD93_14 ra41ffff.
         RD94 ra41ffff. RD94_14 ra41ffff. RDEMILK ra41ffff.
         RE0 ra41ffff. RE0_14 ra41ffff. RE1 ra41ffff.
         RE10 ra41ffff. RE10_14 ra41ffff. RE11 ra41ffff.
         RE11_14 ra41ffff. RE12 ra41ffff. RE12_14 ra41ffff.
         RE13 ra41ffff. RE13_14 ra41ffff. RE14 ra41ffff.
         RE14_14 ra41ffff. RE1B ra41ffff. RE1B_14 ra41ffff.
         RE1_14 re1_14ff. RE2 ra41ffff. RE2B ra41ffff.
         RE2B_14 ra41ffff. RE2_14 re1_14ff. RE3 ra41ffff.
         RE3B ra41ffff. RE3B_14 ra41ffff. RE3_14 re1_14ff.
         RE4 ra41ffff. RE4B ra41ffff. RE4B_14 ra41ffff.
         RE4_14 re1_14ff. RE5 ra41ffff. RE5B ra41ffff.
         RE5B_14 ra41ffff. RE5_14 re1_14ff. RE6 ra41ffff.
         RE610 ra41ffff. RE610_14 ra41ffff. RE62 ra41ffff.
         RE62_14 ra41ffff. RE63 ra41ffff. RE63_14 ra41ffff.
         RE64 ra41ffff. RE64_14 ra41ffff. RE65 ra41ffff.
         RE65_14 ra41ffff. RE67 ra41ffff. RE67_14 ra41ffff.
         RE6B ra41ffff. RE6B_14 ra41ffff. RE6_14 re1_14ff.
         RE7 ra41ffff. RE7_14 ra41ffff. RE8 ra41ffff.
         RE8_14 ra41ffff. RE9 ra41ffff. RE9_14 ra41ffff.
         RELATYPE relatypf. RESIDENC residenf. RESIDENC_14 residenf.
         RF1 ra41ffff. RF10 ra41ffff. RF101 ra41ffff.
         RF101_14 ra41ffff. RF102 ra41ffff. RF102_14 ra41ffff.
         RF1030 ra41ffff. RF1030A ra41ffff. RF1031 ra41ffff.
         RF1031A ra41ffff. RF1032 ra41ffff. RF1033 ra41ffff.
         RF103A ra41ffff. RF103A_14 ra41ffff. RF103B ra41ffff.
         RF103B_14 ra41ffff. RF103C ra41ffff. RF103C_14 ra41ffff.
         RF103D ra41ffff. RF103D_14 ra41ffff. RF103E ra41ffff.
         RF103E_14 ra41ffff. RF103F ra41ffff. RF103F_14 ra41ffff.
         RF103G ra41ffff. RF103G_14 ra41ffff. RF103H ra41ffff.
         RF103H_14 ra41ffff. RF103I ra41ffff. RF103I_14 ra41ffff.
         RF103J ra41ffff. RF103J_14 ra41ffff. RF103K ra41ffff.
         RF103K_14 ra41ffff. RF103L ra41ffff. RF103L_14 ra41ffff.
         RF103M ra41ffff. RF103M_14 ra41ffff. RF104_14 ra41ffff.
         RF105_14 ra41ffff. RF10_14 ra41ffff. RF12 ra41ffff.
         RF12_14 ra41ffff. RF13 ra41ffff. RF13_14 ra41ffff.
         RF14 ra41ffff. RF14_14 ra41ffff. RF15 ra41ffff.
         RF15_14 ra41ffff. RF1_14 ra41ffff. RF2 ra41ffff.
         RF21 ra41ffff. RF211 ra41ffff. RF211_14 ra41ffff.
         RF21_14 ra41ffff. RF22 ra41ffff. RF221 ra41ffff.
         RF221_14 ra41ffff. RF22_14 ra41ffff. RF23 ra41ffff.
         RF23_14 ra41ffff. RF24 ra41ffff. RF24_14 ra41ffff.
         RF25 ra41ffff. RF25A_14 ra41ffff. RF25B ra41ffff.
         RF25B_14 ra41ffff. RF26 ra41ffff. RF26_14 ra41ffff.
         RF27 ra41ffff. RF27_14 ra41ffff. RF2_14 ra41ffff.
         RF31 ra41ffff. RF31_14 ra41ffff. RF32 ra41ffff.
         RF32_14 ra41ffff. RF33 ra41ffff. RF33_14 ra41ffff.
         RF34 ra41ffff. RF340 ra41ffff. RF340_14 ra41ffff.
         RF34_14 ra41ffff. RF35 ra41ffff. RF35_14 ra41ffff.
         RF41 ra41ffff. RF41A ra41ffff. RF41A_14 ra41ffff.
         RF41B ra41ffff. RF41B_14 ra41ffff. RF41_14 ra41ffff.
         RF42 ra41ffff. RF42_14 ra41ffff. RF43A ra41ffff.
         RF43A_14 ra41ffff. RF43B ra41ffff. RF43B_14 ra41ffff.
         RF43C ra41ffff. RF43C_14 ra41ffff. RF43D ra41ffff.
         RF43D_14 ra41ffff. RF44 ra41ffff. RF44_14 ra41ffff.
         RF45 ra41ffff. RF45_14 ra41ffff. RF46 ra41ffff.
         RF46_14 ra41ffff. RF47 ra41ffff. RF47_14 ra41ffff.
         RF5 ra41ffff. RF5_14 ra41ffff. RF61 ra41ffff.
         RF610 ra41ffff. RF610_14 ra41ffff. RF61_14 ra41ffff.
         RF62 ra41ffff. RF62_14 ra41ffff. RF63 ra41ffff.
         RF63_14 ra41ffff. RF64 ra41ffff. RF64_14 ra41ffff.
         RF651A1 ra41ffff. RF651A1_14 ra41ffff. RF651A2 ra41ffff.
         RF651A2_14 ra41ffff. RF651B1 ra41ffff. RF651B1_14 ra41ffff.
         RF651B2 ra41ffff. RF651B2_14 ra41ffff. RF6521 ra41ffff.
         RF6521_14 ra41ffff. RF652A ra41ffff. RF652A_14 ra41ffff.
         RF652B ra41ffff. RF652B_14 ra41ffff. RF66 ra41ffff.
         RF66_14 ra41ffff. RF71 ra41ffff. RF71_14 ra41ffff.
         RF721 ra41ffff. RF721_14 ra41ffff. RF722 ra41ffff.
         RF722_14 ra41ffff. RF73 ra41ffff. RF73_14 ra41ffff.
         RF74 rd91ffff. RF74_14 rd91ffff. RF81 ra41ffff.
         RF81_14 ra41ffff. RF821 ra41ffff. RF821_14 ra41ffff.
         RF822 ra41ffff. RF822_14 ra41ffff. RF83 ra41ffff.
         RF83_14 ra41ffff. RF84 rd91ffff. RF84_14 rd91ffff.
         RF85 rd91ffff. RF85_14 rd91ffff. RF86 rd91ffff.
         RF86_14 rd91ffff. RF9 ra41ffff. RF901 ra41ffff.
         RF901A ra41ffff. RF902 ra41ffff. RF902A ra41ffff.
         RF91 ra41ffff. RF91_14 ra41ffff. RF92A ra41ffff.
         RF92A_14 ra41ffff. RF92B ra41ffff. RF92B_14 ra41ffff.
         RF92C ra41ffff. RF92C_14 ra41ffff. RF92D ra41ffff.
         RF92D_14 ra41ffff. RF92E ra41ffff. RF92E_14 ra41ffff.
         RF92F ra41ffff. RF92F_14 ra41ffff. RF92G ra41ffff.
         RF92G_14 ra41ffff. RF92H ra41ffff. RF92H_14 ra41ffff.
         RF92I ra41ffff. RF92I_14 ra41ffff. RF92J ra41ffff.
         RF92J_14 ra41ffff. RG01 ra41ffff. RG01_14 ra41ffff.
         RG02 ra41ffff. RG02_14 ra41ffff. RG1 ra41ffff.
         RG106 ra41ffff. RG1061 ra41ffff. RG1061_14 ra41ffff.
         RG1062 ra41ffff. RG1062_14 ra41ffff. RG1063 ra41ffff.
         RG1063_14 ra41ffff. RG106_14 ra41ffff. RG13 ra41ffff.
         RG130 ra41ffff. RG130_14 ra41ffff. RG13_14 ra41ffff.
         RG14A ra41ffff. RG14A_14 ra41ffff. RG14B ra41ffff.
         RG14B_14 ra41ffff. RG14C ra41ffff. RG14C_14 ra41ffff.
         RG1_14 ra41ffff. RG21 ra41ffff. RG21_14 ra41ffff.
         RG22 ra41ffff. RG22_14 ra41ffff. RG23 ra41ffff.
         RG23_14 ra41ffff. RG24 ra41ffff. RG24A ra41ffff.
         RG24A_14 ra41ffff. RG24_14 ra41ffff. RG25 ra41ffff.
         RG25A ra41ffff. RG25A_14 ra41ffff. RG25_14 ra41ffff.
         RG3 ra41ffff. RG3_14 ra41ffff. RG4 ra41ffff.
         RG4A ra41ffff. RG4A_14 ra41ffff. RG4B ra41ffff.
         RG4B_14 ra41ffff. RG4_14 ra41ffff. RG5 ra41ffff.
         RG5_14 ra41ffff. TYPE typeffff. V_BTHMON monthinf.
    ;
*/

RUN ;
