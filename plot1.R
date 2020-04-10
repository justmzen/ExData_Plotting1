## Author: justmzen

## Description: code for creating 'plot1.png'

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
png(filename = 'plot1.png')

hist(house$Global_active_power, xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power', col = 'red')

dev.off()