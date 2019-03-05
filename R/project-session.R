#Note to yourself.

# object assignment
weight_kilos<- 100
weight_kilos

# vector is a string of things
#charater vector
c("a", "b")
#number vectors
c(1,2)
1:10

#dataframe
# these show you the dataset
head(iris)

colnames(iris)
str(weight_kilos)
str(iris)
summary(iris)


# Data-wrangling ----------------------------------------------------------


# Exercise 2 ---------------------------------------------------------
#Using the style guide in the link, try to make these code more readable.
#Copy and paste these text into the R/project-session.R file. The code below is
#in some way either wrong or incorrectly written. Edit the code so it follows the
#correct style and so it’s easier to understand and read. You don’t need to
#understand what the code does, just follow the guide.

# Object names
#DayOne
#dayone
day_one
#Dont use funktions as names.T is an existing name for true. the same gors for c

T <- FALSE
c <- 9
mean <- function(x) sum(x)

# Spacing
#Always space after comma
#x[,1]
x[ ,1]
#x[ , 1]
mean (x, na.rm = TRUE)
#mean( x, na.rm = TRUE )
function (x) {}
function(x){}
height<-feet*12+inches
mean(x, na.rm=10)
sqrt(x ^ 2 + y ^ 2)
df $ z
x <- 1 : 10

# Indenting
if (y < 0 && debug)
  message("Y is negative")

summing <- function(a, b) {
add_numbers <- a + b
return(add_numbers)
}

usethis::use_r("package_loading")

source(here::here("R/package_loading.R"))
write.csv(iris, here::here("data/iris.csv"))

#starting with a ? will bring up the help file
?write.csv


