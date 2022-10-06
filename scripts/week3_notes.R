id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')

# 4 topics:
## Reading in data
## Summarizing data frames
## Indexing data frames
## Tidyverse

surveys <- read.csv("data/portal_data_joined.csv")
View(surveys)


