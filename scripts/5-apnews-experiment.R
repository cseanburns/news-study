### AP News
# Analysis

# See functions.R file
barplot(table(apnews$Q44), main = "AP News")
percent_fakenews(apnews$Q44, "AP News")

# Groups
# Fake news data
ap_control <- apnews_control$Q44
ap_treatment1 <- apnews_treatment1$Q44
ap_treatment2 <- apnews_treatment2$Q44
ap_treatment3 <- apnews_treatment3$Q44

condition_control_y <- rep(0, length(ap_control))
condition_treatment1_y <- rep(1, length(ap_treatment1))
condition_treatment2_y <- rep(2, length(ap_treatment2))
condition_treatment3_y <- rep(3, length(ap_treatment3))

ap_groups <- c(ap_control, ap_treatment1, ap_treatment2, ap_treatment3)
ap_conditions <- c(condition_control_y, condition_treatment1_y,
                   condition_treatment2_y, condition_treatment3_y)

ap_fake_news <- data.frame(ap_groups, ap_conditions)

ap_fake_news$ap_conditions <- factor(ap_conditions,
                                     levels = c(0, 1, 2, 3),
                                     labels = c("Control",
                                                "Treatment1",
                                                "Treatment2",
                                                "Treatment3"),
                                     ordered = FALSE)

ap_fake_news <- ap_fake_news %>% na.omit()

# Descriptive
psych::describeBy(ap_fake_news, ap_fake_news$ap_conditions) 
# total N
length(ap_fake_news$ap_groups)
# grand mean
mean(ap_fake_news$ap_groups)
# grand sd
sd(ap_fake_news$ap_groups)
# t.test compared to the scale mean
t.test(ap_fake_news$ap_groups, mu = 2.50)

fit.3 <- aov(ap_groups ~ ap_conditions, data = ap_fake_news)
summary(fit.3)
car::Anova(fit.3)
boxplot(ap_groups ~ ap_conditions, main = "AP News", data = ap_fake_news)
mtext(side=2, line=2, "1 = Definitely yes; 5 = Definitely not", col="black", font=1, cex=1.2)

ggpubr::ggline(ap_fake_news, x = "ap_conditions", y = "ap_groups",
               title = "AP News",
               add = "mean_se")

TukeyHSD(fit.3)
plot(TukeyHSD(fit.3))
