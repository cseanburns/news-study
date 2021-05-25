### NPR News
# Analysis

# See functions.R file:
# Fake news question
barplot(table(npr$Q44), main = "NPR")
percent_fakenews(npr$Q44, "NPR")

# Groups
# Fake news data
npr_control <- npr_control$Q44
npr_treatment1 <- npr_treatment1$Q44
npr_treatment2 <- npr_treatment2$Q44
npr_treatment3 <- npr_treatment3$Q44

condition_control_y <- rep(0, length(npr_control))
condition_treatment1_y <- rep(1, length(npr_treatment1))
condition_treatment2_y <- rep(2, length(npr_treatment2))
condition_treatment3_y <- rep(3, length(npr_treatment3))

npr_groups <- c(npr_control,
                npr_treatment1,
                npr_treatment2,
                npr_treatment3)
npr_conditions <- c(condition_control_y,
                    condition_treatment1_y,
                    condition_treatment2_y,
                    condition_treatment3_y)

npr_fake_news <- data.frame(npr_groups, npr_conditions)

npr_fake_news$npr_conditions <- factor(npr_conditions,
                                     levels = c(0, 1, 2, 3),
                                     labels = c("Control",
                                                "Treatment1",
                                                "Treatment2",
                                                "Treatment3"),
                                     ordered = FALSE)

npr_fake_news <- npr_fake_news %>% na.omit()

# Descriptive
psych::describeBy(npr_fake_news, npr_fake_news$npr_conditions) 
# total N
length(npr_fake_news$npr_groups)
# grand mean
mean(npr_fake_news$npr_groups)
# grand sd
sd(npr_fake_news$npr_groups)
# t.test compared to the scale mean
t.test(npr_fake_news$npr_groups, mu = 2.50)

fit.npr <- aov(npr_groups ~ npr_conditions,
               data = npr_fake_news)
car::Anova(fit.npr)
sjstats::anova_stats(fit.npr)
boxplot(npr_groups ~ npr_conditions,
        main = "NPR",
        data = npr_fake_news)
mtext(side=2,
      line=2,
      "1 = Definitely yes; 5 = Definitely not",
      col="black",
      font=1,
      cex=1.2)

ggpubr::ggline(npr_fake_news,
               x = "npr_conditions",
               y = "npr_groups",
               title = "NPR",
               add = "mean_se")

TukeyHSD(fit.npr)
plot(TukeyHSD(fit.npr))
