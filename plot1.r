##Load data into R

data <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                   na.strings = "?", stringsAsFactors = F, comment.char = "")


##subset by date
datasub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

##make histogram
#TItle = Global Active Power
#X axis label = Global Active Power (kilowatts)
#Y axis label = Frequency
#Color = Red
hist(datasub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kW)", ylab = "Frequency", col = "Red")

##Save file
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()