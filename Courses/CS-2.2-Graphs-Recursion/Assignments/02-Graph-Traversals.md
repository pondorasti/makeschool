# Homework 2: Graph Traversals

In this assignment, you'll practice writing **Graph Traversal** functions using **Breadth-first Search** and **Depth-first Search** techniques.

## Purpose (Why should I do this?)

Using graph traversal algorithms to solve problems is a helpful technique that has many applications, including in social networks, search engine web crawlers, peer-to-peer networks, and more. These techniques will also be helpful in solving programming interview questions.

Scoring is as follows:

| Criteria | Possible |
| :------: | :------: |
| Breadth-first Search Algorithms | 20 |
| Depth-first Search Algorithms | 20 |
| Topological Sort | 10 |
| Discussion Questions | 10 |
| **TOTAL** | **60** |

## Instructions

You will continue working with your homework repository created for [Homework 1](Assignments/01-Graph-ADT). Take a look at the starter code [here](https://github.com/Make-School-Labs/Graph-ADT-Starter-Code) if you'd like a refresher.

## Breadth-first Search Algorithms _(20 Points)_

### Bipartite Graphs _(10 Points)_

A **coloring** of a graph is an assignment of labels, often called _colors_, to each of its vertices. A graph coloring is a **proper coloring** if no two vertices in the graph which share an edge are assigned the same color.

We say that a graph is **n-colorable** if we can assign it a proper coloring using **n** colors.

For example, the following graph is **3-colorable** but **not** 2-colorable:

<img src="Assignments/Assets/3-colorable-graph.png" width="300">

Whereas the following 2 graphs are **2-colorable**:

<img src="Assignments/Assets/2-colorable-graphs.png" width="600">

An undirected graph is **bipartite** if and only if it is 2-colorable; that is, if we can separate the vertices into 2 distinct sets (e.g. **Red** and **Blue**), such that no two vertices in the same set share an edge.

**Write a method in the Graph class called** `is_bipartite()` which returns `True` if the graph is bipartite, and `False` otherwise. Your method should utilize the **Breadth-first Search** algorithm to assign colors to each of the vertices. If you find a vertex that has already been colored with the opposite color, then the method should return False.

```py
class Graph:
    # ...

    def is_bipartite(self):
        """
        Return True if the graph is bipartite, and False otherwise.
        """
        pass
```

### Connected Components _(10 Points)_

A **connected component** of an undirected graph is a set of vertices such that any two vertices are connected by a path (i.e. set of edges), and no other vertices in the graph are connected to the vertices in the set.

For example, the following graph contains three connected components:

<img src="Assignments/Assets/connected-components-graph.png" width="400">

We can represent the connected components in the above graph as a list of lists (with each connected component being a separate list), as follows:

```
[
    ['A', 'B', 'C'],
    ['D', 'E', 'F'],
    ['G', 'H']
]
```

**Write a method in the Graph class called** `get_connected_components()` that returns a list of connected components, as described above. Your method should loop over each vertex in the graph, and execute a **Breadth-first Search** from each unvisited vertex to find its connected component.

```py
class Graph:
    # ...

    def get_connected_components(self):
        """
        Return a list of all connected components, with each connected component
        represented as a list of vertex ids.
        """
        pass
```

## Depth-first Search Algorithms _(20 Points)_

### Iterative Depth-first Search _(10 Points)_

One way to implement a depth-first algorithm is to re-write the breadth-first algorithm, using a stack instead of a queue.

**Write an iterative depth-first algorithm** to find _a_ path (not necessarily the _shortest_ path) from a start vertex to an end vertex.

```py
def find_path_dfs_iter(self, start_id, target_id):
    """
    Use DFS with a stack to find a path from start_id to target_id.
    """
    pass
```

### Recursive Depth-first Search

An example of a recursive depth-first function, to visit each node in DFS order, is as follows:

```py
def dfs_traversal(self, start_id):
    """Visit each vertex, starting with start_id, in DFS order."""

    visited = set() # set of vertices we've visited so far
    
    def dfs_traversal_recursive(start_vertex):
        print(f'Visiting vertex {start_vertex.get_id()}')

        # recurse for each vertex in neighbors
        for neighbor in start_vertex.get_neighbors():
            if neighbor.get_id() not in visited:
                visited.add(neighbor.get_id())
                dfs_traversal_recursive(neighbor)
        return

    visited.add(start_id)
    start_vertex = self.get_vertex(start_id)
    dfs_traversal_recursive(start_vertex)
```

You'll notice that this method contains an **inner function**, `dfs_traversal_recursive`, that executes the recursive part of the algorithm. Another way to structure the code would be to write `dfs_traversal_recursive` as a helper method that takes in a start vertex and the `visited` set.

### Cycle Detection  _(10 Points)_

A **cycle** in a graph is a path that has the same start and end vertex - that is, it loops back around to a vertex that was already in the path. Cycle detection is important in graph theory because it tells us a lot about the graph. For example, if a graph does _not_ contain a cycle, we can perform topological sort on the graph.

**Write a method** `contains_cycle()` that returns `True` if the directed graph contains a cycle, and `False` otherwise. (All undirected graphs with at least one edge contain a cycle.)

Make sure your method still works on graphs containing multiple connected components! You can do this by iterating over all the vertices in the graph, and executing a DFS traversal starting from each unvisited vertex.

**HINT**: As you perform a DFS traversal, keep a `current_path` set containing all of the vertices in the current DFS path. If in the traversal you encounter a neighbor that is already in the `current_path`, you have found a cycle and can return True. Make sure to remove vertices from the `current_path` when going back up the traversal tree.

```py
def contains_cycle(self):
    """
    Return True if the directed graph contains a cycle, False otherwise.
    """
    pass
```

## Topological Sort _(10 Points)_

Topological Sort imposes an ordering on the vertices of a Directed Acyclic Graph (or DAG). 

Here is an example of a Directed Acyclic Graph:

<img src="Assignments/Assets/directed-acyclic-graph.png" width="400">

The vertices in this graph have two valid orderings: `['A', 'B', 'C', 'D', 'E', 'F']`, or `['A', 'C', 'B', 'D', 'E', 'F']`.

Write a method `topological_sort()` that returns a valid ordering of vertices in a DAG. If the graph contains a cycle, the method should throw a `ValueError`.

```py
def topological_sort(self):
    """
    Return a valid ordering of vertices in a directed acyclic graph.
    If the graph contains a cycle, throw a ValueError.
    """
    # TODO: Create a stack to hold the vertex ordering.
    # TODO: For each unvisited vertex, execute a DFS from that vertex.
    # TODO: On the way back up the recursion tree (that is, after visiting a 
    # vertex's neighbors), add the vertex to the stack.
    # TODO: Reverse the contents of the stack and return it as a valid ordering.
    pass
```

## Discussion Questions _(10 Points)_

Answer the following questions, using your own words, in the project's `README.md` file.

1. Compare and contrast Breadth-first Search and Depth-first Search by providing one similarity and one difference.

1. Explain why a Depth-first Search traversal does not necessarily find the shortest path between two vertices. What is one such example of a graph where a DFS search would _not_ find the shortest path?

1. Explain why we cannot perform a topological sort on a graph containing a cycle.

## Submission

Submit your code for Assignment 2 using [Gradescope](https://gradescope.com) using the GitHub integration feature. If you are unable to submit for any reason, please reach out to your instructor.

## Resources

1. [Breadth First Search or BFS for a Graph](https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/)
1. [Depth First Search or DFS for a Graph](https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/)
1. [Check whether a given graph is Bipartite or not](https://www.geeksforgeeks.org/bipartite-graph/)
1. [Detect Cycle in a Directed Graph
](https://www.geeksforgeeks.org/detect-cycle-in-a-graph/)
1. [Topological Sorting](https://www.geeksforgeeks.org/topological-sorting/)

