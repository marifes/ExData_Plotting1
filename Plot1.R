library (datasets)
energy_table <- fread("household_power_consumption.txt")
energy_table$Date <- as.Date(energy_table$Date, format="%d / %m / %Y")
energy_table_february <- energy_table[energy_table$Date == "2007-02-01" | energy_table$Date == "2007-02-02"]
energy_table_february$Global_active_power <- as.numeric(energy_table_february$Global_active_power)
png (filename="Plot1.png", width = 480, height = 480)
hist (energy_table_february$Global_active_power , main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col= "red")
dev.off()