dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
varData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(varData$Date, varData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP <- as.numeric(varData$Global_active_power)
#builds plot taking the datetime as x and gap as y 
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()