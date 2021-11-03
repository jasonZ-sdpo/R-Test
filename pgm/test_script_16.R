##16.Import csv file
test_script_16 <- function(){
  test_sample=as.data.frame(mtcars)
  
  if (!file.exists("data/test_script_16.xlsx")){
    #export an csv file
    write.csv(test_sample, "data/test_script_16.csv", row.names = F)
  }
  
  #import csv file generated before
  df <- read.csv("data/test_script_16.csv", header = T)
  return(df)
}

