# Test Case 8.5 Export Word File
library(officer)

test_script_8_5 <- function() {
  if (file.exists("data/word_sample.docx")) {
    file.remove("data/word_sample.docx")
  }
  
  test_sample = as.data.frame(mtcars)
  sample_doc <- read_docx()
  doc <-
    body_add_table(sample_doc, test_sample, style = "table_template")
  print(sample_doc, target = "data/word_sample.docx")
  
  return(file.exists("data/word_sample.docx"))
}

