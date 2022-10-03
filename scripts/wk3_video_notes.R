# Goals:
## Using the read.csv() function to read in data
## Explore and subset data frames
## Packages and base R vs the tidyverse

# Read in data
surveys <- read.csv(file = "data/portal_data_joined.csv")

# inspecting the data (nrow and ncol)
nrow(surveys)
ncol(surveys)

# what kind of data is surveys
class(surveys)
View(surveys)
typeof(surveys)

# looking at the top or bottom of the data
surveys # this is long and can freeze R if data is too large
head(surveys)
tail(surveys)
?head
head(surveys, n = 10)

# look at the structure and summary
str(surveys)
summary(surveys)

# Indexing
## extracting data 2-dimensions: rows and columns
## data.frame[row, column]

surveys[1,1]
surveys[1,6]
# indexing has dimensions, but if not specified with a comma, it will default to the column dimension
surveys[6]
surveys[,6] # nothing in one of the dimensions mean "everything"

# Signs or "operators" for helping us subset
## : represents a range
## - subtracts
## Remember: c() helps us list values in a vector
surveys[1:6,] # rows 1-6, all columns
surveys[-1:6,] # this throws an error
surveys[-(1:6),]
surveys[-1,] # remove only row 1
surveys[,3]

# Indexing by column name
colnames(surveys)
surveys[,"day"] # easier to identify the output AND is resilient to changing column position
# the $ can extract a column
surveys$day

# Loading the tidyverse
# install.packages("tidyverse")
library(tidyverse)

surveys_t <- read_csv(file = "data/portal_data_joined.csv")
# Tidyverse read_csv reads in data as a "tibble", which is a special data frame
class(surveys_t)
class(surveys)

head(surveys_t)
head(surveys)















