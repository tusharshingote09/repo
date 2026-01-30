mat = matrix(c(1:21), nrow = 7, ncol = 3, byrow = TRUE)

sample <- sample(c(TRUE,FALSE), nrow(mat), replace = TRUE, prob =c(0.7,0.3))
train_dataset <- mat[sample, ]
test_dataset <- mat[!sample, ]
print("Training Dataset")
print(train_dataset)
print(test_dataset)

library(dplyr)
data_frame = data.frame(col1 = c(1:15), col2 = letters[1:15], col3 = c(0,1,1,1,0,0,0,0,0,1,1,0,1,1,0))
print(data_frame)

training_dataset <- data_frame %>% dplyr::sample_frac(0.7)
print(train_dataset)

testing_dataset <- dplyr::anti_join(data_frame, training_dataset, by='col1')
print(testing_dataset)

library("caTools")
data_frame = data.frame(col1 = c(1:15), col2 = letters[1:15], col3 = c(0,1,1,1,0,0,0,0,0,1,1,0,1,1,0))
print(data_frame)