# Set Working Directory
    setwd("C:/Users/FPirbhai/Documents/Pirbhai/Data Analytics/Coursera/Data Analytics/Exploratory Data Analysis/Week 1/Assignment")


# Load file in R
    EPC <- read.delim("household_power_consumption.txt", sep = ";",stringsAsFactors=FALSE)

# Create a table containing only data pertaining to Feb 1, 2007 and Feb 2, 2007
    EPC_Feb2007 <- EPC[(EPC$Date =="1/2/2007" | EPC$Date =="2/2/2007"),]
    EPC_Feb2007$Date1 <- as.POSIXlt(paste(EPC_Feb2007$Date,EPC_Feb2007$Time),format = "%d/%m/%Y %H:%M:%S")
  
# Convert variable 'Global_active_power' to numeric as required by histogram
    EPC_Feb2007$Global_active_power <- as.numeric(as.character(EPC_Feb2007$Global_active_power))

# Remove NA, if any    
    EPC_Feb2007 <- subset(EPC_Feb2007,!is.na(EPC_Feb2007$Global_active_power))

# Create line plot- showing frequency for Global Active Power between 1/2/2007 and 2/2/2007    
    plot(EPC_Feb2007$Date1,EPC_Feb2007$Global_active_power,type="l", xlab="",ylab="Global Active Power(kilowatts)")    

# Copy the plot to png format
    dev.copy(png,"plot2.png",width = 480, height = 480)
    dev.off()
    

