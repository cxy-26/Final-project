
# load data

here::i_am("code/data_cleaning.R")

data <- read.csv(here::here("data/NACC_AF_Data_Long.csv"))

# label variables
library(Hmisc)
label(data$NACCAGEB) <- "Age at initial visit"
label(data$NACCAGE)  <- "Age at current visit"
label(data$EDUC)     <- "Education (years)"
label(data$MARISTAT) <- "Marital status"
label(data$marry)    <- "Marital status (5 groups)"
label(data$NACCNINR) <- "Race"
label(data$race)     <- "Race (3 groups)"
label(data$HISPANIC) <- "Hispanic/Latino ethnicity"
label(data$COGSTAT)  <- "Clinician judged cognitive status"
label(data$NORMCOG)  <- "Normal cognition"
label(data$DEMENTED) <- "Demented"
label(data$NACCUDSD) <- "Cognitive function"
label(data$NACCTMCI) <- "Mild cognitive impairment (MCI) type"
label(data$IMPNOMCI) <- "Cognitively impaired, not MCI"
label(data$PM)       <- "Pacemaker"
label(data$SLEEP_APNEA) <- "Sleep apnea"
label(data$NACCAMD)  <- "Total number of meds"
label(data$NACCAHTN) <- "Anti-HTN meds"
label(data$NACCHTNC) <- "Combo anti-HTN meds"
label(data$NACCACEI) <- "ACE inhibitors"
label(data$NACCBETA) <- "Beta blocker"
label(data$NACCCCBS) <- "CA++ channel bloker"
label(data$NACCDIUR) <- "Diuretic"
label(data$NACCVASD) <- "Vasodilator"
label(data$NACCANGI) <- "ARBs"
label(data$NACCADEP) <- "Antidepressant"
label(data$NACCAC)   <- "Anticoagulant or antiplatelet agent"
label(data$NACCADMD) <- "AD meds"
label(data$NACCDBMD) <- "DM meds"
label(data$NACCDIED) <- "Subject known to be deceased"
label(data$AGEDIED)  <- "Age at death"
label(data$NACCNMRI) <- "Total number of MRI sessions"
label(data$NACCMRSA) <- "At least one MRI sessions"
label(data$NACCNAPA) <- "Total number of amyloid PET scan"
label(data$NACCAPSA) <- "At least one amyloid PET scan"
label(data$NACCACSF) <- "One or more measures of A??1???42 reported"
label(data$NACCPCSF) <- "One or more measures of P-tau181P"
label(data$NACCTCSF) <- "One or more measures of T-tau"
label(data$NACCAUTP) <- "Neuropathology data from autopsy available"
label(data$NPGRCCA)  <- "Cerebral cortex atrophy"
label(data$NPWBRWT)  <- "Whole brain weight (grams)" 

label(data$NACCMMSE) <- "MMSE (0-30)"
label(data$MOCATOTS) <- "MoCA Total Raw Score (0-30)"
label(data$DIGIF)    <- "WMS-R Digit span forward  trials correct (0-14)"
label(data$DIGIFLEN) <- "WMS-R Digit span forward length (0-8)"
label(data$DIGIB)    <- "WMS-R Digit span backward trials correct (0-14)"
label(data$DIGIBLEN) <- "WMS-R Digit span backward length (0-8)"
label(data$WAIS)     <- "WAIS-R Digit Symbol test (0-99)"
label(data$TRAILA)   <- "TMT Part A (0-150 sec)"
label(data$TRAILB)   <- "TMT Part B (0-300 sec)"
label(data$MEMUNITS) <- "Logical Memory IIA (Delayed) no. of story units recalled (0-25)"
label(data$MEMTIME)  <- "Logical Memory IIA (Delayed) time elapsed since IA ??? Immediate (0-85)"
label(data$LOGIMEM)  <- "No. of story units recalled from current test (0-25)"
label(data$LOGIPREV) <- "Total score from the previous test (0-25)"
label(data$ANIMALS)  <- "No. of animals named in 60 sec"
label(data$VEG)      <- "No. of vegetables named in 60 sec"
label(data$BOSTON)   <- "Boston naming test score (0-30)"
label(data$MEMORY)   <- "Memory"
label(data$ORIENT)   <- "Orientation"
label(data$JUDGMENT) <- "Judgment"
label(data$COMMUN)   <- "Community affairs"
label(data$HOMEHOBB) <- "Home and hobbies"
label(data$PERSCARE) <- "Personal care"
label(data$CDRSUM)   <- "Standard CDR sum of boxes"
label(data$CDRGLOB)  <- "Global CDR"
label(data$COMPORT)  <- "Behavior, comportment, and personality"
label(data$CDRLANG)  <- "Language"

data$AF <- factor(data$AF, levels=c(0,1), labels=c("No","Yes"))

baseline = data[data$visit==1,]

saveRDS(
  baseline,
  here::here("output/baseline.rds")
)

library(dplyr)
newdata <- data[ which(data$n>=4), ] %>% select(c("NACCID", "AF", "fudays", "NACCMMSE", "MOCATOTS"))

saveRDS(
  newdata,
  here::here("output/newdata.rds")
)