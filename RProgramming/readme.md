#Background to RProgramming Repo
In the following repository, I have stored some of the codes worked on during my R Programming Course.
This course was also my first introduction to programming. Later going onwards to Python, the paralells between R and Python were fairly helpful.

###Assignment 1 Context
For code:
- complete.R
- corr.R
- pollutantmean.R

In the given scenario, we were given a zip file containing 332 CSV files. Each file represents a pollution montior, which tracked data including:
-- Date: date of observation (YYYY-MM-DD format)
- Sulfate: level of sulfate PM in air on that date
- Nitrate: level of nitrate PM in air on that date

####pollutantmean.R
> pollutantmean(directory, pollutant, id=1:332)

Function, pollutantmean(), calculates the mean of specified pollutant across a given list of monitor ID.
Default function calculates mean of specified pollutant across all monitors.
Mean calculation ignores NA values

####complete.R
> complete(directory, id)

Function, complete.R, provides back a dataframe containing monitor ID and number of complete case records for the ID array.

####corr.R
> corr(directory, threshold)

The function calculates correlation between nitrate and sulfate for all the records. 
However, the additional variable, threshold, allows the user to filter out monitors with complete cases not above specified threshold.
The output of the function returns a dataframe containng each monitor ID and respective Correlation Coefficient.

###Assignment 3 Context
For code:
- best.R
- rankall.R
- rankhospital.R

In the given assignment, data was prepared from [Hospital Compare](http://hospitalcompare.hhs.gov) which provides quality of care metrics of over 4,000 Medicare Certified Hospital in United States. 
Data files given include:
- outcome-of-care-measure.csv: This files was pre-filtered for relevant variables including 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia of over 4000 hospitals
- hospital-data.csv: Contains hospital information

####best.R
> best(state, outcome)

With State and outcome, including heart attack, heart failure or pneumonia, identified, the function returns the best hospital identifed by lowest 30-day mortality rate of specified outcome

####rankhospital.R 
> rankhospital(state, outcome, num)

This function allows the user to query for a given rank (num) for a specified State and outcome.
The num variable does not have to be numeric, it can also be "best" or "worst", indicating highest rank (1) or lowest rank.
Like best.R, the function will stop if specified query is invalid.
Tied ranks are settled by name alphabetical ordering.

####rankall.R	
> rankall(outcome, num)

The function works similarly to rankhospital.R. However, this function provides the hospital of specified rank and outcome across all State in a dataframe format.
