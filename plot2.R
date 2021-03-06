##  Load the required library
library(dplyr)

## Read the complete data
data_full <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

##Subset the required data 
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

##Generating the plot
png("plot2.png", width=480, height=480)
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
dev.off()