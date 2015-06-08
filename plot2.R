##read data from file
data <- read.table("hpc.txt", header = TRUE, sep= ";", stringsAsFactors=FALSE, na.strings = "?", dec= ".")
str(data)
##change date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## create data subset
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
str(subsetdata)
##create new field with date and time values
subsetdata$datetime <- as.POSIXct(paste(as.Date(subsetdata$Date),subsetdata$Time))
str(subsetdata)
##create png file
png("plot2.png", width=480, height=480)
## create plot graph
plot(subsetdata$datetime, subsetdata$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab= "")
dev.off()
