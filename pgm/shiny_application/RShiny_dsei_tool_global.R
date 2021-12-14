if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")
if (!require("reshape2")) install.packages("reshape2")
if (!require("shiny")) install.packages("shiny")
if (!require("shinydashboard")) install.packages("shinydashboard")
#library(shiny)
require(ggplot2)  # suggested plotting
require(dplyr) # suggested for data manipulation
#library(haven) # suggested to read sas7bdat data files
#library(foreign) # suggested to read sas transport files

require(reshape2) 
require(shiny)
require(shinydashboard)
#require(shinythemes)
#require(DT)
#require(haven)


########### Packages used in helper functions #########
#if (!require("pacman")) install.packages("pacman") ## this package can be used to quickly 
                                                   ## install packages if missing and load them
#pacman::p_load("knitr","extraDistr","rmutil") 
#pacman::p_load("kableExtra") ## install and load packages used through the helper functions
if (!require("knitr")) install.packages("knitr")
if (!require("kableExtra")) install.packages("kableExtra")
require(knitr)
require(kableExtra)

