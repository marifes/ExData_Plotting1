library (datasets)
energy_table <- fread("household_power_consumption.txt")

## Subset of 2 days in February
energy_table$Date <- as.Date(energy_table$Date, format="%d / %m / %Y")
energy_table_february <- energy_table[energy_table$Date == "2007-02-01" | energy_table$Date == "2007-02-02"]

## Add Date and Time
datetime <- strptime(paste (energy_table_february$Date, energy_table_february$Time), format = "%Y-%m-%d %H:%M:%S")

## Convert to numeric Global Active Power
energy_table_february$Global_active_power <- as.numeric(energy_table_february$Global_active_power)

## Make drawing
png (filename="Plot2.png", width = 480, height = 480)
plot (datetime, energy_table_february$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
