## run_analysis.R

## ASSUMPTION : the Samsung data must be placed in the working directory

path <- getwd()
## Ignore files in "Inertial Signals Folder" and
## Read the subject files
subject.train.file <- fread(file.path(path, "train", "subject_train.txt"))
subject.test.file <- fread(file.path(path, "test", "subject_test.txt"))

## Read the activity files
activity.train.file <- fread(file.path(path, "train", "Y_train.txt"))
activity.test.file <- fread(file.path(path, "test", "Y_test.txt"))

## Read the data files & convert to data table
data.train.file <- data.table(read.table(file.path(path, "train", "X_train.txt")))
data.test.file <- data.table(read.table(file.path(path, "test", "X_test.txt")))

## 1. Merge training and the test sets to create one data set
## Merge rows for subject 
subject.file <- rbind(subject.train.file, subject.test.file)
setnames(subject.file, "V1", "subject")

## Merge rows for activity
activity.file <- rbind(activity.train.file, activity.test.file)
setnames(activity.file, "V1", "activityNumber")

## Merge rows for data
data.file <- rbind(data.train.file, data.test.file)

## Merge columns and set key
subject.file <- cbind(subject.file, activity.file)
data.file <- cbind(subject.file, data.file)
setkey(data.file, subject, activityNumber)



## Now read the "features.txt" for other columns
data.features.file <- fread(file.path(path, "features.txt"))
setnames(data.features.file, names(data.features.file), 
         c("featureNumber", "featureName"))

## 2. Extracts only measurements on mean and standard deviation for each measurement
data.features.file <- data.features.file[grepl("mean\\(\\)|std\\(\\)", featureName)]

## Create a column "featureCode" that contains values matching data.file column names
data.features.file$featureCode <- data.features.file[, paste0("V", featureNumber)]

## Subset data.file to only columns with "mean" and "std deviation"
select <- c(key(data.file), data.features.file$featureCode)
data.file <- data.file[, select, with=FALSE]



## Now read labels from "activity_labels.txt"
activity.labels.file <- fread(file.path(path, "activity_labels.txt"))
setnames(activity.labels.file, names(activity.labels.file), 
         c("activityNumber", "activityName"))

## 3. Use descriptive activity names to name the activities in the data set
## Merge and apply activity labels to data.file
data.file <- merge(data.file, activity.labels.file, 
                   by="activityNumber", all.x=TRUE)
## Add "activityName" as key
setkey(data.file, subject, activityNumber, activityName)

## Melt the data.file
data.file <- data.table(melt(data.file, key(data.file), 
                             variable.name="featureCode"))

## Merge activity name
data.file <- merge(data.file, data.features.file[, list(featureNumber, 
                                                        featureCode, 
                                                        featureName)], 
                   by="featureCode", all.x=TRUE)

## Create factors for activity and feature
data.file$activity <- factor(data.file$activityName)
data.file$feature <- factor(data.file$featureName)

## Separate features from featureName
grepFeature <- function(reg) {
        grepl(reg, data.file$feature)
}

## 4. Appropriately labels the data set with descriptive variable names.
## Features with 2 categories
n <- 2
y <- matrix(seq(1,n), nrow=n)
x <- matrix(c(grepFeature("^t"), grepFeature("^f")), ncol=nrow(y))
data.file$featDomain <- factor(x %*% y, labels=c("Time", "Frequency"))

x <- matrix(c(grepFeature("Acc"), grepFeature("Gyro")), ncol=nrow(y))
data.file$featInstrument <- factor(x %*% y, labels=c("Accelerometer", "Gyroscope"))

x <- matrix(c(grepFeature("BodyAcc"), grepFeature("GravityAcc")), ncol=nrow(y))
data.file$featAcceleration <- factor(x %*% y, labels=c(NA, "Body", "Gravity"))

x <- matrix(c(grepFeature("mean()"), grepFeature("std()")), ncol=nrow(y))
data.file$featVariable <- factor(x %*% y, labels=c("Mean", "SD"))


## Features with 1 category
data.file$featJerk <- factor(grepFeature("Jerk"), labels=c(NA, "Jerk"))
data.file$featMagnitude <- factor(grepFeature("Mag"), labels=c(NA, "Magnitude"))


## Features with 3 categories
n <- 3
y <- matrix(seq(1,n), nrow=n)
x <- matrix(c(grepFeature("-X"), grepFeature("-Y"), grepFeature("-Z")), ncol=nrow(y))
data.file$featAxis <- factor(x %*% y, labels=c(NA, "X", "Y", "Z"))

## Check if all possible combinations of feature are accounted for by all possible
## combinations of factor class variables
r1 <- nrow(data.file[, .N, by=c("feature")])
r2 <- nrow(data.file[, .N, by=c("featDomain", "featInstrument", "featAcceleration", 
                                "featVariable", "featJerk", "featMagnitude",
                                "featAxis")])
r1 == r2 ## TRUE means accounted fo all possible combinations.



## 5. Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
setkey(data.file, subject, activity, featDomain, featAcceleration, featInstrument, 
       featJerk, featMagnitude, featVariable, featAxis)
tidyDataset <- data.file[, list(count=.N, average=mean(value)), by=key(data.file)]

## Write the tidy data set with a tab delimited data without rownames.
write.table(tidyDataset, file="HumanActivityRecognitionUsingSmartphone.txt", 
            sep="\t", fileEncoding="ISO8859-1", row.names=FALSE)
