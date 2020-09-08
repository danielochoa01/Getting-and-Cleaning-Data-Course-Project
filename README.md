# Getting-and-Cleaning-Data-Course-Project

This repo was created in order to submit the assignment for Week 4 of
Getting and Cleaning Data Course.

### How the script works
First of all, the script check if the zip file containing the dataset exists, if not it downloads it. Then the script unzips the file into a directory called dataset.
Finally it processes all the transformations listed on Codebook.md

### Files contained in this repo

* README.md: this markdown file is used for a brief explanation about this repo and its files
* CookBook.md: used for explaining the variables contained in the R script file
* run_analysis.R: an R file containing the code required to accomplish the five steps listed for the programming assignment. This script does the following:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Getting-and-Cleaning-Data-Course-Project.Rproj: an Rproj file used to simplify the fact of reading the files from x path
    - By using an Rproj, the working directory is set to the current directory in which we create/clone this repo
    - Useful to integrate tools like Git in RStudio
* .gitigtnore: this file is used to indicate Git which files won't be included when committing or pushing the repo
* tidy_data.txt: the output data set