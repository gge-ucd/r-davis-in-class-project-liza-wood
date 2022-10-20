library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
tail <- read_csv("data/tail_length.csv")
summary(tail)
summary(surveys$record_id) 

# ---- Joining two data sets ----
# join_type(x = first/left data, 
#           y = second/right data, 
#           by = "column to join by")

# I want to take the tail data and join to to the surveys data so that we have one more column.
surveys_joined <- left_join(surveys, tail, by = "record_id") 
# if you don't specify it will look for shared column names, which can be good or bad, so be careful.
# Lots more to explore here...

# ---- Pivoting (or reshaping) data ----
# Our data is tidy: one row = one observation
# But we may want to shape the data differently in order to create different summary tables (and later this will become relevant with plotting)

# GOAL: compare the different mean weight of each species between plots. So we'd want genus name on the left hand side, and columns to be different plot numbers, with mean weight inside them.

# Last week we tapped into the power of group_by and summarize, and we can get the values we are interested in:
surveys_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight)) 
surveys_weight

# But I want to reshape it! more columns, fewer rows = wider
length(unique(surveys_weight$genus)) # we'd expect 10 rows
length(unique(surveys_weight$plot_id)) # and 24 columns
# pivot_wider(data, 
#             names_from = the single column that has the thing you want to be your new column names,
#             values_from = the single column that has the values that you want inside your table cells)

weights_wide <- pivot_wider(data = surveys_weight,
                            names_from = "plot_id", 
                            values_from =  "mean_weight")

# pivot_longer does the opposite, it lengthens your data: more rows, fewer columns
#pivot_longer(data,
#             cols = the columns that you want to stack on top of one another,
#             names_to = the new column name where you want to store the old/wide column names,
#             values_to = the new column name where you want to store the old/wide column values)

surveys_long <- pivot_longer(data = weights_wide,
                             #cols = 2:ncol(.), # could also do
                             #cols = 1:24, # don't name your columns numbers
                             cols = `1`:`24`,
                             names_to = "plot_id", 
                             values_to = "mean_weight")









