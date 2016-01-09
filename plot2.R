hpc <- read.table('./household_power_consumption.txt', header=TRUE, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric","numeric","numeric"), sep=";",dec=".", na.strings="?")

newhpc <- hpc

TwoDayFebHpc <- subset(newhpc, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(TwoDayFebHpc$Date, TwoDayFebHpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(datetime, TwoDayFebHpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()