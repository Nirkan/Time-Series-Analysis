
## Time series Data

data("AirPassengers")

AP <- AirPassengers


## ARIMA - Autoregression Integreated Moving Average

library(forecast)

model <- auto.arima(AP)

print(model)

attributes(model)


## ACF and PACF plots

acf(model$residuals, main = "Correlogram")

pacf(model$residuals, main = 'Partial Correlogram')


## Ljung-Box test

Box.test(model$residuals, lag=20, type = "Ljung-Box")


## Residual plot

hist(model$residuals, 
     col = 'darkgreen',
     xlab = 'Error',
     main = 'Histogram of Residuals',
     freq = FALSE)

lines(density(model$residuals))


## Forescast

f <- forecast(model, 48)

library(ggplot2)

autoplot(f)

accuracy(f)

