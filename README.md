getdata-005-project
===================

run_analysis.R:

Utilizes the data included in the Human Activity Recognition Using Smartphones Data Set provided by the UCI Machine Learning Repository. 

With these data, the script:

1. Extracts the feature names (measurements collected) from the features.txt file
2. Extracts the activity labels (walking, walking upstairs, etc.) from the activity_labels.txt file
3. From the feature names, gets the column indexes that correspond to the data that we are after - the means and the standard deviations
4. Reads the x_train data set and labels the data set with the appropriate feature names from step 1.
5. Reads the subject training and subject test data and names the columns
6. Reads the x and y test files and names x test with the feature names and y test with "labels"
7. Gets the mean and SD columns using the indexes for the mean and SD columns collected in step 3.
8. Reads the x train and y train data sets, labels the x train with feature names and y train with labels
9. Reads subject test and train files, names subjects
10. Repeat step 8 for test data sets
11. Extract the mean and SD column names for the x test data set (should be the same as x train)
12. Creates a new training data set using subjects from step 9, y test from step 8, and the subset of x test containing the means and SDs
13. Repeat step 12 for the test data set
14. Combine the data from steps 12, 13
15. Create a tidy data set with the average of each activity for each subject for each feature
16. Order the tidy data set
17. Use the activity labels from step 2 to label the tidy data set
18. Write the tidy data set to CSV file "human_activity_recognition_tiny.csv"



combines the test and and training data sets, while extracting only the mean and S.D. for each of the measurements described in the features.txt file included in the data set. Appropriate labels are given to the data set, and a tidy data set in CSV format is created the contains the average of each variable for each activity and each subject.

