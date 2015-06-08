## read data from file
data <- read.table("hpc.txt", header = TRUE, sep= ";", stringsAsFactors=FALSE, na.strings = "?", dec= ".")
str(data)
## modify date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
str(subsetdata)
## create data subset
subsetdata$datetime <- as.POSIXct(paste(as.Date(subsetdata$Date),subsetdata$Time))
str(subsetdata)
## create png file
png("plot4.png", width=480, height=480)
#split the surface in 4 
par(mfrow = c(2,2), mar= c(4, 4, 2, 1))
#create 4 graphs 
plot(subsetdata$datetime, subsetdata$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab= "")
plot(subsetdata$datetime, subsetdata$Voltage, type = "l", ylab="Voltage", xlab= "Datetime")
plot(subsetdata$datetime, subsetdata$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab= "")
lines(subsetdata$datetime, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$datetime, subsetdata$Sub_metering_3, col = "blue")
legend("topright", lty=1, lwd=2, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(subsetdata$datetime, subsetdata$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab= "Datetime")
dev.off()
