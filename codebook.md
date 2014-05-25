Codebook for Tidy Dataset Prepared by `run_analysis.R`
-----------------------------------

Below is the description of each variable in the dataset that is created by `run_analysis.R`

1. `subject` - The id of the person that was performing the activities. Values are 1 to 30 corresponding to id of each of 30 persons in the experiment.
2. `activity.name` - Name of the activity perfomed by the person specified by the subject at the time of measurements summarized in the corresponding row. Activity name can be one of:
  * WALKING - the subject is walking (not up/down the stairs)
  * WALKING_UPSTAIRS - the subject is walking up the stairs
  * WALKING_DOWNSTAIRS -  - the subject is walking down the stairs
  * SITTING - the subject is sitting
  * STANDING - the subject is standing
  * LAYING - the subject is laying horizontally
  
The next variable represent means over the whole observation period of a subject performing a particular activity.

3. `tBodyAcc.mean.X` - mean of the mean of Body Acceleration among the X axis
4.  `tBodyAcc.mean.Y` - mean of the mean of Body Acceleration among the Y axis
5.  `tBodyAcc.mean.Z` - mean of the mean of Body Acceleration among the Z axis
6. `tBodyAcc.std.X` - mean of the standard deviation of Body Acceleration among the X axis
7. `tBodyAcc.std.Y` - mean of the standard deviation of Body Acceleration among the Y axis
8. `tBodyAcc.std.Z` - mean of the standard deviation of Body Acceleration among the Z axis
9. `tGravityAcc.mean.X` - mean of the mean of Gravity Acceleration among the X axis
10. `tGravityAcc.mean.Y` - mean of the mean of Gravity Acceleration among the Y axis
11. `tGravityAcc.mean.Z` - mean of the mean of Gravity Acceleration among the Z axis
12. `tGravityAcc.std.X` - mean of the standard deviation of Gravity Acceleration among the X axis
13. `tGravityAcc.std.Y` - mean of the standard deviation of Gravity Acceleration among the Y axis
14. `tGravityAcc.std.Z` - mean of the standard deviation of Gravity Acceleration among the Z axis
15. `tBodyAccJerk.mean.X` - mean of the mean of Body Acceleration Jerk among the X axis
16. `tBodyAccJerk.mean.Y` - mean of the mean of Body Acceleration Jerk among the Y axis
17. `tBodyAccJerk.mean.Z` - mean of the mean of Body Acceleration Jerk among the Z axis
18. `tBodyAccJerk.std.X` - mean of the standard deviation of Body Acceleration Jerk among the X axis
19. `tBodyAccJerk.std.Y` - mean of the standard deviation of Body Acceleration Jerk among the Y axis
20. `tBodyAccJerk.std.Z` - mean of the standard deviation of Body Acceleration Jerk among the Z axis
21. `tBodyGyro.mean.X` - mean of the mean of Body Angular Velocity among the X axis
22. `tBodyGyro.mean.Y` - mean of the mean of Body Angular Velocity among the Y axis
23. `tBodyGyro.mean.Z` - mean of the mean of Body Angular Velocity among the Z axis
24. `tBodyGyro.std.X` - mean of the standard deviation of Body Angular Velocity among the X axis
25. `tBodyGyro.std.Y` - mean of the standard deviation of Body Angular Velocity among the Y axis
26. `tBodyGyro.std.Z` - mean of the standard deviation of Body Angular Velocity among the Z axis
27. `tBodyGyroJerk.mean.X` - mean of the mean of Body Angular Velocity Jerk among the X axis
28. `tBodyGyroJerk.mean.Y` - mean of the mean of Body Angular Velocity Jerk among the Y axis
29. `tBodyGyroJerk.mean.Z` - mean of the mean of Body Angular Velocity Jerk among the Z axis
30. `tBodyGyroJerk.std.X` - mean of the standard deviation of Body Angular Velocity Jerk among the X axis
31. `tBodyGyroJerk.std.Y` - mean of the standard deviation of Body Angular Velocity Jerk among the Y axis
32. `tBodyGyroJerk.std.Z` - mean of the standard deviation of Body Angular Velocity Jerk among the Z axis
33. `tBodyAccMag.mean` - mean of the mean of the magnitude of Body Acceleration
34. `tBodyAccMag.std` - mean of the standard deviation of the magnitude of Body Acceleration
35. `tGravityAccMag.mean` - mean of the mean of the magnitude of Gravity Acceleration
36. `tGravityAccMag.std`- mean of the standard deviation of the magnitude of Gravity Acceleration
37. `tBodyAccJerkMag.mean` - mean of the mean of the magnitude of Body Acceleration Jerk
38. `tBodyAccJerkMag.std` - mean of the standard deviation of the magnitude of Body Acceleration Jerk
39. `tBodyGyroMag.mean` - mean of the mean of the magnitude of Body Angular Velocity
40. `tBodyGyroMag.std`- mean of the standard deviation of the magnitude of Body Angular Velocity
41. `tBodyGyroJerkMag.mean` - mean of the mean of the magnitude of Body Angular Velocity Jerk
42. `tBodyGyroJerkMag.std` - mean of the standard deviation of the magnitude of Body Angular Velocity Jerk
43. `fBodyAcc.mean.X` - mean of the mean of Fast Fourier Transform (FFT) of Body Acceleration among the X axis
44. `fBodyAcc.mean.Y` - mean of the mean of FFT of Body Acceleration among the Y axis
45. `fBodyAcc.mean.Z` - mean of the mean of FFT of Body Acceleration among the Z axis
46. `fBodyAcc.std.X` - mean of the standard deviation of FFT of Body Acceleration among the X axis
47. `fBodyAcc.std.Y` - mean of the standard deviation of FFT of Body Acceleration among the Y axis
48. `fBodyAcc.std.Z` - mean of the standard deviation of FFT of Body Acceleration among the Z axis
49. `fBodyAccJerk.mean.X` - mean of the mean of FFT of Body Acceleration Jerk among the X axis
50. `fBodyAccJerk.mean.Y` - mean of the mean of FFT of Body Acceleration Jerk among the Y axis
51. `fBodyAccJerk.mean.Z` - mean of the mean of FFT of Body Acceleration Jerk among the Z axis
52. `fBodyAccJerk.std.X` - mean of the standard deviation of FFT of Body Acceleration Jerk among the X axis
53. `fBodyAccJerk.std.Y` - mean of the standard deviation of FFT of Body Acceleration Jerk among the Y axis
54. `fBodyAccJerk.std.Z` - mean of the standard deviation of FFT of Body Acceleration Jerk among the Z axis
55. `fBodyGyro.mean.X` - mean of the mean of FFT of Body Angular Velocity among the X axis
56. `fBodyGyro.mean.Y` - mean of the mean of FFT of Body Angular Velocity among the Y axis
57. `fBodyGyro.mean.Z` - mean of the mean of FFT of Body Angular Velocity among the Z axis
58. `fBodyGyro.std.X` - mean of the standard deviation of FFT of Body Angular Velocity among the X axis
59. `fBodyGyro.std.Y` - mean of the standard deviation of FFT of Body Angular Velocity among the Y axis
60. `fBodyGyro.std.Z` - mean of the standard deviation of FFT of Body Angular Velocity among the Z axis
61. `fBodyAccMag.mean` - mean of the mean of the magnitude of FFT of Body Acceleration
62. `fBodyAccMag.std` - mean of the standard deviation of the magnitude of FFT of Body Acceleration
63. `fBodyBodyAccJerkMag.mean` - mean of the mean of the magnitude of FFT of Body Acceleration Jerk
64. `fBodyBodyAccJerkMag.std` - mean of the standard deviation of the magnitude of FFT of Body Acceleration Jerk
65. `fBodyBodyGyroMag.mean` - mean of the mean of the magnitude of FFT of Angular Velocity
66. `fBodyBodyGyroMag.std` - mean of the standard deviation of the magnitude of FFT of Angular Velocity
67. `fBodyBodyGyroJerkMag.mean` - mean of the mean of the magnitude of FFT of Angular Velocity Jerk
68. `fBodyBodyGyroJerkMag.std` - mean of the standard deviation of the magnitude of FFT of Angular Velocity Jerk
