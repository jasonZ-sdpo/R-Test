# Test Case 8.2 Export CSV File
test_script_8_2 <- function() {
  
  if (file.exists("data/csv_sample.csv")){
    file.remove("data/csv_sample.csv")
  }
  
  test_sample = as.data.frame(mtcars)
  write.csv(test_sample, "data/csv_sample.csv", row.names = F)
  
  return(file.exists("data/csv_sample.csv"))
}

