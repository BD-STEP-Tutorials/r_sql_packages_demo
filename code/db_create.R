setwd('/workspaces/R_SQL_Demo/data')

library(DBI)

patients <- read.csv('patients.csv', header=TRUE, sep = ",")
encounters <- read.csv('encounters.csv', header=TRUE, sep = ",")

setwd('/workspaces/R_SQL_Demo/database')

mydb <- dbConnect(RSQLite::SQLite(), "synthetic.db")

dbWriteTable(mydb, "synthetic.patients", patients, overwrite=TRUE)
dbWriteTable(mydb, "synthetic.encounters", encounters, overwrite=TRUE)

dbDisconnect(mydb)
