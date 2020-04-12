complete <- function(directory, id = 1:332){
  fp <- list.files(c(directory,"/",id,".csv"), pattern =".csv", full.names = TRUE)
  afp <- fp[id]
  df <- data.frame(Date=as.Date(character()), File=character(), 
                   User=character(), stringsAsFactors=FALSE) 
  names(df) <- c("id","nobs")
  result <- mapply(readdata, id,afp,SIMPLIFY = TRUE)
  result_asdf <- as.data.frame(t(result))
  print(result_asdf)
}

readdata <- function(id,afp){
  data <- read.csv(afp)
  com_cases <- sum(complete.cases(data))
  de <- data.frame(id, com_cases)
  names(de) <- c("id", "nobs")
  de
}
