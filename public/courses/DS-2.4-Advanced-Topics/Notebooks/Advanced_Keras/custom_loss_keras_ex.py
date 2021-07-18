import theano
from keras import backend as K
from keras.layers import Dense
from keras.models import Sequential

def customized_loss(y_true, y_pred):
    loss = K.switch(K.equal(y_true, -1), 0, K.square(y_true-y_pred))
    return K.sum(loss)

if __name__ == '__main__':
    model = Sequential([ Dense(3, input_shape=(4,)) ])
    model.compile(loss=customized_loss, optimizer='sgd')

    import numpy as np
    x = np.random.random((1, 4))
    y = np.array([[1,-1,0]])

    output = model.predict(x)
    print output
    # [[ 0.47242549 -0.45106074  0.13912249]]
    print model.evaluate(x, y)  # keras's loss
    # 0.297689884901
    print (output[0, 0]-1)**2 + 0 +(output[0, 2]-0)**2 # double-check
    # 0.297689929093