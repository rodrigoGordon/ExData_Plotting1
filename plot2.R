library(ggplot2) 


householdDataSet <- read.csv("household_power_consumption.txt", 
                             sep=";", 
                             header = TRUE,
                             
                             stringsAsFactor=FALSE
)

householdDataSet$Date <- as.Date(householdDataSet$Date, "%d/%m/%Y")
#householdDataSet$Time <- strptime(householdDataSet$Time, "%X") 

#credits to http://stackoverflow.com/questions/11464578/r-subsetting-a-data-frame-using-a-list-of-dates-as-the-filter
dateSubSet <- householdDataSet[householdDataSet$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


#partial credits to http://stackoverflow.com/questions/14359546/converting-two-columns-of-date-and-time-data-to-one
dateSubSet <- transform(dateSubSet, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


plot(dateSubSet$timestamp,
     dateSubSet$Global_active_power,
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
     )

png("plot2.png", width = 480, height = 480, res = 72) 

