# Test Case 8.4 Export imgae File

test_script_8_4 <- function() {
  if (file.exists("data/image_sample.png")) {
    file.remove("data/image_sample.png")
  }
  
  ggplot(data = midwest,
         mapping = aes(x = area, color = state, fill = state)) + geom_density(alpha =
                                                                                0.3)
  ggsave("data/image_sample.png",
         width = 10,
         height = 6)
  
  return(file.exists("data/image_sample.png"))
}
