setwd("d:\\datascience\\exploratorydataanalysis\\assignment1")
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";") #hpc stands for Household-Power-Consumption
rhpc<-subset(hpc,hpc$Date %in% c('1/2/2007','2/2/2007'))#subsetting required hpc
par(mfcol=c(2,2))
gap<-as.numeric(as.character(rhpc$Global_active_power)) #converting factor values to numeric value
rhpc$DateTime<-as.POSIXct(paste(rhpc$Date,rhpc$Time), format="%d/%m/%Y %H:%M:%S")#adding a column that contains a date type value in the date+time format
dt<-rhpc$DateTime
sm1<-as.numeric(as.character(rhpc$Sub_metering_1)) #converting factor values to numeric value
sm2<-as.numeric(as.character(rhpc$Sub_metering_2))
sm3<-as.numeric(as.character(rhpc$Sub_metering_3))
plot(dt,gap,xlab="",ylab="Global Active Power (kilowatts)",type='l')
plot(dt,sm1,xlab="",ylab="Energy sub metering",type='l')
lines(dt,sm2,col='red')
lines(dt,sm3,col="blue")
legend("topright",cex=0.6,lty=c(1,1,1),col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
volt<-as.numeric(as.character(rhpc$Voltage))
plot(dt,volt,xlab="datetime",ylab="Voltage",type='l')
grp<-as.numeric(as.character(rhpc$Global_reactive_power))
plot(dt,grp,xlab="datetime",ylab="Global_Reactive_Power",type='l')
dev.copy(png,file="plot4.png")
dev.off()