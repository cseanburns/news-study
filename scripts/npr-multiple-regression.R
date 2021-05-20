setwd("~/workspace/news-study/")
source("scripts/libraries.R")
rm(list = ls())

# Q11: Did you vote in the last midterm election?
# 1 = Yes
# 2 = No
# Q21_1: Where would you place your political perspective on this scale:
# 1 = Extremely liberal
# 7 = Extremely conservative
# Q26: How often do you read news articles?
# 1 = Never
# 5 = Always
# Q28: Most news media are biased against my views
# 1 = Strongly Agree
# 7 = Strongly Disagree
# Q32: How often do you share news articles?
# 1 = Never
# 5 = Always
# Q34: How often do you actively seek out news articles?
# 1 = Never
# 5 = Always
# Q40: Overall, the article provides a fair, balanced, evidence based view on the article's topic:
# 1 = Strongly Agree
# 7 = Strongly Disagree
# Q43_1: Where would you place the political perspective on this news article:
# 1 = Extremely liberal
# 7 = Extremely conservative

# Q44: Do you think this news article is fake news?
# 1 = Definitely Yes
# 5 = Definitely Not

### NPR
# Import Data
npr <- read_sav("data/4-summer2020-npr.sav")

# Keep only completed surveys
npr <- npr %>% filter(Finished == 1)
# Keep only data columns
npr <- npr %>% select(starts_with("Q"))

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

#stargazer(fit.npr.lm, type = "text", out = "npr.txt")
