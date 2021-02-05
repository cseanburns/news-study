# Media bias predict fake news
# Q28: Most news media are biased against my views
# 1 = Strongly Agree
# 7 = Strongly Disagree
# Q44: Do you think this news article is fake news?
# 1 = Definitely Yes
# 5 = Definitely Not

### NY Times
# Import Data
spring2019_nytimes <- read_sav("data/1-spring2019-nytimes.sav")
nytimes <- spring2019_nytimes
rm(spring2019_nytimes)

# Keep only completed surveys
nytimes <- nytimes %>% filter(Finished == 1)
# Keep only data columns
nytimes <- nytimes %>% select(starts_with("Q"))

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
                      
boxplot(nytimes$Q44 ~ nytimes$Q28,
        xlab = "Most news media are biased against my views:",
        ylab = "Do you think this news article is fake news?",
        main = "NY Times",
        cex.lab = 1,
        cex.axis = 0.60,
        las = 1, axes = TRUE)
mtext(side=2, line=2, "1 = Definitely yes; 5 = Definitely not", col="black", font=1, cex=1.2)
fit.ny <- aov(nytimes$Q44 ~ nytimes$Q28)
summary(fit.ny)
TukeyHSD(fit.ny)
plot(TukeyHSD(fit.ny))

### Fox News
# Import Data
fall2019_fox <- read_sav("data/2-fall2019-fox.sav")
fox <- fall2019_fox
rm(fall2019_fox)

# Keep only completed surveys
fox <- fox %>% filter(Finished == 1)
# Keep only data columns
fox <- fox %>% select(starts_with("Q"))

fox$Q28 <- factor(fox$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
                      
boxplot(fox$Q44 ~ fox$Q28,
        xlab = "Most news media are biased against my views:",
        ylab = "Do you think this news article is fake news?",
        main = "Fox News",
        cex.lab = 1,
        cex.axis = 0.60,
        las = 1, axes = TRUE)
mtext(side=2, line=2, "1 = Definitely yes; 5 = Definitely not", col="black", font=1, cex=1.2)
fit.fox <- aov(fox$Q44 ~ fox$Q28)
summary(fit.fox)
TukeyHSD(fit.fox)
plot(TukeyHSD(fit.fox))

### AP News
# Import Data
spring2020_ap <- read_sav("data/3-spring2020-ap.sav")
apnews <- spring2020_ap
rm(spring2020_ap)

# Keep only completed surveys
apnews <- apnews %>% filter(Finished == 1)
# Keep only data columns
apnews <- apnews %>% select(starts_with("Q"))

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
                      
boxplot(apnews$Q44 ~ apnews$Q28,
        xlab = "Most news media are biased against my views:",
        ylab = "Do you think this news article is fake news?",
        main = "AP News",
        cex.lab = 1,
        cex.axis = 0.60,
        las = 1, axes = TRUE)
mtext(side=2, line=2, "1 = Definitely yes; 5 = Definitely not", col="black", font=1, cex=1.2)
fit.apnews <- aov(apnews$Q44 ~ apnews$Q28)
summary(fit.apnews)
TukeyHSD(fit.apnews)
plot(TukeyHSD(fit.apnews))

### NPR News
# Import Data
spring2020_ap <- read_sav("data/3-spring2020-ap.sav")
apnews <- spring2020_ap
rm(spring2020_ap)

# Keep only completed surveys
apnews <- apnews %>% filter(Finished == 1)
# Keep only data columns
apnews <- apnews %>% select(starts_with("Q"))

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
                      
boxplot(npr$Q44 ~ npr$Q28,
        xlab = "Most news media are biased against my views:",
        ylab = "Do you think this news article is fake news?",
        main = "NPR",
        cex.lab = 1,
        cex.axis = 0.60,
        las = 1, axes = TRUE)
mtext(side=2, line=2, "1 = Definitely yes; 5 = Definitely not", col="black", font=1, cex=1.2)
fit.npr <- aov(npr$Q44 ~ npr$Q28)
summary(fit.npr)
TukeyHSD(fit.npr)
plot(TukeyHSD(fit.npr))

# Do liberals view certain sources favorably or not?
# Do conservatives view certain sources favorably or not?