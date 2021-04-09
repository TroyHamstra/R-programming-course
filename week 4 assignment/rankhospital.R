# Ranks hospitals by outcome in state

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Get data we are interested in
        rates <- as.data.frame(cbind(outcomes[, 2],        # hospitals
                                     outcomes[, 7],        # state
                                     outcomes[, 11],       # heart attack
                                     outcomes[, 17],       # heart failure
                                     outcomes[, 23]),      # pneumonia
                                stringsAsFactors = FALSE)
        
        ## Rename columns
        colnames(rates) <- c("hospital", "state", "heart attack", "heart failure",
                          "pneumonia")
        
        ## check that state and outcome are valid
        if (!state %in% rates[, "state"]) {
                stop("invalid state")
        }
        if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
                stop("invalid outcome")
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        ## Get only hospitals in chosen state
        hRates <- rates[(rates[, "state"] == state), ]

        ## Convert outcome rate to numeric, ** gets warning **
        hRates[, outcome] <- as.numeric(hRates[, outcome])

        ## Removes NA values
        hRates <- hRates[!is.na(hRates[, outcome]), ]

        ## convert num argument to valid rank
        if (num == "best") {
                num <- 1
        }
        if (num == "worst") {
                num <- nrow(hRates)
        }

        ## Order by outcome rate
        hRates <- hRates[order(hRates[, outcome], hRates[, "hospital"]), ]

        ## Get names of hospital
        hRates[num, 1]
}


# example output:
# rankhospital("TX", "heart failure", 4)
## [1] "DETER HOSPITAL NAVARRO"
##
## rankhospital("MD", "heart attack", "worst")
## [1] "HARFORD MEMORIAL HOSPITAL"