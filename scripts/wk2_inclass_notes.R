id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')
# -------------------------------------------------------------------

# What is my working directory
getwd()

## ACTIVITY ---
# 1. Use the ABSOLUTE (full) filepath to list the files in your in class Rproject data folder
## THIS VERSION OF FILEPATHS IS UNNECC.
list.files(path = "/Users/lizawood/Desktop/R-DAVIS-2022/r-davis-in-class-project-liza-wood/data/")
# 2. Write the RELATIVE filepath (relative to your working directory) to list the files in your in class Rproject data folder
list.files(path = "data")
?list.files()
# ----

# add scripts folder
?dir.create
# the path needs to be character
# This does not work
scripts = 3
dir.create(path = scripts)
# quotes mean character
dir.create(path = "scripts")

ngRok::livestream_stop(id)









