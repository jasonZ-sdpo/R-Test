##18.Import pdf file

#First generate a pdf file in the path
test_script_18 <- function(){
  
  if (!file.exists("data/test_script_16.xlsx")){
    test_sample=as.data.frame(mtcars)
    pdf("data/test_script_18.pdf")
    gridExtra::grid.table(test_sample)
    dev.off()
  }

  #import the pdf file generated before
  test_sample1=pdf_text("data/test_script_18.pdf")
  return(test_sample1)
}
