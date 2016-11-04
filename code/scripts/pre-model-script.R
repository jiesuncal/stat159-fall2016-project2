# a) Dummy out categorical variables
credit = read.csv(file="../../data/Credit.csv", row.names=1)
temp_credit = model.matrix(Balance ~ ., data=credit)
balance = credit$Balance
new_credit = cbind(temp_credit[,-1], balance = balance)

# b) Mean Centering and Standardizing

scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
write.csv(scaled_credit, file = "../../data/scaled-credit.csv")
