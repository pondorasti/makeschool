# Graph Traversals with Breadth-first Search

### [Slides](https://docs.google.com/presentation/d/1bfFSSSj4j9H5nefw1gJfwvViPXt1RzdiyQ6l6ET2wAA/edit)

## Learning Objectives

By the end of today, you should be able to...

1. Implement Iterative version of Breadth-first search (BFS).
1. Find the shortest path between two vertices using Breadth-first search.
1. Identify use cases for Breadth-first Search.

## Activity: The Six Degrees of Kevin Bacon

With a group of 3, complete the following:

1. Explore the [Oracle of Bacon site](https://oracleofbacon.org/) by entering at least 3 actor/actress pairs. See if you can find an actor/actress pair who have a connection chain of 3+.
1. Discuss with your group: If you had a database of actors & the movies they are in, how would you construct this website? I.e. For any 2 actors, how would you find a shortest connection chain?

## Review: BFS with Trees

When working with trees, Breadth-first Search is also called **Level-order Traversal**.

## Activity: BFS with Graphs

With a group of 3, complete Breadth-first Search on the graph shown below. Make a copy of [this Jamboard](https://jamboard.google.com/d/1YbMou_a8e9o3mFHarZJiP8ccQQ-P837baiaTX2YhI6M/edit?usp=sharing) to get started.

## Break

## Applications of Breadth-first Search

A **connected component** of a graph is a set of vertices for which there is a path between any pair of vertices.

A **bipartite graph** is a graph whose vertices can be categorized into 2 groups (colors), such that no two vertices in the same group (color) are connected by an edge.

## Activity: Pair Programming

With your group of 3, choose who will be the _driver_, the _navigator_, and the _observer_.

- **Driver**: Share your screen & type in code according to the navigator’s instructions
- **Navigator**: Decide what to do next & how to solve the problem
- **Observer**: Give feedback and help your group if they are stuck!

Write pseudocode and then real code for the following methods:

```py
class Graph:
    def is_bipartite(self):
        """Return True if the graph is bipartite, False otherwise."""
        # ...

    def get_connected_components(self):
        """Return a list of connected components."""
        # ...
```

## Homework

- [Homework 1](Assignments/01-Graph-ADT): Implement the Graph ADT.