# UCIHARanalysis
## Analysis script for UCI Human Activity Recognition (HAR) data: run_analysis.R
## Description
The script reads in the UCI HAR dataset and outputs a table (outtable.txt) containing the mean values of all the mean and standard deviation readings for each (subject,activity) combination.

The original dataset can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It is discussed at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Instructions:
- Uncompress the .zip file
- Place the run_analysis.R script in the resulting sub-directory "UCI HAR Dataset", which also contains the files:
test/
train/
activity_labels.txt
features.txt
features_info.txt
README.txt
- Run the R script
- The output table is generated in "outtable.txt" in the same directory, with subject and activity listed in the first two columns and the mean values of each mean() and std() of each instrument reading listed for each case.

------------------
The user is referred to the README.txt file accompanying the dataset for further information. The dataset contact is: activityrecognition@smartlab.ws and is subject to the following license:
------------------

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
