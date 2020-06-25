
library(data.table)

png(file="plot3.png", height=480, width=480)

file<-data.table::fread("household_power_consumption.txt")

newdata<-subset(file, as.Date(Date, "%d/%m/%Y")>="2007-02-01" & as.Date(Date, "%d/%m/%Y")<="2007-02-02")
datetime<-paste(as.Date(newdata$Date, "%d/%m/%Y"),newdata$Time)
time<-as.POSIXct(datetime)

submeter1<- as.numeric(newdata$Sub_metering_1)
submeter2<-as.numeric(newdata$Sub_metering_2)
submeter3<-as.numeric(newdata$Sub_metering_3)

with(newdata,{
  plot(time, submeter1, type="l", col="black", ylab="energy sub metering", xlab="")
  lines(time, submeter2, col="red")
  lines(time, submeter3, col="blue")
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
