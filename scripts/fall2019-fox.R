setwd("~/workspace/news-study/")
source("scripts/libraries.R")
fall2019_fox <- read_sav("2-fall2019-fox.sav")
View(fall2019_fox)
fox <- fall2019_fox

#fox <- read.csv("fall2019FOX.csv", header = TRUE, sep = ",",
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
foxcontrol <- subset(fox, Q44_First.Click >= 0 & !is.na(fox$Q44))
foxtreatment1 <- subset(fox, Q45_First.Click >= 0 & !is.na(fox$Q44))
foxtreatment2 <- subset(fox, Q46_First.Click >= 0 & !is.na(fox$Q44))
foxtreatment3 <- subset(fox, Q47_First.Click >= 0 & !is.na(fox$Q44))

# Fake news data
fakenewsfox  <- c(foxcontrol$Q44, foxtreatment1$Q44, foxtreatment2$Q44, foxtreatment3$Q44)
conditionfox <- c(rep(0, length(foxcontrol$Q44)),
               rep(1, length(foxtreatment1$Q44)),
               rep(2, length(foxtreatment2$Q44)),
               rep(3, length(foxtreatment3$Q44)))i
conditionfox <- factor(conditionfox, levels = c(0, 1, 2, 3),
                    labels = c("Control",
                               "Treatment1",
                               "Treatment2",
                               "Treatment3"),
                 ordered = FALSE)
foxfake <- data.frame(fakenewsfox, conditionfox)
rm(conditionfox)

# Descriptive
describeBy(foxfake, foxfake$condition)
tapply(foxfake$fakenewsfox, foxfake$conditionfox, FUN = var)

fit.2 <- aov(fakenewsfox ~ conditionfox, data = foxfake)
summary(fit.2)
boxplot(fakenewsfox ~ conditionfox, main = "Fox", data = foxfake)

ggline(foxfake, x = "conditionfox", y = "fakenewsfox",
       title = "Fox",
       add = "mean_se")

TukeyHSD(fit.2)
plot(TukeyHSD(fit.2))
