from keras.models import Sequential
from keras.layers import Dense

x, y = ...
x_val, y_val = ...

# 1-dimensional MSE linear regression in Keras
model = Sequential()
model.add(Dense(1, activation='linear', input_dim=x.shape[1]))
model.compile(optimizer='rmsprop', loss='mse')
model.fit(x, y, nb_epoch=10, validation_data=(x_val, y_val))

# 2-class logistic regression in Keras
model = Sequential()
model.add(Dense(1, activation='sigmoid', input_dim=x.shape[1]))
model.compile(optimizer='rmsprop', loss='binary_crossentropy')
model.fit(x, y, nb_epoch=10, validation_data=(x_val, y_val))

# logistic regression with L1 and L2 regularization
from keras.regularizers import l1l2

reg = l1l2(l1=0.01, l2=0.01)

model = Sequential()
model.add(Dense(1, activation='sigmoid', W_regularizer=reg, input_dim=x.shape[1]))
model.compile(optimizer='rmsprop', loss='binary_crossentropy')
model.fit(x, y, nb_epoch=10, validation_data=(x_val, y_val))