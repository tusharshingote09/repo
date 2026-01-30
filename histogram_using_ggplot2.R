df <- data.frame(gender=factor(rep(c("Average Female income","Average Male income"), each=20000)), Average_income=round(c(rnorm(20000, mean=15500, sd=500), rnorm(20000, mean=17500, sd=600))))
head(df)
library(ggplot2)
ggplot(df, aes(x=Average_income)) + geom_histogram()