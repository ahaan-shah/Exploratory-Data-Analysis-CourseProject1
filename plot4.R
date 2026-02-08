# Read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Keep Feb 1 and Feb 2
data <- data[data$Date == "2007-02-01" |
             data$Date == "2007-02-02", ]

# Create datetime
datetime <- as.POSIXct(paste(data$Date, data$Time),
                       format = "%Y-%m-%d %H:%M:%S")

# Convert needed columns to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

# Open PNG
png("plot4.png", width = 480, height = 480)

# Make 2x2 layout
par(mfrow = c(2, 2))

# Plot 1
plot(datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Plot 2
plot(datetime,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot 3
plot(datetime,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Plot 4
plot(datetime,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Close PNG
dev.off()
