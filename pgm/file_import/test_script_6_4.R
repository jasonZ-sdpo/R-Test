# Test Case 6.4 Import PDF File
library(pdftools)
test_script_6_4 <- function(){
  
  if (!file.exists("data/pdf_sample.pdf")){
    test_sample=as.data.frame(mtcars)
    pdf("data/pdf_sample.pdf")
    gridExtra::grid.table(test_sample)
    dev.off()
  }

  #import the pdf file generated before
  test_sample1=pdf_text("data/pdf_sample.pdf")
  return(is.character(test_sample1))
}