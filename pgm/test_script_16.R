##16.Import csv file

test_sample=as.data.frame(mtcars)

#export an csv file
write.csv(test_sample, "test_sample.csv", row.names = F)

#import csv file generated before
read.csv("test_sample.csv", header = T)
