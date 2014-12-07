mydata<-read.table("~/R2/household_power_consumption.txt",header=T,sep=";",na.strings="?")
mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")
datatrue<-subset(mydata,Date>="2007-02-01"& Date <= "2007-02-02")
rm(mydata)
datetime <- paste(as.Date(datatrue$Date), datatrue$Time)
datatrue$Datetime <- as.POSIXct(datetime)
Sys.setlocale("LC_ALL", "en_US")
with(datatrue, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file="plot3.png")
dev.off()