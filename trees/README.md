Human Activity Recognition with pruned tree
======================

Introduction
==
Activity recognition aims to recognize the actions and goals of one or more subjects from a series of observations on the agents' actions and the environmental conditions [1]. This research field is catching more and more attention of several computer science communities due to its strength in providing personalized support for many different applications. It can be applied to different fields such as medicine, human-computer interaction, or sociology.
 
Mobiles are currently equipped with different sensors like accelerometer, magnetic field, and air pressure meter, which help in the process of extracting context of the user like location, situation etc. The accelerometer is a sensing element that measures the acceleration associated with the positioning of a weight in which it has been embedded (e.g. a mobile device) [2]. The most common accelerometer is the triaxial accelerometer, which can measure the acceleration on three axes (x, y and z). The axes are related with the movements forward/backward, left/right and up/down, respectively. 
In this study, we use the information provided by the accelerometer of the smartphone Samsung Galaxy S II [3] to classify five usual activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying. 

This study was carried out during ["Data Science Specialization" Course](https://www.coursera.org/course/dataanalysis) from Johns Hopkins University and Coursera 

Dataset
==
This study uses data consisting of 7352 measurements from the 30 subjects’ Samsung phone. Each observation contains information about the acceleration, angular velocity, amongst others features for each subject performing a particular activity. The activities recorded were walking, walking upstairs, walking downstairs, sitting, standing, and laying. 
The data were downloaded from the [course website](https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda)
on December 8, 2013 using the R programming language [5].  There is a code book for the variables in the data set available in [UCI Repository Machine Learning](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For our prediction task, we use data from subjects 1,2, ..., and 10 as training dataset. The test dataset is made up of the measurements from subjects 27, 28, 29, and 30. Notice training and test datasets does not overlap. After the subject selection, the training and test datasets are made up of 1904 and 371 observations, respectively.

Exploratory Analysis  
==
Principal Components Analysis (PCA) was applied to visualized data distribution. Figure shows two main principal components in training samples. 

![Alt text](https://github.com/lnicalo/smartphoneDataAnalysis/blob/master/images/PCA_training.jpg)

Prediction modeling  
==
Pruned trees
--
We use a pruned tree model to build a function that predicts what activity a subject is performing based on the quantitative measurements from the Samsung phone [6]. Tree model usually suffer from overvitting so we apply pruning. All features are taken into account to train the model. During the training process, each feature is selected or not automatically. 

The optimal amount of nodes is found by means of 10-fold cross validation. To measure the quality of each model, we employ the error rate to evaluate our prediction model. The error represents the proportion between the misclassified results and the number of trials. Figure shows the misclassification rate reaches the minimum when the number of nodes is 11. The tree model with 11 nodes yields a value of misclassification error rate of 2.744% on the training dataset.By means 10-fold cross validation, we found that the optimal number of nodes is 6. The tree size is fixed to 11.

![Alt text](https://github.com/lnicalo/smartphoneDataAnalysis/blob/master/images/CV_treesize.jpg)

Results
==
Pruned trees
--

Table 1 shows the confusion matrix on the test dataset. The error rate is 13.20 %.


|          |laying  |sitting |standing|walk    |walkdown|walkup  |
|----------|:------:|:------:|:------:|:------:|:------:|:------:|
|laying    |   74   |   0    |   0    |   0    |   0    |   0    |
|sitting   |   0    |   42   |   22   |   0    |   0    |   0    |
|standing  |   0    |   7    |   64   |   0    |   0    |   0    |
|walk      |   0    |   0    |   0    |   55   |   0    |   1    |
|walkdown  |   0    |   0    |   0    |   10   |   40   |   2    |
|walkup    |   0    |   0    |   1    |   2    |   4    |   47   |
**Table 1.** Confusion matrix

Conclusions
==
This analysis suggests that predicting the activity of a particular subject on the basis of the kinetic activity is possible with relatively low error rate. The results show the error rate in testing trials is 13.20 %. Interestingly, this prediction can be performed using only 5 features. 

Some limitations of this study should be remarked. First, the model was tested on only four different subjects and only five tasks are recognized. Second, tree models can provide easy to implement and interpret models but they can be easily prone to overfitting. 

Future work should be deal with some potential problems of this study. First of all, the study could be extended to more subjects and more complex tasks such running, practicing sports, etc. On the other hand, maybe other nonlinear methods such as support vector machines or artificial neural network might provide lower error rates [8].

References
==
1. Wikipedia “Activity recognition” page. URL:  http://en.wikipedia.org/wiki/Activity_recognition. Accessed 12/09/2013
2. Paniagua, C., Flores, H., & Srirama, S. N. (2012). Mobile Sensor Data Classiﬁcation for Human Activity Recognition using MapReduce on Cloud. Procedia Computer Science, 10, 585-592.
3. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 12/09/2013
4. Jeff Leek. (2013) “Example data analysis.”
URL: https://dl.dropbox.com/u/7710864/courseraPublic/exampleProject.zip. 
5. R Core Team (2012). ”R: A language and environment for statistical computing.” URL: http://www.R-project.org
6. Magerman, D. M. (1995, June). Statistical decision-tree models for parsing. In Proceedings of the 33rd annual meeting on Association for Computational Linguistics (pp. 276-283). Association for Computational Linguistics.
7. Dornhege G, Millán J d R, Hinterberger T, McFarland D and Müller K-R 2007 Toward brain-computer interfacing (Boston, MA: MIT press Cambridge) vol 74
8. Bishop, C. M., & Nasrabadi, N. M. (2006). Pattern recognition and machine learning (Vol. 1, p. 740). New York: springer.
