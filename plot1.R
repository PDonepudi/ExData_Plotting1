# Read the Data into R and convert the Date column to be of Date type. 
MasterData <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";")
MasterData <- transform(MasterData, Date = as.Date(Date,"%d/%m/%Y"))
workData <- subset(MasterData, Date == "2007-02-01" | Date == "2007-02-02")
workData <- transform(workData,Global_active_power = as.numeric(as.character(Global_active_power)))
hist(workData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(Kilowatts)",ylab = "Frequency")