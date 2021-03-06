## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files in the repo
* README.md - About the project and general description of the files
* run_analysis.R - Main file with the R script used for the data preparation and cleaning
* Codebook.md - Detailed description of the each step in data preparation and each variable
* AnalysisReadyData.txt - The final output of the R script, i.e. the tidy data set with all the adjustments applied.

## Data Transformation Process

The code contains 5 steps described in the course project's definition.

* The unzip function creates a new folder in the working directory called "UCI HAR Dataset" using the data from the downloaded ZIP file.
* It merges 3 main components from 2 different folders within "UCI HAR Dataset", i.e. training and test data sets using rbind and cbind functions. The code assigns relevant column names.
* The R code extracts the columns from the initial data source that contain "mean" and "std", i.e. mean and standard deviation for each measurement.
* It adds to the adjusted data frame a new column witn descriptive names for the activities via joining another data frame called activity_labels.
* Column labels from the original collectors were changed: without parentheses, dashes and commas; more descriptive labels assigned.
* From the data set in the previous step, it creates a new tidy data set with the average of each variable for each activity and each subject.
* It creates a new txt file with write.table() using row.name=FALSE. This file is called "AnalysisReadyData.txt". It is the final output of the R script.

## Getting a tidy data set

* 1) Download the R script to a local computer from here - https://github.com/Alexander-Malyshko/getting-cleaning-data-course-project
* 2) Download the ZIP file to the same directory - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
* 3) Run the script in the shell or R Studio
* 4) Search in the directory for a file called - AnalysisReadyData.txt
