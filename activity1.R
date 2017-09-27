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

steps_per_interval <- aggregate(data_no_NA$steps, by=list(interval=data_no_NA$interval), FUN=mean)
colnames(steps_per_interval) <- c("interval", "average_steps")
plot(as.integer(levels(steps_per_interval$interval)), steps_per_interval$average_steps, type="l",
     xlab = "Interval", ylab = "Average Number of Steps", main = "Average Daily Activity Pattern",  col ="blue")
max_steps <- max(steps_per_interval$average_steps)
max_steps
intervale_max_steps<-steps_per_interval[which.max(steps_per_interval$average_steps),]$interval
intervale_max_steps
