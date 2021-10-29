##24.General function in pdftools

library(pdftools)
library(gridExtra)


#First generate a pdf file in the path
test_sample=as.data.frame(mtcars)
pdf("test_sample.pdf")
gridExtra::grid.table(test_sample)
dev.off()

#test pdf_info function
pdf_info("test_sample.pdf")

#test pdf_text function
pdf_text("test_sample.pdf")

#test pdf_data function
pdf_data("test_sample.pdf", font_info = FALSE, opw = "", upw = "")

#test pdf_pagesize function
pdf_pagesize("test_sample.pdf")
