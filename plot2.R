full_data <- read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
full_data$Date <- as.Date(myTable$Date, format="%d/%m/%Y")
subset_data <- full_data[full_data$Date >= "2007-02-01" & full_data$Date <= "2007-02-02",]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%Y-%Y-%d %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()