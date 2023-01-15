full_data <- read.table(file = "household_power_consumption.txt", header=T, sep=";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
full_data$Date <- as.Date(myTable$Date, format="%d/%m/%Y")
subset_data <- full_data[full_data$Date >= "2007-02-01" & full_data$Date <= "2007-02-02",]

png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()