### NPR
# Import Data
npr <- read_sav("data/4-summer2020-npr.sav")

# Keep only completed surveys
npr <- npr %>% dplyr::filter(Finished == 1)
# Keep only data columns
npr <- npr %>% dplyr::select(starts_with("Q"))

# Keep only needed columns
npr <-  npr %>%
  dplyr::select(Q11, Q21_1, Q26, Q28, Q32, Q34, Q40, Q43_1, Q44)

npr$Q11 <- factor(npr$Q11,
                      levels = c(1, 2),
                      labels = c("Yes",
                                 "No"),
                      ordered = FALSE)
                      
npr$Q21_1 <- factor(npr$Q21_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

 npr$Q26 <- factor(npr$Q26,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

npr$Q28 <- factor(npr$Q28,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)
 
npr$Q32 <- factor(npr$Q32,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                       ordered = FALSE)

npr$Q34 <- factor(npr$Q34,
                      levels = c(1, 2, 3, 4, 5),
                      labels = c("Never",
                                 "Rarely",
                                 "Sometimes",
                                 "Often",
                                 "Always"),
                      ordered = FALSE)

npr$Q40 <- factor(npr$Q40,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Strongly agree",
                                 "Agree",
                                 "Somewhat agree",
                                 "Neither agree nor disagree",
                                 "Somewhat disagree",
                                 "Disagree",
                                 "Strongly disagree"),
                      ordered = FALSE)

npr$Q43_1 <- factor(npr$Q43_1,
                      levels = c(1, 2, 3, 4, 5, 6, 7),
                      labels = c("Extremely Liberal",
                                 "Fairly Liberal",
                                 "Liberal",
                                 "Center",
                                 "Conservative",
                                 "Fairly Conservative",
                                 "Extremely Conservative"),
                      ordered = FALSE)

fit.npr.lm <- lm(Q44 ~ Q11 +
                 Q21_1 +
                 Q26 +
                 Q28 +
                 Q32 +
                 Q34 +
                 Q43_1 +
                 Q40,
               data = npr)

summary(fit.npr.lm)
round(confint(fit.npr.lm, level = 0.95), 2)

# Save NPR output to CSV file
write.table(npr,
           file = "data-public/npr-data.csv",
           quote = TRUE,
           sep = ",",
           row.names = FALSE,
           na = "NA")
