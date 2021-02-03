setwd("~/workspace/news-study/")
source("scripts/libraries.R")
spring2019_nytimes <- read_sav("1-spring2019-nytimes.sav")
View(spring2019_nytimes)
nytimes <- spring2019_nytimes

#nytimes <- read.csv("spring2019NYTIMES.csv", header = TRUE, sep = ",",
#               na.strings = "NA") 

## Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

## Analysis
# Q28: Most news media are biased against my views?
# Q44 is: Do you think this news article is fake news?

# Groups
nytimescontrol <- subset(nytimes, Q44_First.Click >= 0 & !is.na(nytimes$Q44))
nytimestreatment1 <- subset(nytimes, Q45_First.Click >= 0 & !is.na(nytimes$Q44))
nytimestreatment2 <- subset(nytimes, Q46_First.Click >= 0 & !is.na(nytimes$Q44))
nytimestreatment3 <- subset(nytimes, Q47_First.Click >= 0 & !is.na(nytimes$Q44))

# Fake news data
fakenewsny  <- c(nytimescontrol$Q44, nytimestreatment1$Q44, nytimestreatment2$Q44, nytimestreatment3$Q44)
conditionny <- c(rep(0, length(nytimescontrol$Q44)),
               rep(1, length(nytimestreatment1$Q44)),
               rep(2, length(nytimestreatment2$Q44)),
               rep(3, length(nytimestreatment3$Q44)))
conditionny <- factor(conditionny, levels = c(0, 1, 2, 3),
                    labels = c("Control",
                               "Treatment1",
                               "Treatment2",
                               "Treatment3"),
                 ordered = FALSE)
nytimesfake <- data.frame(fakenewsny, conditionny)
rm(conditionny)

# Descriptive
describeBy(nytimesfake, nytimesfake$condition)
tapply(nytimesfake$fakenewsny, nytimesfake$conditionny, FUN = var)

fit.1 <- aov(fakenewsny ~ conditionny, data = nytimesfake)
summary(fit.1)
boxplot(fakenewsny ~ conditionny, main = "NY Times", data = nytimesfake)

ggline(nytimesfake, x = "conditionny", y = "fakenewsny",
       title = "NY Times",
       add = "mean_se")

TukeyHSD(fit.1)
plot(TukeyHSD(fit.1))
