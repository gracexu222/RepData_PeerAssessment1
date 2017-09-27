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

sum(is.na(as.character(data$steps)))
sum(is.na(as.character(data$date)))
sum(is.na(as.character(data$interval)))
NA_index <- which(is.na(as.character(data$steps)))
complete_data <- data

complete_data[NA_index, ]$steps<-unlist(lapply(NA_index, FUN=function(NA_index){
        steps_per_interval[data[NA_index,]$interval==steps_per_interval$interval,]$average_steps
}))

summary(complete_data)
str(complete_data)

steps_each_day_complete <- aggregate(steps ~ date, data = complete_data, sum)
colnames(steps_each_day_complete) <- c("date", "steps")
hist(as.numeric(steps_each_day_complete$steps), breaks = 20, col = "red", xlab = "Number of Steps", main= "Histogram of the total number of steps taken each day")

mean(steps_each_day_complete$steps)
median(steps_each_day_complete$steps)
