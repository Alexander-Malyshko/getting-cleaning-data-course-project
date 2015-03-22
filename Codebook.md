## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.[1]

## Data Transformation Process

The code contains 5 steps described in the course project's definition.

* The unzip function creates a new folder in the working directory called "UCI HAR Dataset" using the data from the downloaded ZIP file.
* It merges 3 main components from 2 different folders within "UCI HAR Dataset", i.e. training and test data sets using rbind and cbind functions. The code assigns relevant column names.
* The R code extracts the columns from the initial data source that contain "mean" and "std", i.e. mean and standard deviation for each measurement.
* It adds to the adjusted data frame a new column witn descriptive names for the activities via joining another data frame called activity_labels.
* Column labels from the original collectors were changed: without parentheses, dashes and commas; more descriptive labels assigned.
* From the data set in the previous step, it creates a new tidy data set with the average of each variable for each activity and each subject.
* It creates a new txt file with write.table() using row.name=FALSE. This file is called "AnalysisReadyData.txt". It is the final output of the R script.

## Variables

* dataSubject, dataActivity, dataFeatures contain the data from the downloaded files merged from 2 folders
* data is a final dataset created from the ZIP file data without any changes applied.
* 
