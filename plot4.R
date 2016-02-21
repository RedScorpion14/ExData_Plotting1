# Set Working Directory
    setwd("C:/Users/FPirbhai/Documents/Pirbhai/Data Analytics/Coursera/Data Analytics/Exploratory Data Analysis/Week 1/Assignment")


# Load file in R
    EPC <- read.delim("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE)

# Create a table containing only data pertaining to Feb 1, 2007 and Feb 2, 2007
    EPC_Feb2007 <- EPC[(EPC$Date =="1/2/2007" | EPC$Date =="2/2/2007"),]
    EPC_Feb2007$Date1 <- as.POSIXlt(paste(EPC_Feb2007$Date,EPC_Feb2007$Time),format = "%d/%m/%Y %H:%M:%S")
  

# Create a window pane 2 by 2 
    par(mfrow=c(2,2),oma=c(1.5,2,1,1),mar=c(4,4,0.5,0.5))
    
#Row 1, Column 1 = Global Active Power by Date
    EPC_Feb2007$Global_active_power <- as.numeric(as.character(EPC_Feb2007$Global_active_power))
    plot(EPC_Feb2007$Date1,EPC_Feb2007$Global_active_power,type="l", xlab="",ylab="Global Active Power")    

#Row 1, Column =2 => Voltage Consumption between 1/2/07 and 2/2/07
    EPC_Feb2007$Voltage <- as.numeric(EPC_Feb2007$Voltage) 
    plot(EPC_Feb2007$Date1,EPC_Feb2007$Voltage,type="l", xlab="datetime",ylab="Voltage")    
    
#Row 2, column 1 => Energy Submetering     
    plot (EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering") #Create a new empty plot and inserting y-axis label
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_1,type="l") # Add line for metering 1
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_2,type="l",col="red") # Add line for metering 2
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_3,type="l",col="blue") # # Add line for metering 3
    legend("topright",lty=rep(1,3), col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust = 1,yjust=0,text.font = 0.75, seg.len = 1) # Creating Legend
    
#Row 2, Column 2 => Global Reactive Power
    EPC_Feb2007$Global_reactive_power <- as.numeric(EPC_Feb2007$Global_reactive_power)
    plot(EPC_Feb2007$Date1,EPC_Feb2007$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")    
        
# Copy the plot to png format
    dev.copy(png,"plot4.png",width = 480, height = 480)
    dev.off()

    