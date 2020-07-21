
## Simulate an AR(1)

set.seed(2016);

N = 1000 ; 

phi = .4;

Z = rnorm(N,0,1) ;

X = NULL

X[1] = Z[1]


for (t in 2:N) {
  X[t] = Z[t] + phi*X[t-1];
}


X.ts = ts(X)

par(mfrow = c(2,1))

plot(X.ts, main = "AR(1) Time Series on White Noise, phi = .4")

X.acf = acf(X.ts, main = "AR(1) Time Series on White Noise, phi = .4")


# For phi = 1

set.seed(2016);

N = 1000 ; 

phi = 1;

Z = rnorm(N,0,1) ;

X = NULL

X[1] = Z[1]


for (t in 2:N) {
  X[t] = Z[t] + phi*X[t-1];
}


X.ts = ts(X)

par(mfrow = c(2,1))

plot(X.ts, main = "AR(1) Time Series on White Noise, phi = 1")

X.acf = acf(X.ts, main = "AR(1) Time Series on White Noise, phi = 1")



## AR(2) process

set.seed(2017)

X.ts <- arima.sim(list(ar = c(.7,.2)), n = 1000)

par(mfrow = c(2,1))

plot(X.ts, main = "AR(2) Time Series, phi1 = .7, phi2 = .2")

X.acf = acf(X.ts, main = "Autocorrelation of AR(2) Time Series")


# AR(2) process for phi1 = .5, phi2 = - 0.4

phi1 = 0.5 ;  phi2 = -0.4

X.ts <- arima.sim(list(ar = c(phi1, phi2)), n = 1000)

par(mfrow = c(2,1))

plot(X.ts, main = paste("AR(2) Time Series, phi1, phi2 = 0.5, -0.4"))

X.acf = acf(X.ts, main="Autocorrelation of AR(2) TimeSeries")

