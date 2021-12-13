# Test Case 8.6 Export rtf File
library(rtf)

test_script_8_6 <- function() {
  if (file.exists("data/rtf_sample.rtf")) {
    file.remove("data/rtf_sample.rtf")
  }
  
  test_sample = as.data.frame(mtcars)
  
  rtffile <- RTF("data/rtf_sample.rtf")
  addParagraph(rtffile, "test_sample")
  addTable(rtffile, test_sample)
  done(rtffile)
  
  return(file.exists("data/rtf_sample.rtf"))
}