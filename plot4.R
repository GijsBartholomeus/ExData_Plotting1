#Load Data.txt as table
FullHouse <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#Subset correct dates from full table
House <- subset(FullHouse, Date %in% c("1/2/2007","2/2/2007"))
#Convert Date Column to class ='Date'
House$Date <- as.Date(House$Date, format = '%d/%m/%y')
#Paste date and time together and convert to POSIXt
House$DateTime <- strptime(paste(House$Date, House$Time), "%Y-%m-%d %H:%M:%S")
#convert to POSIXct
House$DateTime <- as.POSIXct(House$DateTime)
#set up parameters for plot
par(mfrow= c(2,2))

#PLOT1
#create histogram
with(House, plot(Global_active_power ~ DateTime, type = "l", ylab = "", xlab = ""))

#PLOT2
#create plot Volage to DateTime
with(House, plot(Voltage~DateTime, type = "l", ylab = "Voltage", xlab = "datetime"))

#PLOT3
#create the plot and first black line
with(House, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
#add other two lines ines
with(House, lines(Sub_metering_2~DateTime,col='Red'))
with(House, lines(Sub_metering_3~DateTime,col='Blue'))
#create legend
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

#PLOT4
with(House, plot(Global_reactive_power~DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))


#create png
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()