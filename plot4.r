##Load data into R

data <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                   na.strings = "?", stringsAsFactors = F, comment.char = "")


##subset by date, combine date and time
datasub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

datasub$Date <- as.Date(datasub$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(datasub$Date), datasub$Time)
datasub$Datetime <- as.POSIXct(datetime)

##make graph (use Plot())
#repeat of two past graphs, two more
#try with loop to reduce inputs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datasub, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

##Save file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()