## Machine Learning: Regression and Classifier Models

### Description
#### Prudential Life Insurance Dataset
* Created different prediction models using linear regression, decision tree regression, and support vector machines algorithm on the Prudential Life Insurance dataset provided by Kaggle to assess whether the applicant for life insurance should be accepted or rejected.
* Performed data pre-processing and cleaned the dataset by normalizing all the values of continuous features from 0 to 1.
* Performed 1 to N transformation of the categorical features having more than 2 categories and binary transformation of the features having 2 categories.
* Calculated the root mean squared error to assess the accuracy of all the three models and concluded the linear regression model to be the most accurate one.

#### Loan Lending Club Dataset
* Built different classifiers using naive bayesian and neural networks algorithm to classify whether a loan applicant should be accepted or rejected.
* Performed 1 to N transformation of the categorical features and used k folds cross validation technique to build an optimal model.
* Concluded naive bayesian model to be more accurate than the neural networks model.

### Code
#### Insurance Dataset
1. [Decision Tree Regression](https://github.com/agrawal-priyank/Machine-Learning-Models-For-Insurance-Loan-Applicants/blob/master/insurance_dataset_regression_models/decision_tree_regression.R)
2. [Linear Regression](https://github.com/agrawal-priyank/Machine-Learning-Models-For-Insurance-Loan-Applicants/blob/master/insurance_dataset_regression_models/linear_regression.R)
3. [SVM Regression](https://github.com/agrawal-priyank/Machine-Learning-Models-For-Insurance-Loan-Applicants/blob/master/insurance_dataset_regression_models/svm_regression.R)

#### Loan Dataset
1. [Naive Bayesian Classifier](https://github.com/agrawal-priyank/Machine-Learning-Models-For-Insurance-Loan-Applicants/blob/master/loan_dataset_classifiers/naive_bayesian_classifier.R)
2. [Neural Networks Classifier](https://github.com/agrawal-priyank/Machine-Learning-Models-For-Insurance-Loan-Applicants/blob/master/loan_dataset_classifiers/neural_networks_classifier.R)

### Programming Language
R

### Tools/IDE 
RStudio
