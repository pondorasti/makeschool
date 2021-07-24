# Your Social Network - Graph Tutorial
[Graph Tutorial Rubric](https://docs.google.com/document/d/1ICVRzuDMIapVhpqbG7oHpk7_yCWu2bET8EYv6o_J9io/edit?usp=sharing)


## Chapter 0: Set up
How many social network platforms are you currently on? Each of those is an example of graph theory being applied to solve the problem of finding connections – and recommending appropriate ones.

In this tutorial, you'll build a graph of your nine closest friends and use graph theory to figure out interesting data about them.

### Learning Outcomes
By the end of this tutorial, you will be able to...

1. Implement a graph in code.
1. Use a variety of neighbor lookup algorithms for a given graph
1. Traverse a graph through various search methods


### Using Git/GitHub
Much like we've done in earlier tutorials, make sure you're committing your code as you complete milestones. At a minimum, you should make a commit whenever the tutorial prompts you.

Let's get your repo set up!

1. Go to the [Graph Tutorial](https://github.com/Make-School-Labs/CS-2.2-Labs) and clone the repo locally.
1. Now we need to change the remote so that you can commit/push/pull the changes you make to your own repo. **It is very important you do the below steps in order to get everything working properly.**
1. Go to GitHub and create an _empty_, public repository called Graph-Tutorial, and now associate it as a remote for your cloned starter code, and then push to it.
1. Go to your repo on GitHub and make sure your previously empty repo is now full with starter code! Now when you add/commit/push, it'll be to your repo!

## Chapter 1: Who do you know?
This tutorial will focus on properties of a social network.  To begin with, we'll need to define a network as a set of people (vertices) and the people they know.  If person *A* knows person *B* then there is an edge between them.  We will begin by assuming that if person *A* knows person *B* then the reverse is also true. (So the edge is undirected).

1. Draw a graph with you at the center connected by and edge to another 9 people you know.  Do any of these 9 know each other? If so draw an edge between them.  This will be your "Social Graph" to use as a sample in the rest of this tutorial.  Your graph must have the following properties:
- Every person knows at least 2 other people.  
- No person knows more than 5 people.

**Challenge** Add a diagram (or hand drawn image) of your friend network to the readme of your tutorial code.  Label the nodes with you and your 9 friends names.  If you don't want to use your real friends, feel free to use [Faker](https://faker.readthedocs.io/en/master/) to give fake names.

### Implement in code

Throughout this tutorial we will build up a *graph data structure* that will implement our graph and graph algorithms in python.

We will be building onto the basic Graph Abstract Data Type (ADT) which is defined as follows:

```python

Graph() #creates a new, empty graph.
add_vertex(vert) #adds an instance of vertex to the graph.
add_edge(from_vert, to_vert) #Adds a new, directed edge to the graph that connects two vertices.
add_edge(from_vert, to_vert, weight) #Adds a new, weighted, directed edge to the graph that connects two vertices.
get_vertex(vertKey) #finds the vertex in the graph named vertKey.
get_vertices() #returns the list of all vertices in the graph.

```

**Challenge:** Implement the `Graph` class in the file *graph.py* and input your personal Social Graph with vertices and edges matching the diagram you drew of your friends.  Note: Initially we'll create a `Vertex` class as a helper class to the `Graph` class.

**Stretch Challenge:** Write a method that reads in graph data from a file and returns an instance of the `Graph` class. The file format should look like this:

```
G
1,2,3,4
(1,2)
(1,3)
(2,4)
```

Your method might look something like this:

```python
def make_graph_from_file(filename):
# Check if first line is 'G' or 'D' and store the value. If neither, raise an exception
# For each vertex id in first line, add a vertex to the graph
# For each of the following lines:
    # Extract the vertex ids and the (optional) weight, and add an edge to the graph
    # If it is a Graph and not a Digraph, add another edge in the opposite direction
    # Raise an exception if line contains too many (or too few) items
```

If the file is not formatted correctly, you can raise an exception:

```python
raise Exception(f"File must begin with G or D, found {firstline}")
```

## Chapter 2: Won't you Be My Neighbor?
Have you ever had that moment where you find out a friend knows another one of your friends? Having one of those "worlds collide" moments can be exciting, scary, or a whole mixture of emotions. Instead of having that situation surprise us, what if we had a way to know this information in advance?

### Find Your Neighbors
Turns out we do! We can utilize a **neighbor lookup** for a given node in our graph to see what other nodes it is connected with. If you and a friend are connected, you two share a friendship. How do we know if two nodes are connected? _They share an edge!_

**Challenge:** Write a method `get_neighbors` in the `Vertex` class that outputs all nodes connected to the current node.

```python
def get_neighbors(self):
    # Make sure the input node is actually in the graph
    # Find all edges for the input node
    # See what nodes are connected to the input node via the edge
    # return the connected nodes
```

### Down The Friend Chain We Go
All right, no more surprise connections for us! But what if we want to go even _further_ than one connection? Onward!


## Chapter 3: Breadth of Fresh Neighbors

How does Facebook or LinkedIn know what friends to recommend to you? They look at who your friends are friends with, and who their friends are friends with, and so on

![two friends](https://media1.giphy.com/media/r73emnWNwTWRq/giphy.gif)

_Source: [Giphy](https://giphy.com/gifs/saturday-night-live-waynes-world-r73emnWNwTWRq)_

### Friends of Friends
The function you just wrote is great for finding your immediate friends, but what if we want to see their friend's friends?

Think back to CS 1.3: what's an algorithm at your disposal we could use here?

Since we want to find _all_ friends at a certain connection level away (friend's friend would be 2 connections from you), this sounds like a perfect application of **Breadth First Search (BFS)**. Check out the [Tree Traversals lesson](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/blob/master/Lessons/TreeTraversals.md) from CS 1.3 if you want a refresher.

**Challenge:** Write a method `breadth_first_search(self, vertex, n)`in the `Graph()` class that takes in a node, and `n` (an integer) as input, and outputs all nodes that are exactly `n` connections away from the input node.


```python
def breadth_first_search(self, vertex, n):
# Make sure the input node is actually in the graph
# Run breadth_first_search starting from the input node and going `n` levels deep
# Return all nodes found at the `n`th level
```

### A More Granular Approach
Great application of BFS! But as with anything related to BFS, specificity isn't a strong suite. Having _all_ of your 3rd, 4th, 5th degree connections is daunting. What if we just want to see how two _specific_ people are connected? We'll solve this in the next chapter!

## Chapter 4: Friends Along the Way
There's this idea of [six degrees of separation](https://en.wikipedia.org/wiki/Six_degrees_of_separation): take two people in the world, and they are at most six social connections away from each other. You may be more familiar with the [Six Degrees of Kevin Bacon](https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon) as an example of this.

![kevin bacon](https://res.cloudinary.com/teepublic/image/private/s--NvWG-b6R--/t_Preview/b_rgb:ffffff,c_limit,f_jpg,h_630,q_90,w_630/v1558890523/production/designs/4930303_0.jpg)

_Source: [MisterDressup](https://www.teepublic.com/t-shirt/4930303-kevin-bacon-bacon-lover-funny-t-shirt)_

You may not know Kevin Bacon (or _do_ you?), but we can still apply this to our graph of friends to find the connections that create a chain between two people. This is an application of **path finding**

### Finding the Path
Think of a graph as a neighborhood, each house as a node, and immediate neighbors as nodes that share an edge. If you wanted to figure out how to get from one house to another, you'd walk to that house, passing other houses along the way. _You'd be walking a path, walking from one node to another via edges!_

**Challenge:** Write a method `find_path(self, from_vert, to_vert)` in the `Graph()` class that takes in two nodes (`from_vert` and `to_vert`) as input, and outputs the list of nodes that must be traversed to get from `from_vert` to `to_vert`. The output list of nodes _must be in order of nodes visited starting from `from_vert`  and ending at `to_vert`._  Note: This path doesn't have to be the shortest path, just a path.

**Hint:** BFS or it's familiar friend **Depth First Search (DFS)** could be useful here. Again if you need a refresher, here's that [Tree Traversals lesson](https://github.com/Make-School-Courses/CS-1.3-Core-Data-Structures/blob/master/Lessons/TreeTraversals.md) from CS 1.3

```python
def find_path(self, from_vert, to_vert):

# Make sure that both nodes from_vert and to_vert are actually in the graph
# Run BFS or DFS starting from from_vert
# Figure out a way to keep track of each path you take
# Once you find to_vert, end the search.
# Since you've been tracking the paths, find the path that goes from from_vert to to_vert
# Return the path, in the order of nodes visited starting with from_vert and ending with to_vert
```

### Optimizing our Path
This works, but what if there are multiple paths between two nodes? What if one of those paths is significantly longer than the other? Do you know Veronica from high school from your cousin Ricky, who went to college with Sarah, who dated Jane, who is friends with Billy, who was on the swim team with Veronica? Or do you know Veronica from your friend Tom who also is friends with Veronica? In the next chapter, we'll learn how to differentiate paths in order to optimize our route.

## Chapter 5: Closest of Friends
If you were trying to show how two people are socially connected, you would want to do so in the least number of connections possible. Can you imagine if LinkedIn couldn't determine if someone was a 2nd or 20th degree connection?

### Shortest Path

In order to solve this problem, we want to find the **shortest path** between two nodes in a graph.

**Challenge 1:** Write a method `find_shortest_path(self, A, B)` that takes two nodes (A and B) as input, and outputs the list of nodes that make up the _shortest path_ from A to B. The output list of nodes _must be in order of nodes visited starting from A and ending at B._

```python
def find_shortest_path(self, A, B):
# Make sure that both nodes A and B are actually in the graph
# Run BFS starting from A
# Figure out a way to keep track of each path you take
# Once you find B, end the search.
# Since you've been tracking the paths, find the shortest path that goes from A to B
# Return the shortest path, in the order of nodes visited starting with A and ending with B
```


 It's great to find the _shortest_ path, but sometimes we want to know more about a graph. There's a lot of properties around distance we can measure, and we'll dive into another one of them in the next chapter!



### Clique through
As with any large group of people, smaller groups start to form within the larger ones. We can find these cliques through graph theory.  On to the next chapter to discover how..

## Chapter 6: Find your friend group
Find “cliques” of friends (small groups of tightly-connected users), etc…

The [clique problem](https://en.wikipedia.org/wiki/Clique_problem) is a popular computational problem in computer science.
### Clique Discovery

Among other applications, the clique problem can arise in a social network. With our social network, a clique will represent a subset of people (nodes) who all know each other (share edges), and we can use various algorithms to find these cliques.

**Challenge:** Write a method `clique(self)` that finds a clique in a graph that cannot have any other vertices added to it (note this is called a *maximal* clique).


```python
def clique(self):
#
Start with an arbitrary vertex u and add it to the clique

For v in remaining vertices not in the clique
If v is adjacent to every other vertex already in the clique.
	Add v to the clique
	Discard v otherwise

```

# Stretch Challenges
Now that you've gotten a taste of how you can use graphs to find out more about your friends, here's a couple more applications to explore.  These are stretch challenges, so feel free to skip too.

## STRETCH : Chapter 7: Long-Distance Friendships

We know you're six degrees away from Kevin Bacon, but who are you the _furthest_ away from? Not your pen pal in Bhutan (that would still be a neighbor!), but someone you _don't_ know, and who you in fact know the least!

### Graph Diameter
One concept around graph distance that helps us solve this problem is finding the **diameter** of a graph. The diameter of a graph is the calculated by _finding the shortest path between every possible pair of nodes, and then selecting the longest of those paths._  

**Challenge:** Write a method  `diameter(self)` that outputs the diameter of the graph

```python
def diameter(self):
# For every node, find the shortest path from it to every other node in the graph and track the paths and their length
# From your list of path/length pairs, pick the one with the largest length and return the length.
```

*Note:* The algorithm above will work for small graphs, but takes a lot of time. There are lots of quicker algorithms you can use.

**Stretch Challenges:** Find other properties of a graph! See if you can calculate the center or radius of a weighted graph. Keep these notes in mind:

- A radius of a graph _must_ also have a diameter.
- Radius can be calculated by finding the minimum distance among all the maximum distances between a node to all other nodes
- The center of a graph is the set of all nodes where the greatest distance to other nodes is the shortest.
    - Read up on [eccentricity](https://en.wikipedia.org/wiki/Distance_(graph_theory) to help with this!

## STRETCH : Chapter 8: How to Win Friends and Influence Users
Google's [PageRank](https://en.wikipedia.org/wiki/PageRank) algorithm is what they use to show you the most relevant search results for your query. Through this and other factors, Google influences what you see on that first page every single time you search something (and how often are you going past the first page?)


### PageRank Your Friends

PageRank is currently implemented using concepts from graph theory, assigning scores of "relevance" to links. We're going to model that by doing the same thing to our social networks (what, you've never ranked your friends before?). _This is how social media influence is calculated!_ Let's find out which of our friends have the most influence in the network.

The algorithm for PageRank uses an iterative approach, where each iteration improves our _approximation_ of the true PageRank value. For determining the importance of web pages, the rankings become stable after around 30-40 iterations. But for our much smaller graphs, the rankings will likely become stable after just a few iterations.

1. Each vertex is assigned an initial PageRank value of 1/n for n vertices. So if our social network has 10 users, each user is assigned 1/10.
1. For each iteration:
    1. Assign each vertex a new PageRank value of 0.
    1. For each vertex v, take v's previous PageRank value and divide it amongst v's outgoing links. So if v had a PageRank value of 1/10 and has links to a, b, and c, then a, b, and c will each receive 1/30 to their new PageRank values.

Here's a great [video explanation](https://www.youtube.com/watch?v=P8Kt6Abq_rM) if you'd like to learn more.

**Note:** For the below challenge, you'll be using a _directed_ weighted graph.

**Stretch Challenge:** Write a method  `influencer(self)` that uses the PageRank algorithm to rank you and your friends according to influence.

```python
def influencer(self):
# Create a dictionary of vertex -> PageRank value and set initial values to 1/n
# For each iteration:
    # Create a new dictionary of vertex -> PageRank value, set all to 0
    # For each vertex v:
    	# Divide up v's previous PageRank value amongst v's neighbors.
	# For m neighbors, each neighbor receives value/m
    # Replace previous PageRanks with new PageRanks
# Sort all vertices according to their PageRank value, return sorted list
```


**Congrats on completing your journey through your Social Network!**

### Feedback and Review - 2 minutes

**We promise this won't take longer than 2 minutes!**

Please take a moment to rate your understanding of the learning outcomes from this tutorial, and how we can improve it via our [tutorial feedback form](https://forms.gle/Wva3u51vBiDQHBAw9)

This allows us to get feedback on how well the students are grasping the learning outcomes, and tells us where we can improve the tutorial experience.
