setwd("C:/Users/nelson.pedernera/Desktop/BigData/DataScience/MIV/01/CourseProject/GitHub/ExData_Plotting1/")

#----------------------------------------------------------------------------------------------------------------------------------
# Reading the data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Trasforming data
dates <- data$Date
times <- data$Time
x <- paste(dates, times)
data$dateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power)) 
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1)) 
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2)) 
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3)) 
data$Voltage<-as.numeric(as.character(data$Voltage)) 
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power)) 

# Filtering data
finalData<-   subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

# Setting English locale
Sys.setlocale("LC_ALL","English")

# Printing on the file
par(mfrow=c(2,2))
#------------------------------------------------------------------------------------------------------------------------------------------
# 1st Cuadrant
with( finalData, plot(dateTime, Global_active_power, type = "l", ylab="Global Active Power", xlab=""))
#------------------------------------------------------------------------------------------------------------------------------------------
# 2nd Cuadrant
with( finalData, plot(dateTime, Voltage, type = "l", ylab="Voltage", xlab="datetime"))
#------------------------------------------------------------------------------------------------------------------------------------------
# 3rd Cuadrant
with( finalData, plot(dateTime, Sub_metering_1, type = "l", ylab="Energy sub metering", xlab=""))
with( finalData, lines(dateTime, Sub_metering_2, col="red"))
with( finalData, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", pch=c(NA, NA, NA), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), bty = "n")
#------------------------------------------------------------------------------------------------------------------------------------------
# 4th Cuadrant
with( finalData, plot(dateTime, Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime"))
dev.copy(png,'plot4.png')
dev.off()