
#  Outline of Approach

#  *  Read the data using _read.table_.  We assume 'UCI HAR Dataset' is in the working directory and set _file.path_ 		based on that assumption.
#  *  Limit the data to only features pertaining to mean and standard deviation by reading features.txt and using grep to identify the columns we want then subsetting the measured data to only those columns
#  *  assign meaningful labels to the activities (from Y train and test) by subsetting the six numeric activities one at a time and assigning the corresponding label from activity label.
#  *  Use _rbind_ to combine the datasets from train and test
#  *  Use _cbind_ to combine subject labels, activity labels, and measured data
#  *  Use _melt_ and _decast_ to reduce the dataset down to only the means of our selected variables and the identifiers
#  *  Use write.table to write the resulting tidy dataset.# Read the measured data for both train and test and combine them into one dataset

        #  Read X_train
        path_X_train <- file.path("UCI HAR Dataset","train","X_train.txt")
        ds_X_train   <- read.table(path_X_train,header=FALSE)
    
        #  Read X_test 
        path_X_test <- file.path("UCI HAR Dataset","test","X_test.txt")
        ds_X_test   <- read.table(path_X_test,header=FALSE)
    
        #  Combine the rows of measured train and test data with rbind
        ds_X_all <- rbind(ds_X_train,ds_X_test)
        

# Select feature labels with the test mean or std in the label, limit our dataset to only those columns, 
# and apply meaningful labels to the columns. 
    
        #  Read the feature labels from features.txt
        path_featurelabels <- file.path("UCI HAR Dataset","features.txt")   # use file.path for platform independence
        ds_featurelabels   <- read.table(path_featurelabels,header=FALSE)
    
        #  meanstdmatches is a vector containing the strings we want to search for within the labels in features.txt
        meanstdmatches = c("mean", "std")
        
        #  use grep twice - once to return the column numbers for labels we want, and once to return the column labels
        meanstdcolumns <- grep(paste(meanstdmatches,collapse="|"), dataset_featurelabels$V2, value=FALSE)  # value=FALSE - column numbers
        meanstdlabels <- grep(paste(meanstdmatches,collapse="|"), dataset_featurelabels$V2, value=TRUE)
        
        #  Subset the combined measured data to the columns we want
        ds_X_selectcolumns = ds_X_all[,meanstdcolumns]
            
        #  Assign the feature labels to the subsetted data
        colnames(ds_X_selectcolumns) <- meanstdlabels


#  Read the activity labels - the "Y" tables.  Each row of these tables corresponds to a row of the measured 
#  values in the X data.  Each row has an integer value 1 to 6 corresponding to the activity the subject was doing during
#  the measurement. Read both the train and test sets, combine them, and assign meaningful values
        
      #  read Y_train
      path_Y_train <- file.path("UCI HAR Dataset","train","y_train.txt")
      ds_Y_train   <- read.table(path_Y_train,header=FALSE)

      #  read Y_test
      path_Y_test <- file.path("UCI HAR Dataset","test","y_test.txt")
      ds_Y_test   <- read.table(path_Y_test,header=FALSE)

      #  Combine all of the rows of labels in train and test with rbind
      ds_Y_all <- rbind(ds_Y_train,ds_Y_test)
        
      #  assign the column a meaningful name
      colnames(ds_Y_all) <- "activity"

      #  replace the numeric values 1 to 6 with text representing the activity
      ds_Y_all$activity[ds_Y_all$activity == 1] <- "WALKING"
      ds_Y_all$activity[ds_Y_all$activity == 2] <- "WALKING_UPSTAIRS"
      ds_Y_all$activity[ds_Y_all$activity == 3] <- "WALKING_DOWNSTAIRS"
      ds_Y_all$activity[ds_Y_all$activity == 4] <- "SITTING"
      ds_Y_all$activity[ds_Y_all$activity == 5] <- "STANDING"
      ds_Y_all$activity[ds_Y_all$activity == 6] <- "LAYING"
        

#  Read the subject identifying data - a number 1 to 30 identifying the subject of the measurement. 
#  There will be one row for each row of measured data.  Read and combine the tables. 
        
      # Read subject_train
      path_subject_train <- file.path("UCI HAR Dataset","train","subject_train.txt")
      ds_subject_train   <- read.table(filelabel_subject_train,header=FALSE)
      
      # Read subject_test
      path_subject_test <- file.path("UCI HAR Dataset","test","subject_test.txt")
      ds_subject_test   <- read.table(path_subject_test,header=FALSE)

      # Combine train and test with rbind
      ds_subject_all <- rbind(ds_subject_train,ds_subject_test)
        
      # Give the one column a meaningful name
      colnames(ds_subject_all) <- "subject"
        

#  Now we have three datasets: subjects,activities,and measured data, each with the same number
#  of rows.  Combine these three datasets into one with cbind. 
        
    # combine the subjects, activity names and data with cbind
    ds_combined = cbind(ds_subject_all, ds_Y_all,ds_X_selectcolumns)


#  Each combination of subject/activity has several different rows of measurements.  
#  We want the mean of each subject/activity combination.  
        
    #  Use the melt and dcast functions, in the reshape2 package
    reshapepkgname = "reshape2"
        
        if (!require(reshapepkgname,character.only = TRUE))
        {
          install.packages(reshapepkgname,dep=TRUE)
          if(!require(reshapepkgname,character.only = TRUE)) stop("Could not install reshape2")
        }
    library(reshape2)
     
    #  melt the subject and activity columns
    ds_meltedsubjectactivity <- melt(ds_combined,(id.vars=c("subject","activity")))
            
    #  create an aggregate mean for each subject/activity with dcast
    tidydataset <- dcast(ds_meltedsubjectactivity, subject + activity ~ variable, mean)
        
        
#  Write tidydataset as a comma delimited table in the working directory
   write.csv(tidydataset,"tidydataset.txt",row.names=FALSE)
