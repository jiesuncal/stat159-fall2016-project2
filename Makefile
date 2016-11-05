# declare shortcut variables for some commands
rs=rscript
code=cd code
scripts=cd code/scripts
slides=cd slides

.PHONY: all data tests eda preprocess ols ridge lasso pcr plsr regressions report slides session clean

# all
all: eda regressions report

# download the file Credit.csv to the folder data/
data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv > data/Credit.csv

# run unit tests of functions
tests: code/test-that.R code/tests/test-helper.R code/tests/test-regression.R
	$(code) && $(rs) test-that.R

# perform the exploratory data analysis
eda: data/Credit.csv code/scripts/eda-script.R
	$(scripts) && $(rs) eda-script.R

# run premodeling and sampling
preprocess: code/scripts/pre-model-script.R code/scripts/sampling-script.R
	$(scripts) && $(rs) pre-model-script.R && $(rs) sampling-script.R

# ols regression
ols: code/scripts/ols-regression-script.R
	$(scripts) && $(rs) ols-regression-script.R

# Ridge Regression
ridge: code/scripts/ridge-regression-script.R
	$(scripts) && $(rs) ridge-regression-script.R

# Lasso Regression
lasso: code/scripts/lasso-regression-script.R
	$(scripts) && $(rs) lasso-regression-script.R

# Principal Components Regression
pcr: code/scripts/pcr-script.R
	$(scripts) && $(rs) pcr-script.R

# Partial Least Squares Regression
plsr: code/scripts/plsr-script.R
	$(scripts) && $(rs) plsr-script.R

# all five types of regressions
regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

# concatenate all sections into a report
# generate report.pdf (or report.html)
report: eda preprocess regressions
	cat report/sections/*.Rmd > report/report.Rmd
	$(rs) -e 'library(rmarkdown); render("report/report.Rmd","pdf_document")'

# generate slides.html
slides: slides/slides.Rmd
	$(rs) -e 'library(rmarkdown); render("slides/slides.Rmd","ioslides_presentation")'

# generate session-info.txt using make automatic variable
session: session.sh
	bash $<

# clean up report outputs
clean:
	rm -f report/report.pdf
