######
# Create plot1.png
######

rm(list=ls())


setwd("C:/Users/EV2/Documents/Statistics/Coursera/04 Exploratory Data Analysis/Week 1/ExData_Plotting1")


#IMPORT DATA
fsite <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fsite,destfile="ElectricPowerConsumption.zip")
unzip(zipfile="ElectricPowerConsumption.zip")
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

dim(epc)
head(epc)
names(epc)

#SUBSET DATA
epc$DateTime <- paste(epc$Date, epc$Time,sep=",")
epc$DateTime <- strptime(epc$DateTime, format = "%d/%m/%Y,%H:%M:%S")
epc$Date <- as.Date(epc$Date,"%d/%m/%Y")
epc <- subset(epc,as.Date(epc$Date,"%d/%m/%Y") == "2007-02-01" | Date == "2007-02-02" )

dim(epc)
unique(epc$Date)
dim(epc)
head(epc)
summary(epc)


#PLOT DATA
png("plot1.png", height=480, width=480)

hist(as.numeric(epc$Global_active_power)
     , col="red"
     , main="Global Active Power"
     , xlab = "Global Active Power (kilowats)"
     
)

dev.off()

