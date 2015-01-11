plot4 <- function(){
        
        
        Sys.setlocale(category = "LC_TIME", locale = "C")
        
        uselist <- c("1/2/2007", "2/2/2007")
        
        imp_data <- read.csv("household_power_consumption.txt"
                             , sep = ";", header = TRUE , colClasses = "character")
        use_data <- imp_data[imp_data$Date %in% uselist, ]

        use_data$DateTime <- as.POSIXct(paste(use_data$Date,use_data$Time), format="%d/%m/%Y %H:%M:%S") # Date
        use_data$Global_active_power <- as.numeric(use_data$Global_active_power) # Global_active_power
        use_data$Voltage <- as.numeric(use_data$Voltage) #Voltage
        use_data$Global_reactive_power <- as.numeric(use_data$Global_reactive_power) #Global_reactive_power
        
        png(file="plot4.png", bg="transparent" , width = 480, height = 480, units = "px")
        
        par(mfrow = c(2, 2))
        with(use_data, {
                #plot1
                plot(  x = use_data$DateTime, y = use_data$Global_active_power
                       , ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
                
                #plot2
                plot(  x = use_data$DateTime, y = use_data$Voltage
                       , ylab = "Voltage", xlab = "datetime", type = "l")
                
                #plot3----------------------------------------------------------------------------
                plot(  x = use_data$DateTime, y = use_data$Sub_metering_1
                       , ylab = "Energy sub metering", xlab = "", type = "l")
                
                #Sub_metering_2
                lines(x = use_data$DateTime, y = use_data$Sub_metering_2, col = "red")
                
                #Sub_metering_3
                lines(x = use_data$DateTime, y = use_data$Sub_metering_3, col = "blue")
                
                legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
                       ,col = c("black", "red", "blue"), bty="n", lty = 1, cex = 0.9)
                #---------------------------------------------------------------------------------
                
                #plot4
                plot (x = use_data$DateTime, y = use_data$Global_reactive_power
                      , ylab = "Global_reactive_power", xlab = "datetime", type = "l")
        })
       
        #dev.copy(png, file = "plot4.png", bg = "transparent", width = 480,height = 480) 
        
        dev.off()
}        