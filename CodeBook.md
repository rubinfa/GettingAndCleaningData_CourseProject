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




## References
[Ref 1] Human Activity Recognition Using Smartphones Data Set, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[Ref 2] GettingAndCleaningData_CourseProject GitHub repository, https://github.com/rubinfa/GettingAndCleaningData_CourseProject
