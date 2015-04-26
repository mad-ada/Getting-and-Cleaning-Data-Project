# Getting and Cleaning Data - Course Project
## Introduction
Given the raw data collected from the accelerometers from the Samsung Galaxy S smartphone, the project is to prepare tidy data that can be used for later analysis. The repository includes three main files:

* CodeBook.md
* run_analysis.R
* tidy_data.txt

in which **CodeBook.md** describes the variables, the data and transformations to clean up the data. **run_analysis.R** shows the details about how to create the tidy_data set, and the output result is **tidy_data.txt**.

## Data Source
The project uses the "Human Activity Recognition Using Smartphones Data Set". The database built from the recordings of 30 subjects performing activities of daily living (ADL) while carring a waist-mounted smartphone with embedded inertial sensors. There are about 10299 instances and 561 atrributes in the database in total. 

## Script Walkthrough

The run_analysis.R script will perform the following step:

* Require reshape2 library (for the melt() function)
* Ensure the data path exists
* Checkes if the data set archive was already downloaded
* Downloading the data set archive if it was not already
* Timestamps the data set archive file with when it was downloaded
* Extracts the data set files from the archive
* READS Traing & test column files into respective variables