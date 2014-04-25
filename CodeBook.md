CodeBook
================================================
this file will explain all the object created in file Run_analysis.R.

---------------------------------------------------
X.train: values of all the variables in the training set.

y.train: activity labels in the training set.

subject.train: subjects in the training set.

X.test: values of all the variables in the test set.

y.test: activity labels in the test set.

subject.test: subjects in the test set.

step 1:
---------------------------------------------
X: merged by X.train and X.test.

y: merged by y.train and y.test.

subject: merged by subject.train and subject.test.

wear: Merged by X, y and subjet. First dataset asked by step 1.

variables in wear:

*  subject: refers to each subject.
   
*  activity: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING.
   
*  others: kinds of measurements for each activity and each subject.

step 2&3&4:
-----------------------------------------------------
mean.std.index: indicates whether a variable is a mean/std measurement.

wear2: extract from wear, just contains the mean and standard deviation of each measurement corresponding to each activity and each subject.

step 5:
--------------------------------------------
subject.activity: Final tiny data asked by step 5. reshaped from wear2. 

variables in subject.activity:

*   subject: refers to each subject.
*   activity: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING.
*   others: mean or standard deviation of measurements for each activity and each subject.
