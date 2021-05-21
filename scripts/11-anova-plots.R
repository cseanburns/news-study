# Multi-Group Comparison Plots
# See: https://cran.r-project.org/web/packages/dabestr/vignettes/using-dabestr.html

## NY Times
multi.two.group.unpaired <- ny_fake_news %>%
  dabest(ny_conditions, ny_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.two.group.unpaired.meandiff <- mean_diff(multi.two.group.unpaired)
# Create a multi-two group plot.
multi.two.group.unpaired.meandiff %>% plot(color.column = ny_conditions,
                                           rawplot.ylabel = "NY Times Groups",
                                           effsize.ylabel = "Delta Plot",
                                           show.legend = FALSE)

## Fox News
multi.two.group.unpaired <- fox_fake_news %>%
  dabest(fox_conditions, fox_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.two.group.unpaired.meandiff <- mean_diff(multi.two.group.unpaired)
# Create a multi-two group plot.
multi.two.group.unpaired.meandiff %>% plot(color.column = fox_conditions,
                                           rawplot.ylabel = "Fox Groups",
                                           effsize.ylabel = "Delta Plot",
                                           show.legend = FALSE)

## AP News
multi.two.group.unpaired <- ap_fake_news %>%
  dabest(ap_conditions, ap_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.two.group.unpaired.meandiff <- mean_diff(multi.two.group.unpaired)
# Create a multi-two group plot.
multi.two.group.unpaired.meandiff %>% plot(color.column = ap_conditions,
                                           rawplot.ylabel = "AP Groups",
                                           effsize.ylabel = "Delta Plot",
                                           show.legend = FALSE)

## NPR
multi.two.group.unpaired <- npr_fake_news %>%
  dabest(npr_conditions, npr_groups,
         idx = list(c("Control", "Treatment1",
                      "Treatment2", "Treatment3")),
         paired = FALSE)
# Compute the mean difference.
multi.two.group.unpaired.meandiff <- mean_diff(multi.two.group.unpaired)
# Create a multi-two group plot.
multi.two.group.unpaired.meandiff %>% plot(color.column = npr_conditions,
                                           rawplot.ylabel = "NPR Groups",
                                           effsize.ylabel = "Delta Plot",
                                           show.legend = FALSE)
