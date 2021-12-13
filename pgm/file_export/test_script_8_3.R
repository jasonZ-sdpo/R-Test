# Test Case 8.3 Export PDF File
test_script_8_3 <- function() {
  if (file.exists("data/pdf_sample.pdf")) {
    file.remove("data/pdf_sample.pdf")
  }
  
  ggplot(data = midwest,
         mapping = aes(x = area, color = state, fill = state)) + geom_density(alpha =
                                                                                0.3)
  ggsave("data/pdf_sample.pdf", width = 10, height = 6)
  
  return(file.exists("data/pdf_sample.pdf"))
}