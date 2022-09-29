#devtools::install_github("tylerandrewscott/ngRok")

id <- ngRok::livestream_start(port = 8080, 
                              hostname = "www.rdaviscode.com",
                              password = 'nifflers', 
                              user = 'rdavis', scheme = 'http')


ngRok::livestream_stop(id)
