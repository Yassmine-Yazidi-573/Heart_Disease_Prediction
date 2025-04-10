library(tidyverse)
#Upload Data:
data = read.csv("heart_disease_data.csv")
str(data)#303 observations in total(patients number)
#
summary(data)
head(data)
#clean Data and Normalize it:
data = na.omit(data)#I removed NAs
#scaling the data:
data$target = as.factor(data$target)
scaling_function=function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}
scaled_data=as.data.frame(lapply(data[ , -ncol(data)], scaling_function))
scaled_data$target = data$target 
head(scaled_data)#I verified the scaling of the data!
head(data)
#Split data into training and testing sets:
set.seed(123)
index= sample(1:nrow(scaled_data), 0.7 * nrow(scaled_data))
data.train = scaled_data[index, ]
data.test = scaled_data[-index, ]
train_label=data.train[ , -ncol(data.train)]
Train_label=data.train$target
test_label=data.test[ , -ncol(data.test)]
Test_label=data.test$target
str(train_label)#212 observations in the training dataset(70%)
str(test_label)#91 observations in the testing dataset(30%)
#Running the KNN Algorithm
library(class)
predicted =knn(train = train_label, test = test_label, cl = Train_label, k = 5)
#Assessing the accuracy of the model
TC=table(Test_label,predicted)
str(TC)
print("the global accuracy of the KNN model is:")
print(sum(diag(TC))/sum(TC))# the overall accuracy of the model computed using the ratio of correct predictions to the Total predictions.
mean(predicted == Test_label)# Another method to compute the accuracy of the model(  0.7912088 for k=5)
# looking for the best choice of K!!!
Ret=NULL
for(i in 1:3000)
{ 
  index= sample(1:nrow(scaled_data), 0.7 * nrow(scaled_data))
  data.train = scaled_data[index, ]
  data.test = scaled_data[-index, ]
  train_label=data.train[ , -ncol(data.train)]
  Train_label=data.train$target
  test_label=data.test[ , -ncol(data.test)]
  Test_label=data.test$target
  accu=c()
  for(kk in 1:12)
  {
    predicted =knn(train = train_label, test = test_label, cl = Train_label, k = kk)
    TC=table(Test_label,predicted)
    accu=c(accu,(sum(diag(TC))/sum(TC)))
  }
  Ret=rbind(Ret,accu)
}
ACCU=colMeans(Ret)
library(ggplot2)
plot.new()
plot(1:12,ACCU,type="l",col=2,xlab="value of K", ylab="Accuracy")
bestK=which.max(ACCU)
bestACCU=max(ACCU)
print(bestK)# k=5 has the best value Accuracy value of:
print(bestACCU)# ACCU=  0.8096593
