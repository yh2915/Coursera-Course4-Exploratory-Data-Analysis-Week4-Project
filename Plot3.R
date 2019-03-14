hhpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
hhpchw<-subset(hhpc, hhpc$Date=="1/2/2007" | hhpc$Date=="2/2/2007")
class(hhpchw$Global_active_power)<-"numeric"

hhpchw$Date<- strptime(hhpchw$Date, format="%d/%m/%Y", tz="GMT")
hhpchw$Date<- as.Date(hhpchw$Date)

hhpchw$DateTime<-as.POSIXct(paste(hhpchw$Date, hhpchw$Time), format="%Y-%m-%d %H:%M:%S")

class(hhpchw$Sub_metering_1)<-"numeric"
class(hhpchw$Sub_metering_2)<-"numeric"
class(hhpchw$Sub_metering_3)<-"numeric"

png("plot3.png", width = 480, height = 480)
plot(hhpchw$Sub_metering_1~hhpchw$DateTime, type = "n", xaxt="n", ylab = "Energy sub metering", xlab="")
lines(hhpchw$DateTime,hhpchw$Sub_metering_1, col="BLACK")
lines(hhpchw$DateTime,hhpchw$Sub_metering_2, col="RED")
lines(hhpchw$DateTime,hhpchw$Sub_metering_3, col="BLUE")
legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("BLACK","RED","BLUE"), lwd=2)
axis.POSIXct(1, at=seq(min(hhpchw$DateTime), max(hhpchw$DateTime)+60,by="24 hours"), format="%a", labels = TRUE)
dev.off()