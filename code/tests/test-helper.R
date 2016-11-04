source("../functions/helper-functions.R")

test_quant = 1:10
quant_stat = c(1, 3.25, median(test_quant), mean(test_quant), 7.75, 10, 9, IQR(1:10), sd(1:10))

months = c("March","April","January","November","January",
           "September","October","September","November","August",
           "January","November","November","February","May","August",
           "July","December","August","August","September","November",
           "February","April")
months = as.data.frame(months)
months_t = table(months)
months_prop_t = prop.table(months_t)

context("Test for quant_summary")

test_that("descriptive statistics for quantitative data", {
  expect_equal(sum(quant_summary(test_quant) == quant_stat), length(quant_stat))
  expect_length(quant_summary(test_quant), length(quant_stat))
  expect_type(quant_summary(test_quant), 'double')
})

context("Test for qual_summary")

test_that("descriptive statistics for qualitative data", {
  result = qual_summary(months)
  expect_equal(sum(result$Freq == months_t), length(result$Freq))
  expect_equal(sum(result$Proportion == months_prop_t), length(result$Proportion))
  expect_length(result, 3)
})