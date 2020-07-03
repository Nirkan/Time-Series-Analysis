
## Data Preparation

pattern100 <- c(rep('Normal', 100),
                rep('Cyclic', 100),
                rep('Increasing trend', 100),
                rep('Decreasing trend', 100),
                rep('Upward shift', 100),
                rep('Downward shift', 100))

pattern100 <- as.factor(pattern100)   # Since datatype of pattern100 is character it will not work with classification tree.


newdata <- data.frame(data, pattern100)

str(newdata)



## Classification with decision tree

library(party)

tree <- ctree(pattern100 ~., newdata)        # ctree = classificatoin tree



## Classification performance

Table <- table(Predicted = predict(tree, newdata), Actual = newdata$pattern100 )

Accuracy <- sum(diag(Table))/sum(Table)

print(Accuracy)
