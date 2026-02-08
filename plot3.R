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

# Convert columns
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Open PNG
png("plot3.png", width = 480, height = 480)

# First line
plot(datetime,
     data$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

# Add other lines
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

# Add legend
legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()

