# read data... (memory was no issue with 8 GB RAM)

fulldata <- read.table(file="D:/R/household_power_consumption.txt", header=TRUE, skip=0, sep=";", 
                       colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S");
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%y");

usedData <- fulldata[fulldata$Date>="2007-02-01" & fulldata$Date<="2007-02-02",];

# Create Plot...

png(filename = "D:/R/plot1.png", width = 480, height = 480, units = "px");
hist(usedData$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power");
dev.off()