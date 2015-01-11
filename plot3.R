## Reading data
rm(Electric_power)
rm (Electric_power_data )
Electric_power <- read.table("household_power_consumption.txt",   stringsAsFactors = FALSE,
                            header = TRUE, comment.char="", quote='\"',
                            sep = ';', na.strings = "?", check.names = FALSE)
## Subseting only "2007-02-01" and "2007-02-02"
Electric_power_data <- subset(Electric_power, subset = (as.Date(Electric_power$Date , "%m/%d/%Y") >= "2007-02-01" & (as.Date(Electric_power$Date , "%m/%d/%Y") <= "2007-02-02") ))

## Creating Date_Time data
## Date_Time <- paste(as.Date(Electric_power_data$Date), Electric_power_data$Time)
## Assinging Date_Time data as a new column in Electric_power_data

Electric_power_data$Datetime <- strptime(paste(Electric_power_data$Date, Electric_power_data$Time), "%d/%m/%Y %H:%M:%S")
head(Electric_power_data)

for(i in c(3:9)) {Electric_power_data[,i] <- as.numeric(as.character(Electric_power_data[,i]))}

## Histogram genration for plot 1

plot(Electric_power_data$Datetime, Electric_power_data$Global_active_power  , type="l", xlab="", ylab="Global Active Power (kilowatts)")

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")

par(mar = c(6, 6, 5, 4))


plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))

plot(Electric_power_data$Datetime, Electric_power_data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(Electric_power_data$Datetime, Electric_power_data$Global_active_power, type="S")
hist(Electric_power_data$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "Red",
     main = "Global Active Power"  ,
     ylim = c(0,1200),
      xlim = c(0,6),
     xaxp = c(0, 6, 3),
     breaks = 13)
## creating plot1.png with dev.copy function
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

