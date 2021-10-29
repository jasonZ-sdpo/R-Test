##18.Import pdf file

library(gridExtra)
library(pdftools)

#First generate a pdf file in the path
test_sample=as.data.frame(mtcars)
pdf("test_sample.pdf")
gridExtra::grid.table(test_sample)
dev.off()

#import the pdf file generated before
test_sample1=pdf_text("test_sample.pdf")
cat(test_sample1[1])
