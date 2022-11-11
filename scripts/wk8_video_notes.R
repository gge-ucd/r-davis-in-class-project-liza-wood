library(tidyverse)
# Function-writing ----
## Temperature conversion: F to Kelvin

((75 - 32) * (5/9)) + 273.15
((46 - 32) * (5/9)) + 273.15
((49 - 32) * (5/9)) + 273.15

# function 'function()` for function writiting
# 1. ientify what changes -- this is your argument
# 2. remove it from the code body, and place into the function funcion

F_to_K <- function(tempF){
  K <- ((tempF - 32) * (5/9)) + 273.15
  return(K)
}

k <- F_to_K(75)
F_to_K(46)
F_to_K(49)

## pass-by value: Where is K? it is kind of like a 'ghost' object -- it does not save into your global environmental, this is why you need to use the return() function

## Plotting example
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

table(surveys$species_id)

surveys %>% 
  filter(species_id == "PE" & !is.na(weight) & ! is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_jitter(alpha = .5) +
  labs(x = "Weight", y = "Hindfoot length", title = "PE weight x hindfoot") +
  theme_bw()

surveys %>% 
  filter(species_id == "PL" & !is.na(weight) & ! is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_jitter(alpha = .5) +
  labs(x = "Weight", y = "Hindfoot length", title = "PL weight x hindfoot") +
  theme_bw()

surveys %>% 
  filter(species_id == "SH" & !is.na(weight) & ! is.na(hindfoot_length)) %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_jitter(alpha = .5) +
  labs(x = "Weight", y = "Hindfoot length", title = "SH weight x hindfoot") +
  theme_bw()

plot_fx <- function(SPECIES, PLOTTITLE){
  plot <- surveys %>% 
    filter(species_id == SPECIES & !is.na(weight) & ! is.na(hindfoot_length)) %>% 
    ggplot(aes(x = weight, y = hindfoot_length)) +
    geom_jitter(alpha = .5, color = "blue") +
    labs(x = "Weight", y = "Hindfoot length", title = PLOTTITLE) +
    theme_bw()
  print(plot)
}

plot_fx("PL", "PL weight x hindfoot")
plot_fx("SH", "SH weight x hindfoot")







# Iteration -----
## Ieration = running the same function across multiple values (there are various iteration tools)

## Let's say we want to plot all of the species that have more than 20 observations once we remove NAs for weight and hfl
