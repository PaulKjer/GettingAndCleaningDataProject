Getting And Cleaning Data Project
=================================

The script required to run this analysis can be found in **run_analysis.R** in this repo.
Command level documentation is provide in the run_analysis.R script.

####	Key Assumptions
*  	The data has been downloaded and unzipped and the directory is available within the working directory.
	This assumption is based on the evalation rubric, which says – “can be run as long as the Samsung data is in your working directory.“
*	For our purposes, the data in the “Inertial Signals” directories is not required.  
*	The subjects in the training dataset and the testing dataset are the same subjects – combining them into a single
	dataset will not invalidate the data. 
*  	For our purposes, only measurements containing the text mean or std will be used 
*	A single tidy dataset, representing the means of the selected variables for each subject/activity combindation
	is the only desired output. 

####  	Packages 
This script uses the melt and decast functions from the reshape2 package.  This script will install the package reshape2 if it is not already installed.
	
####  Note:
README.txt in the directory "UCI HAR Dataset" contains information reagrding the experiement and available data files.  
P1lease review this information.

####	Input Data
* 'features.txt' - meaningful labels for the measured data (in X train and test)
* 'train/X_train.txt' - measured feature data
* 'train/y_train.txt' - activity labels for the measured data
* 'train/subject_train.txt' - subject labels for the measured data
* 'test/X_test.txt' - measured feature data
* 'test/y_test.txt' - activity labels for the measured data
* 'test/subject_test.txt' - subject labels for the measured data

Additional detail regarding the input is available in this repo in codebook.md


####	Outline of Approach
*	Read the data using _read.table_.  We assume 'UCI HAR Dataset' is in the working directory and set _file.path_ 		based on that assumption.
*	Limit the data to only features pertaining to mean and standard deviation by reading features.txt and using grep to identify the columns we want then subsetting the measured data to only those columns
*	assign meaningful labels to the activities (from Y train and test) by subsetting the six numeric activities one at a time and assigning the corresponding label from activity label.
*	Use _rbind_ to combine the datasets from train and test
*	Use _cbind_ to combine subject labels, activity labels, and measured data
*	Use _melt_ and _decast_ to reduce the dataset down to only the means of our selected variables and the identifiers
*	Use write.csv to write the resulting tidy dataset.

####	Output Table

The output table is a comma delimited CSV table **tidydataset.txt** written to the  with the structure outlined in the table below.  (Note that the table has the extension .txt even though it is a valid .csv table to avoid Coursera upload issues).

Additional detail regarding the output is available in codebook.md in this repo. 

| subject |  activity  |  tBodyAcc-mean()-X | 77 Other Measured Variables (total of 79) | fBodyBodyGyroJerkMag-meanFreq()|
|-------------|-----------------|-----------------------|---|----------------------|
| 1           |  meaningful activity name  | mean of variable for the combination of subject/activity
| 2 - 29 | each of the 30 subjects has six activties | | | |
| 30          |                 |                         |                        |
