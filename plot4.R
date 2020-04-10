## Author: justmzen

## Description: code for creating 'plot4.png'

## Download data
if(!file.exists('household_power_consumption.txt')){
   fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
   download.file(fileUrl, destfile = 'data.zip')
   unzip(zipfile = 'data.zip')
   rm(fileUrl)
}

## Libraries calling
library('data.table')

## Reading and filtering data
house <- fread(file = 'household_power_consumption.txt', na.strings = '?')
house$Date <- as.Date(house$Date, format = '%d/%m/%Y')
house <- house[Date %in% c(as.Date('2007-02-01', format = '%Y-%m-%d'), 
                           as.Date('2007-02-02', format = '%Y-%m-%d'))]

## Plot building
png(filename = 'plot4.png')

par(mfrow = c(2,2))

# 1,1
plot(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
     house$Global_active_power, type = 'l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')

# 1,2
plot(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
     house$Voltage, type = 'l',
     xlab = 'datetime', ylab = 'voltage')

# 2,1
plot(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
     house$Sub_metering_1, type = 'l',
     xlab = '', ylab = 'Energy sub metering')

lines(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
      house$Sub_metering_2, type = 'l', col = 'red')

lines(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
      house$Sub_metering_3, type = 'l', col = 'blue')

legend('topright', legend=c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'),
       col=c('black', 'red', 'blue'), lty = 1)

# 2,2
plot(as.POSIXct(paste(house$Date, house$Time), format="%Y-%m-%d %H:%M:%S"),
     house$Global_reactive_power, type = 'l',
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()