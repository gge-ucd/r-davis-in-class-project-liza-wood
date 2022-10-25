## Data Visualization Part1 a
# Goals: Introduction ggplot package, scatter plots and boxplots
library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(!is.na(weight) & !is.na(hindfoot_length))

## General format: 
## ggplot(data = <DATA>, mapping = aes(<MAPPINGS>) + 
##    <GEOM_FUNCTION>()

## blank canvas
ggplot(data = surveys)

# Example geoms:
## geom_point() for scatter plots (continuous x continuous variables)
## geom_boxplot() for boxplots (categorical x continuous variables)
## geom_line() for trend lines

# add aes for 'mapping coordinates'
ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length))

# add layer for geom
base_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length))

# adding plot elements: transparency = alpha, color = color, infill = fill
base_plot +
  geom_point(alpha = .2, color = "tomato")
base_plot +
  geom_point(alpha = .2, fill = "tomato")
# fill acts differently depending on geom

# color based on the data itself
base_plot +
  geom_point(mapping = aes(color = species_id))
# to include info about data, must be inside aesthetic mapping

# geom_boxplot: cat x cont

ggplot(data = surveys, mapping = aes(x = species_id, y = weight)) +
  geom_point(alpha = 0.1) +
  geom_boxplot(color = "tomato")



  








