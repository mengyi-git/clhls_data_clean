/*
Zeng, Yi, James Vaupel, Zhenyu Xiao, Yuzhi Liu, and Chunyuan Zhang. Chinese
Longitudinal Healthy Longevity Survey (CLHLS), 1998-2014. ICPSR36692-v1.
Ann Arbor, MI: Inter-university Consortium for Political and Social
Research [distributor], 2017-04-11. http://doi.org/10.3886/ICPSR36692.v1

*/


/* delete all the files in the work library */
proc datasets library=work kill;
run;
quit;

/* CHANGE ROOT DIRECTORY */
%let DIR = C:\Users\;

/* DOWNLOAD THE RAW DATA FROM http://doi.org/10.3886/ICPSR36692.v1 */
/* WHERE THE RAW DATA IS STORED */
%let VERSION = &DIR\ICPSR36692-v1;

/* WORKING DIRECTORY */
%let myfolder = &DIR\ICPSR36692-v1-setup;

%let YEAR1 = 1998;
%let YEAR2 = 2000;
%let YEAR3 = 2002;
%let YEAR4 = 2005;
%let YEAR5 = 2008;
%let YEAR6 = 2011;
%let YEAR7 = 2014;

%let firstwv = 1;
%let lastwv = 7;

libname clhls "&myfolder";

/*======================*/
/* INPUT THE TEXT FILES */
/*======================*/

/* The code in this block is downloaded from http://doi.org/10.3886/ICPSR36692.v1 
	with minor changes in the DATA and INFILE statement */
%include "&myfolder\setup\36692-0001-Setup.sas";
%include "&myfolder\setup\36692-0002-Setup.sas";
%include "&myfolder\setup\36692-0003-Setup.sas";
%include "&myfolder\setup\36692-0004-Setup.sas";
%include "&myfolder\setup\36692-0005-Setup.sas";
%include "&myfolder\setup\36692-0006-Setup.sas";
%include "&myfolder\setup\36692-0007-Setup.sas";

/*=============================*/
/* END OF INPUT THE TEXT FILES */
/*=============================*/





/*=============================================================*/
/* PICK THE IDs THAT JOIN IN &&Year&i AND MERGE WITH data000&i */
/*=============================================================*/

%include "&myfolder\code_purge.sas";

/*=================================================================*/
/* END OF PURGE 												   */
/*=================================================================*/





/*=================================================================*/
/*	CLEAN THE RAW DATA */
/* 1. RENAME VARIABLES */
/* 2. CREATE WIDE DATASET WITH UNIQUE IDs*/
/* 3. FIX BIRTHYR AND BIRTHMO */
/*=================================================================*/

/* 1. RENAME VARIABLES */
%include "&myfolder\code_rename.sas";


/* 2. CREATE WIDE DATASET WITH UNIQUE IDs*/
/* Reasong for putting keep=_numeric_ 
	multiple variables are defined differently, either as numeric or character
*/
data clhls_wide_&&Year&firstwv.._&&Year&lastwv.;
set 
data0001JoinName(keep=_numeric_)
data0002JoinName(keep=_numeric_)
data0003JoinName(keep=_numeric_)
data0004JoinName(keep=_numeric_)
data0005JoinName(keep=_numeric_)
data0006JoinName(keep=_numeric_)
data0007JoinName(keep=_numeric_)
;

run;


/* 3. FIX BIRTHYR AND BIRTHMO */

/* check issue: multiple variables */
proc tabulate data=clhls_wide_&&Year&firstwv.._&&Year&lastwv. missing;
class V_BTHYR V_BTHYR_14 V_BTHMON V_BTHMON_14;
var ID;
table V_BTHYR all, V_BTHYR_14*N all;
table V_BTHMON all, V_BTHMON_14*N all;
label V_BTHYR=' ' V_BTHYR_14=' ' V_BTHMON=' ' V_BTHMON_14=' ';
run;
/* end of check  */

data clhls_wide_&&Year&firstwv.._&&Year&lastwv.._birth;
set clhls_wide_&&Year&firstwv.._&&Year&lastwv.;

/* birth year and month */
if not missing(V_BTHYR) then BIRTHYR = V_BTHYR;
else if not missing(V_BTHYR_14) then BIRTHYR = V_BTHYR_14;
else BIRTHYR = .;

if not missing(V_BTHMON) then BIRTHMO = V_BTHMON;
else if not missing(V_BTHMON_14) then BIRTHMO = V_BTHMON_14;
else BIRTHMO = .;

drop V_BTHYR V_BTHMON V_BTHYR_14 V_BTHMON_14;
run;

/*=================================================================*/
/*	END OF CLEAN  */
/*=================================================================*/


/* -------------------- */
/* SAVE TO THE clhls LIBRARY */
data clhls.clhls_wide_&&Year&firstwv.._&&Year&lastwv..;
set clhls_wide_&&Year&firstwv.._&&Year&lastwv.._birth;

run;
