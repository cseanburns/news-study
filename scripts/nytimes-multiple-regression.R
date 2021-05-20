setwd("~/workspace/news-study/")
source("scripts/libraries.R")
rm(list = ls())

# Q11: Did you vote in the last midterm election?
# 1 = Yesi
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
# 1 = Definitely Yesi
# 5 = Definitely Not

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