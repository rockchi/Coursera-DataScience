pollutantmean <- function(directory, pollutant, id = 1:332){
        poldata <- data.frame()
        directory <- paste(getwd(),"/",directory, sep = "")
        
        for(i in id){
                filelt <- list.files(directory, full.names=TRUE)
                poldata <- rbind(poldata, read.csv(filelt[i]))
        }
        mean(poldata[,pollutant], na.rm=TRUE)
}
