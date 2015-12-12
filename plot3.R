setwd("d:\\datascience\\exploratorydataanalysis\\assignment1")
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";") #hpc stands for Household-Power-Consumption
rhpc<-subset(hpc,hpc$Date %in% c('1/2/2007','2/2/2007'))#subsetting required hpc
sm1<-as.numeric(as.character(rhpc$Sub_metering_1)) #converting factor values to numeric value
sm2<-as.numeric(as.character(rhpc$Sub_metering_2))
sm3<-as.numeric(as.character(rhpc$Sub_metering_3))
rhpc$DateTime<-as.POSIXct(paste(rhpc$Date,rhpc$Time), format="%d/%m/%Y %H:%M:%S")#adding a column that contains a date type value in the date+time format
dt<-rhpc$DateTime
plot(dt,sm1,xlab="",ylab="Energy sub metering",type='l')
lines(dt,sm2,col='red') #adding line to previous plot
lines(dt,sm3,col="blue") 
legend("topright",cex=0.6,lty=c(1,1,1),col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.copy(png,file="plot3.png") #saving plot to a png file
dev.off() #closing png file