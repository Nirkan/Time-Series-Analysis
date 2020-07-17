
# check datasets Johnson and Johnson in astsa package

help(jj)
astsa::jj


# plot data since data jj is already a time series data

plot(astsa::jj, type = 'o', main = 'Johnson&Johnson quaterly earnings per share',
     ylab = 'Earnings', xlab = 'Years', col = 'blue')



# check data flu

help(jj)

# plot flu dataset

plot(astsa::flu, main = 'Monthly Pneumonia and Influenza Deaths in US', 
     xlab = 'Months', ylab =  'Number of Deaths per 10,000 people' )



# check and plot global temp data

library(astsa)

plot(globtemp, main = 'Global mean land-ocean deviations from average temperature of 1951-1980',
     ylab = 'Temperature deviations', type = 'o', xlab = 'Years', col = 'red')



# Plot star data

plot(star, main = 'The magnitude of star taken at midnight for 600 consecutive days', 
     ylab = 'Magnititude', xlab = 'days', col = 'red')



# Purely random processes

purely_random_processes = ts(rnorm(100))

print(purely_random_processes)


# ACF (Autocovariance coefficients)

(acf(purely_random_processes, type = 'covariance'))


# Produce correlograms

(acf(purely_random_processes, main = 'Correlogram of a purely random processes'))



## Random walk

x = NULL

x[1] = 0

for(i in 2:1000) {
  x[i] = x[i - 1] + rnorm(1)
}

print(x)

random_walk = ts(x)

plot(random_walk, main = 'A random walk', ylab = ' ', xlab = ' Days ', 
     col = 'darkgreen')

acf(random_walk)  # we obtain a high correlation in the dataset and no stationarity


# Removing the trend

diff(random_walk)

plot(diff(random_walk))

acf(diff(random_walk))


## Moving Averages

# Generate noise

noise = rnorm(10000)

# Introduce a variable

ma_2 = NULL

# Loop for generating MA(2) process

for(i in 3:10000 ){
  ma_2[i] = noise[i] + 0.7*noise[i-1] + 0.2*noise[i-2]
}

# Shift data to left by 2 units

moving_average_process = ma_2[3:10000]

# Put time series structure on a vanilla data

moving_average_process = ts(moving_average_process)

# Partition output graphics as a multi frame of 2 rwos and 1 column 

par(mfrow = c(2, 1))

# Plot the process and plot its ACF

plot(moving_average_process, main = 'A mving average process of order 2',
     ylab = ' ', col = 'red')

acf(moving_average_process, main = 'Corellogram of a  moving average process of order 2')
