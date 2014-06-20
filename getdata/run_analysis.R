# 
# Getting and Clearing data, Course Project
# 
library(plyr)

####################
# Step 0: data loading
#
# load in the training subject ids
id_trn <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject.id"))
# load in the training data as numeric
x_trn <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
# load in the training labels as integer for now
y_trn <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
# merge data, subject id and label together
dat_trn <- cbind(x_trn, id_trn, y_trn)

# load in the training subject ids
id_tst <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject.id"))
# load in the test data as numeric
x_tst <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
# load in the test labels as integer for now
y_tst <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
# merge data, subject id and label together
dat_tst <- cbind(x_tst, id_tst, y_tst)

####################
# Step 1: data merging
#
# the merging is concatenation of the two data sets
dat_raw <- rbind(dat_trn, dat_tst)

####################
# Step 2: extract only the mean and std measurements
#
# load in the feature column index and name mapping
idx2name <- read.table("UCI HAR Dataset/features.txt", 
  colClasses=c("numeric", "character"), sep=" ",
  col.names=c("index", "name"))

# find the feature names for mean and std only
sel <- grep("(mean|std)[(]", idx2name$name);

# create a new dataset with only mean and std measurements
# copy the mean and std columns
dat <- dat_raw[,idx2name[sel,]$index]
# copy the subject ID first
dat$subject.id <- dat_raw$subject.id
# copy the labels
dat$activity <- dat_raw$activity

####################
# Step 3: Uses descriptive activity names to name the activities in the data set
#
# load in the activity names
idx2act <- read.table("UCI HAR Dataset/activity_labels.txt", 
  colClasses=c("numeric", "character"), sep=" ",
  col.names=c("index", "name"))

# generate the mapping
actmap <- setNames(idx2act$name, idx2act$index)

# replace the activities with correspoinding names
dat$activity <- sapply(dat$activity, function(x) actmap[x])

####################
# Step 4: Appropriately labels the data set with descriptive variable names
#
# derive the variabel names from the names in features.txt file
varnames <- gsub("-", ".", gsub("[()]", "", idx2name[sel,]$name))

# change the data column names
names(dat) <- c(varnames, "subject.id", "activity")

####################
# Step 5: Creates a second, independent tidy data set with
#   the average of each variable for each activity and each subject.
#
# compute the mean according for each activity and each subject
newdat <- ddply(dat, c("subject.id", "activity"), numcolwise(mean))

# save out the new data 
write.csv(newdat, "tidy_data.csv")