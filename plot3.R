plotData <- read.table("C:/Users/HOME/Desktop/Coursera assignment/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)

## Generating Plot 3
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")

## Save file and close device
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()