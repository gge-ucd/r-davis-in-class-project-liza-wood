library(tidyverse)
surveys_t <- read_csv('data/portal_data_joined.csv')

# mutate -- creating a new object/variable  
str(surveys_t)

surveys_t$weight/1000

# cmd + shift + m
# mutate(new_column_name = edit to exiting column)
surveys_t %>% 
  mutate(weight_kg = weight/1000) # with pipes, don't need specify data frame
  
# make sure to name a new object
surveys2 <- surveys_t %>% 
  mutate(weight_kg = weight/1000) 
surveys2$weight_kg  
  
# group by and summarize

# use math function to get summaries, but we need to remove the NAs
# remove NAs within function using rm.na = T
?mean
mean(surveys_t$weight, na.rm = T)

surveys_t %>% 
  summarize(max(weight, na.rm = T))

surveys_t %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = T), # name our columns
            max_weight = max(weight, na.rm = T))

# multiple group bys

surveys_t %>% 
  group_by(species_id, sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = T))

# cleaning this up

summary_table <- surveys_t %>% 
  filter(!is.na(sex)) %>% 
  group_by(species_id, sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = T)) %>% 
  arrange(mean_weight)






