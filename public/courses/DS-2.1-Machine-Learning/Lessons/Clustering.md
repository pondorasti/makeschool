## Learning Objectives [Slides](https://github.com/Make-School-Courses/DS-2.1-Machine-Learning/blob/master/Notebooks/remote_simple_kmeans.ipynb)
- The first unsupervised learning algorithm is the topic of this class
- Kmean clustering algorithm and its visualization will be presented
- The number of cluster and how to choose it
- The application of kmeans clustering to text and iris data will be explored

### Clustering

- Clustering is a type of unsupervised learning
- This is very often used because we usually don’t have labeled data
- K-Means clustering is one of the popular clustering algorithm
- The goal of any cluster algorithm is to find groups (clusters) in the given data

### Motivating Example

- Text Clustering
```python
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
from sklearn.metrics import adjusted_rand_score

documents = ["This little kitty came to play when I was eating at a restaurant.",
             "Merley has the best squooshy kitten belly.",
             "Google Translate app is incredible.",
             "If you open 100 tab in google you get a smiley face.",
             "Best cat photo I've ever taken.",
             "Climbing ninja cat.",
             "Impressed with google map feedback.",
             "Key promoter extension for Google Chrome."]

vectorizer = TfidfVectorizer(stop_words='english')
X = vectorizer.fit_transform(documents)
print(X.shape)
true_k = 2
model = KMeans(n_clusters=true_k, init='k-means++')
model.fit(X)
print('M:')
print(model.cluster_centers_.argsort())
print(model.cluster_centers_.argsort()[:, ::-1])
print("Top terms per cluster:")
order_centroids = model.cluster_centers_.argsort()[:, ::-1]
terms = vectorizer.get_feature_names()
for i in range(true_k):
    print("Cluster %d:" % i),
    for ind in order_centroids[i, :10]:
        print(' %s' % terms[ind]),


print("\n")
print("Prediction")

Y = vectorizer.transform(["chrome browser to open."])
print('Y:')
print(Y.toarray())
prediction = model.predict(Y)
print(prediction)

Y = vectorizer.transform(["My cat is hungry."])
prediction = model.predict(Y)
print(prediction)
```

### Examples of clustering

- Cluster movie dataset -> we expect the movie which their genres are similar clustered in the same group
- News Article Clustering

### K-means algorithm:

Assume the inputs are $$x_1$$, $$x_2$$, ..., $$x_n$$. Choose $$K$$ arbitrarily.

- Step 1 - Pick $$K$$ random points as cluster centers called centroids
- Step 2 - Assign each $$x_i$$ to nearest cluster by calculating its distance to each centroid
- Step 3 - Find new cluster center by taking the average of the assigned points
- Step 4 - Repeat Step 2 and 3 until none of the cluster assignments change

### Demo of Clustering
```python
from figures import plot_kmeans_interactive
plot_kmeans_interactive()
```
- Also see: https://www.neonscience.org/classification-kmeans-pca-python

### Activity: How to choose K in K-means?
```python
distortions = []
K = range(1, 10)
for k in K:
    km = KMeans(n_clusters=k).fit(X)
    km.fit(X)
    distortions.append(sum(np.min(cdist(X, km.cluster_centers_, 'euclidean'), axis=1)) / X.shape[0])

# Plot the elbow
plt.plot(K, distortions, 'bx-')
plt.xlabel('k')
plt.ylabel('Distortion')
plt.title('The Elbow Method showing the optimal k')
plt.show()
```
or
```python
Sum_of_squared_distances = []
K = range(1,15)
for k in K:
    km = KMeans(n_clusters=k)
    km = km.fit(data_transformed)
    Sum_of_squared_distances.append(km.inertia_)
```

### How to choose K?

choose arbitrary K

1- Compute all of the distances of red points to red centroid

2- Do step (1) for other colors (purple, blue, ...)

3- Add them up

### Other clustering methods and comparison:

http://scikit-learn.org/stable/modules/clustering.html
