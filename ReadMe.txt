Coursera Getting and Cleaning Data course project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

This repository contains the following files:
• README.md - overview of the data set and how it was created.
• FullDataSubsetTidy.txt - the data set created from the code.
• CodeBook.md - describes the contents of the data set (data, variables and any transformations used to generate the data).
• GettingAndCleaningProjectScript.R - the R script that was used to create the data set 

Underlying Study

The Human Activity Recognition Using Smartphones Data Set describes how the data was initially collected:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
Training and test data were first merged together to create one data set, then the measurements on the mean and standard deviation were extracted for each measurement (79 variables extracted from the original 561), and then the measurements were averaged for each subject and activity, resulting in the final data set.
"

Create FullDataSubsetTidy

The R script GettingAndCleaningProjectScript.R creates the FullDataSubsetTidy data set as follows (the R script contains commentary throughout to facilitate understanding of what each part of the code is doing):
•Download data
•unzip source data
•Read data.
•Merge the training and test data sets to create one data set.
•Extract only the measurements on the mean and standard deviation for each measurement.
•Name the activities in the data set.
•Create a second, independent tidy set with the average of each variable for each activity and each subject.
•Write the data set to the  FullDataSubsetTidy.txt  file.