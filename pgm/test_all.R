library(testthat)
library(ggplot2)
library(xlsx)
local_edition(3)


# Test Scenario 1.1
source("pgm/test_script_1.R")
testthat::show_failure(testthat::expect_visible(test_script_1()))


# Test Scenario 1.2
source("pgm/test_script_2.R")
testthat::show_failure(testthat::expect_visible(test_script_2()))


#