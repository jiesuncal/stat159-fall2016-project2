library("pls")
set.seed(42)

# read in data sets
train_set = read.csv("../../data/train-set.csv", row.names=1)
test_set = read.csv("../../data/test-set.csv", row.names=1)
full_set = read.csv("../../data/scaled-credit.csv", row.names=1)

# fit on train set using cross-validation
plsr_cv = plsr(balance ~ ., data=train_set, validation='CV')

# select the best model
best_ncomp = which.min(plsr_cv$validation$PRESS)
plsr_best_model = plsr(balance ~ ., data=train_set, ncomp=best_ncomp)

# plot cross-validation errors
png("../../images/plsr-cross-validation-errors.png")
validationplot(plsr_cv, val.type = 'MSEP', 
               main="Cross-validation Error Plot for Partial Least Square Regression")
dev.off()

# compute test MSE using best model
test_x = as.matrix(test_set[-12])
test_y = test_set[12]
predict_y = predict(object=plsr_best_model, newx=test_x)
plsr_mse = mean((predict_y-test_y)**2)

# refit on full dataset
plsr_full_model = plsr(balance ~., data=full_set, ncomp=best_ncomp)

# save list of models, test MSE and final coefficient estimates
save(plsr_cv, best_ncomp, plsr_mse, plsr_full_model, file="../../data/plsr-data.RData")