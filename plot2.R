# plot2.R
# Course Project 1 Part 2 of Exploratory Data Analsis
# Author: Linda Wang
# Version: 11/06/2015

library(grDevices)

data_row1 <- read.table("household_power_consumption.txt",header=TRUE,nrow=1,na.strings="?",sep=";")
nCols <- ncol(data_row1)
data_date <- read.table("household_power_consumption.txt",colClasses=c("character",rep("NULL",nCols-1)),header=TRUE,as.is=TRUE,na.strings="?",sep=";")
data_date <- as.Date(as.vector(data_date[,1]),"%d/%m/%Y")
data_date <- data.frame(data_date)
colnames(data_date) <- c("Date")
start_date_idx <- which.max(data_date$Date>="2007-02-01")
end_date_idx <- which.min(data_date$Date<="2007-02-02")-1
data <- read.table("household_power_consumption.txt",skip=start_date_idx,nrows=(end_date_idx-start_date_idx+1),col.names=names(data_row1),as.is=TRUE,na.strings="?",sep=";")

library(graphics)
png(filename="plot2.png",width=480,height=480,bg="transparent")
plot(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"),data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()