## Learning Objectives (Competencies)
By the end of this lesson, students will be able to:
- What is early stopping
- How we can use TensorBoard


## Deep Learning Model Evaluation

- Almost always, we are interested to plot the training accuracy and testing (validation set) accuracy over epochs

- Also, we are interested to see the loss is decreasing over epochs

### How to plot accuracy and loss over epochs

```python
history = model.fit(X, Y, validation_split=0.33, epochs=150, batch_size=10, verbose=0)
# list all data in history
print(history.history.keys())
# summarize history for accuracy
plt.plot(history.history['acc'])
plt.plot(history.history['val_acc'])
plt.title('model accuracy')
plt.ylabel('accuracy')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()
```
Also,

```Python
# summarize history for loss
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('model loss')
plt.ylabel('loss')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()
```

### Callbacks in Keras

- Callbacks are functions that can be applied at certain stages of the training process, such as at the end of each epoch

- Specifically, in our solution, we included `EarlyStopping(monitor='val_loss', patience=2)` to define that we wanted to monitor the validation loss at each epoch and after the validation loss has not improved after two epochs, training is interrupted

- However, since we set patience=2, we won’t get the best model, but the model two epochs after the best model. Therefore, optionally, we can include a second operation, `ModelCheckpoint` which saves the model to a file after every checkpoint

![](../Notebooks/Images/early_stopping.png)

```Python
from keras.callbacks import EarlyStopping, ModelCheckpoint

# Set callback functions to early stop training and save the best model so far
callbacks = [EarlyStopping(monitor='val_loss', patience=2),
             ModelCheckpoint(filepath='best_model.h5', monitor='val_loss', save_best_only=True)]
```

Then,
```Python
# Train neural network
history = model.fit(train_features, # Features
                      train_target, # Target vector
                      epochs=20, # Number of epochs
                      callbacks=callbacks, # Early stopping
                      verbose=0, # Print description after each epoch
                      batch_size=100, # Number of observations per batch
                      validation_data=(test_features, test_target)) # Data for evaluation
```
### Tensorboard

- It hosts a website on your local machine in which you can monitor things like accuracy, cost functions and visualize the computational graph that Tensorflow is running based on what you defined in Keras

- For monitoring progress, open the terminal: `tensorboard --logdir Graph`

```Python
from keras.callbacks import TensorBoard

tensor_board = TensorBoard(log_dir='./Graph')

model.fit(x_train, y_train, verbose=1, callbacks=[tensor_board])
```

### Save and Load Keras Model

- Given that deep learning models can take hours, days, or weeks to train, it is paramount to know how to save and load them from disk

- Option 1: Weights + Model Architecture

- Option 2: Save/Load the Entire Model

#### Option 1:

from keras.models import model_from_json
```Python
# Option 1: Save Weights + Architecture
model.save_weights('model_weights.h5')
with open('model_architecture.json', 'w') as f:
    f.write(model.to_json())
# Option 1: Load Weights + Architecture
with open('model_architecture.json', 'r') as f:
    new_model_1 = model_from_json(f.read())
new_model_1.load_weights('model_weights.h5')
```
#### Option 2:

```Python
from keras.models import load_model

# Option 2: Save/load the entire model

# Creates a HDF5 file 'my_model.h5'
model.save('my_model.h5')

# Deletes the existing model
del model  

# Returns a compiled model identical to the previous one
model = load_model('my_model.h5')
```

### SVG

```python
from keras.utils import plot_model

plot_model(model, to_file='model.png', show_shapes=True)
```
