##17.Import SAS dataset

#install.packages("haven")
library(haven)

test_sample=as.data.frame(mtcars)
write_sas(test_sample, "test_sample.sas7bdat")

#import SAS dataset output before
read_sas("test_sample.sas7bdat")
