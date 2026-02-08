# Read data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Keep only Feb 1 and Feb 2, 2007
data <- data[data$Date == "2007-02-01" |
             data$Date == "2007-02-02", ]

# Create datetime column (Date + Time together)
datetime <- as.POSIXct(paste(data$Date, data$Time))

# Convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Open PNG
png("plot2.png", width = 480, height = 480)

# Plot line graph
plot(datetime,
     data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# Close PNG
dev.off()

