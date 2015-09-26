#Reading File
Power <- read.table("C:/Users/KaLok/Desktop/R/household_power_consumption.txt", header=TRUE, sep=";")

#Setting Time-Date to proper data class
Power$Date <- as.Date(Power$Date, "%d/%m/%Y")

#Creating DateTime and Time variable
#Unlike DateTime, YY/MM/DD of Time variable is date of script execution
Power$DateTime <- paste(Power$Date, Power$Time, sep=" ")
Power$Time <- strptime(Power$Time, "%T")

#Subsetting dataset down to relevant range between 2007/02/01 and 2007/02/02
SubPower <- subset(Power, Date >= "2007-02-01" & Date <= "2007-02-02")
SubPower$DateTime <- strptime(SubPower$DateTime, "%Y-%m-%d %H:%M:%S")

#Converting data to proper data class
SubPower$Global_active_power <- as.numeric(as.character(SubPower$Global_active_power))
SubPower$Global_reactive_power <- as.numeric(as.character(SubPower$Global_reactive_power))
SubPower$Voltage <- as.numeric(as.character(SubPower$Voltage))
SubPower$Global_intensity <- as.numeric(as.character(SubPower$Global_intensity))
SubPower$Sub_metering_1 <- as.numeric(as.character(SubPower$Sub_metering_1))
SubPower$Sub_metering_2 <- as.numeric(as.character(SubPower$Sub_metering_2))
SubPower$Sub_metering_3 <- as.numeric(as.character(SubPower$Sub_metering_3))

#Plotting each sub-metering consumption by time
with(SubPower, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(SubPower, lines(DateTime, Sub_metering_2, col="red"))
with(SubPower, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue", cex=0.5))
dev.copy(png, "plot3.png")
dev.off()
