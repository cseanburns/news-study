# README

## Variables investigated

Description of variables investigated in the following regressions:

- 7-nytimes-multiple-regression.R
- 8-foxnews-multiple-regression.R
- 9-apnews-multiple-regression.R
- 10-npr-multiple-regression.R

## Outcome variable

- Q44: Do you think this news article is fake news?
    - 1: Definitely Yes
    - 2: Probably yes
    - 3: Might or might not
    - 4: Probably not
    - 5: Definitely Not

## Predictor variables

- Q11: Did you vote in the last midterm election?
    - 1: Yes
    - 2: No
- Q21_1: Where would you place your political perspective on this scale:
    - 1: Extremely liberal
    - 2: Fairly Liberal
    - 3: Liberal
    - 4: Center
    - 5: Conservative
    - 6: Fiarly Conservative
    - 7: Extremely conservative
- Q26: How often do you read news articles?
    - 1: Never
    - 2: Rarely
    - 3: Sometimes
    - 4: Often
    - 5: Always
- Q28: Most news media are biased against my views
    - 1: Strongly Agree
    - 2: Agree
    - 3: Somewhat agree
    - 4: Neither agree nor disagree
    - 5: Somewhat disagree
    - 6: Disagree
    - 7: Strongly Disagree
- Q32: How often do you share news articles?
    - 1: Never
    - 2: Rarely
    - 3: Sometimes
    - 4: Often
    - 5: Always
- Q34: How often do you actively seek out news articles?
    - 1: Never
    - 2: Rarely
    - 3: Sometimes
    - 4: Often
    - 5: Always
- Q40: Overall, the article provides a fair, balanced, evidence based view on the article's topic:
    - 1: Strongly Agree
    - 2: Agree
    - 3: Somewhat agree
    - 4: Neither agree nor disagree
    - 5: Somewhat disagree
    - 6: Disagree
    - 7: Strongly Disagree
- Q43_1: Where would you place the political perspective on this news article:
    - 1: Extremely liberal
    - 2: Fairly liberal
    - 3: Liberal
    - 4: Center
    - 5: Conservative
    - 6: Fairly conservative
    - 7: Extremely conservative

## Session Info

All code worked on the following system:

```
R version 4.1.0 (2021-05-18)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 21.04

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3
LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.13.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] stargazer_5.2.2   haven_2.3.1       gridExtra_2.3    
 [4] ggpubr_0.4.0      forestmodel_0.6.2 ggplot2_3.3.3    
 [7] dabestr_0.3.0     magrittr_2.0.1    plyr_1.8.6       
[10] dplyr_1.0.4       sjstats_0.18.1    psych_2.1.3      
[13] car_3.0-10        carData_3.0-4     nvimcom_0.9-121  

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.6         mvtnorm_1.1-1      lattice_0.20-44   
 [4] tidyr_1.1.2        assertthat_0.2.1   R6_2.5.0          
 [7] cellranger_1.1.0   backports_1.2.1    pillar_1.4.7      
[10] rlang_0.4.10       curl_4.3           readxl_1.3.1      
[13] minqa_1.2.4        data.table_1.14.0  performance_0.7.2 
[16] nloptr_1.2.2.2     Matrix_1.3-3       effectsize_0.4.4-1
[19] splines_4.1.0      lme4_1.1-27        stringr_1.4.0     
[22] foreign_0.8-81     munsell_0.5.0      broom_0.7.6       
[25] compiler_4.1.0     modelr_0.1.8       pkgconfig_2.0.3   
[28] parameters_0.13.0  mnormt_2.0.2       tmvnsim_1.0-2     
[31] insight_0.14.0     tidyselect_1.1.0   tibble_3.0.6      
[34] rio_0.5.26         withr_2.4.1        crayon_1.4.0      
[37] MASS_7.3-54        sjmisc_2.8.7       grid_4.1.0        
[40] gtable_0.3.0       nlme_3.1-152       xtable_1.8-4      
[43] lifecycle_0.2.0    DBI_1.1.1          bayestestR_0.9.0  
[46] scales_1.1.1       zip_2.1.1          estimability_1.3  
[49] stringi_1.5.3      ggsignif_0.6.1     ellipsis_0.3.1    
[52] generics_0.1.0     vctrs_0.3.6        boot_1.3-28       
[55] openxlsx_4.2.3     sjlabelled_1.1.8   tools_4.1.0       
[58] forcats_0.5.1      glue_1.4.2         purrr_0.3.4       
[61] hms_1.0.0          emmeans_1.6.0      abind_1.4-5       
[64] parallel_4.1.0     colorspace_2.0-0   rstatix_0.7.0     
```
