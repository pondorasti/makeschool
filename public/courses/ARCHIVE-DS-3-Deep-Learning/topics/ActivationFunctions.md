## Activation Functions

### Topics
- Combining threshold with weights to create a single parameter vector including a bias
- Activation functions
- Perceptron learning rule, adjusting weights using gradient descent on error function

### Resources
- Read Mark Humphry’s notes on [multi-layer neural networks]
- Read Andrew Trask’s articles on building a neural network in Python – [part 1: optimization][Trask Neural Network part 1] and [part 2: gradient descent][Trask Neural Network part 2] – Pay close attention to the diagrams in part 2 to gain an intuition for gradient descent
- Read Ivan Vasilev’s [deep learning tutorial], but stop when you get to the autoencoders section because it’s not relevant for this course
- Read Sebastian Raschka's article on the [role of the activation function]
- Watch Alexander Ihler’s videos on [neural networks] and [gradient descent]
- Play around with the [TensorFlow playground] to create multilayer perceptron networks

### Challenges
- Augment your `Perceptron` class with the follow additional features:
  - Add a nonlinear activation function (for example, the logistic sigmoid function)
  - Implement `fit(X, y)`: train the weights and threshold using the perceptron learning rule until they converge (change by less than 0.0001 after one epoch)
  - Add a learning rate to control how fast the weights are updated in each iteration
  - Train your `Perceptron` on small 2-dimensional datasets like the examples from class. Compare the `weights` it found to your own (plotting makes this comparison really easy).
  - Train your `Perceptron` on the Iris dataset using one-versus-many encoding of classes (make a dummy boolean feature for each iris class, and then train on only one at a time). Plot the decision boundaries of each trained perceptron along with the iris data itself.


[multi-layer neural networks]: http://computing.dcu.ie/~humphrys/Notes/Neural/multi.neural.html
[Trask neural network part 1]: http://iamtrask.github.io/2015/07/12/basic-python-network/
[Trask neural network part 2]: http://iamtrask.github.io/2015/07/27/python-network-part2/
[deep learning tutorial]: https://www.toptal.com/machine-learning/an-introduction-to-deep-learning-from-perceptrons-to-deep-networks
[role of the activation function]: https://www.kdnuggets.com/2016/08/role-activation-function-neural-network.html
[neural networks]: https://www.youtube.com/watch?v=bH6VnezBZfI
[gradient descent]: https://www.youtube.com/watch?v=WnqQrPNYz5Q
[TensorFlow playground]: http://playground.tensorflow.org/
