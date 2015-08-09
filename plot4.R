# read the data into R

energyTable <- read.table("C:\\Users\\Steve\\Documents\\Coursera\\Data Science\\Exploratory Data Analysis\\Week 1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Covert the Dates
energyTable$Date <- as.Date(energyTable$Date, format = "%d/%m/%Y")

# Select only dates = 2007-02-01 or 2007-02-02
subenergyTable<- subset(energyTable, energyTable$Date == "2007-02-01" | energyTable$Date == "2007-02-02")

# Combine date and time
subenergyTable$dateTime = as.POSIXlt(paste(subenergyTable$Date,subenergyTable$Time, sep = " "))

# Create graphs
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2), mar=c(4,4,2,1))

# 1st Chart
plot(subenergyTable$dateTime,subenergyTable$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power")

# 2nd Chart
plot(subenergyTable$dateTime, subenergyTable$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )

# 3rd Chart
with(subenergyTable,plot(subenergyTable$dateTime, subenergyTable$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
with(subenergyTable, lines(subenergyTable$dateTime, subenergyTable$Sub_metering_2, col = "red"))
with(subenergyTable, lines(subenergyTable$dateTime, subenergyTable$Sub_metering_3, col = "blue"))
legend("topright",pch = "-", col = c('black',"red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 4th Chart
plot(subenergyTable$dateTime,subenergyTable$Global_reactive_power,type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()