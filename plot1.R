# Read and pre-process the source data
setwd("E:/rcourse/exdata")
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$Date %in% c(as.Date('2007-02-01', '%Y-%m-%d'), as.Date('2007-02-02', '%Y-%m-%d')),]

# Plot an histogram of Global active power and output to PNG file
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
