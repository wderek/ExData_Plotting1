# Plot 3
# Line chart - 4 plots together

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

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

#Plot 1
with(dataSubset, plot(Global_active_power~Time, type = "l", ylab = "Global Active Power" ))

#Plot 2
with(dataSubset, plot(Voltage~Time, type = "l", xlab = "datetime"))

#Plot 3
with(dataSubset, plot(Sub_metering_1~Time, type = "l", ylab = "Energy sub metering", col = "black" ))
with(dataSubset, lines(Sub_metering_2~Time, type = "l", col = "red"))
with(dataSubset, lines(Sub_metering_3~Time, type = "l", col = "blue" ))

#Plot 4
with(dataSubset, plot(Global_reactive_power~Time, type = "l", xlab = "datetime"))

dev.off()