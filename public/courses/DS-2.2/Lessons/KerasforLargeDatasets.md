# Keras for Large Datasets

### Learning Objectives
- Learn how to handle datasets that will not fit into memory and use them for Keras training
- What is fit generator and predict generator
- What is Transfer Learning

## Train a deep learning model on a large dataset

- In Keras, using `fit()` and `predict()` is fine for smaller datasets which can be loaded into memory

- But in practice, for most practical-use cases, almost all datasets are large and cannot be loaded into memory at once

```Python
def batch_generator(df, batch_size, path_tiles, num_classes):
    """This generator use a pandas DataFrame to read images (df.tile_name) from disk.
    """
    N = df.shape[0]
    while True:
        for start in range(0, N, batch_size):
            x_batch = []
            y_batch = []
            end = min(start + batch_size, N)
            df_tmp = df[start:end]
            ids_batch = df_tmp.tile_name
            for id in ids_batch:
                img = cv2.imread(path_tiles+'/{}'.format(id))
                # [0] since duplicated names
                labelname=df_tmp['y'][df_tmp.tile_name == id].values[0]  
                labelname=np.asscalar(labelname)
                x_batch.append(img)
                y_batch.append(labelname)
            x_batch = np.array(x_batch, np.float32) / 255
            y_batch = utils.np_utils.to_categorical(y_batch, num_classes)
            yield (x_batch, y_batch)

model.fit_generator(generator=batch_generator(df_train,
                                              batch_size=batch_size,
                                              path_tiles=path_tiles,
                                              num_classes=num_classes),
                    steps_per_epoch=len(df_train) // batch_size,
                    epochs=epochs)
```
then instead of `model.fit()` we will use `model.fit_generator(generator=batch_generator(df_train, ...))`
```python
import numpy as np


def data_gen(df, batch_size):
    while True:
        x_batch = np.zeros((batch_size, 3, 224, 224))
        y_batch = np.zeros((batch_size, 1))
        for j in range(len(df['url']/batch_size)):
            b = 0
            for m, k in zip(df['url'].values[j*batch_size:(j+1)*batch_size], df['class'].values[j*batch_size:(j+1)*batch_size]):
                x_batch[b] = m
                y_batch[b] = k
                b += 1
            yield (x_batch, y_batch)


model.fit_generator(generator=data_gen(df_train, batch_size=batch_size), steps_per_epoch=len(df_train) // batch_size, epochs=epochs)
```

## Data Augmentation

- One of the best ways to improve the performance of a Deep Learning model is to add more data to the training set

- want the dataset to be representative of the many different positions, angles, lightings, and miscellaneous distortions

- In keras there are two ways:

    - Use `ImageDataGenerator`
    - Write our custom code

```Python
train_datagen = ImageDataGenerator(
        rescale=1./255,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True)

test_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(
        'data/train',
        target_size=(150, 150),
        batch_size=32,
        class_mode='binary')

validation_generator = test_datagen.flow_from_directory(
        'data/validation',
        target_size=(150, 150),
        batch_size=32,
        class_mode='binary')

model.fit_generator(
        train_generator,
        steps_per_epoch=2000,
        epochs=50,
        validation_data=validation_generator,
        validation_steps=800)
```

## Transfer Learning (TL)

- In practice a very few people train a Convolution network from scratch (random initialization) because it is rare to get enough dataset. So, using pre-trained network weights as initializations or a fixed feature extractor helps in solving most of the problems in hand

- Very Deep Networks are expensive to train. The most complex models take weeks to train using hundreds of machines equipped with expensive GPUs

- Determining the topology/flavor/training method/hyper parameters for deep learning is a black art with not much theory to guide you.

- So, we need transfer learning
```Python
from keras import applications

base_model = applications.vgg16.VGG16(include_top=False, weights='imagenet')


i=0
for layer in base_model.layers:
    layer.trainable = False
    i = i+1
    print(i,layer.name)


x = base_model.output
x = Dense(128, activation='sigmoid')(x)
x = GlobalAveragePooling2D()(x)
x = Dropout(0.2)(x)
predictions = Dense(10, activation='softmax')(x)



model = Model(inputs=base_model.input, outputs=predictions)

model.compile(loss="categorical_crossentropy", optimizer=optimizers.SGD(lr=0.001, momentum=0.9),metrics=["accuracy"])

model.fit_generator(
        train_generator,
        steps_per_epoch=100,
        epochs=10,
        callbacks = callbacks_list,
        validation_data = validation_generator,
        validation_steps=20
        )
```

## Activity: Apply TL (VGG 16) for Cifar dataset in Keras
