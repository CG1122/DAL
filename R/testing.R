# # vars <- c( "Sepal.Length" , "Sepal.Width")
# assert_exist(iris , "Sepal.Width")
# assert_exist(iris , "Sepal.Widt")
#
#
#
# #####
# #
# # Logicals
# #
# #####
#
# tvar <- c( T,F ,T , T , NA)
# tvar2 <- c( T,F ,T , T , NA , "char")
#
# assert_lgl( tvar)
# assert_lgl( tvar , FALSE)
#
# assert_lgl( tvar2)
# assert_lgl( tvar2 , FALSE)
#
#
# #####
# #
# # Numerics
# #
# #####
#
#
# nvar <- c(1,2,3,4,5,6,7,NA)
# nvar2 <- c(1,2,3,4,5,"c", NA)
#
# assert_numeric(nvar)
# assert_numeric(nvar, allow_na = FALSE)
#
# assert_numeric(nvar2)
# assert_numeric(nvar2, allow_na = FALSE)
#
#
# #####
# #
# # YAML formating
# #
# #####
#
#
#
#
#
# yam1 <- yaml.load_file("./spec1.yml")
# yam2 <- yaml.load_file("./spec2.yml")
# yam3 <- yaml.load_file("./spec3.yml")
# yam4 <- yaml.load_file("./spec4.yml")
#
#
# ####################################
#
# DAT <- data.frame(
#     stringsAsFactors = F ,
#     lgl_var1 = c( T,F ,T , T , NA) ,
#     lgl_var2 = c( T,F ,T , "T" , NA) ,
#     num_var1 = c( 1,2,3,4,5),
#     num_var2 = c( 1,2,3,4,NA),
#     char_var1 = c( "hi" , "hello", "how do" ,"hover" , "hoover"),
#     char_var2 = c( "hi" , "hello", "how do" ,"are" , NA)
# )
#
#
# spec <- "
# vars:
#     - lgl_var1
#     - lgl_var2
#
# vars_numeric:
#     - char_var1
# "
# assert_spec( DAT , spec)
#
# assert_spec( DAT , file = "./spec1.yml")
#
# assert_spec( DAT , file = "./spec2.yml")
#
# assert_spec( DAT , file = "./spec3.yml")
#
# assert_spec( DAT , file = "./spec4.yml")
#
# assert_spec( DAT , file = "./spec5.yml")
#
#
#
#
#
# spec <- "
# vars_character:
#     char_var2:
#         allow_na: False
#         re_format: '^.*$'
# "
#
# assert_spec( DAT , spec )
#
#
#
#
#
#
#
