##Load data into R

data <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                   na.strings = "?", stringsAsFactors = F, comment.char = "")


##subset by date, combine date and time
datasub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

datasub$Date <- as.Date(datasub$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)

##make graph (use Plot())
#TItle = None
#X axis label = None
#Y axis label = Global Active Power (kilowatts)
#submetering 1 as Blk, submetering 2 as red, submetering 3 as blue
#specify line graph - type = "l"
#add legend in top right
plot(datasub$Sub_metering_1~datasub$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(datasub$Sub_metering_2~datasub$Datetime, col = 'Red')
lines(datasub$Sub_metering_3~datasub$Datetime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save file
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()