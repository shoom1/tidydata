Getting and Cleaning Data Course Project
===================

This is the submission for the Course Project for "Getting and Cleaning Data" coursera class.

Introduction
-------------------
This document describes `run_analysis.R` script that prepares the tidy data set. The raw data contains the measurements of the smartphone's accelerometr and gyroscope from 30 individuals while they performed 6 types of activities:  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on their waist.

The full description of the raw data can be found on the website where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The task is to provide the tidy dataset that has means of all variables that are means and standard deviations of measurements by subject and activity.

Data Review
-------------------
Raw data contains several sets of information:
 1. Training and Test data. Both data sets have the following list of files:
   - Internal Signals. These signals represent raw data (after some noise filters were applied, see the link above for more details) from accelerometers and gyroscopes. This is the directory containg 9 files: for body acceleration, angular velocity and total acceleration for each of X, Y and Z axis. Body acceleration data has gravity acceleration stripped out of the total acceleration. Acceleration is measured in standard gravity units `g`. Angular velocity is measured in radians per second. Each record of the internal signals data represent a window of 128 reading done at 50 Hz frequency thus covering 2.56 seconds. Two consecutive rows have 50% overlap - the last 64 readings of the current row are equal to the first 64 readings of the next row. The internal signals data is **not used* in this data analysis exercise.
   - `X_train.txt` (`X_test.txt`) - contains the measurements of 561 features. Each feature is calculated either from the internal signals directly or from derived quantities (such as Magnitudes, Acceleration Jerk and Fourier transformation of some sygnals). The calculated features include mean, standard deviation, maximum and minimum values, skewness, kurtosis and others. For the purpose of this analysis we need to obtain only means and standard deviations of measurements.
   - `y_train.txt` (`y_test.txt1`) - contains activity codes for each row of from the corresponding measurements file (`X_train.txt` or `X_test.txt`). Activity code is the number for 1 to 6 representing each of 6 activities.
   - `subject_train.txt` (`subject_test.txt`) contains id's of persons performing the activity measured in the corresponing row of the measurement data. Subject id is a number from 1 to 30.
 2. `activity_labels.txt` - English names for each activity code. It is required to map numerical activity codes into human readable labels.
 3. `features.txt` - names of each of 561 features. Additionally `features_info.txt` contains the descriptions of features and some detailes of how they were calculated.

Using `run_analysis.R` to Create Tidy Dataset
-----------------------

`run_analysis.R` script performs the creation of the tidy data set from the raw data described above. If the data directory `UCI HAR Dataset` is available in the current working directory, then the script can be simply run using the following command from R concole: 

`source("run_analysis.R")`, 

assuming that the script is also placed in the working directory (otherwise the full path to the script should be specified). The script reads the raw data from `UCI HAR Dataset` folder located in the current working directory and saves the tidy data set in the file `tidydata.csv` also in the current working directory.

Alternatively the script can be used via the following function:

`run.analysis(directory, output)`

The function takes two parameters:
* `directory` - the location of the raw data directory. The provided directory should contain subdirectories `test`, `train` and files `activity_labels.txt` and `features.txt`.
* `output` - file where the tidy dataset will be written. The output file is saved in csv format.

The function returns the data.frame with the resulting tidy dataset.

The Process of Creating Tidy Dataset
--------------------------
`run_analysis.R` scripts performes the set of steps to process the raw data and create the tidy dataset. Here is the list of consideration used in the analysis:
 - Internal signals data is not needed for this analysis. We only need to use means and standard deviations for this analysis. They were already calculated and included in `X_train.txt` and `X_test.txt` files. There is no need to recalculate these intermediate quantities.
 - Since we need to include only means and standard deviations of measurements, we don't need all 561 features. We only need to include features containing substrings `mean()` and `std()` in their names. These substrings indicate the functions that were applied to the measured data. 
 - The features specifying `meanFreq()` in their names are not included in the final analysis. Per description in `features_info.txt` `meanFreq()` is the separate metrics from `mean()` and corresponds to the weighted average frequency.
 
The analysis is perfomed in the following steps:
 
 1. Load features names. This is a simple step using `read.table` on `features.txt` file. It is implemented in the function `read.features(file)`. This function alsi removes "()" from features names and substitutes characters "(", ")", "-", "," with ".". It also makes sure that the dot "." is not the last symbol in the feature name.
 2. Load activity labels. This is a simple step using `read.table` on `activity_labels.txt` file. 
 3. Load training and test data. This step is implemented in the function `read.measurements(directory, type, col.names=NULL)`, where type can be "train" or "test" and the directory is the location of the raw data (with README.txt file). This function performs the following steps:
   * Loads training or test data set into the measurements data frame.
   * Assigns column names based on features names from setp 1.
   * Reads subjects ids and attaches them as the separate columns to the measurements data frame
   * Read activity codes and attaches them as the separate column to the measurements data frame
 4. Merging training and test datasets and keeping only columns for mean and std. This is done using function `prepare.dataset(directory)`. This function puts all previous steps together and returns the combinted dataset with 69 columns: 
   * activity.id
   * activity.name
   * subject
   * 66 measurements variables
   
 The resulting data set includes 66 features, which are means and standard deviations of the following variables for each of X, Y, Z axis and magintude:
   * `tBodyAcc` - Body Acceleration
   * `tGravityAcc` - Gravity Acceleration
   * `tBodyAccJerk` - Body Acceleration Jerk
   * `tBodyGyro` - Body Angular Velocity
   * `tBodyGyroJerk` - Body Angular Velocity Jerk
   * `fBodyAcc` - Fast Fourier Transform (FFT) of Body Acceleration
   * `fBodyAccJerk` - FFT of Body Acceleration Jerk
   * `fBodyGyro` - FFT of Body Angular Velocity
   * `fBodyBodyGyroJerkMag` - FFT of Angular Velocity Jerk. Only magnitude is provided (no X, Y, Z components are availble).
 Each feature name is constructed as concatenation of the variable name, function (mean or std) and axis or magnitude. For example features for `tBodyAcc` variable have following names:
   * `tBodyAcc.mean.X` - mean body acceleration along X axis over 2.56sec window
   * `tBodyAcc.mean.Y` - mean body acceleration along Y axis over 2.56sec window
   * `tBodyAcc.mean.Z` - mean body acceleration along Z axis over 2.56sec window
   * `tBodyAcc.std.X` - standard deviation of body acceleration along X axis over 2.56sec window
   * `tBodyAcc.std.Y` - standard deviation of body acceleration along Y axis over 2.56sec window
   * `tBodyAcc.std.Z` - standard deviation of body acceleration along Z axis over 2.56sec window
   * `tBodyAccMag.mean` - mean body magnitude of acceleration over 2.56sec window
   * `tBodyAccMag.std` - standard deviation of magnitude of body acceleration over 2.56sec window
 5. Prepare the final tidy dataset by calculating the mean of each variable for each subject and activity combination. This is performed by the function `prepare.tidy(directory, output)`. The function runs `melt`/`dcast` combination from `reshape2` package to do the aggregation. At the end the dataset is written to the comma-separated file that is specified by the parameter `output` passed to `prepare.tidy` function.

The final data contain 180 rows - one for each combination of activities and subjects (6x30 = 180) - and 68 columns - one for subject id, one for activity name and 66 for means of each variables.

   