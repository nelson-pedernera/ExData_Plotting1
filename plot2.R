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

# Filtering data
finalData<-   subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

# Setting English locale
Sys.setlocale("LC_ALL","English")

# Printing on the file
with( finalData, plot(dateTime, Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png,'plot2.png')
dev.off()