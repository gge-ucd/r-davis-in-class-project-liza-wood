library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

# 1. 
summary_table <- surveys %>% 
  group_by(genus, plot_type) %>% 
  summarise(mean_hfl = mean(hindfoot_length, na.rm = T)) 
surveys_wide <- summary_table %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hfl) %>% 
  arrange(-Control)

surveys_wide

# 2. 
summary(surveys$weight)

# Note: There was a typo in the hw answers (> instead of <), it is now fixed 
# case_when()
surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    T ~ "large"
  ))

# Check your work
surveys_cw %>% 
  group_by(weight_cat) %>% 
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))

# What happened to observations where we had NA for weight?
surveys_cw %>% 
  filter(is.na(weight)) %>% 
  select(weight, weight_cat) %>% 
  head()

# case_when() last argument lumps NAs in with it (boo)
surveys_cw <- surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    weight >= 48.00 ~ "large",
    T ~ NA_character_
  ))

surveys_cw %>% 
  group_by(weight_cat) %>% 
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))

surveys_cw %>% 
  filter(is.na(weight)) %>% 
  select(weight, weight_cat) %>% 
  head()

q1 <- summary(surveys$weight)[[2]]
q3 <- summary(surveys$weight)[[5]]
q1 <- quantile(surveys$weight, probs = .25, na.rm = T)
q3 <- quantile(surveys$weight, probs = .75, na.rm = T)

surveys_ife <- surveys %>% 
  mutate(weight_cat = ifelse(weight <= q1, "small",
                      ifelse(weight > q1 & weight < q3, 
                             "medium","large")))

surveys_ife %>% 
  group_by(weight_cat) %>% 
  summarize(min = min(weight, na.rm = T),
            max = max(weight, na.rm = T))

surveys_ife %>% 
  filter(is.na(weight)) %>% 
  select(weight, weight_cat) %>% 
  head()

# VISUALZATION IS EXCITING BECAUSE IT IS HOW WE COMMUNICATE THINGS MOST EFFECTIVELY. 

# THIS WEEK WE FOCUS ON THE MECHANICS OF PLOTS AND NEXT WEEK WE GET MORE INTO PRINCIPLES OF GOOD VISUAL COMMUNICATION


# 3 parts of a ggplot:
## (1) ggplot(data = <DATA>, (2) mapping = aes(<MAPPINGS>) + 
##    (3) <GEOM_FUNCTION>()

# Basic idea
ggplot(surveys_cw, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_boxplot()

# Geoms (and many other things) can be layered 
ggplot(surveys_ife, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_boxplot() +
  geom_jitter(alpha = .5) # points overlap a lot -- jitter can help

# Layer order matters
ggplot(surveys_ife, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_jitter(alpha = .5) + 
  geom_boxplot()

# Aesthetics are mobile!
ggplot(surveys_ife, aes(x = weight_cat, y = hindfoot_length, color = plot_type)) + 
  geom_jitter(alpha = .5) +
  geom_boxplot()

# What if I just wanted the boxes to be colors?
ggplot(surveys_ife, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_jitter(alpha = .5) +
  geom_boxplot(aes(color = plot_type))

# Features that relate directly to the data go in the aes() function, all else are just stand-alone arguments
ggplot(surveys_ife, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_jitter(alpha = .5) +
  geom_boxplot(fill = "darkgreen")


surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

yearly_counts <- surveys_complete %>% 
  count(year, species_id)

g <- ggplot(data = yearly_counts)
g + geom_point(mapping = aes(x = year, y = n))
g + geom_point(mapping = aes(x = year, y = n)) +
  geom_path(mapping = aes(x = year, y = n,
                          color = species_id))
g + geom_path(mapping = aes(x = year, y = n, 
                          color = species_id,
                          linetype = sex))
