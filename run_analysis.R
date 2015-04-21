#run_analysis.R

# Include 'reshape2' library for final data set manipulation
library("reshape2")

## Reading data files
# Read train set files - Observations, labels and subjects
trainDSObservations = read.csv("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
trainDSLabels = read.csv("./UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
trainDSSubjects = read.csv("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

# Read test set files - Observations, labels and subjects
testDSObservations = read.csv("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testDSLabels = read.csv("./UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testDSSubjects = read.csv("./UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# Read activity label descriptions mapping table
activityLabelDescriptionsMT = read.csv("./UCI HAR Dataset/activity_labels.txt", sep="", stringsAsFactors=FALSE, header=FALSE)

# Read feature names table
features = read.csv("./UCI HAR Dataset/features.txt", sep="", header=FALSE)

## Merging the training and the test sets to create one data set
mergedDS = rbind(trainDSObservations, testDSObservations)
mergedLabels = rbind(trainDSLabels, testDSLabels)
mergedSubjects = rbind(trainDSSubjects, testDSSubjects)

## Appropriately labeling the data set with descriptive variable names 
colnames(mergedDS) <- features[, 2]
colnames(mergedLabels) <- "Activity"
colnames(mergedSubjects) <- "Subject"

# Merging Activity Labels, Subjects and the Observations
mergedDS <- cbind(mergedLabels, mergedSubjects, mergedDS)

## Extracting only the measurements on the mean and standard deviation for each measurement
meanAndStdColumns <- grep("-mean\\(\\)|-std\\(\\)", colnames(mergedDS))
meanAndStdMergedDS <- mergedDS[,c(1,2,meanAndStdColumns)]

## Using descriptive activity names to name the activities in the data set
meanAndStdMergedDS[,1] <- cbind(meanAndStdMergedDS[,1],activityLabelDescriptionsMT[meanAndStdMergedDS[,1],2])[,2]

## From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject
# Creating the averages tidy dataset
meltDS<-melt(meanAndStdMergedDS, id.var = c("Subject", "Activity"))
tidyMeansDS = dcast(meltDS , Subject + Activity ~ variable, mean)

# Writing output
write.table(tidyMeansDS, "./tidyDS.txt", row.names = FALSE)