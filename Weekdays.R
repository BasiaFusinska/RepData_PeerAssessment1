noMissingValues

noMissingValues$weekday <- factor(ifelse(weekdays(noMissingValues$date) %in% c("Saturday", "Sunday"),
                           "weekend", "weekday"))

library(ggplot2)
ggplot(noMissingValues, aes(interval, steps)) + geom_line() + facet_wrap(~weekday)
