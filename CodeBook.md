#Getting and Cleaning Data Project - CodeBook
Fausto Rubino
24/05/2015

## Purpose of the CodeBook
This file describes the variables, the data, and any transformations that were performed, to clean up the 'Human Activity Recognition Using Smartphones Data Set' [Ref 1].
The script responsible for generating the cleaned data set is called 'run_analysis.R' and can be found in the root folder of the my github repository GettingAndCleaningData_CourseProject [Ref 2]
The script 'run_analysis.R' generates a txt file called 'tidyDataSet.txt', which contains the cleaned-up data set, after applying several transformations, as described below.

## Transformation performed by the 'run_analysis.R' script
The script first loads the libraries needed for the transformation:
```
library(dplyr)
library(plyr)
```
It also checks that the 'Human Activity Recognition Using Smartphones Data Set' has correctly been unzipped in the working directory:
```
dataDirectoryBasePath <- "./UCI HAR Dataset"

if (!file.exists(dataDirectoryBasePath)) {
      stop(paste("The directory 'UCI HAR Dataset' does not exist in ", getwd()))
}
```

If the previous steps succeed, the scripts proceeds by merging the training and the test sets to create a single one.
To do this, the script first loads the list of 'features', which will be used to name the colums of the cleaned-up data set 
```
features <- read.table(paste0(dataDirectoryBasePath, "/features.txt"), sep = " ", header = FALSE, col.names = c("featureid","description"))
```
The script merges separetely the subjects, y (activities), and X (measurements) data sets and combines them together  
```
subjects <- rbind(subjectsTraining, subjectsTest)
activityIds <- rbind(activityIdsTraining, activityIdsTest)
measurements <- rbind(measurementsTraining, measurementsTest)

mergedDataSet <- cbind(subjects, activityIds, measurements)
```



## References
[Ref 1] Human Activity Recognition Using Smartphones Data Set, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[Ref 2] GettingAndCleaningData_CourseProject GitHub repository, https://github.com/rubinfa/GettingAndCleaningData_CourseProject
