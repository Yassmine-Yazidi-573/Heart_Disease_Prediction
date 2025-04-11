
# ❤️ Heart Disease Prediction using KNN

## 🧠 Project Overview

This project applies the **K-Nearest Neighbors (KNN)** algorithm to predict whether a patient has heart disease based on several medical attributes. Using a real-world dataset, I cleaned, normalized, and trained a machine learning model in R to classify heart disease presence.

---

## 📊 Dataset Information

The dataset includes 303 patient records and features such as:

- Age  
- Gender  
- Chest Pain Type  
- Blood Pressure  
- Cholesterol  
- Fasting Blood Sugar  
- Resting ECG  
- Maximum Heart Rate  
- Exercise Induced Angina  
- ST Depression  
- Slope of the ST Segment  
- Number of Major Vessels  
- Thalassemia  
- **Target** (0 = No heart disease, 1 = Has heart disease)

---

## 🧹 Data Preparation

- Removed missing values
- Scaled numeric features using Min-Max normalization
- Converted the target variable into a categorical factor
- Split the dataset into 70% training and 30% testing

---

## 🤖 Model: K-Nearest Neighbors

- Built a KNN classifier using the `class` package in R
- Evaluated model performance with different values of **k** from 1 to 12
- Repeated training/testing 3000 times to find the most accurate value of **k**

### ✅ Best Result:

- **Best k:** 5  
- **Highest Accuracy:** ~80.9%

---

## 🔍 Prediction Example

The model was also used to predict heart disease for a hypothetical patient named **Yassmine Yazidi** using the trained KNN model.

---

## 📈 Visualization

A plot was generated to display model accuracy based on the value of **k**, helping determine the optimal number of neighbors.

---

## 🧰 Tools Used

- R  
- tidyverse  
- class (KNN)  
- ggplot2  
- RMarkdown  

---

## 📁 Files in the Repo

- `heart_disease_data.csv`: Cleaned dataset  
- `knn_analysis.R`: Main R script  
- `heart_prediction.Rmd`: RMarkdown analysis report  
- `README.md`: This documentation  

---

## 👩‍💻 Author

**Yassmine Yazidi**  
Business Student & Data Enthusiast  
Tunisia 🇹🇳
