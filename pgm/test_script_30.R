##30.Export word file

test_script_30 <- function() {
  test_sample = as.data.frame(mtcars)
  sample_doc <- read_docx()
  doc <-
    body_add_table(sample_doc, test_sample, style = "table_template")
  print(sample_doc, target = "data/test_script_30.docx")
}