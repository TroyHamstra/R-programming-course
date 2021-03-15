##Example function
        #pollutantmean <- function(directory, pollutant, id = 1:332)

## directory is a a character vector to determine location of csv files

## pollutant is a character vector to determine the pollutant we are interested
## in calculating the mean for, it is either "sulfate" or "nitrate"

## id is an integer vector, indicating the monitor ID number and corresponding
## csv files.
#-------------------------------------------------------------------------------
pollutantmean <- function(directory, pollutant, id = 1:332) {
        mylist <- list.files(path = directory, pattern = ".csv")
        x <- numeric()
        for (i in id) {
                mydata <- read.csv(mylist[i])
                x <- c(x, mydata[[pollutant]])
        }
        mean(x, na.rm = TRUE)
}