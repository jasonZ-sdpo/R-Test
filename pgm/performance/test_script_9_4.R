test_script_9_4<- function() {
  records_number <- c()
  elapse_time <- c()
  file_sizes <- c()
  # 2M
  filename <- "data/performance/2m Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 2000)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  # 5M
  filename <- "data/performance/5m Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 5000)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  
  # 1.5M
  filename <- "data/performance/1500000 Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 1500)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  # 1M
  filename <- "data/performance/1000000 Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 1000)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  # 0.5M
  filename <-"data/performance/500000 Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 500)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  # 0.1M
  filename <- "data/performance/100000 Sales Records.csv"
  start_time <- Sys.time()
  df <- read.csv(filename)
  end_time <- Sys.time()
  elapsed <- end_time - start_time
  file_size <- as.integer(file.info(filename)$size / 1024^2)
  
  records_number <- c(records_number, 100)
  elapse_time <- c(elapse_time, elapsed)
  file_sizes <- c(file_sizes, file_size)
  
  result <- data.frame(records_number, elapse_time, file_sizes)
  return(result)
}



