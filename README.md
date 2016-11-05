---
title: "Stats 159 Project 2 - Predictve Modeling Process"
subtitle: "Stat 159, Fall 2016, Prof. Sanchez"
output: pdf_document
fontsize: 11pt
urlcolor: blue
---

## File Structure

The file-structure for the project is as follows:

```
stat159-fall2016-project2/
    README.md
    Makefile
    LICENSE
    session-info.txt
    .gitignore
    code/
    	functions/
        	helper-functions.R
        	regression-functions.R
    	scripts/
        	eda-script.R
        	ols-regression-script.R
        	plsr-script.R
        	ridge-regression-script.R
        	session-info.R
			lasso-regression-script.R
			pcr-script.R
			pre-model-script.R
			sampling-script.R

    	tests/
        	test-helper.R
        	test-regression.R

        test-that.R

    data/
      	Credit.csv
		eda-output.txt
		pcr-data.RData
		scaled-credit.csv
		README.md
		lasso-data.RData
		plsr-data.RData
		test-set.csv
		correlation-matrix.RData
		ols-data.RData
		ridge-data.RData
		train-set.csv

    images/
   		barplot-ethnicity.png
   		boxplot-rating.png
		barplot-gender.png			
		histogram-age.png
		barplot-married.png
		histogram-balance.png
		barplot-student.png
		histogram-cards.png
		boxplot-age.png
		histogram-education.png
		boxplot-balance-on-ethnicity.png
		histogram-income.png
		boxplot-balance-on-gender.png
		histogram-limit.png
		boxplot-balance-on-married.png
		histogram-rating.png
		boxplot-balance-on-student.png
		lasso-cross-validation-errors.png
		boxplot-balance.png
		pcr-cross-validation-errors.png
		boxplot-cards.png
		plsr-cross-validation-errors.png
		boxplot-education.png
		ridge-cross-validation-errors.png
		boxplot-income.png
		scatterplot-matrix.png
		boxplot-limit.png
    report/
    	report.pdf
    	report.Rmd
      	sections/
        	00-abstract.Rmd
        	01-introduction.Rmd
        	02-data.Rmd
        	03-methods.Rmd
        	04-analysis.Rmd
        	05-results.Rmd
        	06-conclusions.Rmd
   slides/
      ...
```

## Instruction on Reproducing this Project
1. Initialize a folder

  ```
  mkdir your_working_directory
  cd your_working_directory
  ```

2. Download this project or Git clone this project to your working directory

  ```
  git clone https://github.com/jiesuncal/stat159-fall2016-project2
  ```

3. `cd` into this project folder

  ```
  cd stat159-fall2016-project2
  ```

4. Clean up previous outputs with `make clean`

5. Generate reproducible output with `make all`

6. Check for the outputs generated with `make all` and enjoy the data, images and reports!

## List of Make Commands for Phony Targets


## License
This project is under a `MIT` License. 

## Authors Names:
* Jie Sun
* Stephen (Mingtao) Fang
