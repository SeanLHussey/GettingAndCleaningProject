#set working directory
setwd("C:/Users/shussey002/Documents/Coursera/GettingAndCleaningProject")
#load the data.table package in case it's not already there
library(data.table)
#name the url from which to download the data for the project
DataUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#Download data
download.file(DataUrl,"DataZipFile.zip")
#Unzip the data from the zipfile into the working directory
unzip("DataZipFile.zip",exdir = getwd())

#Read in the features.txt file, use space as a separator
features <- read.csv('./UCI HAR Dataset/features.txt', sep = ' ')
#Convert the features file to a character frame, taking the second column
features <- as.character(features[,2])

#Go into train subfolder and read in x_train file
TrainData.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
#Go into train subfolder and read in y_train file
TrainData.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', sep = ' ',header = FALSE)
#Go into train subfolder and read in subject_train file
TrainData.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',sep = ' ',header = FALSE)

#Bring training data together and name the columns
FinalTrainData <-  data.frame(TrainData.subject, TrainData.activity, TrainData.x)
names(FinalTrainData) <- c(c('subject', 'activity'), features)

#Do the same with the test data
TestData.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
TestData.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', sep = ' ',header = FALSE)
TestData.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', sep = ' ',header = FALSE)
FinalTestData <-  data.frame(TestData.subject, TestData.activity, TestData.x)
names(FinalTestData) <- c(c('subject', 'activity'), features)

#Combine the test and training datasets
FullData <- rbind(FinalTrainData,FinalTestData)

#Extract out the mean and standard deviation measurements from the features dataset
ExtractMeanStd <- grep('mean|std', features)
FullDataSubset <- FullData[,c(1,2,ExtractMeanStd + 2)]

#Bring in activity label data set and extract the second column which contains the info we require
ActivityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
ActivityLabels <- as.character(ActivityLabels[,2])

#Sub in the activity labels into the full data set (subsetted for the mean and std info)
FullDataSubset$activity <- ActivityLabels[FullDataSubset$activity]

#Adjust the names accordingly
NewVarName <- names(FullDataSubset)
NewVarName <- gsub("[(][)]", "", NewVarName)
NewVarName <- gsub("-", "_", NewVarName)
NewVarName <- gsub("Acc", "Accel Meter", NewVarName)
NewVarName <- gsub("Gyro", "Gyroscope", NewVarName)
NewVarName <- gsub("Mag", "Magnitude", NewVarName)
NewVarName <- gsub("-mean-", "_Mean_", NewVarName)
NewVarName <- gsub("-std-", "_StandardDeviation_", NewVarName)
NewVarName <- gsub("^t", "TimeDomain_", NewVarName)
NewVarName <- gsub("^f", "FrequencyDomain_", NewVarName)
names(FullDataSubset) <- NewVarName

#Get the mean for each activity and subject
FullDataSubsetTidy <- aggregate(FullDataSubset[,3:80], by = list(activity = FullDataSubset$activity, subject = FullDataSubset$subject),FUN = mean)

#Output the tidied dataset to a txt file
write.table(x = FullDataSubsetTidy, file = "FullDataSubsetTidy.txt", row.names = FALSE)