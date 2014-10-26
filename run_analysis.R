# Assignment Instructions:
#
#       1. Merges the training and the test sets to create one data set.
#
#       2. Extracts only the measures on the mean and standard deviation for 
#         each measurement. 
#
#       3. Descriptive activity names to name the activities in the data set
#
#       4. Appropriately labels the data set with descriptive variable names. 
#
#       5. From the data set in step 4, creates a second, independent tidy data
#         set with the average of each variable for each activity and each 
#         subject.
#
#   *~ See the README for more indepth information. ~*
#
################################################################################

# 1. Merges the training and the test sets to create one data set.
#
#   i. Make dataframes of test and training sets
#
#       a. Test sets
file1 <- "./UCI HAR Dataset/test/subject_test.txt"
test1 <- read.table (file1, header = FALSE)
file2 <- "./UCI HAR Dataset/test/X_test.txt"
test2 <- read.table (file2, header = FALSE)
file3 <- "./UCI HAR Dataset/test/y_test.txt"
test3 <- read.table (file3, header = FALSE)

test <- data.frame(test2, test1, test3)

#       b. Training sets
file4 <- "./UCI HAR Dataset/train/subject_train.txt"
train1 <- read.table (file4, header = FALSE)
file5 <- "./UCI HAR Dataset/train/X_train.txt"
train2 <- read.table (file5, header = FALSE)
file6 <- "./UCI HAR Dataset/train/y_train.txt"
train3 <- read.table (file6, header = FALSE)

train <- data.frame(train2, train1, train3)

#   ii. Merge the two dataframes vertically
data <- rbind(test, train)
#
################################################################################
#
# 2. Extracts only the measures on the mean and standard deviation for 
#    each measurement.
# 
#   i. Put in the Column names
file7 <- "./UCI HAR Dataset/features.txt"
features <- read.table (file7, header = FALSE)

names <- as.vector(features[,2])
morenames <- c("Subject", "Activity")
names <- append(names, morenames)

colnames(data) <- names

#   ii. Extract columns with measure for the mean and standard deviation
measures <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
              "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", 
              "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", 
              "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", 
              "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
              "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", 
              "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", 
              "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", 
              "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
              "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", 
              "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", 
              "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", 
              "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", 
              "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", 
              "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", 
              "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", 
              "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", 
              "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", 
              "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", 
              "fBodyGyro-std()-Z", "fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", 
              "fBodyGyro-meanFreq()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", 
              "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", "fBodyBodyAccJerkMag-meanFreq()", 
              "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", 
              "fBodyBodyGyroJerkMag-std()", "Activity", "Subject")

workingdata <- subset(data, select = measures)

#
################################################################################
#
# 3. Descriptive activity names to name the activities in the data set
#
#   i. Change Activity coloumn from integers to levels (factor)
workingdata$Activity <- as.factor(data$Activity)

#   ii. Get activity labels
file9 <- "./UCI HAR Dataset/activity_labels.txt"
activities <- read.table (file9, header = FALSE)

labels <- as.vector(activities[,2])

#   iii. Replace the levels in the df with them
levels(workingdata$Activity) <- labels
#
################################################################################
#
# 4. Appropriately labels the data set with descriptive variable names.
# (this is accomplished in step 2.i)
#
################################################################################
#
# 5. From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject.
#
#   i. Make subject a level as well.
workingdata$Subject <- as.factor(data$Subject)

#   ii. Melt and then recast the data
meltdata <- melt(workingdata, id = c("Activity", "Subject"), 
                 measure.vars = c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", 
                                  "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", 
                                  "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", 
                                  "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", 
                                  "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", 
                                  "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", 
                                  "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", 
                                  "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", 
                                  "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", 
                                  "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", 
                                  "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", 
                                  "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", 
                                  "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", 
                                  "tBodyGyroJerkMag-std()", "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", 
                                  "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", 
                                  "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", 
                                  "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", 
                                  "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", 
                                  "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", 
                                  "fBodyGyro-std()-Z", "fBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", 
                                  "fBodyGyro-meanFreq()-Z", "fBodyAccMag-mean()", "fBodyAccMag-std()", 
                                  "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", 
                                  "fBodyBodyAccJerkMag-meanFreq()", "fBodyBodyGyroMag-mean()", 
                                  "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", 
                                  "fBodyBodyGyroJerkMag-std()"))

finaldata <- dcast(meltdata, Activity*Subject ~ variable, mean)

#   iii. Save output as a seperate file (.txt)
write.table(finaldata, file = "./answer1.txt", row.name = FALSE)