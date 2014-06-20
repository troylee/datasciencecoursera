README
============

This is the repo for the course project of the [Coursera](https://www.coursera.org/) course Getting and Cleaning Data.

The main script is **run_analysis.R**. It requires the existence of the **UCI HAR Dataset** folder at the same location. 

The script will load in both the training and testing data from the dataset, clean up the data and generate a new tidy data set in the **tidy_data.csv** file. 

Following are the steps taken for this processing:

1. Merge the measurement data, subject id and activity type of both the training and testing data together;
2. Extract only the mean and standard deviation measurements;
3. Replace the dummy variable names with the above descriptive names;
4. Replace the activity indexes in the original data to their actual names;
5. Compute the average of each variable according to the subject id and the activity jointly.