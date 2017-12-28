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
hist(df$Global_active_power,col="red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200))
axis(side=2, at=seq(0,1200, 200), labels=seq(0,1200, 200),tick = T)


# Export to PNG
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()
