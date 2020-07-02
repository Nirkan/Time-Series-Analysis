
# Time series Data

data("AirPassengers")

AP <- AirPassengers

str(AP)

head(AP)

ts(AP, frequency = 12, start = c(1949,1))

attributes(AP)

plot(AP)


## Log Transformation : To reduce th fluctuation

AP <- log(AP)
plot(AP)


## Decomposition of additive time series

decomp <- decompose(AP)
decomp$figure

plot(decomp$figure,
     type = 'b',
     xlab = 'Month',
     ylab = 'Seasonality Index',
      col = 'blue',
      las = 2
      )


plot(decomp)
