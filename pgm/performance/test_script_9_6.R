test_script_9_6 <- function(){
  df <- read.csv("data/install_package_local_benchmark.csv")
  iteration <- c()
  cran <- c()
  user <- c()
  system <- c()
  elapsed <- c()
  for (i in 1:10) {
    iteration <- c(iteration, i)
    cran <- c(cran , "r-cran")
    single_iteration = system.time({ install.packages("ggplot2") })
    user <- c(user, single_iteration[1])
    system <- c(system, single_iteration[2])
    elapsed <- c(elapsed, single_iteration[3])
  }
  
  for (i in 1:10) {
    iteration <- c(iteration, i)
    cran <- c(cran , "grace prod-cran")
    single_iteration = system.time({ install.packages("ggplot2", repos = getOption("repos")[2]) })
    user <- c(user, single_iteration[1])
    system <- c(system, single_iteration[2])
    elapsed <- c(elapsed, single_iteration[3])
  }
  
  df1 <- data.frame(iteration, cran, user, system, elapsed)
  
  df <- rbind(df, df1)
  
  
  
  p <- ggplot2::ggplot(df, ggplot2::aes(x=iteration, y=elapsed, color=cran)) +
    ggplot2::geom_point() + ggplot2::geom_line()
  
  return(p)
}
