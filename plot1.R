setwd("C:/Users/nelson.pedernera/Desktop/BigData/DataScience/MIV/01/CourseProject/GitHub/ExData_Plotting1/")

#----------------------------------------------------------------------------------------------------------------------------------
# Reading the data
data <- read.csv("household_power_consumption.txt", sep = ";")

# Trasforming data
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power)) 

# Filtering data
finalData<-   subset(data, Date == "2007-02-01" | Date == "2007-02-02" )

# Printing on the file
hist(as.numeric(finalData$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power" )
dev.copy(png,'plot1.png')
dev.off()