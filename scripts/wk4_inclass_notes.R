id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')

# -------------------------------------------------------


library(tidyverse)
surveys_t <- read_csv("data/portal_data_joined.csv")

# mutate -- create new columns, many at a time, separate by commas
colnames(surveys_t)
surveys_t <- surveys_t %>% 
  mutate(weight_length_ratio = weight/hindfoot_length,
         weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)


# group_by and summarize
## group_by signals our categories  to summarize by
## summarize: what to do with those groupings

str(surveys_t)

# what's the biggest hindfoot length:
# group by characters
surveys_summary <- surveys_t %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length))
surveys_summary

# 2 ways to remove NAs here:
surveys_t %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length, na.rm = T)) # remove nas inside function

# summary functions: mean, median, min, max

surveys_t %>% # take the surveys object
  group_by(species_id) %>% # group by species id
  summarize(max(hindfoot_length)) %>% # take max
  na.omit() # this removes the NAs from the final product

surveys_t %>% 
  na.omit() %>% 
  group_by(species_id) %>% 
  summarize(max(hindfoot_length))

# omitting NA: na.omit and complete.cases can be more powerful than you think

nrow(surveys_t)
surveys_omit <- surveys_t %>% 
  na.omit() 
nrow(surveys_omit)

surveys_filter <- surveys_t %>% 
  filter(!is.na(hindfoot_length))
nrow(surveys_filter)

# Weight of heaviest animal in each year. 3 columns: year, weigh of heaviest, and weigh in kg. Arrange in order

# which *type of animal* is the heaviest -- bad road
nrow(surveys_t)

surveys_t %>% 
  group_by(year) %>% # group then lives in the metadata
  summarize(max_weight = max(weight, na.rm = T)) %>%  # rm nas inside the function -- ti
  mutate(weight_kg = max_weight/1000)





# "in each year" = group_by year
# heaviest = max(weight)
# 3 columns: year, weight, weight in kg?? --> need to mutate












