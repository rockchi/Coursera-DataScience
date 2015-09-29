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

#Plotting: mfrow=two-by-two pane
plot.new()
par(mfrow = c(2,2))
par(mar=c(5,4,1,1))
#Plot Global Active Power by Datetime
with(SubPower, plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l"))
#Plot Voltage Use by Datetime
with(SubPower, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l"))
#Plot Energy Sub-Metering 1,2,3 by Datetime
with(SubPower, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(SubPower, lines(DateTime, Sub_metering_2, col="red"))
with(SubPower, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue", cex=0.0005))
#Plot Global Reactive Power by Datetime
with(SubPower, plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l"))

#Save as PNG
dev.copy(png, "plot4.png")
dev.off()
