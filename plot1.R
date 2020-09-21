url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")
library(data.table)
datos <- data.table::fread(input ="household_power_consumption.txt", na.strings="?")
datos1 <- datos[datos$Date %in% c("1/2/2007","2/2/2007") ,]
datos1$Date <- as.Date(datos1$Date, format = "%d/%m/%Y")
datos1$Time <- strptime(datos1$Time, format = "%H:%M:%S")
Global_active_power <- as.numeric(datos1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kW)")
dev.off()