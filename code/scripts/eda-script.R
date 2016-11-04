source("../functions/helper-functions.R")

# read in the Credit.csv
credit = read.csv("../../data/Credit.csv", row.names=1)
quant_idx = c(1,2,3,4,5,6,11)
qual_idx = c(7,8,9,10)

# compute descriptive statistics, summaries, matrix of correlations
# of all variables
sink("../../data/eda-output.txt", append=FALSE, split=FALSE)
sapply(credit[quant_idx], quant_summary)
for (i in qual_idx) {
  print(qual_summary(credit[i]))
}
# matrix of correlations among all quantitative variables.
cor_matrix = cor(credit[quant_idx])
cor_matrix
# anova's between Balance and all the qualitative variables
aov(Balance ~ Gender, credit)
aov(Balance ~ Student, credit)
aov(Balance ~ Married, credit)
aov(Balance ~ Ethnicity, credit)
sink()

# generate histograms and boxplots for quantitative variables 
for (i in quant_idx) {
  cname = names(credit[i])
  hname = paste0("../../images/histogram-", tolower(cname), ".png")
  bname = paste0("../../images/boxplot-", tolower(cname), ".png")
  png(hname)
  hist(as.numeric(unlist(credit[i])), 
       main=paste('Histogram of', cname), xlab=cname)
  dev.off()
  png(bname)
  boxplot(credit[i], 
          main=paste('Boxplot of', cname), xlab=cname)
  dev.off()
}

# generate barcharts of counts and conditional boxplots
# for qualitative variables
for (i in qual_idx) {
  cname = names(credit[i])
  bar_name = paste0("../../images/barplot-", tolower(cname), ".png")
  png(bar_name)
  barplot(table(credit[i]), 
          main=paste(cname, "Distribution"), 
          ylab="Counts")
  dev.off()
}

# conditional boxplots for qualitative variables
png("../../images/boxplot-balance-on-gender.png")
boxplot(credit$Balance ~ credit$Gender, 
        main="Boxplot of Balance Conditioned to Gender")
dev.off()

png("../../images/boxplot-balance-on-student.png")
boxplot(credit$Balance ~ credit$Student, 
        main="Boxplot of Balance Conditioned on Student")
dev.off()

png("../../images/boxplot-balance-on-married.png")
boxplot(credit$Balance ~ credit$Married, 
        main="Boxplot of Balance Conditioned on Married")
dev.off()

png("../../images/boxplot-balance-on-ethnicity.png")
boxplot(credit$Balance ~ credit$Ethnicity,
        main="Boxplot of Balance Conditioned on Ethnicity")
dev.off()

# scatterplot-matrix (pairwise scatterplots)
png("../../images/scatterplot-matrix.png")
pairs(credit, main='Pairwise Scatterplot of Credit Data')
dev.off()

# save binary format
save(cor_matrix, file="../../data/correlation-matrix.RData")
save.image()
