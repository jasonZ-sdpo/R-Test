##31.Export rtf file

#install.packages('rtf')

test_script_31 <- function() {
  test_sample = as.data.frame(mtcars)
  
  rtffile <- RTF("data/test_script_31.doc")
  addParagraph(rtffile, "test_sample")
  addTable(rtffile, test_sample)
  done(rtffile)
}
