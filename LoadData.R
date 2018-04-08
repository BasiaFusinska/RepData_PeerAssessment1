activityData <- read.csv('activity.csv')
activityData$date <- as.Date(activityData$date)
head(activityData)
