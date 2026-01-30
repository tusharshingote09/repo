library(dplyr)
set.seed(123) 
transaction_data <- data.frame(
  CustomerID = rep(1:100, each = 5),
  TransactionDate = sample(seq(as.Date('2022-01-01'), as.Date('2023-01-01'), by = "day"),
                           500, replace = TRUE),
  PurchaseAmount = round(runif(500, min = 10, max = 200), 2)
)
write.csv(transaction_data, "transaction_data.csv", row.names = FALSE)
transaction_data <- read.csv("transaction_data.csv") 
head(transaction_data)
transaction_data <- read.csv("transaction_data.csv")
transaction_data$TransactionDate <- as.Date(transaction_data$TransactionDate)

str(transaction_data)