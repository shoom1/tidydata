
## Reads Activity data and combines into one data.frame
##  - reads measurements from <directory>/X_<type>.txt file
##  - reads activity from <directory>/y_<type>.txt file
##  - reads subject ids from <directory>/subject_<type>.txt file
##  - binds the columns of measurements, activity and subject ids together.
## If the col.names is not NULL, adds the column names to measurements
## If the feature.names is not NULL changes activity ids to activity descriptions
##
## Parameters:
##  - directory - the location of data files. Should contain files "subject_<type>.txt", "X_<type>.txt", "y_<type>.txt"
##  - type - "train" or "test" string
##  - col.names - names of the columns in X_<type>.txt file. Default value is NULL.
##  - feature.names - names of activity types in y_<type>.txt file. Default value is NULL
read.measurements <- function(directory, type, col.names=NULL) {
  
  df.measurements <- read.table(paste(directory,"/X_",type,".txt",sep=""))
  if (!is.null(col.names)) names(df.measurements) <- col.names  

  df.activity <- as.numeric(readLines(paste(directory,"/y_",type,".txt", sep="")))
  df.subjects <- as.numeric(readLines(paste(directory,"/subject_",type,".txt", sep="")))  
  df.measurements$subject <- df.subjects
  df.measurements$activity.id <- df.activity
  df.measurements
}

## Reads features from the file, subsitutes all non-alphanumeric characters with "." and removes "()"
read.features <- function(file) {
  features <- read.table("UCI HAR Dataset//features.txt", sep=" ", col.names=c("id", "feature"))
  sapply(features$feature, function(x) gsub(")","",gsub("[-,(]",".",gsub("()","",x,fixed=TRUE))))
}

cols.mean.std <- function(features.names) {
  means <- grep("mean()", ff$feature, fixed=TRUE)
  stds <- grep("std()", ff$feature, fixed=TRUE)
  sort(c(means, stds))
}

## Prepares the data sets with the following steps:
##  1. Reads features and activity names
##  2. Reads training and test data and uses features as column names
##  3. Combines traning and testing data and selects only mean ad std columns
##  4. Merges measurments data from step 3 with activity names
##
prepare.dataset <- function(directory) {
  features.names <- read.features(paste(directory,"/features.txt", sep=""))
  activity.names <- read.table(paste(directory, "/activity_labels.txt", sep=""), sep=" ",
                               col.names=c("activity.id", "activity.name"))

  df.train <- read.measurements(paste(directory, "/train", sep=""), "train", col.names=features.names)
  df.test <- read.measurements(paste(directory, "/test", sep=""), "test", col.names=features.names)
  features.selected <- cols.mean.std(features.names)
  df.measurements <- rbind(df.train[,c(562, 563, features.selected)], df.test[,c(562, 563, features.selected)]) 
  merge(df.measurements, activity.names, by = "activity.id")
}


## Prepares the tidy dataset
## Calculates mean of each variable in dataset df grouped by Subject and Activity
prepare.tidy <- function(df) {
  df.melted <- melt(df.selected, id=c("subject", "activity.id", "activity.name"))
  df.tidy <- dcast(df.melted, subject + activity.name ~ variable, mean)
}

## Runs Full Analysis and writes the tidy data set to the file.
## Input parameter specifies the directory with raw data and the output file for the tidy data
## Returns the tidy data set
run.analysis <- function(directory, output) {
  df.selected <- prepare.dataset(directory)
  df.tidy <- prepare.tidy(df.selected)
  write.csv(df.tidy, file=output)
  df.tidy
}

## Running the analysis on the current directory if it contains the raw data
directory <- "UCI HAR Dataset"
if (file.exists(directory)) {
  run.analysis("UCI HAR Dataset", "tidydata.csv")
}
