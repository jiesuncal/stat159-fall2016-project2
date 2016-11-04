library(testthat)

# loading the function files
source("functions/helper-functions.R")
source("functions/regression-functions.R")

# run unit tests in folder 'tests/'
test_dir("tests", reporter = "Summary")
