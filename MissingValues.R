nrow(activityData[is.na(activityData$steps),])

dayMeans <- aggregate(steps ~ date, activityData, FUN=mean)
getDayMean <- function(date){
  dayMean <- dayMeans[dayMeans$date == date,]$steps[1]
  if (is.na(dayMean))
    dayMean <- 0.0
  dayMean
}

noMissingValues <- activityData
noMissingValues$steps <- apply(activityData, 1, function(x) { 
    steps <- x['steps']
    if (is.na(steps)){
      steps <- getDayMean(x['date'])
    }
    as.numeric(steps)
  })

dayStepsNoMissing <- aggregate(steps ~ date, noMissingValues, FUN=sum)

library(ggplot2)
qplot(dayStepsNoMissing$steps, geom="histogram", bins=30)

summary(dayStepsNoMissing$steps)
