data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", check.names=F, stringsAsFactors=F)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]
dataset$Time <- as.character(dataset$Time)
time <- paste(dataset$Date, dataset$Time)
dataset$Time <- as.POSIXct(time)

for(i in 3:9) {
  dataset[,i] <- as.numeric(as.character(dataset[,i]))
}

par(mfrow = c(2,2))
par(mar = c(4,4,2,2))
with(dataset, {
          plot(Time,Global_active_power,type="l",xlab="",
               ylab="Global active power (kilowatts)")
          plot(Time,Voltage,type="l",xlab="datetime",
               ylab="Voltage")
          plot(Time,Sub_metering_1,type="l",col="black", xlab = "",
               ylab = "Energy sub metering")
          lines(Time,Sub_metering_2,type="l",col="red")
          lines(Time,Sub_metering_3,type="l",col="blue")          
          legend("topright",col= c("black","red","blue"), lwd=1, cex = 0.4, bty="n",
                 legend = c("Sub metering 1", "Sub metering 2","Sub metering 3")) 
          plot(Time,Global_reactive_power,type="l",xlab="datetime",
               ylab="Global reactive power")         
    })


dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

remove(dataset,data,i,time)