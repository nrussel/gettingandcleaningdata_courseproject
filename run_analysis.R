##Script assumes files have been downloaded, unzipped, and saved in the
##current working directory

#Read in training dataset, combine into 1 table
subject_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")

train_comb <- cbind(subject_train,y_train,x_train)

#Read in testing dataset, combine into 1 table
subject_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")

test_comb <- cbind(subject_test,y_test,x_test)

#Combine training and testing dataset
full_dataset <- rbind(train_comb,test_comb)

library(dplyr)

#Read in "features" file to rename columns
features <- read.table("./features.txt")
features <- features %>% 
            mutate(V2 = as.character(V2)) %>% 
            select(V2)
features <- rbind("subject","activity",features)
colnames(full_dataset) <- features$V2

#We are interested only in columns with mean() and std() 
#(need the boundaries to remove the "meanFreq" measures):
full_dataset <- full_dataset[,grepl("\\bmean()\\b|\\bstd()\\b|subject|activity",names(full_dataset))]

#Replace Activity IDs with descriptive names included
activities <- read.table("./activity_labels.txt",col.names = c("activity","activitydesc"))
full_dataset <- left_join(full_dataset,activities,by="activity")
full_dataset <- full_dataset %>%
                  select(-(activity)) %>%
                  select(1,68,2:67)

#Clean up column names
colnames(full_dataset) <- gsub("\\()","",colnames(full_dataset))
colnames(full_dataset) <- gsub("-","",colnames(full_dataset))

#Tidy the dataset to have one row per observation
library(tidyr)

tidied_full_dataset <- gather(full_dataset,measure,value,-subject,-activitydesc)

#"tidied_full_dataset" is my submission for items 1-4
#Create separate dataset for item 5

tidied_full_dataset_summary <- 
      tidied_full_dataset %>%
      group_by(subject,activitydesc,measure) %>%
      summarize(avg=mean(value,na.rm=T))

#"tidied_full_dataset_summary is my submission for item 5

write.table(tidied_full_dataset_summary,file = "tidy_data_submission.txt",row.names=F)






