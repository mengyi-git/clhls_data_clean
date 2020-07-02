/*
 
PICK THE OBSERVATIONS THAT JOINED THE SURVEY IN &&Year&i

INPUT:	data000&i
OUTPUT: data&&Year&i..Join

EACH DATA FILE (data000&i) IS A LONGITUDINAL DATASET THAT CONTAINS VARIABLES FROM
&&Year&i TO &&Year&lastwv

*/

/* 1. Keep ID variable */
/* 2. Create YEAR_XX variable */
%macro collectID(nFile);

%do i = 1 %to &nFile;
	%let YEAR_SUF = ;

	/*define the YEAR_SUF macro (year suffix)*/
	data _null_;
	  if &&YEAR&i. = &YEAR1 then call symput('YEAR_SUF', '_1998');
	  	else if &&YEAR&i. = &YEAR2 then call symput('YEAR_SUF', '_2000');
	  	else if &&YEAR&i. = &YEAR3 then call symput('YEAR_SUF', '_2002');
	  	else if &&YEAR&i. = &YEAR4 then call symput('YEAR_SUF', '_2005');
	  	else if &&YEAR&i. = &YEAR5 then call symput('YEAR_SUF', '_2008');
	  	else if &&YEAR&i. = &YEAR6 then call symput('YEAR_SUF', '_2011');
		else if &&YEAR&i. = &YEAR7 then call symput('YEAR_SUF', '_2014');
	run;

	data id&&YEAR&i;
		set data000&i(keep=ID);
		/* No variables recording interview year if it occurred in 2000, 2002, 2005 or 2008 */
		YEAR&YEAR_SUF = &&YEAR&i;
	run;
%end;

%mend collectID;
%collectID(&lastwv);

/* 3. PICK THE IDs THAT JOIN IN 1998 -- 2014*/
data idJoin1998 idJoin2000 idJoin2002 idJoin2005 idJoin2008 idJoin2011 idJoin2014 ;
merge ID1998(in=a) ID2000(in=b) ID2002(in=c) ID2005(in=d) ID2008(in=e) ID2011(in=f) ID2014(in=g);
by ID;

if a then output idJoin1998;
else if b then output idJoin2000;
else if c then output idJoin2002;
else if d then output idJoin2005;
else if e then output idJoin2008;
else if f then output idJoin2011;
else if g then output idJoin2014;

run;


/* 4. Merge data000&i. with idJoin&&Year&i*/
%macro mergeID(nFile);

%do i = 1 %to &nFile;

	data data000&i.Join;
		merge data000&i.(in=a) IDJOIN&&YEAR&i.(in=b);
		by ID;
		if b;
		
		JOINWAVE = &i;

	run;
%end;

%mend mergeID;
%mergeID(&lastwv);