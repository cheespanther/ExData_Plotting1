plot1 <- function()
{

## READ AND SUBSET DATA

  powerconsumption <- read.table("household_power_consumption.txt") ## READ TEXT FILE
  rows <- nrow(as.data.frame(powerconsumption)) ## COUNT NUMBER OF ROWS
  powerconsumptionchar <- lapply(powerconsumption, as.character) ## TRANSFORM DATA TO A CHARACTER LIST
  datachar <- unlist(powerconsumptionchar) ## TRANSFROM LIST TO CHARACTER TO APPLY STRSPLIT
  data <- strsplit(datachar, split = ";") ## SPLITS ROW INTO COLUMNS
  datamatrix <- do.call(rbind,(lapply(data, rbind))) ## CREATES MATRIX WITH SPLITDATA
  col.names <- datamatrix[1] ## ASSIGNS COLUMN HEADERS
  row.names(datamatrix) <- 1:rows ## ASSIGNS NUMERIC ROWNAMES
  datamatrix2 <- subset(datamatrix, datamatrix[,1] == "2/2/2007" | datamatrix[,1] == "1/2/2007") ## SUBSETS TO FEB 1 AND 2

## PLOT1 MAKES PLOT
  par(mfrow = c(1,1))
  hist(as.numeric(datamatrix2[,3]), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
  png("plot1.png", width = 480, height = 480)
  dev.off()
  
}
