# 
# Getting and Clearing data, Course Project
# 

####################
# Step 0: data loading
#
# load in the training data as numeric
x_trn <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
# load in the training labels as integer for now
y_trn <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("label"))
# merge data and label together
data_trn <- cbind(x_trn, y_trn)

# load in the test data as numeric
x_tst <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
# load in the test labels as integer for now
y_tst <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("label"))
# merge data and label together
data_tst <- cbind(x_tst, y_tst)

####################
# Step 1: data merging
#
# the merging is concatenation of the two data sets
data <- rbind(data_trn, data_tst)

####################
# Step 2: extract only the mean and std measurements
#
