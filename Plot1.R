library(lubridate)
png(file="Plot1.png")
file<-data.table::fread("household_power_consumption.txt")

newdata<-file[which(dmy(Date)>="2007-02-01" & dmy(Date)<="2007-02-02")]

hist(as.numeric(newdata$Global_active_power), main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.off()