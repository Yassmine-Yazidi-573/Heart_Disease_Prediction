
# Heart Disease Prediction using KNN 🚑

This project uses the **K-Nearest Neighbors (KNN)** algorithm to predict whether a person has heart disease based on a set of health-related features. The dataset contains information about various medical characteristics, and the goal is to predict whether a person has heart disease. This is implemented in R using the `class` library for KNN classification.

## Badges

![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

## Table of Contents 📜

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Code Explanation](#code-explanation)

## Introduction 🌟

The purpose of this project is to classify whether a person is at risk of having heart disease using K-Nearest Neighbors (KNN). The dataset used contains several medical features such as age, cholesterol levels, and more. The goal is to classify individuals into two groups: **Heart Disease** or **No Heart Disease**.

The project demonstrates data preprocessing, feature scaling, model training, and evaluation. Additionally, it showcases the use of KNN to predict the likelihood of heart disease for new patients.

## Installation ⚙️

To get started with this project, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/heart-disease-knn.git
    ```

2. Install the required libraries:
    ```r
    install.packages("tidyverse")
    install.packages("class")
    install.packages("ggplot2")
    ```

3. Make sure you have the dataset `heart_disease_data.csv` in the project directory. You can download it from [this link](#).

## Usage 💻

### Running the KNN Model

To run the project, execute the following code in R:

```r
library(tidyverse)
library(class)
library(ggplot2)

# Upload Data
data = read.csv("heart_disease_data.csv")
data = na.omit(data)  # Remove missing values

# Scaling the data
data$target = as.factor(data$target)
scaling_function = function(x) { return ((x - min(x)) / (max(x) - min(x))) }
scaled_data = as.data.frame(lapply(data[, -ncol(data)], scaling_function))
scaled_data$target = data$target

# Split the data into training and testing sets
set.seed(123)
index = sample(1:nrow(scaled_data), 0.7 * nrow(scaled_data))
data.train = scaled_data[index, ]
data.test = scaled_data[-index, ]

# KNN algorithm
train_label = data.train[, -ncol(data.train)]
Train_label = data.train$target
test_label = data.test[, -ncol(data.test)]
Test_label = data.test$target

predicted = knn(train = train_label, test = test_label, cl = Train_label, k = 5)

# Accuracy of the model
TC = table(Test_label, predicted)
accuracy = sum(diag(TC)) / sum(TC)
print(paste("The global accuracy of the KNN model is:", accuracy))

# Find the best K value
Ret = NULL
for (i in 1:3000) {
  index = sample(1:nrow(scaled_data), 0.7 * nrow(scaled_data))
  data.train = scaled_data[index, ]
  data.test = scaled_data[-index, ]
  train_label = data.train[, -ncol(data.train)]
  Train_label = data.train$target
  test_label = data.test[, -ncol(data.test)]
  Test_label = data.test$target
  
  accu = c()
  for (kk in 1:12) {
    predicted = knn(train = train_label, test = test_label, cl = Train_label, k = kk)
    TC = table(Test_label, predicted)
    accu = c(accu, (sum(diag(TC)) / sum(TC)))
  }
  Ret = rbind(Ret, accu)
}

ACCU = colMeans(Ret)
bestK = which.max(ACCU)
bestACCU = max(ACCU)
print(paste("Best K:", bestK, "with Accuracy:", bestACCU))

# Plotting the accuracy
plot(1:12, ACCU, type = "l", col = 2, xlab = "Value of K", ylab = "Accuracy")

# Prediction for a new patient
patient_Mrs_Yazidi = c(21, 1, 3, 80, 100, 0, 1, 90, 0, 0.1, 0, 0, 0)
result = knn(train = train_label, test = patient_Mrs_Yazidi, cl = Train_label, k = 5)
if (result == 1) {
  print("Yassmine has a heart disease")
} else {
  print("Yassmine does not have a heart disease")
}
```

### Example of KNN Prediction for Yassmine Yazidi

The model was used to predict the likelihood of heart disease for a new patient, **Yassmine Yazidi**, based on her medical records:
The values I put are not real (I am Totaly a Healthy person LOL! I have just used random numbers for testing!!!!

```r
patient_Mrs_Yazidi = c(21, 1, 3, 80, 100, 0, 1, 90, 0, 0.1, 0, 0, 0)
result = knn(train = train_label, test = patient_Mrs_Yazidi, cl = Train_label, k = 5)

if (result == 1) {
  print("Yassmine has a heart disease")
} else {
  print("Yassmine does not have a heart disease")
}
```

## Code Explanation 📝

- **Data Preprocessing**: The dataset is first cleaned by removing any missing values. Then, the data is scaled using Min-Max scaling to bring all the features within the same range.
  
- **KNN Model**: The KNN algorithm is used to predict the target variable (`heart disease` or `no heart disease`). We use the `knn()` function from the `class` library to perform classification.

- **Model Evaluation**: The model is evaluated by calculating the accuracy based on the confusion matrix (`TC`). We also experimented with different values of `k` to find the best performing value.

- **Prediction**: The trained model is used to predict whether Meeee : XD **Yassmine Yazidi** has heart disease or not based on her medical data.

---

**Enjoy using the Heart Disease Prediction model!** 😃 
```

---
