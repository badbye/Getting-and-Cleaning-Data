X.train = read.table('train/X_train.txt', colClasses='numeric')
y.train = scan('train/y_train.txt')
subject.train = scan('train/subject_train.txt')

X.test = read.table('test/X_test.txt', colClasses='numeric')
y.test = scan('test/y_test.txt')
subject.test = scan('test/subject_test.txt')

#######################################################################
# step 1:Merges the training and the test sets to create one data set #
#######################################################################
X = rbind(X.train, X.test)
y = c(y.train, y.test)
subject = c(subject.train, subject.test)
wear = data.frame(X, activity = y, subject = subject)

################################################################################################
# step 2:Extracts only the measurements on the mean and standard deviation for each measurement.                            
################################################################################################
features = read.table('features.txt', colClasses='character')
mean.std.index = grepl('mean\\(\\)|std\\(\\)', features[, 2], ignore.case=T)
wear2 = X[, mean.std.index]
colnames(wear2)= features[mean.std.index, 2]

################################################################################
# step 3:Uses descriptive activity names to name the activities in the data set.
# step 4:Appropriately labels the data set with descriptive activity names.                              
################################################################################
activity_labels = read.table('activity_labels.txt', colClasses='character')
require(plyr)
wear2$activity = mapvalues(y, from = activity_labels[, 1], to = activity_labels[, 2])

###########################################################################
# step 5:Creates a second, independent tidy data set with the average of 
#        each variable for each activity and each subject
###########################################################################
subject.activity = aggregate(. ~ subject + activity, wear2, mean)
write.table(subject.activity, 'final.txt', row.names=F)
