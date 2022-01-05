## ---------------------------
##
## Script name: test_script_1.R
##
## Purpose of script: Test scripts for generate tabular clinical output
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
test_script_1_1 <- function(){
  # Prepare content of demographic dataset
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
      "NOT HISPANIC OR LATINO")
  ARMCD <- c("A", "A", "B")
  ARM <- c("Arm A", "Arm A", "Arm B")
  ACTARMCD <- c("A", "A", "B")
  ACTARM <- c("Arm A", "Arm A", "Arm B")
  COUNTRY <- c("USA", "USA", "USA")
  
  # Creating demographic dataset
  dm <-
    data.frame(STUDYID,
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
               COUNTRY)
  return(dm)
}
