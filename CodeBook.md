---
title: "CodeBook"
output: html_document
---

This document contains the code book for all variables used in the analysis.

## Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on Wed Mar 18 08:17:08 2015

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record in the dataset it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Codebook
### Data Files used for the Analysis
The following files of the data set were used for the analysis:

- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- 'train/subject_train.txt': The subject who performed the activity.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.
- 'test/subject_train.txt': The subject who performed the activity.

Features are normalized and bounded within [-1,1] and each feature vector is a row on the text file.

### List of Features in the original Data Files
The features of this data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions)

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

### Features used for the Tidy Data Set
To create the tidy data set **Subject** and **Activity** columns are added to the data set. Then only the features containing **mean()** and **std()** variables are used, all other variables are dropped from the data set. This results in the following data set with 68 variables:

- **Subject**: The person (or subject) that performed the activity
- **Activity**: The activity performed (one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

All following variables are aggregated values (by Subject and Activity) from the original data set.

Mean and standard deviation of **body acceleration** in the directions X, Y and Z: 

- **tBodyAcc-mean()-X**
- **tBodyAcc-mean()-Y**
- **tBodyAcc-mean()-Z**
- **tBodyAcc-std()-X**
- **tBodyAcc-std()-Y**
- **tBodyAcc-std()-Z**

Mean and standard deviation of **gravity acceleration** in the directions X, Y and Z: 

- **tGravityAcc-mean()-X**
- **tGravityAcc-mean()-Y**
- **tGravityAcc-mean()-Z**
- **tGravityAcc-std()-X**
- **tGravityAcc-std()-Y**
- **tGravityAcc-std()-Z**

Mean and standard deviation of **body acceleration jerk signals** in the directions X, Y and Z: 

- **tBodyAccJerk-mean()-X**
- **tBodyAccJerk-mean()-Y**
- **tBodyAccJerk-mean()-Z**
- **tBodyAccJerk-std()-X**
- **tBodyAccJerk-std()-Y**
- **tBodyAccJerk-std()-Z**

Mean and standard deviation of **gyroscope** and **gyroscope jerk signals** in the directions X, Y and Z: 

- **tBodyGyro-mean()-X**
- **tBodyGyro-mean()-Y**
- **tBodyGyro-mean()-Z**
- **tBodyGyro-std()-X**
- **tBodyGyro-std()-Y**
- **tBodyGyro-std()-Z**
- **tBodyGyroJerk-mean()-X**
- **tBodyGyroJerk-mean()-Y**
- **tBodyGyroJerk-mean()-Z**
- **tBodyGyroJerk-std()-X**
- **tBodyGyroJerk-std()-Y**
- **tBodyGyroJerk-std()-Z**

Mean and standard deviation of calculated **magnitudes**. The magnitudes of the three-dimensional signals were pre-calculated in the original data set using the Euclidean norm.

- **tBodyAccMag-mean()**:
- **tBodyAccMag-std()**:
- **tGravityAccMag-mean()**:
- **tGravityAccMag-std()**:
- **tBodyAccJerkMag-mean()**:
- **tBodyAccJerkMag-std()**:
- **tBodyGyroMag-mean()**:
- **tBodyGyroMag-std()**:
- **tBodyGyroJerkMag-mean()**:
- **tBodyGyroJerkMag-std()**:

Mean and standard deviation of calculated **frequencies**. The features were pre-calculated in the original data set using a Fast Fourier Transform (FFT).

- **fBodyAcc-mean()-X**
- **fBodyAcc-mean()-Y**
- **fBodyAcc-mean()-Z**
- **fBodyAcc-std()-X**
- **fBodyAcc-std()-Y**
- **fBodyAcc-std()-Z**
- **fBodyAccJerk-mean()-X**
- **fBodyAccJerk-mean()-Y**
- **fBodyAccJerk-mean()-Z**
- **fBodyAccJerk-std()-X**
- **fBodyAccJerk-std()-Y**
- **fBodyAccJerk-std()-Z**
- **fBodyGyro-mean()-X**
- **fBodyGyro-mean()-Y**
- **fBodyGyro-mean()-Z**
- **fBodyGyro-std()-X**
- **fBodyGyro-std()-Y**
- **fBodyGyro-std()-Z**
- **fBodyAccMag-mean()**
- **fBodyAccMag-std()**
- **fBodyBodyAccJerkMag-mean()**
- **fBodyBodyAccJerkMag-std()**
- **fBodyBodyGyroMag-mean()**
- **fBodyBodyGyroMag-std()**
- **fBodyBodyGyroJerkMag-mean()**
- **fBodyBodyGyroJerkMag-std()**
