#Read

filename = "household_power_consumption.txt"
df = read.table(filename,sep=";",header = T, na.strings = "?",nrows = 120000)

#Format
df$Date = as.Date(df$Date,format="%d/%m/%Y")
df$Time = as.POSIXct(df$Time,format="%H:%M:%S")

#Filter
startdate = as.Date("2007/02/01",format = "%Y/%m/%d")
enddate = startdate+1
df = subset(df,df$Date>=startdate&df$Date<=enddate)


# Create Plot
par(bg = "lightgrey")
plot(df$Global_active_power,type = "n",yaxt="n",xaxt="n",
     ylab = "Energy sub metering",ylim = c(0,40),xlab="")
lines(df$Sub_metering_1,type = "l",col="black")
lines(df$Sub_metering_2,type = "l",col="red")
lines(df$Sub_metering_3,type = "l",col="blue")

axis(side=1, at=seq(0,2880, 1440), labels=c("Thu","Fri", "Sat"),tick = T)
axis(side=2, at=seq(0,30, 10), labels=seq(0,30, 10),tick = T)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty = c(1,1),pt.cex = 1.5)


# Export to PNG
dev.copy(png,'plot3.png',width=480,height=480)
dev.off()
