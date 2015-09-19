best <- function(state, outcome){
        dataset <- read.csv(file="outcome-of-care-measures.csv", colClasses=c(rep("character",46)))
        colkeep <- c(2, 7,11,17,23)
        dataset <- dataset[,colkeep]
        dataset <- sapply(dataset, sub, pattern="Not Available", replacement=NA)
        dataset <- colnames(dataset) <- as.data.frame(dataset)
        colnames(dataset) <- c("Hospital Name", "State", "heart attack", "heart failure", "pneumonia")
        dataset[,c(1,2)] <- sapply(dataset[,c(1,2)], as.character)
        dataset[,3] <- as.numeric(levels(dataset[,3])[dataset[,3]])
        dataset[,4] <- as.numeric(levels(dataset[,4])[dataset[,4]])
        dataset[,5] <- as.numeric(levels(dataset[,5])[dataset[,5]])
                
        if (state %in% dataset$State == FALSE){
                stop("invalid state")
        }
        else if (outcome %in% colnames(dataset[,c(3,4,5)]) == FALSE){
                stop("invalid outcome")
        }
        else{
                sample <- subset(dataset, State == state, select=c("Hospital Name", outcome))
                sample$"Hospital Name"[which.min(sample[,outcome])]  
        }
}




