hhpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hhpchw<-subset(hhpc, hhpc$Date=="1/2/2007" | hhpc$Date=="2/2/2007")
class(hhpchw$Global_active_power)<-"numeric"
png("plot1.png", width = 480, height = 480)
hist(hhpchw$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
dev.off()