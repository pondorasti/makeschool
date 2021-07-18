import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import keras
from keras.models import Sequential
from keras.layers import Dense
from sklearn.metrics import confusion_matrix

# https://medium.com/@pushkarmandot/build-your-first-deep-learning-neural-network-model-using-keras-in-python-a90b5864116d

df = pd.read_csv('Churn_Modelling.csv')

print(df.head())

X = df.iloc[:, 3:13].values
y = df.iloc[:, 13].values

print(X)
print(X.shape)
print(y)

label_encoder_X_1 = LabelEncoder()
X[:, 1] = label_encoder_X_1.fit_transform(X[:, 1])
label_encoder_X_2 = LabelEncoder()
X[:, 2] = label_encoder_X_2.fit_transform(X[:, 2])
print(X)
print(X.shape)

one_hot_encoder = OneHotEncoder(categorical_features=[1])
X = one_hot_encoder.fit_transform(X).toarray()
X = X[:, 1:]
# print('M:')
# print(X[:, :10])
# print(X[:, 10])

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

# Feature Scaling
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
print(X_train.shape)

classifier = Sequential()
# Adding the input layer and the first hidden layer
classifier.add(Dense(units=6, kernel_initializer='uniform', activation='relu', input_dim=11))
# Adding the second hidden layer
classifier.add(Dense(units=6, kernel_initializer='uniform', activation='relu'))
# Adding the output layer
classifier.add(Dense(units=1, kernel_initializer='uniform', activation='sigmoid'))
# Compiling Neural Network
classifier.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
# Fitting our model
classifier.fit(X_train, y_train, batch_size=32, epochs=10, validation_split=0.2, verbose=1)
# Predicting the Test set results
y_predict = classifier.predict(X_test)
print(y_predict)
y_predict = (y_predict > 0.5)
cm = confusion_matrix(y_test, y_predict)
print(cm)
