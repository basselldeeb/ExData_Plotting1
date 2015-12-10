dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
varData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
 
GAP <- as.numeric(varData$Global_active_power)
#create histogram directly on PNG
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()