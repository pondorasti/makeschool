# Naive Bayes [Slides](https://github.com/Make-School-Courses/DS-2.1-Machine-Learning/blob/master/Notebooks/remote_simple_naive_Bayes.ipynb)

### Learning Objectives
- Learn how to transform text data into number arrays
- What is Naive Bayes classifier and how it works
- Compare custom Naive Bayes code with Sklearn `MultinomialNB`

### Text Classification

- Text classification is to attach labels to bodies of text, e.g., tax document, medical form, etc. based on the text itself

- Think of your spam folder in your email. How does your email provider know that a particular message is spam or “ham” (not spam)?

### What are the pre-processings to apply a machine learning algorithm on text data?

1. The text must be parsed to words, called tokenization

2. Then the words need to be encoded as integers or floating point values

3. scikit-learn library offers easy-to-use tools to perform both tokenization and feature extraction of text data

### Activity: Apply Bag-of Word (BoW) to text dataset

BoW model is simple. It throws away all of the order information in the words and focuses on the occurrence of words in a document

Apply BoW with `CountVectorizer` in sklearn to the following `corpus`

```python
from sklearn.feature_extraction.text import TfidfVectorizer, CountVectorizer
corpus = ['This is the first document.',
'This document is the second document.',
'And this is the third one.',
'Is this the first document?']
# vectorizer = TfidfVectorizer()
vectorizer = CountVectorizer()
X = vectorizer.fit_transform(corpus)
print(X.toarray())
print(vectorizer.get_feature_names())
print(X.shape)
```
### Word Frequencies with TfidfVectorizer

- Word counts are a good starting point, but are very basic
- An alternative is to calculate word frequencies, and by far the most popular method is called TF-IDF.
- **Term Frequency**: This summarizes how often a given word appears within a document
- **Inverse Document Frequency**: This downscales words that appear a lot across documents

### Naive Bayes Classifier

- The Bayes Theorem : $$ P(spam | w_1, w_2, ..., w_n) = {P(w_1, w_2, ..., w_n | spam)}/{P(w_1, w_2, ..., w_n)} $$

- Naive Bayes assumption is that each word is independent of all other words, In reality, this is not true! But lets try it out for real world examples

- So the above relations become simple with this assumption: $P(spam | w_1, w_2, ..., w_n) = {P(w_1| spam)P(w_2| spam) ... P(w_n| spam)P(spam)}/{P(w_1, w_2, ..., w_n)}$

- Taking log from both side and the denominator is independent of spam or ham:

- $logP(spam | w_1, w_2, ..., w_n) \propto {\sum_{i=1}^{n}log P(w_i| spam)+ log P(spam)}$

### Activity: Apply the naive Bayes to spam/ham email dataset:

- Please read this article: https://pythonmachinelearning.pro/text-classification-tutorial-with-naive-bayes/

```python
data = pd.read_csv('spam.csv',encoding='latin-1')
data = data.drop(["Unnamed: 2", "Unnamed: 3", "Unnamed: 4"], axis=1)
data = data.rename(columns={"v1":'label', "v2":'text'})
print(data.head())
tags = data["label"]
texts = data["text"]
```
```python
class SpamDetector(object):
    """Implementation of Naive Bayes for binary classification"""
    def clean(self, s):
        translator = str.maketrans("", "", string.punctuation)
        return s.translate(translator)

    def tokenize(self, text):
        text = self.clean(text).lower()
        return re.split("\W+", text)

    def get_word_counts(self, words):
        word_counts = {}
        for word in words:
            word_counts[word] = word_counts.get(word, 0.0) + 1.0
        return word_counts

    def fit(self, X, Y):
        """Fit our classifier
        Arguments:
            X {list} -- list of document contents
            y {list} -- correct labels
        """
        self.num_messages = {}
        self.log_class_priors = {}
        self.word_counts = {}
        self.vocab = set()

        n = len(X)
        self.num_messages['spam'] = sum(1 for label in Y if label == 1)
        self.num_messages['ham'] = sum(1 for label in Y if label == 0)
        self.log_class_priors['spam'] = math.log(self.num_messages['spam'] / n)
        self.log_class_priors['ham'] = math.log(self.num_messages['ham'] / n)
        self.word_counts['spam'] = {}
        self.word_counts['ham'] = {}

        for x, y in zip(X, Y):
            c = 'spam' if y == 1 else 'ham'
            counts = self.get_word_counts(self.tokenize(x))
            for word, count in counts.items():
                if word not in self.vocab:
                    self.vocab.add(word)
                if word not in self.word_counts[c]:
                    self.word_counts[c][word] = 0.0

                self.word_counts[c][word] += count

    def predict(self, X):
        result = []
        for x in X:
            counts = self.get_word_counts(self.tokenize(x))
            spam_score = 0
            ham_score = 0
            for word, _ in counts.items():
                if word not in self.vocab: continue

                # add Laplace smoothing
                log_w_given_spam = math.log( (self.word_counts['spam'].get(word, 0.0) + 1) / (self.num_messages['spam'] + len(self.vocab)) )
                log_w_given_ham = math.log( (self.word_counts['ham'].get(word, 0.0) + 1) / (self.num_messages['ham'] + len(self.vocab)) )

                spam_score += log_w_given_spam
                ham_score += log_w_given_ham

            spam_score += self.log_class_priors['spam']
            ham_score += self.log_class_priors['ham']

            if spam_score > ham_score:
                result.append(1)
            else:
                result.append(0)
        return result


if __name__ == '__main__':
    X, y = texts, tags
    MNB = SpamDetector()
    MNB.fit(X[100:], y[100:])

    pred = MNB.predict(X[:100])
    true = y[:100]

    accuracy = sum(1 for i in range(len(pred)) if pred[i] == true[i]) / float(len(pred))
    print("{0:.4f}".format(accuracy))
```

### Activity: use sklearn CountVectorizer and MultinomialNB to spam email dataset

- Read this blog first: https://www.ritchieng.com/machine-learning-multinomial-naive-bayes-vectorization/

steps:

1- Split the dataset

`from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=1)`

2- Vectorizing our dataset : `vect = CountVectorizer()`

3- Transform training data into a document-term matrix: `X_train_dtm = vect.fit_transform(X_train)`

4- Build and evaluate the model

```python
from sklearn.naive_bayes import MultinomialNB
from sklearn import metrics

# instantiate a Multinomial Naive Bayes model
nb = MultinomialNB()
nb.fit(X_train_dtm, y_train)
X_test_dtm = vect.transform(X_test)
y_pred_class = nb.predict(X_test_dtm)
metrics.accuracy_score(y_test, y_pred_class)
```
