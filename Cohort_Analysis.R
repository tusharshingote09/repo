#install.packages("dplyr")
#install.packages("ggplot2")
#install.packages("lubridate")

library(dplyr)
library(ggplot2)
library(lubridate)

transactions <- data.frame(
  CustomerID = c(1, 1, 2, 2, 3, 3, 3),
  TransactionDate = as.Date(c('2023-01-15', '2023-02-20', '2023-01-25',
                                '2023-03-10', '2023-02-05', '2023-03-15', '2023-04-01')),
                                Amount = c(100, 150, 200, 250, 300, 350, 400)
  )

transactions <- transactions %>%
  group_by(CustomerID) %>%
  mutate(CohortMonth = floor_date(min(TransactionDate), "month")) %>%
  ungroup()

transactions <- transactions %>%
  mutate(MonthsSinceCohort = as.numeric(difftime(TransactionDate, CohortMonth, units = "days"))
         %/% 30) %>%
  group_by(CohortMonth, MonthsSinceCohort) %>%
  summarise(NumCustomers = n_distinct(CustomerID), .groups = 'drop')
print(transactions)

cohort_sizes <- transactions %>%
  group_by(CohortMonth) %>%
  summarise(TotalCustomers = sum(NumCustomers), .groups = 'drop')
print(cohort_sizes)

cohort_analysis <- transactions %>%
  left_join(cohort_sizes, by = "CohortMonth") %>%
  mutate(RetentionRate = NumCustomers / TotalCustomers)
print(cohort_analysis)

ggplot(cohort_analysis, aes(x = MonthsSinceCohort, y = CohortMonth, fill =
                              RetentionRate)) +
  geom_tile() +
  scale_fill_gradient(low = "red", high = "green") +
  labs(title = "Cohort Analysis Heatmap",
       x = "Months Since Cohort",
       y = "Cohort Month",
       fill = "Retention Rate") +
  theme_minimal()
