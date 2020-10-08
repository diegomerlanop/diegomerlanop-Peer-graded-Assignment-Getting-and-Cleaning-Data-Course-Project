
# 1. Merges the training and the test sets to create one data set.

features<-read.table("features.txt",col.names = c("n","functions"))
x_test<-read.table("test/X_test.txt",col.names = features$functions)
x_train<-read.table("train/X_train.txt",col.names = features$functions)
y_test<-read.table("test/y_test.txt",col.names = "code")
y_train<-read.table("train/y_train.txt",col.names = "code")
subject_test<-read.table("test/subject_test.txt",col.names = "subject")
subject_train<-read.table("train/subject_train.txt",col.names = "subject")
activities<-read.table("activity_labels.txt",col.names = c("code", "activities"))

x<-rbind(x_train,x_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_test,subject_train)
Data<-cbind(subject,x,y)

# 2. Extracts only the measurements on the mean and standard 
#    deviation for each measurement.

Data<-Data %>%
    select(subject,code,contains("mean"),contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

Data$code<-activities[Data$code,2]

# 4. Appropriately labels the data set with descriptive variable names.

names(Data)[2] = "activity"
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))

# 5. From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each activity 
#    and each subject.

DataFinal<-Data%>%
    group_by(subject,activity)%>%
    summarise_all(funs(mean))
