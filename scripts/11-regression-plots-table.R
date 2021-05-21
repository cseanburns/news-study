# Plots and Model Tables for Regressions

tiff("plots/nytimes-regression-plot.tif", width = 3860, height = 2160,
     pointsize = 12, res = 300)
forest_model(fit.nytimes.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "NY Times", x = NULL, y = NULL) +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

tiff("plots/foxnews-regression-plot.tif", width = 3860, height = 2160,
     pointsize = 12, res = 300)
forest_model(fit.foxnews.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "Fox News", x = NULL, y = NULL) +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

tiff("plots/npr-regression-plot.tif", width = 3860, height = 2160,
     pointsize = 12, res = 300)
forest_model(fit.npr.lm,
             format_options = forest_model_format_options(shape = 20)) +
  labs(title = "NPR", x = NULL, y = NULL) +
  scale_y_discrete(labels = NULL) +
  theme_pubclean()
dev.off()

# Save model output for importing into manuscript
stargazer(fit.nytimes.lm, fit.foxnews.lm, fit.npr.lm,
          column.labels = c("NY Times", "Fox News", "NPR"),
          ci = TRUE, ci.level = 0.95, type = "html", out = "output/allmodels.html")