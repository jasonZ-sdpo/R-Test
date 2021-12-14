# Test Case 4.1 Required R package installation in main library
test_script_4_1 <- function() {
  df1 <- as.data.frame(installed.packages())
  df2 <-
    openxlsx::read.xlsx("data/20211018_GRACE_R_Rpackages_v2.xlsx", sheet =
                          "GRACE")
  
  installed_packages <- df1$Package
  required_packages <- df2$Package
  
  missing_packages <- setdiff(required_packages, installed_packages)
  if (length(missing_packages) >= 1) {
    print(missing_packages)
    return(length(missing_packages))
  } else{
    return(length(missing_packages))
  }
}
