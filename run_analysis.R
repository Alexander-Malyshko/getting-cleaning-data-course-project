# required library - PLYR
require(plyr)

# Unzip file
unzip(zipfile="getdata-projectfiles-UCI HAR Dataset.zip")

# Loading Data
features <- read.table("UCI HAR Dataset/features.txt", colClasses = c("character"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId", "Activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE)

# >>>>>>>>TRANSFORMATION 1<<<<<<<<<<<<<<<
# Merging the training and test sets to create a single data source
dataSubject <- rbind(subject_train, subject_test)
dataActivity <- rbind(y_train, y_test)
dataFeatures <- rbind(x_train, x_test)

# Assigning column names
names(dataSubject) <- c("Subject")
names(dataActivity) <- c("ActivityId")
names(dataFeatures) <- features$V2

# Merging columns step by step

dataSubAct <- cbind(dataSubject, dataActivity)
data <- cbind(dataFeatures, dataSubAct)

# >>>>>>>>TRANSFORMATION 2<<<<<<<<<<<<<<<
# Extract only the measurements on the mean and standard deviation for each measurement

dataExtracted <- data[,grepl("Subject|ActivityId|mean|std", names(data))]

# >>>>>>>>TRANSFORMATION 3<<<<<<<<<<<<<<<
# Descriptive activity names to name the activities in the data set

dataUpdated <- merge(dataExtracted, activity_labels, by = "ActivityId", all.x=TRUE)[,-1]

# >>>>>>>>TRANSFORMATION 4<<<<<<<<<<<<<<<
# Appropriately label the data set with descriptive activity names

# removing \\
names(dataUpdated) <- gsub('\\(|\\)',"",names(dataUpdated), perl = TRUE)
# making valid names
names(dataUpdated) <- make.names(names(dataUpdated))
# descriptive names
names(dataUpdated) <- gsub('Acc',"Acceleration",names(dataUpdated))
names(dataUpdated) <- gsub('GyroJerk',"AngularAcceleration",names(dataUpdated))
names(dataUpdated) <- gsub('Gyro',"AngularSpeed",names(dataUpdated))
names(dataUpdated) <- gsub('Mag',"Magnitude",names(dataUpdated))
names(dataUpdated) <- gsub('^t',"TimeDomain.",names(dataUpdated))
names(dataUpdated) <- gsub('^f',"FrequencyDomain.",names(dataUpdated))
names(dataUpdated) <- gsub('\\.mean',".Mean",names(dataUpdated))
names(dataUpdated) <- gsub('\\.std',".StandardDeviation",names(dataUpdated))
names(dataUpdated) <- gsub('Freq\\.',"Frequency.",names(dataUpdated))
names(dataUpdated) <- gsub('Freq$',"Frequency",names(dataUpdated))

# >>>>>>>>TRANSFORMATION 5<<<<<<<<<<<<<<<
# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

dataUpdated <- aggregate(. ~Subject + Activity, dataUpdated, mean)
dataFinal <- dataUpdated[order(dataUpdated$Subject,dataUpdated$Activity),]

write.table(dataFinal, file = "AnalysisReadyData.txt",row.name=FALSE)