
#
# library(purrr)
# library(lubridate)
# library(assertthat)
# library(magrittr)
# library(yaml)
#
#
# li <- list(
#     int = 1L,
#     real = 2.1234,
#     comp = 1 + 2i,
#     char = "hi",
#     fact = factor("hi"),
#     lgl = TRUE,
#     date = ymd("2016-12-20"),
#     date2 = as.Date("2016-12-20" , format = "%Y-%m-%d"),
#     dt   = ymd_hms("2015-12-20T23:59:59")
# )
#
#
# map( li , class)
# map( li , typeof)
# map( li , is.numeric)
# map( li , is.integer)
# map( li , is.double)
# map( li , is.character)
# map( li , is.POSIXct)
# map( li , is.Date)
#
#
#
# # Character
# # Factor / categorical
# # LGL
# # numeric
# #      Int
# #      Double / Real
# # Date
# # Datetime
#
# map(li , is.number)
# map(li , is.scalar)
# map(li , is.string)










