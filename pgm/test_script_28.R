##28.Export image file

test_script_28 <- function() {
  ggplot(data = midwest,
         mapping = aes(x = area, color = state, fill = state)) + geom_density(alpha =
                                                                                0.3)
  ggsave("data/test_script_28.png", width = 10, height = 6)
}