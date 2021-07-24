## Improving Training Performance

### Topics
- Backpropagation learning algorithm
- Stochastic gradient descent on error function
- Using TensorBoard visualization tool with Keras
- Techniques for improving neural network performance
  - Hyperparameter tuning
  - Dropout layers
  - Momentum

### Resources
- Read Andrew Trask's articles on building a neural network in Python – [part 1: optimization][Trask Neural Network part 1] and [part 2: gradient descent][Trask Neural Network part 2] – Pay close attention to the diagrams in part 2 to gain an intuition for gradient descent
- Watch Andrew Ng's videos on [gradient descent] and the [intuition behind it][gradient descent intuition]
- Watch 3Blue1Brown's videos on [neural networks, gradient descent, and backpropagation][3Blue1Brown neural networks playlist]
- Reference the [Keras callbacks documentation][Keras callbacks TensorBoard] with examples to create TensorBoard callbacks
- Reference the [Keras `Sequential` model documentation][Keras sequential model] with examples of using dropout layers
- Read Jason Brownlee's article on [dropout regularization] and the intuition behind why it adds robustness to neural networks
- Read Gabriel Goh's article [Why Momentum Really Works] with many excellent interactive diagrams to understand the mathematics and dynamics of stochastic gradient descent with momentum

### Challenges
- Connect TensorBoard visualization tool with Keras to view training graphs
  - Create a `logs` directory (where your Juptyter notebooks are) to store training log data for TensorBoard: `mkdir logs`
  - Run TensorBoard (in another Terminal tab/window from your Jupyter notebooks server): `tensorboard --logdir=logs`
  - Create a callback to send log data to TensorBoard (just copy code from the [Keras documentation][Keras callbacks TensorBoard] and modify as needed):
  `callback = keras.callbacks.TensorBoard(log_dir='./logs', ...)`
  - Pass the callback function into the call to `model.fit` with the `callbacks` keyword (`callback` must be wrapped in a list):
  `model.fit(X_train, y_train, ..., callbacks=[callback])`
  - Inspect the graphs on TensorBoard's 'scalars' tab to observe your model training and to detect if it is overfit or underfit
- Modify your MNIST classifier to see how dropout layers improve robustness and avoid overfitting
  - First remember to import the `Dropout` layer class: `from keras.layers import Dropout`
  - Then add a `Dropout` layer after each `Dense` layer: `model.add(Dropout(0.5))`
  - Play with the probability hyperparameters in the dropout layers and see how it affects the model (try `0.2`, `0.5`, and `0.8`)
- Complete the [Jupyter notebook on techniques for improving training performance][improving performance notebook]


[Trask neural network part 1]: http://iamtrask.github.io/2015/07/12/basic-python-network/
[Trask neural network part 2]: http://iamtrask.github.io/2015/07/27/python-network-part2/
[gradient descent]: https://www.youtube.com/watch?v=LN0PLnDpGN4
[gradient descent intuition]: https://www.youtube.com/watch?v=kWq2k1gPyBs
[3Blue1Brown neural networks playlist]: https://www.youtube.com/playlist?list=PLZHQObOWTQDNU6R1_67000Dx_ZCJB-3pi
[Why Momentum Really Works]: https://distill.pub/2017/momentum/
[dropout regularization]: https://machinelearningmastery.com/dropout-regularization-deep-learning-models-keras/
[Keras callbacks TensorBoard]: https://keras.io/callbacks/#tensorboard
[Keras sequential model]: https://keras.io/getting-started/sequential-model-guide/

[improving performance notebook]: ../notebooks/ImprovingPerformance.ipynb
