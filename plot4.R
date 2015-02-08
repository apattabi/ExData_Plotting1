electrical_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
electrical_data$Date<-as.Date(electrical_data$Date,"%d/%m/%Y")
data<-subset(electrical_data,Date>='2007-02-01' & Date<='2007-02-02')
data$Date<-as.character(data$Date)
data$Date_Time<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)


data$Sub_metering_1<-as.character(data$Sub_metering_1)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.character(data$Sub_metering_2)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.character(data$Sub_metering_3)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

data$Voltage<-as.character(data$Voltage)
data$Voltage<-as.numeric(data$Voltage)

data$Global_reactive_power<-as.character(data$Global_reactive_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)

par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
par(cex=0.5)

with(data,plot(Date_Time,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(data,plot(Date_Time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(data, {
 plot(Date_Time,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
 points(Date_Time,Sub_metering_1,type="l")
 points(Date_Time,Sub_metering_2,type="l",col="red")
 points(Date_Time,Sub_metering_3,type="l",col="blue")
 legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
 })
with(data,plot(Date_Time,Global_reactive_power,type="l",xlab="datetime"))

dev.copy(png,"plot4.png")
dev.off()
