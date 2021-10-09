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
#Color = Black - default
#specify line graph - type = "l"
plot(datasub$Global_active_power~datasub$Timedate, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Save file
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()