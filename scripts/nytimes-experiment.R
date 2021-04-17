### NY Times
# Analysis
# Q28: Most news media are biased against my views?
# Q44 is: Do you think this news article is fake news?

# Groups
# Fake news data
ny_control <- nytimes_control$Q44
ny_treatment1 <- nytimes_treatment1$Q44
ny_treatment2 <- nytimes_treatment2$Q44
ny_treatment3 <- nytimes_treatment3$Q44

condition_control_y <- rep(0, length(ny_control))
condition_treatment1_y <- rep(1, length(ny_treatment1))
condition_treatment2_y <- rep(2, length(ny_treatment2))
condition_treatment3_y <- rep(3, length(ny_treatment3))

ny_groups <- c(ny_control, ny_treatment1, ny_treatment2, ny_treatment3)
ny_conditions <- c(condition_control_y, condition_treatment1_y,
                   condition_treatment2_y, condition_treatment3_y)

ny_fake_news <- data.frame(ny_groups, ny_conditions)

ny_fake_news$ny_conditions <- factor(ny_conditions,
                                     levels = c(0, 1, 2, 3),
                                     labels = c("Control",
                                                "Treatment1",
                                                "Treatment2",
                                                "Treatment3"),
                                     ordered = FALSE)
                                     
ny_fake_news <- ny_fake_news %>% na.omit()
                                     
# Descriptive
describeBy(ny_fake_news, ny_fake_news$ny_conditions) 
# total N
length(ny_fake_news$ny_groups)
# grand mean
mean(ny_fake_news$ny_groups)
# grand sd
sd(ny_fake_news$ny_groups)
# t.test compared to the scale mean
t.test(ny_fake_news$ny_groups, mu = 2.50)
                                     
fit.1 <- aov(ny_groups ~ ny_conditions, data = ny_fake_news)
summary(fit.1)
Anova(fit.1)
boxplot(ny_groups ~ ny_conditions, main = "NY Times", data = ny_fake_news)

# Q44: Do you think this news article is fake news?
# 1 = Definitely Yes
# 5 = Definitely Not
                                     
ggline(ny_fake_news, x = "ny_conditions", y = "ny_groups",
       title = "NY Times",
       add = "mean_se")
                                     
TukeyHSD(fit.1)
plot(TukeyHSD(fit.1))
