from nolearn.dbn import DBN
import numpy as np
import pandas as pd
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report

# File
trainFile = "UCI HAR Dataset/train/X_train.txt"
trainLabelsFile = "UCI HAR Dataset/train/y_train.txt"

testFile = "UCI HAR Dataset/test/X_test.txt"
testLabelsFile = "UCI HAR Dataset/test/y_test.txt"

outputFile = "output.csv"

# Loading training data
print "loading train features and labels ..."
trainFeats = pd.read_csv(trainFile, delim_whitespace=True, header=None)
trainFeats = trainFeats.as_matrix()
trainLabels = pd.read_csv(trainLabelsFile, header=None).values.ravel()

# normalization (recommendable)
trainFeats -= trainFeats.min()
trainFeats /= trainFeats.max()

# Loading test data
print "loading test features and labels ..."
testFeats = pd.read_csv(testFile, delim_whitespace=True, header=None)
testFeats = testFeats.as_matrix()
testLabels = pd.read_csv(testLabelsFile, header=None).values.ravel()

# normalization (recommendable)
testFeats -= testFeats.min()
testFeats /= testFeats.max()

dbn = DBN(
    [trainFeats.shape[1], 2000, 7],
    learn_rates=0.1,
    learn_rate_decays=0.9,
    epochs=10,
    verbose=1)
dbn.fit(trainFeats, trainLabels)
predictedTest = dbn.predict(testFeats)

# Print classification report
print(classification_report(testLabels, predictedTest))

# Print confusion matrix
print(confusion_matrix(testLabels, predictedTest))

