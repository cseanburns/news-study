setwd("~/workspace/news-study/")
source("scripts/libraries.R")
rm(list = ls())

### NY Times
# Import Data
nytimes <- read_sav("data/1-spring2019-nytimes.sav")

# Keep only completed surveys
nytimes <- nytimes %>% filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
nytimes <- nytimes %>% filter(Q3_1 >= 2)
# Keep only data columns
nytimes <- nytimes %>% select(starts_with("Q"))

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

fit.nytimes.lm <- lm(nytimes$Q44 ~ nytimes$Q11 + nytimes$Q21_1 +
                        nytimes$Q26 + nytimes$Q28 + 
                        nytimes$Q32 + nytimes$Q34 +
                        nytimes$Q43_1 + nytimes$Q40)

summary(fit.nytimes.lm)
forest_model(fit.nytimes.lm)
round(confint(fit.nytimes.lm, level = 0.95), 2)

#stargazer(fit.nytimes.lm, fit.fox.lm, fit.apnews.lm, fit.npr.lm, type = "html", out = "test.doc")
