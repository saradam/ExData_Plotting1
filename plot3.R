hpc <- read.table('./household_power_consumption.txt', header=TRUE, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric","numeric","numeric"), sep=";",dec=".", na.strings="?")

newhpc <- hpc

TwoDayFebHpc <- subset(newhpc, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(TwoDayFebHpc$Date, TwoDayFebHpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width = 480, height = 480)
plot(datetime, TwoDayFebHpc$Sub_metering_1, type="l")
lines(datetime, TwoDayFebHpc$Sub_metering_2, col="red")
lines(datetime, TwoDayFebHpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
dev.off()