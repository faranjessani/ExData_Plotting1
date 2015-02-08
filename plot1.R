require(sqldf)
initial <- read.table("household_power_consumption.txt", sep = ";", nrows = 100, na.strings = "?", header = TRUE)
classes <- sapply(initial, class)

data_subset <- read.csv.sql("household_power_consumption.txt", colClasses = classes, header = T, sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

hist(data_subset$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()