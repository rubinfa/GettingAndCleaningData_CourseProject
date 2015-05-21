#####################################################################################################
## 0. Prerequisites
#####################################################################################################
library(dplyr)
library(plyr)

#If the files are not in the current working folder, display a message
dataDirectoryBasePath <- "./UCI HAR Dataset"

if (!file.exists(dataDirectoryBasePath)) {
      stop(paste("The directory 'UCI HAR Dataset' does not exist in ", getwd()))
}

#####################################################################################################
## 1. Merges the training and the test sets to create one data set.
#####################################################################################################
features <- read.table(paste0(dataDirectoryBasePath, "/features.txt"), sep = " ", header = FALSE, col.names = c("featureid","description"))

subjectsTraining     <- read.table(paste0(dataDirectoryBasePath, "/train/subject_train.txt"), sep = " ", header = FALSE, col.names = c("subjectid"), stringsAsFactors=FALSE)
subjectsTest         <- read.table(paste0(dataDirectoryBasePath, "/test/subject_test.txt"), sep = " ", header = FALSE, col.names = c("subjectid"), stringsAsFactors=FALSE)
subjects <- rbind(subjectsTraining, subjectsTest)

activityIdsTraining  <- read.table(paste0(dataDirectoryBasePath, "/train/y_train.txt"), header = FALSE, col.names = c("activityid"), stringsAsFactors=FALSE)
activityIdsTest      <- read.table(paste0(dataDirectoryBasePath, "/test/y_test.txt"), header = FALSE, col.names = c("activityid"), stringsAsFactors=FALSE)
activityIds <- rbind(activityIdsTraining, activityIdsTest)

measurementsTraining <- read.table(paste0(dataDirectoryBasePath, "/train/X_train.txt"), header = FALSE, col.names = features$description, stringsAsFactors=FALSE)
measurementsTest     <- read.table(paste0(dataDirectoryBasePath, "/test/X_test.txt"), header = FALSE, col.names = features$description, stringsAsFactors=FALSE)
measurements <- rbind(measurementsTraining, measurementsTest)

mergedDataSet <- cbind(subjects, activityIds, measurements)

#####################################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#####################################################################################################
indexes <- grep("subjectid|activityid|mean|std", names(mergedDataSet))
mergedDataSet <- select(mergedDataSet, indexes)
write.table(mergedDataSet, file="./UCI HAR Dataset/mergedDataSet.txt",  row.names=FALSE, sep="\t", quote=FALSE)

#####################################################################################################
## 3. Uses descriptive activity names to name the activities in the data set
#####################################################################################################
activities <- read.table(paste0(dataDirectoryBasePath, "/activity_labels.txt"), sep = " ", header = FALSE, col.names = c("activityid","description"))
mergedDataSet <- merge(x = activities, y = mergedDataSet, by = "activityid")

#####################################################################################################
## 4. Appropriately labels the data set with descriptive variable names.
#####################################################################################################
# The name of the columns was already set when calling the read.table function col.names = features$description
mergedDataSet <- rename(mergedDataSet, c("description"="activity", "subjectid"="subject"))
mergedDataSet <- select(mergedDataSet, -activityid)

#####################################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#####################################################################################################
tidyDataSet <- group_by(mergedDataSet, activity, subject)
tidyDataSet <- summarise_each(tidyDataSet, funs(mean))
tidyDataSet <- arrange(tidyDataSet, activity, subject)
write.table(tidyDataSet, file="./UCI HAR Dataset/tidyDataSet.txt",  row.names=FALSE, sep="\t", quote=FALSE)
