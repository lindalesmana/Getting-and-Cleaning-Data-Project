# Code Book


activity_id		: identifier, identifying the activity performed by each subject_id. Integer values (1-6)

activity_name	: description of each activity_id (1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING)

subject_id 		: identifier, identifying the subject who performed the activity for each window sample. Integer values (1-30)

17 signals present in the data set. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* TimeDomain.BodyAcceleration-XYZ
* TimeDomain.GravityAcceleration-XYZ
* TimeDomain.BodyAccelerationJerk-XYZ
* TimeDomain.BodyGyro-XYZ
* TimeDomain.BodyGyroJerk-XYZ
* TimeDomain.BodyAccelerationMagnitude
* TimeDomain.GravityAccelerationMagnitude
* TimeDomain.AccelerationJerkMagnitude
* TimeDomain.GyroMagnitude
* TimeDomain.GyroJerkMagnitude
* FrequencyDomain.BodyAcceleration-XYZ
* FrequencyDomain.BodyAccelerationJerk-XYZ
* FrequencyDomain.BodyGyro-XYZ
* FrequencyDomain.BodyAccelerationMagnitude
* FrequencyDomain.BodyAccelerationJerkMagnitude
* FrequencyDomain.BodyGyroMagnitude
* FrequencyDomain.BodyGyroJerkMagnitude

There are several variables estimated from those signals. However, only mean() and std() are considered in the analysis.

The values in the file "tidy_data.txt" are the average of each variable for each activity and each subject.

