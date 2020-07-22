plotData <- read.table("C:/Users/HOME/Desktop/Coursera assignment/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Generating Plot 4
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

## Save file and close device
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()