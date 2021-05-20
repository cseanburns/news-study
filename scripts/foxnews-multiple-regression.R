setwd("~/workspace/news-study/")
source("scripts/libraries.R")
rm(list = ls())

# Q11: Did you vote in the last midterm el ection?
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

### Fox News
# Import Data
foxnews <- read_sav("data/2-fall2019-fox.sav")

# Keep only completed surveys
foxnews <- foxnews %>% filter(Finished == 1)
# Remove anyone who didn't answer age question or is younger than 18
foxnews <- foxnews %>% filter(Q3_1 >= 2)
# Keep only data columns
foxnews <- foxnews %>% select(starts_with("Q"))

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
