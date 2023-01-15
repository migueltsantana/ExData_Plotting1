full_data <- read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
full_data$Date <- as.Date(myTable$Date, format="%d/%m/%Y")
subset_data <- full_data[full_data$Date >= "2007-02-01" & full_data$Date <= "2007-02-02",]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%Y-%Y-%d %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(datetime, subset_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()