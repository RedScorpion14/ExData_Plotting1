# Set Working Directory
    setwd("C:/Users/FPirbhai/Documents/Pirbhai/Data Analytics/Coursera/Data Analytics/Exploratory Data Analysis/Week 1/Assignment")


# Load file in R
    EPC <- read.delim("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE)

# Create a table containing only data pertaining to Feb 1, 2007 and Feb 2, 2007
    EPC_Feb2007 <- EPC[(EPC$Date =="1/2/2007" | EPC$Date =="2/2/2007"),]
    EPC_Feb2007$Date1 <- as.POSIXlt(paste(EPC_Feb2007$Date,EPC_Feb2007$Time),format = "%d/%m/%Y %H:%M:%S")
  

# Create line plot- showing frequency for Global Active Power between 1/2/2007 and 2/2/2007    
    plot (EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering") #Create a new empty plot and inserting y-axis label
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_1,type="l") # Add line for metering 1
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_2,type="l",col="red") # Add line for metering 2
    points(EPC_Feb2007$Date1,EPC_Feb2007$Sub_metering_3,type="l",col="blue") # # Add line for metering 3
    legend("topright",lty=rep(1,3), col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust = 1,text.font = 1, seg.len = 1) # Creating Legend
    
# Copy the plot to png format
    dev.copy(png,"plot3.png",width = 480, height = 480)
    dev.off()
    