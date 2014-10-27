Human Activity Recognition Using Smartphones Dataset
======================

Introduction
==
Activity recognition aims to recognize the actions and goals of one or more subjects from a series of observations on the agents' actions and the environmental conditions [1]. This research field is catching more and more attention of several computer science communities due to its strength in providing personalized support for many different applications. It can be applied to different fields such as medicine, human-computer interaction, or sociology.
 
Mobiles are currently equipped with different sensors like accelerometer, magnetic field, and air pressure meter, which help in the process of extracting context of the user like location, situation etc. The accelerometer is a sensing element that measures the acceleration associated with the positioning of a weight in which it has been embedded (e.g. a mobile device) [2]. The most common accelerometer is the triaxial accelerometer, which can measure the acceleration on three axes (x, y and z). The axes are related with the movements forward/backward, left/right and up/down, respectively. 

In this study, we use the information provided by the accelerometer of the smartphone Samsung Galaxy S II [3] to classify five usual activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying. Several classifiers are tested.

Dataset
==
This study uses data consisting of 10299 measurements from the 30 subjects’ Samsung phone. Each observation contains information about the acceleration, angular velocity, amongst others features for each subject performing a particular activity. The activities recorded were walking, walking upstairs, walking downstairs, sitting, standing, and laying. 
The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

There is a code book for the variables in the data set available in [UCI Repository Machine Learning](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Methods
==
A deep belief network (DBN) is used to classify the instances. A very short and concise tutorial on deep learning and DBN in particular can be found [here](http://www.pyimagesearch.com/2014/09/22/getting-started-deep-learning-python).

Deep learning has been shown very effective in some classification tasks such as digit recognition. Here, a DBN is applied to recognize activity.

The DBN is configured with usual parameters. Nevertheless, other configuration could be equally effective. The first configurable parameter is the  number of nodes in the hidden layer. This hidden layer is represented as RBM with 2000 nodes. The output of the 2000 node hidden layer is fed into the output layer, which consists of an output for each of the class labels. Learn rate and learn rate decays are fixed to 0.1 and 0.9 respectively. The number of epochs, or iterations of the training data, is set to 10.

Results
==

References
==
1. Wikipedia “Activity recognition” page. URL:  http://en.wikipedia.org/wiki/Activity_recognition. Accessed 12/09/2013
2. Paniagua, C., Flores, H., & Srirama, S. N. (2012). Mobile Sensor Data Classiﬁcation for Human Activity Recognition using MapReduce on Cloud. Procedia Computer Science, 10, 585-592.
3. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Accessed 12/09/2013
