set.seed(42)

# read in data sets
train_set = read.csv("../../data/train-set.csv", row.names=1)
test_set = read.csv("../../data/test-set.csv", row.names=1)
full_set = read.csv("../../data/scaled-credit.csv", row.names=1)

# fit on train set
ols_model = lm(balance~., data=train_set)

# compute test MSE using best model
test_x = as.matrix(test_set[-12])
test_y = test_set[12]
predict_y = predict(object=ols_model, newx=test_x)
ols_mse = mean((predict_y-test_y)**2)

# refit on full dataset
ols_full_model = lm(balance~., data=full_set)

# save list of models, test MSE and final coefficient estimates
save(ols_model, ols_mse, ols_full_model, file="../../data/ols-data.RData")