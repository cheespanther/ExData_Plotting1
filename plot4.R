## READS AND SUBSETS DATA

powerconsumption <- read.table("household_power_consumption.txt") ## READ TEXT FILE
rows <- nrow(as.data.frame(powerconsumption)) ## COUNT NUMBER OF ROWS
powerconsumptionchar <- lapply(powerconsumption, as.character) ## TRANSFORM DATA TO A CHARACTER LIST
datachar <- unlist(powerconsumptionchar) ## TRANSFROM LIST TO CHARACTER TO APPLY STRSPLIT
data <- strsplit(datachar, split = ";") ## SPLITS ROW INTO COLUMNS
datamatrix <- do.call(rbind,(lapply(data, rbind))) ## CREATES MATRIX WITH SPLITDATA
col.names <- datamatrix[1] ## ASSIGNS COLUMN HEADERS
row.names(datamatrix) <- 1:rows ## ASSIGNS NUMERIC ROWNAMES
datamatrix <- subset(datamatrix, datamatrix[,1] == "2/2/2007" & datamatrix[,1] == "1/2/2007") ## SUBSETS TO FEB 1 AND 2


##PLOT 4
plot4 <- function(){
  par(mfrow=c(2,2))
  ##1
  plot(as.numeric(datamatrix2[,3]), type = "l", ylab = "Global Active Power (kilowatts)")
  ##2
  plot(as.numeric(datamatrix2[,5]), type = "l", ylab = "Voltage")
  ##3
  plot(as.numeric(datamatrix2[,7]), type = "l", ylab = "Energy sub metering", col = "black")
  points(as.numeric(datamatrix2[,8]), type = "l", ylab = "Energy sub metering", col = "orange")
  points(as.numeric(datamatrix2[,9]), type = "l", ylab = "Energy sub metering", col = "blue")
  ##4
  plot(as.numeric(datamatrix2[,4]), type = "l", ylab = "Global Reactive Power (kilowatts)")
  
}