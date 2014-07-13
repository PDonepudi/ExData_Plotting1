# Read the Data into R and convert the Date column to be of Date type. 
MasterData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
MasterData <- transform(MasterData, Date = as.Date(Date,"%d/%m/%Y"))
workData <- subset(MasterData, Date == "2007-02-01" | Date == "2007-02-02")
workData <- transform(workData,Global_active_power = as.numeric(as.character(Global_active_power)))
workData <- transform(workData,Global_reactive_power = as.numeric(as.character(Global_reactive_power)))
workData <- transform(workData, Time = format(strptime(Time,format = "%X"),format = "%H:%M:%S"))
workData <- transform(workData, Time = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
workData <- transform(workData,Sub_metering_1 = as.numeric(as.character(Sub_metering_1)))
workData <- transform(workData,Sub_metering_2 = as.numeric(as.character(Sub_metering_2)))
par(mfrow=c(2,2))

# Top Left Plot
with(workData, plot(Time, Global_active_power,type = "l",xlab = "", ylab = "Global Active Power"))

#Top Right Plot 
with(workData, plot(Time, Voltage,type = "l",xlab = "datetime", ylab = "Voltage"))

# Bottom Left Plot 

with(workData, plot(Time, Sub_metering_1,type = "l",col = "black",xlab = "", ylab = "Energy sub metering"))
with(workData, lines(Time, Sub_metering_2,type = "l",col = "red"))
with(workData, lines(Time, Sub_metering_3,type = "l",col = "blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",lwd=c(1,1,1), col = c("black","red","blue"))

# Bottom Right Plot 
with(workData, plot(Time, Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global_reactive_power"))


