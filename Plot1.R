generate_data <- function()
{
    # Reads the first (dates) column. Assumes that the relevent data is in the first million
    # rows since dates range from 2006 to 2010 and we are interested in 2007.
    dates <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                        nrows = 1000000, colClasses = c("character", rep("NULL",8)))
    
    # Converts to date format
    dates <- as.Date(dates[, 1], format = "%d/%m/%Y")
    
    # Reads the column names
    header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE,
                         sep =';', stringsAsFactors = FALSE)
    
    # Extracts indeces of the relevent dates
    relevent_dates <- which(dates >= "2007-02-01" & dates <= "2007-02-02")
    
    # Reads the data corresponding to these indeces exept for the date column which we already have
    data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",
                       colClasses = c("NULL", rep("character",8)), 
                       skip = relevent_dates[1] - 1, nrows = length(relevent_dates))
    
    # Binds the date column to the data
    data <- cbind(dates[relevent_dates], data)
    
    # Sets the column names
    colnames(data) <- header
    
    data
}

data <- generate_data()

# First plot
png("Plot1.png")

hist(as.numeric(data$Global_active_power), col = "red", main = "Global active power",
     xlab = "Global active power (kilowats)")

dev.off()