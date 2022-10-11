library(tidyverse)
surveys_t <- read_csv("data/portal_data_joined.csv")

# In the last video you've have an introduction to tidyverse, where you've gone over selecting columns, filtered rows, now let's continue on to manipulating the data


# Mutate ----
colnames(surveys_t)
surveys_t$weight/1000

# mutate(new_name = manipulation of existing column)

# shortcut: Cmd + Shft + M

surveys_t2 <-  surveys_t %>% 
  mutate(weight_kg = weight/1000)
# look at the number of variables in surveys_t and surveys_t2
# can do multiple mutates at once

# Group by and summarize
?summarize
# use summarize with basic mathematical functions:
## mean, max, min, median, etc. -- make sure we remove NAs
surveys_t %>% 
  summarize(mean(weight, na.rm = T))

## As scientists, we want to know about summarize based on attributes of our study subject. The average value of something can be interesting, but really we want to see how that average value differs **between groups.** 

# This is where group_by function comes in
surveys_t %>% 
  group_by(sex) # nothing happens with group_by alone, must be paired with summarize

surveys_t %>% 
  group_by(sex) %>% 
  summarize(mean(weight, na.rm = T))

# Can do multiple
surveys_t %>% 
  group_by(sex) %>% 
  summarize(avg_weight = mean(weight, na.rm = T),
            max_weight = max(weight, na.rm = T))

# Group by multiple -- can start understanding all sorts of cross-tabs

surveys_t %>% 
  filter(!is.na(sex)) %>% 
  group_by(species_id, sex) %>% 
  summarize(avg_weight = mean(weight, na.rm = T)) 

# arrnge function I want to know species weights
surveys_t %>% 
  filter(!is.na(species_id)) %>% 
  group_by(species_id) %>% 
  summarize(avg_weight = mean(weight, na.rm = T)) 

# But even with na.rm = T we can see we don't have any weights for some species, which is annoting... 
  arrange(-avg_weight)

  