require(sqldf)
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 100, na.strings = "?", header = TRUE)
classes <- sapply(initial, class)

data <- read.csv.sql("household_power_consumption.txt", colClasses = classes, header = T, sep=";", 
                            sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
x <- paste(data$Date, data$Time)
data$DateTime <- strptime(x, "%d/%m/%Y %T")
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png")
dev.off()