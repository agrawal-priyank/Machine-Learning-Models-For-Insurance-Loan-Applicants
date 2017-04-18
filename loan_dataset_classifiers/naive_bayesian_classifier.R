# Loading dataset
loandata <- read.csv("loan.csv")

# Loading library
library (e1071)
library(caret)

# Splitting the dataset with 80/20% proportion
traindata <- loandata[1:343,]
testdata <- loandata[344:429,]

# Making the naive bayesian model
naivemodel <- naiveBayes(Decision ~ Sex+Age+Home_Expn+Balance+Res_status+Telephone+Job_status+
                           Time_bank+Time_employed, data = traindata, laplace = 3) 
naivemodel

# Predicting the output variable
prediction <- predict(naivemodel, testdata, threshold = 0.001)

# Building the confusion matrix
conf_matrix <- table(prediction, testdata[,14])
conf_matrix

# Calculating the accuracy of the model
total_pred <- sum(conf_matrix)
correct_pred <- conf_matrix[1,1] + conf_matrix[2,2]
correct_pred
wrong_pred <- conf_matrix[2,1] + conf_matrix[1,2]
wrong_pred
accuracy <- correct_pred * 100 / total_pred
accuracy