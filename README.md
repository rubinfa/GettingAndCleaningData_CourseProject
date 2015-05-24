#Getting and Cleaning Data Project - README
Fausto Rubino
24/05/2015

##Introduction
This repository contains all the resources required for the Getting and Cleaning Data Project course project. The analysis of the project is performed on the 'Human Activity Recognition Using Smartphones'  Data Set, which can be downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Objective of the analysis
The repository contains the run_analysis.R scrit, which merges the test and training sets together. Prerequisites for this script are the following:

1. the UCI HAR Dataset must be extracted in the working directory
2. the UCI HAR Dataset must be called "UCI HAR Dataset"

After merging testing and training, the script will create a tidy data set containing the average of means and standard deviations of the original data set, organised by subject and activity.

##Content of the repository
The repository contains the following files:

1. README.md: this file
2. CodeBook.md: file explaining the analysis done, as well as the content of the final cleaned-up dataset
3. run_analysis.R: R script responsible for generating the final and cleaned data set
4. tidyDataSet.txt: the cleaned data set
5. UCI HAR Dataset: 'Human Activity Recognition Using Smartphones Data Set' on which the transformations have been carried out
