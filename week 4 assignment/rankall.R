## Rank all hospitals in all states

rankall <- function(outcome, num = "best") {
        
        ## Read outcome data
        outcomes <- read.csv("outcome-of-care-measures.csv", 
                             colClasses = "character", header = TRUE)
        
        ## Focus on data we are interested in 
        rates <- as.data.frame(cbind(outcomes[, 2],     # hospital
                                     outcomes[, 7],        # state
                                     outcomes[, 11],       # heart attack
                                     outcomes[, 17],       # heart failure
                                     outcomes[, 23]),      # pneumonia
                                stringsAsFactors = FALSE)
        ## Rename columns
        colnames(rates) <- c("hospital", "state", "heart attack", "heart failure",
                             "pneumonia")
        
        ## Check if outcome is valid
        if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
                stop("invalid outcome")
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        hRank <- data.frame()
        for (state in sort(unique(rates[, "state"]))) {
        
        ## Get only hospitals in state
                hRates <- rates[(rates[, "state"] == state), ]
        
        ## Remove NA values
                hRates <- hRates[!is.na(hRates[, outcome]), ]
        
        ## Convert num argumnet to valid rank
                if (num == "best") {
                rnum <- 1
                } else if (num == "worst") {
                rnum <- nrow(hRates)
                }
                else {rnum = num}
        
        ## Order by outcome rate & hospital name
                hRates <- hRates[order(hRates[, outcome], hRates[, "hospital"]), ]
                hName <- hRates[rnum, 1]
                hRank <- rbind(hRank, data.frame(hospital = hName,
                                                 state = state))
        }
        ## Return dataframe
        hRank
}

## Example output:
## head(rankall("heart attack", 20), 10)
## 
## Matrix of Top 10 hospitals  produced 
##
##
