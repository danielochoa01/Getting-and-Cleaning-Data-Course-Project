# CodeBook

The purpose of this file is to explain all the variables contained in run_analysis.R and how the script works

## Data
The source of the data can be found on the next website
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

If you want to just download the zip, this is the link for doing so
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data Transformation

All the transformations were made in accordance of the course assignation description

1. Merges the training and the test sets to create one data set.
    * reading all train and test files
    * assing the names to all columns
    * merge the different train and test variables (for more info refer to the variables section)
    * merge the resultant train and test dataframes into a final dataframe
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    * create a logical vector containing the result of using the grepl function to find which colname has either 'mean' or 'std' on it
    * subset the final dataframe from the previous activity using the logical vector created before
3. Uses descriptive activity names to name the activities in the data set
    * merged the dataframe from the previous step with the activity names
4. Appropriately labels the data set with descriptive variable names. 
    * already concluded on step 1 (referred to section 3 from merging datasets)
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    * grouped the dataframe from the previous step and summarise each column by its mean
    * use the function write.table to export the dataframe from previous activity to a txt file

## Variables

* features: variable containing feature id and names readed from features.txt
* activity_labels: variable containing activity id and labels readed from activity_labels.txt
* X_train, y_train: variables used to store the data readed from X_train.txt and y_train.txt respectively
* subject_train: variable used to store the data readed from subject_train.txt
* X_test, y_test: variables used to store the data readed from X_test.txt and y_test.txt respectively
* subject_test: variable used to store the data readed from subject_test.txt
* data_train: dataframe resultant from binding by cols X_train, y_train and subject_train variables
* data_test: dataframe resultant from binding by cols X_test, y_test and subject_test variables
* final_data: dataframe resultant from binding by rows data_train and data_test dataframes
* all_mean_sdt_cols: a logical vector containing TRUE values where colnames have 'mean' or 'std' word and FALSE for the ones which don't. It's used for subsetting the final_data dataframe
* df_mean_std_summary: dataframe resultant from subsetting final_data dataframe by including only features which include 'mean' and 'std' words. The subset was made using the all_mean_sdt_cols vector
* df_with_activity_names: dataframe resultant from merging df_mean_std_summary and activity_labels dataframe
* tidy_data: dataframe resultant from grouping by subjectID and activityID and summarising every column by its mean
