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

