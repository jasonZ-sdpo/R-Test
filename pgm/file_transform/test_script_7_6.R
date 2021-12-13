# Test Case 7.6 pdftools Related Function
library(pdftools)
test_script_7_6 <- function() {
  #First generate a pdf file in the path
  test_sample = as.data.frame(mtcars)
  pdf("data/test_script_24.pdf")
  gridExtra::grid.table(test_sample)
  dev.off()
  
  #test pdf_info function
  pdf_info("data/test_script_24.pdf")
  
  #test pdf_text function
  pdf_text("data/test_script_24.pdf")
  
  #test pdf_data function
  pdf_data(
    "data/test_script_24.pdf",
    font_info = FALSE,
    opw = "",
    upw = ""
  )
  
  #test pdf_pagesize function
  pdf_pagesize("data/test_script_24.pdf")
}

