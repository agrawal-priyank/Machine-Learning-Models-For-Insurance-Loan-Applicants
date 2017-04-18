##Linear Regression
MyData <- read.csv("cleaned_train_data.csv", header=TRUE, sep=",")

getwd()
MyData
index<-1:nrow(MyData)
testindex<-sample(index,trunc(length(index)*30/100))
testindex
dim(testindex)
testset<-MyData[testindex,]
testset[,2]
trainset<-MyData[-testindex,]
names(MyData)
testset

trainset
model1<-lm(response~Id+Ins_Age+Ht+Wt+BMI+Medical_Keyword_1+Medical_Keyword_2+Medical_Keyword_3+Medical_Keyword_4+Medical_Keyword_5+Medical_Keyword_6+Medical_Keyword_7+Medical_Keyword_8+Medical_Keyword_9+Medical_Keyword_10+Medical_Keyword_11+Medical_Keyword_12+Medical_Keyword_13+Medical_Keyword_14+Medical_Keyword_15+Medical_Keyword_16+Medical_Keyword_17+Medical_Keyword_18+Medical_Keyword_19+Medical_Keyword_20+Medical_Keyword_21+Medical_Keyword_22+Medical_Keyword_23+Medical_Keyword_24+Medical_Keyword_25+Medical_Keyword_26+Medical_Keyword_27+Medical_Keyword_28+Medical_Keyword_29+Medical_Keyword_30+Medical_Keyword_31+Medical_Keyword_32+Medical_Keyword_33+Medical_Keyword_34+Medical_Keyword_35+Medical_Keyword_36+Medical_Keyword_37+Medical_Keyword_38+Medical_Keyword_39+Medical_Keyword_40+Medical_Keyword_41+Medical_Keyword_42+Medical_Keyword_43+Medical_Keyword_44+Medical_Keyword_45+Medical_Keyword_46+Medical_Keyword_47+Medical_Keyword_48+Product_Info_1_1+Product_Info_1_2+Product_Info_2_A1+Product_Info_2_A2+Product_Info_2_A3+Product_Info_2_A4+Product_Info_2_A5+Product_Info_2_A6+Product_Info_2_A7+Product_Info_2_A8+Product_Info_2_B1+Product_Info_2_B2+Product_Info_2_C1+Product_Info_2_C2+Product_Info_2_C3+Product_Info_2_C4+Product_Info_2_D1+Product_Info_2_D2+Product_Info_2_D3+Product_Info_2_D4+Product_Info_2_E1+Product_Info_4_C+Product_Info_5_2+Product_Info_5_3+Product_Info_6_1+Product_Info_6_3+Product_Info_7_1+Product_Info_7_2+Product_Info_7_3+Employment_Info_1_C+Employment_Info_3_1+Employment_Info_3_3+Employment_Info_4_C+Employment_Info_5_2+Employment_Info_5_3+Employment_Info_6_C+InsuredInfo_1_1+InsuredInfo_1_2+InsuredInfo_1_3+InsuredInfo_2_2+InsuredInfo_2_3+InsuredInfo_4_2+InsuredInfo_4_3+InsuredInfo_5_1+InsuredInfo_5_3+InsuredInfo_6_1+InsuredInfo_6_2+InsuredInfo_7_1+InsuredInfo_7_3+Insurance_History_1_1+Insurance_History_1_2+Insurance_History_2_1+Insurance_History_2_2+Insurance_History_2_3+Insurance_History_3_1+Insurance_History_3_2+Insurance_History_3_3+Insurance_History_4_1+Insurance_History_4_2+Insurance_History_4_3+Insurance_History_5_C+Insurance_History_7_1+Insurance_History_7_2+Insurance_History_7_3+Insurance_History_8_1+Insurance_History_8_2+Insurance_History_8_3+Insurance_History_9_1+Insurance_History_9_2+Insurance_History_9_3+Family_Hist_1_1+Family_Hist_1_2+Family_Hist_1_3+Family_Hist_2_C+Family_Hist_3_C+Family_Hist_4_C+Family_Hist_5_C+Medical_History_1_D+Medical_History_3_1+Medical_History_3_2+Medical_History_3_3+Medical_History_4_1+Medical_History_4_2+Medical_History_5_1+Medical_History_5_2+Medical_History_5_3+Medical_History_6_1+Medical_History_6_2+Medical_History_6_3+Medical_History_7_1+Medical_History_7_2+Medical_History_7_3+Medical_History_8_1+Medical_History_8_2+Medical_History_8_3+Medical_History_9_1+Medical_History_9_2+Medical_History_9_3+Medical_History_11_1+Medical_History_11_2+Medical_History_11_3+Medical_History_12_1+Medical_History_12_2+Medical_History_12_3+Medical_History_13_1+Medical_History_13_2+Medical_History_13_3+Medical_History_14_1+Medical_History_14_2+Medical_History_14_3+Medical_History_15_D+Medical_History_16_1+Medical_History_16_2+Medical_History_16_3+Medical_History_17_1+Medical_History_17_2+Medical_History_17_3+Medical_History_18_1+Medical_History_18_2+Medical_History_18_3+Medical_History_19_1+Medical_History_19_2+Medical_History_19_3+Medical_History_20_1+Medical_History_20_2+Medical_History_20_3+Medical_History_21_1+Medical_History_21_2+Medical_History_21_3+Medical_History_22_1+Medical_History_22_2+Medical_History_23_1+Medical_History_23_2+Medical_History_23_3+Medical_History_25_1+Medical_History_25_2+Medical_History_25_3+Medical_History_26_1+Medical_History_26_2+Medical_History_26_3+Medical_History_27_1+Medical_History_27_2+Medical_History_27_3+Medical_History_28_1+Medical_History_28_2+Medical_History_28_3+Medical_History_29_1+Medical_History_29_2+Medical_History_29_3+Medical_History_30_1+Medical_History_30_2+Medical_History_30_3+Medical_History_31_1+Medical_History_31_2+Medical_History_31_3+Medical_History_33_1+Medical_History_33_3+Medical_History_34_1+Medical_History_34_2+Medical_History_34_3+Medical_History_35_1+Medical_History_35_2+Medical_History_35_3+Medical_History_36_1+Medical_History_36_2+Medical_History_36_3+Medical_History_37_1+Medical_History_37_2+Medical_History_37_3+Medical_History_38_1+Medical_History_38_2+Medical_History_39_1+Medical_History_39_2+Medical_History_39_3+Medical_History_40_1+Medical_History_40_2+Medical_History_40_3+Medical_History_41_1+Medical_History_41_2+Medical_History_41_3)
model1<-lm(trainset$ResponseNEW~.,trainset)
summary(model1)

##Removing NA
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
model1<-lm(trainset$ResponseNEW~.,trainset)
summary(model1)

##Removing insignificant columns
trainset$Id<-NULL
trainset$Product_Info_2_A1<-NULL
trainset$Product_Info_2_A3<-NULL
trainset$Product_Info_2_B1<-NULL
trainset$Product_Info_2_C3<-NULL
trainset$Product_Info_2_C4<-NULL
trainset$Product_Info_2_D3<-NULL
trainset$Product_Info_5_2<-NULL
trainset$Product_Info_7_1<-NULL
trainset$Product_Info_7_2<-NULL
trainset$Employment_Info_1_C<-NULL
trainset$Employment_Info_4_C<-NULL
trainset$Employment_Info_6_C<-NULL
trainset$InsuredInfo_1_1<-NULL
trainset$InsuredInfo_1_2<-NULL
trainset$InsuredInfo_4_2<-NULL
trainset$Insurance_History_2_2<-NULL
trainset$Insurance_History_4_1<-NULL
trainset$Insurance_History_4_2<-NULL
trainset$Insurance_History_5_C<-NULL
trainset$Insurance_History_7_1<-NULL
trainset$Insurance_History_7_2<-NULL
trainset$Insurance_History_8_1<-NULL
trainset$Insurance_History_8_2<-NULL
trainset$Insurance_History_9_1<-NULL
trainset$Insurance_History_9_2<-NULL
trainset$Family_Hist_1_1<-NULL
trainset$Family_Hist_1_2<-NULL
trainset$Medical_History_3_1<-NULL
trainset$Medical_History_5_2<-NULL
trainset$Medical_History_6_2<-NULL
trainset$Medical_History_7_2<-NULL
trainset$Medical_History_8_1<-NULL
trainset$Medical_History_8_2<-NULL
trainset$Medical_History_9_1<-NULL
trainset$Medical_History_9_2<-NULL
trainset$Medical_History_11_1<-NULL
trainset$Medical_History_12_1<-NULL
trainset$Medical_History_13_2<-NULL
trainset$Medical_History_18_1<-NULL
trainset$Medical_History_18_2<-NULL
trainset$Medical_History_19_1<-NULL
trainset$Medical_History_19_2<-NULL
trainset$Medical_History_20_1<-NULL
trainset$Medical_History_20_2<-NULL
trainset$Medical_History_21_1<-NULL
trainset$Medical_History_21_2<-NULL
trainset$Medical_History_23_2<-NULL
trainset$Medical_History_25_2<-NULL
trainset$Medical_History_25_1<-NULL
trainset$Medical_History_26_2<-NULL
trainset$Medical_History_27_2<-NULL
trainset$Medical_History_28_2<-NULL
trainset$Medical_History_28_1<-NULL
trainset$Medical_History_29_2<-NULL
trainset$Medical_History_30_1<-NULL
trainset$Medical_History_34_1<-NULL
trainset$Medical_History_36_1<-NULL
trainset$Medical_History_36_2<-NULL
trainset$Medical_History_37_1<-NULL
trainset$Medical_History_37_2<-NULL
trainset$Medical_History_41_2<-NULL

model1<-lm(trainset$ResponseNEW~.,trainset)
summary(model1)

predictionWithTest<-predict(model1, testset, se.fit = FALSE, scale = NULL, df = Inf,interval = c("none", "confidence", "prediction"),level = 0.95, type = c("response", "terms"),terms = NULL, na.action = na.pass,pred.var = res.var/weights, weights = 1)
summary(predictionWithTest)

output<-round(predictionWithTest)
head(output)

actualResponse<-testset$ResponseNEW
head(actualResponse)
mean(testset$ResponseNEW-output)^2

##Removing more insignificant columns
trainset$Product_Info_1_1<-NULL
trainset$Product_Info_2_D2<-NULL
trainset$Medical_History_26_1<-NULL
trainset$Medical_History_29_1<-NULL
trainset$Medical_Keyword_Columns<-NULL

model1<-lm(trainset$ResponseNEW~.,trainset)
summary(model1)

trainset$Medical_History_14_1<-NULL
trainset$Medical_History_38_1<-NULL
trainset$Product_Info_2_A4<-NULL
trainset$Product_Info_2_C1<-NULL
trainset$Product_Info_6_1<-NULL
trainset$Insurance_History_3_2<-NULL
trainset$Product_Info_2_C2<-NULL
trainset$Medical_History_16_1<-NULL
trainset$Medical_History_41_1<-NULL

model1<-lm(trainset$ResponseNEW~.,trainset)
summary(model1)

predictionWithTest<-predict(model1, testset, se.fit = FALSE, scale = NULL, df = Inf,interval = c("none", "confidence", "prediction"),level = 0.95, type = c("response", "terms"),terms = NULL, na.action = na.pass,pred.var = res.var/weights, weights = 1)
summary(predictionWithTest)

output<-round(predictionWithTest)
actualResponse<-testset$ResponseNEW
mean(testset$ResponseNEW-output)^2

abline(lm(trainset$ResponseNEW~.,trainset))
