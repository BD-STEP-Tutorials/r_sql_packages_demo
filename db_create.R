setwd('workspaces/R_SQL_Demo')

library(DBI)

mydb <- dbConnect(RSQLite::SQLite(), "synmedical.db")

dbGetQuery(mydb, 'SELECT * FROM people')

