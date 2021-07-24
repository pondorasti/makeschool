## What are autoencoders?

- In classical machine learning, we introduced PCA as a dimensionality reduction algorithm

- In deep learning auto-encoder has the same purpose as PCA does for tabular data

- "Autoencoding" is a data compression and decompression algorithm where the compression and decompression functions are implemented with neural networks

- Two interesting practical applications of autoencoders are data denoising (which we feature later in this post), and dimensionality reduction

![](../Notebooks/Images/auto_encoder.png)


### Build a MLP based auto-encoder for MNIST

- Write a single fully-connected neural layer as encoder and as decoder with Keras

```python
from keras.layers import Input, Dense
from keras.models import Model
from keras.datasets import mnist
import numpy as np

# this is the size of our encoded representations
encoding_dim = 32  # 32 floats -> compression of factor 24.5, assuming the input is 784 floats

# this is our input placeholder
input_img = Input(shape=(784,))
# "encoded" is the encoded representation of the input
encoded = Dense(encoding_dim, activation='relu')(input_img)
# "decoded" is the lossy reconstruction of the input
decoded = Dense(784, activation='sigmoid')(encoded)

# this model maps an input to its reconstruction
autoencoder = Model(input_img, decoded)

# configure our model to use a per-pixel binary crossentropy loss, and the Adadelta optimizer:

autoencoder.compile(optimizer='adadelta', loss='binary_crossentropy')

# prepare our input data. We're using MNIST digits, and we're discarding the labels
# since we're only interested in encoding/decoding the input images


(x_train, _), (x_test, _) = mnist.load_data()

# normalize all values between 0 and 1 and we will flatten the 28x28 images into vectors of size 784

x_train = x_train.astype('float32') / 255.
x_test = x_test.astype('float32') / 255.

# Reshape x_train and x_test
x_train = np.reshape(x_train,[-1, 28*28])
x_test = np.reshape(x_test,[-1, 28*28])

# train our autoencoder for 50 epochs

autoencoder.fit(x_train, x_train,
                epochs=50,
                batch_size=256,
                shuffle=True,
                validation_data=(x_test, x_test))

```

## If we want to visualize the reconstructed inputs and the encoded representations, what should we do?

```python
# Solution:

# We should create a separate encoder model

# this model maps an input to its encoded representation
encoder = Model(input_img, encoded)

# As well as the decoder model

# create a placeholder for an encoded (32-dimensional) input
encoded_input = Input(shape=(encoding_dim,))
# retrieve the last layer of the autoencoder model
decoder_layer = autoencoder.layers[-1]
# create the decoder model
decoder = Model(encoded_input, decoder_layer(encoded_input))

# encode and decode some digits
# note that we take them from the *test* set
encoded_imgs = encoder.predict(x_test)
decoded_imgs = decoder.predict(encoded_imgs)
```

## We can have deep auto-encoder and convolutional auto-encoder

https://blog.keras.io/building-autoencoders-in-keras.html
