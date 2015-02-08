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


## Plot 2
plot(dataSub$Global_active_power~dataSub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()