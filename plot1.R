plot1 <- function(){
        
        uselist <- c("1/2/2007", "2/2/2007")
        
        imp_data <- read.csv("household_power_consumption.txt"
                             , sep = ";", header = TRUE , colClasses = "character")
        
        use_data <- imp_data[imp_data$Date %in% uselist, ]
        
        use_data$Global_active_power <- as.numeric(use_data$Global_active_power) # Global_active_power
        
        png(file="plot1.png", bg="transparent" , width = 480, height = 480, units = "px")
        
        hist(x = use_data$Global_active_power
             , col="red"
             , bg = "transparent"
             , main = "Global Active Power"
             , xlab = "Global Active Power (kilowatts)")
        
        dev.off()
}