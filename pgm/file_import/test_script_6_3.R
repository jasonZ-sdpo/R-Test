# Test Case 6.3 Import Excel File
library(haven)
test_script_6_3 <- function(){
  
  if (!file.exists("data/sas_sample.sas7bdat")){
    test_sample=as.data.frame(mtcars)
    write_sas(test_sample, "data/sas_sample.sas7bdat")
  }
  
  #import SAS dataset output before
  df <- read_sas("data/sas_sample.sas7bdat")
  return(is.data.frame(df))
}
