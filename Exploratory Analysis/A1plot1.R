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

#Plotting Histogram: break=12
png("plot1.png", width=879, height=704)
hist(SubPower$Global_active_power, breaks= 12, col ="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()