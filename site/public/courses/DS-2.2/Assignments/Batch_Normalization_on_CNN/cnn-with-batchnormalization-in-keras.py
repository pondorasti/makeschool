
# -*- coding: utf-8 -*-
import argparse
import math
import sys
import time
import copy

import keras
from keras.models import Sequential, Model
from keras.layers import Dense, Dropout, Flatten, Activation, BatchNormalization, regularizers
from keras.layers.noise import GaussianNoise
from keras.layers import Conv2D, MaxPooling2D
from keras import backend as K
from keras.callbacks import ModelCheckpoint, EarlyStopping
from keras.utils.np_utils import to_categorical
K.set_image_dim_ordering('th')
print(K.image_data_format())

## required for efficient GPU use
import tensorflow as tf
from keras.backend import tensorflow_backend
config = tf.ConfigProto(gpu_options=tf.GPUOptions(allow_growth=True))
session = tf.Session(config=config)
tensorflow_backend.set_session(session)
## required for efficient GPU use

import os
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import numpy as np # linear algebra

# define path to save model
model_path = './fm_cnn_BN.h5'
# prepare callbacks
callbacks = [
    EarlyStopping(
        monitor='val_acc', 
        patience=10,
        mode='max',
        verbose=1),
    ModelCheckpoint(model_path,
        monitor='val_acc', 
        save_best_only=True, 
        mode='max',
        verbose=0)
]


# get data
test  = pd.read_csv('./fashion-mnist_test.csv')
train = pd.read_csv('./fashion-mnist_train.csv')
print('train shape: {}'.format(train.shape))
print('test shape: {}'.format(test.shape))

#reshape data
y_train_CNN = train.ix[:,0].values.astype('int32') # only labels i.e targets digits
X_train_CNN = np.array(train.iloc[:,1:].values).reshape(train.shape[0], 1, 28, 28).astype(np.uint8)# reshape to be [samples][pixels][width][height]
print('train shape after reshape: {}'.format(X_train_CNN.shape))

y_test_CNN = test.ix[:,0].values.astype('int32') # only labels i.e targets digits
X_test_CNN = np.array(test.iloc[:,1:].values).reshape((test.shape[0], 1, 28, 28)).astype(np.uint8)
print('test shape after reshape: {}'.format(X_test_CNN.shape))

# one hot encode outputs
y_train_CNN = to_categorical(y_train_CNN)
y_test_CNN = to_categorical(y_test_CNN)
num_classes = y_train_CNN.shape[1]

# normalize inputs from 0-255 to 0-1
X_train_CNN = X_train_CNN / 255
X_test_CNN = X_test_CNN / 255

#size of parameters
batch_size = 128
num_classes = 10
epochs = 100
filter_pixel=3
noise = 1
droprate=0.25

# input image dimensions
img_rows, img_cols = 28, 28

input_shape = (1, img_rows, img_cols)

#Start Neural Network
model = Sequential()
#convolution 1st layer
model.add(Conv2D(64, kernel_size=(filter_pixel, filter_pixel), padding="same",
                 activation='relu',
                 input_shape=input_shape)) #0
model.add(BatchNormalization())
model.add(Dropout(droprate))#3
#model.add(MaxPooling2D())

#convolution 2nd layer
model.add(Conv2D(64, kernel_size=(filter_pixel, filter_pixel), activation='relu',border_mode="same"))#1
model.add(BatchNormalization())
model.add(MaxPooling2D())
model.add(Dropout(droprate))#3

#convolution 3rd layer
model.add(Conv2D(64, kernel_size=(filter_pixel, filter_pixel), activation='relu',border_mode="same"))#1
model.add(BatchNormalization())
model.add(MaxPooling2D())
model.add(Dropout(droprate))#3

#Fully connected 1st layer
model.add(Flatten()) #7
model.add(Dense(500,use_bias=False)) #13
model.add(BatchNormalization())
model.add(Activation('relu')) #14
model.add(Dropout(droprate))      #15

#Fully connected final layer
model.add(Dense(10)) #8
model.add(Activation('softmax')) #9


model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.RMSprop(),
              metrics=['accuracy'])

model.summary()

#Save Model=ON
history = model.fit(X_train_CNN, y_train_CNN,
          batch_size=batch_size,
          epochs=epochs,
          verbose=1,
          validation_data=(X_test_CNN, y_test_CNN),shuffle=True,callbacks=callbacks)

score = model.evaluate(X_test_CNN, y_test_CNN, verbose=0)

#print loss and accuracy
print('Test loss:', score[0])
print('Test accuracy:', score[1])