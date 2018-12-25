## The package lubridate works with dates and time
## "lubridate has a consistent, memorable syntax, that makes working with dates fun instead of frustrating."

Sys.getlocale("LC_TIME") # to view the locale of my date&time representation

## Get and save today's date
this_day <- today()
  #"2017-01-19"

## Components of the date
year (this_day)
  # 2017
month (this_day)
  # 1
day (this_day)
  # 19
wday(this_day) # day of the week
  # 5 
wday(this_day, label = T) # print the name of the day
  # Thurs
  # Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat

## day-time combinations
## day&time of the moment
this_moment <- now()
# "2017-01-19 15:25:56 CST"

## Components of the day-time combination\
hour (this_moment)
  # 15
minute (this_moment)
  # 25
second (this_moment)
  # 56

## Parsing date-times: ymd(), dmy(), hms(), ymd_hms(), etc.
## ymd() took a character string as input and returned an object of class POSIXct
## POSIXct is one way that R stores date-time information internally
my_date <- ymd ("1989-05-17") 
  # "1989-05-17" 
class (my_date)
  # "Date"
ymd ("1989 May 17") # different date-time format also works
  # "1989-05-17"
mdy ("March 12, 1975") # need to use differnt functions to match the order of components
  # "1975-12-19"
dmy (25081985) # works also with numeric strings
  # "1985-08-25"
ymd ("192012") # using quotes is consistent with the way most dates are represented (as character strings)
  # NA
  # Warning message:
  # All formats failed to parse. No formats found. 
  # it was unclear what date you wanted. When in doubt, it's best to be more explicit
ymd ("1920/1/2") # must supply sufficient info
  # "1920-01-02"
dt1 # Example dataset
  # "2014-08-23 17:23:02"
ymd_hms (dt1)
  # "2014-08-23 17:23:02 UTC"
hms ("03:22:14")
  # "3H 22M 14S"
dt2 # Example dataset
  # "2014-05-14" "2014-09-22" "2014-07-11"
ymd (dt2)
  # "2014-05-14" "2014-09-22" "2014-07-11"

## update() updates 1+ components of a date-time
update (this_moment, hours = 8, minutes = 34, seconds = 55) # manually alter the components but NOT the object
  # "2017-01-19 08:34:55 CST"
this_moment # remains the same unless I change it
  # "2017-01-19 15:25:56 CST"
this_moment <- update (this_moment, hours = 16, minutes = 3) # this alters the object
  # "2017-01-19 16:03:56 CST"

## Switches of time zones
## Scenario 1: Now, pretend you are in New York City and you are planning to visit a friend in Hong Kong. 
## You seem to have misplaced your itinerary, but you know that 
## your flight departs New York at 17:34 (5:34pm) the day after tomorrow. 
## You also know that your flight is scheduled to arrive in Hong Kong exactly 15 hours and 50 minutes after departure.
nyc <- now ("America/New_York") # the moment in new york city
  # "2017-01-19 03:11:13 EST"
  # for time zone names: http://en.wikipedia.org/wiki/List_of_tz_database_time_zones
depart <- nyc + days (2) # add 2 days (the day after tomorrow)
  # "2017-01-21 03:11:13 EST"
depart <- update (depart, hours = 17, minutes = 34) # departure time
  # "2017-01-21 17:34:13 EST"
arrive <- depart + hours (15) + minutes (50) # flight duration
  # "2017-01-22 09:24:13 EST"
arrive <- with_tz(arrive, "Asia/Hong_Kong") # arrival time in hong kong
  # "2017-01-22 22:24:13 HKT"

## Scenario 2: You and your friend have just met at the airport and you realize that 
## the last time you were together was in Singapore on June 17, 2008. 
## Naturally, you'd like to know exactly how long it has been.
last_time <- mdy ("June 17, 2008", tz = "Singapore")
  # "2008-06-17 SGT"
## interval (start time, end time...)
how_long <- interval (last_time, arrive)
as.period (how_long)
  # Warning in Ops.factor(left, right): '-' not meaningful for factors
  # "8y 7m 4d 21H 24M 8.27182102203369S"

























