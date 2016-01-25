archivo <- "household_power_consumption.txt"
datos <- read.table(archivo, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subconjunto <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datostiempo <- strptime(paste(subconjunto$Date, subconjunto$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
poderglobal <- as.numeric(subconjunto$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datostiempo, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datostiempo, subMetering2, type="l", col="red")
lines(datostiempo, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
