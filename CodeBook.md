#Code Book for run_analysis.R
##By A. Roberts February 2017

The code is standalone and can be run as a single R script, placed in the UCI HAR dataset directory. It should be run as described in the readme.md file.

The analysis is performed as follows:
1) Read in both the test and training data (from the directories test/ and train/)
2) Combine these readings into a single combined dataset
3) Read in the activity and feature labels from activity_lables.txt and features.txt
4) Select the columns in the combined dataset which are means and standard deviations using grep
5) Create a blank summary table with a row for each (subject, activity) combination
6) Compute the column means for each reading (feature) selected in step (4) for each (subject, activity) combination
7) Populate the summary table with the results of step (6)
8) Create descriptive column headings and add to summary table
9) Write out summary table to outtable.txt

The run_analysis.R is freely distributable, though the original dataset and any output generated from run_analysis.R are subject to the license described in the readme.md file.
