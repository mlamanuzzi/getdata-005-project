run_analysis <- function() {
    setwd("data/UCI HAR Dataset/")
    
    ## Read the feature names (measurements)
    features <- read.table("features.txt")["V2"]
    ## Read the activity labels - walking, walking upstairs, etc.
    activityLabels <- read.table("activity_labels.txt")["V2"]
    ## Get the indexes of the columns we are after - mean, and S.D.
    indexesOfMeansAndStds <- grep("mean|std", features$V2) 

    xTrain <- read.table("train/X_train.txt")
    ## label the xTrain data with the appropriate feature names
    names(xTrain) <- features$V2
    yTrain <- read.table("train/y_train.txt")
    names(yTrain) <- "labels"
    
    subjectTrain <- read.table("train/subject_train.txt")
    names(subjectTrain) <- "subjects"
    
    subjectTest <- read.table("test/subject_test.txt")
    names(subjectTest) <- "subjects"
    
    xTest <- read.table("test/X_test.txt")
    names(xTest) <- features$V2
    yTest <- read.table("test/y_test.txt")
    names(yTest) <- "labels"
    
    ## Extract the mean and SD for each measurement
    meansAndSDColnames <- colnames(xTest)[indexesOfMeansAndStds]
    testing <- cbind(subjectTest, yTest, subset(xTest, select=meansAndSDColnames))
    training <- cbind(subjectTrain, yTrain, subset(xTrain, select=meansAndSDColnames))
    
    ## Merge the training and test sets to create one data set
    combined<-rbind(testing, training)
    
    ## Create a second, independent tidy data set with the average of each variable for each activity and each subject
    tidyDataSet <- aggregate(combined[,3:ncol(combined)], list(Subject=combined$subjects, Activity=combined$labels), mean)
    tidyDataSet <- tidyDataSet[order(tidyDataSet$Subject),]
    
    ## Use descriptive activity names to name the activities in the data set
    tidyDataSet$Activity <- activityLabels[tidyDataSet$Activity,]
    
    setwd("../../")
    write.table(tidyDataSet, file="human_activity_recognition_tiny.csv", sep=",", row.names=FALSE)   
}