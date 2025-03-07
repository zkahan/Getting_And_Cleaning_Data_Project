
### Coursera - Data Science Specialization
## Getting and Cleaning Data Project

### Created by: Zammi Kahan


One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Data source description:
------------------------

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Feature Selection;

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


Objective of the assignment:
----------------------------
Objective of this assignment is to create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Along with above requirements, only below type of measurements used for the data file creation.

mean(): Mean value
std(): Standard deviation

The attached R script (run_analysis.R) is used to cleanup the source data obtained above and to generate two data sets for further analysis:

Tidy_UCI_HAR_Dataset.txt -- 
This is an intermediate result set, which contains the:
1. Merged data from both "Test" and "Train" data
2. Activity and subect for each row
3. Description for the each activity and column names. 

Tidy_UCI_HAR_AVG_Dataset.txt -- 
This is file is generated by the second independent tidy data set created with the average of each variable for each activity and each subject. 

Summary of the script as follows:
---------------------------------

In Summary run_analysis.R is used for following processing and transformations.
1. Download the source from the URL.
2. Merge X_train.txt and X_test.txt data file using cbing (both the file structures are identical)
3. Merge subject_train.txt and subject_test.txt data files using cbind.
4. Merge y_train.txt and y_test.txt data files using cbind.
5. Feature list is obtained from features.txt. Grep command is used to filter only "Mean" and "Std" features.
6. Above filtered feature list is used to get the Mean & Dtd data from above merged data sets as well as set their column names.
7. Then script does some clean up to the column names to make them user readable.
8. Activity lables are obtained from activity_labels.txt file.
9. All above data sets are joined to create a data frame to generate the cleaned data file Tidy_UCI_HAR_Dataset.txt.
10. Aggregate function is applied on above data frame, in Subject & Activity level to get the mean of the columns. Resulted data frame is used to generate the file Tidy_UCI_HAR_AVG_Dataset.txt.


Variables used to identify source data:

har_url  - Location of the source data
zip_file - Name of the data file that is downloaded to local directory
data_dir - Extracted data directory name
Assumption: Data file is downloaded to the current R Work Directory.

Following are the variables used to store data sets:

tmp1 - Temporary variable used to store "Train" data
tmp2 - Temporary variable used to store "Test" data
X_data - Variable used for merged X_train.txt and X_test.txt data
S_data - Variable used for merged subject_train.txt and subject_test.txt data
Y_data - Variable used for merged y_train.txt and y_test.txt data

features - Variable used to store "features.txt" data
mean_std_features - Intermediate variable used to capture data related to Mean and Std.
activities <- Intermediate variable used to capture "activity_labels.txt" data.

tidy_data - Tidy / merged data are loaded to this variable. It is used to generate the data file "Tidy_UCI_HAR_Dataset.txt".

tidy_avg_data - Average calculation is stored in this variable. This data used to generate the final data file "Tidy_UCI_HAR_AVG_Dataset.txt".

Complete set of the variables included in the data file are as follows:

Subject                   
Activity                 
tBodyAcc_Mean_X           
tBodyAcc_Mean_Y          
tBodyAcc_Mean_Z           
tBodyAcc_Std_X           
tBodyAcc_Std_Y            
tBodyAcc_Std_Z           
tGravityAcc_Mean_X        
tGravityAcc_Mean_Y       
tGravityAcc_Mean_Z        
tGravityAcc_Std_X        
tGravityAcc_Std_Y         
tGravityAcc_Std_Z        
tBodyAccJerk_Mean_X       
tBodyAccJerk_Mean_Y      
tBodyAccJerk_Mean_Z       
tBodyAccJerk_Std_X       
tBodyAccJerk_Std_Y        
tBodyAccJerk_Std_Z       
tBodyGyro_Mean_X          
tBodyGyro_Mean_Y         
tBodyGyro_Mean_Z          
tBodyGyro_Std_X          
tBodyGyro_Std_Y           
tBodyGyro_Std_Z          
tBodyGyroJerk_Mean_X      
tBodyGyroJerk_Mean_Y     
tBodyGyroJerk_Mean_Z      
tBodyGyroJerk_Std_X      
tBodyGyroJerk_Std_Y       
tBodyGyroJerk_Std_Z      
tBodyAccMag_Mean          
tBodyAccMag_Std          
tGravityAccMag_Mean       
tGravityAccMag_Std       
tBodyAccJerkMag_Mean      
tBodyAccJerkMag_Std      
tBodyGyroMag_Mean         
tBodyGyroMag_Std         
tBodyGyroJerkMag_Mean     
tBodyGyroJerkMag_Std     
fBodyAcc_Mean_X           
fBodyAcc_Mean_Y          
fBodyAcc_Mean_Z           
fBodyAcc_Std_X           
fBodyAcc_Std_Y            
fBodyAcc_Std_Z           
fBodyAccJerk_Mean_X       
fBodyAccJerk_Mean_Y      
fBodyAccJerk_Mean_Z       
fBodyAccJerk_Std_X       
fBodyAccJerk_Std_Y        
fBodyAccJerk_Std_Z       
fBodyGyro_Mean_X          
fBodyGyro_Mean_Y         
fBodyGyro_Mean_Z          
fBodyGyro_Std_X          
fBodyGyro_Std_Y           
fBodyGyro_Std_Z          
fBodyAccMag_Mean          
fBodyAccMag_Std          
fBodyBodyAccJerkMag_Mean  
fBodyBodyAccJerkMag_Std  
fBodyBodyGyroMag_Mean     
fBodyBodyGyroMag_Std     
fBodyBodyGyroJerkMag_Mean 
fBodyBodyGyroJerkMag_Std 


Description of the source data used for above data preparation as follows as follows:

Source data location: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

