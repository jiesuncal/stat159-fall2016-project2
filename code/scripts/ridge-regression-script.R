library("glmnet")
set.seed(42)

# read in data sets
train_set = read.csv("../../data/train-set.csv", row.names=1)
test_set = read.csv("../../data/test-set.csv", row.names=1)
full_set = read.csv("../../data/scaled-credit.csv", row.names=1)

# fit on train set using cross-validation
train_x = as.matrix(train_set[-12])
train_y = as.matrix(train_set[12])
grid = 10^seq(10, -2, length = 100)
ridge_model_list = cv.glmnet(train_x, train_y, lambda=grid, intercept=FALSE, standardize=FALSE, alpha=0)

# select the best model
min_grid = ridge_model_list$lambda.min
ridge_best_model = glmnet(train_x, train_y, lambda=min_grid, intercept=FALSE, standardize=FALSE, alpha=0)

# plot cross-validation errors
png("../../images/ridge-cross-validation-errors.png")
plot(ridge_model_list)
title("Cross-validation Error Plot for Ridge Regression",line=2.5)
dev.off()

# compute test MSE using best model
test_x = as.matrix(test_set[-12])
test_y = test_set[12]
predict_y = predict(object=ridge_best_model, newx=test_x)
ridge_mse = mean((predict_y-test_y)**2)

# refit on full dataset
full_x = as.matrix(full_set[-12])
full_y = as.matrix(full_set[12])
ridge_full_model = glmnet(full_x, full_y, lambda=min_grid, intercept=FALSE, standardize=FALSE, alpha=0)

# save list of models, best lambda, test MSE and final coefficient estimates
save(ridge_model_list, min_grid, ridge_mse, ridge_full_model, file="../../data/ridge-data.RData")