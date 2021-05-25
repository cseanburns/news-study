### NY Times
# Analysis

# See functions.R file
# Fake news question
barplot(table(nytimes$Q44), main = "NY Times")
percent_fakenews(nytimes$Q44, "New York Times")

# Groups
# Fake news data
nytimes_control <- nytimes_control$Q44
nytimes_treatment1 <- nytimes_treatment1$Q44
nytimes_treatment2 <- nytimes_treatment2$Q44
nytimes_treatment3 <- nytimes_treatment3$Q44

condition_control_y <- rep(0, length(nytimes_control))
condition_treatment1_y <- rep(1, length(nytimes_treatment1))
condition_treatment2_y <- rep(2, length(nytimes_treatment2))
condition_treatment3_y <- rep(3, length(nytimes_treatment3))

nytimes_groups <- c(nytimes_control,
                    nytimes_treatment1,
                    nytimes_treatment2,
                    nytimes_treatment3)
nytimes_conditions <- c(condition_control_y,
                        condition_treatment1_y,
                        condition_treatment2_y,
                        condition_treatment3_y)

nytimes_fake_news <- data.frame(nytimes_groups, nytimes_conditions)

nytimes_fake_news$nytimes_conditions <- factor(nytimes_conditions,
                                               levels = c(0, 1, 2, 3),
                                               labels = c("Control",
                                                          "Treatment1",
                                                          "Treatment2",
                                                          "Treatment3"),
                                               ordered = FALSE)
                                     
nytimes_fake_news <- nytimes_fake_news %>% na.omit()
                                     
# Descriptive
psych::describeBy(nytimes_fake_news,
                  nytimes_fake_news$nytimes_conditions) 
# total N
length(nytimes_fake_news$nytimes_groups)
# grand mean
mean(nytimes_fake_news$nytimes_groups)
# grand sd
sd(nytimes_fake_news$nytimes_groups)
# t.test compared to the scale mean
t.test(nytimes_fake_news$nytimes_groups, mu = 2.50)

fit.ny <- aov(nytimes_groups ~ nytimes_conditions,
              data = nytimes_fake_news)
car::Anova(fit.ny)
sjstats::anova_stats(fit.ny)
boxplot(nytimes_groups ~ nytimes_conditions,
        main = "NY Times",
        data = nytimes_fake_news)
mtext(side=2,
      line=2,
      "1 = Definitely yes; 5 = Definitely not",
      col="black",
      font=1,
      cex=1.2)

ggpubr::ggline(nytimes_fake_news,
               x = "nytimes_conditions",
               y = "nytimes_groups",
               title = "NY Times",
               add = "mean_se")
                                     
TukeyHSD(fit.ny)
plot(TukeyHSD(fit.ny))

## Get Frequency of undecided participants
nytmp <- data.frame(table(nytimes_fake_news))
ny.rows <- rowsum(nytmp$Freq, nytmp$nytimes_groups)
ny.cols <- colSums(rowsum(nytmp$Freq, nytmp$nytimes_groups))
round(ny.rows / ny.cols, 2) * 100
