## Reading data

Electric_power <- read.table("household_power_consumption.txt",   stringsAsFactors = FALSE,
                            header = TRUE, comment.char="", quote='\"',
                            sep = ';', na.strings = "?", check.names = FALSE)
## Subseting only "2007-02-01" and "2007-02-02"
Electric_power_data <- subset(Electric_power, subset = (as.Date(Electric_power$Date , "%m/%d/%Y") >= "2007-02-01" & (as.Date(Electric_power$Date , "%m/%d/%Y") <= "2007-02-02") ))

## Creating Date_Time data
Date_Time <- paste(as.Date(Electric_power_data$Date), Electric_power_data$Time)
## Assinging Date_Time data as a new column in Electric_power_data
Electric_power_data$DateTime <- as.POSIXct(Date_Time)
## Histogram genration for plot 1
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

