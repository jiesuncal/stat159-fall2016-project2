library("pls")
set.seed(42)

# read in data sets
train_set = read.csv("../../data/train-set.csv", row.names=1)
test_set = read.csv("../../data/test-set.csv", row.names=1)
full_set = read.csv("../../data/scaled-credit.csv", row.names=1)

# fit on train set using cross-validation
pcr_cv = pcr(balance ~ ., data=train_set, validation="CV")

# select the best model
best_ncomp = which.min(pcr_cv$validation$PRESS)
pcr_best_model = pcr(balance ~ ., data=train_set, ncomp=best_ncomp)

# plot cross-validation errors
png("../../images/pcr-cross-validation-errors.png")
validationplot(pcr_cv, val.type="MSEP", 
               main="Cross-validation Error Plot for Principal Components regression")
dev.off()

# compute test MSE using best model
test_x = as.matrix(test_set[-12])
test_y = test_set[12]
predict_y = predict(object=pcr_best_model, newx=test_x)
pcr_mse = mean((predict_y-test_y)**2)

# refit on full dataset
pcr_full_model = pcr(balance ~ ., data=full_set, ncomp=best_ncomp)

# save list of models, best number of components, test MSE and final coefficient estimates
save(pcr_cv, best_ncomp, pcr_mse, pcr_full_model, file="../../data/pcr-data.RData")