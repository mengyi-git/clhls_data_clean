/*-------------------------------------------------------------------------
 |                                                                         
 |                    SAS SETUP FILE FOR ICPSR 36692
 |         CHINESE LONGITUDINAL HEALTHY LONGEVITY SURVEY (CLHLS),
 |                               1998-2014
 |          (DATASET 0007: 2014 CROSS-SECTIONAL DATA, VERSION 1)
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
 | "c:\temp\36692-0007-data.txt").
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
VALUE a541ffff  -1='(-001) not applicable' 8888='(8888) don''t know'
                9998='(9998) more than 10000' 9999='(9999) missing';
VALUE a535ffff  1='(1) yes' 2='(2) no' 8='(8) do not know' 9='(9) missing';
VALUE f6521fff  1='(1) medical insurance for urban workers'
                2='(2) collective medical insurance for urban residents'
                3='(3) new rural cooperative medical insurance' 4='(4) commercial medical insurance'
                5='(5) self' 6='(6) spouse' 7='(7) children/grandchildren' 8='(8) no money to pay'
                9='(9) other';
VALUE c32fffff  0='(0) wrong' 1='(1) correct' 8='(8) can''t use pen to draw the figure'
                9='(9) not able to do this (disabled)';
VALUE c31dffff  0='(0) wrong' 1='(1) correct' 8='(8) unable to do' 9='(9) missing';
VALUE g01fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE f64affff  0='(0) no' 1='(1) yes' 8='(8) do not know' 9='(9) missing';
VALUE f25a1fff  -1='(-0001) not applicable' 88888='(88888) do not know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE g12fffff  88='(88) can''t turn around' 99='(99) missing';
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
VALUE b210ffff  1='(1) all day long' 2='(2) most of the day' 3='(3) about half of the day'
                4='(4) less than half of the day' 8='(8) not able to answer' 9='(9) missing';
VALUE c54fffff  1='(1) yes' 2='(2) no' 3='(3) partially' 8='(8) do not know'
                9='(9) missing';
VALUE f92a3fff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 8='(8) don''t know'
                9='(9) missing';
VALUE a54bffff  88='(88) don''t know' 99='(99) missing';
VALUE g4afffff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never writing'
                8='(8) don''t know' 9='(9) missing';
VALUE e6bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 10000 days' 9999='(9999) missing';
VALUE d11affff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 8='(8) don''t know' 9='(9) missing';
VALUE f221ffff  88888='(88888) do not know' 99999='(99999) missing';
VALUE d4bfffff  1='(1) Green tea' 2='(2) Red tea (black tea)' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE f26fffff  1='(001) .' 3='(003) 100' 4='(004) 1000' 5='(005) 1004' 6='(006) 1010'
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
VALUE e12fffff  1='(1) yes' 2='(2) a little difficult' 3='(3) unable to do so'
                8='(8) do not know' 9='(9) missing';
VALUE a54affff  8888='(8888) don''t know' 9999='(9999) missing';
VALUE f12affff  -1='(-0001) not applicable' 88888='(88888) don''t know'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE f43a4fff  -1='(-1) not applicable' 1='(1) good' 2='(2) so so' 3='(3) bad'
                8='(8) don''t know' 9='(9) missing';
VALUE d4meat2f  1='(1) almost everyday' 2='(2) not everyday, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE g1061fff  1='(1) left' 2='(2) right' 3='(3) both' 8='(8) do not know'
                9='(9) missing';
VALUE h21fffff  1='(1) yes' 2='(2) no' 3='(3) partially able to' 8='(8) do not know'
                9='(9) missing';
VALUE g81fffff  1='(1) right hand' 2='(2) left hand' 3='(3) both hands'
                4='(4) neither hand' 8='(8) don''t know' 9='(9) missing';
VALUE f34fffff  1='(1) very rich' 2='(2) rich' 3='(3) so so' 4='(4) poor'
                5='(5) very poor' 8='(8) don''t know' 9='(9) missing';
VALUE f21fffff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE f104ffff  -1='(-01) not applicable' 888='(888) do not know' 999='(999) missing';
VALUE d4drug1f  1='(1) almost everyday' 2='(2) not every day, but at least once  per week'
                3='(3) not every week, but at least once  per month'
                4='(4) not every month, but occasionally' 5='(5) rarely or never' 8='(8) don''t know'
                9='(9) missing';
VALUE e65fffff  -1='(-1) not applicable' 1='(1) full meet' 2='(2) so so'
                3='(3) unable to meet' 8='(8) not able to answer' 9='(9) missing';
VALUE b28fffff  1='(1) yes' 2='(2) no' 8='(8) not able to answer' 9='(9) missing';
VALUE d11bffff  1='(1) almost everyday' 2='(2) not daily, but once for a week'
                3='(3) not weekly, but at least once for a month' 4='(4) not monthly, but sometimes'
                5='(5) never' 9='(9) missing';
VALUE e63fffff  -1='(-0001) not applicable' 88888='(88888) not able to answer'
                99998='(99998) more than 100000' 99999='(99999) missing';
VALUE typeffff  1='(1) elder first interviewed in 1998'
                2='(2) elder first interviewed in 2000' 3='(3) elder first interviewed in 2002'
                4='(4) elder first interviewed in 2005' 5='(5) elder first interviewed in 2008'
                6='(6) elder first interviewed in 2011/2012'
                7='(7) newly added elder to replace deceased, migrated, refusal, or' 9='(9) missing';
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
VALUE d4afffff  1='(1) Green tea' 2='(2) Red tea (black tea);' 3='(3) Oolong tea'
                4='(4) White tea' 5='(5) Yellow tea' 6='(6) Dark tea (Pu-erh tea)' 7='(7) Compressed tea'
                8='(8) Scented  tea' 9='(9) Others, please specify';
VALUE d91fffff  1='(1) yes' 2='(2) no' 8='(8) don''t know' 9='(9) missing';
VALUE c55fffff  -1='(-1) not applicable' 1='(1) visually impaired, but can hear'
                2='(2) hearing impaired, but can see' 3='(3) visually and hearing impaired'
                4='(4) paralyzed' 5='(5) didn''t wish to participate'
                6='(6) could not understand because of cognitive impairment'
                7='(7) not able to participate at the moment due to illness' 8='(8) other reasons'
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
VALUE d33fffff  1='(1) vegetable grease' 2='(2) gingili grease' 3='(3) lard'
                4='(4) other animal''s fat' 8='(8) don''t know' 9='(9) missing';
VALUE f22fffff  -1='(-001) not applicable' 8888='(8888) don''t know' 9999='(9999) missing';
VALUE d85fffff  -1='(-1) not applicable' 1='(1) very strong liquor'
                2='(2) not very strong liquor' 3='(3) wine' 4='(4) rice wine' 5='(5)  beer'
                6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE a1ffffff  1='(1) male' 2='(2) female';
VALUE g4bfffff  1='(1) right-handed' 2='(2) left-handed' 3='(3) never brushing teeth'
                8='(8) don''t know' 9='(9) missing';
VALUE h71fffff  -1='(-1) not applicable' 1='(1) spouse' 2='(2) child or spouse of child'
                3='(3)  grandchild or spouse of grandchild'
                4='(4) great grandchild or spouse of great grandchild' 5='(5) sibling'
                6='(6) parent or parent-in-law' 7='(7) caregiver or institutional staff' 8='(8) others'
                9='(9) missing';
VALUE f35fffff  88888='(88888) do not know' 99998='(99998) more than 100000'
                99999='(99999) missing';
VALUE b11fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5)  very bad'
                8='(8) not able to answer' 9='(9) missing';
VALUE g1062fff  1='(1) since i was born'
                2='(2) during my childhood (before the age of 15)' 3='(3) between the ages of 15 and 40'
                4='(4) after the age of 40' 8='(8) do not know' 9='(9) missing';
VALUE g6ffffff  1='(1) regular' 2='(2) irregular' 8='(8) do not know' 9='(9) missing';
VALUE f62fffff  1='(1) yes' 2='(2) no' 8='(8) didn''t answer' 9='(9) missing';
VALUE g9ffffff  1='(1) yes, without using hands' 2='(2) yes, using hands' 3='(3) no'
                8='(8) don''t know' 9='(9) missing';
VALUE g131ffff  0='(00) no serious illness' 88='(88) bedridden all the year around'
                99='(99) missing';
VALUE f41a12ff  88='(88) do not know' 99='(99) missing';
VALUE h3ffffff  1='(1) surprisingly healthy' 2='(2) relatively healthy'
                3='(3) moderately ill' 4='(4) very ill' 8='(8) do not know' 9='(9) missing';
VALUE h1ffffff  1='(1) yes, without hearing aid' 2='(2) yes, but needs hearing aid'
                3='(3) partly, despite hearing aid' 4='(4) no' 8='(8) don''t know' 9='(9) missing';
VALUE f41fffff  1='(1) currently married and living with spouse'
                2='(2) married but not living with spouse' 3='(3)  divorced' 4='(4) widowed'
                5='(5) never married' 8='(8) do not know' 9='(9) missing';
VALUE e3ffffff  1='(1) without assistance'
                2='(2) assistance in cleaning or arranging clothes' 3='(3) don''t use toilet'
                9='(9) missing';
VALUE f211ffff  -1='(-1) not applicable' 1='(1) retired (worker)' 2='(2) retired  (cadre)'
                3='(3) no' 8='(8) don''t know' 9='(9) missing';
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
VALUE a53a2fff  -1='(-1) not applicable' 1='(1) male' 2='(2) female' 8='(8) don''t know'
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
VALUE g11fffff  1='(1) yes, standing' 2='(2) yes, sitting' 3='(3) no' 8='(8) don''t know'
                9='(9) missing';
VALUE rd91ffff  0='(0) without proxy' 1='(1) with proxy' 9='(9) missing';
VALUE f103a5ff  -1='(-1) not applicable' 0='(0) co-residence' 1='(1) same village'
                2='(2) same town/district' 3='(3) same county/city' 4='(4) county/city near by'
                5='(5) elsewhere' 8='(8) don''t know' 9='(9) missing';
VALUE g1ffffff  1='(1) can see and distinguish' 2='(2) can see only' 3='(3) can''t see'
                4='(4) blind' 8='(8) don''t know' 9='(9) missing';
VALUE g132ffff  88='(88) bedridden all the year around' 99='(99) missing';
VALUE a52fffff  -1='(-1) not applicable' 88='(88) do not know' 99='(99) missing';
VALUE a53a3fff  -1='(-01) not applicable' 888='(888) don''t know' 999='(999) missing';
VALUE b21fffff  1='(1) always' 2='(2) often' 3='(3) sometimes' 4='(4)  seldom'
                5='(5) never' 8='(8)  not able to answer' 9='(9) missing';
VALUE d71fffff  1='(1) yes' 2='(2) no' 9='(9) missing';
VALUE f103a2ff  -1='(-1) not applicable' 1='(1) yes' 2='(2) no' 3='(3) unknown'
                8='(8) don''t know' 9='(9) missing';
VALUE e1ffffff  1='(1) without assistance' 2='(2) one part assistance'
                3='(3) more than one part assistance' 8='(8) do not know' 9='(9) missing';
VALUE f141ffff  1='(1) yes' 2='(2) no' 8='(8) don''t know ' 9='(9) missing';
VALUE g4ffffff  1='(1) right-handed' 2='(2) left-handed' 8='(8) don''t know'
                9='(9) missing';
VALUE f25b1fff  -1='(-001) not applicable' 8888='(8888) do not know' 9999='(9999) missing';
VALUE a51fffff  1='(1) with household member(s)' 2='(2) alone' 3='(3) in an institution'
                8='(8) don''t know' 9='(9) missing';
VALUE d34fffff  1='(1) insipidity' 2='(2) salty' 3='(3) sweet' 4='(4) hot' 5='(5) crude'
                6='(6) do not have all the above tastes' 8='(8) don''t know' 9='(9) missing';
VALUE g1063fff  1='(1) suddenly (over a few days)' 2='(2) over a few months'
                3='(3) over a few years' 8='(8) do not know' 9='(9) missing';
VALUE d5ffffff  1='(1) boiled water' 2='(2) un-boiled water' 9='(9) missing';
VALUE f46fffff  -1='(-1) not applicable' 1='(1) yes full time' 2='(2) yes part time'
                3='(3) no' 8='(8) do not know' 9='(9) missing';
VALUE residenf  1='(1) city' 2='(2) town' 3='(3) rural';
VALUE a531ffff  -1='(-1) not applicable' 1='(1) self or spouse' 2='(2) children'
                3='(3) grandchildren' 4='(4) other relatives' 5='(5) others' 8='(8) don''t know'
                9='(9) missing';
VALUE f111afff  0='(00) spouse' 1='(01) son' 2='(02) daughter' 3='(03) daughter-in-law'
                4='(04) son-in-law' 5='(05) grandchildren and their spouses' 6='(06) other relatives'
                7='(07) friends/neighbors' 8='(08) social workers' 9='(09) housekeeper' 10='(10) nobody'
                88='(88) not able to answer' 99='(99) missing';
VALUE c53affff  0='(0) wrong' 1='(1) correct' 8='(8) not able to do' 9='(9) missing';
VALUE a43fffff  1='(1) urban' 2='(2) rural' 8='(8) don''t know' 9='(9) missing';
VALUE f16fffff  1='(1) living alone regardless residential distance with children'
                2='(2) living alone (or with spouse) and children living nearby'
                3='(3) coresidence with children' 4='(4) institutions' 5='(5) don''t know'
                8='(8) do not know' 9='(9) missing';
VALUE g14a2fff  -1='(-01) not applicable' 888='(888) bedridden all the year around'
                999='(999) missing';
VALUE c22fffff  -1='(-1) not applicable, i.e., repeat objects correctly'
                7='(7) can''t repeat the names of three object correctly'
                8='(8) not able to answer c21a c21b c21c' 9='(9) missing';
VALUE f32affff  -1='(-1) not applicable' 1='(01) retirement wages' 2='(02) spouse'
                3='(03) child(ren)' 4='(04) grandchild(ren)' 5='(05) other relative(s)'
                6='(06) local government or community' 7='(07) work by self' 8='(08) others'
                9='(09) no other means' 88='(88) do not know' 99='(99) missing';
VALUE e1bfffff  -1='(-001) not applicable' 8888='(8888) not able to answer'
                9998='(9998) more than 100000 days' 9999='(9999) missing';
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
VALUE g511ffff  888='(888) do not know' 999='(999) missing';
VALUE a42fffff  1='(1) same city/county as current address' 2='(2) other city/county'
                8='(8) don''t know' 9='(9) missing';
VALUE f47fffff  1='(1) very good' 2='(2) good' 3='(3) so so' 4='(4) bad' 5='(5) very bad'
                8='(8) do not know' 9='(9) missing';
VALUE e5ffffff  1='(1) without assistance' 2='(2)  occasional accidents'
                3='(3) incontinent' 9='(9) missing';
VALUE a542ffff  -1='(-1) not applicable' 1='(1) self' 2='(2) spouse'
                3='(3) children & their spouses' 4='(4) grandchildren & their spouses'
                5='(5) public & collectives' 6='(6) others' 8='(8) don''t know' 9='(9) missing';
VALUE f5_11fff  1='(01) spouse' 2='(02) son' 3='(03) daughter-in-law' 4='(04) daughter'
                5='(05) son-in-law' 6='(06) son and daughter' 7='(07) grandchildren'
                8='(08) other relatives' 9='(09) friends and neighbors' 10='(10) social services'
                11='(11) live-in care giver' 12='(12) nobody' 88='(88) don''t know' 99='(99) missing';
VALUE f84fffff  -1='(-1) not applicable' 0='(0) professional and technical personnel'
                1='(1) governmental, institutional or managerial personnel'
                2='(2) commercial, service or industrial worker' 3='(3) self-employed'
                4='(4) agriculture,forestry,animal husbandry or fishery worker' 5='(5) housework'
                6='(6) military personnel' 7='(7) never worked' 8='(8) others' 9='(9) missing';
VALUE ra41ffff  -1='(-1) not applicable' 0='(0) without proxy' 1='(1) with proxy'
                9='(9) missing';
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA data0007;
INFILE "&VERSION\DS0007\36692-0007-Data.txt" LRECL=1810;
INPUT
       ID 1-8                  YEARIN 9-12
        MONTHIN 13-14           DAYIN 15-16             V_BTHYR 17-20
        V_BTHMON 21-22          TYPE 23                 PROV 24-25
        RESIDENC 26             TRUEAGE 27-29           A1 30
        A2 31                   RA41 32-33              A41 34-35
        RA42 36-37              A42 38                  RA43 39-40
        A43 41                  RA51 42-43              A51 44
        RA52 45-46              A52 47-48               RA53A 49-50
        A53A1 51-52             A53A2 53-54             A53A3 55-57
        A53A4 58-59             A53A5 60-61             RA53B 62-63
        A53B1 64-65             A53B2 66-67             A53B3 68-70
        A53B4 71-72             A53B5 73-74             RA53C 75-76
        A53C1 77-78             A53C2 79-80             A53C3 81-85 .1
        A53C4 86-87             A53C5 88-89             RA53D 90-91
        A53D1 92-93             A53D2 94-95             A53D3 96-110 .11
        A53D4 111-112           A53D5 113-114           RA53E 115-116
        A53E1 117-118           A53E2 119-120           A53E3 121-123
        A53E4 124-125           A53E5 126-127           RA53F 128-129
        A53F1 130-131           A53F2 132-133           A53F3 134-138 .1
        A53F4 139-140           A53F5 141-142           RA53G 143-144
        A53G1 145-146           A53G2 147-148           A53G3 149-151
        A53G4 152-153           A53G5 154-155           RA53H 156-157
        A53H1 158-159           A53H2 160-161           A53H3 162-164
        A53H4 165-166           A53H5 167-168           RA53I 169-170
        A53I1 171-172           A53I2 173-174           A53I3 175-177
        A53I4 178-179           A53I5 180-181           RA53J 182-183
        A53J1 184-185           A53J2 186-187           A53J3 188-190
        A53J4 191-192           A53J5 193-194           RA530 195-196
        A530 197-198            RA531 199-200           A531 201-202
        RA532 203-204           A532 205-206            RA533 207-208
        A533 209                A533A 210               RA534 211-212
        A534 213-216            RA535 217-218           A535 219
        RA536 220-221           A536 222                RA537 223-224
        A537 225                RA540 226-227           A540 228
        RA541 229-230           A541 231-234            RA542 235-236
        A542 237-238            A542A 239               RA54 240-241
        A54A 242-245            A54B 246-247            B11 248
        B12 249                 B121 250                B21 251
        B22 252                 B23 253                 B24 254
        B25 255                 B26 256                 B27 257
        B28 258                 B29 259                 B210 260
        C11 261                 C12 262                 C13 263
        C14 264                 C15 265                 C16 266-267
        C21A 268                C21B 269                C21C 270
        C22 271-272             C31A 273                C31B 274
        C31C 275                C31D 276                C31E 277
        C32 278                 C41A 279                C41B 280
        C41C 281                C51A 282                C51B 283
        C52 284                 C53A 285                C53B 286
        C53C 287                C54 288                 C55 289-290
        RD1 291-292             D1 293                  RD2 294-295
        D2 296-299 .1           RD31 300-301            D31 302
        RD32 303-304            D32 305                 RD33 306-307
        D33 308                 D33A 309                RD34 310-311
        D34 312                 RD4MEAT 313-314         D4MEAT2 315
        D4MEAT1 316             RD4FISH 317-318         D4FISH2 319
        D4FISH1 320             RD4EGG 321-322          D4EGG2 323
        D4EGG1 324              RD4BEAN 325-326         D4BEAN2 327
        D4BEAN1 328             RD4VEG 329-330          D4VEG2 331
        D4VEG1 332              RD4SUGA 333-334         D4SUGA2 335
        D4SUGA1 336             RD4TEA 337-338          D4TEA2 339
        D4TEA1 340              RD4GARL 341-342         D4GARL2 343
        D4GARL1 344             RD4MILK 345-346         D4MILK1 347
        D4MILK2 348             RD4NUT 349-350          D4NUT1 351
        D4NUT2 352              RD4ALGA 353-354         D4ALGA1 355
        D4ALGA2 356             RD4VIT 357-358          D4VIT1 359
        D4VIT2 360              RD4DRUG 361-362         D4DRUG1 363
        D4DRUG2 364             D4A 365                 D4B 366
        RD5 367-368             D5 369                  RD6 370-371
        D6A 372                 D6B 373                 D6C 374
        RD71 375-376            D71 377                 RD72 378-379
        D72 380                 RD73 381-382            D73 383-385
        RD74 386-387            D74 388-390             RD75 391-392
        D75 393-394             RD76 395-396            D76 397
        RD77 398-399            D77 400                 RD78 401-402
        D78 403                 D78A 404-407 .1         D78B 408-409
        RD79 410-411            D79 412                 D79A 413-416 .1
        D79B 417-418            RD710 419-420           D710 421
        D710A 422-425 .1        D710B 426-427           RD81 428-429
        D81 430                 RD82 431-432            D82 433
        RD83 434-435            D83 436-438             RD84 439-440
        D84 441-443             RD85 444-445            D85 446-447
        RD86 448-449            D86 450-464 .12         RD87 465-466
        D87 467                 RD91 468                D91 469
        RD92 470-471            D92 472                 RD93 473-474
        D93 475-477             RD94 478-479            D94 480-482
        RD101 483-484           D101 485                RD102 486-487
        D102 488-490            RD103 491-492           D103 493-495
        RD11A 496-497           D11A 498                RD11B 499-500
        D11B 501                RD11C 502-503           D11C 504
        RD11D 505-506           D11D 507                RD11E 508-509
        D11E 510                RD11F 511-512           D11F 513
        RD11G 514-515           D11G 516                RD11H 517-518
        D11H 519                RD12 520-521            D12 522-523
        RE0 524-525             E0 526                  RE1 527-528
        E1 529                  RE1B 530-531            E1B 532-536
        RE2 537-538             E2 539                  RE2B 540-541
        E2B 542-545             RE3 546-547             E3 548
        RE3B 549-550            E3B 551-554             RE4 555-556
        E4 557                  RE4B 558-559            E4B 560-563
        RE5 564-565             E5 566                  RE5B 567-568
        E5B 569-573             RE6 574-575             E6 576
        RE6B 577-578            E6B 579-582             RE610 583-584
        E610 585-586            RE62 587-588            E62 589-590
        RE63 591-592            E63 593-597             RE64 598-599
        E64 600-601             E64A 602                RE65 603-604
        E65 605-606             RE67 607-608            E67 609-613 .1
        RE7 614-615             E7 616                  RE8 617-618
        E8 619                  RE9 620-621             E9 622
        RE10 623-624            E10 625                 RE11 626-627
        E11 628                 RE12 629-630            E12 631
        RE13 632-633            E13 634                 RE14 635-636
        E14 637                 RF1 638-639             F1 640-641
        RF2 642-643             F2 644-645              RF21 646-647
        F21 648-649             RF211 650-651           F211 652-653
        RF22 654-655            F22 656-659             RF221 660-661
        F221 662-666            RF23 667-668            F23 669-670
        RF24 671-672            F24 673                 RF25A 674-675
        F25A1 676-680           F25A2 681-686           RF25B 687-688
        F25B1 689-692           F25B2 693-694           RF26 695-696
        F26 697-699             RF27 700-701            F27 702
        RF31 703-704            F31 705-706             RF32 707-708
        F32A 709-710            F32B 711-712            F32C 713-714
        F32D 715-716            F32E 717-718            RF33 719-720
        F33 721-722             RF340 723-724           F340 725
        RF34 726-727            F34 728                 RF35 729-730
        F35 731-735             RF41 736-737            F41 738
        RF41A 739-740           F41A1 741               F41A11 742-745
        F41A12 746-747          F41A2 748               F41A21 749-752
        F41A22 753-754          F41A3 755               F41A31 756-759
        F41A32 760-761          RF41B 762-763           F41B 764
        F41B1 765-768           F41B2 769-770           RF42 771-772
        F42 773-774             RF43A 775-776           F43A1 777-779
        F43A2 780-781           F43A3 782-784           F43A4 785-786
        RF43B 787-788           F43B1 789-791           F43B2 792-793
        F43B3 794-796           F43B4 797-798           RF43C 799-800
        F43C1 801-803           F43C2 804-805           F43C3 806-808
        F43C4 809-810           RF43D 811-812           F43D1 813-815
        F43D2 816-817           F43D3 818-820           F43D4 821-822
        RF44 823-824            F44 825-826             RF45 827-828
        F45 829-830             RF46 831-832            F46 833-834
        RF47 835-836            F47 837                 RF5 838-839
        F5_11 840-841           RF61 842-843            F61 844
        RF610 845-846           F610 847-848            RF62 849-850
        F62 851                 RF63 852-853            F63 854
        RF64 855-856            F64A 857                F64B 858
        F64C 859                F64D 860                F64E 861
        F64F 862                F64G 863                F64H 864
        F64I 865                RF651A1 866-867         F651A1 868-872
        RF651B1 873-874         F651B1 875-879          RF651A2 880-881
        F651A2 882-887          RF651B2 888-889         F651B2 890-894
        RF6521 895-896          F6521 897               RF652A 898-899
        F652A 900-914 .11       RF652B 915-916          F652B 917
        RF66 918-919            F66 920                 RF71 921-922
        F71 923                 RF721 924-925           F721 926-928
        RF722 929-930           F722 931-933            RF73 934-935
        F73 936-938             RF74 939                F74 940-943 .1
        RF81 944-945            F81 946                 RF821 947-948
        F821 949-951            RF822 952-953           F822 954-956
        RF83 957-958            F83 959-973 .11         RF84 974
        F84 975-976             RF85 977                F85 978-979
        RF86 980                F86 981-982             RF91 983-984
        F91 985-986             RF92A 987-988           F92A1 989-990
        F92A2 991-992           F92A3 993-994           F92A4 995-997
        F92A5 998-999           F92A6 1000-1001         F92A7 1002-1003
        RF92B 1004-1005         F92B1 1006-1007         F92B2 1008-1009
        F92B3 1010-1011         F92B4 1012-1014         F92B5 1015-1016
        F92B6 1017-1018         F92B7 1019-1020         RF92C 1021-1022
        F92C1 1023-1024         F92C2 1025-1026         F92C3 1027-1028
        F92C4 1029-1031         F92C5 1032-1033         F92C6 1034-1035
        F92C7 1036-1037         RF92D 1038-1039         F92D1 1040-1041
        F92D2 1042-1043         F92D3 1044-1045         F92D4 1046-1048
        F92D5 1049-1050         F92D6 1051-1052         F92D7 1053-1054
        RF92E 1055-1056         F92E1 1057-1058         F92E2 1059-1060
        F92E3 1061-1062         F92E4 1063-1065         F92E5 1066-1067
        F92E6 1068-1069         F92E7 1070-1071         RF92F 1072-1073
        F92F1 1074-1075         F92F2 1076-1077         F92F3 1078-1079
        F92F4 1080-1082         F92F5 1083-1084         F92F6 1085-1086
        F92F7 1087-1088         RF92G 1089-1090         F92G1 1091-1092
        F92G2 1093-1094         F92G3 1095-1096         F92G4 1097-1099
        F92G5 1100-1101         F92G6 1102-1103         F92G7 1104-1105
        RF92H 1106-1107         F92H1 1108-1109         F92H2 1110-1111
        F92H3 1112-1113         F92H4 1114-1116         F92H5 1117-1118
        F92H6 1119-1120         F92H7 1121-1122         RF92I 1123-1124
        F92I1 1125-1126         F92I2 1127-1128         F92I3 1129-1130
        F92I4 1131-1133         F92I5 1134-1135         F92I6 1136-1137
        F92I7 1138-1139         RF92J 1140-1141         F92J1 1142-1143
        F92J2 1144-1145         F92J3 1146-1147         F92J4 1148-1150
        F92J5 1151-1152         F92J6 1153-1154         F92J7 1155-1156
        JIGE 1157-1158          RF10 1159-1160          F10 1161-1162
        F10A 1163-1164          RF101 1165-1166         F101 1167-1168
        RF102 1169-1170         F102 1171-1172          RF103A 1173-1174
        F103A8 1175-1176        F103A1 1177-1178        F103A2 1179-1180
        F103A3 1181-1195 .11    F103A4 1196-1197        F103A7 1198-1199
        F103A5 1200-1201        RF103B 1202-1203        F103B8 1204-1205
        F103B1 1206-1207        F103B2 1208-1209        F103B3 1210-1224 .11
        F103B4 1225-1226        F103B7 1227-1228        F103B5 1229-1230
        RF103C 1231-1232        F103C8 1233-1234        F103C1 1235-1236
        F103C2 1237-1238        F103C3 1239-1253 .11    F103C4 1254-1255
        F103C7 1256-1257        F103C5 1258-1259        RF103D 1260-1261
        F103D8 1262-1263        F103D1 1264-1265        F103D2 1266-1267
        F103D3 1268-1282 .11    F103D4 1283-1284        F103D7 1285-1286
        F103D5 1287-1288        RF103E 1289-1290        F103E8 1291-1292
        F103E1 1293-1294        F103E2 1295-1296        F103E3 1297-1299
        F103E4 1300-1301        F103E7 1302-1303        F103E5 1304-1305
        RF103F 1306-1307        F103F8 1308-1309        F103F1 1310-1311
        F103F2 1312-1313        F103F3 1314-1316        F103F4 1317-1318
        F103F7 1319-1320        F103F5 1321-1322        RF103G 1323-1324
        F103G8 1325-1326        F103G1 1327-1328        F103G2 1329-1330
        F103G3 1331-1333        F103G4 1334-1335        F103G7 1336-1337
        F103G5 1338-1339        RF103H 1340-1341        F103H8 1342-1343
        F103H1 1344-1345        F103H2 1346-1347        F103H3 1348-1350
        F103H4 1351-1352        F103H7 1353-1354        F103H5 1355-1356
        RF103I 1357-1358        F103I8 1359-1360        F103I1 1361-1362
        F103I2 1363-1364        F103I3 1365-1367        F103I4 1368-1369
        F103I7 1370-1371        F103I5 1372-1373        RF103J 1374-1375
        F103J8 1376-1377        F103J1 1378-1379        F103J2 1380-1381
        F103J3 1382-1384        F103J4 1385-1386        F103J7 1387-1388
        F103J5 1389-1390        RF103K 1391-1392        F103K8 1393-1394
        F103K1 1395-1396        F103K2 1397-1398        F103K3 1399-1401
        F103K4 1402-1403        F103K7 1404-1405        F103K5 1406-1407
        RF103L 1408-1409        F103L8 1410-1411        F103L1 1412-1413
        F103L2 1414-1415        F103L3 1416-1418        F103L4 1419-1420
        F103L7 1421-1422        F103L5 1423-1424        RF103M 1425-1426
        F103M8 1427-1428        F103M1 1429-1430        F103M2 1431-1432
        F103M3 1433-1435        F103M4 1436-1437        F103M7 1438-1439
        F103M5 1440-1441        RF104 1442-1443         F104 1444-1446
        RF105 1447-1448         F105 1449-1451          F111A 1452-1453
        F111B 1454-1455         F111C 1456-1457         F112A 1458-1459
        F112B 1460-1461         F112C 1462-1463         F113A 1464-1465
        F113B 1466-1467         F113C 1468-1469         RF12 1470-1471
        F12A 1472-1476          F12B 1477-1481          F12C 1482-1486
        RF13 1487-1488          F13A 1489-1493          F13B 1494-1498
        F13C 1499-1503          RF14 1504-1505          F141 1506
        F142 1507               F143 1508               F144 1509
        F145 1510               F146 1511               F147 1512
        F148 1513               F149 1514               RF15 1515-1516
        F151 1517               F152 1518               F153 1519
        F154 1520               F155 1521               F156 1522
        F157 1523               F158 1524               F159 1525
        F16 1526                RG01 1527-1528          G01 1529
        RG02 1530-1531          G02 1532-1533           RG1 1534-1535
        G1 1536                 G1A 1537                RG21 1538-1539
        G21 1540-1541           RG22 1542-1543          G22 1544-1545
        RG23 1546-1547          G23 1548                RG24 1549-1550
        G24 1551                RG24A 1552-1553         G24A 1554-1555
        RG25 1556-1557          G25 1558                RG25A 1559-1560
        G25A 1561-1562          RG3 1563-1564           G3 1565
        RG4 1566-1567           G4 1568                 RG4A 1569-1570
        G4A 1571                RG4B 1572-1573          G4B 1574
        RG5 1575-1576           G511 1577-1579          G512 1580-1582
        G521 1583-1585          G522 1586-1588          G6 1589
        G7 1590-1592            G81 1593                G82 1594
        G83 1595                G9 1596                 G101 1597-1611 .11
        G1011 1612-1615 .1      G102 1616               G1021 1617-1619
        G122 1620-1622          G123 1623-1627 .1       G102C 1628-1630
        RG106 1631-1632         G106 1633               RG1061 1634-1635
        G1061 1636              RG1062 1637-1638        G1062 1639
        RG1063 1640-1641        G1063 1642              G11 1643
        G12 1644-1645           RG130 1646-1647         G130 1648
        RG13 1649-1650          G131 1651-1652          G132 1653-1654
        RG14A 1655-1656         G14A1 1657-1658         G14A2 1659-1662
        G141T 1663              RG14B 1664-1665         G14B1 1666-1667
        G14B2 1668-1670         G142T 1671              RG14C 1672-1673
        G14C1 1674-1675         G14C2 1676-1678         G143T 1679
        G15A1 1680              G15A2 1681              G15A3 1682-1683
        G15B1 1684              G15B2 1685              G15B3 1686-1687
        G15C1 1688              G15C2 1689              G15C3 1690-1691
        G15D1 1692              G15D2 1693              G15D3 1694-1695
        G15E1 1696              G15E2 1697              G15E3 1698-1699
        G15F1 1700              G15F2 1701              G15F3 1702-1703
        G15G1 1704              G15G2 1705              G15G3 1706-1707
        G15H1 1708              G15H2 1709              G15H3 1710-1711
        G15I1 1712              G15I2 1713              G15I3 1714-1715
        G15J1 1716-1717         G15J2 1718              G15J3 1719-1720
        G15K1 1721              G15K2 1722              G15K3 1723-1724
        G15L1 1725              G15L2 1726              G15L3 1727-1728
        G15M1 1729              G15M2 1730              G15M3 1731-1732
        G15N1 1733              G15N2 1734              G15N3 1735-1736
        G15O1 1737              G15O2 1738              G15O3 1739-1740
        G15P1 1741              G15P2 1742              G15P3 1743-1744
        G15Q1 1745              G15Q2 1746              G15Q3 1747-1748
        G15R1 1749              G15R2 1750              G15R3 1751-1752
        G15N1A 1753             G15N2A 1754             G15N3A 1755-1756
        G15S1 1757              G15S2 1758              G15S3 1759-1760
        G15T1 1761              G15T2 1762              G15T3 1763-1764
        G15U1 1765-1766         G15U2 1767-1768         G15U3 1769-1770
        G15J1A 1771             G15J2A 1772             G15J3A 1773-1774
        G15V1 1775              G15V2 1776              G15V3 1777-1778
        G15Y2 1779-1781         G15Y3 1782-1783         H1 1784
        H21 1785                H22 1786-1787           H3 1788
        H5 1789-1791            H6 1792                 H7 1793
        H71 1794-1795           W_2014 1796-1810 .11    ;


* SAS LABEL STATEMENT;

LABEL 
   ID      = 'id, province code +given no. + year of the wave of the very first interview' 
   YEARIN  = 'year of the 2014 interview' 
   MONTHIN = 'month of the 2014 interview' 
   DAYIN   = 'day of the 2014 interview' 
   V_BTHYR = 'validated birth year' 
   V_BTHMON= 'validated birth month' 
   TYPE    = 'category of the interviewee' 
   PROV    = 'national code for provinces sampled' 
   RESIDENC= 'category of residence of the interviewee in 2014' 
   TRUEAGE = 'validated age' 
   A1      = 'sex' 
   A2      = 'ethnic group' 
   RA41    = 'proxy or not for a41' 
   A41     = 'which province were you born in?' 
   RA42    = 'proxy or not for a42' 
   A42     = 'was the country (city) you born in the same as current address?' 
   RA43    = 'proxy or not for a43' 
   A43     = 'was the place of birth an urban area or a rural area at time of birth' 
   RA51    = 'proxy or not for a51' 
   A51     = 'co-residence of interviewee' 
   RA52    = 'proxy or not for a52' 
   A52     = 'how many people are living with you?' 
   RA53A   = 'proxy or not for a53a1, a53a11, a53a2, a53a3, a53a4, a53a5' 
   A53A1   = 'relationship between you and 1st person you living with currently' 
   A53A2   = 'sex of 1st person living with you currently' 
   A53A3   = 'age of 1st person living with you currently' 
   A53A4   = 'education level of 1st person living with you currently' 
   A53A5   = '# of cigarettes 1st person usuallysmoke per day inside home' 
   RA53B   = 'proxy or not for a53b1, a53b11, a53b2, a53b3, a53b4, a53b5' 
   A53B1   = 'relationship between you and 2nd person living with you currently' 
   A53B2   = 'sex of 2nd person living with you currently' 
   A53B3   = 'age of 2nd person living with you currently' 
   A53B4   = 'education level of 2nd person living with you currently' 
   A53B5   = '# of cigarettes 2nd person usuallysmoke per day inside home' 
   RA53C   = 'proxy or not for a53c1, a53c11, a53c2, a53c3, a53c4, a53c5' 
   A53C1   = 'relationship between you and 3rd person living with you currently' 
   A53C2   = 'sex of 3rd person living with you currently' 
   A53C3   = 'age of 3rd person living with you currently' 
   A53C4   = 'education level of 3rd person living with you currently' 
   A53C5   = '# of cigarettes 3rd person usuallysmoke per day inside home' 
   RA53D   = 'proxy or not for a53d1, a53d11, a53d2, a53d3, a53d4, a53d5' 
   A53D1   = 'relationship between you and 4th person living with you currently' 
   A53D2   = 'sex of 4th person living with you currently' 
   A53D3   = 'age of 4th person living with you currently' 
   A53D4   = 'education level of 4th person living with you currently' 
   A53D5   = '# of cigarettes 4th person usuallysmoke per day inside home' 
   RA53E   = 'proxy or not for a53e1, a53e11, a53e2, a53e3, a53e4, a53e5' 
   A53E1   = 'relationship between you and 5th person living with you currently' 
   A53E2   = 'sex of 5th person living with you currently' 
   A53E3   = 'age of 5th person living with you currently' 
   A53E4   = 'education level of 5th person living with you currently' 
   A53E5   = '# of cigarettes 5th person usuallysmoke per day inside home' 
   RA53F   = 'proxy or not for a53f1, a53f11, a53f2, a53f3, a53f4, a53f5' 
   A53F1   = 'relationship between you and 6th person living with you currently' 
   A53F2   = 'sex of 6th person living with you currently' 
   A53F3   = 'age of 6th person living with you currently' 
   A53F4   = 'education level of 6th person living with you currently' 
   A53F5   = '# of cigarettes 6th person usuallysmoke per day inside home' 
   RA53G   = 'proxy or not for a53g1, a53g11, a53g2, a53g3, a53g4, a53g5' 
   A53G1   = 'relationship between you and 7th person living with you currently' 
   A53G2   = 'sex of 7th person living with you currently' 
   A53G3   = 'age of 7th person living with you currently' 
   A53G4   = 'education level of 7th person living with you currently' 
   A53G5   = '# of cigarettes 7th person usuallysmoke per day inside home' 
   RA53H   = 'proxy or not for a53h1, a53h11, a53h2, a53h3, a53h4, a53h5' 
   A53H1   = 'relationship between you and 8th person living with you currently' 
   A53H2   = 'sex of 8th person living with you currently' 
   A53H3   = 'age of 8th person living with you currently' 
   A53H4   = 'education level of 8th person living with you currently' 
   A53H5   = '# of cigarettes 8th person usuallysmoke per day inside home' 
   RA53I   = 'proxy or not for a53i1, a53i11, a53i2, a53i3, a53i4, a53i5' 
   A53I1   = 'relationship between you and 9th person living with you currently' 
   A53I2   = 'sex of 9th person living with you currently' 
   A53I3   = 'age of 9th person living with you currently' 
   A53I4   = 'education level of 9th person living with you currently' 
   A53I5   = '# of cigarettes 9th person usuallysmoke per day inside home' 
   RA53J   = 'proxy or not for a53j1, a53j11, a53j2, a53j3, a53j4, a53j5' 
   A53J1   = 'relationship between you and 10th person living with you currently' 
   A53J2   = 'sex of 10th person living with you currently' 
   A53J3   = 'age of 10th person living with you currently' 
   A53J4   = 'education level of 10th person living with you currently' 
   A53J5   = '# of cigarettes 10th person usuallysmoke per day inside home' 
   RA530   = 'proxy or not for a530' 
   A530    = 'is the house/apartment of the elder purchased/self-built/inherited/rented?' 
   RA531   = 'proxy or not for a531' 
   A531    = 'under whose name your current house/apartment purchased or rented' 
   RA532   = 'proxy or not for a532' 
   A532    = 'do you (and your spouse) have your own bedroom?' 
   RA533   = 'proxy or not for a533' 
   A533    = 'what type of dwelling is your home?' 
   A533A   = 'other type of dwelling' 
   RA534   = 'proxy or not for a534' 
   A534    = 'what is the approximate year your home was built?' 
   RA535   = 'proxy or not for a535' 
   A535    = 'during past 1 year, was your home damaged from broken pipes or heavy rain?' 
   RA536   = 'proxy or not for a536' 
   A536    = 'does your home frequently have a mildew odor or musty smell?' 
   RA537   = 'proxy or not for a537' 
   A537    = 'which fuels are normally used for cooking in your home?' 
   RA540   = 'proxy or not for a540' 
   A540    = 'the primary reason that you live in an institution (elderly center, elderly home' 
   RA541   = 'proxy or not for a541' 
   A541    = 'the average monthly cost for the elder living in an institution' 
   RA542   = 'proxy or not for a542' 
   A542    = 'who mainly paid for the cost?' 
   A542A   = 'other people mainly paid for the cost' 
   RA54    = 'proxy or not for a54a a54b' 
   A54A    = 'year of being admitted to the institution or living alone' 
   A54B    = 'month of being admitted to the institution or living alone' 
   B11     = 'self-reported quality of life' 
   B12     = 'self-reported health' 
   B121    = 'do you feel any change of your health since last year' 
   B21     = 'look on the bright side of things' 
   B22     = 'keep my belongings neat and clean' 
   B23     = 'feel fearful or anxious' 
   B24     = 'feel lonely and isolated' 
   B25     = 'make own decision' 
   B26     = 'feel useless with age' 
   B27     = 'be happy as younger' 
   B28     = 'have you felt sad, blue, or depressed for two weeks or more in last 12 months?' 
   B29     = 'have you lost interest in most things like hobbies, work, or similar activities' 
   B210    = 'how much of the day did these feelings usually last?' 
   C11     = 'what time of day is it right now?' 
   C12     = 'what is the animal year of this year?' 
   C13     = 'what is the date of the mid-autumn festival?' 
   C14     = 'what is the season right now?' 
   C15     = 'what is the name of this county or district?' 
   C16     = '# of kinds of food named in one minute' 
   C21A    = 'repeat the name of "table" at first attempt' 
   C21B    = 'repeat the name of "apple" at first attempt' 
   C21C    = 'repeat the name of "clothes" at first attempt' 
   C22     = 'attempts to repeat the names of three objects correctly' 
   C31A    = '$20-$3=?' 
   C31B    = '$20-$3-$3=?' 
   C31C    = '$20-$3-$3-$3=?' 
   C31D    = '$20-$3-$3-$3-$3=?' 
   C31E    = '$20-$3-$3-$3-$3-$3=?' 
   C32     = 'draw the figure following the example' 
   C41A    = 'repeat the name of "table" a while later' 
   C41B    = 'repeat the name of "apple" a while later' 
   C41C    = 'repeat the name of "clothes" a while later' 
   C51A    = 'name "pen"' 
   C51B    = 'name "watch"' 
   C52     = 'repeat a sentence' 
   C53A    = 'taking paper using right hand' 
   C53B    = 'fold paper' 
   C53C    = 'put paper on the floor' 
   C54     = 'was the interviewee able to answer sections b and c?' 
   C55     = 'what is the main reason unable to answer questions?' 
   RD1     = 'proxy or not for d1' 
   D1      = 'staple food' 
   RD2     = 'proxy or not for d2' 
   D2      = 'amount of staple food per day (liang)' 
   RD31    = 'proxy or not for d31' 
   D31     = 'how often eat fresh fruit?' 
   RD32    = 'proxy or not for d32' 
   D32     = 'how often eat vegetables?' 
   RD33    = 'proxy or not for d33' 
   D33     = 'what kind of grease do you mainly use for cooking?' 
   D33A    = 'other kind of grease you mainly use' 
   RD34    = 'proxy or not for d34' 
   D34     = 'main flavor you have' 
   RD4MEAT = 'proxy or not for d4meat1 and d4meat2' 
   D4MEAT2 = 'how often eat meat at present?' 
   D4MEAT1 = 'how often ate meat at around age 60?' 
   RD4FISH = 'proxy or not for d4fish1 and d4fish2' 
   D4FISH2 = 'how often eat fish at present?' 
   D4FISH1 = 'how often ate fish at around age 60?' 
   RD4EGG  = 'proxy or not for d4egg1 and d4egg2' 
   D4EGG2  = 'how often eat eggs at present?' 
   D4EGG1  = 'how often ate eggs at around age 60?' 
   RD4BEAN = 'proxy or not for d4bean1 and d4bean2' 
   D4BEAN2 = 'how often eat food made from beans at present?' 
   D4BEAN1 = 'how often ate food made from beans at around age 60?' 
   RD4VEG  = 'proxy or not for d4veg1 and d4veg2' 
   D4VEG2  = 'how often eat salt-preserved vegetables at present' 
   D4VEG1  = 'how often ate salt-preserved vegetables at around age 60' 
   RD4SUGA = 'proxy or not for d4suga1 and d4suga2' 
   D4SUGA2 = 'how often eat sugar at present' 
   D4SUGA1 = 'how often ate sugar at around age 60' 
   RD4TEA  = 'proxy or not for d4tea1 and d4tea2' 
   D4TEA2  = 'how often drink tea at present' 
   D4TEA1  = 'how often drank tea at around age 60' 
   RD4GARL = 'proxy or not for d4garl1 and d4garl2' 
   D4GARL2 = 'how often eat garlic at present' 
   D4GARL1 = 'how often ate garlic at around age 60' 
   RD4MILK = 'proxy or not for d4milk1 and d4milk2' 
   D4MILK1 = 'how often eat milk products at present' 
   D4MILK2 = 'how often ate milk products at around age 60' 
   RD4NUT  = 'proxy or not for d4nut1 and d4nut2' 
   D4NUT1  = 'how often eat nut products at present' 
   D4NUT2  = 'how often ate nut products at around age 60' 
   RD4ALGA = 'proxy or not for d4alga1 and d4alga2' 
   D4ALGA1 = 'how often eat mushroom or algae at present' 
   D4ALGA2 = 'how often ate mushroom or algae at around age 60' 
   RD4VIT  = 'proxy or not for d4vit1 and d4vit2' 
   D4VIT1  = 'how often eat vitamins (a/c/e) at present' 
   D4VIT2  = 'how often ate vitamins (a/c/e) at around age 60' 
   RD4DRUG = 'proxy or not for d4drug1 and d4drug2' 
   D4DRUG1 = 'how often eat medicinal plants at present' 
   D4DRUG2 = 'how often ate medicinal plants at around age 60' 
   D4A     = 'what kind of tea usually drink at present?' 
   D4B     = 'what kind of tea usually drink at around age 60?' 
   RD5     = 'proxy or not for d5' 
   D5      = 'what kind of water usually drink?' 
   RD6     = 'proxy or not for d6a d6b d6c' 
   D6A     = 'main source of water drank during childhood' 
   D6B     = 'main source of water drank at around age 60' 
   D6C     = 'main source of drinking water at present' 
   RD71    = 'proxy or not for d71' 
   D71     = 'smoke or not at present?' 
   RD72    = 'proxy or not for d72' 
   D72     = 'smoked or not in the past?' 
   RD73    = 'proxy or not for d73' 
   D73     = 'age when began smoking' 
   RD74    = 'proxy or not for d74' 
   D74     = 'age when quit smoking if not smoking at present' 
   RD75    = 'proxy or not for d75' 
   D75     = 'number of times smoke (or smoked) per day' 
   RD76    = 'proxy or not for d76' 
   D76     = 'how soon after you wake up do you smoke your first cigarette?' 
   RD77    = 'proxy or not for d77' 
   D77     = 'what do you think about your chances of being diagnosed with lung cancer?' 
   RD78    = 'proxy or not for d78' 
   D78     = 'during childhood, were you exposed to smoke from other people at home?' 
   D78A    = 'd78a if yes, for how many hours per day?' 
   D78B    = 'd78b if yes, for how many years?' 
   RD79    = 'proxy or not for d79' 
   D79     = 'during young/middle-ages, were you exposed to smoke from others at home?' 
   D79A    = 'd79a if yes, for how many hours per day?' 
   D79B    = 'd79b if yes, for how many years?' 
   RD710   = 'proxy or not for d710' 
   D710    = 'in social settings such as restaurant, were you exposed to smoke from others?' 
   D710A   = 'd710a if yes, for how many hours per day?' 
   D710B   = 'd710b if yes, for how many years?' 
   RD81    = 'proxy or not for d81' 
   D81     = 'drink or not at present?' 
   RD82    = 'proxy or not for d82' 
   D82     = 'drank or not in the past?' 
   RD83    = 'proxy or not for d83' 
   D83     = 'age when began drinking' 
   RD84    = 'proxy or not for d84' 
   D84     = 'age when quit drinking if not drinking at present' 
   RD85    = 'proxy or not for d85' 
   D85     = 'what kind of alcohol you drink (drank) ?' 
   RD86    = 'proxy or not for d86' 
   D86     = 'how much per day do you drink (or drank)?' 
   RD87    = 'proxy or not for d87' 
   D87     = 'when stop drinking, do you feel anxious for most of the day for at least 2 days?' 
   RD91    = 'proxy or not for d91' 
   D91     = 'exercise or not at present?' 
   RD92    = 'proxy or not for d92' 
   D92     = 'exercised or not in the past?' 
   RD93    = 'proxy or not for d93' 
   D93     = 'age when started to exercise' 
   RD94    = 'proxy or not for d94' 
   D94     = 'age when quit exercise if not exercising at present' 
   RD101   = 'proxy or not for d101' 
   D101    = 'have you done physical labor regularly?' 
   RD102   = 'proxy or not for d102' 
   D102    = 'age when began doing physical labor' 
   RD103   = 'proxy or not for d103' 
   D103    = 'age when stopped doing physical labor' 
   RD11A   = 'proxy or not for d11a' 
   D11A    = 'do you do house work at present?' 
   RD11B   = 'proxy or not for d11b' 
   D11B    = 'do you grow vegetables & do other field work at present?' 
   RD11C   = 'proxy or not for d11c' 
   D11C    = 'do you do garden work' 
   RD11D   = 'proxy or not for d11d' 
   D11D    = 'do you read newspapers/books at present?' 
   RD11E   = 'proxy or not for d11e' 
   D11E    = 'do you raise domestic animals/pets at present?' 
   RD11F   = 'proxy or not for d11f' 
   D11F    = 'do you play cards/mah-jongg at present?' 
   RD11G   = 'proxy or not for d11g' 
   D11G    = 'do you watch tv or listen to radio at present ?' 
   RD11H   = 'proxy or not for d11h' 
   D11H    = 'do you take part in some social activities at present?' 
   RD12    = 'proxy or not for d12' 
   D12     = '# of times traveling beyond home county/city in the past two years' 
   RE0     = 'proxy or not for e0' 
   E0      = 'for the last 6 months, were you limited in activities because of health problem?' 
   RE1     = 'proxy or not for e1' 
   E1      = 'bathing' 
   RE1B    = 'proxy or not for e1b' 
   E1B     = '# of days needing assistance in bathing' 
   RE2     = 'proxy or not for e2' 
   E2      = 'dressing' 
   RE2B    = 'proxy or not for e2b' 
   E2B     = '# of days needing assistance in dressing' 
   RE3     = 'proxy or not for e3' 
   E3      = 'toileting' 
   RE3B    = 'proxy or not for e3b' 
   E3B     = '# of days needing assistance in toileting' 
   RE4     = 'proxy or not for e4' 
   E4      = 'indoor transferring' 
   RE4B    = 'proxy or not for e4b' 
   E4B     = '# of days needing assistance in indoor transferring' 
   RE5     = 'proxy or not for e5' 
   E5      = 'continence' 
   RE5B    = 'proxy or not for e5b' 
   E5B     = '# of days needing assistance in continence' 
   RE6     = 'proxy or not for e6' 
   E6      = 'feeding' 
   RE6B    = 'proxy or not for e6b' 
   E6B     = '# of days needing assistance in feeding' 
   RE610   = 'proxy or not for e610' 
   E610    = 'primary caregiver when the elder need assistance in above six tasks' 
   RE62    = 'proxy or not for e62' 
   E62     = 'the willingness of the primary caregiver when providing such care' 
   RE63    = 'proxy or not for e63' 
   E63     = 'the total direct cost paid for caregiving last week' 
   RE64    = 'proxy or not for e64' 
   E64     = 'who mainly pays the above cost?' 
   E64A    = 'othe people who pays the above cost' 
   RE65    = 'proxy or not for e65' 
   E65     = 'does the help received for the six above tasks meet his/her needs?' 
   RE67    = 'proxy or not for e67' 
   E67     = 'how many hours did the (grand)children help the elder last week?' 
   RE7     = 'proxy or not for e7' 
   E7      = 'able to go outside to visit neighbors?' 
   RE8     = 'proxy or not for e8' 
   E8      = 'able to go shopping by yourself?' 
   RE9     = 'proxy or not for e9' 
   E9      = 'able to make food by yourself?' 
   RE10    = 'proxy or not for e10' 
   E10     = 'able to wash clothes by yourself?' 
   RE11    = 'proxy or not for e11' 
   E11     = 'able to walk one kilometer?' 
   RE12    = 'proxy or not for e12' 
   E12     = 'able to carry 5kg weight?' 
   RE13    = 'proxy or not for e13' 
   E13     = 'able to crouch and stand three times?' 
   RE14    = 'proxy or not for e14' 
   E14     = 'able to take public transportation?' 
   RF1     = 'proxy or not for f1' 
   F1      = 'years of schooling' 
   RF2     = 'proxy or not for f2' 
   F2      = 'main occupation before age 60' 
   RF21    = 'proxy or not for f21' 
   F21     = 'do you have a retirement pension?' 
   RF211   = 'proxy or not for f211' 
   F211    = 'are you retired?' 
   RF22    = 'proxy or not for f22' 
   F22     = 'which year did you retire?' 
   RF221   = 'proxy or not for f221' 
   F221    = 'if retired, what is your monthly retirement pension?' 
   RF23    = 'proxy or not for f23' 
   F23     = 'are you still engaged in paid jobs after retirement?' 
   RF24    = 'proxy or not for f24' 
   F24     = 'do you have public old age insurance?' 
   RF25A   = 'proxy or not for f25a' 
   F25A1   = 'what is the annual payment by individual if taking part in old age insurance?' 
   F25A2   = 'what is the annual subsidy by government if taking part in old age insurance?' 
   RF25B   = 'proxy or not for f25b' 
   F25B1   = 'which year did you take part in public old age insurance?' 
   F25B2   = 'which month did you take part in public old age insurance?' 
   RF26    = 'proxy or not for f26' 
   F26     = 'what is your monthly pension from old age insurance at present?' 
   RF27    = 'proxy or not for f27' 
   F27     = 'what''s the reason that you did not take part in old age insurance?' 
   RF31    = 'proxy or not for f31' 
   F31     = 'main source of financial support' 
   RF32    = 'proxy or not for f32a, f32b,f32c,f32d,f32e' 
   F32A    = 'first of other financial support sources' 
   F32B    = 'second of other financial support sources' 
   F32C    = 'third of other financial support sources' 
   F32D    = 'fourth of other financial support sources' 
   F32E    = 'fifth of other financial support sources' 
   RF33    = 'proxy or not for f33' 
   F33     = 'is all of the financial support sufficient to pay for daily expenses?' 
   RF340   = 'proxy or not for f340' 
   F340    = 'your power in decision-making on financial spending in the household' 
   RF34    = 'proxy or not for f34' 
   F34     = 'how do you rate your economic status compared with other local people?' 
   RF35    = 'proxy or not for f35' 
   F35     = 'total income of your household last year' 
   RF41    = 'proxy or not for f41' 
   F41     = 'current marital status' 
   RF41A   = 'proxy or not for f41a' 
   F41A1   = 'did you experience the event of spouse passing-away after 2008 survey?' 
   F41A11  = 'if yes, which year to be widowed?' 
   F41A12  = 'if yes, which month to be widowed?' 
   F41A2   = 'did you experience the event of divorcement after 2008 survey?' 
   F41A21  = 'if yes, which year to be divorced?' 
   F41A22  = 'if yes, which month to be divorced?' 
   F41A3   = 'did you experience the event of remarriage after 2008 survey?' 
   F41A31  = 'if yes, which year to be remarried?' 
   F41A32  = 'if yes, which month to be remarried?' 
   RF41B   = 'proxy or not for f41b' 
   F41B    = 'do you have cohabited partner but not formally married at present?' 
   F41B1   = 'if yes, which year to be cohabited?' 
   F41B2   = 'if yes, which month to be cohabited?' 
   RF42    = 'proxy or not for f42' 
   F42     = 'how many times have you been married?' 
   RF43A   = 'proxy or not for f43a1 to f43a4' 
   F43A1   = 'age at the 1st marriage' 
   F43A2   = 'current status of the 1st marriage' 
   F43A3   = 'age at the 1st marriage dissolution' 
   F43A4   = 'quality of the 1st marriage' 
   RF43B   = 'proxy or not for f43b1 to f43b4' 
   F43B1   = 'age at the 2nd marriage' 
   F43B2   = 'current status of the 2nd marriage' 
   F43B3   = 'age at the 2nd marriage dissolution' 
   F43B4   = 'quality of the 2nd marriage' 
   RF43C   = 'proxy or not for f43c1 to f43c4' 
   F43C1   = 'age at the 3rd marriage' 
   F43C2   = 'current status of the 3rd marriage' 
   F43C3   = 'age at the 3rd marriage dissolution' 
   F43C4   = 'quality of the 3rd marriage' 
   RF43D   = 'proxy or not for f43d1 to f43d4' 
   F43D1   = 'age at the latest marriage' 
   F43D2   = 'current status of the latest marriage' 
   F43D3   = 'age at the latest marriage dissolution' 
   F43D4   = 'quality of the latest marriage' 
   RF44    = 'proxy or not for f44' 
   F44     = 'years of schooling of the latest spouse' 
   RF45    = 'proxy or not for f45' 
   F45     = 'main occupation of the latest spouse before age 60' 
   RF46    = 'proxy or not for f46' 
   F46     = 'does your spouse have a paid job at present?' 
   RF47    = 'proxy or not for f47' 
   F47     = 'current health status of your spouse' 
   RF5     = 'proxy or not for f5' 
   F5_11   = 'who take care of you when you are sick?' 
   RF61    = 'proxy or not for f61' 
   F61     = 'get adequate medical service at present' 
   RF610   = 'proxy or not for f610' 
   F610    = 'main reason not to visit doctor when necessary' 
   RF62    = 'proxy or not for f62' 
   F62     = 'got adequate medical treatment at around age 60' 
   RF63    = 'proxy or not for 63' 
   F63     = 'got adequate medical treatment in childhood' 
   RF64    = 'proxy or not for f64a-f64t' 
   F64A    = 'do you have retirement pension at present' 
   F64B    = 'do you have public old-age insurance at present' 
   F64C    = 'do you have private or commercial old-age insurance at present' 
   F64D    = 'do you have public free medical services at present' 
   F64E    = 'do you have medical insurance for urban workers at present' 
   F64F    = 'do you have collective medical insurance for urban residents at present' 
   F64G    = 'do you have the new rural cooperative medical insurance at present' 
   F64H    = 'do you have commercial medical insurance at present' 
   F64I    = 'do you have other social security or private insurance at present' 
   RF651A1 = 'proxy or not for f651a1' 
   F651A1  = 'how much money did you spend on outpatient costs last year?' 
   RF651B1 = 'proxy or not for f651b1' 
   F651B1  = 'how much money did your family pay for outpatient costs last year?' 
   RF651A2 = 'proxy or not for f651a2' 
   F651A2  = 'how much money did you spend on inpatient costs last year?' 
   RF651B2 = 'proxy or not for f651b2' 
   F651B2  = 'how much money did your family pay for inpatient costs last year?' 
   RF6521  = 'proxy or not for f6521' 
   F6521   = 'who mainly paid the cost?' 
   RF652A  = 'proxy or not for f652a' 
   F652A   = 'how far from your home to the nearest hospital (in kilometres)?' 
   RF652B  = 'proxy or not for f652b' 
   F652B   = 'do you have regular phycial examination once every year?' 
   RF66    = 'proxy or not for f66' 
   F66     = 'often went to bed hungry as a child' 
   RF71    = 'proxy or not for f71' 
   F71     = 'mother alive or not' 
   RF721   = 'proxy or not for f721' 
   F721    = 'mother''s age if alive' 
   RF722   = 'proxy or not for f722' 
   F722    = 'mother''s age at death' 
   RF73    = 'proxy or not for f73' 
   F73     = 'respondent''s age at mother''s death' 
   RF74    = 'proxy or not for f74' 
   F74     = 'how many years did your mother attend school?' 
   RF81    = 'proxy or not for f81' 
   F81     = 'father alive or not' 
   RF821   = 'proxy or not for f821' 
   F821    = 'father''s age if alive' 
   RF822   = 'proxy or not for f822' 
   F822    = 'father''s age at death' 
   RF83    = 'proxy or not for f83' 
   F83     = 'respondent''s age at father''s death' 
   RF84    = 'proxy or not for f84' 
   F84     = 'father''s main occupation before age 60' 
   RF85    = 'proxy or not for f85' 
   F85     = 'father''s main occupation in your childhood' 
   RF86    = 'proxy or not for f86' 
   F86     = 'years of schooling your father received' 
   RF91    = 'proxy or not for f91' 
   F91     = 'birth order of respondent' 
   RF92A   = 'proxy or not for f92a1 to f92a7' 
   F92A1   = 'birth order of the 1st sibling' 
   F92A2   = 'sex of the 1st sibling' 
   F92A3   = 'the 1st sibling alive or not' 
   F92A4   = 'f92a4 sibling''s age at present if alive, or age at death if died' 
   F92A5   = 'f92a5 residence distance' 
   F92A6   = 'f92a6 frequent visits' 
   F92A7   = 'contact with the 1st sibling' 
   RF92B   = 'proxy or not for f92b1 to f92b7' 
   F92B1   = 'birth order of the 2nd sibling' 
   F92B2   = 'sex of the 2nd sibling' 
   F92B3   = 'the 2nd sibling alive or not' 
   F92B4   = 'f92b4 sibling''s age at present if alive, or age at death if died' 
   F92B5   = 'f92b5 residence distance' 
   F92B6   = 'f92b6 frequent visits' 
   F92B7   = 'contact with the 2nd sibling' 
   RF92C   = 'proxy or not for f92c1 to f92c7' 
   F92C1   = 'birth order of the 3rd sibling' 
   F92C2   = 'sex of the 3rd sibling' 
   F92C3   = 'the 3rd sibling alive or not' 
   F92C4   = 'f92c4 sibling''s age at present if alive, or age at death if died' 
   F92C5   = 'f92c5 residence distance' 
   F92C6   = 'f92c6 frequent visits' 
   F92C7   = 'contact with the 3rd sibling' 
   RF92D   = 'proxy or not for f92d1 to f92d7' 
   F92D1   = 'birth order of the 4th sibling' 
   F92D2   = 'sex of the 4th sibling' 
   F92D3   = 'the 4th sibling alive or not' 
   F92D4   = 'f92d4 sibling''s age at present if alive, or age at death if died' 
   F92D5   = 'f92d5 residence distance' 
   F92D6   = 'f92d6 frequent visits' 
   F92D7   = 'contact with the 4th sibling' 
   RF92E   = 'proxy or not for f92e1 to f92e7' 
   F92E1   = 'birth order of the 5th sibling' 
   F92E2   = 'sex of the 5th sibling' 
   F92E3   = 'the 5th sibling alive or not' 
   F92E4   = 'f92e4 sibling''s age at present if alive, or age at death if died' 
   F92E5   = 'f92e5 residence distance' 
   F92E6   = 'f92e6 frequent visits' 
   F92E7   = 'contact with the 5th sibling' 
   RF92F   = 'proxy or not for f92f1 to f92f7' 
   F92F1   = 'birth order of the 6th sibling' 
   F92F2   = 'sex of the 6th sibling' 
   F92F3   = 'the 6th sibling alive or not' 
   F92F4   = 'f92f4 sibling''s age at present if alive, or age at death if died' 
   F92F5   = 'f92f5 residence distance' 
   F92F6   = 'f92f6 frequent visits' 
   F92F7   = 'contact with the 6th sibling' 
   RF92G   = 'proxy or not for f92g1 to f92g7' 
   F92G1   = 'birth order of the 7th sibling' 
   F92G2   = 'sex of the 7th sibling' 
   F92G3   = 'the 7th sibling alive or not' 
   F92G4   = 'f92g4 sibling''s age at present if alive, or age at death if died' 
   F92G5   = 'f92g5 residence distance' 
   F92G6   = 'f92g6 frequent visits' 
   F92G7   = 'contact with the 7th sibling' 
   RF92H   = 'proxy or not for f92h1 to f92h7' 
   F92H1   = 'birth order of the 8th sibling' 
   F92H2   = 'sex of the 8th sibling' 
   F92H3   = 'the 8th sibling alive or not' 
   F92H4   = 'f92h4 sibling''s age at present if alive, or age at death if died' 
   F92H5   = 'f92h5 residence distance' 
   F92H6   = 'f92h6 frequent visits' 
   F92H7   = 'contact with the 8th sibling' 
   RF92I   = 'proxy or not for f92i1 to f92i7' 
   F92I1   = 'birth order of the 9th sibling' 
   F92I2   = 'sex of the 9th sibling' 
   F92I3   = 'the 9th sibling alive or not' 
   F92I4   = 'f92i4 sibling''s age at present if alive, or age at death if died' 
   F92I5   = 'f92i5 residence distance' 
   F92I6   = 'f92i6 frequent visits' 
   F92I7   = 'contact with the 9th sibling' 
   RF92J   = 'proxy or not for f92j1 to f92j7' 
   F92J1   = 'birth order of the 10th sibling' 
   F92J2   = 'sex of the 10th sibling' 
   F92J3   = 'the 10th sibling alive or not' 
   F92J4   = 'f92j4 sibling''s age at present if alive, or age at death if died' 
   F92J5   = 'f92j5 residence distance' 
   F92J6   = 'f92j6 frequent visits' 
   F92J7   = 'contact with the 10th sibling' 
   JIGE    = 'number of siblings alive who are 80+ years old' 
   RF10    = 'proxy or not for f10 and f10a' 
   F10     = 'number of children ever born' 
   F10A    = 'number of male children ever born' 
   RF101   = 'proxy or not for f101' 
   F101    = 'age at first birth' 
   RF102   = 'proxy or not for f102' 
   F102    = 'age at last birth' 
   RF103A  = 'proxy or not for f103a1 to f103a8' 
   F103A8  = '1st child is biological or not?' 
   F103A1  = 'sex of the 1st child' 
   F103A2  = 'the 1st child alive or not' 
   F103A3  = 'the 1st child''s age at present if alive, or age the child would be if s/he alive' 
   F103A4  = 'frequent visits of the 1st child' 
   F103A7  = 'contact with the 1st child' 
   F103A5  = 'residence distance of the 1st child' 
   RF103B  = 'proxy or not for f103b1 to f103b8' 
   F103B8  = '2nd child is biological or not?' 
   F103B1  = 'sex of the 2nd child' 
   F103B2  = 'the 2nd child alive or not' 
   F103B3  = 'the 2nd child''s age at present if alive, or age the child would be if s/he alive' 
   F103B4  = 'frequent visits of the 2nd child' 
   F103B7  = 'contact with the 2nd child' 
   F103B5  = 'residence distance of the 2nd child' 
   RF103C  = 'proxy or not for f103c1 to f103c8' 
   F103C8  = '3rd child is biological or not?' 
   F103C1  = 'sex of the 3rd child' 
   F103C2  = 'the 3rd child alive or not' 
   F103C3  = 'the 3rd child''s age at present if alive, or age the child would be if s/he alive' 
   F103C4  = 'frequent visits of the 3rd child' 
   F103C7  = 'contact with the 3rd child' 
   F103C5  = 'residence distance of the 3rd child' 
   RF103D  = 'proxy or not for f103d1 to f103d8' 
   F103D8  = '4th child is biological or not?' 
   F103D1  = 'sex of the 4th child' 
   F103D2  = 'the 4th child alive or not' 
   F103D3  = 'the 4th child''s age at present if alive, or age the child would be if s/he alive' 
   F103D4  = 'frequent visits of the 4th child' 
   F103D7  = 'contact with the 4th child' 
   F103D5  = 'residence distance of the 4th child' 
   RF103E  = 'proxy or not for f103e1 to f103e8' 
   F103E8  = '5th child is biological or not?' 
   F103E1  = 'sex of the 5th child' 
   F103E2  = 'the 5th child alive or not' 
   F103E3  = 'the 5th child''s age at present if alive, or age the child would be if s/he alive' 
   F103E4  = 'frequent visits of the 5th child' 
   F103E7  = 'contact with the 5th child' 
   F103E5  = 'residence distance of the 5th child' 
   RF103F  = 'proxy or not for f103f1 to f103f8' 
   F103F8  = '6th child is biological or not?' 
   F103F1  = 'sex of the 6th child' 
   F103F2  = 'the 6th child alive or not' 
   F103F3  = 'the 6th child''s age at present if alive, or age the child would be if s/he alive' 
   F103F4  = 'frequent visits of the 6th child' 
   F103F7  = 'contact with the 6th child' 
   F103F5  = 'residence distance of the 6th child' 
   RF103G  = 'proxy or not for f103g1 to f103g8' 
   F103G8  = '7th child is biological or not?' 
   F103G1  = 'sex of the 7th child' 
   F103G2  = 'the 7th child alive or not' 
   F103G3  = 'the 7th child''s age at present if alive, or age the child would be if s/he alive' 
   F103G4  = 'frequent visits of the 7th child' 
   F103G7  = 'contact with the 7th child' 
   F103G5  = 'residence distance of the 7th child' 
   RF103H  = 'proxy or not for f103h1 to f103h8' 
   F103H8  = '8th child is biological or not?' 
   F103H1  = 'sex of the 8th child' 
   F103H2  = 'the 8th child alive or not' 
   F103H3  = 'the 8th child''s age at present if alive, or age the child would be if s/he alive' 
   F103H4  = 'frequent visits of the 8th child' 
   F103H7  = 'contact with the 8th child' 
   F103H5  = 'residence distance of the 8th child' 
   RF103I  = 'proxy or not for f103i1 to f103i8' 
   F103I8  = '9th child is biological or not?' 
   F103I1  = 'sex of the 9th child' 
   F103I2  = 'the 9th child alive or not' 
   F103I3  = 'the 9th child''s age at present if alive, or age the child would be if s/he alive' 
   F103I4  = 'frequent visits of the 9th child' 
   F103I7  = 'contact with the 9th child' 
   F103I5  = 'residence distance of the 9th child' 
   RF103J  = 'proxy or not for f103j1 to f103j8' 
   F103J8  = '10th child is biological or not?' 
   F103J1  = 'sex of the 10th child' 
   F103J2  = 'the 10th child alive or not' 
   F103J3  = 'the 10th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103J4  = 'frequent visits of the 10th child' 
   F103J7  = 'contact with the 10th child' 
   F103J5  = 'residence distance of the 10th child' 
   RF103K  = 'proxy or not for f103k1 to f103k8' 
   F103K8  = '11th child is biological or not?' 
   F103K1  = 'sex of the 11th child' 
   F103K2  = 'the 11th child alive or not' 
   F103K3  = 'the 11th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103K4  = 'frequent visits of the 11th child' 
   F103K7  = 'contact with the 11th child' 
   F103K5  = 'residence distance of the 11th child' 
   RF103L  = 'proxy or not for f103l1 to f103l8' 
   F103L8  = '12th child is biological or not?' 
   F103L1  = 'sex of the 12th child' 
   F103L2  = 'the 12th child alive or not' 
   F103L3  = 'the 12th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103L4  = 'frequent visits of the 12th child' 
   F103L7  = 'contact with the 12th child' 
   F103L5  = 'residence distance of the 12th child' 
   RF103M  = 'proxy or not for f103m1 to f103m8' 
   F103M8  = '13th child is biological or not?' 
   F103M1  = 'sex of the 13th child' 
   F103M2  = 'the 13th child alive or not' 
   F103M3  = 'the 13th child''s age at present if alive, or age the child would be if s/he aliv' 
   F103M4  = 'frequent visits of the 13th child' 
   F103M7  = 'contact with the 13th child' 
   F103M5  = 'residence distance of the 13th child' 
   RF104   = 'proxy or not for f104' 
   F104    = 'age of the oldest son alive at present' 
   RF105   = 'proxy or not for f105' 
   F105    = 'age of the youngest son alive at present' 
   F111A   = 'the first person to whom you usually talk frequently in daily life' 
   F111B   = 'the second person to whom you usually talk frequently in daily life' 
   F111C   = 'the third person to whom you usually talk frequently in daily life' 
   F112A   = '1st person to whom you talk first when you need to share your thoughts' 
   F112B   = '2nd person to whom you talk first when you need to share your thoughts' 
   F112C   = '3rd person to whom you talk first when you need to share your thoughts' 
   F113A   = '1st person you ask for help when you have problem/difficulties' 
   F113B   = '2nd person you ask for help when you have problem/difficulties' 
   F113C   = '3rd person you ask for help when you have problem/difficulties' 
   RF12    = 'proxy or not for f12a to f12c' 
   F12A    = 'how much did you receive from your son(s) or daughter(s)-in-law last year?' 
   F12B    = 'how much did you receive from your daughter(s) or son(s)-in-law last year?' 
   F12C    = 'how much did you receive from your grandchild(ren) last year?' 
   RF13    = 'proxy or not for f13a to f13c' 
   F13A    = 'how much did you give to your son(s) or daughter(s)-in-law last year?' 
   F13B    = 'how much did you give to your daughter(s) or son(s)-in-law last year?' 
   F13C    = 'how much did you give to your grandchild(ren)in last year?' 
   RF14    = 'proxy or not for f14' 
   F141    = 'are personal care services available in your community?' 
   F142    = 'are home visit services available in your community?' 
   F143    = 'are psychological consulting services available in your community?' 
   F144    = 'are daily shopping services available in your community?' 
   F145    = 'are social and recreation services available in your community?' 
   F146    = 'are legal aid services available in your community?' 
   F147    = 'are healthcare education services available in your community?' 
   F148    = 'are neighborhood-relation services available in your community?' 
   F149    = 'are any other social services available in your community?' 
   RF15    = 'proxy or not for f15' 
   F151    = 'do you expect your community to provide personal care services?' 
   F152    = 'do you expect your community to provide home visit services?' 
   F153    = 'do you expect your community to provide psychological consulting services?' 
   F154    = 'do you expect your community to provide daily shopping services?' 
   F155    = 'do you expect your community to provide social and recreation activities?' 
   F156    = 'do you expect your community provide legal aid services?' 
   F157    = 'do you expect your community to provide healthcare education service?' 
   F158    = 'do you expect your community to provide neighborhood-relation services?' 
   F159    = 'do you expect your community to provide other social services?' 
   F16     = 'what kind of living arrangement do you like best?' 
   RG01    = 'proxy or not for g01' 
   G01     = 'how about the quality of your sleep?' 
   RG02    = 'proxy or not for g02' 
   G02     = 'how long do you sleep normally?' 
   RG1     = 'proxy or not for g1' 
   G1      = 'visual function: can you see the break in the circle?' 
   G1A     = 'if so, where is the break located?' 
   RG21    = 'proxy or not for g21' 
   G21     = 'number of natural teeth' 
   RG22    = 'proxy or not for g22' 
   G22     = 'have false teeth?' 
   RG23    = 'proxy or not for g23' 
   G23     = 'how often do you brush your teeth every day?' 
   RG24    = 'proxy or not for g24' 
   G24     = 'during the past 6 months, did you have a toothache more than once?' 
   RG24A   = 'proxy or not for g24a' 
   G24A    = 'g24a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG25    = 'proxy or not for g25' 
   G25     = 'during the past 6 months, did you have pain in jaw joint or so more than once?' 
   RG25A   = 'proxy or not for g25a' 
   G25A    = 'g25a on a scale of 1-10, 1 mild and 10 severe, how would you rate this pain?' 
   RG3     = 'proxy or not for g3' 
   G3      = 'able to use chopsticks to eat?' 
   RG4     = 'proxy or not for g4' 
   G4      = 'which hand do you normally use for eating?' 
   RG4A    = 'proxy or not for g4a' 
   G4A     = 'which hand do you normally use for writing?' 
   RG4B    = 'proxy or not for g4b' 
   G4B     = 'which hand do you normally use for brushing your teeth?' 
   RG5     = 'proxy or not for g5' 
   G511    = 'blood pressure test for the 1st time: systolic' 
   G512    = 'blood pressure test for the 1st time: diastolic' 
   G521    = 'blood pressure test for the 2nd time: systolic' 
   G522    = 'blood pressure test for the 2nd time: diastolic' 
   G6      = 'rhythm of heart' 
   G7      = 'heart rate (in beats/min)' 
   G81     = 'hand behind neck' 
   G82     = 'hand behind lower back' 
   G83     = 'hold-up arms' 
   G9      = 'able to stand up from sitting in a chair?' 
   G101    = 'weight (kilograms)' 
   G1011   = 'calf curcumference (cm)' 
   G102    = 'is the participant hunchbacked?' 
   G1021   = 'directly measured height of the interviewee' 
   G122    = 'height measured from top of the right arm bone to top of the right shoulder' 
   G123    = 'height measured from the right knee joint to the ground' 
   G102C   = 'waist circumference' 
   RG106   = 'proxy or not for g106' 
   G106    = 'do you have any difficulty with your hearing?' 
   RG1061  = 'proxy or not for g1061' 
   G1061   = 'in which ear(s) do you have a hearing difficulty?' 
   RG1062  = 'proxy or not for g1062' 
   G1062   = 'at what age did you first notice a hearing difficulty?' 
   RG1063  = 'proxy or not for g1063' 
   G1063   = 'how quickly did your hearing difficulty develop?' 
   G11     = 'able to pick up a book from the floor?' 
   G12     = 'steps used to turn around 360 with help?' 
   RG130   = 'proxy or not for g130' 
   G130    = 'feel not-well within the past two weeks?' 
   RG13    = 'with proxy or not for g131' 
   G131    = '# of times suffering from serious illness within the past two years' 
   G132    = '# of times in hospitals' 
   RG14A   = 'with proxy or not for g14a1 and g14a2' 
   G14A1   = 'name of disease suffered at 1st hospital visit' 
   G14A2   = '1st time, number of days in hospital or bedridden' 
   G141T   = 'the name of other diseases beyond g14a1 at the first time' 
   RG14B   = 'with proxy or not for g14b1 and g14b2' 
   G14B1   = 'name of disease suffered at 2nd hospital visit' 
   G14B2   = '2nd time, number of days in hospital or bedridden' 
   G142T   = 'the name of other diseases beyond g14b1 at the second time' 
   RG14C   = 'with proxy or not for g14c1 and g14c2' 
   G14C1   = 'name of disease suffered at the last hospital visit' 
   G14C2   = 'last time, days in hospital or bedridden' 
   G143T   = 'the name of other diseases beyond g14c1 at the last time' 
   G15A1   = 'suffering from hypertension?' 
   G15A2   = 'g15a2 diagnosed by hospital?' 
   G15A3   = 'g15a3 disability in daily life' 
   G15B1   = 'suffering from diabetes?' 
   G15B2   = 'g15b2 diagnosed by hospital?' 
   G15B3   = 'g15b3 disability in daily life' 
   G15C1   = 'suffering from heart disease?' 
   G15C2   = 'g15c2 diagnosed by hospital?' 
   G15C3   = 'g15c3 disability in daily life' 
   G15D1   = 'suffering from stroke or cvd?' 
   G15D2   = 'g15d2 diagnosed by hospital?' 
   G15D3   = 'g15d3 disability in daily life' 
   G15E1   = 'suffering from bronchitis, emphysema, pneumonia, asthma?' 
   G15E2   = 'g15e2 diagnosed by hospital?' 
   G15E3   = 'g15e3 disability in daily life' 
   G15F1   = 'suffering from tuberculosis?' 
   G15F2   = 'g15f2 diagnosed by hospital?' 
   G15F3   = 'g15f3 disability in daily life' 
   G15G1   = 'suffering from cataract?' 
   G15G2   = 'g15g2 diagnosed by hospital?' 
   G15G3   = 'g15g3 disability in daily life' 
   G15H1   = 'suffering from glaucoma?' 
   G15H2   = 'g15h2 diagnosed by hospital?' 
   G15H3   = 'g15h3 disability in daily life' 
   G15I1   = 'suffering from cancer?' 
   G15I2   = 'g15i2 diagnosed by hospital?' 
   G15I3   = 'g15i3 disability in daily life' 
   G15J1   = 'suffering from prostate tumor?' 
   G15J2   = 'g15j2 diagnosed by hospital?' 
   G15J3   = 'g15j3 disability in daily life' 
   G15K1   = 'suffering from gastric or duodenal ulcer?' 
   G15K2   = 'g15k2 diagnosed by hospital?' 
   G15K3   = 'g15k3 disability in daily life' 
   G15L1   = 'suffering from parkinson''s disease?' 
   G15L2   = 'g15l2 diagnosed by hospital?' 
   G15L3   = 'g15l3 disability in daily life' 
   G15M1   = 'suffering from bedsore?' 
   G15M2   = 'g15m2 diagnosed by hospital?' 
   G15M3   = 'g15m3 disability in daily life' 
   G15N1   = 'suffering from arthritis?' 
   G15N2   = 'g15n2 diagnosed by hospital?' 
   G15N3   = 'g15n3 disability in daily life' 
   G15O1   = 'suffering from dementia?' 
   G15O2   = 'g15o2 diagnosed by hospital?' 
   G15O3   = 'g15o3 disability in daily life' 
   G15P1   = 'suffering from epilepsy?' 
   G15P2   = 'g15p2 diagnosed by hospital?' 
   G15P3   = 'g15p3 disability in daily life' 
   G15Q1   = 'suffering from cholecystitis, cholelith disease?' 
   G15Q2   = 'g15q2 diagnosed by hospital?' 
   G15Q3   = 'g15q3 disability in daily life' 
   G15R1   = 'suffering from blood disease?' 
   G15R2   = 'g15r2 diagnosed by hospital?' 
   G15R3   = 'g15r3 disability in daily life' 
   G15N1A  = 'suffering from rheumatism or rheumatoid disease?' 
   G15N2A  = 'g15n2a diagnosed by hospital?' 
   G15N3A  = 'g15n3a disability in daily life' 
   G15S1   = 'suffering from chronic nephritis?' 
   G15S2   = 'g15s2 diagnosed by hospital?' 
   G15S3   = 'g15s3 disability in daily life' 
   G15T1   = 'suffering from galactophore disease?' 
   G15T2   = 'g15t2 diagnosed by hospital?' 
   G15T3   = 'g15t3 disability in daily life' 
   G15U1   = 'suffering from uterine tumor?' 
   G15U2   = 'g15u2 diagnosed by hospital?' 
   G15U3   = 'g15u3 disability in daily life' 
   G15J1A  = 'suffering from hyperplasia of prostate gland?' 
   G15J2A  = 'g15j2a diagnosed by hospital?' 
   G15J3A  = 'g15j3a disability in daily life' 
   G15V1   = 'suffering from hepatitis?' 
   G15V2   = 'g15v2 diagnosed by hospital?' 
   G15V3   = 'g15v3 disability in daily life' 
   G15Y2   = 'g15y2 diagnosed by hospital?' 
   G15Y3   = 'g15y3 disability in daily life' 
   H1      = 'was interviewee able to hear?' 
   H21     = 'did interviewee able to participate in physical check?' 
   H22     = 'the reason for inability to participate in physical check' 
   H3      = 'the health of interviewee rated by interviewer' 
   H5      = 'confirm the age and copy to the 1st page' 
   H6      = 'has interviewer checked for failure to ask a question?' 
   H7      = 'did anyone help the interviewee to answer question' 
   H71     = 'who helped the interviewee to answer questions?' 
   W_2014  = 'weight variable, based on age-sex-residence-specific distrib of 2010 census' 
        ; 


* SAS FORMAT STATEMENT;

/*
   FORMAT
         A1 a1ffffff. A2 a2ffffff. A41 a41fffff.
         A42 a42fffff. A43 a43fffff. A51 a51fffff.
         A52 a52fffff. A530 a530ffff. A531 a531ffff.
         A532 a532ffff. A533 a533ffff. A534 a534ffff.
         A535 a535ffff. A536 a535ffff. A537 a537ffff.
         A53A1 a53a1fff. A53A2 a53a2fff. A53A3 a53a3fff.
         A53A4 a53a4fff. A53A5 a53a5fff. A53B1 a53a1fff.
         A53B2 a53a2fff. A53B3 a53a3fff. A53B4 a53a4fff.
         A53B5 a53a5fff. A53C1 a53a1fff. A53C2 a53a2fff.
         A53C3 a53a3fff. A53C4 a53a4fff. A53C5 a53a5fff.
         A53D1 a53a1fff. A53D2 a53a2fff. A53D3 a53a3fff.
         A53D4 a53a4fff. A53D5 a53a5fff. A53E1 a53a1fff.
         A53E2 a53a2fff. A53E3 a53a3fff. A53E4 a53a4fff.
         A53E5 a53a5fff. A53F1 a53a1fff. A53F2 a53a2fff.
         A53F3 a53a3fff. A53F4 a53a4fff. A53F5 a53a5fff.
         A53G1 a53a1fff. A53G2 a53a2fff. A53G3 a53a3fff.
         A53G4 a53a4fff. A53G5 a53a5fff. A53H1 a53a1fff.
         A53H2 a53a2fff. A53H3 a53a3fff. A53H4 a53a4fff.
         A53H5 a53a5fff. A53I1 a53a1fff. A53I2 a53a2fff.
         A53I3 a53a3fff. A53I4 a53a4fff. A53I5 a53a5fff.
         A53J1 a53a1fff. A53J2 a53a2fff. A53J3 a53a3fff.
         A53J4 a53a4fff. A53J5 a53a5fff. A540 a540ffff.
         A541 a541ffff. A542 a542ffff. A54A a54affff.
         A54B a54bffff. B11 b11fffff. B12 b11fffff.
         B121 b121ffff. B21 b21fffff. B210 b210ffff.
         B22 b21fffff. B23 b21fffff. B24 b21fffff.
         B25 b21fffff. B26 b21fffff. B27 b21fffff.
         B28 b28fffff. B29 b28fffff. C11 c11fffff.
         C12 c11fffff. C13 c11fffff. C14 c11fffff.
         C15 c11fffff. C16 c16fffff. C21A c11fffff.
         C21B c11fffff. C21C c11fffff. C22 c22fffff.
         C31A c11fffff. C31B c11fffff. C31C c11fffff.
         C31D c31dffff. C31E c11fffff. C32 c32fffff.
         C41A c11fffff. C41B c11fffff. C41C c11fffff.
         C51A c11fffff. C51B c11fffff. C52 c11fffff.
         C53A c53affff. C53B c53affff. C53C c53affff.
         C54 c54fffff. C55 c55fffff. D1 d1ffffff.
         D101 d91fffff. D102 a53a3fff. D103 a53a3fff.
         D11A d11affff. D11B d11bffff. D11C d11cffff.
         D11D d11bffff. D11E d11bffff. D11F d11cffff.
         D11G d11affff. D11H d11cffff. D12 a54bffff.
         D31 d31fffff. D32 d32fffff. D33 d33fffff.
         D34 d34fffff. D4A d4afffff. D4ALGA1 d4meat2f.
         D4ALGA2 d4meat2f. D4B d4bfffff. D4BEAN1 d4meat2f.
         D4BEAN2 d4meat2f. D4DRUG1 d4drug1f. D4DRUG2 d4drug1f.
         D4EGG1 d4meat2f. D4EGG2 d4meat2f. D4FISH1 d4meat2f.
         D4FISH2 d4meat2f. D4GARL1 d4meat2f. D4GARL2 d4meat2f.
         D4MEAT1 d4meat2f. D4MEAT2 d4meat2f. D4MILK1 d4meat2f.
         D4MILK2 d4meat2f. D4NUT1 d4meat2f. D4NUT2 d4meat2f.
         D4SUGA1 d4meat2f. D4SUGA2 d4meat2f. D4TEA1 d4meat2f.
         D4TEA2 d4meat2f. D4VEG1 d4meat2f. D4VEG2 d4meat2f.
         D4VIT1 d4meat2f. D4VIT2 d4meat2f. D5 d5ffffff.
         D6A d6afffff. D6B d6afffff. D6C d6afffff.
         D71 d71fffff. D710 a535ffff. D710A a52fffff.
         D710B a52fffff. D72 d71fffff. D73 a53a3fff.
         D74 a53a3fff. D75 a53a5fff. D76 d76fffff.
         D77 d77fffff. D78 a535ffff. D78A a52fffff.
         D78B a52fffff. D79 a535ffff. D79A a52fffff.
         D79B a52fffff. D81 a535ffff. D82 a535ffff.
         D83 a53a3fff. D84 a53a3fff. D85 d85fffff.
         D86 a53a5fff. D87 a535ffff. D91 d91fffff.
         D92 d91fffff. D93 a53a3fff. D94 a53a3fff.
         E0 e0ffffff. E1 e1ffffff. E10 e7ffffff.
         E11 e7ffffff. E12 e12fffff. E13 e7ffffff.
         E14 e12fffff. E1B e1bfffff. E2 e2ffffff.
         E2B e1bfffff. E3 e3ffffff. E3B e1bfffff.
         E4 e4ffffff. E4B e1bfffff. E5 e5ffffff.
         E5B e1bfffff. E6 e6ffffff. E610 e610ffff.
         E62 e62fffff. E63 e63fffff. E64 e64fffff.
         E65 e65fffff. E67 e67fffff. E6B e6bfffff.
         E7 e7ffffff. E8 e7ffffff. E9 e7ffffff.
         F1 a54bffff. F10 a54bffff. F101 a53a5fff.
         F102 a53a5fff. F103A1 a53a2fff. F103A2 f103a2ff.
         F103A3 a53a3fff. F103A4 f92a3fff. F103A5 f103a5ff.
         F103A7 f92a3fff. F103A8 f92a3fff. F103B1 a53a2fff.
         F103B2 f103a2ff. F103B3 a53a3fff. F103B4 f92a3fff.
         F103B5 f103a5ff. F103B7 f92a3fff. F103B8 f92a3fff.
         F103C1 a53a2fff. F103C2 f103a2ff. F103C3 a53a3fff.
         F103C4 f92a3fff. F103C5 f103a5ff. F103C7 f92a3fff.
         F103C8 f92a3fff. F103D1 a53a2fff. F103D2 f103a2ff.
         F103D3 a53a3fff. F103D4 f92a3fff. F103D5 f103a5ff.
         F103D7 f92a3fff. F103D8 f92a3fff. F103E1 a53a2fff.
         F103E2 f103a2ff. F103E3 a53a3fff. F103E4 f92a3fff.
         F103E5 f103a5ff. F103E7 f92a3fff. F103E8 f92a3fff.
         F103F1 a53a2fff. F103F2 f103a2ff. F103F3 a53a3fff.
         F103F4 f92a3fff. F103F5 f103a5ff. F103F7 f92a3fff.
         F103F8 f92a3fff. F103G1 a53a2fff. F103G2 f103a2ff.
         F103G3 a53a3fff. F103G4 f92a3fff. F103G5 f103a5ff.
         F103G7 f92a3fff. F103G8 f92a3fff. F103H1 a53a2fff.
         F103H2 f103a2ff. F103H3 a53a3fff. F103H4 f92a3fff.
         F103H5 f103a5ff. F103H7 f92a3fff. F103H8 f92a3fff.
         F103I1 a53a2fff. F103I2 f103a2ff. F103I3 a53a3fff.
         F103I4 f92a3fff. F103I5 f103a5ff. F103I7 f92a3fff.
         F103I8 f92a3fff. F103J1 a53a2fff. F103J2 f103a2ff.
         F103J3 a53a3fff. F103J4 f92a3fff. F103J5 f103a5ff.
         F103J7 f92a3fff. F103J8 f92a3fff. F103K1 a53a2fff.
         F103K2 f103a2ff. F103K3 a53a3fff. F103K4 f92a3fff.
         F103K5 f103a5ff. F103K7 f92a3fff. F103K8 f92a3fff.
         F103L1 a53a2fff. F103L2 f103a2ff. F103L3 a53a3fff.
         F103L4 f92a3fff. F103L5 f103a5ff. F103L7 f92a3fff.
         F103L8 f92a3fff. F103M1 a53a2fff. F103M2 f103a2ff.
         F103M3 a53a3fff. F103M4 f92a3fff. F103M5 f103a5ff.
         F103M7 f92a3fff. F103M8 f92a3fff. F104 f104ffff.
         F105 f104ffff. F10A a53a5fff. F111A f111afff.
         F111B f111afff. F111C f111afff. F112A f111afff.
         F112B f111afff. F112C f111afff. F113A f111afff.
         F113B f111afff. F113C f111afff. F12A f12affff.
         F12B f12affff. F12C f12affff. F13A f12affff.
         F13B f12affff. F13C f12affff. F141 f141ffff.
         F142 f141ffff. F143 f141ffff. F144 f141ffff.
         F145 f141ffff. F146 f141ffff. F147 f141ffff.
         F148 f141ffff. F149 f141ffff. F151 b28fffff.
         F152 b28fffff. F153 b28fffff. F154 b28fffff.
         F155 b28fffff. F156 b28fffff. F157 b28fffff.
         F158 b28fffff. F159 b28fffff. F16 f16fffff.
         F2 f2ffffff. F21 f21fffff. F211 f211ffff.
         F22 f22fffff. F221 f221ffff. F23 a532ffff.
         F24 a535ffff. F25A1 f25a1fff. F25A2 f25a1fff.
         F25B1 f25b1fff. F25B2 a52fffff. F26 f26fffff.
         F27 f27fffff. F31 f31fffff. F32A f32affff.
         F32B f32affff. F32C f32affff. F32D f32affff.
         F32E f32affff. F33 a532ffff. F34 f34fffff.
         F340 f340ffff. F35 f35fffff. F41 f41fffff.
         F41A1 a535ffff. F41A11 a534ffff. F41A12 f41a12ff.
         F41A2 a535ffff. F41A21 a534ffff. F41A22 f41a12ff.
         F41A3 a535ffff. F41A31 a534ffff. F41A32 f41a12ff.
         F41B a535ffff. F41B1 a534ffff. F41B2 f41a12ff.
         F42 a53a5fff. F43A1 a53a3fff. F43A2 f43a2fff.
         F43A3 a53a3fff. F43A4 f43a4fff. F43B1 a53a3fff.
         F43B2 f43a2fff. F43B3 a53a3fff. F43B4 f43a4fff.
         F43C1 a53a3fff. F43C2 f43a2fff. F43C3 a53a3fff.
         F43C4 f43a4fff. F43D1 a53a3fff. F43D2 f43a2fff.
         F43D3 a53a3fff. F43D4 f43a4fff. F44 a53a5fff.
         F45 f45fffff. F46 f46fffff. F47 f47fffff.
         F5_11 f5_11fff. F61 a535ffff. F610 f610ffff.
         F62 f62fffff. F63 f62fffff. F64A f64affff.
         F64B f64affff. F64C f64affff. F64D f64affff.
         F64E f64affff. F64F f64affff. F64G f64affff.
         F64H f64affff. F64I f64affff. F651A1 f35fffff.
         F651A2 f35fffff. F651B1 f35fffff. F651B2 f35fffff.
         F6521 f6521fff. F652B a535ffff. F66 d91fffff.
         F71 d91fffff. F721 a53a3fff. F722 a53a3fff.
         F73 a53a3fff. F74 a54bffff. F81 d91fffff.
         F821 a53a3fff. F822 a53a3fff. F83 a53a3fff.
         F84 f84fffff. F85 f84fffff. F86 a54bffff.
         F91 a54bffff. F92A1 a53a5fff. F92A2 a53a2fff.
         F92A3 f92a3fff. F92A4 a53a3fff. F92A5 f92a5fff.
         F92A6 f92a3fff. F92A7 f92a3fff. F92B1 a53a5fff.
         F92B2 a53a2fff. F92B3 f92a3fff. F92B4 a53a3fff.
         F92B5 f92a5fff. F92B6 f92a3fff. F92B7 f92a3fff.
         F92C1 a53a5fff. F92C2 a53a2fff. F92C3 f92a3fff.
         F92C4 a53a3fff. F92C5 f92a5fff. F92C6 f92a3fff.
         F92C7 f92a3fff. F92D1 a53a5fff. F92D2 a53a2fff.
         F92D3 f92a3fff. F92D4 a53a3fff. F92D5 f92a5fff.
         F92D6 f92a3fff. F92D7 f92a3fff. F92E1 a53a5fff.
         F92E2 a53a2fff. F92E3 f92a3fff. F92E4 a53a3fff.
         F92E5 f92a5fff. F92E6 f92a3fff. F92E7 f92a3fff.
         F92F1 a53a5fff. F92F2 a53a2fff. F92F3 f92a3fff.
         F92F4 a53a3fff. F92F5 f92a5fff. F92F6 f92a3fff.
         F92F7 f92a3fff. F92G1 a53a5fff. F92G2 a53a2fff.
         F92G3 f92a3fff. F92G4 a53a3fff. F92G5 f92a5fff.
         F92G6 f92a3fff. F92G7 f92a3fff. F92H1 a53a5fff.
         F92H2 a53a2fff. F92H3 f92a3fff. F92H4 a53a3fff.
         F92H5 f92a5fff. F92H6 f92a3fff. F92H7 f92a3fff.
         F92I1 a53a5fff. F92I2 a53a2fff. F92I3 f92a3fff.
         F92I4 a53a3fff. F92I5 f92a5fff. F92I6 f92a3fff.
         F92I7 f92a3fff. F92J1 a53a5fff. F92J2 a53a2fff.
         F92J3 f92a3fff. F92J4 a53a3fff. F92J5 f92a5fff.
         F92J6 f92a3fff. F92J7 f92a3fff. G01 g01fffff.
         G02 a54bffff. G1 g1ffffff. G101 g101ffff.
         G1011 a54bffff. G102 d91fffff. G1021 g101ffff.
         G102C g102cfff. G106 d91fffff. G1061 g1061fff.
         G1062 g1062fff. G1063 g1063fff. G11 g11fffff.
         G12 g12fffff. G122 a54bffff. G123 a54bffff.
         G130 d91fffff. G131 g131ffff. G132 g132ffff.
         G14A1 g14a1fff. G14A2 g14a2fff. G14B1 g14a1fff.
         G14B2 g14a2fff. G14C1 g14a1fff. G14C2 g14a2fff.
         G15A1 g15a1fff. G15A2 g15a1fff. G15A3 g15a3fff.
         G15B1 g15a1fff. G15B2 g15a1fff. G15B3 g15a3fff.
         G15C1 g15a1fff. G15C2 g15a1fff. G15C3 g15a3fff.
         G15D1 g15a1fff. G15D2 g15a1fff. G15D3 g15a3fff.
         G15E1 g15a1fff. G15E2 g15a1fff. G15E3 g15a3fff.
         G15F1 g15a1fff. G15F2 g15a1fff. G15F3 g15a3fff.
         G15G1 g15a1fff. G15G2 g15a1fff. G15G3 g15a3fff.
         G15H1 g15a1fff. G15H2 g15a1fff. G15H3 g15a3fff.
         G15I1 g15a1fff. G15I2 g15a1fff. G15I3 g15a3fff.
         G15J1 g15a1fff. G15J1A g15a1fff. G15J2 g15a1fff.
         G15J2A g15a1fff. G15J3 g15a3fff. G15J3A g15a3fff.
         G15K1 g15a1fff. G15K2 g15a1fff. G15K3 g15a3fff.
         G15L1 g15a1fff. G15L2 g15a1fff. G15L3 g15a3fff.
         G15M1 g15a1fff. G15M2 g15a1fff. G15M3 g15a3fff.
         G15N1 g15a1fff. G15N1A g15a1fff. G15N2 g15a1fff.
         G15N2A g15a1fff. G15N3 g15a3fff. G15N3A g15a3fff.
         G15O1 g15a1fff. G15O2 g15a1fff. G15O3 g15a3fff.
         G15P1 g15a1fff. G15P2 g15a1fff. G15P3 g15a3fff.
         G15Q1 g15a1fff. G15Q2 g15a1fff. G15Q3 g15a3fff.
         G15R1 g15a1fff. G15R2 g15a1fff. G15R3 g15a3fff.
         G15S1 g15a1fff. G15S2 g15a1fff. G15S3 g15a3fff.
         G15T1 g15a1fff. G15T2 g15a1fff. G15T3 g15a3fff.
         G15U1 g15a1fff. G15U2 g15a1fff. G15U3 g15a3fff.
         G15V1 g15a1fff. G15V2 g15a1fff. G15V3 g15a3fff.
         G15Y2 f26fffff. G15Y3 g15a3fff. G21 a54bffff.
         G22 d91fffff. G23 g23fffff. G24 a535ffff.
         G24A f41a12ff. G25 a535ffff. G25A f41a12ff.
         G3 d91fffff. G4 g4ffffff. G4A g4afffff.
         G4B g4bfffff. G511 g511ffff. G512 g511ffff.
         G521 g511ffff. G522 g511ffff. G6 g6ffffff.
         G7 g511ffff. G81 g81fffff. G82 g81fffff.
         G83 g81fffff. G9 g9ffffff. H1 h1ffffff.
         H21 h21fffff. H22 h22fffff. H3 h3ffffff.
         H5 h5ffffff. H6 d71fffff. H7 a535ffff.
         H71 h71fffff. JIGE a53a5fff. PROV provffff.
         RA41 ra41ffff. RA42 ra41ffff. RA43 ra41ffff.
         RA51 ra41ffff. RA52 ra41ffff. RA530 ra41ffff.
         RA531 ra41ffff. RA532 ra41ffff. RA533 ra41ffff.
         RA534 ra41ffff. RA535 ra41ffff. RA536 ra41ffff.
         RA537 ra41ffff. RA53A ra41ffff. RA53B ra41ffff.
         RA53C ra41ffff. RA53D ra41ffff. RA53E ra41ffff.
         RA53F ra41ffff. RA53G ra41ffff. RA53H ra41ffff.
         RA53I ra41ffff. RA53J ra41ffff. RA54 ra41ffff.
         RA540 ra41ffff. RA541 ra41ffff. RA542 ra41ffff.
         RD1 ra41ffff. RD101 ra41ffff. RD102 ra41ffff.
         RD103 ra41ffff. RD11A ra41ffff. RD11B ra41ffff.
         RD11C ra41ffff. RD11D ra41ffff. RD11E ra41ffff.
         RD11F ra41ffff. RD11G ra41ffff. RD11H ra41ffff.
         RD12 ra41ffff. RD2 ra41ffff. RD31 ra41ffff.
         RD32 ra41ffff. RD33 ra41ffff. RD34 ra41ffff.
         RD4ALGA ra41ffff. RD4BEAN ra41ffff. RD4DRUG ra41ffff.
         RD4EGG ra41ffff. RD4FISH ra41ffff. RD4GARL ra41ffff.
         RD4MEAT ra41ffff. RD4MILK ra41ffff. RD4NUT ra41ffff.
         RD4SUGA ra41ffff. RD4TEA ra41ffff. RD4VEG ra41ffff.
         RD4VIT ra41ffff. RD5 ra41ffff. RD6 ra41ffff.
         RD71 ra41ffff. RD710 ra41ffff. RD72 ra41ffff.
         RD73 ra41ffff. RD74 ra41ffff. RD75 ra41ffff.
         RD76 ra41ffff. RD77 ra41ffff. RD78 ra41ffff.
         RD79 ra41ffff. RD81 ra41ffff. RD82 ra41ffff.
         RD83 ra41ffff. RD84 ra41ffff. RD85 ra41ffff.
         RD86 ra41ffff. RD87 ra41ffff. RD91 rd91ffff.
         RD92 ra41ffff. RD93 ra41ffff. RD94 ra41ffff.
         RE0 ra41ffff. RE1 ra41ffff. RE10 ra41ffff.
         RE11 ra41ffff. RE12 ra41ffff. RE13 ra41ffff.
         RE14 ra41ffff. RE1B ra41ffff. RE2 ra41ffff.
         RE2B ra41ffff. RE3 ra41ffff. RE3B ra41ffff.
         RE4 ra41ffff. RE4B ra41ffff. RE5 ra41ffff.
         RE5B ra41ffff. RE6 ra41ffff. RE610 ra41ffff.
         RE62 ra41ffff. RE63 ra41ffff. RE64 ra41ffff.
         RE65 ra41ffff. RE67 ra41ffff. RE6B ra41ffff.
         RE7 ra41ffff. RE8 ra41ffff. RE9 ra41ffff.
         RESIDENC residenf. RF1 ra41ffff. RF10 ra41ffff.
         RF101 ra41ffff. RF102 ra41ffff. RF103A ra41ffff.
         RF103B ra41ffff. RF103C ra41ffff. RF103D ra41ffff.
         RF103E ra41ffff. RF103F ra41ffff. RF103G ra41ffff.
         RF103H ra41ffff. RF103I ra41ffff. RF103J ra41ffff.
         RF103K ra41ffff. RF103L ra41ffff. RF103M ra41ffff.
         RF104 ra41ffff. RF105 ra41ffff. RF12 ra41ffff.
         RF13 ra41ffff. RF14 ra41ffff. RF15 ra41ffff.
         RF2 ra41ffff. RF21 ra41ffff. RF211 ra41ffff.
         RF22 ra41ffff. RF221 ra41ffff. RF23 ra41ffff.
         RF24 ra41ffff. RF25A ra41ffff. RF25B ra41ffff.
         RF26 ra41ffff. RF27 ra41ffff. RF31 ra41ffff.
         RF32 ra41ffff. RF33 ra41ffff. RF34 ra41ffff.
         RF340 ra41ffff. RF35 ra41ffff. RF41 ra41ffff.
         RF41A ra41ffff. RF41B ra41ffff. RF42 ra41ffff.
         RF43A ra41ffff. RF43B ra41ffff. RF43C ra41ffff.
         RF43D ra41ffff. RF44 ra41ffff. RF45 ra41ffff.
         RF46 ra41ffff. RF47 ra41ffff. RF5 ra41ffff.
         RF61 ra41ffff. RF610 ra41ffff. RF62 ra41ffff.
         RF63 ra41ffff. RF64 ra41ffff. RF651A1 ra41ffff.
         RF651A2 ra41ffff. RF651B1 ra41ffff. RF651B2 ra41ffff.
         RF6521 ra41ffff. RF652A ra41ffff. RF652B ra41ffff.
         RF66 ra41ffff. RF71 ra41ffff. RF721 ra41ffff.
         RF722 ra41ffff. RF73 ra41ffff. RF74 rd91ffff.
         RF81 ra41ffff. RF821 ra41ffff. RF822 ra41ffff.
         RF83 ra41ffff. RF84 rd91ffff. RF85 rd91ffff.
         RF86 rd91ffff. RF91 ra41ffff. RF92A ra41ffff.
         RF92B ra41ffff. RF92C ra41ffff. RF92D ra41ffff.
         RF92E ra41ffff. RF92F ra41ffff. RF92G ra41ffff.
         RF92H ra41ffff. RF92I ra41ffff. RF92J ra41ffff.
         RG01 ra41ffff. RG02 ra41ffff. RG1 ra41ffff.
         RG106 ra41ffff. RG1061 ra41ffff. RG1062 ra41ffff.
         RG1063 ra41ffff. RG13 ra41ffff. RG130 ra41ffff.
         RG14A ra41ffff. RG14B ra41ffff. RG14C ra41ffff.
         RG21 ra41ffff. RG22 ra41ffff. RG23 ra41ffff.
         RG24 ra41ffff. RG24A ra41ffff. RG25 ra41ffff.
         RG25A ra41ffff. RG3 ra41ffff. RG4 ra41ffff.
         RG4A ra41ffff. RG4B ra41ffff. RG5 ra41ffff.
         TYPE typeffff.
    ;
*/

RUN ;
