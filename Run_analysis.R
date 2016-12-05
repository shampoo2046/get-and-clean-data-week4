
library(dplyr)
# read data from train folder and test folder respectively
filepath1 <- file.path("C:/Users/Love-Home/Documents/Data science/Getting and cleaning data/week4/UCI HAR Dataset/test")
filelist1 <- list.files(filepath1)
subject_test <- read.table(file.path(filepath1,filelist1[2]))
colnames(subject_test) <- "subject"
x_test <- read.table(file.path(filepath1,filelist1[3]))
y_test <- read.table(file.path(filepath1,filelist1[4]))
colnames(y_test) <- "activity"
# ncol <- rep("test", dim(subject_test)[1])  # add one colume =1 for test
testdata <- cbind(subject_test,x_test,y_test)

filepath2 <- file.path("C:/Users/Love-Home/Documents/Data science/Getting and cleaning data/week4/UCI HAR Dataset/train")
filelist2 <- list.files(filepath2)
subject_train <- read.table(file.path(filepath2,filelist2[2]))
colnames(subject_train) <- "subject"
x_train <- read.table(file.path(filepath2,filelist2[3]))
y_train <- read.table(file.path(filepath2,filelist2[4]))
colnames(y_train) <- "activity"
# ncol <- rep("train",dim (subject_train)[1]) # add one colume=2 for train
traindata <- cbind(subject_train,x_train,y_train)

# combine the train data and test data
combinedata <- rbind(testdata,traindata)

# extract the colume only with mean/Mean/std/STD in the names
filepath3 <- file.path("C:/Users/Love-Home/Documents/Data science/Getting and cleaning data/week4/UCI HAR Dataset")
feature <- read.table(file.path(filepath3,"features.txt"))
meanstd <- grep("Mean|mean|std|STD",feature$V2)
datameanstd <- combinedata[,c(1,meanstd+1,563)] 

# replace activity number with descriptive activity
datameanstd$activity <- factor(datameanstd$activity, levels= c(1, 2, 3, 4, 5, 6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" ))
# rename the colnames with descriptive label and replace - with space.
colnames(datameanstd)[2:87] <- as.character(feature$V2[meanstd])
#colnames(datameanstd) <- gsub("-"," ",colnames(datameanstd))

data_new <- arrange(datameanstd,subject,activity) %>%
  group_by(subject,activity) %>%
  summarise_each(funs(mean))
# wirte the new data to a txt file.
write.table(data_new, "C:/Users/Love-Home/Documents/Data science/Getting and cleaning data/week4/UCI HAR Dataset/newdata.txt", sep="\t")