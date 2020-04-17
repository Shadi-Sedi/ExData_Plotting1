## Read the data


power_consm<-read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                        na.strings = "?" )
## naming the Col
colnames(power_consm)<- c("Date","Time","Global_active_power","Global_reactive_power",
                          "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Subseting the data
consump<- subset(power_consm,Date %in% c("1/2/2007","2/2/2007" ))


# change the formats of the date and hour
x<-paste(consump$Date,consump$Time)
consump$Datetime<-strptime(x, "%d/%m/%Y %H:%M:%S")
consump$Date<-as.Date(consump$Date, format="%d/%m/%Y")


#Forth plot
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
##1
with(consump, plot(Datetime, Global_active_power,type="l", ylab="global activity power(Killwatts)",xlab = "")) 

##2
with(consump, plot(Datetime, Voltage ,type="l", ylab="Voltage ")) 

##3
plot(consump$Datetime,consump$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(consump$Datetime, consump$Sub_metering_2, col="red")
lines(consump$Datetime, consump$Sub_metering_3, col="blue")

legend("topright",lty=1 ,col= c("black","red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

##4

with(consump, plot(Datetime,Global_reactive_power, type="l"))



dev.off()