# get-and-clean-data-week4
1.read data from test folder
	load the subject_test.txt data into data frame subject_test and rename the colume to subject 
	load the X_test.txt data into data frame x_test
	load the Y_test.txt data into data frame y_test and rename the colume to acitivty 
2.use cbind function to put all the test data into data frame testdata (subject_test, x_test,y_test)

3.read data from train folder
	load the subject_train.txt data into data frame subject_train and rename the colume to subject 
	load the X_train.txt data into data frame x_train
	load the Y_train.txt data into data frame y_train and rename the colume to acitivty 
4.use cbind function to put all the train data into data frame traindata (subject_train, x_train,y_train)

5.use rbind function to put both test data and train data in to data frame combinedata

6.read data from feature.txt file 

7. extract the colume with mean/Mean/std/STD in the names of combine data and put these colume in data frame datameanstd.

8. replace the acitivty number with desciptive activity with factor function. 

9. rename the colume names with descrptive label as described in feature data frame.
	colnames(datameanstd)[2:87] <- as.character(feature$V2[meanstd])

10.reorder the datameanstd based on subject and acitivty 

11.use group-by and summarize_each function to calculate the average of each variable for each activity and each subject. Put this new data in data frame : data_new

12. wirte data_new into the specified folder in newdata.txt
