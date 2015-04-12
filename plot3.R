## Exploratory Data Analysis

# prepare the data
setwd("C:/Users/John/Documents/R/data science course")
elec <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
elec <- subset(elec, elec$Date == "1/2/2007" | elec$Date == "2/2/2007") # get subset of interest

# format each variable appropriately for the graphic analysis
elec$Date <- as.character(elec$Date)
elec$Time <- as.character(elec$Time)
elec$Sub_metering_2 <- as.numeric(elec$Sub_metering_2)
elec$Sub_metering_1 <- as.numeric(elec$Sub_metering_1)
elec$Global_intensity <- as.numeric(elec$Global_intensity)
elec$Voltage <- as.numeric(elec$Voltage)
elec$Global_reactive_power <- as.numeric(elec$Global_reactive_power)
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))
str(elec) # all variables in numeric class bar first two which are date and time

# combine date and time columns
DateTime <- paste(elec$Date, elec$Time)
DateTime <- strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz="")
elec$DateTime <- DateTime

# set directory to save the plots
setwd("C:/Users/John/Documents/R/data science course/plots")

# Plot 3
png(filename="plot3.png", width=480, height=480)
with(elec, plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(elec, points(DateTime, Sub_metering_1, type="l", col="black"))
with(elec, points(DateTime, Sub_metering_2, type="l", col="red"))
with(elec, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd="1", col=c("black","red","blue"))
dev.off()