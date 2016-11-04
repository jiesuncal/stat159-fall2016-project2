# Data

* This `data` folder includes several data files generated during our data analysis process. First of all, this contains the `Credit.csv` file, which is the raw data file obtained from this link [http://www-bcf.usc.edu/~gareth/ISL/Credit.csv](link). We also have the transformed data sets 'scaled-credit.csv', which are later split into two other data sets of, which are `test-set.csv` of 100 rows of data and `train-set.csv` of 300 rows of data.

* From the Exploratory Analysis process, we also generated the `eda-output.txt`, which contains the descriptive statistics for all variables in the credit data set. Through this process, an correlation matrix data is also generated and included in this folder, which is `correlation-matrix.RData`.

* From the regression modeling analysis, we generated 5 different `RData` output, which are `ridge-data.RData`, 'lasso-data.RData', `ols-data.RData`, `pcr-data.RData`, `plsr-data.RData`, which each contains the list of models generated with cross-validation, the best model picked with error rate plotting and the mse test results.


* The data structure for this folder is:


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
```

# Credit

Credit to authors of the book "[An Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/)" - Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani.
