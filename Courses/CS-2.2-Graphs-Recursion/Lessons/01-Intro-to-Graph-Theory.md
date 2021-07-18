# Introduction to Graph Theory

### [Slides](https://docs.google.com/presentation/d/1eOGVRA2ziw9swgB1t0VXn2_gnIWl1sd-H5xglgSa3-E/edit?usp=sharing)


## Learning Objectives (5 min)

1. Practice modeling real world problems with graph theory.
1. Implement algorithms from graph theory with diagrams and pseudocode.
1. Define the Graph ADT and implement in code.

## Check-In (5 minutes)

With a group of 3, answer the following question: _What is one thing that has been bringing you joy over the past 2 weeks?_

## Activity 1: Seven Bridges of Königsberg

With a group of 3, use [this Jamboard](https://jamboard.google.com/d/1xvnmP5g_vBnLk-T65UpL42iL3iIGcIGP5CcVKUvGCr4/edit?usp=sharing) to complete the following:

1. See if you can find a solution to the Seven Bridges of Königsberg, crossing each bridge exactly once.
2. If there are no solutions, why not?

## Definitions

A **vertex** is the fundamental unit of a graph. It can represent a place, a person, etc. The plural of _vertex_ is _vertices_.

An **edge** is a connection between two vertices. It can be directed (goes only one way) or undirected (goes both ways).

A **connected graph** is a graph in which there is a **path** (series of edges) between any pair of vertices.

A **disconnected graph** is a graph in which at least one pair of vertices has no path between them (i.e. they are unreachable).

An **Euler Path** of an undirected graph is a path such that every edge of the graph is used exactly once.

## BREAK [10 min]

## Course Overview [20 min]
- Go over syllabus, learning outcomes, course policies, key deliverables.
- Our course learning approach: Model, Implement Solution, Synthesize & Algorithmic Thinking


## Overview 2: Graph Implementations [10 min]

Graphs can be represented in code in several ways:

- **Edge List**: Store a list of all edges in the graph. This method is easy to store, but much harder to retrieve data & reason about the graph.

- **Adjacency Matrix**: Store a **matrix** (or 2D array) of all vertices mapped to all vertices. Two vertices `i`, `j` have an edge between them if `matrix[i][j] == 1`. This method is more space-intensive to store, but quick to look up an edge.

- **Adjacency List** (preferred): Store a list of vertices, and for each vertex, store a list of its neighbors. This method makes it easier to store _and_ retrieve data.


## Homework
- [Homework 1](Assignments/01-Graph-ADT): Implement the Graph ADT.

## Resources:
- [A Gentle Introduction To Graph Theory](https://medium.com/basecs/a-gentle-introduction-to-graph-theory-77969829ead8)
- [How to think in graphs: An illustrative introduction to Graph Theory and its applications](https://medium.com/free-code-camp/i-dont-understand-graph-theory-1c96572a1401)
- [Graph Theory](https://en.wikipedia.org/wiki/Graph_theory#Route_problems)
- [From Theory To Practice: Representing Graphs](https://medium.com/basecs/from-theory-to-practice-representing-graphs-cfd782c5be38)
- [How to think in graphs](https://medium.com/free-code-camp/i-dont-understand-graph-theory-1c96572a1401)
- [Visualgo Graphs](https://visualgo.net/en/graphds)
