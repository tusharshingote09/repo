val <- data.frame(course=c('DSA','C++','R','Pyton'), num=c(77,55,80,60))
ggplot(data = val, aes(x=course, y=num, group=1)) + geom_line() + geom_point()