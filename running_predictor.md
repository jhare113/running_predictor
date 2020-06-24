Running Predictor
================
James P. Hare

    ## 
    ## Call:
    ## lm(formula = pace ~ Distance + training, data = races)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -20.537  -7.097   1.153  10.061  20.001 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 342.06054   10.41302  32.849 1.61e-11 ***
    ## Distance      2.80869    0.32545   8.630 6.02e-06 ***
    ## training     -0.17157    0.03272  -5.243 0.000377 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 13.32 on 10 degrees of freedom
    ## Multiple R-squared:  0.8875, Adjusted R-squared:  0.865 
    ## F-statistic: 39.46 on 2 and 10 DF,  p-value: 1.8e-05

    ##                   2.5 %       97.5 %
    ## (Intercept) 318.8588806 365.26219053
    ## Distance      2.0835409   3.53383942
    ## training     -0.2444886  -0.09866009
