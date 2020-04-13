corr <- function(directory, treshold=0){
  data <- list.files(directory)
  fp <- paste(directory,"/",data,sep = "")
  vect <- numeric(length=0)
  
  for(i in 1:332){
    datafiles <- na.omit(read.csv(paste(directory,"/",data[i], sep="")))
      if(nrow(datafiles)>treshold){
        corvect <- cor(datafiles$sulfate,datafiles$nitrate)
        vect <- append(vect,corvect)}
  }
  print(head(vect))
  summary(vect)
}