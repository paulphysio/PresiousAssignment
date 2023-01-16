The Pearson correlation coefficient (PCC) is a measure of the linear correlation between two variables. It ranges from -1 (perfect negative correlation) to 1 (perfect positive correlation) and a value of 0 indicates no correlation. In Python, the PCC can be calculated using the pearsonr() function from the scipy.stats module.

Calculating the Pearson correlation coefficient (PCC) in Python without using libraries is relatively straightforward. The PCC is defined as the covariance of two variables divided by the product of their standard deviations.

To calculate the PCC without libraries, one can implement the following steps:

Compute the means of the two variables
Compute the standard deviations of the two variables
Compute the covariance of the two variables
Divide the covariance by the product of the standard deviations


Introduction

This report describes the process of writing Python code to read CSV data from two files, merge the data into a single Data Frame, clean the merged data, filter out unnecessary rows, investigate the effects of engagement on attainment, and test the hypothesis that engagement has some effect on levels of attainment. Additionally, the report also covers the process of investigating the effects of disability on levels of attainment and testing if there is any difference between the attainment of disabled and non-disabled students.

Methods

Reading CSV Data: The first step in the process was to read CSV data from two files using the pandas library in Python. The read_csv() function was used to read the data from the files and store them in separate Data Frames.

Merging Data: The next step was to merge the data from the two Data Frames into a single Data Frame using the pandas merge() function. The merge() function was used to combine the data based on a common column.

Cleaning Data: After merging the data, it was necessary to clean the data by removing any duplicate rows, missing values, and any other errors. This was done using the drop_duplicates() function, the dropna() function, and other data cleaning techniques.

Filtering Data: The next step was to filter out unnecessary rows from the Data Frame. This was done using the pandas query() function and other filtering techniques.

Investigating the Effects of Engagement: To investigate the effects of engagement on attainment, the Data Frame was grouped by engagement levels and the mean of the attainment levels was calculated for each group. This was done using the groupby() function and the mean() function.

Testing the Hypothesis: To test the hypothesis that engagement has some effect on levels of attainment, a t-test was conducted. The t-test was used to compare the means of the attainment levels for different engagement levels.

Investigating the Effects of Disability: To investigate the effects of disability on levels of attainment, the Data Frame was grouped by disability status and the mean of the attainment levels was calculated for each group.

Testing the Difference: To test if there is any difference between the attainment of disabled and non-disabled students, a t-test was conducted. The t-test was used to compare the means of the attainment levels for disabled and non-disabled students.

Results

The results of the analysis show that engagement levels have a positive effect on attainment levels. The t-test revealed that there is a significant difference in the means of the attainment levels for different engagement levels. Additionally, the results also show that there is a difference between the attainment of disabled and non-disabled students. The t-test revealed that there is a significant difference in the means of the attainment levels for disabled and non-disabled students.

Conclusion

The Python code was used to read CSV data from two files, merge the data into a single Data Frame, clean the merged data, filter out unnecessary rows, investigate the effects of engagement on attainment, and test the hypothesis that engagement has some effect on levels of attainment. Additionally, the report also covers the process of investigating the effects of disability on levels of attainment and testing if there is any difference between the attainment of disabled and non-disabled students. The results of the analysis indicate that engagement levels have a positive effect on attainment levels and that there is a difference between the attainment of disabled and non-disabled students.

.