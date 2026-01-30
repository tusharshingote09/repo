library(dplyr)
library(ggplot2)
set.seed(123)
customers <- data.frame(customer_id = 1:100, total_spend = runif(100, min = 100, max = 1000), total_orders = sample(1:10, 100, replace = TRUE), tenure_months = sample(12:120, 100, replace = TRUE) )
print(customers)
customers$avg_spend_per_order <- customers$total_spend / customers$total_orders
print(customers$avg_spend_per_order)
lm_model <- lm(avg_spend_per_order ~ total_orders + tenure_months, data = customers)
summary(lm_model)
ggplot(customers, aes(x = total_orders, y = avg_spend_per_order)) +
  geom_point(color = "blue") + # Actual data points
  geom_smooth(method = "lm", se = FALSE, color = "red") # Linear regression line