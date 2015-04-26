## Create one R script called run_analysis.R that does the following
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurements
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.

if (!require("data.table")) {
    install.packages("data.table")
}

if (!require("reshape2")) {
    install.packages("reshape2")
}

require("data.table")
require("reshape2")

# read feature data files: 'train/X_train.txt' and 'test/X_test.txt'
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")

# read activity labels files: 'train/y_train.txt' and 'test/y_txt'
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# read subjects files: 'train/subject_train.txt' and 'test/subject_test.txt'
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge train and test data
dataFeatures <- rbind(featuresTrain, featuresTest)
dataActivity <- rbind(activityTrain, activityTest)
dataSubject <- rbind(subjectTrain, subjectTest)

# extract only mean and sd measurements.
# set labels for each data variable, activity and subject.
# merges the training and the test sets to create one data set.
featuresNames <- read.table("./UCI HAR Dataset/features.txt")[,2]
extractFeatures <- grepl("mean|std", featuresNames)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

names(dataFeatures) <- featuresNames
dataFeatures <- dataFeatures[, extractFeatures]

dataActivity[,2] <- activity_labels[dataActivity[,1]]
names(dataActivity) <- c("activity_ID", "activity_Label")
names(dataSubject) <- "subject"

data <- cbind(as.data.table(dataSubject), dataActivity, dataFeatures)

# create a second, independent tidy data set and output it
id_labels = c("subject", "activity_ID", "activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

tidy_data   = dcast(melt_data, subject + activity_Label ~ variable, mean)
write.table(tidy_data, file = "./tidy_data.txt", row.name = FALSE)
