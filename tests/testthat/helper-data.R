


### Setup data to be used
test_dat <- data.frame(
    stringsAsFactors = F,
    lglvar1 = c(T,F ,T ,F),
    lglvar2 = c(T,F , NA , T),
    numvar1 = c(1,2,3,4),
    numvar2 = c(1,2,3,NA),
    charvar1 = c( "hello" , "how" , "hope", "his"),
    charvar2 = c("two words" , "again again" , "dup dup" , "so there"),
    charvar3 = c("yes" , "no" , "yes" , "yes"),
    datevar1 = lubridate::ymd(c( "2015-10-01" ,  "2014-10-01" , "2015-12-20" , "1900-01-01"  )),
    datevar2 = lubridate::ymd(c( "2015-10-01" ,  "2014-10-01" , "2015-12-20" , NA )),
    dtvar1   = lubridate::ymd_hms(c( "2015-10-01 23:59:59" ,  "2014-10-01 23:00:59" , "2015-12-20 01:20:37" , "1900-01-01 00:00:00" )),
    dtvar2   = lubridate::ymd_hms(c( "2015-10-01 23:59:59" ,  "2014-10-01 23:00:59" , "2015-12-20 01:20:37" , NA ))
)

















