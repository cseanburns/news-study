setwd("~/workspace/news-study/")
source("scripts/libraries.R")

###### NY Times Data
# Import data
nytimes <- read_sav("data/1-spring2019-nytimes.sav")

# Keep only completed surveys
nytimes <- nytimes %>% filter(Finished == 1)
# Keep only data columns
nytimes <- nytimes %>% select(starts_with("Q"))

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

nytimes_control <- nytimes %>% filter(Q44_First_Click >= 0)
nytimes_treatment1 <- nytimes %>% filter(Q45_First_Click >=0)
nytimes_treatment2 <- nytimes %>% filter(Q46_First_Click >=0)
nytimes_treatment3 <- nytimes %>% filter(Q47_First_Click >=0)

# Remove columns that identify treatment groups; not necessary now
nytimes_control <- nytimes_control %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'),
         -Q45___Topics)
nytimes_treatment1 <- nytimes_treatment1 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'),
         -Q45___Topics)
nytimes_treatment2 <- nytimes_treatment2 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'),
         -Q45___Topics)
nytimes_treatment3 <- nytimes_treatment3 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'),
         -Q45___Topics)

###### Fox Data
# Import data
foxnews <- read_sav("data/2-fall2019-fox.sav")

# Keep only completed surveys
foxnews <- fox %>% filter(Finished == 1)
# Keep only data columns
foxnews <- fox %>% select(starts_with("Q"))

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

fox_control <- foxnews %>% filter(Q44_First_Click >= 0)
fox_treatment1 <- foxnews %>% filter(Q45_First_Click >=0)
fox_treatment2 <- foxnews %>% filter(Q46_First_Click >=0)
fox_treatment3 <- foxnews %>% filter(Q47_First_Click >=0)

# Remove columns that identify treatment groups; not necessary now
fox_control <- fox_control %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
fox_treatment1 <- fox_treatment1 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
fox_treatment2 <- fox_treatment2 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
fox_treatment3 <- fox_treatment3 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))

###### AP News Data
# Import Data
apnews <- read_sav("data/3-spring2020-ap.sav")

# Keep only completed surveys
apnews <- apnews %>% filter(Finished == 1)
# Keep only data columns
apnews <- apnews %>% select(starts_with("Q"))

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

apnews_control <- apnews %>% filter(Q44_First_Click >= 0)
apnews_treatment1 <- apnews %>% filter(Q45_First_Click >=0)
apnews_treatment2 <- apnews %>% filter(Q46_First_Click >=0)
apnews_treatment3 <- apnews %>% filter(Q47_First_Click >=0)

# Remove columns that identify treatment groups; not necessary now
apnews_control <- apnews_control %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
apnews_treatment1 <- apnews_treatment1 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
apnews_treatment2 <- apnews_treatment2 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
apnews_treatment3 <- apnews_treatment3 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))

###### NPR Data
# Import data
nrp <- read_sav("data/4-summer2020-npr.sav")

# Keep only completed surveys
npr <- npr %>% filter(Finished == 1)
# Keep only data columns
npr <- npr %>% select(starts_with("Q"))

# Partition data into treatment groups
# Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

npr_control <- npr %>% filter(Q44_First_Click >= 0)
npr_treatment1 <- npr %>% filter(Q45_First_Click >=0)
npr_treatment2 <- npr %>% filter(Q46_First_Click >=0)
npr_treatment3 <- npr %>% filter(Q47_First_Click >=0)

# Remove columns that identify treatment groups; not necessary now
npr_control <- npr_control %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
npr_treatment1 <- npr_treatment1 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
npr_treatment2 <- npr_treatment2 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
npr_treatment3 <- npr_treatment3 %>%
  select(-ends_with('First_Click'), -ends_with('Last_Click'),
         -ends_with('Page_Submit'), -ends_with('Click_Count'))
