# Challenges

1. [General Instructions](#general-instructions)
1. [Challenge 1](#challenge-1)
1. [Challenge 2](#challenge-2)
1. [Challenge 3](#challenge-3)
1. [Challenge 4](#challenge-4)
1. [Challenge 5](#challenge-5)


## General instructions
- Your code should go in the Challenge Folder of your personal repo that you created for this class.
- Create a separate folder for each challenge, and copy any code you are re-using from the previous challenge before modifying.  The code in each folder should only solve that challenge.
- Your code should meet the following minimum requirements
    - meets PEP8 style guidelines
    - is well tested
    - is well documented
    - cites any sources used for inspiration  and clearly indicates what code is used / modified from these sources

- Unless otherwise stated, use simple concrete data types in your implementations (lists, dictionaries). Stretch challenges will give you an opportunity to refactor with collections and more complex data types.

- Each challenge will read in a graphs from a text file with
    - the first line being a G or D (for graph or digraph)
    - the second line being a list of vertices,
    - remaining lines are one vertex pair per line representing the edges `(x,y)` or a triplet if there are weights ``(x, y, w)``

```
G
1,2,3,4
(1,2)
(1,4)
(2,3)
(2,4)
```

- Each challenge should be run from the command line and provide output in the format requested.

- Your code should be in at least two files.  File 1 must be named challege_X.py where X is the challenge number.  This file will be run from the command line with arguments of the graph text file and (possibly) additional arguments needed for the challenge.  `python3 challenge_1.py graph_data.txt`

- Other files should follow best practices for code architecture (classes in a file with the class name, etc) but the structure is up to you.

- You will be graded on if your code works (produces the correct output), and code quality based on the rubrics linked in each challenge.

## Challenge 1
- Implement the Graph ADT with an adjacency list
- Implement code to read in a graph from a text file to create an instance of the Graph ADT and use its methods.

**Input:** A graph file (can contain a directed or undirected graph with or without weights)
`python3 challenge_1.py graph_data.txt`
```
G
1,2,3,4
(1,2,10)
(1,4,5)
(2,3,5)
(2,4,7)
```

**Output:**
* The # vertices in the graph.
* The # edges in the graph.
* A list of the edges with their weights (if weighted)

```
# Vertices: 4
# Edges: 4
Edge List:
(1,2,10)
(1,4,5)
(2,3,5)
(2,4,7)

```



### Stretch Challenge 1
- Re-implement the Graph ADT using one of the [python collections](https://docs.python.org/3.6/library/collections.html#module-collections).  

### Challenge 1 Rubrics
[Challenge Rubric Online - Beta Testing](https://www.makeschool.com/rubrics/UnVicmljLTQ=)
or [Challenge Rubric Document](https://docs.google.com/document/d/1mRnSLMeuHLODGGxVI1-0AsTS7lqjNiemZCO9fo1gUzg/edit?usp=sharing)

## Challenge 2

**Create a Challenge_2 folder in your challenge repository.  Copy any code you want to re-use from Challenge 1 to that folder before modifying**

Update your Graph ADT code to use Breadth-first search to compute the shortest path between two provided vertices in your graph.  

**Input:** A graph file (containing an undirected, unweighted graph), a from_vertex and a to_vertex.

`python3 challenge_2.py graph_data.txt 1 5`

```
G
1,2,3,4,5
(1,2)
(1,4)
(2,3)
(2,4)
(2,5)
(3,5)
```

**Output:**
The vertices in a shortest path from `from_vertex` to `to_vertex` and the number of edges in that path.
```
Vertices in shortest path: 1,2,5
Number of edges in shortest path: 2

```
### [Challenge 2 Rubric](https://www.makeschool.com/rubrics/UnVicmljLTk=)

## Challenge 3

Update your Graph ADT code to do the following
1. Implement Recursive Depth-first search to determine if there is a path between two vertices in a **directed** graph.  

**Input:** A file containing a directed graph, a from_vertex and a to_vertex.

`python3 challenge_3.py graph_data.txt 1 5`

```
D
1,2,3,4,5
(1,2)
(1,4)
(2,3)
(2,4)
(3,5)
(5,2)
```

**Output:**
If there is a path between the vertices (T/F) and the vertices in that path.
```
There exists a path between vertex 1 and 5: TRUE
Vertices in the path: 1,2,3,5


```

### Stretch Challenges 3 : Dijkstra's and Priority Queue
**Stretch Challenge 3.1** Implement Dijkstra's Algorithm to find the minimum weight path between two vertices in a weighted undirected graph.

**Input:** A file containing a weighted undirected graph, a from_vertex and a to_vertex.

`python3 challenge_3.py graph_data.txt 1 5`

```
G
1,2,3,4,5
(1,2,4)
(1,4,5)
(2,3,6)
(2,4,9)
(2,5,6)
(3,5,10)
```

**Output:**
The vertices in a minimum weight path between the vertices and the weight of that path.
```

The weight of the minimum weight path between vertex 1 and 5 is: 10
Vertices in the path: 1,2,5
```

**Stretch Challenge 3.2** (From CS 2.1).  Implement BinaryMinHeap using a dynamic array and then implement Priory Queue using BinaryMinHeap.  See [binary heap starter code](https://github.com/Make-School-Courses/CS-2.1-Advanced-Trees-and-Sorting-Algorithms/blob/master/Code/binaryheap.py) and [priority queue starter code](https://github.com/Make-School-Courses/CS-2.1-Advanced-Trees-and-Sorting-Algorithms/blob/master/Code/priorityqueue.py) for outline.


### [Challenge 3 Rubric](https://docs.google.com/document/d/1VHCcs3rFtrIaJRT5GWL3P-m3oagptYXuA2T9O67eJQU/preview)

## Challenge 4
For this challenge, you can choose to work in pairs (recommended) or solo.  If you work in pairs, both partners should submit an answer and clearly note who you worked with in your solution. 
- Your solutions will be in your Challenge GitHub repo and have both a README markdown file and code file(s). 

### Part 1: Solve the Knapsack Problem using Dynamic Programming. 
1. In your README - Clearly define the problem. Give full credit to any references you use.
1. In your README - Define in words, the 5 steps of DP as applied to this problem.
1. Write a an **iterative or memoized recursive solution** to this problem with hardcoded sample input.  You do not have to read sample data from a file. Write your code in `knapsack.py` and other files as needed.
```python
def knapsack(C, items, n):
  ''' A  method to determine the maximum value of the items included in the knapsack 
without exceeding the capacity  C

    Parameters: 
    C= 50
    items = (("boot", 10, 60),
         ("tent", 20, 100),
         ("water", 30, 120),
         ("first aid", 15, 70))
    Returns: max value
'''
```
4. Print the sample input and optimal solution

```
For this input:
    items = (("boot", 10, 60),
         ("tent", 20, 100),
         ("water", 30, 120),
         ("first aid", 15, 70))
    Capacity of knapsack: 50

The value of the optimal solution to the knapsack problem is V=230
```

5. Print the values included in the optimal solution (if computed) similar to how it is shown below with actual data from your problem. (your structure for storing input may be different).

```
The items included in the knapsack for this optimal solution are
(("boot", 10, 60),("tent", 20, 100),("first aid", 15, 70)) 
```


### Part 2: Solve any other DP problem not discussed in class.
Choose any other Dynamic Programming problem from this list []() or elsewhere. 
1. In your README - Clearly define the problem. Give full credit to any references you use.
1. In your README - Define in words, the 5 steps of DP as applied to this problem.
1. Write an **iterative or memoized recursive solution** to this problem with hardcoded small sample input.  You do not have to read sample data from a file. Write your code in `dynamic_program.py` and other files as needed.
1. Print the sample input and optimal solution.

```
For this input:
    XXXX

The optimal solution is:
    YYYY
```

5. Print the values included in the optimal solution (if computed) similar to how it is shown below with actual data from your problem. (your structure for storing input may be different).

```
The [values] included for this optimal solution are: 
    ZZZZ
```


### [Challenge 4 Rubric](https://docs.google.com/document/d/1mRnSLMeuHLODGGxVI1-0AsTS7lqjNiemZCO9fo1gUzg/edit?usp=sharing) (updated)



## Challenge 5
Using your Graph ADT code, or in a completely separate program (without a graph class). Determine if a given undirected graph is Eulerian (has an Eulerian Cycle). Your code should be well documented, tested and organized. 

**Input:** A file containing a undirected graph.

`python3 challenge_5.py graph_data.txt`

```
G
1,2,3,4,5
(1,2)
(2,3)
(3,4)
(4,5)
(1,5)
```

**Output** TRUE or FALSE

``` 
This graph is Eulerian: TRUE

```
[Challenge 5 Rubric](https://docs.google.com/document/d/1R3Zf4ogpu9g3dWJNxKAnnvV3c_EZ2q66lDUOJpptkjs/edit?usp=sharing)
