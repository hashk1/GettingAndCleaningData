library(dplyr)

### read training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

### read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1. Merges the training and the test sets to create one data set.
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

### read feasures.txt
features <- read.table("UCI HAR Dataset/features.txt")

### extract "-mean()" from features
mean_features <- grep("-mean\\(\\)", features[, 2])

### extract "-std()" from features
std_features <- grep("-std\\(\\)", features[, 2])

### merge mean_features and std_features
mean_and_std_features <- c(mean_features, std_features) %>% sort

### extract mean and std from X_data
X_data <- X_data[, mean_and_std_features]
names(X_data) <- features[mean_and_std_features, 2]

# 3. Uses descriptive activity names to name the activities in the data set

### read activity_labels.txt
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

### rename y_data
y_data[, 1] <- activity_labels[y_data[, 1], 2]
names(y_data) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

### rename subject_data
names(subject_data) <- "subject"

### bind all data
data <- cbind(X_data, y_data, subject_data)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### get average data
average_data <- group_by(data, subject, activity) %>% summarise_each(funs(mean))

### write to average_data.txt
write.table(average_data, "average_data.txt", row.name = FALSE)
