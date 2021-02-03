setwd("~/workspace/news-study/")
source("scripts/libraries.R")
spring2020_ap <- read_sav("3-spring2020-ap.sav")
View(spring2020_ap)
apnews <- spring2020_ap

#apnews <- read.csv("spring2020AP.csv", header = TRUE, sep = ",",
#               na.strings = "NA") 

## Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

## Analysis
# Q28: Most news media are biased against my views? 1 = Strongly Agree; 7 = Strongly Disagree
# Q44 is: Do you think this news article is fake news? 1 = Yes; 5 = No

# Groups
apnewscontrol <- subset(apnews, Q44_First.Click >= 0 & !is.na(apnews$Q44))
apnewstreatment1 <- subset(apnews, Q45_First.Click >= 0 & !is.na(apnews$Q44))
apnewstreatment2 <- subset(apnews, Q46_First.Click >= 0 & !is.na(apnews$Q44))
apnewstreatment3 <- subset(apnews, Q47_First.Click >= 0 & !is.na(apnews$Q44))

# Fake news data
fakenewsap  <- c(apnewscontrol$Q44, apnewstreatment1$Q44, apnewstreatment2$Q44, apnewstreatment3$Q44)
conditionap <- c(rep(0, length(apnewscontrol$Q44)),
               rep(1, length(apnewstreatment1$Q44)),
               rep(2, length(apnewstreatment2$Q44)),
               rep(3, length(apnewstreatment3$Q44)))
conditionap <- factor(conditionap, levels = c(0, 1, 2, 3),
                    labels = c("Control",
                               "Treatment1",
                               "Treatment2",
                               "Treatment3"),
                 ordered = FALSE)
apnewsfake <- data.frame(fakenewsap, conditionap)
rm(conditionap)

# Descriptive
describeBy(apnewsfake, apnewsfake$condition)
tapply(apnewsfake$fakenewsap, apnewsfake$conditionap, FUN = var)

fit.3 <- aov(fakenewsap ~ conditionap, data = apnewsfake)
summary(fit.3)
boxplot(fakenewsap ~ conditionap, main = "AP", data = apnewsfake)

ggline(apnewsfake, x = "conditionap", y = "fakenewsap",
       title = "Associated Press",
       add = "mean_se")

TukeyHSD(fit.3)
plot(TukeyHSD(fit.3))
