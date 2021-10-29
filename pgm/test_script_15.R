## 15.Import excel file

#install.packages("xlsx")

test_script_15 <- function(){
  test_sample = as.data.frame(mtcars)
  
  #export an excel file
  write.xlsx(
    test_sample,
    "test_sample.xlsx",
    sheetName = "Sheet1",
    col.names = T,
    row.names = F,
    append = F,
    showNA = T
  )
  
  #import the excel file output before
  read.xlsx("test_sample.xlsx", sheetIndex = 1)
}

