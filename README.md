
#Getting and Cleaning Data Course Assignment - May 2015
-----------------

The run_analysis.R script reads data from the "Human Activity Recognition Using Smartphones Dataset Version 1.0" and produces a new, tidy data set that can be used for further analysis.

The data in the "Human Activity Recognition Using Smartphones Dataset Version 1.0" have been taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## The original data set includes the following data:
------------------
* 'features.txt': List of all features

* 'activity_labels.txt': Links the class labels with their activity name

* 'train/X_train.txt': Training set

* 'train/y_train.txt': Training labels

* 'train/subject_train.txt': ID's of subjects in the training data

* 'test/X_test.txt': Test set

* 'test/y_test.txt': Test labels

* 'test/subject_test.txt': ID's of subjects in the test data

For more information about the "Human Activity Recognition Using Smartphones Dataset Version 1.0", please contact: activityrecognition@smartlab.ws.



## Summary of the script
------------------
The run_analysis.R script takes data from multiple .txt files and produces a tidy data set that can be used for further analysis.

Below is brief description of the script:

* The first step is to read all the required .txt files and label the data sets.

* The function cbind() is then used to append "subject_id" and "activity_id" to both the "training" and "test" data sets. The result is one data set for training data and another data set for test data.

* Using the function rbind(), training and test data is combined into a single data set (all_data).

* The function grepl() extracts only the columns "subject_id", "activity_id", and all columns containing the label "mean" and "std". A new data set (mean_std_data) is created.

* The function merge() is used to merge the "mean_std_data" with the "activity_labels" to create a data set with descriptive name for each activity_id.

*  The data set is then labeled with more descriptive column names.

* With the function melt() and dcast() of the "reshape2" package, the data is converted into a table containing mean values of all the variables, ordered by the "activity_name" and the "subject_id".

* Finally, using the function write.table(), the data is written to the "tidy_data.txt" file. 


## License
-----------

Usage of all data sets stated above must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This data set is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.