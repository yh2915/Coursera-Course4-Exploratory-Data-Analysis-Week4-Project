hhpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hhpchw<-subset(hhpc, hhpc$Date=="1/2/2007" | hhpc$Date=="2/2/2007")
class(hhpchw$Global_active_power)<-"numeric"

hhpchw$Date<- strptime(hhpchw$Date, format="%d/%m/%Y", tz="GMT")
hhpchw$Date<- as.Date(hhpchw$Date)

hhpchw$DateTime<-as.POSIXct(paste(hhpchw$Date, hhpchw$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(hhpchw$Global_active_power~hhpchw$DateTime, type = "l", xaxt="n", ylab = "Global Active Power(kilowatts)", xlab="")
axis.POSIXct(1, at=seq(min(hhpchw$DateTime), max(hhpchw$DateTime)+60,by="24 hours"), format="%a", labels = TRUE)
dev.off()