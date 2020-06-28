##  Load the required library
library(dplyr)

## Read the complete data
data_full <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Subset the required data 
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data2<-data1$Global_active_power
data3<-as.numeric(as.character(data2))

#Generate the Histogram
png("plot1.png", width=480, height=480)
hist(data3, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

