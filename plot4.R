hpc <- read.table('./household_power_consumption.txt', header=TRUE, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric","numeric","numeric"), sep=";",dec=".", na.strings="?")

newhpc <- hpc

TwoDayFebHpc <- subset(newhpc, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(TwoDayFebHpc$Date, TwoDayFebHpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(datetime, TwoDayFebHpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, TwoDayFebHpc$Voltage, type="l", ylab="Voltage")
plot(datetime, TwoDayFebHpc$Sub_metering_1, type="l", ylab="Energy Sub metering")
lines(datetime, TwoDayFebHpc$Sub_metering_2, col="red")
lines(datetime, TwoDayFebHpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
plot(datetime, TwoDayFebHpc$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()