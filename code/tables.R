# Tables

here::i_am("code/tables.R")

library(compareGroups)
library(dplyr)

baseline <- readRDS(here::here("output/baseline.rds"))

tab1 <- compareGroups(AF ~ SEX + NACCAGEB + NACCAGE + EDUC + MARISTAT + marry + 
                        NACCNINR + race + HISPANIC + COGSTAT + NORMCOG +DEMENTED + NACCUDSD + NACCTMCI +  
                        HTN + DM + STROKE + CAD + PM + CABG + CHF + SLEEP_APNEA + BMI + 
                        NACCAMD + NACCAHTN + NACCHTNC + 
                        NACCACEI + NACCBETA + NACCCCBS + NACCDIUR + 
                        NACCVASD + NACCANGI + 
                        NACCADEP + NACCAC + NACCADMD + NACCDBMD, 
                      data = baseline, 
                      method = c(NACCAMD = 2, BMI = 2))

table1 <- createTable(tab1, type = 2, 
                      hide = c(SEX = "Male"), 
                      hide.no = "no", 
                      show.n = TRUE)

saveRDS(
  table1,
  here::here("output/table1.rds"))

tab2 <- compareGroups(AF ~ NACCDIED + AGEDIED + NPGRCCA + 
                        NACCNMRI + NACCMRSA + NACCNAPA + NACCAPSA +
                        NACCACSF + NACCPCSF + NACCTCSF + NACCAUTP + NPWBRWT, 
                      data = baseline)

table2 <- createTable(tab2, type = 2,
                      hide.no = "no",
                      show.n = TRUE)

saveRDS(
  table2,
  here::here("output/table2.rds"))

tab3 <- compareGroups(AF ~ NACCMMSE + MOCATOTS + 
                        DIGIF + DIGIFLEN + DIGIB + DIGIBLEN + 
                        WAIS + TRAILA + TRAILB  + 
                        MEMUNITS + LOGIMEM + LOGIPREV + 
                        ANIMALS + VEG + BOSTON + 
                        MEMORY + ORIENT + JUDGMENT + COMMUN + HOMEHOBB + PERSCARE +
                        CDRSUM + CDRGLOB + COMPORT + CDRLANG, 
                      data = baseline, 
                      method = c(NACCMMSE=2,MOCATOTS=2,TRAILA=2,TRAILB=2,BOSTON=2))

table3 <- createTable(tab3, type = 2,
                      hide.no = "no",
                      show.n = TRUE) 

saveRDS(
  table3,
  here::here("output/table3.rds"))

data <- read.csv(here::here("data/NACC_AF_Data_Long.csv"))

first.stage = data %>% dplyr::filter (visit == 1 & n > 1 ) %>% select(NACCID, AF, NACCUDSD)
last.stage  = data %>% dplyr::filter (visit == n & n > 1 ) %>% select(NACCID, NACCUDSD, fudays)
first.last.stage = merge(first.stage, last.stage, by="NACCID", suffixes = c(".first",".last"), sort=TRUE) 
first.last.stage.table = round(100*table(first.last.stage[,c(3,4)])/sum(table(first.last.stage[,c(3,4)])),1)

saveRDS(
  first.last.stage.table,
  here::here("output/first.last.stage.table.rds")
)

first.stage = data %>% dplyr::filter (AF == "Yes" & visit == 1 & n > 1 ) %>% select(NACCID, AF, NACCUDSD)
last.stage  = data %>% dplyr::filter (AF == "Yes" & visit == n & n > 1 ) %>% select(NACCID, NACCUDSD, fudays)
first.last.stage = merge(first.stage, last.stage, by="NACCID", suffixes = c(".first",".last"), sort=TRUE) 
first.last.stage.table.af = round(100*table(first.last.stage[,c(3,4)])/sum(table(first.last.stage[,c(3,4)])),1)

saveRDS(
  first.last.stage.table,
  here::here("output/first.last.stage.table.af.rds")
)

first.stage = data %>% dplyr::filter (AF == "No" & visit == 1 & n > 1 ) %>% select(NACCID, AF, NACCUDSD)
last.stage  = data %>% dplyr::filter (AF == "No" & visit == n & n > 1 ) %>% select(NACCID, NACCUDSD, fudays)
first.last.stage = merge(first.stage, last.stage, by="NACCID", suffixes = c(".first",".last"), sort=TRUE) 
first.last.stage.table.noaf = round(100*table(first.last.stage[,c(3,4)])/sum(table(first.last.stage[,c(3,4)])),1)

saveRDS(
  first.last.stage.table,
  here::here("output/first.last.stage.table.noaf.rds")
)