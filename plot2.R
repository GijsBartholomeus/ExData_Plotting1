#Load Data.txt as table
FullHouse <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Subset correct dates from full table
House <- subset(FullHouse, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date Column to class ='Date'
House$Date <- as.Date(House$Date, format = '%d/%m/%y')
#Paste date and time together and convert to POSIXt
House$DateTime <- strptime(paste(House$Date, House$Time), "%Y-%m-%d %H:%M:%S")
#convert to POSIXct
House$DateTime <- as.POSIXct(House$DateTime)
#create the plot
with(House, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
#create png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()