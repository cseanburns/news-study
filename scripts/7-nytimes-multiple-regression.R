# Don't assume set even after running Anovas
setwd("~/workspace/news-study/")
# Don't assume packages are loaded even after running Anovas
source("scripts/0-libraries.R")
# Clear environment if full of Anova data
rm(list = ls())

### NY Times
# Import Data
nytimes <- read_sav("data/1-spring2019-nytimes.sav")

# Keep only completed surveys
nytimes <- nytimes %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
nytimes <- nytimes %>% dplyr::filter(Q3_1 >= 2)

# Keep only needed columns
nytimes <- nytimes %>%
  dplyr::select(Q11, Q21_1, Q26, Q28, Q32, Q34, Q40, Q43_1, Q44)

nytimes$Q11 <- factor(nytimes$Q11,
                      levels = c(1, 2),
                      labels = c("Yes",
                                 "No"),
                      ordered = FALSE)

nytimes$Q21_1 <- factor(nytimes$Q21_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

nytimes$Q26 <- factor(nytimes$Q26,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

nytimes$Q28 <- factor(nytimes$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
 
nytimes$Q32 <- factor(nytimes$Q32,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

nytimes$Q34 <- factor(nytimes$Q34,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

nytimes$Q40 <- factor(nytimes$Q40,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)

nytimes$Q43_1 <- factor(nytimes$Q43_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

fit.nytimes.lm <- lm(Q44 ~ Q11 +
                     Q21_1 +
                     Q26 +
                     Q28 + 
                     Q32 +
                     Q34 +
                     Q43_1 +
                     Q40,
                   data = nytimes)

summary(fit.nytimes.lm)
round(confint(fit.nytimes.lm, level = 0.95), 2)
