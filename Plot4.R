library (datasets)
energy_table <- fread("household_power_consumption.txt")

## Preparing data

## Subset of 2 days in February
energy_table$Date <- as.Date(energy_table$Date, format="%d / %m / %Y")
energy_table_february <- energy_table[energy_table$Date == "2007-02-01" | energy_table$Date == "2007-02-02"]
## Add Date and Time
datetime <- strptime(paste (energy_table_february$Date, energy_table_february$Time), format = "%Y-%m-%d %H:%M:%S")
## Convert to numeric Sub-metering 1 & 2, Global active power
energy_table_february$Sub_metering_1 <- as.numeric(energy_table_february$Sub_metering_1)
energy_table_february$Sub_metering_2 <- as.numeric(energy_table_february$Sub_metering_2)
energy_table_february$Global_active_power <- as.numeric(energy_table_february$Global_active_power)

png (filename="Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot (datetime, energy_table_february$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
##Make drawing #2
plot (datetime, energy_table_february$Voltage, type="l", ylab="Voltage")
## Make drawing #3
plot (datetime, energy_table_february$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines (datetime, energy_table_february$Sub_metering_2, type = "l", col="red")
lines (datetime, energy_table_february$Sub_metering_3, type = "l", col="blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), pch = "___")
#Make drawing #4
plot (datetime, energy_table_february$Global_reactive_power, type="l", ylab="Global_reactive_power")

#with (energy_table_february, {
  ##Make drawing #1
#  plot (datetime, energy_table_february$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  ##Make drawing #2
#  plot (datetime, energy_table_february$Voltage, type="l", ylab="Voltage")
  ## Make drawing #3
#  plot (datetime, energy_table_february$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
#  lines (datetime, energy_table_february$Sub_metering_2, type = "l", col="red")
#  lines (datetime, energy_table_february$Sub_metering_3, type = "l", col="blue")
#  #legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), pch = "___")
  #Make drawing #4
#  plot (datetime, energy_table_february$Global_reactive_power, type="l", ylab="Global_reactive_power")
#})

dev.off()