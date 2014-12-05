if (!file.exists('household_power_consumption.txt')){
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='household_power_consumption.zip')
    unzip('household_power_consumption.zip')
}

data <- read.table(file('household_power_consumption.txt'), na.strings = "?", sep= ";", header=TRUE, stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

my_data <- data[data$Date == as.Date('01/02/2007', '%d/%m/%Y') | data$Date == as.Date('02/02/2007', '%d/%m/%Y'),]

# 2
png('plot2.png')
horas <- strptime(paste(my_data$Date, my_data$Time), '%Y-%m-%d %H:%M:%S')
plot(horas, my_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()