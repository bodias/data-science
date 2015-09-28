CodeBook
===========

This is a guide for anyone who needs to understand the steps for creating the tidy Data Set in R:

* The folder "UCI HAR Dataset" contains the raw files of the project.
* The description of each data file can be found both on the file "UCI HAR Dataset\README.txt" and the project site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The steps described below use the data files inside the "UCI HAR Dataset" folder to create a new tidy dataset, named "course_project_q1.txt".

1. Loading each project file/data set to its corresponding data frame in R:

* features = UCI HAR Dataset/features.txt
* X_test = UCI HAR Dataset/test/X_test.txt -> using the features dataset above as col.names
* X_train = UCI HAR Dataset/train/X_train.txt -> using the features dataset above as col.names
* Y_test = UCI HAR Dataset/test/Y_test.txt
* Y_train = UCI HAR Dataset/train/Y_train.txt
* subject_test = UCI HAR Dataset/test/subject_test.txt
* subject_train = UCI HAR Dataset/train/subject_train.txt
* activity_labels = UCI HAR Dataset/activity_labels.txt

2. Merging Test and Train data frames using rbind function:

* X_full = X_test and X_train merged
* Y_full = Y_test and Y_train merged
* subject_full = subject_test and subject_train merged

3. Putting all data frames together :

* full = data frame containing X,Y and subject merged
* complete = same as full plus the activity labels

4. Extracting only mean() and std() measurements:

* creates a logical vector containing the columns which names matches "mean" and "std" plus activityId, subject and activity label (label)
* then subset the complete data frame using the logical vector, resulting the mean_std_measurements data frame

5. Generating the tidy data set:

* tidy_data = group the data frame by subject and activity label (label)
* tidy_answer = Average of each variable (see the list below) for each activity label and subject:
"tBodyAcc.mean...X"           
"tBodyAcc.mean...Y"          
"tBodyAcc.mean...Z"           
"tBodyAcc.std...X"           
"tBodyAcc.std...Y"            
"tBodyAcc.std...Z"           
"tGravityAcc.mean...X"        
"tGravityAcc.mean...Y"       
"tGravityAcc.mean...Z"        
"tGravityAcc.std...X"        
"tGravityAcc.std...Y"         
"tGravityAcc.std...Z"        
"tBodyAccJerk.mean...X"       
"tBodyAccJerk.mean...Y"      
"tBodyAccJerk.mean...Z"       
"tBodyAccJerk.std...X"       
"tBodyAccJerk.std...Y"        
"tBodyAccJerk.std...Z"       
"tBodyGyro.mean...X"          
"tBodyGyro.mean...Y"         
"tBodyGyro.mean...Z"          
"tBodyGyro.std...X"          
"tBodyGyro.std...Y"           
"tBodyGyro.std...Z"          
"tBodyGyroJerk.mean...X"      
"tBodyGyroJerk.mean...Y"     
"tBodyGyroJerk.mean...Z"      
"tBodyGyroJerk.std...X"      
"tBodyGyroJerk.std...Y"       
"tBodyGyroJerk.std...Z"      
"tBodyAccMag.mean.."          
"tBodyAccMag.std.."          
"tGravityAccMag.mean.."       
"tGravityAccMag.std.."       
"tBodyAccJerkMag.mean.."      
"tBodyAccJerkMag.std.."      
"tBodyGyroMag.mean.."         
"tBodyGyroMag.std.."         
"tBodyGyroJerkMag.mean.."     
"tBodyGyroJerkMag.std.."     
"fBodyAcc.mean...X"           
"fBodyAcc.mean...Y"          
"fBodyAcc.mean...Z"           
"fBodyAcc.std...X"           
"fBodyAcc.std...Y"            
"fBodyAcc.std...Z"           
"fBodyAccJerk.mean...X"       
"fBodyAccJerk.mean...Y"      
"fBodyAccJerk.mean...Z"       
"fBodyAccJerk.std...X"       
"fBodyAccJerk.std...Y"        
"fBodyAccJerk.std...Z"       
"fBodyGyro.mean...X"          
"fBodyGyro.mean...Y"         
"fBodyGyro.mean...Z"          
"fBodyGyro.std...X"          
"fBodyGyro.std...Y"           
"fBodyGyro.std...Z"          
"fBodyAccMag.mean.."          
"fBodyAccMag.std.."          
"fBodyBodyAccJerkMag.mean.."  
"fBodyBodyAccJerkMag.std.."  
"fBodyBodyGyroMag.mean.."     
"fBodyBodyGyroMag.std.."     
"fBodyBodyGyroJerkMag.mean.." 
"fBodyBodyGyroJerkMag.std.." 