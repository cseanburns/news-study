### Fox News ###
# Analysis

# See functions.R file
# Fake news question
barplot(table(foxnews$Q44), main = "Fox News")
percent_fakenews(foxnews$Q44, "Fox News")

# Groups
# Fake news data
fox_control <- fox_control$Q44
fox_treatment1 <- fox_treatment1$Q44
fox_treatment2 <- fox_treatment2$Q44
fox_treatment3 <- fox_treatment3$Q44

condition_control_y <- rep(0, length(fox_control))
condition_treatment1_y <- rep(1, length(fox_treatment1))
condition_treatment2_y <- rep(2, length(fox_treatment2))
condition_treatment3_y <- rep(3, length(fox_treatment3))

fox_groups <- c(fox_control,
                fox_treatment1,
                fox_treatment2,
                fox_treatment3)
fox_conditions <- c(condition_control_y,
                    condition_treatment1_y,
                    condition_treatment2_y,
                    condition_treatment3_y)

fox_fake_news <- data.frame(fox_groups, fox_conditions)

fox_fake_news$fox_conditions <- factor(fox_conditions,
                                     levels = c(0, 1, 2, 3),
                                     labels = c("Control",
                                                "Treatment1",
                                                "Treatment2",
                                                "Treatment3"),
                                     ordered = FALSE)

fox_fake_news <- fox_fake_news %>% na.omit()

# Descriptive
psych::describeBy(fox_fake_news,
                  fox_fake_news$fox_conditions) 
# total N
length(fox_fake_news$fox_groups)
# grand mean
mean(fox_fake_news$fox_groups)
# grand sd
sd(fox_fake_news$fox_groups)
# t.test compared to the scale mean
t.test(fox_fake_news$fox_groups, mu = 2.50)

fit.fox <- aov(fox_groups ~ fox_conditions,
               data = fox_fake_news)
car::Anova(fit.fox)
sjstats::anova_stats(fit.fox)
boxplot(fox_groups ~ fox_conditions,
        main = "Fox News",
        data = fox_fake_news)
mtext(side=2,
      line=2,
      "1 = Definitely yes; 5 = Definitely not",
      col="black",
      font=1,
      cex=1.2)

ggpubr::ggline(fox_fake_news,
               x = "fox_conditions",
               y = "fox_groups",
               title = "Fox News",
               add = "mean_se")

TukeyHSD(fit.fox)
plot(TukeyHSD(fit.fox))
