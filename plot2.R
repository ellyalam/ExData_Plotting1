  setwd("d:\\datascience\\exploratorydataanalysis\\assignment1")
  hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";") #hpc stands for Household-Power-Consumption
  rhpc<-subset(hpc,hpc$Date %in% c('1/2/2007','2/2/2007'))#subsetting required hpc
  gap<-as.numeric(as.character(rhpc$Global_active_power)) #converting factor values to numeric value
  rhpc$DateTime<-as.POSIXct(paste(rhpc$Date,rhpc$Time), format="%d/%m/%Y %H:%M:%S")#adding a column that contains a date type value in the date+time format
  dt<-rhpc$DateTime
  plot(dt,gap,xlab="",ylab="Global Active Power (kilowatts)",type='l')
  dev.copy(png,file="plot2.png")
  dev.off()