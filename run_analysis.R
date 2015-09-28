library(dplyr)
getwd()

#load feature file which will be user to label the X_train and X_test files
features <- read.table(file="./UCI HAR Dataset/features.txt")
head(features)
features[,2]
#load train and test files
X_test <- read.table(file="./UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
X_train <- read.table(file="./UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
Y_test <- read.table(file="./UCI HAR Dataset/test/Y_test.txt")
Y_train <- read.table(file="./UCI HAR Dataset/train/Y_train.txt")
subject_test <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")

#Merge data sets (Test and train)
X_full <- rbind(X_test,X_train)
Y_full <- rbind(Y_test,Y_train)
subject_full <- rbind(subject_test,subject_train)

#load the activity names table
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- rename(activity_labels, Id = V1)
activity_labels <- rename(activity_labels, Label = V2)

#start adding columns to create the full dataset
#first, the subject data frame goes to the beggining of the full dataframe
full <- cbind(subject_full,X_full)
full <- rename(full,Subject = V1)
#second, the activity data frame
full <- cbind(Y_full,full)
full <- rename(full,ActivityId = V1)
# now, merge the full dataset to include the activity names
# dataset will be reordered by ActivityId
complete <- merge(full,activity_labels,by.x = "ActivityId", by.y = "Id")

#creates a logical vector which contains the columns with mean() and std() measurements
mean_std_logical <- grepl("\\.mean\\.",names(complete)) | grepl("\\.std\\.",names(complete))
#add to the logical vector the activityId, subject and activity label
mean_std_logical[1:2] <- TRUE
mean_std_logical[564] <- TRUE
#apply the logical vector creating the new vector with only the mean and std measurements
mean_std_measurements <- complete[,mean_std_logical]

#group data by subject and activity label
tidy_data <- group_by(mean_std_measurements,Subject,Label)
#summarise subject and activity label showing the mean of all the measurements
tidy_answer <- summarise_each_(tidy_data,funs(mean),names(tidy_data)[3:68])

View(tidy_answer)
# save data to main directory
write.table(tidy_answer,file = "course_project_q1.txt", row.names = FALSE)

