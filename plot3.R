plot3 <- function(){
        
        Sys.setlocale(category = "LC_TIME", locale = "C")
        
        uselist <- c("1/2/2007", "2/2/2007")
        
        imp_data <- read.csv("household_power_consumption.txt"
                             , sep = ";", header = TRUE , colClasses = "character")
        use_data <- imp_data[imp_data$Date %in% uselist, ]
        
        use_data$DateTime <- as.POSIXct(paste(use_data$Date,use_data$Time), format="%d/%m/%Y %H:%M:%S") # Date
        use_data$Global_active_power <- as.numeric(use_data$Global_active_power) # Global_active_power
        
        png(file="plot3.png", bg="transparent" , width = 480, height = 480, units = "px")
                
        plot(  x = use_data$DateTime
             , y = use_data$Sub_metering_1
             , ylab = "Energy sub metering"
             , xlab = ""
             , type = "l")
        
        #Sub_metering_2
        lines(x = use_data$DateTime, y = use_data$Sub_metering_2, col = "red")
        
        #Sub_metering_3
        lines(x = use_data$DateTime, y = use_data$Sub_metering_3, col = "blue")
        
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
               ,col = c("black", "red", "blue"), lty = 1)
        
        #dev.copy(png, file = "plot3.png", bg = "transparent", width = 480,height = 480) 
       
        dev.off()
        
}