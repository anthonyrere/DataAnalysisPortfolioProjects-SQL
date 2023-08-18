
# DATA CLEANING USING SQL
This project involves data cleaning process using SQL where I took a raw dataset containing Nashville Housing data. The dataset contains inconsistencies, error and missing values which needs to be addressed before the data can be used for meaningful insights.

## CHALLENGES 
The dataset contains information about the property address, sale date, owner’s address, sale price, Owner’s name bedrooms, land value, building value, parcel ID, Unique ID of each building, year built. However, due to inconsistencies the dataset includes issues such as:
* Inconsistent formatting of dates
* Inconsistent values in text columns
* Duplicates in customer records.
* Missing values in critical fields.

## STEPS AND RESULTS
* Inconsistent formatting of dates: To ensure consistency, the date formats were standardized using SQL's **CONVERT** functions
* Missing values in critical fields: Using SQL's **UPDATE** statement, missing values were filled in where possible.
* Duplicates in customer records: Duplicate records were identified and removed using the **ROW_NUMBER()** window function and **DELETE** function
* Inconsistent values in text columns: Inconsistent values were corrected using SQL's **CASE** statement:

The data cleaning process, which can be found [here](https://github.com/anthonyrere/DataAnalysisPortfolioProjects-SQL/blob/main/PortfolioProjectDataCleaning(NashvilleHousing).sql) led to significant improvements in the dataset's quality. This project showcased how SQL can effectively facilitate data cleaning. 

