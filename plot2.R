plot2 <- function(){
        Sys.setlocale(category = "LC_TIME", locale = "C")
        
        uselist <- c("1/2/2007", "2/2/2007")
        
        imp_data <- read.csv("household_power_consumption.txt"
                             , sep = ";", header = TRUE , colClasses = "character")
        use_data <- imp_data[imp_data$Date %in% uselist, ]
        
        use_data$DateTime <- as.POSIXct(paste(use_data$Date,use_data$Time), format="%d/%m/%Y %H:%M:%S") # Date
        use_data$Global_active_power <- as.numeric(use_data$Global_active_power) # Global_active_power
        
        png(file="plot2.png", bg="transparent" , width = 480, height = 480, units = "px")
        
        plot(  x = use_data$DateTime
             , y = use_data$Global_active_power
             , ylab = "Global Active Power (kilowatts)"
             , xlab = ""
             , type = "l")
        
         dev.off()
        
}