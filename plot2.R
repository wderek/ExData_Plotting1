# Plot 2
# Line chart - Global Active Power vs time

# Download data

fileName <- "household_power_consumption.txt"

if (!file.exists(fileName)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, paste(getwd(), "household_power_consumption.zip", sep="/"))
    unzip("household_power_consumption.zip")
}

# Filter data

dataPower <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dataPower$Time <- as.POSIXct(paste(dataPower$Date, dataPower$Time), format="%d/%m/%Y %H:%M:%S")
dataPower$Date <- as.Date(dataPower$Date, "%d/%m/%Y")
dataSubset <- subset(dataPower, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plotting

png("plot2.png", width = 480, height = 480)

with(dataSubset, plot(Global_active_power~Time, type = "l", ylab = "Global Active Power (kilowatts)" ))

dev.off()