
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.


## 1. Merges the training and the test sets to create one data set.
## 4. Appropriately labels the data set with descriptive variable names. 

## read data, add labels
labels = read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("number","label"))
features = read.table("./UCI HAR Dataset/features.txt", col.names=c("number","label"))

# read training data, add labels
activity_tr = read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activity")
subject_tr = read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="id")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feat_label)

# read test data, add labels
activity_te = read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activity")
subject_te = read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="id")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feat_label)


# combining training variables to same data sets
subjectact_tr <- cbind(subject_tr, activity_tr)
traindata <- cbind(subjectact_tr, X_train)

# combining test variables to same data sets
subjectact_te <- cbind(subject_te, activity_te)
testdata <- cbind(subjectact_te, X_test)


## adding the test data after the training data
totaldata <- rbind(traindata, testdata)

# remove extra data to free up memory
rm(activity_tr, subject_tr, X_train, activity_te, subject_te, X_test, traindata, testdata)

## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 

# getting the mean and standard deviation variables and adding 2 to get the 
# correct variable columns in the dataset
mea<- grep("mean", features$label)  
std<- grep("std", features$label)
mea <- mea + 2
std <- std + 2

#variable columns to keep
keepers <- c(1,2,mea,std)

# dropping others
sdmeandata <- totaldata[keepers]

## 3. Uses descriptive activity names to name the activities in the data set
sdmeandata$activity <- factor(sdmeandata$activity, labels = 
c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING","STANDING","LAYING"))


## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

## use average function for data.table to take means for the factors
library("data.table")
dataset_DT <- data.table(sdmeandata)
average_DT <- aggregate(dataset_DT, by =list(dataset_DT$id, dataset_DT$activity), mean)

# remove NA columns
drops <- c("id","activity")
average_DT <- average_DT[,!(names(average_DT) %in% drops)]
setnames(average_DT, "Group.1", "id")
setnames(average_DT, "Group.2", "activity")

