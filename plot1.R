if (!file.exists('household_power_consumption.txt')){
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='household_power_consumption.zip')
    unzip('household_power_consumption.zip')
}

data <- read.table(file('household_power_consumption.txt'), na.strings = "?", sep= ";", header=TRUE, stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, '%d/%m/%Y')

my_data <- data[data$Date == as.Date('01/02/2007', '%d/%m/%Y') | data$Date == as.Date('02/02/2007', '%d/%m/%Y'),]

# 1
png('plot1.png')
hist(my_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()