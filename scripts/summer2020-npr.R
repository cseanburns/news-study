setwd("~/workspace/news-study/")
source("scripts/libraries.R")
summer2020_npr <- read_sav("4-summer2020-npr.sav")
View(summer2020_npr)
npr <- summer2020_npr

#npr <- read.csv("summer2020NPR.csv", header = TRUE, sep = ",",
#                na.strings = "NA") 

### THESE Qs may be different for this since questions were added for the
### general public study
## Groups
# Q44_First.Click: CONTROL
# Q45_First.Click: TREATMENT 1, No Meta/No Pres
# Q46_First.Click: TREATMENT 2, No Pres
# Q47_First.Click: TREATMENT 3, No Meta

## Analysis
# Q28: Most news media are biased against my views?
# Q44 is: Do you think this news article is fake news?

# Groups
nprcontrol <- subset(npr, Q44_First.Click >= 0 & !is.na(npr$Q44))
nprtreatment1 <- subset(npr, Q45_First.Click >= 0 & !is.na(npr$Q44))
nprtreatment2 <- subset(npr, Q46_First.Click >= 0 & !is.na(npr$Q44))
nprtreatment3 <- subset(npr, Q47_First.Click >= 0 & !is.na(npr$Q44))

# Fake news data
fakenewsnpr  <- c(nprcontrol$Q44, nprtreatment1$Q44, nprtreatment2$Q44, nprtreatment3$Q44)
conditionnpr <- c(rep(0, length(nprcontrol$Q44)),
               rep(1, length(nprtreatment1$Q44)),
               rep(2, length(nprtreatment2$Q44)),
               rep(3, length(nprtreatment3$Q44)))
conditionnpr <- factor(conditionnpr, levels = c(0, 1, 2, 3),
                    labels = c("Control",
                               "Treatment1",
                               "Treatment2",
                               "Treatment3"),
                 ordered = FALSE)
nprfake <- data.frame(fakenewsnpr, conditionnpr)
rm(conditionnpr)

# Descriptive
describeBy(nprfake, nprfake$condition)
tapply(nprfake$fakenewsnpr, nprfake$conditionnpr, FUN = var)

fit.4 <- aov(fakenewsnpr ~ conditionnpr, data = nprfake)
summary(fit.4)
boxplot(fakenewsnpr ~ conditionnpr, main ="NPR", data = nprfake)

ggline(nprfake, x = "conditionnpr", y = "fakenewsnpr",
       title = "NPR",
       add = "mean_se")

TukeyHSD(fit.4)
plot(TukeyHSD(fit.4))
