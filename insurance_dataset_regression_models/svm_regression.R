install.packages("e1071")
install.packages("dplyr")
library(dplyr)
library("e1071")
install.packages("AppliedPredictiveModeling")
install.packages("caret")
library(lattice)
library(ggplot2)
library(caret)
library(AppliedPredictiveModeling)
library(gbm)
library(survival)
train_cleaned<- read.csv("train_cleanedfinal.csv")
train_cleaned600=train_cleaned[1:4000,]
dim(train_cleaned600)
head(train_cleaned600)
train_cleaned600$X<-NULL
####removing the rudundant varibles 
#Identifying numeric variables
trainset <- train_cleaned600[sapply(train_cleaned600, is.numeric)]
dim(trainset)
class(trainset[60,60])
sum(is.na(trainset))

##Removing NA(based on the linear regression, delete the columns which are highly corelated)
trainset$X<-NULL
trainset$Employment_Info_3_3<-NULL
trainset$Employment_Info_5_3<-NULL
trainset$Family_Hist_1_3<-NULL
trainset$Insurance_History_1_2<-NULL
trainset$Insurance_History_2_3<-NULL
trainset$Insurance_History_3_3<-NULL
trainset$Insurance_History_4_3<-NULL
trainset$Insurance_History_7_3<-NULL
trainset$Insurance_History_8_3<-NULL
trainset$Insurance_History_9_3<-NULL
trainset$InsuredInfo_1_3<-NULL
trainset$InsuredInfo_2_3<-NULL
trainset$InsuredInfo_4_3<-NULL
trainset$InsuredInfo_5_3<-NULL
trainset$InsuredInfo_6_2<-NULL
trainset$InsuredInfo_7_3<-NULL
trainset$Medical_History_11_3<-NULL
trainset$Medical_History_12_3<-NULL
trainset$Medical_History_13_3<-NULL
trainset$Medical_History_14_2<-NULL
trainset$Medical_History_14_3<-NULL
trainset$Medical_History_16_2<-NULL
trainset$Medical_History_16_3<-NULL
trainset$Medical_History_17_1<-NULL
trainset$Medical_History_17_3<-NULL
trainset$Medical_History_18_3<-NULL
trainset$Medical_History_19_3<-NULL
trainset$Medical_History_20_3<-NULL
trainset$Medical_History_21_3<-NULL
trainset$Medical_History_22_2<-NULL
trainset$Medical_History_23_3<-NULL
trainset$Medical_History_25_3<-NULL
trainset$Medical_History_26_3<-NULL
trainset$Medical_History_27_3<-NULL
trainset$Medical_History_28_3<-NULL
trainset$Medical_History_29_3<-NULL
trainset$Medical_History_3_3<-NULL
trainset$Medical_History_30_3<-NULL
trainset$Medical_History_31_2<-NULL
trainset$Medical_History_31_3<-NULL
trainset$Medical_History_33_3<-NULL
trainset$Medical_History_34_2<-NULL
trainset$Medical_History_34_3<-NULL
trainset$Medical_History_35_2<-NULL
trainset$Medical_History_35_3<-NULL
trainset$Medical_History_36_3<-NULL
trainset$Medical_History_37_3<-NULL
trainset$Medical_History_38_2<-NULL
trainset$Medical_History_39_2<-NULL
trainset$Medical_History_39_3<-NULL
trainset$Medical_History_4_2<-NULL
trainset$Medical_History_40_2<-NULL
trainset$Medical_History_40_3<-NULL
trainset$Medical_History_41_3<-NULL
trainset$Medical_History_5_3<-NULL
trainset$Medical_History_6_3<-NULL
trainset$Medical_History_7_3<-NULL
trainset$Medical_History_8_3<-NULL
trainset$Medical_History_9_3<-NULL
trainset$Product_Info_1_2<-NULL
trainset$Product_Info_2_E1<-NULL
trainset$Product_Info_5_3<-NULL
trainset$Product_Info_6_3<-NULL
trainset$Product_Info_7_3<-NULL
dim(trainset)

library(randomForest)

#Train Random Forest
rf <-randomForest(Response~.,data=trainset, importance=TRUE,ntree=1000)

#Evaluate variable importance
imp = importance(rf, type=1)
imp <- data.frame(predictors=rownames(imp),imp)

# Order the predictor levels by importance
imp.sort <- arrange(imp,desc(X.IncMSE))
imp.sort$predictors <- factor(imp.sort$predictors,levels=imp.sort$predictors)

# Select the top 20 predictors
imp.20<- imp.sort[1:20,]
print(imp.20)

# Plot Important Variables
varImpPlot(rf, type=1)

# Subset data with 20 independent and 1 dependent variables
trainset$Response
trainsetMODEL = cbind(Response = trainset$Response, trainset[,c(imp.20$predictors)])
head(trainsetMODEL)

#Now split the data into a training set (80%) and a test set (20%):
## Prepare a training and a test set ##
n<-nrow(trainsetMODEL)
n
ntrain <- round(n*0.8) # number of training examples
tindex <- sample(n,ntrain) # indices of training samples
xtrain <- trainsetMODEL[tindex,]
head(xtrain)
xtest <- trainsetMODEL[-tindex,]
head(xtest)

ytrain <- trainsetMODEL[tindex,1]

ytest <- trainsetMODEL[-tindex,1]

# Create SVM Model and show summary
#x <- subset(xtrain,ytrain, select=-Response)
#y <- trainsetMODEL$Response
svm_model <- svm(xtrain,ytrain)
summary(svm_model)

# Run Prediction and you can measuring the execution time in R
pred <- predict(svm_model,xtrain)
system.time(pred <- predict(svm_model,xtrain))

# See the confusion matrix result of prediction, using command table to compare the result of SVM
# prediction and the class data in y variable.
table(pred,ytrain)

# TUning SVM to find the best cost and gamma ..
svm_tune <- tune(svm, train.x=xtrain, train.y=ytrain, 
                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))
print(svm_tune)

# After you find the best cost and gamma, you can create svm model again and try to run again
svm_model_after_tune <- svm(xtrain,ytrain, kernel="radial", cost=10, gamma=0.5)
summary(svm_model_after_tune)

# Run Prediction again with new model
pred <- predict(svm_model_after_tune,xtrain)
system.time(predict(svm_model_after_tune,xtrain))

# See the confusion matrix result of prediction, using command table to compare the result of SVM
# prediction and the class data in y variable.
table(round(pred),ytrain)

# Predict labels on test
ypred = predict(svm_model_after_tune,xtest)
table(ytest,ypred)
# Compute accuracy
round(ypred)
mean((ypred-ytest)^2)

# Compute at the prediction scores
ypredscore = predict(svm_model_after_tune,xtest,type="decision")
ypredscore