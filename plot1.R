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

png("plot1.png", width = 480, height = 480)

with(data, hist(Global_active_power,
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power",
                col = "red"))
dev.off()
