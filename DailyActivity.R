intervalsSteps <- aggregate(steps ~ interval, activityData, FUN=mean)

library(ggplot2)
qplot(interval, steps, data=intervalsSteps, geom="path")

intervalsSteps[which.max(intervalsSteps$steps), ]
