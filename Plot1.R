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
  ## Plot #1
  png("Plot1.png", 480, 480)
  hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
})