# Model Evaluation [Slides](https://github.com/Make-School-Courses/DS-2.1-Machine-Learning/blob/master/Notebooks/simple_Model_Evaluation.ipynb)

# Cross Validation (5 min)

- Normally in a machine learning process, data is divided into training and test sets
- The training set is used to train the model and the test set is used to evaluate the performance of a model
- Splitting the dataset to train and test, then evaluate the model result based on that would vary if change our splitting rule
- Question: What should we do then?
- Answer: divide the data into K folds. Out of the K folds, K-1 sets are used for training while the remaining set is used for testing. The result of the K-Fold Cross-Validation is the average of the results obtained on each set.


## Activity: Obtain the accuracy with 5-fold cross validation for iris dataset with SVM classifier (15 min)

- `from sklearn.model_selection import cross_val_score  
all_accuracies = cross_val_score(estimator=classifier, X=X.data, y=y.label, cv=5)`

## Grid Search for Parameter Selection (5 min)

- Machine learning models have hyper-parameters. To know which values of hyper-parameters give the best result we need grid search


## Activity: Find the best C and Gamma for SVM classifier with RBF kernel for iris dataset (20 min)
```
from sklearn import svm, grid_search
 def svc_param_selection(X, y, nfolds):
    Cs = [0.001, 0.01, 0.1, 1, 10]
    gammas = [0.001, 0.01, 0.1, 1]
    param_grid = {'C': Cs, 'gamma' : gammas}
    grid_search = GridSearchCV(svm.SVC(kernel='rbf'), param_grid, cv=nfolds)
    grid_search.fit(X, y)
    return grid_search.best_params_
```
## A Classifier Model Performance Evaluation  (10 min)

- The material for evaluating a classifier here are applied to all classifiers
- We focused our concentration to Logistic Regression
- Read this to understand what is Logistic Regression: https://www.datacamp.com/community/tutorials/understanding-logistic-regression-python

## Activity: Obtain confusion matrix, accuracy, precision, recall for pima Diabetes dataset (30 min)

- Load the dataset: `pd.read_csv('diabetes.csv')`
- Use these features: `feature_cols = ['Pregnancies', 'Insulin', 'BMI', 'Age']`
- split the data to train and test: `X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=0)`
- Instantiate logistic regression model
- Obtain the statistics of y_test
- Obtain the confusion matrix
https://www.ritchieng.com/machine-learning-evaluate-classification-model/

## Basic terminology (10 min)

- True Positives (TP): we correctly predicted that they do have diabetes: 15
- True Negatives (TN): we correctly predicted that they don't have diabetes: 118
- False Positives (FP): we incorrectly predicted that they do have diabetes (a "Type I error"): 12
- False Negatives (FN): we incorrectly predicted that they don't have diabetes (a "Type II error"): 47

## What is accuracy, recall and precision? (10 min)

- Accuracy: overall, how often is the classifier correct?
- Classification error: overall, how often is the classifier incorrect?
- Recall: when the actual value is positive, how often is the prediction correct?
- Precision: When a positive value is predicted, how often is the prediction correct?
- Specificity: When the actual value is negative, how often is the prediction correct?

## Activity : The difference between `.predict()` and `.predict_proba` for a classifier

- Apply these two methods to Pima Indian Diabetes dataset
https://www.ritchieng.com/machine-learning-evaluate-classification-model/
