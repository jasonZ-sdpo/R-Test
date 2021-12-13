# Test Case 7.4 Arsenal Related Function
library(arsenal)
test_script_7_4 <- function() {
  #test tableby function
  data(mockstudy)
  tab1 <- tableby(arm ~ sex + age, data = mockstudy)
  summary(tab1, text = TRUE)
  
  mylabels <- list(sex = "SEX", age = "Age, yrs")
  summary(tab1, labelTranslations = mylabels, text = TRUE)
  
  
  #test paired function
  dat <- data.frame(
    tp = paste0("Time Point ", c(1, 2, 1, 2, 1, 2, 1, 2, 1, 2)),
    id = c(1, 1, 2, 2, 3, 3, 4, 4, 5, 6),
    Cat = c("A", "A", "A", "B", "B", "B", "B", "A", NA, "B"),
    Fac = factor(c(
      "A", "B", "C", "A", "B", "C", "A", "B", "C", "A"
    )),
    Num = c(1, 2, 3, 4, 4, 3, 3, 4, 0, NA),
    Ord = ordered(c(
      "I", "II", "II", "III", "III", "III", "I", "III", "II", "I"
    )),
    Lgl = c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
    Dat = as.Date("2018-05-01") + c(1, 1, 2, 2, 3, 4, 5, 6, 3, 4),
    stringsAsFactors = FALSE
  )
  p <- paired(
    tp ~ Cat + Fac + Num + Ord + Lgl + Dat,
    data = dat,
    id = id,
    signed.rank.exact = FALSE,
    na.action = na.paired("fill")
  )
  summary(p)
  
  #test modelsum function
  data(mockstudy)
  
  tab2 <- modelsum(
    alk.phos ~ arm + ps + hgb,
    adjust = ~ age + sex,
    family = "gaussian",
    data = mockstudy
  )
  summary(tab2, text = TRUE)
  summary(tab2, show.intercept = FALSE, text = TRUE)
  
  #test freqlist function
  data(mockstudy)
  tab.ex <-
    table(mockstudy[c("arm", "sex", "mdquality.s")], useNA = "ifany")
  noby <- freqlist(tab.ex, na.options = "include")
  summary(noby)
  
  #test comparedf function
  df1 <- data.frame(
    id = paste0("person", 1:3),
    a = c("a", "b", "c"),
    b = c(1, 3, 4),
    c = c("f", "e", "d"),
    row.names = paste0("rn", 1:3),
    stringsAsFactors = FALSE
  )
  df2 <- data.frame(
    id = paste0("person", 3:1),
    a = c("c", "b", "a"),
    b = c(1, 3, 4),
    d = paste0("rn", 1:3),
    row.names = paste0("rn", c(1, 3, 2)),
    stringsAsFactors = FALSE
  )
  summary(comparedf(df1, df2))
  summary(comparedf(df1, df2, by = "id"))
  summary(comparedf(df1, df2, by = "row.names"))
}
test_script_7_4()
