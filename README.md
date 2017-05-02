# Machine Learning
Simple machine learning models in r.

# Description
This is the part of the midterm and final projects for Advances in Data Science and Architecture course.
## Insurance Dataset
1. Implemented Linear Regression, Decision Tree Regression and Support Vector Machines on the Prudential Life Insurance data-set provided by Kaggle to assess whether the applicant for life insurance should be accepted or rejected from scale of 1 to 8.
2. Performed Data pre-processing and cleaning of the data-set by normalizing all the values of continuous variables from 0 to 1.
3. Performed 1 to N transformation of the categorical columns having more than 2 categories and Binary transformation of the columns having categories.
4. Calculated the RMSE (Root Mean Squared Error) values to assess the accuracy of all the three models and concluded the Linear Regression model to be the most accurate one.

## Loan Dataset
1. Implemented Naive Bayesian Classifier and Neural Networks to classify whether loan applicant should either be accepted or rejected.
2. Performed 1 to N transformation of the categorical variables for Neural model.
3. Used K-folds cross validation technique to build the optimal model and concluded the NBC model to be more accurate than the Neural model.

# Code Implementations
## Insurance Dataset
1. [Decision Tree Regression](https://github.com/agrawal-priyank/machine-learning-projects/blob/master/insurance_dataset_regression_models/decision_tree_regression.R)
2. [Linear Regression](https://github.com/agrawal-priyank/machine-learning-projects/blob/master/insurance_dataset_regression_models/linear_regression.R)
3. [SVM Regression](https://github.com/agrawal-priyank/machine-learning-projects/blob/master/insurance_dataset_regression_models/svm_regression.R)

## Loan Dataset
1. [Naive Bayesian Classifier](https://github.com/agrawal-priyank/machine-learning-projects/blob/master/loan_dataset_classifiers/naive_bayesian_classifier.R)
2. [Neural Networks Classifier](https://github.com/agrawal-priyank/machine-learning-projects/blob/master/loan_dataset_classifiers/neural_networks_classifier.R)

# Technologies
R

# IDE
RStudio
