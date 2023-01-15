full_data <- read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
full_data$Date <- as.Date(myTable$Date, format="%d/%m/%Y")
subset_data <- full_data[full_data$Date >= "2007-02-01" & full_data$Date <= "2007-02-02",]

datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%Y-%Y-%d %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, subset_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subset_data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subset_data$Sub_metering_2, type="l", col="red")
lines(datetime, subset_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, subset_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
