Sys.setlocale("LC_TIME", "en_US.UTF-8")

if (!file.exists('household_power_consumption.txt')){
    download.file('http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='household_power_consumption.zip')
    unzip('household_power_consumption.zip')
}

data <- read.table(file('household_power_consumption.txt'), na.strings = "?", sep= ";", header=TRUE, stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

my_data <- data[data$Date == as.Date('01/02/2007', '%d/%m/%Y') | data$Date == as.Date('02/02/2007', '%d/%m/%Y'),]

# 4
png('plot4.png')
horas <- strptime(paste(my_data$Date, my_data$Time), '%Y-%m-%d %H:%M:%S')
par(mfrow=c(2,2))

# 4.1
plot(horas, my_data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# 4.2
plot(horas, my_data$Voltage, type="l", ylab="Voltage", xlab="datetime")

# 4.3
plot(horas, my_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(horas, my_data$Sub_metering_2, type="l", col="red")
lines(horas, my_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

# 4.4
plot(horas, my_data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()