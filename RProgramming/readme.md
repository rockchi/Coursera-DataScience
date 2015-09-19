#Quick Background
In the following repository, I have stored some of the codes worked on during my R Programming Course.
This course was also my first introduction to programming. Later going onwards to Python, the paralells between R and Python were fairly helpful.

#Assignment 1 Context
For code:
complete.R
corr.R
pollutantmean.R

In the given scenario, we were given a zip file containing 332 CSV files. Each file represents a pollution montior, which tracked data including:
Date: date of observation (YYYY-MM-DD format)
Sulfate: level of sulfate PM in air on that date
Nitrate: level of nitrate PM in air on that date

##pollutantmean.R
'<pollutantmean(directory, pollutant, id=1:332)>'
Function, pollutantmean(), calculates the mean of specified pollutant across a given list of monitor ID.
Default function calculates mean of specified pollutant across all monitors.
Mean calculation ignores NA values

##complete.R
'<complete(directory, id)>'
Function, complete.R, provides back a dataframe containing monitor ID and number of complete case records for the ID array

##corr.R
'<corr(directory, threshold)>'
The function calculates correlation between nitrate and sulfate for all the records. 
However, the additional variable, threshold, allows the user to filter out monitors with complete cases not above specified threshold
The output of the function returns a dataframe containng each monitor ID and respective Correlation Coefficient

#Assignment 3 Context
For code:
best.R
rankall.R
rankhospital.R

