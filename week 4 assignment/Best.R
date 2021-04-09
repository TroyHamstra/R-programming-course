## Write a function called best() that takes TWO arguments:
        ## (1)the 2-character name of a state
        ## (2)one of 3-outcome names;"heart attack", "heart failure", "pneumonia"

best <- function(state, outcome) {
        
        ## Read outcome data
        outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character", header = TRUE)
        rates <- as.data.frame(cbind(outcomes[, 2],        # hospital
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
       
       ## Return hospital name in that state with lowest 30- death rate
       ## Get only the hospital in chosen state
       hRates <- rates[(rates[, "state"] == state), ]

       ## Convert outcome rates to numeric
       hRates[, outcome] <- as.numeric(hRates[, outcome])

       ## Remove NA values
       hRates <- hRates[!is.na(hRates[, outcome]), ]

       ## Order by outcome rate
       hRates <- hRates[order(hRates[, outcome]), ]

       ## Get names of hospital with lowest rate
       hNames <- hRates[hRates[, outcome] == min(hRates[, outcome]), 1]

       ## Sort by hospital name if tie
       sort(hNames)[1]
}

# it will give you a warning message for converting char strings to a numeric


# example output:
# best("SC", "heart attack")
## [1] "MUSC MEDICAL CENTER"