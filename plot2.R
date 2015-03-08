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

with(dataset, plot(Time,Global_active_power,type="l",xlab="",
                   ylab="Global active power (kilowatts)"))

dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()

remove(dataset,data,i,time)