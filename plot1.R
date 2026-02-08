# Read the data
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Keep only Feb 1 and Feb 2, 2007
data <- data[data$Date == "2007-02-01" |
             data$Date == "2007-02-02", ]

# Convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Open PNG file
png("plot1.png", width = 480, height = 480)

# Make histogram
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close PNG
dev.off()

