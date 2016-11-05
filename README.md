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

`Makefile` should have the following Phony targets:

- `all:` will be associated to phony targets `eda`, `regressions`, and `report`
- `data:` will download the file `Credit.csv` to the folder `data/` 
- `tests:` will run the unit tests of your functions
- `eda:` will perform the exploratory data analysis
- `ols`: OLS regression
- `ridge`: Rdige Regression
- `lasso`: Lasso Regression
- `pcr`: Principal Components Regression
- `plsr`: Partial Least Squares Regression
- `regressions`: all five types of regressions
- `report:` will generate `report.pdf` (or `report.html`)
- `slides`: will generate `slides.html`
- `session`: will generate `session-info.txt`
- `clean:` will delete the generated report (pdf and/or html)



## License
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

This project's code is licensed under the MIT License while the media content is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).

## Authors Names:
* Jie Sun
* Stephen (Mingtao) Fang
