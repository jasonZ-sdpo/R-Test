# Test Case 2.3 Global Options
library(git2r)
test_script_2_3 <- function(){
  return(!git2r::is_bare())
}
