url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")
library(data.table)
datos <- data.table::fread(input ="household_power_consumption.txt", na.strings="?")
datos1 <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]

fecha <- strptime(paste(datos1$Date, datos1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(datos1$Global_active_power)
sub_Metering_1 <- as.numeric(datos1$Sub_metering_1)
sub_Metering_2 <- as.numeric(datos1$Sub_metering_2)
sub_Metering_3 <- as.numeric(datos1$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(fecha, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(fecha, sub_Metering_2, type="l", col="red")
lines(fecha, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()