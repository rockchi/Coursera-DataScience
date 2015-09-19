corr <- function(directory, threshold = 0){
        complist <- complete(directory)
        complist <- subset(complist, nobs>threshold)
        threslist <- as.vector(complist$id)
        cordata <- vector()
        if(length(threslist) > 0){
                for(i in threslist){
                        csvdata <- data.frame()
                        filelist <- list.files(directory, full.names=TRUE)
                        csvdata <- read.csv(filelist[i])
                        csvdata <- subset(csvdata, complete.cases(csvdata))
                        cordata[i] <- cor(csvdata$sulfate, csvdata$nitrate)
                }
        }
        else{
                cordata <- as.numeric(cordata)
                
        }
        cordata[!is.na(cordata)]
}
