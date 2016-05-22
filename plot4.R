### Explorary Graph - Assignment 1
### Create graph 1 and save as plot1.png
### Fendy Huang

####read data after download to local dir
data<-read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
### convert date factor to Date class
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
### get only date in 2007-02-01 and 2007-02-02 and combine DateTime
finalData <-subset(data, Date == "2007-02-01" | Date =="2007-02-02")
finalData$datetime <-as.POSIXct(paste(finalData$Date, finalData$Time), format="%Y-%m-%d %H:%M:%S")

### create PNG file
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfcol=c(2,2))
par(mar= c(4, 4, 2, 1))

### add 1 st graph
plot(finalData$Global_active_power~finalData$datetime, type = "l", xlab = "", ylab="Global Active Power (kilowatts)")


#### add 2nd graph with  with 3 submeter lines and legend
plot(finalData$Sub_metering_1~finalData$datetime, type = "l", xlab = "", ylab="Energy Submetering")
lines(finalData$datetime, finalData$Sub_metering_2,col="red")
lines(finalData$datetime, finalData$Sub_metering_3,col="blue")
legend("topright",  legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1, cex=1)

### add 3rd graph - Voltage
with (finalData, plot(Voltage~datetime, type = "l"))


### add 4th graph - Global Reactive Power
with(finalData, plot(Global_reactive_power~datetime, type = "l"))

### close PNG file
dev.off()

