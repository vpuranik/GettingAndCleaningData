library(readr)
library(dplyr)

# Let's first load test dataset
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")

col_pos <- fwf_empty("UCI HAR Dataset/test/X_test.txt")
mes_test <- read_fwf("UCI HAR Dataset/test/X_test.txt", col_positions = col_pos)

activity_test = read.table("UCI HAR Dataset/test/y_test.txt")
sm <- merge(subject_test, mes_test, by=0, all=TRUE, sort=FALSE)
merged_test = merge(activity_test, sm, by=0, all=TRUE, sort=FALSE)
merged_test$Row.names <- NULL
row.names(merged_test) <- merged_test$Row.names
merged_test$Row.names <- NULL

# Let's load train dataset
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

col_pos_train <- fwf_empty("UCI HAR Dataset/train/X_train.txt")
mes_train <- read_fwf("UCI HAR Dataset/train/X_train.txt", col_positions = col_pos_train)

activity_train = read.table("UCI HAR Dataset/train/y_train.txt")

smt <- merge(subject_train, mes_train, by=0, all=TRUE, sort=FALSE)
merged_train = merge(activity_train, smt, by=0, all=TRUE, sort=FALSE)
merged_train$Row.names <- NULL
row.names(merged_train) <- 2948:10299
merged_train$Row.names <- NULL

# Let's join trainig and test dataset
combined_data <- rbind(merged_test, merged_train)

# Let's apply names for 561 measurements so that we can delete non mean and non std columns
mes_names <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header = FALSE, stringsAsFactors=FALSE)
names(combined_data)[3:563] <- mes_names$V2
names(combined_data)[1] <- "activity_id"
names(combined_data)[2] <- "subject"

# Select only mean and std columns
meanstd_data <- combined_data[,grep("mean\\(\\)|std\\(\\)|activity_id|subject", names(combined_data))]

# 3 Let's join the lookup tables so that activity names replace
# the ids
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep=" ", header = FALSE, stringsAsFactors=FALSE)
names(activity_labels)[1] <- "activity_id"
names(activity_labels)[2] <- "activity"
meanstd_with_activity_names <- merge(activity_labels, meanstd_data)
meanstd_with_activity_names$activity_id <- NULL

# Let's create a second dataset
tidy_data <- meanstd_with_activity_names %>% group_by(activity, subject) %>% summarize_each(funs(mean))
write.table(tidy_data, "transformed_HAR_dataset.txt", row.name=FALSE)