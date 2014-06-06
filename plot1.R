epcdata <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", nrow = 2075259,  sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric","numeric", "numeric"))

epcdata <- transform(epcdata, Date =as.Date(Date, "%d/%m/%Y"))

subepcdata <- subset(epcdata, (Date == "2007-02-01")| (Date ==  "2007-02-02") )

png(file="plot1.png", width = 480, height = 480)

hist(subepcdata$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main= "Global Active Power", col="red")
dev.off()