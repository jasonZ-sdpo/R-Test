##27.Export pdf file

test_script_27 <- function() {
  ggplot(data = midwest,
         mapping = aes(x = area, color = state, fill = state)) + geom_density(alpha =
                                                                                0.3)
  ggsave("data/test_script_27.pdf", width = 10, height = 6)
}
