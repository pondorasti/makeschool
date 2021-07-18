import glob
import pandas as pd
import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
import keras
from PIL import Image
from keras.preprocessing.image import img_to_array


files = glob.glob("Fire images/*.*")
ls_fire = []
for i in files:
    ls_fire.append(['Fire images', i.split("/")[1], '1'])


df_fire = pd.DataFrame(ls_fire, columns=['Folder', 'filename', 'label'])

input_shape = (128, 128, 3)
print(input_shape)
num_classes = 1
batch_size = 12
epochs = 2


def data_gen(df, batch_size):
    while True:
        x_batch = np.zeros((batch_size, 128, 128, 3))
        y_batch = np.zeros((batch_size, 1))
        for j in range(int(len(df)/batch_size)):
            b = 0
            for m, k, n in zip(df['filename'].values[j*batch_size:(j+1)*batch_size], df['label'].values[j*batch_size:(j+1)*batch_size], df['Folder'].values[j*batch_size:(j+1)*batch_size]):
                img = Image.open('{}/{}'.format(n, m)).convert("RGB")
#                 print(m)
                image_red = img.resize((128, 128))
                X = img_to_array(image_red)
                X = np.array(X)
                X = X.astype('float32')
                X /= 255
                x_batch[b] = X
                if k == '1':
                	y_batch[b] = 1.0
                b += 1
            yield (x_batch, y_batch)


model = Sequential()
model.add(Conv2D(32, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=input_shape))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Dropout(0.25))
model.add(Flatten())
model.add(Dense(128, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(num_classes, activation='sigmoid'))

model.compile(loss=keras.losses.binary_crossentropy,
              optimizer=keras.optimizers.Adadelta(),
              metrics=['accuracy'])


model.fit_generator(generator=data_gen(df_fire, batch_size=batch_size), steps_per_epoch=len(df_fire) // batch_size,
                    epochs=epochs, verbose=1)