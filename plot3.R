# Set character classes for variables
classes = c("character", "character", "numeric", "numeric", "numeric",
            "numeric", "numeric", "numeric", "numeric")

# read in the data
powerConsumption <- read.table("household_power_consumption.txt",
                               sep = ";",
                               header = T,
                               na.strings = "?",
                               colClasses = classes)

# convert date/time strings to data/time objects
powerConsumption$DateTime = paste(powerConsumption$Date,
                                  powerConsumption$Time,
                                  sep = " ")

powerConsumption$DateTime = as.POSIXct(powerConsumption$DateTime,
                                       format = "%d/%m/%Y %H:%M:%S")

# filter for dates
data <- subset(powerConsumption,
               powerConsumption$Date %in% c("1/2/2007", "2/2/2007"))

png("plot3.png", width = 480, height = 480)

with(data, plot(x = DateTime,
                y = Sub_metering_1,
                type = "l",
                col = "black",
                xlab = "",
                ylab = "Energy sub metering"))
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",
       lty = c(1,1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
