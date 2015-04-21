# run_analysis.R
This is a repository containing the script for performing the analysis and supporting files for the Getting and Cleaning Data Course Project.

The project covers one of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script 'run_analysis.R' performs the following steps for this analysis:

1. Include 'reshape2' library for final data set manipulation
2. Reads the data files: train set, test set, activity labels and features names
3. Merges the training and the test sets to create one data set
4. Appropriately labels the data set with descriptive variable names
5. Merges Activity Labels, Subjects and the Observations into one data set
6. Extracts only the measurements on the mean and standard deviation for each measurement
7. Uses descriptive activity names to name the activities in the data set
8. From the data set in hand, creates a second, independent tidy data set with the average of each variable for each activity and each subject
9. Creates the averages tidy dataset
10. Writes the output text file containing this tidy data set with averages