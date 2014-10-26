Getting-and-Cleaning-Data-Course-Project
========================================

This is my course project submission for the Getting and Cleaning Data course 
offered by coursera.

Contents:

1. [Assignment Requirements][]
2. [How the script works][]
3. [Code Book][]


Assignment Requirements
-----------------------

One R script called run_analysis.R that does the following:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How the script works 
--------------------

- Part One:
    - The original data that had to be manipulated for the purposes of this assignment is included within this repo. The files of interest (test and training data) are .txt files within this folder. 
    - Dataframes called test and train are constructed using these .txt files.
    - The two dataframes are merged vertically using rbind
    
- Part Two:
    - The measures of interest are the mean and standard deviation of the original variables. 
    - To extract the columns with this data, ALL of the colomns are named using the information in features.txt
    - Once the columns have been named, the measures of interested are explicitly named and put in a new dataframe using the subset function.
     
- Part Three:
    - The column named "Activity" is changed from a series of integers, to levels.
    - The descriptive activity names are taken from activity_labels.txt and then assigned to the different levels.

- Part Four:
    - This requirement is actually accomplished as part of my solution to part two.

- Part Five:
    - The column named "Subjects" is changed from a series of integers, to a series of levels.
    - The dataframe constructed by parts 3/4 is rearranged using the melt function.
    - The dcast function is then used to reformat the data in a tidy manner and calculate the mean for each variable for each subject and activity.
    - The new dataframe created by the dcast function is saved as a file called output.txt.
    
Code Book
---------

1. Activity - One of six levels:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING
    
    Each level is a string, therefore it has no units

2. Subject - An anonymous indicator of a participant. There were 30 participants, therefore there are 30 levels with no units.

3. All other variables - None of these variables have units. The values recorded are the mean of observations for that subject doing that activity. The names only reflect the variable names as recorded by the original data set.

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std()
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
