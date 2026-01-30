barplot(airquality$Ozone, main='Ozone concentration in air', xlab='Ozone levels', horiz=FALSE)
barplot(airquality$Ozone, main='Ozone concentration in air', xlab='Ozone levels',col='blue', horiz=FALSE)

data(airquality)
hist(airquality$Temp, main="La Guardin Airport's\ Maximum Tempurature(Daily)", xlab = "Temperature(Fahrencheit", xlim = c(50,125), col = "yellow", freq = TRUE)

data(airquality)
boxplot(airquality$Wind, main="Average Wind", col = "red", border = "black", horizontal = TRUE, notch=TRUE)

boxplot(airquality[,0:4], main = 'Box plot for Air Quality parameter')

library(ggplot2)
data <- data.frame(name = c ("A","B","C","D","E"), value = c (3,12,5,18,45))
ggplot(data, aes(x=name, y=value)) + geom_bar(stat = "identity")

df <- data.frame(gender=factor(rep(c("Average Female income","Average Male income"), each=20000)), Average_income=round(c(rnorm(20000, mean=15500, sd=500), rnorm(20000, mean=17500, sd=600))))
head(df)
library(ggplot2)
ggplot(df, aes(x=Average_income)) + geom_histogram()

data("airquality")
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

val <- data.frame(course=c('DSA','C++','R','Pyton'), num=c(77,55,80,60))
ggplot(data = val, aes(x=course, y=num, group=1)) + geom_line() + geom_point()