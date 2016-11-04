This `data` folder includes several data files generated during our data analysis process. First of all, this contains the `Credit.csv` file, which is the raw data file obtained from this link [http://www-bcf.usc.edu/~gareth/ISL/Credit.csv](link). We also have the transformed data sets 'scaled-credit.csv', which are later split into two other data sets, 'test-set.csv' and 'train-set.csv'.

From the Exploratory Analysis process, we also generated the `eda-output.txt`, which contains the descriptive statistics for all variables in the credit data set. Through this process, an correlation matrix data is also generated and included in this folder, which is `correlation-matrix.RData`.

From the regression modeling analysis, we generated 5 different `RData` output, which are `ridge-data.RData`, 'lasso-data.RData', `ols-data.RData`, `pcr-data.RData`, `plsr-data.RData`.

The data structure for this folder is:

```
data/
	Credit.csv
	scaled-credit.csv
	train-set.csv
	test-set.csv
	ridge-data.RData
	lasso-data.RData
	ols-data.RData
	pcr-data.RData
	plsr-data.RData
	correlation-matrix.RData
	eda-output.txt