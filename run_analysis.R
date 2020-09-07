library(dplyr)
library(data.table)


if (!file.exists('./UCI HAR Dataset.zip')) {
  url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url, destfile = './UCI HAR Dataset.zip')  
}

if (!file.exists('./dataset/')) {
  unzip(zipfile = './UCI HAR Dataset.zip', exdir = './dataset', overwrite = T)
}

# Features and labels
features = read.table('./dataset/UCI HAR Dataset/features.txt')
activity_labels = read.table('./dataset/UCI HAR Dataset/activity_labels.txt')

# Checking all feature names
head(features)

## Task 1: Merge the training and the test sets to create one data set.

# Train data
X_train = read.table('./dataset/UCI HAR Dataset/train/X_train.txt')
y_train = read.table('./dataset/UCI HAR Dataset/train/y_train.txt')
subject_train = read.table('./dataset/UCI HAR Dataset/train/subject_train.txt')

# Assigning colnames to train variables
colnames(X_train) <- features[, 2]
colnames(y_train) <- 'activityID'
colnames(subject_train) <- 'subjectID'

# Binding train data
data_train = cbind(X_train, y_train, subject_train)


# Test data
X_test = read.table('./dataset/UCI HAR Dataset/test/X_test.txt')
y_test = read.table('./dataset/UCI HAR Dataset/test/y_test.txt')
subject_test = read.table('./dataset/UCI HAR Dataset/test/subject_test.txt')

# Assigning colnames to test variables
colnames(X_test) <- features[, 2]
colnames(y_test) <- 'activityID'
colnames(subject_test) <- 'subjectID'


# Binding test data
data_test = cbind(X_test, y_test, subject_test)


# Merging train and test data
final_data = rbind(data_train, data_test)

## Task 2: Extract only the measurements on the mean and standard deviation 
## for each measurement. 

# Checking which cols have "mean" on their name
grep('mean', colnames(final_data))

# Checking which cols have "std" on their name
grep('std', colnames(final_data))


# Subsetting the colnames
all_mean_sdt_cols <- (
  grepl('activityID', colnames(final_data)) |
  grepl('subjectID', colnames(final_data)) |
  grepl('mean', colnames(final_data)) |
  grepl('std', colnames(final_data))     
)

# Checking colnames before subsetting the final_data df
colnames(final_data[, all_mean_sdt_cols])

# Subset the dataset
df_mean_std_summary <- final_data[, all_mean_sdt_cols]

## Task 3: Use descriptive activity names to name the activities in the data set

# Check activity current names

