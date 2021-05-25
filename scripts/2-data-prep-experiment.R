setwd("~/workspace/news-study/")
rm(list = ls())
source("scripts/0-libraries.R")
source("scripts/1-functions.R")

###### NY Times Data
# Import data
nytimes <- read_sav("data/1-spring2019-nytimes.sav")

# Keep only completed surveys
nytimes <- nytimes %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
nytimes <- nytimes %>% dplyr::filter(Q3_1 >= 2)

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q47_First.Click: TREATMENT 1, No Meta
# Q46_First.Click: TREATMENT 2, No Pres
# Q45_First.Click: TREATMENT 3, No Meta/No Pres

# Keep only columns needed for ANOVA
nytimes_control <- nytimes %>%
  dplyr::filter(Q44_First_Click >= 0) %>%
  dplyr::select(Q44)
nytimes_treatment1 <- nytimes %>%
  dplyr::filter(Q47_First_Click >=0) %>%
  dplyr::select(Q44)
nytimes_treatment2 <- nytimes %>%
  dplyr::filter(Q46_First_Click >=0) %>%
  dplyr::select(Q44)
nytimes_treatment3 <- nytimes %>%
  dplyr::filter(Q45_First_Click >=0) %>%
  dplyr::select(Q44)

###### Fox Data
# Import data
foxnews <- read_sav("data/2-fall2019-fox.sav")

# Keep only completed surveys
foxnews <- foxnews %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
foxnews <- foxnews %>% dplyr::filter(Q3_1 >= 2)

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q47_First.Click: TREATMENT 1, No Meta
# Q46_First.Click: TREATMENT 2, No Pres
# Q45_First.Click: TREATMENT 3, No Meta/No Pres

# Keep only columns needed for ANOVA
fox_control <- foxnews %>%
  dplyr::filter(Q44_First_Click >= 0) %>%
  dplyr::select(Q44)
fox_treatment1 <- foxnews %>%
  dplyr::filter(Q47_First_Click >=0) %>%
  dplyr::select(Q44)
fox_treatment2 <- foxnews %>%
  dplyr::filter(Q46_First_Click >=0) %>%
  dplyr::select(Q44)
fox_treatment3 <- foxnews %>%
  dplyr::filter(Q45_First_Click >=0) %>%
  dplyr::select(Q44)

###### AP News Data
# Import Data
apnews <- read_sav("data/3-spring2020-ap.sav")

# Keep only completed surveys
apnews <- apnews %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
apnews <- apnews %>% dplyr::filter(Q3_1 >= 2)

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q47_First.Click: TREATMENT 1, No Meta
# Q46_First.Click: TREATMENT 2, No Pres
# Q45_First.Click: TREATMENT 3, No Meta/No Pres

# Keep only columns needed for ANOVA
apnews_control <- apnews %>%
  dplyr::filter(Q44_First_Click >= 0) %>%
  dplyr::select(Q44)
apnews_treatment1 <- apnews %>%
  dplyr::filter(Q47_First_Click >=0) %>%
  dplyr::select(Q44)
apnews_treatment2 <- apnews %>%
  dplyr::filter(Q46_First_Click >=0) %>%
  dplyr::select(Q44)
apnews_treatment3 <- apnews %>%
  dplyr::filter(Q45_First_Click >=0) %>%
  dplyr::select(Q44)

###### NPR Data
# Import data
npr <- read_sav("data/4-summer2020-npr.sav")

# Keep only completed surveys
npr <- npr %>% dplyr::filter(Finished == 1)

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q47_First.Click: TREATMENT 1, No Meta
# Q46_First.Click: TREATMENT 2, No Pres
# Q45_First.Click: TREATMENT 3, No Meta/No Pres

# Keep only columns needed for ANOVA
npr_control <- npr %>%
  dplyr::filter(Q44_First_Click >= 0) %>%
  dplyr::select(Q44)
npr_treatment1 <- npr %>%
  dplyr::filter(Q47_First_Click >=0) %>%
  dplyr::select(Q44)
npr_treatment2 <- npr %>%
  dplyr::filter(Q46_First_Click >=0) %>%
  dplyr::select(Q44)
npr_treatment3 <- npr %>%
  dplyr::filter(Q45_First_Click >=0) %>%
  dplyr::select(Q44)

