Human Activity Recognition Using Smartphones Dataset
======================

Introduction
==
Activity recognition aims to recognize the actions and goals of one or more subjects from a series of observations on the agents' actions and the environmental conditions [1]. This research field is catching more and more attention of several computer science communities due to its strength in providing personalized support for many different applications. It can be applied to different fields such as medicine, human-computer interaction, or sociology.
 
Mobiles are currently equipped with different sensors like accelerometer, magnetic field, and air pressure meter, which help in the process of extracting context of the user like location, situation etc. The accelerometer is a sensing element that measures the acceleration associated with the positioning of a weight in which it has been embedded (e.g. a mobile device) [2]. The most common accelerometer is the triaxial accelerometer, which can measure the acceleration on three axes (x, y and z). The axes are related with the movements forward/backward, left/right and up/down, respectively. 

In this study, we use the information provided by the accelerometer of the smartphone Samsung Galaxy S II [3] to classify five usual activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying. Several classifiers are tested.

Dataset
==
This study uses data consisting of 7352 measurements from the 30 subjects’ Samsung phone. Each observation contains information about the acceleration, angular velocity, amongst others features for each subject performing a particular activity. The activities recorded were walking, walking upstairs, walking downstairs, sitting, standing, and laying. 
The data file "samsungData.rda" can be downloaded from the [course website](https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda).  There is a code book for the variables in the data set available in [UCI Repository Machine Learning](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

References
==
1. Wikipedia “Activity recognition” page. URL:  http://en.wikipedia.org/wiki/Activity_recognition. Accessed 12/09/2013
2. Paniagua, C., Flores, H., & Srirama, S. N. (2012). Mobile Sensor Data Classiﬁcation for Human Activity Recognition using MapReduce on Cloud. Procedia Computer Science, 10, 585-592.
3. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 12/09/2013
