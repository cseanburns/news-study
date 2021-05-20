setwd("~/workspace/news-study/")
source("scripts/0-libraries.R")
rm(list = ls())

### NPR
# Import Data
npr <- read_sav("data/4-summer2020-npr.sav")

# Keep only completed surveys
npr <- npr %>% dplyr::filter(Finished == 1)
# Keep only data columns
npr <- npr %>% dplyr::select(starts_with("Q"))

npr$Q11 <- factor(npr$Q11,
                      levels = c(1, 2),
                      labels = c("Yes",
                                 "No"),
                      ordered = FALSE)
                      
npr$Q21_1 <- factor(npr$Q21_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

 npr$Q26 <- factor(npr$Q26,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

npr$Q28 <- factor(npr$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
 
npr$Q32 <- factor(npr$Q32,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                       ordered = FALSE)

npr$Q34 <- factor(npr$Q34,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

npr$Q40 <- factor(npr$Q40,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)

npr$Q43_1 <- factor(npr$Q43_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

fit.npr.lm <- lm(npr$Q44 ~ npr$Q11 + npr$Q21_1 +
                        npr$Q26 + npr$Q28 + 
                        npr$Q32 + npr$Q34 +
                        npr$Q43_1 + npr$Q40)

summary(fit.npr.lm)
forest_model(fit.npr.lm)
round(confint(fit.npr.lm, level = 0.95), 2)