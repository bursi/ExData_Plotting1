# read data... (memory was no issue with 8 GB RAM)

fulldata <- read.table(file="D:/R/household_power_consumption.txt", header=TRUE, skip=0, sep=";", 
                       colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");

fulldata$Time <- strptime(paste(fulldata$Date, fulldata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S");
fulldata$Date <- as.Date(fulldata$Date, "%d/%m/%y");

usedData <- fulldata[fulldata$Date>="2007-02-01" & fulldata$Date<="2007-02-02",];

# Create Plots...

png(filename = "D:/R/plot4.png", width = 480, height = 480, units = "px");
par(mfrow=c(2,2))

plot(usedData$Time, usedData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");

plot(usedData$Time, usedData$Voltage, type="l", xlab="datetime", ylab="Voltage");

plot(usedData$Time, usedData$Sub_metering_1, type="l", col="black", xlab="", ylab="");
lines(usedData$Time, usedData$Sub_metering_2, type="l", col="red", xlab="", ylab="");
lines(usedData$Time, usedData$Sub_metering_3, type="l", col="blue", xlab="", ylab="");
title(xlab=NULL, ylab="Energy sub metering");
legend("topright", col = c("black","red","blue"), lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n");

plot(usedData$Time, usedData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power");

dev.off()