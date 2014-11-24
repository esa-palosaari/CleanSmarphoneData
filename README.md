This is repository is for a course project for the Coursera course Getting and Cleaning Data in November 2014.

Author is Esa Palosaari

The repository is based on the following work:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Folder 'UCI HAR Dataset' contains the original datasets and documentation,
including 'README.txt'. The original datasets include information about the physical human activities and movements and related data from smartphone sensors.

=============== What has been done in this repository =================

This repository includes the following files:
- 'run_analysis.R' which is code in R and produces the 'tidy.txt' file from the data in the folder 'UCI HAR Dataset'. The 'run_analysis.R' file merges the original training and test datasets, and adds variable names, identities of the subjects, and information about the activities to the dataset. The code includes only those originial variables which had mean or standard deviation in their names in lower case letters. Finally, it computes the averages for those variables according to subject and activity and writes dataset to the file 'tidy.txt'.
- 'tidy.txt' contains averages for 30 subjects for each of the activities for means and standard deviations of the original variables. Both training and test data are included in the dataset in the file and they are not distinguished by any variable.
- 'CodeBook.md' contains further information both about the original data and datasets and about the new dataset 'tidy.txt'


