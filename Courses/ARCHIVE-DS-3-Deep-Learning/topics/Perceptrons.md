## Perceptrons

### Topics
- Neurological inspiration for mathematical modeling of artificial neural networks
- Perceptrons (inputs, weights, threshold)
- Geometric interpretation of weights vector and threshold scalar as decision boundary

### Resources
- Read Jakob Janecek’s notes on [simple perceptrons] and follow the learning example (slides 16-25), but stop at the perceptron convergence theorem. Pay attention to the diagram on slide 12 which explains how to geometrically interpret the weights and bias.
- Read Mark Humphry’s excellent notes on [single-layer neural networks]
- Watch Udacity’s video on [perceptron training]

### Challenges
- Write a `Perceptron` class with the following instance attributes and methods:
  - `weights`: list of floats
  - `threshold`: float
  - `__init__()`: initializer method to create instance attributes
  - `activate(inputs)`: classify single instance (`inputs`: list of features, return: int)
  - `predict(X)`: classify many instances (return: list of n ints, given n instances in `X`)
- Create several small 2-dimensional datasets like the examples from class and initialize a `Perceptron` with manually-chosen `weights` and `threshold` that can classify all inputs.
- Plot the hyperplane decision boundary represented by your Perceptron’s weights and threshold along with the data it was trained on. If you’re stuck, then follow [this example][perceptron hyperplane]. (Slide 12 of the [simple perceptrons] notes will help you interpret and plot the weights.)


[simple perceptrons]: http://aass.oru.se/~lilien/ml/seminars/2007_02_01b-Janecek-Perceptron.pdf
[single-layer neural networks]: http://computing.dcu.ie/~humphrys/Notes/Neural/single.neural.html
[perceptron training]: https://www.youtube.com/watch?v=5g0TPrxKK6o
[perceptron hyperplane]: http://stamfordresearch.com/python-perceptron-re-visited/
