mydata<-read.table("~/R2/household_power_consumption.txt",header=T,sep=";",na.strings="?")
mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")
datatrue<-subset(mydata,Date>="2007-02-01"& Date <= "2007-02-02")
rm(mydata)
datatrue$Date <- strptime(paste(datatrue$Date,datatrue$Time), "%d/%m/%Y %H:%M:%S")
hist(datatrue$Global_active_power,main="Global Active Power",xlab="Global Active Power(kilowatts),"
     ylab="Frequency",col="Red")
dev.copy(png,file="plot1.png")
dev.off()