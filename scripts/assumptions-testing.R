# Regression stats
fit.0a <- lm(Bias ~ Condition, data = mydata) ; summary(fit.0a)
fit.1a <- lm(Political_lean ~ Condition, data = mydata) ; summary(fit.1a)
fit.2a <- lm(Article_Political_lean ~ Condition, data = mydata) ; summary(fit.2a)
fit.3a <- lm(Balanced_news ~ Condition, data = mydata) ; summary(fit.3a)
fit.4a <- lm(Fake_news ~ Condition, data = mydata) ; summary(fit.4a)

# Check assumptions
# http://www.sthda.com/english/wiki/two-way-anova-test-in-r
# Check homogeneity of variance assumption
# It looks like we pass this assumption:
library(car)
leveneTest(Bias ~ Condition, data = mydata)
leveneTest(Political_lean ~ Condition, data = mydata)
leveneTest(Article_Political_lean ~ Condition, data = mydata)
leveneTest(Balanced_news ~ Condition, data = mydata)
leveneTest(Fake_news ~ Condition, data = mydata)
leveneTest(Voter ~ Condition, data = mydata)

# Check normality assumption
aov_r0 <- residuals(object = fit.0)
aov_r1 <- residuals(object = fit.1)
aov_r2 <- residuals(object = fit.2)
aov_r3 <- residuals(object = fit.3)
aov_r4 <- residuals(object = fit.4)
aov_r5 <- residuals(object = fit.5)

shapiro.test(x = aov_r0) # Violates normality
shapiro.test(x = aov_r1) # Violates normality
shapiro.test(x = aov_r2) # Violates normality
shapiro.test(x = aov_r3) # Violates normality
shapiro.test(x = aov_r4) # Violates normality
shapiro.test(x = aov_r5) # Violates normality
