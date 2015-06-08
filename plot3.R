## read data from file
data <- read.table("hpc.txt", header = TRUE, sep= ";", stringsAsFactors=FALSE, na.strings = "?", dec= ".")
str(data)
## modify date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## create data subset
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
str(subsetdata)
subsetdata$datetime <- as.POSIXct(paste(as.Date(subsetdata$Date),subsetdata$Time))
str(subsetdata)
## create png file
png("plot3.png", width=480, height=480)
#add sub metering graphs
plot(subsetdata$datetime, subsetdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab= "")
lines(subsetdata$datetime, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$datetime, subsetdata$Sub_metering_3, col = "blue")
#add legend to graph
legend("topright", lty=1, lwd=2, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
