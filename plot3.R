require(sqldf)
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 100, na.strings = "?", header = TRUE)
classes <- sapply(initial, class)

data <- read.csv.sql("household_power_consumption.txt", colClasses = classes, header = T, sep=";", 
                     sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
x <- paste(data$Date, data$Time)
data$DateTime <- strptime(x, "%d/%m/%Y %T")

png(file = "plot3.png")

data <- getData()
with(data, {
  plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub meeting", xlab = "", col = "black")
})
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), lwd = c(2.5,2.5,2.5))

dev.off()
