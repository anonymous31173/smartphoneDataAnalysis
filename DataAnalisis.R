# libraries
library(tree)
library(ggplot2)

# Load data
load("samsungData.rda")

# Suitable names in samsungData data frame
source('fixed.name.mapping.R')
names(samsungData) <- make.names(names(samsungData), unique = TRUE)

# Training dataset
trainData <- samsungData[samsungData$subject %in% c(1:10),]
trainData$subject <- NULL
trainData$activity <- as.factor(trainData$activity)

# Test dataset
testData <- samsungData[samsungData$subject == c(27,28,29,30),]
testData$subject <- NULL;
testData$activity <- as.factor(testData$activity)

# Train tree
tm <- tree(activity ~ . , trainData)

# Plot tree structure
plot(tm)
text(tm)

# Print tree summary 
print(summary(tm))

# Cross validation
set.seed(32313)
par(mfrow=c(1,2))
plot(cv.tree(tm, FUN = prune.tree, method = "misclass"))
plot(cv.tree(tm))

# Classification tree
pred_test <- predict(tm, testData, type = "class")

# Prediction results with tree
testRes_tm <- table(testData$activity, pred_test)
print(testRes_tm)
print(1 - sum(diag(testRes_tm)) / sum(testRes_tm))

# Classification pruned tree
tm_pruned <- prune.tree(tm, best = 11)
pred_test <- predict(tm_pruned, testData, type = "class")

# Prediction results with pruned tree
## Confusion matrix
testRes_pruned <- table(testData$activity, pred_test)
print(testRes_pruned)
# Error rate
print(1-sum(diag(testRes_pruned)) / sum(testRes_pruned))