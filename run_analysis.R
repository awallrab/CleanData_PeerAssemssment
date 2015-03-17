### run_analysis.R

cwd <- getwd() # remember current working directory
setwd("~/GitHub/CleanData_PeerAssessment")

#### Get the data and unzip
if (!file.exists("data")) { # only download if not already done before
  dir.create("data")
  setwd("data")
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url = url, destfile = "data.zip", method = "curl")
  unzip(zipfile = "data.zip")
  # write a little note when and from where the file was downloaded
  cat(paste("File data.zip downloaded", date(), "from", url), file = "downloaded.txt")
  setwd("..")
}

#### Merge the training and the test sets to create one data set
# go to where the data is
setwd("data/UCI HAR Dataset")
# Read the metadata
activity_labels <- read.table(file="activity_labels.txt")
features <- read.table(file="features.txt")
# Read the "train" files
train_x <- read.table(file="train/X_train.txt")
train_y <- read.table(file="train/y_train.txt")
train_subject <- read.table(file="train/subject_train.txt")
# Read the "test" files
test_x <- read.table(file="test/X_test.txt")
test_y <- read.table(file="test/y_test.txt")
test_subject <- read.table(file="test/subject_test.txt")
# Merge train and test files
x <- rbind(train_x, test_x)
y <- rbind(train_y, test_y)
subject <- rbind(train_subject, test_subject)
# Rename the columns
names(x) <- features[,2]
names(y) <- "Activity"
names(subject) <- "Subject"
# Create the full data set
data <- cbind(subject, y, x)

#### Extract only the measurements on the mean and standard deviation for each measurement
matches <- grep("Activity|Subject|mean\\(\\)|std\\(\\)", colnames(data))
# Drop all other columns
data <- data[, matches]

#### From the data set, create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy <- aggregate(data, by = list(data$Activity, data$Subject), mean)
tidy <- tidy[, -c(1,2)] # drop "Group.1" & "Group.2" columns

#### Use descriptive activity names to name the activities in the data set
tidy$Activity <- as.factor(tidy$Activity)
levels(tidy$Activity) <- activity_labels[,2]
tidy$Activity <- as.character(tidy$Activity)

#### Write a tidy.txt file
setwd(cwd) # go back to original working directory
write.table(tidy, file="tidy.txt", row.names=FALSE)
