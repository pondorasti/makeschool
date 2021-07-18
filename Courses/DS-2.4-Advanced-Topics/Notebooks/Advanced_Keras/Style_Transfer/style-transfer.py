#!/usr/bin/env python3
"""
style-transfer.py - An implementation of the style transfer algorithm. It's a synthesis of the original paper, combined
                    with the adaption to the loss function that adds in the variation loss factor for normalization.
                    Components have been synthesized together.

For reference:
    - https://arxiv.org/pdf/1508.06576.pdf (original style loss paper)
    - https://arxiv.org/pdf/1412.0035.pdf (explains the ideas behind variation loss)
    - https://github.com/keras-team/keras/blob/master/examples/neural_style_transfer.py
      (style transfer as given by the keras team)
    - https://harishnarayanan.org/writing/artistic-style-transfer/ (longer tutorial that walks through convolutions)

"""

import keras.backend as K
from keras.applications import VGG16

from PIL import Image

import numpy as np
import time

from scipy.optimize import fmin_l_bfgs_b
from scipy.misc import imsave

import argparse


parser = argparse.ArgumentParser(description='Image neural style transfer implemented with Keras')
parser.add_argument('content_img', metavar='content', type=str, help='Path to target content image')
parser.add_argument('style_img', metavar='style', type=str, help='Path to target style image')
parser.add_argument('result_img_prefix', metavar='res_prefix', type=str, help='Name of generated image')
parser.add_argument('--iter', type=int, default=10, required=False, help='Number of iterations to run')
parser.add_argument('--content_weight', type=float, default=0.025, required=False, help='Content weight')
parser.add_argument('--style_weight', type=float, default=1.0, required=False, help='Style weight')
parser.add_argument('--var_weight', type=float, default=1.0, required=False, help='Total Variation weight')
parser.add_argument('--height', type=int, default=512, required=False, help='Height of the images')
parser.add_argument('--width', type=int, default=512, required=False, help='Width of the images')

args = parser.parse_args()

# Params #

img_height = args.height
img_width = args.width
img_size = img_height * img_width
img_channels = 3

content_path = args.content_img
style_path = args.style_img
target_path = args.result_img_prefix
target_extension = '.png'

CONTENT_IMAGE_POS = 0
STYLE_IMAGE_POS = 1
GENERATED_IMAGE_POS = 2

# Params #


def process_img(path):
    """
    Function for processing images to the format we need
    :param path: The path to the image
    :return: The image as a data array, scaled and reflected
    """
    # Open image and resize it
    img = Image.open(path)
    img = img.resize((img_width, img_height))

    # Convert image to data array
    data = np.asarray(img, dtype='float32')
    data = np.expand_dims(data, axis=0)
    data = data[:, :, :, :3]

    # Apply pre-process to match VGG16 we are using
    data[:, :, :, 0] -= 103.939
    data[:, :, :, 1] -= 116.779
    data[:, :, :, 2] -= 123.68

    # Flip from RGB to BGR
    data = data[:, :, :, ::-1]

    return data


def get_layers(content_matrix, style_matrix, generated_matrix):
    """
    Returns the content and style layers we need for the transfer
    :param content_matrix: The feature matrix of the content image
    :param style_matrix:  The feature matrix of the style image
    :param generated_matrix:  The feature matrix of the generated image
    :return: A tuple of content layers and style layers
    """
    # Prep the model for our new input sizes
    input_tensor = K.concatenate([content_matrix, style_matrix, generated_matrix], axis=0)
    model = VGG16(input_tensor=input_tensor, weights='imagenet', include_top=False)

    # Convert layers to dictionary
    layers = dict([(layer.name, layer.output) for layer in model.layers])

    # Pull the specific layers we want
    c_layers = layers['block2_conv2']
    s_layers = ['block1_conv2', 'block2_conv2', 'block3_conv3', 'block4_conv3', 'block5_conv3']
    s_layers = [layers[layer] for layer in s_layers]

    return c_layers, s_layers


def content_loss(content_features, generated_features):
    """
    Computes the content loss
    :param content_features: The features of the content image
    :param generated_features: The features of the generated image
    :return: The content loss
    """
    return 0.5 * K.sum(K.square(generated_features - content_features))


def gram_matrix(features):
    """
    Calculates the gram matrix of the feature representation matrix
    :param features: The feature matrix that is used to calculate the gram matrix
    :return: The gram matrix
    """
    return K.dot(features, K.transpose(features))


def style_loss(style_matrix, generated_matrix):
    """
    Computes the style loss of the transfer
    :param style_matrix: The style representation from the target style image
    :param generated_matrix: The style representation from the generated image
    :return: The loss from the style content
    """
    # Permute the matrix to calculate proper covariance
    style_features = K.batch_flatten(K.permute_dimensions(style_matrix, (2, 0, 1)))
    generated_features = K.batch_flatten(K.permute_dimensions(generated_matrix, (2, 0, 1)))

    # Get the gram matrices
    style_mat = gram_matrix(style_features)
    generated_mat = gram_matrix(generated_features)

    return K.sum(K.square(style_mat - generated_mat)) / (4.0 * (img_channels ** 2) * (img_size ** 2))


def variation_loss(generated_matrix):
    """
    Computes the variation loss metric (used for normalization)
    :param generated_matrix: The generated matrix
    :return: The variation loss term for normalization
    """
    a = K.square(generated_matrix[:, :img_height-1, :img_width-1, :] - generated_matrix[:, 1:, :img_width-1, :])
    b = K.square(generated_matrix[:, :img_height-1, :img_width-1, :] - generated_matrix[:, :img_height-1, 1:, :])

    return K.sum(K.pow(a + b, 1.25))


def total_loss(c_layer, s_layers, generated):
    """
    Computes the total loss of a given iteration
    :param c_layer: The layer used to compute the content loss
    :param s_layers: The layer(s) used to compute the style loss
    :param generated: The generated image
    :return: The total loss
    """

    content_weight = args.content_weight
    style_weight = args.style_weight
    variation_weight = args.var_weight

    # Content loss
    content_features = c_layer[CONTENT_IMAGE_POS, :, :, :]
    generated_features = c_layer[GENERATED_IMAGE_POS, :, :, :]
    c_loss = content_loss(content_features, generated_features)

    # Style loss
    s_loss = None
    for layer in s_layers:
        style_features = layer[STYLE_IMAGE_POS, :, :, :]
        generated_features = layer[GENERATED_IMAGE_POS, :, :, :]
        if s_loss is None:
            s_loss = style_loss(style_features, generated_features) * (style_weight / len(s_layers))
        else:
            s_loss += style_loss(style_features, generated_features) * (style_weight / len(s_layers))

    # Variation loss (for regularization)
    v_loss = variation_loss(generated)

    return content_weight * c_loss + s_loss + variation_weight * v_loss


def eval_loss_and_grads(generated):
    """
    Computes the loss and gradients
    :param generated: The generated image
    :return: The loss and the gradients
    """
    generated = generated.reshape((1, img_height, img_width, 3))
    outs = f_outputs([generated])
    loss_value = outs[0]
    grad_values = outs[1].flatten().astype('float64')
    return loss_value, grad_values


def save_image(filename, generated):
    """
    Saves the generated image
    :param filename: The filename that the image is saved to
    :param generated: The image that we want saved
    :return: Nothing
    """
    # Reshape image and flip from BGR to RGB
    generated = generated.reshape((img_height, img_width, 3))
    generated = generated[:, :, ::-1]

    # Re-apply the mean shift
    generated[:, :, 0] += 103.939
    generated[:, :, 1] += 116.779
    generated[:, :, 2] += 123.68

    # Clip values to 0-255
    generated = np.clip(generated, 0, 255).astype('uint8')

    imsave(filename, Image.fromarray(generated))


class Evaluator(object):
    """
    Evaluator class used to track gradients and loss values together
    """

    def __init__(self):
        self.loss_value = None
        self.grad_values = None

    def loss(self, x):
        assert self.loss_value is None
        loss_value, grad_values = eval_loss_and_grads(x)
        self.loss_value = loss_value
        self.grad_values = grad_values
        return self.loss_value

    def grads(self, x):
        assert self.loss_value is not None
        grad_values = np.copy(self.grad_values)
        self.loss_value = None
        self.grad_values = None
        return grad_values


if __name__ == '__main__':
    # Prepare the generated image
    generated_img = np.random.uniform(0, 255, (1, img_height, img_width, 3)) - 128.

    # Load the respective content and style images
    content = process_img(content_path)
    style = process_img(style_path)

    # Prepare the variables for the flow graph
    content_image = K.variable(content)
    style_image = K.variable(style)
    generated_image = K.placeholder((1, img_height, img_width, 3))
    loss = K.variable(0.)

    # Grab the layers needed to prepare the loss metric
    content_layer, style_layers = get_layers(content_image, style_image, generated_image)

    # Define loss and gradient
    loss = total_loss(content_layer, style_layers, generated_image)
    grads = K.gradients(loss, generated_image)

    # Define the output
    outputs = [loss]
    outputs += grads
    f_outputs = K.function([generated_image], outputs)

    evaluator = Evaluator()
    iterations = args.iter

    name = '{}-{}{}'.format(target_path, 0, target_extension)
    save_image(name, generated_img)

    for i in range(iterations):
        print('Iteration:', i)
        start_time = time.time()
        generated_img, min_val, info = fmin_l_bfgs_b(evaluator.loss, generated_img.flatten(),
                                                     fprime=evaluator.grads, maxfun=20)
        print('Loss:', min_val)
        end_time = time.time()
        print('Iteration {} took {} seconds'.format(i, end_time - start_time))
        name = '{}-{}{}'.format(target_path, i+1, target_extension)
        save_image(name, generated_img)
        print('Saved image to: {}'.format(name))
