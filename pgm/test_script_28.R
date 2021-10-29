##28.Export image file

library(ggplot2)

ggplot(data = midwest, mapping = aes(x=area, color=state, fill=state))+geom_density(alpha=0.3)
ggsave("test_plots.png", width=10, height=6)
