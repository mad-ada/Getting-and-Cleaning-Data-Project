# Getting and Cleaning Data-Course Project
## Introduction
Given the raw data collected from the accelerometers from the Samsung Galaxy S smartphone, the project is to prepare tidy data that can be used for later analysis. The repository includes three main files:

* CodeBook.md
* run_analysis.R
* tidy_data.txt

in which **CodeBook.md** describes the variables, the data and transformations to clean up the data. **run_analysis.R** shows the details about how to create the tidy_data set, and the output result is **tidy_data.txt**.

## Data Source
The project uses the "Human Activity Recognition Using Smartphones Data Set". The database built from the recordings of 30 subjects performing activities of daily living (ADL) while carring a waist-mounted smartphone with embedded inertial sensors. There are about 10299 instances and 561 atrributes in the database in total. 

## Script Walkthrough
1. Download the data source ```UCI HAR Dataset```, and put it under your local working directory
2. Put ```run_analysis.R``` in the same directory
3. Run ```source("run_analysis.R")```, then the code will output a text file called ```tidy_data.txt``` under the current directory.

## Dependencies
```run_analysis.R``` depends on ```reshap2``` and ```data.table```. The original program is implemented on Windows OS.