# DATA ANALYSIS PORTFOLIO PROJECT USING SQL

- [X] NashvilleHousing dataset - DATA CLEANING
  * SQL script can be found [**HERE**](https://github.com/anthonyrere/DataAnalysisPortfolioProjects-SQL/blob/main/PortfolioProjectDataCleaning(NashvilleHousing).sql)

- [X] Covid19 datasets - DATA EXPLORATION
  * SQL script can be found [**HERE**](https://github.com/anthonyrere/DataAnalysisPortfolioProjects-SQL/blob/main/PortfolioProjectDataEploration1.sql)

## DATA CLEANING USING SQL
### INTRODUCTION
This is a SQL project on Data Cleaning on NashVille Housing Data.
This project is aimed to show how efficiently SQL can be used to clean data effectively.

This project involves data cleaning process using SQL where I took a raw dataset containing Nashville Housing data. The dataset contains inconsistencies, error and missing values which needs to be addressed before the data can be used for meaningful insights.

### SQL CONCEPT APPLIED
*	CONVERT
*	PARSENAME
*	SUBSTRING
*	FORMAT
*	CHARINDEX
*	ALTER TABLE
*	CASE STATEMENTS
*	CTE


### CHALLENGES 
The dataset contains information about the property address, sale date, owner’s address, sale price, Owner’s name bedrooms, land value, building value, parcel ID, Unique ID of each building, year built. However, due to inconsistencies the dataset includes issues such as:
* Inconsistent formatting of dates
* Inconsistent values in text columns
* Duplicates in customer records.
* Missing values in critical fields.

### STEPS AND RESULTS
* Inconsistent formatting of dates: To ensure consistency, the date formats were standardized using SQL's **CONVERT** functions
* Missing values in critical fields: Using SQL's **UPDATE** statement, missing values were filled in where possible.
* Duplicates in customer records: Duplicate records were identified and removed using the **ROW_NUMBER()** window function and **DELETE** function
* Inconsistent values in text columns: Inconsistent values were corrected using SQL's **CASE** statement:

### ABOUT THE DATA
NashVille Housing data is recorded in a.csv file and has the following amount of rows and columns:
• There are 56,373 rows and 21 columns.

The data cleaning process, which can be found [here](https://github.com/anthonyrere/DataAnalysisPortfolioProjects-SQL/blob/main/PortfolioProjectDataCleaning(NashvilleHousing).sql) led to significant improvements in the dataset's quality. This project showcased how SQL can effectively facilitate data cleaning. 




  
## DATA EXPLORATION
This study investigates the process of data exploration and analysis of covid-19 datasets (CovidDeaths.csv and CovidVaccination.csv). This project focuses on revealing insights within data by demonstrating SQL queries and approaches for extracting useful information.

The dataset includes information such as location, date, total cases, number of new cases, total deaths, population, number of vaccines, and so on.

The primary goals of this project are to address the following questions:
* The percentage of persons who died after getting the virus in a country.
* The percentage of people who became infected in relation to the total population of the country.
* The country with the greatest death rate by population
* The percentage of people vaccinated in a specific place to the overall population

