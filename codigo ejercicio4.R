archivo <- "household_power_consumption.txt"
datos <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subconjunto<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datostiempo <- strptime(paste(subconjunto$Date, subconjunto$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
poderglobal <- as.numeric(subconjunto$Global_active_power)
poderglobalreactivado <- as.numeric(subconjunto$Global_reactive_power)
voltage <- as.numeric(subconjunto$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datostiempo, poderglobal, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datostiempo, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datostiempo, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datostiempo, subMetering2, type="l", col="red")
lines(datostiempo, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datostiempo, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
