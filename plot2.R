plot2(rows){

## READS AND SUBSETS DATA

powerconsumption <- read.table("household_power_consumption.txt") ## READ TEXT FILE
rows <- nrow(as.data.frame(powerconsumption)) ## COUNT NUMBER OF ROWS
powerconsumptionchar <- lapply(powerconsumption, as.character) ## TRANSFORM DATA TO A CHARACTER LIST
datachar <- unlist(powerconsumptionchar) ## TRANSFROM LIST TO CHARACTER TO APPLY STRSPLIT
data <- strsplit(datachar, split = ";") ## SPLITS ROW INTO COLUMNS
datamatrix <- do.call(rbind,(lapply(data, rbind))) ## CREATES MATRIX WITH SPLITDATA
col.names <- datamatrix[1] ## ASSIGNS COLUMN HEADERS
row.names(datamatrix) <- 1:rows ## ASSIGNS NUMERIC ROWNAMES
datamatrix <- subset(datamatrix, datamatrix[,1] == "2/2/2007" | datamatrix[,1] == "1/2/2007") ## SUBSETS TO FEB 1 AND 2

## PLOT 2 MAKES PLOT OF THE DATA
  par(mfrow = c(1,1))
  plot(as.numeric(datamatrix2[,3]), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt='n')
  axis(1, at = seq(0, 2880, by = 1440), label = c("Thu", "Fri", "Sat"), tick = T)
  
}

