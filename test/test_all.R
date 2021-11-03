library(testthat)
# local_edition(3)
library(gridExtra)
library(ggplot2)
library(openxlsx)
library(haven)
library(pdftools)
library(tidyverse)

# load required packages for ggplot test (Test scenario 3.2)
library(scales)
library(MASS)
library(scales)
library(Hmisc)
library(quantreg)

# load required package for arsenal test (Test scenario 3.4)
library(arsenal)


# load required package for lubridate test (Test scenario 3.5)
library(lubridate)

# load required package for export word test (Test scenario 4.6)
library(officer)

# load required package for export rtf test (Test scenario 4.7)
library(rtf)

setwd("../")
# Test Scenario 1.1
source("pgm/test_script_1.R")
testthat::expect_silent(test_script_1())

# Test Scenario 1.2
source("pgm/test_script_2.R")
testthat::expect_silent(test_script_2())

# Test Scenario 2.1
source("pgm/test_script_15.R")
testthat::expect_silent(test_script_15())

# Test Scenario 2.2
source("pgm/test_script_16.R")
testthat::expect_silent(test_script_16())

# Test Scenario 2.3
source("pgm/test_script_17.R")
testthat::expect_silent(test_script_17())

# Test Scenario 2.4
source("pgm/test_script_18.R")
testthat::expect_silent(test_script_18())

# Test Scenario 3.1
source("pgm/test_script_19.R")
# testthat::expect_silent(test_script_19())

# Test Scenario 3.2
source("pgm/test_script_20.R")
testthat::expect_silent(test_script_20())

# Test Scenario 3.3
source("pgm/test_script_21.R")
testthat::expect_silent(test_script_21())

# Test Scenario 3.4
source("pgm/test_script_22.R")
testthat::expect_silent(test_script_22())

# Test Scenario 3.5
source("pgm/test_script_23.R")
testthat::expect_silent(test_script_23())

# Test Scenario 3.6
source("pgm/test_script_24.R")
testthat::expect_silent(test_script_24())

# Test Scenario 4.1 
source("pgm/test_script_25.R")
testthat::expect_silent(test_script_25())

# Test Scenario 4.2
source("pgm/test_script_26.R")
testthat::expect_silent(test_script_26())

# Test Scenario 4.3
source("pgm/test_script_27.R")
testthat::expect_silent(test_script_27())

# Test Scenario 4.4
source("pgm/test_script_28.R")
testthat::expect_silent(test_script_28())

# Test Scenario 4.6
source("pgm/test_script_30.R")
testthat::expect_silent(test_script_30())

# Test Scenario 4.7
source("pgm/test_script_31.R")
testthat::expect_silent(test_script_31())








