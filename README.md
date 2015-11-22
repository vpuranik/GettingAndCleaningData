---
title: "README.md"
author: "Vaibhav Puranik"
date: "November 21, 2015"
output: html_document
---

You can download the UCI HAR Dataset from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

When you unzip the dataset, you will get a folder "UCI HAR Dataset". Copy the folder to your R 
working directory. 

To know more about the dataset, read the file README.txt inside "UCI HAR Dataset" folder.

Script run_analysis.R reads the data from 'UCI HAR Dataset' folder and performs series of transformations
on the data. The script creates new tidy dataset with averages of multiple measurments for each activity and subject. The new dataset will be saved in transformed_HAR_dataset.txt file in your working directory.

Copy run_analysis.R to your working directory.

In order to run run_analysis.R, you must have the following packages installed in your R environment: readr, dplyr
Packages can be installed using the following command:
```r
install.packages("readr")
install.packages("dplyr")
```

Once you install the packages and have UCI HAR Dataset folder in your working directory, you can run the script by simply sourcing the file run_analysis.R

```r
source('run_analysis.R')
```

You should be able to see transformed_HAR_dataset.txt file in your working directory. To know more about the fields included in transformed_HAR_dataset.txt refer to CodeBook.md file in the repository.