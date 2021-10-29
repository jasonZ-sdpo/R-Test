##26.Export csv file 

test_sample=as.data.frame(mtcars)
write.csv(test_sample, "test_sample.csv", row.names = F)

