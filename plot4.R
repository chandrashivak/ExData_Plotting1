epcdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", nrow = 2075259,  sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric", "numeric"))

epcdata <- transform(epcdata, Date =as.Date(Date, "%d/%m/%Y"))

subepcdata <- subset(epcdata, (Date == "2007-02-01")| (Date ==  "2007-02-02") )

dttimestr <- paste(subepcdata$Date, subepcdata$Time)
dttime <- strptime(dttimestr, "%Y-%m-%d %H:%M:%S")


png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(Global_active_power~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="black", ylab = "Global Active Power", xlab = "")
plot(Voltage~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="black", ylab = "Voltage", xlab = "datetime")
plot(Sub_metering_1~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="black", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="red", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_3~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="blue", ylab = "Energy sub metering", xlab = "")
legend("topright", col= c("Black", "red", "Blue"),border= "white", bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))

plot(Global_reactive_power~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="black",  xlab = "datetime")




dev.off()