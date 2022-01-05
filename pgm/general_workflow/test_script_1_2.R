## ---------------------------
##
## Script name: test_script_2.R
##
## Purpose of script: Test scripts for generate graphical clinical output
##
## Author: Jason Zhang
##
## Date Created: 2021-10-20
##
##
## Email: jason.zhang@sdponcology.com
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------
# Prepare content of demographic dataset
library(ggplot2)
test_script_1_2 <- function(){
  STUDYID <- c("ABC-123", "ABC-123", "ABC-123")
  USUBJID <- c("ABC-123-0001", "ABC-123-0002", "ABC-123-0003")
  SUBJID <- c("0001", "0002", "0003")
  RFSTDTC <-
    c(as.Date("2021-10-12"),
      as.Date("2021-10-12"),
      as.Date("2021-10-12"))
  RFENDTC <-
    c(as.Date("2021-10-12"),
      as.Date("2021-10-12"),
      as.Date("2021-10-12"))
  RFXSTDTC <-
    c(as.Date("2021-10-12"),
      as.Date("2021-10-12"),
      as.Date("2021-10-12"))
  RFXENDTC <-
    c(as.Date("2021-10-12"),
      as.Date("2021-10-12"),
      as.Date("2021-10-12"))
  RFICDTC <-
    c(as.Date("2021-10-12"),
      as.Date("2021-10-12"),
      as.Date("2021-10-12"))
  RFPENDTC <- c(NA, NA, NA)
  DTHDTC <- c(NA, NA, NA)
  DTHFL <- c(NA, NA, NA)
  SITEID <- c("123", "123", "123")
  BRTHDTC <-
    c(as.Date("2000-10-12"),
      as.Date("2000-10-12"),
      as.Date("2000-10-12"))
  AGE <- c(21, 21, 21)
  SEX <- c("M", "F", "M")
  RACE <- c("White", "Asian", "White")
  ETHNIC <-
    c("NOT HISPANIC OR LATINO",
      "NOT HISPANIC OR LATINO",
      "HISPANIC OR LATINO")
  ARMCD <- c("A", "A", "B")
  ARM <- c("Arm A", "Arm A", "Arm B")
  ACTARMCD <- c("A", "A", "B")
  ACTARM <- c("Arm A", "Arm A", "Arm B")
  COUNTRY <- c("USA", "USA", "USA")
  
  # Creating demographic dataset
  dm <-
    data.frame(
      STUDYID,
      USUBJID,
      SUBJID,
      RFSTDTC,
      RFENDTC,
      RFXSTDTC,
      RFXENDTC,
      RFICDTC,
      RFPENDTC,
      DTHDTC,
      DTHFL,
      SITEID,
      BRTHDTC,
      AGE,
      SEX,
      RACE,
      ETHNIC,
      ARMCD,
      ARM,
      ACTARMCD,
      ACTARM,
      COUNTRY
    )
  
  p <- ggplot(data = dm, mapping = aes(x = RACE, fill = SEX)) +
    geom_bar(stat = "count") +
    scale_fill_discrete(c("red", "blue")) +
    theme_bw() + facet_grid(cols = vars(ETHNIC)) +
    labs(
      x = "Frequency",
      y = "Race",
      title = "Race Histogram",
      subtitle = "N = (3)",
      caption = "Protocol ID: ABC-123"
    ) + 
    theme(
      axis.text.x = element_text(angle=45, vjust=1, hjust=1),
      legend.position = "bottom",
      plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5))
  
    return(p)
}

    