
# 4 topics:
## Reading in data
## Summarizing data frames
## Indexing data frames
## Tidyverse

surveys <- read.csv("data/portal_data_joined.csv",
                    stringsAsFactors = F)
?read.csv
View(surveys)

# What is structure of the data
str(surveys)
typeof(surveys$sex)

# How many species are in the data
unique(surveys$species) # lists all the species
length(unique(surveys$species))
table(surveys$species) # looks like 40 because some have no species name t and there are 2 hispus
table(surveys$species)
length(unique(surveys$species_id))


# indexing 2 dimensions [row, column]
surveys[5,7] # 5th row, 7th column
# rows 1-10 and column 1-10
surveys[1:10, 1:10]
# Index by name rather than number. Why? More flexible to modification
surveys[ ,"species_id"]
# $ to call upon a column
surveys$record_id[5]

surveys200 <- surveys[200,]
surveys[200]
# default dimension is column
head(surveys[1])
surveys["record_id"]
surveys[,1]
nrow(surveys)
surveyslast <- surveys[34786, 1:13]
# can we make this stronger?
surveyslast <- surveys[nrow(surveys), 1:13]
surveyslast

