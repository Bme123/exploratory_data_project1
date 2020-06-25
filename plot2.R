library(data.table)

png(file="Plot2.png", height=480, width=480)

data<-data.table::fread("household_power_consumption.txt")
selectdata<-subset(data, as.Date(Date,"%d/%m/%Y")>="2007-02-01" & as.Date(Date,"%d/%m/%Y")<="2007-02-02" )
datetime<-paste(as.Date(selectdata$Date,"%d/%m/%Y"), selectdata$Time)
dt<-as.POSIXct(datetime)
plot(dt, selectdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
