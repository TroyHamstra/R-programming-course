## Create the function: corr <- function(directory, threshold = 0)
        # (1) "directory" is a character vector indicating the location of
        # the .csv files

        #(2) "threshold" is a numeric vector indicating the number of
        # completely observed observations ( on all variable) required
        # to compute the correlation between nitrate and sulfate
        # default is set to 0.

        #(3) Return a numeric vector of correlations
        # NOTE: do not round the results!
#-------------------------------------------------------------------------------
corr <- function(directory, threshold = 0) {
        mylist <- list.files(path = directory, pattern = ".csv")
         df <- complete(directory)
        ids <- df[df["nobs"] > threshold, ]$id
        corr <- numeric()
        
        for (i in ids) {
                mydata <- read.csv(mylist[i])     
                dff <- mydata[complete.cases(mydata), ] 
                corr <- c(corr, cor(dff$sulfate, dff$nitrate))
        }
         return(corr)       
}
