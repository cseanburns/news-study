setwd("~/workspace/news-study/")
source("scripts/0-libraries.R")
rm(list = ls())

### AP News
# Import Data
apnews <- read_sav("data/3-spring2020-ap.sav")

# Keep only completed surveys
apnews <- apnews %>% dplyr::filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
apnews <- apnews %>% dplyr::filter(Q3_1 >= 2)
# Keep only data columns
apnews <- apnews %>% dplyr::select(starts_with("Q"))

apnews$Q11 <- factor(apnews$Q11,
                      levels = c(1, 2),
                      labels = c("Yes",
                                 "No"),
                      ordered = FALSE)
                      
apnews$Q21_1 <- factor(apnews$Q21_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

 apnews$Q26 <- factor(apnews$Q26,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

apnews$Q28 <- factor(apnews$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
 
apnews$Q32 <- factor(apnews$Q32,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

apnews$Q34 <- factor(apnews$Q34,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

apnews$Q40 <- factor(apnews$Q40,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)

apnews$Q43_1 <- factor(apnews$Q43_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

fit.apnews.lm <- lm(Q44 ~ Q11 + Q21_1 + Q26 + Q28 +  Q32 + Q34 + Q43_1 + Q40,
                    data = apnews)

summary(fit.apnews.lm)
forest_model(fit.apnews.lm)
round(confint(fit.apnews.lm, level = 0.95), 2)
