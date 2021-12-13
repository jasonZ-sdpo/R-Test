# Test Case 6.2 Import CSV File
test_script_6_2 <- function(){
  test_sample=as.data.frame(mtcars)
  
  if (!file.exists("data/csv_sample.csv")){
    #export an csv file
    write.csv(test_sample, "data/csv_sample.csv", row.names = F)
  }
  
  #import csv file generated before
  df <- read.csv("data/csv_sample.csv", header = T)
  return(is.data.frame(df))
}
