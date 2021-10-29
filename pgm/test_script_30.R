##30.Export word file

#install.packages("officer")
library(officer)

test_sample=as.data.frame(mtcars)
sample_doc <- read_docx()
doc <- body_add_table(sample_doc, test_sample, style = "table_template")
print(sample_doc, target = "test_sample.docx")
