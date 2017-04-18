# Loading dataset
loan_data <- read.csv("loan.csv")

# Loading library
library(neuralnet)
library(nnet)
library(devtools)
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

# Data pre-processing and cleaning
unique(loan_data$Sex)
sex <- as.numeric(loan_data$Sex == "M")
loan <- as.data.frame(sex)

loan$age <- loan_data$Age

loan$time_at_add <- data$Time_at_add

unique(loan_data$Res_status)
loan$res_status <- as.numeric(loan_data$Res_status == "owner")

unique(loan_data$Telephone)
loan$telephone <- as.numeric(loan_data$Telephone == "given")

unique(loan_data$Job_status)
loan$job_status_unemployed <- as.numeric(loan_data$Job_status == "unemploye")
loan$job_status_government <- as.numeric(loan_data$Job_status == "governmen")
loan$job_status_private <- as.numeric(loan_data$Job_status == "private_s")
loan$job_status_selfemployed <- as.numeric(loan_data$Job_status == "self_empl")
loan$job_status_retired <- as.numeric(loan_data$Job_status == "retired")
loan$job_status_student <- as.numeric(loan_data$Job_status == "student")
loan$job_status_military <- as.numeric(loan_data$Job_status == "military")

loan$time_employed <- loan_data$Time_employed

loan$time_bank <- loan_data$Time_bank

unique(loan_data$Liab_ref)
loan$liab_ref <- as.numeric(loan_data$Liab_ref == "f")

unique(loan_data$Acc_ref)
loan$acc_ref <- as.numeric(loan_data$Acc_ref == "given")

loan$home_expn <- loan_data$Home_Expn

loan$balance <- loan_data$Balance

loan$decision <- as.numeric(loan_data$Decision == "accept")

write.csv(loan, file="cleaned_loan.csv")

# Splitting the cleaned dataset with 80/20% proportion
train <- loan[1:343,] 
test <- loan[344:429,]

# Model 1
# building the neural network model
model <- neuralnet(decision~sex+age+res_status+telephone+job_status_military+job_status_student+
                     job_status_retired+job_status_selfemployed+job_status_private+job_status_government+
                     job_status_unemployed+time_employed+time_bank+liab_ref+acc_ref+home_expn+
                     balance, data = train, hidden = 12, threshold = 0.01)

# Plot the model
plot(model)
plot.nnet(model)

# Predict using the model
model_results <- compute(model, test[,1:17])

# Get actual output and predicted output in data frame for comparison 
results <- data.frame(actual = test$decision, prediction = model_results$net.result)

# Round the predicted output
results$prediction <- round(results$prediction)

# View the results data frame
results

# Calculate accuracy using total number of right predictions 
accuracy <- ((sum(results$actual == results$prediction))*100)/nrow(test)
accuracy

# Model 2 (optimization)
# Building the neural network model
model <- neuralnet(decision~sex+age+res_status+telephone+time_employed+time_bank+liab_ref+acc_ref+home_expn+
                     balance, data = train, hidden = 7, threshold = 0.01, linear.output = FALSE)

# Plot the model
plot(model)
plot.nnet(model)

# Predict using the model
model_results <- compute(model, test[c(1, 2, 3, 4, 12, 13, 14, 15, 16, 17)])

# Get actual output and predicted output in data frame for comparison 
results <- data.frame(actual = test$decision, prediction = model_results$net.result)

# Round the predicted output
results$prediction <- round(results$prediction)

# View the results data frame
results

# Calculate accuracy using total number of right predictions 
accuracy <- ((sum(results$actual == results$prediction))*100)/nrow(test)
accuracy

# Model 3 (optimization)
# Building the neural network model
model <- neuralnet(decision~sex+age+res_status+telephone+home_expn+balance, data = train, 
                   hidden = 6, threshold = 0.01, linear.output = FALSE)

# Plot the model
plot(model)
plot.nnet(model)

# Predict using the model
model_results <- compute(model, test[c(1, 2, 3, 4, 16, 17)])

# Get actual output and predicted output in data frame for comparison 
results <- data.frame(actual = test$decision, prediction = model_results$net.result)

# Round the predicted output
results$prediction <- round(results$prediction)

# View the results data frame
results

# Calculate accuracy using total number of right predictions 
accuracy <- ((sum(results$actual == results$prediction))*100)/nrow(test)
accuracy
