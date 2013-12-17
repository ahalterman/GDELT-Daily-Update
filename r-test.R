library(dplyr)
library(RSQLite)
library(RSQLite.extfuns)
# library(gdeltr)
library(ggplot2)

gdelt.db <- src_sqlite("~/gdelt.db")
daily.db <- tbl(gdelt.db,"GDELT_DAILYUPDATES")
hist.db <- tbl(gdelt.db,"GDELT_HISTORICAL")


print("GDELT Daily Report")
print("SQLite Database Update for")
Sys.time()
today <- as.character(Sys.Date())
today <- as.numeric(gsub("-", "", today))
eightdays <- as.character(Sys.Date()- as.difftime(8, unit = "days"))
eightdays <- as.numeric(gsub("-", "", eightdays))
summarise(group_by(filter(select(daily.db, SQLDATE), SQLDATE > eightdays), SQLDATE), count=n())

