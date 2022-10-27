id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')

# Homework review: -----
## 1. Create a new data frame called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. The dataframe should be sorted by values in the Control plot type column.
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
summary_table <- surveys %>% 
  group_by(plot_type, genus) %>% 
  dplyr::summarize(mean_hfl = mean(hindfoot_length, na.rm = T)) # use :: to call on a specific package
summary_table
surveys_wider <- summary_table %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hfl) %>% 
  arrange(-Control)
surveys_wider


## 2. Use both ifelse() and case_when() to calculate a new weight category variable called weight_cat. For this variable, define the rodent weight into three categories: “small” is less than or equal to the 1st quartile, “medium” is between the 1st and 3rd quartile, and “large” is any weight greater than or equal to the 3rd quartile. What happens to NAs?

summary(surveys$weight)

surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20 ~ "small",
    weight > 20 & weight < 48 ~ "medium",
    is.na(weight) ~ NA_character_,
    T ~ "large"))

surveys_cw %>% 
  group_by(weight_cat) %>% 
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))

surveys_cw %>% 
  filter(is.na(weight)) %>% 
  select(weight, weight_cat) %>% 
  head()

# ifelse: binary only, so you need to nest the function, requires a final "no" argument; does not assign NAs into that final category



# Intro to ggplot -----
# bit.ly/3TEZ2Jd

## 3 parts of a ggplot:
## (1) ggplot(data = <DATA>, (2) mapping = aes(<MAPPINGS>) + 
##    (3) <GEOM_FUNCTION>()


## The basic idea:
ggplot(surveys_cw, aes(x = weight_cat, y = hindfoot_length)) +
  geom_boxplot()


## Geoms (and many other things) can be layered 
ggplot(surveys_cw, aes(x = weight_cat, y = hindfoot_length)) +
  geom_boxplot() +
  geom_jitter()

## Layer order matters

ggplot(surveys_cw, aes(x = weight_cat, y = hindfoot_length)) +
  geom_jitter() +
  geom_boxplot()


## Aesthetics are mobile!
ggplot(surveys_cw, aes(x = weight_cat, 
                       y = hindfoot_length,
                       color = plot_type)) +
  geom_jitter() +
  geom_boxplot()

ggplot(surveys_cw, aes(x = weight_cat, 
                       y = hindfoot_length)) +
  geom_jitter() +
  geom_boxplot(aes(color = plot_type))


## Features that relate directly to the data go in the aes() function, all else are their own arguments within the geoms

ggplot(surveys_cw, aes(x = weight_cat, 
                       y = hindfoot_length)) +
  geom_jitter() +
  geom_boxplot(color = "red")

surveys %>% 
  filter(species_id == c("NL","PF")) %>% 
  select(species_id) %>% 
  tail()

surveys %>% 
  filter(species_id %in% c("NL","PF")) %>%
  ggplot(aes(x = species_id,
             y = hindfoot_length)) +
  geom_jitter(aes(color = as.factor(plot_id))) +
  geom_boxplot()
ngRok::livestream_stop(id)





