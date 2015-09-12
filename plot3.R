# Read and pre-process the source data
setwd("E:/rcourse/exdata")
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date %in% c(as.Date('2007-02-01', '%Y-%m-%d'), as.Date('2007-02-02', '%Y-%m-%d')),]

# Plot an histogram of Global active power and output to PNG file
png(file="plot3.png", width=480, height=480)
plot(data$DateTime,data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(data$DateTime,data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

