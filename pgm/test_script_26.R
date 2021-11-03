##26.Export csv file

test_script_26 <- function() {
  test_sample = as.data.frame(mtcars)
  write.csv(test_sample, "data/test_script_26.csv", row.names = F)
}
