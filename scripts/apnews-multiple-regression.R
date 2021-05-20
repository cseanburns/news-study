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

### apnews
# Import Data
apnews <- read_sav("data/3-spring2020-ap.sav")

# Keep only completed surveys
apnews <- apnews %>% filter(Finished == 1)
# Keep only data columns
apnews <- apnews %>% select(starts_with("Q"))

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

fit.apnews.lm <- lm(apnews$Q44 ~ apnews$Q11 + apnews$Q21_1 +
                        apnews$Q26 + apnews$Q28 + 
                        apnews$Q32 + apnews$Q34 +
                        apnews$Q43_1 + apnews$Q40)

summary(fit.apnews.lm)
forest_model(fit.apnews.lm)
round(confint(fit.apnews.lm, level = 0.95), 2)

#stargazer(fit.apnews.lm, type = "text", out = "apnews.txt")
