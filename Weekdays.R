noMissingValues

noMissingValues$weekday <- factor(ifelse(weekdays(noMissingValues$date) %in% c("Saturday", "Sunday"),
                           "weekend", "weekday"))

intervalsWeekSteps <- aggregate(steps ~ interval + weekday, noMissingValues, FUN=mean)

library(ggplot2)
ggplot(intervalsWeekSteps, aes(interval, steps)) + geom_line() + facet_wrap(~weekday)
