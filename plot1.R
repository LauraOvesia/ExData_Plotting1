## read data from file
data <- read.table("hpc.txt", header = TRUE, sep= ";", stringsAsFactors=FALSE, na.strings = "?", dec= ".")
str(data)
## modify date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")
## create data subset
subsetdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
str(subsetdata)
## create png file
png("plot1.png", width=480, height=480)
## create histogram
hist(subsetdata$Global_active_power, col= "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

