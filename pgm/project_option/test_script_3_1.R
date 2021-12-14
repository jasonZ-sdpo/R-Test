# Test Case 3.1 Project Virtual Environment
library(renv)
test_script_3_1 <- function() {
  if (file.exists("renv.lock")) {
    renv::snapshot()
    renv::restore()
  } else{
    renv::init()
    renv::snapshot()
    renv::restore()
  }
  return(NULL)
}

