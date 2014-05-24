## Getting and Cleaning Data Course Project
## Course project: Processing Human Activity Recognition data captured with
## smart phones
## Assignment created by: Zammi Kahan
##
## R script run_analysis.R: 
## This script is written for cleaning the Human Activity Recognition data captured with
## smart phones and prepare for further analysis.
## The source dataset has been randomly partitioned into two sets, where 70% of the volunteers 
## was selected for generating the training data and 30% the test data. 
##
## This script is used to:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and 
##    each subject.
##
##

## This is used for the testing the script. Please modify appropriately.

## setwd("/Users/zammi/Documents/Coursera/Getting_and_Cleaning_Data/Assignment")
## getwd()

## Source of data for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Setting the source file details.

har_url  <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
zip_file <- 'dataset.zip'
data_dir <- 'UCI HAR Dataset'

## Downloading the UCI HAR Dataset and unzip

if (! file.exists(zip_file)) {
        download.file(har_url, destfile = zip_file, method = 'curl')
}

if ((! file.exists(data_dir)) & (file.exists(zip_file))) {
        unzip(zip_file)
}

## 1. Merges the training and the test sets to create one data set.

tmp1 <- read.table(paste(data_dir, "train/X_train.txt", sep = "/"))
tmp2 <- read.table(paste(data_dir, "test/X_test.txt", sep = "/"))
X_data <- rbind(tmp1, tmp2)

tmp1 <- read.table(paste(data_dir, "train/subject_train.txt", sep = "/"))
tmp2 <- read.table(paste(data_dir, "test/subject_test.txt", sep = "/"))
S_data <- rbind(tmp1, tmp2)

tmp1 <- read.table(paste(data_dir, "train/y_train.txt", sep = "/"))
tmp2 <- read.table(paste(data_dir, "test/y_test.txt", sep = "/"))
Y_data <- rbind(tmp1, tmp2)

## 2a. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table(paste(data_dir, "features.txt", sep = "/"))
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_data <- X_data[, mean_std_features]
names(X_data) <- features[mean_std_features, 2]

## 2b. Make the column names readable

names(X_data) <- gsub("\\(|\\)", "", names(X_data))
names(X_data) <- gsub("mean", "Mean", names(X_data))
names(X_data) <- gsub("std",  "Std", names(X_data))
names(X_data) <- gsub("-",  "_", names(X_data))

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.

activities <- read.table(paste(data_dir, "activity_labels.txt", sep = "/"))
activities[, 2] = gsub("_", "", as.character(activities[, 2]))
Y_data[,1] = activities[Y_data[,1], 2]
names(Y_data) <- "Activity"
names(S_data) <- "Subject"

## Extract the tidy data and create a text file "Tidy_UCI_HAR_Dataset.txt"
tidy_data <- cbind(S_data, Y_data, X_data)
write.table(tidy_data, "Tidy_UCI_HAR_Dataset.txt")

## 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
## Compute the averages grouped by subject and activity

tidy_avg_data <- aggregate(tidy_data[, 3:dim(tidy_data)[2]],
                           list(tidy_data$Subject,
                                tidy_data$Activity),
                           mean)
names(tidy_avg_data)[1:2] <- c('Subject', 'Activity')

## Extract the tidy data and create a text file "Tidy_UCI_HAR_AVG_Dataset.txt"
## This file contains the average data

write.table(tidy_avg_data, "Tidy_UCI_HAR_AVG_Dataset.txt")


