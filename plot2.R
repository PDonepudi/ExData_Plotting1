# Read the Data into R and convert the Date column to be of Date type. 
MasterData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
MasterData <- transform(MasterData, Date = as.Date(Date,"%d/%m/%Y"))
workData <- subset(MasterData, Date == "2007-02-01" | Date == "2007-02-02")
workData <- transform(workData,Global_active_power = as.numeric(as.character(Global_active_power)))
workData <- transform(workData, Time = format(strptime(Time,format = "%X"),format = "%H:%M:%S"))
workData <- transform(workData, Time = as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
with(workData, plot(Time, Global_active_power,type = "l",xlab = "", ylab = "Global Active Power (Kilowatts)"))