import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.svm import SVC
from sklearn.linear_model import LogisticRegression
from xgboost import XGBClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import joblib

# Load the dataset
def predictions(vals,val):
    df = pd.read_csv('med.csv')
    # Preprocess the data
    X = df[['disease', 'age']]
    y_labels = df['medicine']

    # Manually encode string labels to integers
    label_mapping = {label: idx for idx, label in enumerate(np.unique(y_labels))}
    y = y_labels.map(label_mapping)

    # Convert categorical features to numerical using one-hot encoding
    X = pd.get_dummies(X, columns=['disease'])

    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=0)

    # Random Forest
    rf = RandomForestClassifier()
    rf.fit(X_train, y_train)
    joblib.dump(rf, 'rf_model.pkl')
    predicted_medicine_rf = rf.predict(X_test)

    input_disease = vals
    input_age = val
    input_data = pd.DataFrame({'disease': [input_disease], 'age': [input_age]})
    input_data = pd.get_dummies(input_data, columns=['disease'])

    # Ensure that the input features match the training data columns
    missing_cols = set(X_train.columns) - set(input_data.columns)
    for col in missing_cols:
        input_data[col] = 0

    input_data = input_data[X_train.columns]

    # Make the prediction
    predicted_medicine_example = rf.predict(input_data)
    # Convert the predicted label back to the original string label
    predicted_medicine_example_label = next(label for label, idx in label_mapping.items() if idx == predicted_medicine_example[0])

    print(f"The predicted medicine for disease '{input_disease}' and age '{input_age}' is: {predicted_medicine_example_label}")
    out = predicted_medicine_example_label
    return out