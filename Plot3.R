## Load the relevant libraries
library(dplyr)


## Read the data file into a dataframe
df <- read.table("household_power_consumption.txt", header = TRUE, sep=";", quote = "", na.strings = "?", stringsAsFactors = FALSE)


## Combine Date and Time into DateTime and convert to the proper type
DateTime <- paste(df$Date, df$Time)
df$DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
df$DateTime <- as.POSIXct(df$DateTime)


## Filter the dataframe to include only the relevant rows
df <- filter(df, df$DateTime >= "2007-02-01 0:0:0")
df <- filter(df, df$DateTime <= "2007-02-02 23:59:59")


## Produce the PNG
with (df, {  
  ## Plot #3
  png("Plot3.png", 480, 480)
  plot(DateTime, Sub_metering_1, type="l", ylab="Global Active Power", xlab="")
  points(DateTime, Sub_metering_2, type="l", col="red")
  points(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty = 1, col =c("grey", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
})