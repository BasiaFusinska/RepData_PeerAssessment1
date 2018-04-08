daySteps <- aggregate(steps ~ date, activityData, FUN=sum)

library(ggplot2)
qplot(daySteps$steps, geom="histogram", bins=30)

summary(daySteps$steps)
