## create the function: complete <- function(directory, id = 1:332)
        #(1) "directory" is a character vector indicating
        # the location of csv files
        
        #(2) "id" is an integer vector indicating
        # the monitor ID numbers to be used

        #(3) Return a data frame of the form:
        # id nobs
        # 1  117
        # 2  1041
        # ... 
        # where "id" is the monitor ID number and "nobs" is the number of
        # complete cases. 
#-------------------------------------------------------------------------------
complete <- function(directory, id = 1:332) {
        mylist <- list.files(path = directory, pattern = ".csv")
        nobs <- numeric()
        for (i in id) {
                mydata <- read.csv(mylist[i])
                mysum <- sum(complete.cases(mydata))
                nobs <- c(nobs, mysum) 
        }
        data.frame(id, nobs)
}
