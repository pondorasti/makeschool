import numpy as np
import tensorflow as tf
rng = np.random

# check this out:
# https://www.analyticsvidhya.com/blog/2017/05/neural-network-from-scratch-in-python-and-r/
# Input array
X_data=np.array([[1.0, 0.0, 1.0, 0.0],[1.0, 0.0, 1.0, 1.0],[0.0, 1.0, 0.0, 1.0]])

#Output
y_data=np.array([[1.0],[1.0],[0.0]])



#Variable initialization
epoch=5000 #Setting training iterations
lr=0.1 #Setting learning rate



# tf Graph Input
X = tf.placeholder(shape=(1, 4), dtype= tf.float64)
Y = tf.placeholder(shape=(1,), dtype= tf.float64)

# Set model hidden layer weights and bias
W_h = tf.Variable(rng.randn(4, 3), name="weight1")
b_h = tf.Variable(rng.randn(1, 3), name="bias1")

# Set model output layer weights and bias
W_o = tf.Variable(rng.randn(3, 1), name="weight2")
b_o = tf.Variable(rng.randn(1, 1), name="bias2")

# Construct a linear model
h = tf.nn.sigmoid(tf.add(tf.matmul(X, W_h), b_h))
pred = tf.nn.sigmoid(tf.add(tf.matmul(h, W_o), b_o))


# with tf.GradientTape() as t:
#     t.watch([W_h])
E = tf.reduce_sum(tf.pow(pred - Y, 2))

dE_dW_h = tf.gradients(E, [W_h])[0]
dE_db_h = tf.gradients(E, [b_h])[0]
dE_dW_o = tf.gradients(E, [W_o])[0]
dE_db_o = tf.gradients(E, [b_o])[0]


# numpy implementation of sigmoid function
def sigmoid(x):
    return 1 / (1 + np.exp(-x))


with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    W_h_i = np.random.randn(4, 3)
    b_h_i = np.random.randn(1, 3)
    W_o_i = np.random.randn(3, 1)
    b_o_i = np.random.randn(1, 1)
    for i in range(2000):
        for batch in range(3):
            # Feed_forward: We do not need it because we know the model as defined above

            # Feed_Backward
            evaluated_dE_dW_h = sess.run(dE_dW_h,
                                         feed_dict={W_h: W_h_i, b_h: b_h_i, W_o: W_o_i, b_o: b_o_i,
                                                    X: np.array([X_data[batch]]), Y: np.array(y_data[batch])})
            W_h_i = W_h_i - 0.1 * evaluated_dE_dW_h
            evaluated_dE_db_h = sess.run(dE_db_h,
                                         feed_dict={W_h: W_h_i, b_h: b_h_i, W_o: W_o_i, b_o: b_o_i,
                                                    X: np.array([X_data[batch]]), Y: np.array(y_data[batch])})
            b_h_i = b_h_i - 0.1 * evaluated_dE_db_h
            evaluated_dE_dW_o = sess.run(dE_dW_o,
                                         feed_dict={W_h: W_h_i, b_h: b_h_i, W_o: W_o_i, b_o: b_o_i,
                                                    X: np.array([X_data[batch]]), Y: np.array(y_data[batch])})
            W_o_i = W_o_i - 0.1 * evaluated_dE_dW_o
            evaluated_dE_db_o = sess.run(dE_db_o,
                                         feed_dict={W_h: W_h_i, b_h: b_h_i, W_o: W_o_i, b_o: b_o_i,
                                                    X: np.array([X_data[batch]]), Y: np.array(y_data[batch])})
            b_o_i = b_o_i - 0.1 * evaluated_dE_db_o

print(W_h_i)

# Check that model provide good result
for i in range(3):
    hidden_layer_input1 = np.dot(X_data[i], W_h_i)
    hidden_layer_input = hidden_layer_input1 + b_h_i
    hidden_layer_activations = sigmoid(hidden_layer_input)
    output_layer_input1 = np.dot(hidden_layer_activations, W_o_i)
    output_layer_input = output_layer_input1 + b_o_i
    output = sigmoid(output_layer_input)
    print(output)
