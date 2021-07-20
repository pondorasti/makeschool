# Support Vector Machine

# What is support vector machine (SVM)? (5 min)

- SVM is a type of supervised machine learning classification algorithm
- In case of linearly separable data in two dimensions, a typical machine learning algorithm tries to find a line that divides the data in such a way that the misclassification error can be minimized.
- For higher dimension data this line would be a hyperplane
- SVM chooses the decision boundary that maximizes the distance from the nearest data points of all the classes


## Class Learning Objectives/Competencies (5 min)

1. Identify and describe
1. Define
1. Design
1. Implement

## Initial Exercise (15 min)

- SVM illustration on two-dimensional space
- Question: which one of the lines show the correct decision boundary from SVM? Why?
- What is support vector?
- Support vectors are the data-points that lie closest to the decision boundary


## In Class Activity I (30 min)

- SVM training
- obtain its support vectors
- visualize the decision boundary and check SVM performance
- Task: Follow the steps in https://people.revoledu.com/kardi/tutorial/Python/SVM+in+Python.html
1. Create the dataset
1. Define the SVM model as the classifier
1. Fit the SVM with training dataset
1. Obtain its support vectors
1. Obtain the score of the trained SVM model


## Overview/TT II  (10 min)

- How to Handle data that is not linearly separable
- Based on the dataset, it is possible that can not find a line that separate the two classes or even a curve can not easily separate the classes
- In both cases, defining a kernel or mapping the dataset to higher dimension will solve the problem.

## In Class Activity II (40 min)

- Apply kernel to SVM
- Compare the classification score for linear and second order polynomial kernel for given dataset
- Find the best C and Gamma for SVM classifier with RBF kernel for iris dataset
- Obtain the accuracy with 5-fold cross validation for iris dataset with SVM classifier

## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

## Additional Resources

1. Links to additional readings and videos
