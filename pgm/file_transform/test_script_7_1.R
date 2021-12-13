# Test Case 7.1 Tidayverse related function

library(tidyverse)
test_script_7_1 <- function() {
  #Summarise Cases
  summarise(mtcars, avg = mean(mpg))
  count(mtcars, cyl)
  
  #Group Cases
  mtcars %>%
    group_by(cyl) %>%
    summarise(avg = mean(mpg))
  starwars %>%
    rowwise() %>%
    mutate(film_count = length(films))
  ungroup(mtcars)
  
  #Manipulate Cases
  ##EXTRACT CASES
  filter(mtcars, mpg > 20)
  distinct(mtcars, gear)
  slice(mtcars, 10:15)
  slice_sample(mtcars, n = 5, replace = TRUE)
  slice_min(mtcars, mpg, prop = 0.25)
  slice_head(mtcars, n = 5)
  
  ##ARRANGE CASES
  arrange(mtcars, desc(mpg))
  
  ##ADD CASES
  add_row(cars, speed = 1, dist = 1)
  
  #Manipulate Variables
  ##EXTRACT VARIABLES
  pull(mtcars, wt)
  mtcars %>% select(starts_with('m') | contains('p'))
  mtcars %>% select(everything()) %>% select(num_range('x', 1:3) |
                                               matches("^[[:alpha:]]"))
  relocate(mtcars, mpg, cyl, .after = last_col())
  
  ##MANIPULATE MULTIPLE VARIABLES AT ONCE
  summarise(mtcars, across(everything(), mean))
  transmute(rowwise(mtcars), total = sum(c_across(1:2)))
  
  ##MAKE NEW VARIABLES
  mutate(mtcars, gpm = 1 / mpg)
  transmute(mtcars, gpm = 1 / mpg)
  rename(cars, distance = dist)
  
  
  
  
  #Vectorized Functions
  ##OFFSET
  lag(mtcars$mpg)
  lead(mtcars$mpg)
  
  ##CUMULATIVE AGGREGATE
  x_logical <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
  cumall(x_logical)
  cumany(x_logical)
  x_numeric <- c(2, 10, 3, 6)
  cummean(x_numeric)
  cummin(x_numeric)
  cumprod(x_numeric)
  cumsum(x_numeric)
  
  ##RANKING
  x <- c(5, 1, 3, 2, 2, NA)
  cume_dist(x)
  min_rank(x)
  dense_rank(x)
  row_number(x)
  ntile(1:8, 3)
  mtcars %>% filter(between(row_number(), 1, 10))
  
  ##MISCELLANEOUS
  starwars %>%
    mutate(type = case_when(
      height > 200 | mass > 200 ~ "large",
      species == "Droid" ~ "robot",
      TRUE ~ "other"
    ))
  
  x <- c(2, 1, NA, 5, 3, NA)
  coalesce(x, 999)
  if_else(x < 0, "neg", "pos")
  
  x1 <- c(0, 7, 5, 5, 6, 1)
  x2 <- c(2, 8, 3, 4, 1, 5)
  pmax(x1, x2)
  
  
  #Summary Functions
  
  mtcars %>%
    replace(is.na(.), 0) %>%
    summarise_all(sum)
  
  mtcars %>%
    group_by(gear) %>%
    summarise(count_distinct = n_distinct(mpg), mean = mean(!is.na(mpg)))
  
  mtcars %>%
    group_by(gear) %>%
    summarise(
      mean = mean(!is.na(mpg)),
      sd = sd(mpg),
      median = median(mpg),
      iqr = IQR(mpg),
      min = min(mpg)
    )
  
  
  
  #Row Names
  
  a <- rownames_to_column(mtcars,
                          var = "C")
  column_to_rownames(a, var = "C")
  has_rownames(mtcars)
  remove_rownames(mtcars)
  
  
  
  
  #Combine Tables
  
  ##COMBINE VARIABLES
  bind_cols(mtcars[, 1:2], mtcars[, 3:4])
  bind_rows(mtcars[1:3, ], mtcars[7:9, ])
  
  data1 <- data.frame(
    ID = 1:2,
    X1 = c("a1", "a2"),
    stringsAsFactors = FALSE
  )
  data2 <- data.frame(
    ID1 = 2:3,
    ID = 2:3,
    X2 = c("b1", "b2"),
    stringsAsFactors = FALSE
  )
  
  inner_join(data1, data2, by = c("ID" = "ID1"))
  left_join(data1, data2, by = "ID")
  right_join(data1, data2, by = "ID")
  full_join(data1, data2, by = "ID")
  semi_join(data1, data2, by = "ID")
  anti_join(data1, data2, by = "ID")
  nest_join(data1, data2, by = "ID")
  
  
  ##Create two data frames for testing setdiff
  df1 <- data.frame(
    team = c('A', 'B', 'C', 'D'),
    conference = c('West', 'West', 'East', 'East'),
    points = c(88, 97, 94, 104)
  )
  
  df2 <- data.frame(
    team = c('A', 'B', 'C', 'D'),
    conference = c('West', 'West', 'East', 'East'),
    points = c(88, 97, 98, 99)
  )
  #find differences between the points columns in the two data frames
  setdiff(df1$points, df2$points)
  
  setequal(df1, df2)
  
  
  ##Create two data frames for testing union
  
  df1 = data.frame(CustomerId = c(1:6), Product = c(rep("Oven", 3), rep("Television", 3)))
  
  df2 = data.frame(CustomerId = c(4:7), Product = c(rep("Television", 2), rep("Air conditioner", 2)))
  
  union(df1, df2)
  union_all(df1, df2)
  
  return(NULL)
}
