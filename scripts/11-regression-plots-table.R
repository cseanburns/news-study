# Plots and Model Tables for Regressions

## NY Times plot
tiff("plots/fig1-nytimes-regression-plot.tif",
     width = 3860,
     height = 2160,
     pointsize = 12,
     res = 300)
forest_model(fit.nytimes.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "NY Times",
       x = NULL,
       y = NULL) +
  geom_label(x = -1, y = 44, label = "Fake") +
  geom_label(x = 1, y = 44, label = "Not Fake") +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

## Fox News plot
tiff("plots/fig2-fox-regression-plot.tif",
     width = 3860,
     height = 2160,
     pointsize = 12,
     res = 300)
forest_model(fit.foxnews.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "Fox News",
       x = NULL,
       y = NULL) +
  geom_label(x = -1, y = 44, label = "Fake") +
  geom_label(x = 1, y = 44, label = "Not Fake") +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

## AP News plot
tiff("plots/appendix3-apnews-regression-plot.tif",
     width = 3860,
     height = 2160,
     pointsize = 12,
     res = 300)
forest_model(fit.apnews.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "AP News",
       x = NULL,
       y = NULL) +
  geom_label(x = -1.5, y = 44, label = "Fake") +
  geom_label(x = 0.5, y = 44, label = "Not Fake") +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

## NPR plot
tiff("plots/fig3-npr-regression-plot.tif",
     width = 3860,
     height = 2160,
     pointsize = 12,
     res = 300)
forest_model(fit.npr.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "NPR",
       x = NULL,
       y = NULL) +
  geom_label(x = -2, y = 45, label = "Fake") +
  geom_label(x = 1, y = 45, label = "Not Fake") +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

# Save model output for importing into manuscript
stargazer(fit.nytimes.lm,
          fit.foxnews.lm,
          fit.npr.lm,
          column.labels = c("NY Times",
                            "Fox News",
                            "NPR"),
          ci = TRUE,
          ci.level = 0.95,
          type = "html",
          out = "output/allmodels.html")

