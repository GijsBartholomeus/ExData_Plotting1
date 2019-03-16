#Load Data.txt as table
FullHouse <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Subset correct dates from full table
House <- subset(FullHouse, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date Column to class ='Date'
House$Date <- as.Date(House$Date, format = '%d/%m/%y')
#Create Histogram
hist(House$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
#Save as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
#close action
dev.off()