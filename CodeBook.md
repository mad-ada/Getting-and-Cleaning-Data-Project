#CodeBook
## Data Source
Original data set: Hunman Activity Recognition Using Smartphones Dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data set decription: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Files and Variables 
The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train(test)/subject_train(test).txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'train(test)/Inertial Signals/total_acc_x_train(test).txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
* 'train(test)/Inertial Signals/body_acc_x_train(test).txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
* 'train(test)/Inertial Signals/body_gyro_x_train(test).txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Data Transformation
The raw data are processed with ```run_analysis```, and the following are detail steps:

### Merge training and test data

Merge trainging and test data (X_train.txt, X_test.txt), subject (subject_train.txt, subject_test.txt) and activity (y_train.txt, y_test.txt) to obtain a single data set.

### Extract mean and standard deviation measurements

Using ```features.txt``` to find all feastures' names, then extract ```mean```and ```std``` measurements from the merged data.

### Label each data variable, activity and subject

Label data variables and activity using ```activity_labels.txt``` and ```features.txt```.

### Create a tidy data set

Create a tidy data set where numeric variables are averraged for each activity and each subject.

## Tidy Dataset Summary

The tidy data contains 10299 instances and 81 variables (Activity, Subject, and 79 features):

* a subject carried out experiments(**subject**): ID from 1 to 30.
* an activity label(**Activity**): LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.
* 79 features in both time and frequency domain.
The following table shows 79 features in the data set. "XYZ" denotes three variables, one for each axis, and each including both mean and standard deviation.

NAME|TIME DOMAIN|FREQUENCY DOMAIN
----|---------|----------
BodyAcc|tBodyAcc.XYZ|fBodyAcc.XYZ
GravityAcc|tGravityAcc.XYZ|NA      
BodyAccJerk|tBodyAccJerk.XYZ|fBodyAccJerk.XYZ
BodyGyro|tBodyGyro.XYZ|fBodyGyro.XYZ
BodyGyroJerk|tBodyGyroJerk.XYZ|NA
BodyAccMag|tBodyAccMag|fBodyAccMag
GravityAccMag|tGravityAccMag|fGravityAccMag
BodyAccJerkMag|tBodyAccJerkMag|fBodyAccJerkMag
BodyGyroMag|tBodyGyroMag|fBodyGyroMag
BodyGyroJerkMag|tBodyGyroJerkMag|fBodyGyroJerkMag