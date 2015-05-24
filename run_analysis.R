library(reshape2)

# Read the features data
features <- read.table("./features.txt")
feature_names <- features[,2]

# Read the activity labels data
activity_labels <- read.table("./activity_labels.txt",col.names = c("activity_id","activity_name"))

# Read the training data and label the columns
training_data <- read.table("./train/X_train.txt")
colnames(training_data) = feature_names

# Read the activity id's of the training data and label the column
training_activity_id <- read.table("./train/y_train.txt")
colnames(training_activity_id) = "activity_id"

# Read the subject id's of the training data and label the column
training_subject_id <- read.table("./train/subject_train.txt")
colnames(training_subject_id) = "subject_id"

# Read the test data and label the columns
test_data <- read.table("./test/X_test.txt")
colnames(test_data) = feature_names

# Read the activity id's of the test data and label the column
test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) = "activity_id"

# Read the subject id's of the test data and label the column
test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) = "subject_id"

###################################################################
# 1. Merge the training and test data sets to create one data set
###################################################################

# Combine training subject id's, training activity id's, and training data into one data frame
training_combined <- cbind(training_subject_id, training_activity_id, training_data)

# Combine test subject id's, test activity id's, and test data into one data frame
test_combined <- cbind(test_subject_id, test_activity_id, test_data)

# Combine the training_combined and test_combined into one data frame
all_data <- rbind(training_combined, test_combined)


###################################################################
# 2. Extract only the measurements on the mean and std
###################################################################

mean_std_data <- all_data[,grepl("subject_id|activity_id|mean|std",names(all_data),ignore.case=TRUE)]


###################################################################
# 3. Use descriptive names to name the activity in the data set
###################################################################

descr_data <- merge(activity_labels,mean_std_data,by.x="activity_id",by.y="activity_id",all=TRUE)


###################################################################
# 4. Label the data set with descriptive variable names
###################################################################

# Remove parentheses
names(descr_data) <- gsub('\\(|\\)',"",names(descr_data))

# Give clearer names
names(descr_data) <- gsub('Acc',"Acceleration",names(descr_data))
names(descr_data) <- gsub('Mag',"Magnitude",names(descr_data))
names(descr_data) <- gsub('^t',"TimeDomain-",names(descr_data))
names(descr_data) <- gsub('^f',"FrequencyDomain-",names(descr_data))


##########################################################################################################
# 5. Create a second, independent tidy data set with the mean of each variable for each activity & subject
##########################################################################################################

# Melt the data set
descr_data_melt <- melt(descr_data,id=c("activity_id","activity_name","subject_id"))

# Cast the melted data set based on the mean of each variable for each activity & subject
mean_data <- dcast(descr_data_melt,activity_id + activity_name + subject_id ~ variable,mean)

# Create a table with new tidy data set
write.table(mean_data,"./tidy_data.txt",row.names = FALSE)
