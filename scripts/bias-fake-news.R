# Media bias predict fake news
# Q28: Most news media are biased against my views
# 1 = Strongly Agree
# 7 = Strongly Disagree
# Q44: Do you think this news article is fake news?
# 1 = Definitely Yes
# 5 = Definitely Not

boxplot(nytimes$Q28 ~ nytimes$Q44)
fit.ny <- aov(nytimes$Q28 ~ nytimes$Q44)
summary(fit.ny)
TukeyHSD(fit.ny)
plot(TukeyHSD(fit.ny))

boxplot(fox$Q28 ~ fox$Q44)
fit.fox <- aov(fox$Q28 ~ fox$Q44)
summary(fit.fox)
TukeyHSD(fit.fox)
plot(TukeyHSD(fit.fox))

boxplot(apnews$Q28 ~ apnews$Q44)
fit.ap <- aov(apnews$Q28 ~ apnews$Q44)
summary(fit.ap)
TukeyHSD(fit.ap)
plot(TukeyHSD(fit.ap))

boxplot(npr$Q28 ~ npr$Q44)
fit.npr <- aov(npr$Q28 ~ npr$Q44)
summary(fit.npr)
TukeyHSD(fit.npr)
plot(TukeyHSD(fit.npr))

# Do liberals view certain sources favorably or not?
# Do conservatives view certain sources favorably or not?