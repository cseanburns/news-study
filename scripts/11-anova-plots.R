# Multi-Group Comparison Plots
# See: https://cran.r-project.org/web/packages/dabestr/vignettes/using-dabestr.html

## NY Times
multi.ny.group.unpaired <- ny_fake_news %>%
  dabest(ny_conditions, ny_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.ny.group.unpaired.meandiff <- mean_diff(multi.ny.group.unpaired)
# Create a multi-two group plot.
tiff("plots/test.tif", width = 3860, height = 2160, pointsize = 12, res = 300)
fig1 <- multi.ny.group.unpaired.meandiff %>% plot(color.column = ny_conditions,
                                             rawplot.ylabel = "NY Times Groups",
                                             effsize.ylabel = "Delta Plot",
                                             show.legend = FALSE)

## Fox News
multi.fox.group.unpaired <- fox_fake_news %>%
  dabest(fox_conditions, fox_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.fox.group.unpaired.meandiff <- mean_diff(multi.fox.group.unpaired)
# Create a multi-two group plot.
fig2 <- multi.fox.group.unpaired.meandiff %>% plot(color.column = fox_conditions,
                                             rawplot.ylabel = "Fox Groups",
                                             effsize.ylabel = "Delta Plot",
                                             show.legend = FALSE)

## AP News
multi.ap.group.unpaired <- ap_fake_news %>%
  dabest(ap_conditions, ap_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.ap.group.unpaired.meandiff <- mean_diff(multi.ap.group.unpaired)
# Create a multi-two group plot.
fig3 <- multi.ap.group.unpaired.meandiff %>% plot(color.column = ap_conditions,
                                             rawplot.ylabel = "AP Groups",
                                             effsize.ylabel = "Delta Plot",
                                             show.legend = FALSE)

## NPR
multi.npr.group.unpaired <- npr_fake_news %>%
  dabest(npr_conditions, npr_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.npr.group.unpaired.meandiff <- mean_diff(multi.npr.group.unpaired)
# Create a multi-two group plot.
fig4 <- multi.npr.group.unpaired.meandiff %>% plot(color.column = npr_conditions,
                                              rawplot.ylabel = "NPR Groups",
                                              effsize.ylabel = "Delta Plot",
                                              show.legend = FALSE)
grid.arrange(fig1, fig2, fig3, fig4, ncol = 2, nrow = 2)
dev.off()
