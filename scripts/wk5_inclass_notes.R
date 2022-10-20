id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')


library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

# Join functions -----
## join_function(x = data1(left), y = data2 (right), by = join column)
tail <- read_csv("data/tail_length.csv")
# tidyverse way
surveysNL <- filter(surveys, species_id == "NL")
# base R way
surveysNL <- surveys[surveys$species_id == "NL",]
# combings logic -- sometimes this works and other it doesn't
# this does not
#surveysNL <- filter(surveys$species_id == "NL")

surveysNL_tail_left <- left_join(surveysNL, tail, by = "record_id")
nrow(surveysNL_tail_left) # has the length of surveys data
# Why? tails is appended to 'master', which we said is left
surveysNL_tail_right <- right_join(surveysNL, tail, by = "record_id")
nrow(surveysNL_tail_right)
head(surveysNL_tail_right)

# data %>% 
#   filter %>% 
#   select %>% 
#   mutate %>% 
#   left_join(newdat) # baseline is left
#   right_join(newdat) # bring in new data baseline all # in a pipe and baseline is right
?left_join



# Pivot functions ----
## pivot_wider(data, names_from = the column that has what will become the new column names,
##                   values_from = the column that has the values to fill out the cells)
## pivot_longer(data, cols = columns to lengthen (i.e. take all these and stack them), 
##                    names_to = create a new column name to call the column 
##                                 names from the columns in the cols argument,
##                    values_to = create a new column name to call the values in 
##                                the columns from the columns in the cols argument


# each year is a column, each row is a plot ID and inside the cells are the counts of genera (per plot, per year)
# count genera per plot per year

surveys %>% 
  group_by(year, plot_id) %>% 
  summarize(genus_count = n_distinct(genus)) %>% 
  pivot_wider(names_from = year, values_from = genus_count)

  
  
  




