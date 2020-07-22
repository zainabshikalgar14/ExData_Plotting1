plotData <- read.table("C:/Users/HOME/Desktop/Coursera assignment/Exploratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)


## Create the histogram
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
