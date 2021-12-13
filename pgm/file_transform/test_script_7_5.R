# Test Case 7.4 Arsenal Related Function
library(lubridate)
test_script_7_5 <- function() {
  #transform the number of seconds stored to date time
  dt <- as_datetime(1511870400)
  dt
  #transform the number of seconds stored to date
  d <- as_date(17498)
  d
  #transform the number of seconds stored to time
  t <- hms::as_hms(85)
  t
  
  #PARSE DATE-TIMES (Convert strings or numbers to date-times)
  ymd_hms("2017-11-28T14:02:00")
  ydm_hms("2017-22-12 10:00:00")
  mdy_hms("11/28/2017 1:02:03")
  dmy_hms("1 Jan 2017 23:59:59")
  ymd(20170131)
  mdy("July 4th, 2000")
  dmy("4th of July '99")
  yq("2001: Q3")
  hms::hms(sec = 0, min = 1, hours = 2)
  
  date_decimal(2017.5)
  now()
  today()
  fast_strptime('9/1/01', '%y/%m/%d')
  
  #GET AND SET COMPONENTS
  x = "2018-01-31 11:59:59"
  date(x)
  year(x)
  isoyear(x)
  month(x)
  hour(x)
  tz(x)
  quarter(x)
  dt = as.POSIXct("2018-1-17 13:15:40")
  update(dt, year = 2000)
  
  #Round Date-times
  x = ymd_hms("2018-01-11 08:32:44")
  floor_date(x, unit = "10 minutes")
  ceiling_date(x, unit = "10 minutes")
  round_date(x, unit = "10 minutes")
  rollback(x)
  
  #Stamp Date-times
  sf <- stamp("Created Sunday, Jan 17, 1999 3:34", quiet = TRUE)
  sf(ymd("2010-04-05"))
  
  #Time Zones
  OlsonNames()
  Sys.timezone()
  dt = "2017-11-28 12:00:00 UTC"
  dt1 = with_tz(dt, "US/Pacific")
  force_tz(dt1, "US/Pacific")
  
  #Math with Date-times
  nor <- ymd_hms("2018-01-01 01:30:00", tz = "US/Eastern")
  nor + minutes(90)
  nor + dminutes(90)
  interval(nor, nor + minutes(90))
  
  jan31 <- ymd(20180131)
  jan31 %m+% months(1)
  add_with_rollback(jan31, months(1),
                    roll_to_first = TRUE)
  p <- months(3) + days(12)
  p
  period(5, unit = "years")
  period_to_seconds(p)
  duration(5, unit = "years")
  make_difftime(99999)
  
  #INTERVALS
  i <- interval(ymd("2017-01-01"), ymd("2021-11-18"))
  j <- ymd("2016-10-01") %--% ymd("2017-12-31")
  now() %within% i
  int_start(i)
  int_aligns(i, j)
  v <-
    c(ymd("2017-01-01"),
      ymd("2017-01-01") + 100,
      ymd("2017-01-01") + 1000)
  int_diff(v)
  int_flip(i)
  int_length(i)
  int_shift(i, days(-1))
  as.interval(days(1), start = now())
  
}
