
## Entering data in R

data.1 = c(35, 8, 10, 23, 42)

print(data.1)

summary(data.1)

mean(data.1)

sum(data.1)/5

sd(data.1)


## Histogram in R

small.size.dataset = c(91,49,76,112,97,42,70, 100, 8, 112, 95, 90, 78, 62, 56, 94, 65, 58, 109, 70, 109, 91, 71, 76, 68, 62, 134, 57, 83, 66)

hist(small.size.dataset)

hist(small.size.dataset, xlab = 'My data points')

hist(small.size.dataset, xlab = 'My data points', main = 'Histogram for my data set', freq = F)

hist(small.size.dataset, xlab = 'My data points', main = 'Histogram for my data set', freq = F, col = 'orange')

hist(small.size.dataset, xlab = 'My data points', main = 'Histogram for my data set', freq = F, col = 'blue')
lines(density(small.size.dataset), col = 'red', lwd = 5)

hist(small.size.dataset, xlab = 'My data points', main = 'Histogram for my data set', freq = F, col = 'green', breaks = 10)
lines(density(small.size.dataset), col = 'red', lwd = 5)




## Scatter plot (Bivariate data)

set.seed(2016)

Test_1_scores = round(rnorm(50, 78, 10))

Test_2_scores = round(rnorm(50, 78, 14))

Test_1_scores

Test_2_scores

plot(Test_2_scores ~ Test_1_scores)

plot(Test_2_scores ~ Test_1_scores, 
     main = 'Test scores for two exams(50 students)', 
     xlab = 'Test 1 scores', ylab = 'Test 2 scores', col = 'blue')




## Simple linear Regression

x = c(1,2,3,4);

y = c(5, 7, 12, 13);

m = lm(y~x)

print(m)


# Co2 data set

help(co2)

plot(co2, main = 'Atmospheric co2 Concentration')

co2.linear.model = lm(co2 ~ time(co2))

co2.linear.model

abline(co2.linear.model)   # intercept slope line

co2.lm = lm(co2 ~ time(co2))

co2.residuals = resid(co2.lm)

hist(co2.residuals, main = 'Histogram of Residuals', col = 'pink')

qqnorm(co2.residuals, col = 'blue')    # quantile quantile norm

qqline(co2.residuals, col = 'red')

plot( co2.residuals ~ time(co2), xlim = c(1960, 1963),
      main = 'Zoomed Residuals')

## Inference statistics (Hypothesis testing) : The Gossett Data 

help(sleep)

format(sleep)

plot(extra ~ group, data = sleep, main = 'Extra sleep in Gossett Data by Group')

attach(sleep)

extra.1 = extra[group == 1]

extra.2 = extra[group == 2]

# Test the Hypothesis !

t.test(extra.1, extra.2, paired = TRUE, alternative = "two.sided")



## ACF (Auto Correlation Function)

help(trees)

pairs(trees, pch = 21, bg = c("red"))  # pairwise plotting
