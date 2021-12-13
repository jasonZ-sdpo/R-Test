# Test Case 6.1 Import Excel File
library(openxlsx)
test_script_6_1 <- function(){
  test_sample = as.data.frame(mtcars)
  
  if (!file.exists("data/excel_sample.xlsx")){
    write.xlsx(
      test_sample,
      "data/excel_sample.xlsx",
      sheetName = "Sheet1",
      col.names = T,
      row.names = F,
      append = F,
      showNA = T
    )
  }
  
  #import the excel file output before
  df <- read.xlsx("data/excel_sample.xlsx")
  return(is.data.frame(df))
}
