
## Data 

data <- read.table(file.choose(), header = F, sep = "")

str(data)

plot(data[,60], type = 'l')

j <- c(5, 105, 205, 305, 405, 505)

sample <- t(data[j,])

plot.ts(sample,
        main = "Time-series Plot",
        col = 'darkgreen',
        type = 'b')


## Data preparation

n <- 10

s <- sample(1:100, n)

i <- c(s,100+s, 200+s, 300+s, 400+s, 500+s)

d <- data[i,]

str(d)

pattern <- c(rep('Normal', n),
             rep('Cyclic', n),
             rep('Increasing trend', n),
             rep('Decreasing trend', n),
             rep('Upward shift', n),
             rep('Downward shift', n))


## Calculate distances

library(dtw)

distance <- dist(d, method = "DTW")


## Hierarchical clustering

hc <- hclust(distance, method = 'average')

plot(hc,
     labels = pattern,
     cex = 0.5,
     hang = -1,
     col = 'blue')

rect.hclust(hc, k = 4)        # Specifying number of clusters
