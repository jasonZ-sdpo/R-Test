##17.Import SAS dataset

test_script_17 <- function(){
  
  if (!file.exists("data/test_script_17.xlsx")){
    test_sample=as.data.frame(mtcars)
    write_sas(test_sample, "data/test_script_17.sas7bdat")
  }
  
  #import SAS dataset output before
  df <- read_sas("data/test_script_17.sas7bdat")
  return(df)
}

