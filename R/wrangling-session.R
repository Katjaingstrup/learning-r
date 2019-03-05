# run everytime you start a new sesion

source(here::here("R/package_loading.R"))

#dofile
usethis::use_r("exercises-wrangling")

glimpse(NHANES)

NHANES - NHANES
view(NHANES)

#Exercise 1

# Load the packages
library(tidyverse)
library(NHANES)

# Check column names
colnames(NHANES)

# Look at contents
#structure
str(NHANES)
glimpse(NHANES)

# See summary of the whole dataset
summary(NHANES)

# Look over the dataset documentation
?NHANES

##########

colnames(NHANES)

NHANES %>% colnames(
# a standard way of chaining  functions together
  NHANES %>%
    head() %>%
    glimpse()


# Mutate function ---------------------------------------------------------

NHANES_Changed  <- NHANES %>%
  mutate(height = Height/100)

sum(NHANES_Changed$height)
str(NHANES_Changed$height)

#creates a new variable based on a condition


#create or replace mutible variables by using ","
NHANES_Changed <- NHANES_Changed%-%
  mutate(new_colum ="only one variable")
  hight=Height/100


# Exercise 2 --------------------------------------------------------------

  #1 Create a new variable called “UrineVolAverage” by calculating the average urine volumne
  #(from “UrineVol1” and “UrineVol2”).
  #2 Modify/replace the “Pulse” variable to beats per second (currently is beats per minute).
  #3 Create a new variable called “YoungChild” when age is less than 6 years.

  # Check the names of the variables
  colnames(NHANES)

  # Pipe the data into mutate function and:
  NHANES_modified <- NHANES %>% # dataset
    mutate(
      # 1. Calculate average urine volume
      UrineVolAvarage=(UrineVol1 + UrineVol2/2),
      # 2. Modify Pulse variable
      PulseSeconds = Pulse/60,
      # 3. Create YoungChild variable using a condition
      YoungChild = if_else(Age<6, TRUE, FALSE)
    )
  NHANES_modified


# To select specific data or collums of the data frame --------------------


#select  collums  / variabkes by name without Qotes
  NHANES_Charateristics < NHANES%<%
    select(Age, Gender, BMI)

  #to not select a variable use minus
  NHANES%<%
    select(-Head Circ)
#to select similar names, use "matching" functions
  NHANES%<%
    select(starts_with("BP"), contains("Vol"))
  ?select_helpers


#rename() renames specific colums
#rename using the form: "rename = oldname
  rename(numberBabies = nBabies)

# filter() = filtering/subsetting the data by row
  NHANES%<%
    filter(Gender == "female")

  filter(Gender != "female")

#when BMI is equal to
  NHANES%<%
    filter(BMI == 25)
#when BMI is under 25 or equal to
  filter(BMI<- 25)

#When BMII is 25 and gender female
  NHANES%<%
    filter(BMI == 25 & Gender == "female")

  #When BMII is 25 or gender female
  filter(BMI == 25 | Gender == "female")


# Arrange() sort or rearrange your data by colums -------------------------
  NHANES%<%
    arrange(Age) %>%
    select(Age)
#order decending
  NHANES%<%

# Exercise 3 --------------------------------------------------------------

 # Exercise: Filtering and logic, arranging, and selecting


  # Then start replacing the ___ with the appropriate code to complete the tasks below:

  #  Filter so only those with BMI more than 20 and less than 40 and keep only those with diabetes.
 # Filter to keep those who are working (“Work”) or those who are renting (“HomeOwn”) and those who do not have diabetes. Select the variables age, gender, work status, home ownership, and diabetes status.
  #Using sorting and selecting, find out who has had the most number of babies and how old they are.

  # To see values of categorical data
  summary(NHANES)

  # 1. BMI between 20 and 40 and who have diabetes
  NHANES %>%
    # format: variable >= number
    filter(BMI >= 20 & BMI <= 40 & Diabetes == "Yes")

  # 2. Working or renting, and not diabetes
  NHANES %>%
    filter(Work == Working | ___ == ___ & ___ == ___) %>%
    select(___)

  # 3. How old is person with most number of children.
  ___ %>%
    ___(___) %>%
    ___(___)


#  summarise() ------------------------------------------------------------

#summarise() by itself
  NHANES %>%
    summarise(MaxAge = max(Age, na.rm = TRUE),
              MeanBMI = mean(BMI, na.rm = TRUE))
# combined with group_by()

  NHANES %>%
    group_by(Gender,Diabetes) %>%
    summarise(MaxAge = max(Age, na.rm = TRUE),
              MeanBMI = mean(BMI, na.rm = TRUE))


# #gather():converting from wide to long form -----------------------------

  table4b
 table4b %>%
    gather(key = year, value = population, -country)

 # this does the same
 table4b %>%
   gather(key = year, value = population, `1999`, `2000`)

 # Keep only variables of interest
 nhanes_chars <- NHANES %>%
   select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)
 nhanes_chars

 #convert to long form excluding Gender year
 nhanes_long <- nhanes_chars %>%
   gather(Measure, Value, -SurveyYr, -Gender)
 nhanes_long

 # Calculate mean on each measure, by gender and year
 nhanes_long %>%
   group_by(SurveyYr, Gender, Measure) %>%
     summarise(MeanValues = mean(Value, na.rm = TRUE))


# #spread -----------------------------------------------------------------

table2
 table2 %>%
   spread(key = type, value = count)
