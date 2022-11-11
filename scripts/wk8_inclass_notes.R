id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')

# Function-writing ----
## What is a function? 
## A series of commands/code wrapped into another command. Can be simple or complex. Almost all R is based on functions.


## Who gets to write functions?
## Anyone! Fancy coders put those functions in packages and host them on CRAN, but anyone can write a function and store it in their global environment


## How to write a function?
## 1. name it
## 2. assign it to do something using placeholders using curly brackets
## 3. deploy with the function function()

# convert 75 F to Kelvin
K <- ((75 - 32) * (5 / 9)) + 273.15

FtoK <- function(x){
  K <- ((x - 32) * (5 / 9)) + 273.15
  return(K)
}

FtoK(x = 75)


# Challenge: https://gge-ucd.github.io/R-DAVIS/lesson_13_functions.html#Challenge9

## Code for setting up challenge is redundant. Could do either option and it would work --
## Option A:
d <- gapminder::gapminder
# looks inside gapminder package without loading it into the library
## Option B:
library(gapminder)
d <- gapminder # it knows where gapminder is because we loaded in the library

#Write a new function that takes two arguments, the gapminder data
#.frame (d) and the name of a country (e.g. "Afghanistan"), and plots #a time series of the country’s population. The return value from the #function should be a ggplot object. Note: It is often easier to #modify existing code than to start from scratch. To start out with #one plot for a particular country, figured out what you need to #change for each iteration (these will be your arguments), and then #wrap it in a function.

d <- gapminder::gapminder
library(tidyverse)
pop <- function(x){
  thing_not_of_int <- 2 + 2
  thing_of_interest <- d %>% 
    filter(country == x) %>% 
    ggplot(aes(year, pop)) +
    geom_point() +
    geom_line() +
    theme_bw()
  return(thing_of_interest)
}

pop("Albania")

countries <- unique(d$country)

for(i in countries){
  print(i)
}

for(i in countries[1:20]){
  plot <- pop(i)
  print(plot)
}








## What if I wanted to add a title?






# Iteration -----
## Ieration = running the same function across multiple values (there are various iteration tools)


## Run this function over every country. 
## What are the countries?






