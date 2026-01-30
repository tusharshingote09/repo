library(dplyr)
library(ggplot2)

set.seed(123)

# Generate the data
emails <- data.frame(
  recipient_id = 1:1000, 
  group = sample(c("A", "B"), size = 1000, replace = TRUE, prob = c(0.5, 0.5))
)

# Assign open_rate based on group
emails <- emails %>%
  group_by(group) %>%
  mutate(open_rate = ifelse(group == "A", rnorm(n(), mean = 0.1, sd = 0.02), rnorm(n(), mean = 0.12, sd = 0.02))) %>%
  ungroup()

# Shuffle rows
emails <- emails[sample(nrow(emails)), ]

# Check group counts
table(emails$group)

# Calculate mean open rates
mean_open_rates <- emails %>% 
  group_by(group) %>% 
  summarise(mean_open_rate = mean(open_rate))
print(mean_open_rates)

# Plot
ggplot(emails, aes(x = group, y = open_rate, fill = group)) +
  geom_boxplot() +
  labs(title = "Open Rates by Group", x = "Group", y = "Open Rate") +
  theme_minimal()

# T-test
t_test_result <- t.test(open_rate ~ group, data = emails)
print(t_test_result)
