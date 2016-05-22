### Explorary Graph - Assignment 1
### Create graph 1 and save as plot1.png
### Fendy Huang

###read data after download to local dir
data<-read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
### convert date factor to Date class
data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
### get only date in 2007-02-01 and 2007-02-02
finalData <-subset(data, Date == "2007-02-01" | Date =="2007-02-02")

### create PNG file
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar= c(4, 4, 2, 1))

### plot frequencey and global activity power
with(finalData, hist(Global_active_power, col="red", 
                     xlab="Global Active Power (kilowatts)", main = "Global Active Power", 
                      axes=F))

### fomat X and Y with label
axis(1, at=seq(0,6, by = 2))
axis(2, at=seq(0,1200, by = 200))

### close PNG file
dev.off()

