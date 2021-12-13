# Test Case 8.1 Export Excel File
test_script_8_1 <- function() {
  test_sample = as.data.frame(mtcars)
  
  if (file.exists("data/excel_sample.xlsx")){
    file.remove("data/excel_sample.xlsx")
  }
  
  Sys.sleep(1)
  
  write.xlsx(
    test_sample,
    "data/excel_sample.xlsx",
    sheetName = "Sheet1",
    col.names = T,
    row.names = F,
    append = F,
    showNA = T
  )
  
  return(file.exists("data/excel_sample.xlsx"))
}




