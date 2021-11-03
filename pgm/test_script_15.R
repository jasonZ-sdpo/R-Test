test_script_15 <- function(){
  test_sample = as.data.frame(mtcars)
  
  if (!file.exists("data/test_script_15.xlsx")){
    write.xlsx(
      test_sample,
      "data/test_script_15.xlsx",
      sheetName = "Sheet1",
      col.names = T,
      row.names = F,
      append = F,
      showNA = T
    )
  }
  
  #import the excel file output before
  df <- read.xlsx("data/test_script_15.xlsx")
  return(df)
}

