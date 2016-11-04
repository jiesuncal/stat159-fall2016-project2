# Training and Testing Sets
scaled_credit = read.csv(file="../../data/scaled-credit.csv", row.names=1)
set.seed(42)
int_vector = 1:400
sampled_rows = sample(int_vector, 300, replace=FALSE)
unsampled_rows = int_vector[-sampled_rows]
train_set = scaled_credit[sampled_rows,]
test_set = scaled_credit[unsampled_rows,]

# Write out the train set and test set to csv
write.csv(train_set, file= '../../data/train-set.csv')
write.csv(test_set, file= '../../data/test-set.csv')
