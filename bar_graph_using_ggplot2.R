library(ggplot2)
data <- data.frame(name = c ("A","B","C","D","E"), value = c (3,12,5,18,45))
ggplot(data, aes(x=name, y=value)) + geom_bar(stat = "identity")