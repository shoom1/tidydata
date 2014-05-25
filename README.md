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

Creating Tidy Dataset
-----------------------

`run_analysis.R` script performs the creation of the tidy data set from the raw data described above.