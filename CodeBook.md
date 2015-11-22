---
title: "CodeBook.md"
author: "Vaibhav Puranik"
date: "November 21, 2015"
output: html_document
---
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzipping the file above will give you 'UCI HAR Dataset' folder. The folder contains README.txt file that describes various files included in the dataset. 

**The script run_analysis.R performs the followign analysis on the dataset**

The aim of the script is to combine test and training dataset and produce a new tidy dataset after performing the following operations:

- Merges subject, activity and measurements files of test dataset to create merged_test dataframe
- Performs the same operations to create merged_train dataframe
- Combine the merged_test and merged_train datasets in combined_data dataframe
- Changes the column names to the actual column names taken from features.txt file. Renames activity column as 'activity' and subject column as 'subject'
- Extracts a new dataframe containing activity, subject and any columns with mean() and std() in the name. 
- Creates a new dataframe tidy_data by calculating mean of all the measurement columns left by activity and subject
- Writes the tidy_data dataframe to 'transformed_HAR_dataset.txt' file.

Here are all the columns in the resulting dataset:
- activity: One of the following activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- subject: subject number of one of the 30 subjects participated in collection of UCI HAR Dataset
- All the other columns values are averages for various time and fequency domain variables from UCI HAR Dataset 


