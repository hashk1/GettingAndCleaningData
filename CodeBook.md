# CodeBook

## About Data
This dataset is derived from "Human Activity Recognition Using Smartphones Data Set"
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones , and 
obtainded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 

## Data Transformation
1. Download and unzip above file.
1. Read training set: `X_train`, training labels: `y_train` and identifies the subject for training set: `subject_train`.
1. Read test set: `X_test`, test labels: `y_test` and identifies the subject for test set: `subject_test`.
1. Merge training and test data: `X_data`, `y_data` and `subject_data` for each.
1. Read list of all features: `features`.
1. Extract only the measurements on the mean and standard deviation from the feature list: `mean_and_std_features`.
1. Extract only the measurements on the mean and standard deviation for each measurement: -> update `X_data`.
1. Read links the class labels with their activity name: `activity_labels`.
1. Uses descriptive activity names to name the activities in the data set: -> update `y_data`.
1. Appropriately labels the data set with descriptive variable names: -> update `subject_data`.
1. Bind all data: `data`.
1. From the data set , creates independent tidy data set with the average of each variable for each activity and each subject: `average_data`.
11. Write to "average_data.txt".
