##   Inputs, Data Transformations and Outputs

##  Inputs

###  Note:
README.txt in the directory "UCI HAR Dataset" contains information reagrding the experiement and available data files.  
Please review this information.

###  Files Used
*  'features.txt' - meaningful labels for the measured data (in X train and test)
*  'train/X_train.txt' - measured feature data
*  'train/y_train.txt' - activity labels for the measured data
*  'train/subject_train.txt' - subject labels for the measured data
*  'test/X_test.txt' - measured feature data
*  'test/y_test.txt' - activity labels for the measured data
*  'test/subject_test.txt' - subject labels for the measured data

###  Data Transformations
*	_read.table_ is used to load the data.  'UCI HAR Dataset' must be in the working directory
*	_grep_ is used with "mean" and "std" to identify the columns we want.  grep is applied to the labels in features.txt
*	Labels are assigned to activities (from Y train and test) by subsetting the six numeric activities one at a time and assigning the corresponding label from activity label.
*	_rbind_ is used to combine the datasets from train and test
*	_cbind_ is used to combine subject labels, activity labels, and measured data
*	_melt_ and _decast_ are used to reduce the dataset down to only the means of our selected variables and the identifiers
*	_write.csv_ is used to write the resulting tidy dataset.

### Output Table
tidydataset.txt is written to the working directory. 

#### Columns
*  Subject - numeric identifier from 1 to 30 identifying which of the 30 experiment subjects the data pertains to
*  Activity - descriptive label identifying which of six activities the data pertains to
*  79 Different experiment variables, including: 

1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
7 tGravityAcc-mean()-X
8 tGravityAcc-mean()-Y
9 tGravityAcc-mean()-Z
10 tGravityAcc-std()-X
11 tGravityAcc-std()-Y
12 tGravityAcc-std()-Z
13 tBodyAccJerk-mean()-X
14 tBodyAccJerk-mean()-Y
15 tBodyAccJerk-mean()-Z
16 tBodyAccJerk-std()-X
17 tBodyAccJerk-std()-Y
18 tBodyAccJerk-std()-Z
19 tBodyGyro-mean()-X
20 tBodyGyro-mean()-Y
21 tBodyGyro-mean()-Z
22 tBodyGyro-std()-X
23 tBodyGyro-std()-Y
24 tBodyGyro-std()-Z
25 tBodyGyroJerk-mean()-X
26 tBodyGyroJerk-mean()-Y
27 tBodyGyroJerk-mean()-Z
28 tBodyGyroJerk-std()-X
29 tBodyGyroJerk-std()-Y
30 tBodyGyroJerk-std()-Z
31 tBodyAccMag-mean()
32 tBodyAccMag-std()
33 tGravityAccMag-mean()
34 tGravityAccMag-std()
35 tBodyAccJerkMag-mean()
36 tBodyAccJerkMag-std()
37 tBodyGyroMag-mean()
38 tBodyGyroMag-std()
39 tBodyGyroJerkMag-mean()
40 tBodyGyroJerkMag-std()
41 fBodyAcc-mean()-X
42 fBodyAcc-mean()-Y
43 fBodyAcc-mean()-Z
44 fBodyAcc-std()-X
45 fBodyAcc-std()-Y
46 fBodyAcc-std()-Z
47 fBodyAcc-meanFreq()-X
48 fBodyAcc-meanFreq()-Y
49 fBodyAcc-meanFreq()-Z
50 fBodyAccJerk-mean()-X
51 fBodyAccJerk-mean()-Y
52 fBodyAccJerk-mean()-Z
53 fBodyAccJerk-std()-X
54 fBodyAccJerk-std()-Y
55 fBodyAccJerk-std()-Z
56 fBodyAccJerk-meanFreq()-X
57 fBodyAccJerk-meanFreq()-Y
58 fBodyAccJerk-meanFreq()-Z
59 fBodyGyro-mean()-X
60 fBodyGyro-mean()-Y
61 fBodyGyro-mean()-Z
62 fBodyGyro-std()-X
63 fBodyGyro-std()-Y
64 fBodyGyro-std()-Z
65 fBodyGyro-meanFreq()-X
66 fBodyGyro-meanFreq()-Y
67 fBodyGyro-meanFreq()-Z
68 fBodyAccMag-mean()
69 fBodyAccMag-std()
70 fBodyAccMag-meanFreq()
71 fBodyBodyAccJerkMag-mean()
72 fBodyBodyAccJerkMag-std()
73 fBodyBodyAccJerkMag-meanFreq()
74 fBodyBodyGyroMag-mean()
75 fBodyBodyGyroMag-std()
76 fBodyBodyGyroMag-meanFreq()
77 fBodyBodyGyroJerkMag-mean()
78 fBodyBodyGyroJerkMag-std()
79 fBodyBodyGyroJerkMag-meanFreq()
