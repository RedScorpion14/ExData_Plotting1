# Set Working Directory
    setwd("C:/Users/FPirbhai/Documents/Pirbhai/Data Analytics/Coursera/Data Analytics/Exploratory Data Analysis/Week 1/Assignment")


# Load file in R
    EPC <- read.delim("household_power_consumption.txt", sep = ";")

# Format Date  
    EPC$Date <- as.Date(EPC$Date, format="%d/%m/%Y")

# Create a table containing only data pertaining to Feb 1, 2007 and Feb 2, 2007
    EPC_Feb2007 <- EPC[EPC$Date >"2007-01-31",]
    EPC_Feb2007 <- EPC_Feb2007[EPC_Feb2007$Date < "2007-02-03",]

# Convert variable 'Global_active_power' to numeric as required by histogram
    EPC_Feb2007$Global_active_power <- as.numeric(as.character(EPC_Feb2007$Global_active_power))

# Remove NA, if any    
    EPC_Feb2007 <- subset(EPC_Feb2007,!is.na(EPC_Feb2007$Global_active_power))

# Create histogram - showing frequency for Global Active Power on 1/2/2007 and 2/2/2007    
    hist(as.numeric(as.character(EPC_Feb2007$Global_active_power)), col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

# Copy the plot to png format
    dev.copy(png,"plot1.png",width = 480, height = 480)
    dev.off()
      
