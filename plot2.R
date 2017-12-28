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
plot(df$Global_active_power,type = "n",xaxt="n",
     ylab = "Global Active Power (kilowatts)",xlab="")
lines(df$Global_active_power,type = "l",xaxt="n",ann=F)

axis(side=1, at=seq(0,2880, 1440), labels=c("Thu","Fri", "Sat"),tick = T)


# Export to PNG
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()
