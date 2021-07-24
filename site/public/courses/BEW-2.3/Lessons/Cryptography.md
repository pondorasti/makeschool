# 📜 Day 7: Intro to Cryptography

<!-- omit in toc -->
## ⏱ Agenda {docsify-ignore}

- [[**02m**] 🏆 Objectives](#02m-%f0%9f%8f%86-objectives)
- [[**25m**] ☀️ Warm Up: Caesar Cypher Interview Practice](#25m-%e2%98%80%ef%b8%8f-warm-up-caesar-cypher-interview-practice)
- [[**05m**] TT: Hiding Secrets in Text](#05m-%f0%9f%93%96-tt-hiding-secrets-in-text)
- [[**10m**] 💻 Activity: Create Cryptograms](#10m-%f0%9f%92%bb-activity-create-cryptograms)
- [[**25m**] 💻 Activity: Crush Cryptograms](#25m-%f0%9f%92%bb-activity-crush-cryptograms)
- [[**10m**] 🌴 BREAK](#10m-%f0%9f%8c%b4-break-docsify-ignore)
- [[**20m**] 📖 TT: Hiding Secrets in Images](#20m-%f0%9f%93%96-tt-hiding-secrets-in-images)
- [[**35m**] 💻 Activity: Decoding a Secret Message](#35m-%f0%9f%92%bb-activity-decoding-a-secret-message)
- [[**35m**] 💻 Activity: Encoding a Secret Message](#35m-%f0%9f%92%bb-activity-encoding-a-secret-message)
- [[**03m**] 🌃 After Class](#03m-%f0%9f%8c%83-after-class)
- [📚 Resources & Credits](#%f0%9f%93%9a-resources--credits)
<!-- > -->

## [**02m**] 🏆 Objectives

1. Practice interview skills and substitution cyphers via HackerRank.
2. Create and solve text-based cryptograms puzzles by hand.
3. Build a project in Python that encodes and decodes hidden text within an image using a technique called steganography.

<!-- > -->

## [**25m**] ☀️ Warm Up: Caesar Cypher Interview Practice

Work on the [Caesar Cipher](https://www.hackerrank.com/challenges/caesar-cipher-1/problem) interview coding problem on HackerRank.

<!-- > -->

## [**05m**] 📖 TT: Hiding Secrets in Text

<!-- > -->

A **cryptogram** is a **puzzle that consists of a short piece of encrypted text**.

Most cryptograms can be solved by hand using a Substitution Cypher, like the Caesar cypher we warmed up with at the start of class today: these cyphers all replace each letter with a different letter or number until the source text is hidden.

For an example of cryptograms in literature, check out Edgar Allan Poe's [The Gold Bug](https://poestories.com/read/goldbug#cryptogram). A character named Mr. Legrand teaches you how to solve cryptograms and ciphers by looking at the patterns of characters.

<!-- > -->

## [**10m**] 💻 Activity: Create Cryptograms

1. Copy your **favorite quote** to your clipboard. _Don't share it with anyone!_
1. **Visit** the [Cryptogram Creator](https://markknowsnothing.weebly.com/cryptogramcreator.html)
1. **Paste your quote** in the text area. _Use image below for reference_:

    ![cryptogram](https://raw.githubusercontent.com/Make-School-Courses/BEW-2.3-Web-Security/master/Lessons/Assets/cryptogram.jpeg)

1. **Open Slack**
1. Share your cryptogram in Slack.

<!-- > -->

## [**25m**] 💻 Activity: Crush Cryptograms

1. Watch [this video](https://youtu.be/5y9THLG94SU) that teaches you how to solve cryptograms. _(7 minutes)_
1. Try at **least two cryptograms posted** in the channel.
1. **Did you solve a puzzle**?<br>➡️ _DM the creator and tell them your solution_.
1. **Was your puzzle solved**?<br>➡️ _Add a new emoji for each correct solution on the post containing your puzzle._
1, **Really stuck**?<br>➡️ _Try [QuipQiup](https://quipqiup.com), a fast and automated cryptogram solver_.

<!-- > -->

## [**10m**] 🌴 BREAK {docsify-ignore}

<!-- > -->

## [**20m**] 📖 TT: Hiding Secrets in Images

The same image viewed by white, blue, green and red lights reveals different hidden numbers.

![](https://upload.wikimedia.org/wikipedia/commons/9/9c/Steganography.png)

The main goal of [steganography](https://en.wikipedia.org/wiki/Steganography) is to **hide information within data that doesn’t appear to be secret at a glance**. For example, this sentence:

```txt
Since everyone can read, encoding text in neutral sentences is definitely effective
```

turns into:

```txt
Secret inside
```

...if you take the first letter of every word.

Steganography is really handy to use, because people won’t even suspect that they’re looking at a secret message &mdash; making it less likely that they’ll want to try to crack your code. In the past, you may have created hidden messages using invisible ink, or using special keywords with your friends. However, as fearless coders, we have access to fancier ways to sneak data around.

<!-- > -->

### The Value of One Pixel

There are multiple ways to hide things within other things, but today we will be working with images.

A black and white image (not grayscale) is an easy thing to conceptualize, where a black pixel has a value of `1` and a white pixel as a value of `0`.

Color images have three color channels (`RGB`), with pixel values of `0`-`255` for each pixel. So a pixel with the value `(255,255,255)` would be entirely white while `(0,0,0)` would be black. The upper range is `255` because it is the largest value that can be represented by an 8 bit binary number. Binary is a base-two paradigm, in contrast to decimal which is in base-ten, which means you calculate the value of a binary number by summing the 2s exponent of each place where a `1` appears.

So if we wanted to convert the number `10001011` from binary into decimal, it would look something like:

```python
2^8 + 2^4 + 2^2 + 2^1 = 139
```

You can also test this out in your Python interpreter. Binary numbers are automatically converted to integers so you don’t actually need to have a `print` statement. (It’s just there for clarity.)

```python
>>> print(0b10001011)
139
>>> type(0b10001011)
<class 'int'>
>>> 0b00001011
11
>>> 0b10001010
138
```

From our quick tests above, you can see that the leftmost bit place matters a lot more than rightmost bit because the rightmost bit only modifies the value of the number by `1`. We saw that:

```python
10001011 = 139` while `00001011 = 11
10001011 = 139` while `10001010 = 138
```

Because of this, we describe the leftmost bit as the “most significant bit” (`MSB`) while the rightmost bit is the “least significant bit” (`LSB`).

We can observe that its entirely possible to hide a black and white image inside an RGB image by changing the LSB of a pixel in a single color channel to correspond to the value of the image we want to hide.

Additionally, since changing the LSB doesn’t drastically change the overall value of the of 8 bit number, we can hide our data without modifying a source image in any detectable sort of way. You can test this out with any [RGB color wheel](http://www.colorspire.com/rgb-color-wheel/) to get a sense of how little difference there is between a color like (150, 50, 50) and (151, 50, 50)

> [!NOTE]
> _The concept of **MSB** and **LSB** occurs in other contexts as well. For example, [**parity bits**](https://en.wikipedia.org/wiki/Parity_bit) are used as a basic form of error checking. Additionally, because the LSBs will change rapidly even if the value of the bit changes a little, they are very useful for use in [**hash functions**](https://en.wikipedia.org/wiki/Hash_function) and [**checksums**](https://en.wikipedia.org/wiki/Checksum) for validation purposes._

<!-- > -->

## [**35m**] 💻 Activity: Decoding a Secret Message

> [!WARNING]
> Use `.png` files for this activity. Avoid working with `.jpg` files for this activity. JPEG compression will make your task more difficult.

**This dog is hiding a very secret message… can you decode it?**

![Sample encoded image](https://raw.githubusercontent.com/Make-School-Courses/BEW-2.3-Web-Security/master/Lessons/Assets/encoded_sample.png)

_In this activity, you will delve a bit deeper into the specifics of how images are created in addition to learning more about bits and binary math._

_This activity was modified from [Interactive Python](http://interactivepython.org/runestone/static/everyday/2013/03/1_steganography.html), though this version encodes an image into another image instead of ASCII text._

<!-- > -->

### Starter Code

Provided below is the start of a function called `decode_image`.

> [!NOTE]
> _You may want to look at the Python [bin](https://docs.python.org/3/library/functions.html#bin) function as you convert between integer and binary.<br>`bin` will convert an integer to a **binary string**_.

The secret image is hidden in the LSB of the pixels in the red channel of the image. That is, the value of the LSB of each red pixel is `1` if the hidden image was `1` at that location, and `0` if the hidden image was also `0`.

**Your task is to iterate though each pixel in the encoded image and set the `decode_image` pixel to be `(0, 0, 0)` or `(255, 255, 255`) depending on the value of that LSB.**


> [!TIP]
> You'll have to isolate the `red_channel` from the original RGB image. You can do this using the `.split()` method that PIL provides.

**Copy this code into your IDE to get started:**

[](https://raw.githubusercontent.com/Make-School-Courses/BEW-2.3-Web-Security/master/Lessons/Code/steganography.py ':include :type=code python')

[Link to File on GitHub](https://raw.githubusercontent.com/Make-School-Courses/BEW-2.3-Web-Security/master/Lessons/Code/steganography.py)

<!-- > -->

## [**35m**] 💻 Activity: Encoding a Secret Message

Now that we can decode secret messages, it’s only natural that we want to encode some too! Provided in the starter code are a pair of functions called `write_text()` and `encode_image()`. `write_text()` will take a string and convert it to a black and white image of the string. You may use it as a helper function in completing your implementation of `encode_image()`.

<!-- > -->

## 📚 Resources & Credits

- [Steganography Tutorial | A Complete Guide For Beginners | Edureka](https://www.edureka.co/blog/steganography-tutorial)
- [Steganography: Uses, Methods, Tools and Examples](https://www.ukessays.com/essays/computer-science/steganography-uses-methods-tools-3250.php)
- [How to Use Steganography to Hide Secret Data in Images in Python - Python Code](https://www.thepythoncode.com/article/hide-secret-data-in-images-using-steganography-python)
- [Image Steganography using Python | Rupali Roy | Towards Data Science](https://towardsdatascience.com/hiding-data-in-an-image-image-steganography-using-python-e491b68b1372)
- [How To Hide Data in Images Using Python | Ashwin Goel | Medium](https://medium.com/better-programming/image-steganography-using-python-2250896e48b9)
