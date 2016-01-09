hpc <- read.table('./household_power_consumption.txt', header=TRUE, colClasses = c("character","character", "numeric", "numeric","numeric", "numeric","numeric","numeric","numeric"), sep=";",dec=".", na.strings="?")

newhpc <- hpc

TwoDayFebHpc <- subset(newhpc, Date == "1/2/2007" | Date == "2/2/2007")

# head(TwoDayFebHpc, 50)
# dim(TwoDayFebHpc)

png("plot1.png", width = 480, height = 480)
with(TwoDayFebHpc, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))

dev.off()