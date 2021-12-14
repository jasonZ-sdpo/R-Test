library(rbenchmark)
test_script_9_1 <- function() {
  remote_benchmark_100 <- benchmark(
    "lm" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- lm(y ~ X + 0)$coef
    },
    "pseudoinverse" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X) %*% t(X) %*% y
    },
    "linear system" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X, t(X) %*% y)
    },
    replications = 100,
    columns = c(
      "test",
      "replications",
      "elapsed",
      "relative",
      "user.self",
      "sys.self"
    )
  )
  
  
  remote_benchmark_1000 <- benchmark(
    "lm" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- lm(y ~ X + 0)$coef
    },
    "pseudoinverse" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X) %*% t(X) %*% y
    },
    "linear system" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X, t(X) %*% y)
    },
    replications = 1000,
    columns = c(
      "test",
      "replications",
      "elapsed",
      "relative",
      "user.self",
      "sys.self"
    )
  )
  
  
  remote_benchmark_10000 <- benchmark(
    "lm" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- lm(y ~ X + 0)$coef
    },
    "pseudoinverse" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X) %*% t(X) %*% y
    },
    "linear system" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X, t(X) %*% y)
    },
    replications = 10000,
    columns = c(
      "test",
      "replications",
      "elapsed",
      "relative",
      "user.self",
      "sys.self"
    )
  )
  
  
  remote_benchmark_100000 <- benchmark(
    "lm" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- lm(y ~ X + 0)$coef
    },
    "pseudoinverse" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X) %*% t(X) %*% y
    },
    "linear system" = {
      X <- matrix(rnorm(1000), 100, 10)
      y <- X %*% sample(1:10, 10) + rnorm(100)
      b <- solve(t(X) %*% X, t(X) %*% y)
    },
    replications = 100000,
    columns = c(
      "test",
      "replications",
      "elapsed",
      "relative",
      "user.self",
      "sys.self"
    )
  )
  
  remote_benchmark <-
    rbind(
      remote_benchmark_100,
      remote_benchmark_1000,
      remote_benchmark_10000,
      remote_benchmark_100000
    )
  remote_benchmark$type <- "Remote"
  local_benchmark <- read.csv("data/local_benchmark.csv")
  local_benchmark$type <- "Local"
  benchmark <- rbind(remote_benchmark, local_benchmark)
  
  result <- ggplot2::ggplot(benchmark,
                            ggplot2::aes(
                              x = replications,
                              y = elapsed,
                              color = test,
                              linetype = type
                            )) +
    ggplot2::geom_line() + ggplot2::ggtitle("Test Cases 9.1 Performance Testing")
  
  return(result)
}