## Data Visualization Part1 a
# Goals: Introduction ggplot package, scatter plots and boxplots
library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(!is.na(weight) & !is.na(hinfoot_length))