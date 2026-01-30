library(dplyr)
library(ggplot2)

set.seed(123)

emails <- data.frame(recipient_id = 1:1000, group = sample(c("A", "B"), size = 1000, replace = TRUE, prob = c(0.5, 0.5)))

emails$open_rate <- ifelse(emails$group == "A", rnorm (500, mean = 0.1, sd = 0.02), rnorm(500,mean = 0.12, sd =0.02))

table(emails$group)

emails <- emails[sample(nrow(emails)),]
table(emails$group)

mean_open_rate <- emails %>% group_by(group) %>% summarise(mean_open_rates=mean(open_rate))
print(mean_open_rates)

ggplot(emails, aes(x = group, y = open_rate, fill = group)) +
geom_boxplot() +  
labs(title = "Open Rates by Group", x = "Group", y = "Open Rate") +
theme_minimal()
t_test_result <- t.test(open_rate ~ group, data = emails)
print(t_test_result)