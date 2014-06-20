Feature variables
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
1. tGravityAcc-XYZ
1. tBodyAccJerk-XYZ
1. tBodyGyro-XYZ
1. tBodyGyroJerk-XYZ
1. tBodyAccMag
1. tGravityAccMag
1. tBodyAccJerkMag
1. tBodyGyroMag
1. tBodyGyroJerkMag
1. fBodyAcc-XYZ
1. fBodyAccJerk-XYZ
1. fBodyGyro-XYZ
1. fBodyAccMag
1. fBodyAccJerkMag
1. fBodyGyroMag
1. fBodyGyroJerkMag

The mean value and the standard deviation value of the above measurements are included in this cleaned up date set, which give totally 66 measurement variables.

Besides these measurement variables, two additional variables indicating the subject and activity are also included:

1. subject.id
2. activity


Data
=================

The data set contains the average value of each measurement variable for each subject's activity. As there are totally 30 subjects and 6 types of activities, the data hence has 180 rows, each corresponding to one subject's one activity.

Transformations done
==================

Following are the major steps in cleaning up the original data to generate this data set:

1. Merge the measurement data, subject id and activity type of both the training and testing data together;
2. Extract only the mean and standard deviation measurements;
3. Replace the dummy variable names with the above descriptive names;
4. Replace the activity indexes in the original data to their actual names;
5. Compute the average of each variable according to the subject id and the activity jointly.


