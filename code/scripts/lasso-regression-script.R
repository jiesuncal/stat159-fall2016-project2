# Load Libraries
library("pls")
library("glmnet")
set.seed(42)

# Read in Data Sets
train_set = read.csv(file='../../data/train-set.csv')
test_set = read.csv(file='../../data/test-set.csv')
full_set = read.csv(file = '../../data/scaled-credit.csv')

# Apply Lasso Regression Models
train_x = as.matrix(train_set[-12])
train_y = as.matrix(train_set[12])
grid = 10^seq(10, -2, length = 100)
lasso_model_list = cv.glmnet(train_x, train_y, lambda=grid, intercept=FALSE, standardize=FALSE, alpha=1)

# select the best model
min_grid = lasso_model_list$lambda.min
lasso_best_model = glmnet(train_x, train_y, lambda=min_grid, intercept=FALSE, standardize=FALSE, alpha=1)

# plot cross-validation errors
png("../../images/lasso-cross-validation-errors.png")
plot(lasso_model_list)
title("Cross-validation Error Plot for Lasso Regression",line=2.5)
dev.off()

# compute test MSE using best model
test_x = as.matrix(test_set[-12])
test_y = test_set[12]
predict_y = predict(object=lasso_best_model, newx=test_x)
lasso_mse = mean((predict_y-test_y)**2)

# refit on full dataset
full_x = as.matrix(full_set[-12])
full_y = as.matrix(full_set[12])
lasso_full_model = glmnet(full_x, full_y, lambda=min_grid, intercept=FALSE, standardize=FALSE, alpha=1)

# save list of models, test MSE and final coefficient estimates
save(lasso_model_list, lasso_mse, lasso_full_model, file="../../data/lasso-data.RData")

