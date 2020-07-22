
# Install packages and libraries

library(forecast)

data("AirPassengers")

class(AirPassengers)

start(AirPassengers)

end(AirPassengers)

frequency(AirPassengers)

sum(is.na(AirPassengers))

summary(AirPassengers)

AirPassengers


## Explore 

tsdata <- ts(AirPassengers, frequency = 12)

ddata <- decompose(tsdata, "multiplicative")

plot(tsdata)

plot(ddata)

plot(ddata$trend)

plot(ddata$seasonal)

plot(ddata$random)


## Original data

plot(AirPassengers)

abline(reg = lm(AirPassengers~time(AirPassengers)))

cycle(AirPassengers)


# Boxplot of the cycle

boxplot(AirPassengers~cycle(AirPassengers), xlab = "Date")


# Stationarity

plot(AirPassengers)


# Ask R for the best model

mymodel <- auto.arima(AirPassengers)

mymodel


#  Lets run with trace to compare the information criterion

auto.arima(AirPassengers, ic = "aic", trace = TRUE)


## Testing the model
# Install.pakacage('tseries')

library(tseries)

plot.ts(mymodel$residuals)

acf(ts(mymodel$residuals), main = "ACF Residual")

pacf(ts(mymodel$residuals), main = "PACF Residual")


# Using the model to forecast for the next 10 years

myforecast <- forecast(mymodel, level = c(95), h = 10*12)

plot(myforecast)


# Test (Box-test)

Box.test(mymodel$resid, lag = 5, type = 'Ljung-Box')

Box.test(mymodel$resid, lag = 10, type = 'Ljung-Box')

Box.test(mymodel$resid, lag = 15, type = 'Ljung-Box')

