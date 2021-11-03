##31.Export rtf file

#install.packages('rtf')
library(rtf)

test_sample=as.data.frame(mtcars)

rtffile <- RTF("test_sample.doc")
addParagraph(rtffile, "test_sample")
addTable(rtffile, test_sample)
done(rtffile)


##/ Test if the git push can work /##
