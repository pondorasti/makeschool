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
X = tf.placeholder(shape=(1, 4), dtype=tf.float64)
Y = tf.placeholder(shape=(1,), dtype=tf.float64)

# Set model hidden layer weights and bias
W_h = tf.Variable(rng.randn(4, 3), name="weight1")
b_h = tf.Variable(rng.randn(1, 3), name="bias1")

# Set model output layer weights and bias
W_o = tf.Variable(rng.randn(3, 1), name="weight2")
b_o = tf.Variable(rng.randn(1, 1), name="bias2")

# Construct a linear model
h = tf.nn.sigmoid(tf.add(tf.matmul(X, W_h), b_h))
pred = tf.nn.sigmoid(tf.add(tf.matmul(h, W_o), b_o))


E = tf.reduce_sum(tf.pow(pred - Y, 2))
optimizer = tf.train.GradientDescentOptimizer(0.1)
grads = optimizer.compute_gradients(E, [W_h, b_h, W_o, b_h])
updates = optimizer.apply_gradients(grads)


# numpy implementation of sigmoid function
def sigmoid(x):
    return 1 / (1 + np.exp(-x))


with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    for i in range(2000):
        for batch in range(3):
            # Feed_forward: We do not need it because we know the model as defined above

            # Feed_Backward
            sess.run(updates, feed_dict={X: np.array([X_data[batch]]), Y: np.array(y_data[batch])})
            # print(W_h_i)
    W_h_i = sess.run(W_h)
    b_h_i = sess.run(b_h)
    W_o_i = sess.run(W_o)
    b_o_i = sess.run(b_o)


# Check that model provide good result
for i in range(3):
    hidden_layer_input1 = np.dot(X_data[i], W_h_i)
    hidden_layer_input = hidden_layer_input1 + b_h_i
    hidden_layer_activations = sigmoid(hidden_layer_input)
    output_layer_input1 = np.dot(hidden_layer_activations, W_o_i)
    output_layer_input = output_layer_input1 + b_o_i
    output = sigmoid(output_layer_input)
    print(output)
