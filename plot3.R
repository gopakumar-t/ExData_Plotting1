# Read the original input data
# data should be downloaded from the course website and 
# unzippend file "household_power_consumption.txt" should be aailable 
# on "data" sub-directory under the working directory.  
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get the data subset from the dates 2007-02-01 and 2007-02-02 and remove original data 
dataSub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)


## Converting dates
datetime <- paste(as.Date(dataSub$Date), dataSub$Time)
dataSub$Datetime <- as.POSIXct(datetime)


## Plot 3
with(dataSub, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()