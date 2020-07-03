# Chinese Longitudinal Healthy Longevity Survey (CLHLS)

The data can be downloaded from the link in the following citation. 

Zeng, Yi, Vaupel, James, Xiao, Zhenyu, Liu, Yuzhi, and Zhang, Chunyuan. Chinese Longitudinal Healthy Longevity Survey (CLHLS), 1998-2014. Inter-university Consortium for Political and Social Research [distributor], 2017-04-11. https://doi.org/10.3886/ICPSR36692.v1

> The public-use data files in this collection are available for access by the general public. Access does not require affiliation with an ICPSR member institution.

## Introduction
The purpose of the code is to create a single longitudinal data set, in the wide format, that contains the information of all subjects interviewed in all possible waves. The code also fixes some inconsistency in the variable names. 

ICPSR 36692 Version 1 has seven data sets. Each of them, except for the last one which is cross-sectional, is a longitudinal data set, in the wide format. For example, DS1 1998-2014 Longitudinal Data tracks information from 1998 to 2014 for individuals who responded in 1998. Note that there were new cohorts joining in the subsequent waves, so it is necessary to combine multiple data sets if you want to analyse the data of individuals who joined the survey at different time. This, however, creates an issue because the records of the same person can appear in multiple data sets. Simply concatenating different data sets will create a data set that is neither in the wide format (because there are multiple observations with the same ID) nor the long format. 

## How to use the code
Download the data from https://www.icpsr.umich.edu/web/NACDA/studies/36692/versions/V1/datadocumentation. Click the download icon and choose `ASCII + SAS Setup`.
![image](https://user-images.githubusercontent.com/40621074/86422826-861f7380-bd21-11ea-947a-1d364389bd7f.png)

Unzip the file. The raw data and the setup code (in the `setup` folder) are stored inside the folders `DS0001`, `DS0002`, ..., `DS0007`. Move these folders to a new folder. The name of this new folder will be referred to in `main.sas`.

Download the code. The main body of the code is in `main.sas`. You need to specify the root directory. The other code files are included in `main.sas` via the `%INCLUDE` statement. 

## Questions and comments
If you have trouble running the code or have better ideas to improve the code, please [log an issue](https://github.com/mengyi-git/clhls_data_clean/issues).

## Learn more
More details about the data cleaning procedure can be found [here](https://github.com/mengyi-git/clhls_data_clean/wiki).
