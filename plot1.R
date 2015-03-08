data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", check.names=F, stringsAsFactors=F, 
                 comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
dataset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

for(i in 3:9) {
  dataset[,i] <- as.numeric(as.character(dataset[,i]))
}

hist(dataset$Global_active_power, col="red", main = "Global active power", 
     xlab="Global active power (kilowatts)")

dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

remove(dataset,data,i)

