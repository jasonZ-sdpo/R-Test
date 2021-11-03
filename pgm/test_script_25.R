##25.Export excel file
test_script_25 <- function() {
  test_sample = as.data.frame(mtcars)
  
  if (file.exists("data/test_script_25.xlsx")){
    file.remove("data/test_script_25.xlsx")
  }
  
  Sys.sleep(1)
  
  write.xlsx(
    test_sample,
    "data/test_script_25.xlsx",
    sheetName = "Sheet1",
    col.names = T,
    row.names = F,
    append = F,
    showNA = T
  )
}
