complete <- function(directory, idnumbers = 1:332){
        idvect <- idnumbers
        nobs <- vector()
        id <- vector()
        directory <- paste(getwd(),"/",directory, sep = "")
        
        for(i in seq_along(idvect)){
                dataset <- vector()
                filelt <- list.files(directory, full.names=TRUE)
                dataset <- read.csv(filelt[idvect[i]])
                nobs <- c(nobs,sum(complete.cases(dataset)))
                id <- c(id, idvect[i])
        }
        data.frame(id=id[!is.na(id)], nobs=nobs[!is.na(nobs)])
}
