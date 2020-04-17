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

# Second plot

png("plot2.png", width=480, height=480)

with(consump, plot(Datetime, Global_active_power,type="l", ylab="global activity power(Killwatts)")) 


dev.off()