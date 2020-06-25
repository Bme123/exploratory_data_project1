library(data.table)

png(file="Plot4.png", height=480, width=480)

newdate<-data.table::fread("household_power_consumption.txt")

newdata<-subset(file, as.Date(Date, "%d/%m/%Y")>="2007-02-01" & as.Date(Date, "%d/%m/%Y")<="2007-02-02")
datetime<-paste(as.Date(newdata$Date, "%d/%m/%Y"),newdata$Time)
time<-as.POSIXct(datetime)

GAP<-as.numeric(newdata$Global_active_power)
Volt<-as.numeric(newdata$Voltage)
GRP<-as.numeric(newdata$Global_reactive_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(newdata,{
  plot(GAP~time, type="l", xlab="", ylab="Global Active Power (kilowatt)")
 
  plot(Volt~time, type="l", xlab="datetime", ylab="Voltage")
  
  plot(time, submeter1, type="l", col="black", ylab="energy sub metering", xlab="")
  lines(time, submeter2, col="red")
  lines(time, submeter3, col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(GRP~time, type="l", xlab="datetime", ylab="Global_Reactive_Power" )
  })
dev.off()
