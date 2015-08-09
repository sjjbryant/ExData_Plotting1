# read the data into R

energyTable <- read.table("C:\\Users\\Steve\\Documents\\Coursera\\Data Science\\Exploratory Data Analysis\\Week 1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Covert the Dates
energyTable$Date <- as.Date(energyTable$Date, format = "%d/%m/%Y")

# Select only dates = 2007-02-01 or 2007-02-02
subenergyTable<- subset(energyTable, energyTable$Date == "2007-02-01" | energyTable$Date == "2007-02-02")

# Combine date and time
subenergyTable$dateTime = as.POSIXlt(paste(subenergyTable$Date,subenergyTable$Time, sep = " "))

# Create graph
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(subenergyTable$dateTime,subenergyTable$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power (killowatts)" )

dev.off()