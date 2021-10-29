##25.Export excel file

#install.packages("xlsx")
library(xlsx)
test_sample=as.data.frame(mtcars)
write.xlsx(test_sample, "test_sample.xlsx", sheetName = "Sheet1", col.names = T, 
           row.names = F, append = F, showNA = T)
