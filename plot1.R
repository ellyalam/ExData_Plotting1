setwd("d:\\datascience\\exploratorydataanalysis\\assignment1")
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";") #hpc stands for Household-Power-Consumption
rhpc<-subset(hpc,hpc$Date %in% c('1/2/2007','2/2/2007'))#subsetting required hpc
gap<-as.numeric(as.character(rhpc$Global_active_power)) #converting factor values to numeric value
hist(gap,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col='red',ylim=c(0,1300),cex.axis=0.75)
dev.copy(png,file="plot1.png")
dev.off()
