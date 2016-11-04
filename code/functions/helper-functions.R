#' @title calculate descriptive statistics for quantitative variables
#' @param x numeric vector
#' @return a vertor of statistics
quant_summary = function(x) {
  c(summary(x), "Range"=max(x)-min(x), 
    "IQR"=IQR(x), 
    "SD"=sd(x))
}

#' @title calculate descriptive statistics for qualitative variables
#' @param x numeric vector
#' @return a vertor of statistics
qual_summary = function(x) {
  t = table(x)
  df = as.data.frame(t)
  names(df) = c(names(x), "Freq")
  df$Proportion = prop.table(t)
  df
}
