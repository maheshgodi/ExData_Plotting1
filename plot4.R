
library(data.table)
Electric_power_data <- fread("household_power_consumption.txt")

## Data Clean 

# Change the format of Date  variable
Electric_power_data$Date <- as.Date(Electric_power_data$Date, format="%d/%m/%Y")

# Subset the data  for "2007-02-01" and "2007-02-02"
Electric_power_data_subset <- Electric_power_data[Electric_power_data$Date=="2007-02-01" | Electric_power_data$Date=="2007-02-02"]

# Convert data subset to a data frame

Electric_power_data_subset <- data.frame(Electric_power_data_subset)

# Convert columns to numeric
for(i in c(3:9)) {Electric_power_data_subset[,i] <- as.numeric(as.character(Electric_power_data_subset[,i]))}

# Create Date_Time variable
Electric_power_data_subset$Date_Time <- paste(Electric_power_data_subset$Date, Electric_power_data_subset$Time)

# Convert Date_Time variable to proper format
Electric_power_data_subset$Date_Time <- strptime(Electric_power_data_subset$Date_Time, format="%Y-%m-%d %H:%M:%S")

# Plot 4


png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2), mar = c(14, 6, 2, 2), cex=.5)
# Plot 2 @ top left
plot(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")
lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Global_active_power, type="S")
# Top right graph
plot(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")
lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Voltage, type="S")
# Plot 3 @ bottom left
plot(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Sub_metering_1, col = "black", type = "S")

lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Sub_metering_3, col = "blue", type = "S")

lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Sub_metering_2, col = "red", type = "S")

legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right graph
plot(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")

lines(Electric_power_data_subset$Date_Time, Electric_power_data_subset$Global_reactive_power, type="S")

dev.off()