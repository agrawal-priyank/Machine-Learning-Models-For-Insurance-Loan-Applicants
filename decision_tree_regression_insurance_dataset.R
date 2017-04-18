#midterm project
#decision tree regression

#load the dataset
prud <- read.csv("cleaned_train_data.csv")
prud$X <- NULL
str(prud)

#plot the target variable
hist(prud$ResponseNEW)
summary(prud)
nrow(prud)

#split the dataset
prud_train <- prud[1:50000,]
prud_test <- prud[50001:59381,]

#training a model
library(rpart)
model <- rpart(prud_train$ResponseNEW~., data = prud_train, method = "anova", 
               control=rpart.control(minsplit=50, cp=0.001))
model
summary(model)
printcp(model)
plotcp(model)

#visualizing the model
library(rpart.plot)
rpart.plot(model, digits=3)

#evaluating model performance
predicted <- predict(model, prud_test)
summary(round(predicted))
summary(prud_test$ResponseNEW)
cor(predicted, prud_test$ResponseNEW)

#measuring performance with mean absolute error
MAE <- function(actual, predicted) {
  mean(abs(actual - predicted))
}
MAE(prud_test$ResponseNEW, round(predicted))
mean_response <- mean(prud_train$ResponseNEW)
MAE(mean_response, prud_test$ResponseNEW)

MSE <- mean((prud_test$ResponseNEW-predicted)^2)

#improving the model performance
library(RWeka)
model.m5 <- M5P(prud_train$ResponseNEW~., data = prud_train)
model.m5
summary(model.m5)
predict.m5 <- predict(model.m5, prud_test)
summary(predict.m5)
cor(predict.m5, prud_test$ResponseNEW)
MAE(prud_test$ResponseNEW, round(predict.m5))
