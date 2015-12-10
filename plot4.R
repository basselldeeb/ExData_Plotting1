dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
varData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
 
datetime <- strptime(paste(varData$Date, varData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(varData$Global_active_power)
GRP <- as.numeric(varData$Global_reactive_power)
voltage <- as.numeric(varData$Voltage)
subMetering1 <- as.numeric(varData$Sub_metering_1)
subMetering2 <- as.numeric(varData$Sub_metering_2)
subMetering3 <- as.numeric(varData$Sub_metering_3)


png("plot4.png", width=480, height=480)
#builds 4 spots for plots
par(mfrow = c(2, 2)) 

#build plots per segment
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

#Add second line to plot3
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#build 4th plot
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

#close device
dev.off()