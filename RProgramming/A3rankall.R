rankall <- function(outcome, num="best"){
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
        
        TotalRankings <- data.frame()
        if (outcome %in% colnames(dataset[,c(3,4,5)]) == FALSE){
                stop("invalid outcome")
        }
        else if (num != "best" | num !="worst" & num>54){
                NA
        }
        
        for (i in unique(dataset$State)){
                StateName <- i
                sample <- subset(dataset, State==StateName, select=c("Hospital Name", outcome))
                sample <- sample[order(sample[,1]),]
                sample <- sample[order(sample[,2]),]
                sample$ranking <- rank(sample[,2], na.last="keep",ties.method='first')
                if (num=="best"){
                        rankseek <- 1
                }else if(num=="worst"){
                        rankseek <- max(sample$ranking, na.rm=TRUE)
                }else if(num > max(sample$ranking,na.rm=TRUE)){
                        sampleoutput <- as.list(c(NA, StateName))
                        TotalRankings <- rbind(TotalRankings, sampleoutput)
                        next
                }else{
                        rankseek <- num
                }
                sampleoutput <- subset(sample, ranking==rankseek)
                sampleoutput$"state" <- StateName
                colnames(sampleoutput)[1] <- "hospital"
                TotalRankings <- rbind(TotalRankings, sampleoutput[,c(1,4)]) 
        }
        TotalRankings <- TotalRankings[order(TotalRankings[,2]),]
        rownames(TotalRankings) <- TotalRankings[,2]
        TotalRankings
}