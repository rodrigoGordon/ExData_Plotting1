householdDataSet <- read.csv("household_power_consumption.txt", 
                             sep=";", 
                             header = TRUE,
                             stringsAsFactor=FALSE
)

householdDataSet$Date <- as.Date(householdDataSet$Date, "%d/%m/%Y")

#credits to http://stackoverflow.com/questions/11464578/r-subsetting-a-data-frame-using-a-list-of-dates-as-the-filter
dateSubSet <- householdDataSet[
              householdDataSet$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


#partial credits to http://stackoverflow.com/questions/14359546/converting-two-columns-of-date-and-time-data-to-one
dateSubSet <- transform(dateSubSet, 
                        timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(dateSubSet$timestamp,
     dateSubSet$Global_active_power,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)

plot(dateSubSet$timestamp,
     dateSubSet$Voltage,
     type = "l", 
     xlab = "datetime",
     ylab = "Voltage"
)

plot(dateSubSet$timestamp,
     dateSubSet$Sub_metering_1,
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering"
)

lines(dateSubSet$timestamp,dateSubSet$Sub_metering_2, col="red")
lines(dateSubSet$timestamp,dateSubSet$Sub_metering_3, col="blue")

legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1,col=c("black","red","blue"))


plot(dateSubSet$timestamp,
     dateSubSet$Global_reactive_power,
     type = "l", 
     xlab = "",
     ylab = "Global Reactive Power (kilowatts)"
)


png("plot4.png", width = 480, height = 480, res = 72)
