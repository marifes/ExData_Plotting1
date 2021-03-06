library (datasets)
energy_table <- fread("household_power_consumption.txt")

## Subset of 2 days in February
energy_table$Date <- as.Date(energy_table$Date, format="%d / %m / %Y")
energy_table_february <- energy_table[energy_table$Date == "2007-02-01" | energy_table$Date == "2007-02-02"]

## Add Date and Time
datetime <- strptime(paste (energy_table_february$Date, energy_table_february$Time), format = "%Y-%m-%d %H:%M:%S")

## Convert to numeric Sub-metering 1 & 2
energy_table_february$Sub_metering_1 <- as.numeric(energy_table_february$Sub_metering_1)
energy_table_february$Sub_metering_2 <- as.numeric(energy_table_february$Sub_metering_2)

## Make drawing
png (filename="Plot3.png", width = 480, height = 480)
plot (datetime, energy_table_february$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines (datetime, energy_table_february$Sub_metering_2, type = "l", col="red")
lines (datetime, energy_table_february$Sub_metering_3, type = "l", col="blue")

##Make Legend
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), pch = "___", pt.cex = .8, pt.lwd = 2)

dev.off()