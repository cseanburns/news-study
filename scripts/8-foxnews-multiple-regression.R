setwd("~/workspace/news-study/")
source("scripts/0-libraries.R")
rm(list = ls())

### Fox News
# Import Data
foxnews <- read_sav("data/2-fall2019-fox.sav")

# Keep only completed surveys
foxnews <- foxnews %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
foxnews <- foxnews %>% dplyr::filter(Q3_1 >= 2)
# Keep only data columns
foxnews <- foxnews %>% dplyr::select(starts_with("Q"))

foxnews$Q11 <- factor(foxnews$Q11,
                      levels = c(1, 2),
                      labels = c("Yes",
                                 "No"),
                      ordered = FALSE)
                      
foxnews$Q21_1 <- factor(foxnews$Q21_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

 foxnews$Q26 <- factor(foxnews$Q26,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

foxnews$Q28 <- factor(foxnews$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
 
foxnews$Q32 <- factor(foxnews$Q32,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

foxnews$Q34 <- factor(foxnews$Q34,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

foxnews$Q40 <- factor(foxnews$Q40,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)

foxnews$Q43_1 <- factor(foxnews$Q43_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

fit.foxnews.lm <- lm(foxnews$Q44 ~ foxnews$Q11 + foxnews$Q21_1 +
                        foxnews$Q26 + foxnews$Q28 + 
                        foxnews$Q32 + foxnews$Q34 +
                        foxnews$Q43_1 + foxnews$Q40)

summary(fit.foxnews.lm)
forest_model(fit.foxnews.lm)
round(confint(fit.foxnews.lm, level = 0.95), 2)

#stargazer(fit.foxnews.lm, fit.fox.lm, fit.apnews.lm, fit.npr.lm, type = "html", out = "test.doc")
