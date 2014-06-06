epcdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", nrow = 2075259,  sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric", "numeric"))

epcdata <- transform(epcdata, Date =as.Date(Date, "%d/%m/%Y"))

subepcdata <- subset(epcdata, (Date == "2007-02-01")| (Date ==  "2007-02-02") )

dttimestr <- paste(subepcdata$Date, subepcdata$Time)
dttime <- strptime(dttimestr, "%Y-%m-%d %H:%M:%S")


png(file="plot2.png", width = 480, height = 480)
plot(Global_active_power~as.POSIXct.POSIXlt((dttime)), data=subepcdata, type="l", col="black", ylab = "Global Active Power(kilowatts)", xlab = "")


dev.off()