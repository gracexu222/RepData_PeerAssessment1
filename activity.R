setwd("~/Documents/R program")
data<- read.csv("activity.csv",header=TRUE,sep =",",na.strings="NA")
summary(data)
str(data)
head(data)
data$date<- as.Date(data$date,format ="%Y-%m-%d")
data$interval<- factor(data$interval)
NA_index<- is.na(as.character(data$steps))
data_no_NA<- data[!NA_index,]
head(data_no_NA)

steps_each_day<- aggregate(steps ~ date,data = data_no_NA,sum)
colnames(steps_each_day)<- c("date","steps")
hist(as.numeric(steps_each_day$steps), breaks = 20, col = "red", xlab = "Number of Steps", main= "Histogram of the total number of steps taken each day")

mean(steps_each_day$steps)
median(steps_each_day$steps)

