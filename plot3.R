# read the data into R

energyTable <- read.table("C:\\Users\\Steve\\Documents\\Coursera\\Data Science\\Exploratory Data Analysis\\Week 1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Covert the Dates
energyTable$Date <- as.Date(energyTable$Date, format = "%d/%m/%Y")

# Select only dates = 2007-02-01 or 2007-02-02
subenergyTable<- subset(energyTable, energyTable$Date == "2007-02-01" | energyTable$Date == "2007-02-02")

# Combine date and time
subenergyTable$dateTime = as.POSIXlt(paste(subenergyTable$Date,subenergyTable$Time, sep = " "))

# Create graph
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(subenergyTable,plot(subenergyTable$dateTime, subenergyTable$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
with(subenergyTable, lines(subenergyTable$dateTime, subenergyTable$Sub_metering_2, col = "red"))
with(subenergyTable, lines(subenergyTable$dateTime, subenergyTable$Sub_metering_3, col = "blue"))
legend("topright",pch = "-", col = c('black',"red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()