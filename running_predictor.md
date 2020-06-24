Running Predictor
================
James P. Hare
June 24, 2020

## The Model

I have been recording my runs in [Strava](https://www.strava.com/) for
about five years. I wanted to see if I could use this data to make
predictions about my racing pace. I downloaded my data from the website,
including a
[spreadsheet](https://github.com/jamesphare/running_predictor/blob/master/activities.csv)
collecting all my activity data (I’ve deleted some data from this file
for privacy reasons).

I spent [some
time](https://github.com/jamesphare/running_predictor/blob/master/running_project_notebook.md)
using visualizations and linear models to determine which variables
would provide the most predictive power. I looked into trying to predict
both race and non-race paces, and I considered factors including age,
distance, elevation gain (both relative and absolute), amount of
training, recovery, and season.

While I have much more data on my overall running than I do on the small
number of races that I have run, I found too much variability in my
running pace that cannot be explained through these data. Was I taking
it easy or doing a workout? Had I eaten breakfast? How hot was it?

With races, much of this variability no longer applies. In a race, I’m
going to try to go as fast as possible and pay attention to proper rest
and nutrition, as far as it is under my control.

After trying out various models, I found the model with the most
significance and explanatory power was a simple one that only took into
account the length of the race and the amount of training I did over the
previous twelve weeks.

### Racing Pace Model

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

### Analysis of Variance Table

    ## Analysis of Variance Table
    ## 
    ## Response: pace
    ##           Df Sum Sq Mean Sq F value    Pr(>F)    
    ## Distance   1 9122.4  9122.4  51.421 3.029e-05 ***
    ## training   1 4876.8  4876.8  27.489 0.0003772 ***
    ## Residuals 10 1774.1   177.4                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

### Confidence Intervals

    ##                   2.5 %       97.5 %
    ## (Intercept) 318.8588806 365.26219053
    ## Distance      2.0835409   3.53383942
    ## training     -0.2444886  -0.09866009

This simple model explains much of the variability in my racing pace
with a fairly high degree of confidence. It seems that how much I train
for a race does indeed have a direct and measurable impact on my
performance. Adjusting for the length of the race, Every kilometer I run
in the twelve weeks prior to the race results in an improvement of .17
seconds per kilometer (with a 95% confidence interval beteen .10 and .24
seconds).
