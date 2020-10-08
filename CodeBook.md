## Getting and Cleaning Data - peer assessment project

## The original data was transformed by following these steps

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## About R script
File with R code "run_analysis.R" perform 5 preceding steps

## About variables:   
* `x_train`, `x_test`, `y_test`, `y_train`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x`, `y` and `subject` merge the previous datasets.
* `features` contains the correct names for the `x` dataset, which are applied to the column names stored in
