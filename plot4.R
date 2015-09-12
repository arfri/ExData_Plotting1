# Read and pre-process the source data
setwd("E:/rcourse/exdata")
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", na.strings="?")
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date %in% c(as.Date('2007-02-01', '%Y-%m-%d'), as.Date('2007-02-02', '%Y-%m-%d')),]

# multiple plots
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# First plot is same as plot2:
plot(data$datetime, data$Global_active_power, 
     type="l", ylab="Global Active Power", xlab="")
    
# Second plot is Voltage over time
with(data, plot(datetime, Voltage, type="l"))

# Third plot is same as plot3:
plot(data$datetime,data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot is Global reactive power over time
with(data, plot(datetime, Global_reactive_power, type="l"))

dev.off()

