library(dplyr)
library(data.table)


if (!file.exists('./UCI HAR Dataset.zip')) {
  url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(url, destfile = './UCI HAR Dataset.zip')  
}

if (!file.exists('./dataset/')) {
  unzip(zipfile = './UCI HAR Dataset.zip', exdir = './dataset', overwrite = T)
}


X_train = read.table('./dataset/UCI HAR Dataset/train/X_train.txt')
y_train = read.table('./dataset/UCI HAR Dataset/train/y_train.txt')



X_test = read.table('./dataset/UCI HAR Dataset/test/X_test.txt')
y_test = read.table('./dataset/UCI HAR Dataset/test/y_test.txt')
