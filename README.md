# Chinese Longitudinal Healthy Longevity Survey (CLHLS)

The data can be downloaded from the link in the following citation. 
> The public-use data files in this collection are available for access by the general public. Access does not require affiliation with an ICPSR member institution.

Zeng, Yi, Vaupel, James, Xiao, Zhenyu, Liu, Yuzhi, and Zhang, Chunyuan. Chinese Longitudinal Healthy Longevity Survey (CLHLS), 1998-2014. Inter-university Consortium for Political and Social Research [distributor], 2017-04-11. https://doi.org/10.3886/ICPSR36692.v1

## Introduction
The purpose of the code is to create a single longitudinal data set, in the wide format, that contains the information of all subjects interviewed in all possible waves. The code also fixes some inconsistency in the variable names. 

ICPSR 36692 Version 1 has seven data sets. Each of them, except for the last one which is cross-sectional, is a longitudinal data set, in the wide format. For example, DS1 1998-2014 Longitudinal Data tracks information from 1998 to 2014 for individuals who responded in 1998. Note that there were new cohorts joining in the subsequent waves, so it is necessary to combine multiple data sets if you want to analyse the data of individuals who joined the survey at different time. This, however, creates an issue because the records of the same person can appear in multiple data sets. Simply concatenating different data sets will create a data set that is neither in the wide format (because there are multiple observations with the same ID) nor the long format. 

## How to use the code
Download the following.
* `main.sas`
* `code_purge.sas`
* `code_rename.sas`
* the `setup` folder

The main body of the code is in `main.sas`. You need to specify the root directory. The other code files are included in `main.sas` via the `%INCLUDE` statement. 

## Method
To create a single data set in the wide format, I created a subset of each of the raw data. The subset criterion is that the earliest year of records in the data corresponds to the year when the selected individuals joined the survey. For instance, the records of those who joined the survey in 1998 are selected from DS1 1998-2014 Longitudinal Data. The records of those who joined the survey in 2002 are selected from DS1 2002-2014 Longitudinal Data. This can be achieved by the `merge` statement in SAS. The number of observations in the raw and the new data sets is shown below.

| Data Name                                    | No. of Obs.        | No. of New Subjects                     |
|----------------------------------------------|-------------------:|----------------------------------------:|
| DS1 1998-2014 Longitudinal Data, Version   1 |             9,093  |                                  9,093  |
| DS2 2000-2014 Longitudinal Data, Version   1 |          11,199    |                                  6,368  |
| DS3 2002-2014 Longitudinal Data, Version   1 |          16,064    |                                  9,749  |
| DS4 2005-2014 Longitudinal Data, Version   1 |          15,638    |                                  7,463  |
| DS5 2008-2014 Longitudinal Data, Version   1 |          16,954    |                                  9,482  |
| DS6 2011-2014 Longitudinal Data, Version   1 |             9,765  |                                  1,340  |
| DS7 2014 Cross-Sectional Data, Version 1     |             7,192  |                                  1,125  |
| Total                                        |          85,905    |                                44,620   |

Before concatenating the selected data sets, some of the variable need to be renamed to avoid confusion in the final data set. The details can be found in the renaming code. Below is an overview of the naming convention.

## Variable names
I only looked at variables that were relevant to my research projects. Having said that, the naming conventions of other variables might be similar.

The overall naming convention in the raw data is variable name followed by an underscore and one or two digits denoting the year of the interview. For example, `MONTH_0` means interview month in year 2000. If there is no year digit suffix, the variable corresponds to the earliest interview wave in that particular data set. For example, `E1` in DS2 2000-2014 Longitudinal Data was recorded in 2000, whereas `E1` in DS3 2002-2014 Longitudinal Data was recorded in 2002. 

There are some exceptions to the general rule. Below is an incomplete list. 

### Interview day, month, year
If the interview occurred in 2000, 2002, 2005 or 2008, there is no variable that records the interview year. Additional variables need to be created if the interview year information is relevant to you. 

If the interview occurred in 1998/99, there is no underscore in the variable name. 

### Residence
The residence variable is usually RESID_XX, but `RESIC_11` appears in DS1 1998-2014 Longitudinal Data to DS4 2005-2014 Longitudinal Data.

### Birth year and month
Both birth year and birth month have two variables, `V_BTHYR` (`V_BTHMON`) and `V_BTHYR_14` (`V_BTHMON_14`). I used `V_BTHYR` and `V_BTHMON` as they have far fewer missing values. When `V_BTHYR` (`V_BTHMON`) is missing, I use `V_BTHYR_14` (`V_BTHMON_14`) to fill in. 
