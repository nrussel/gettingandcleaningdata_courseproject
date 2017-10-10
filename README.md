Codebook

Script Logic:
Comments are included along with the code, but the step by step logic of “run_analysis.R” are:
1. Load the training dataset files, combine into one data frame
2. Load the testing dataset files, combine into one data frame
3. Append the training and testing data frames to create one data frame
4. Rename the fields using the names provided in the “features” file
5. Subset the data to only include the fields containing mean and standard deviations
6. Replace the activity IDs with the activity descriptions provided in the “activity labels” file
7. Clean up the remaining field names to remove parentheses and dashes
8. “Tidy” the dataset so each record represents one observation
9. Summarize the tidy dataset to obtain the average for each subject, activity, and measure

Variable Descriptions:
subject - unique identifier representing a different participant in the data collection (numeric). e.g. 1, 2, etc.

activitydesc - a description of the activity the subject was performing for the record (character). e.g. Laying, Standing, etc.

measure - a description of the measure of the data collected by the accelerometer from the subject for a given activity (character). 
The first letter corresponds to either “time” or “frequency (for t and f), and the last letter corresponds to the direction 
(X, Y, or Z axis). e.g. “fBodyAccJerkmeanX”, fBodyGyromeanY” 

avg - An average of the data collected for a given subject, activity description, and measure (numeric).
