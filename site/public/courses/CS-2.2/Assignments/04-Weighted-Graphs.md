# Homework 4: Weighted Graphs

In this assignment, you'll practice implementing **weighted graph algorithms**, including **Prim's**, **Kruskal's**, and **Dijkstra's**.

| Criteria | Possible |
| :------: | :------: |
| WeightedVertex & WeightedGraph Classes | `15` |
| Kruskal's Algorithm | `15` |
| Prim's Algorithm | `15` |
| Dijkstra's Algorithm | `15` |
| **TOTAL** | **`60`** |

## Instructions

Continue to use your **Homework 1 and 2** starter code for this assignment. Alternatively, you may make a copy of your existing code and submit it instead.

## WeightedVertex & WeightedGraph Classes

In the `graphs` folder, take a look at the `weighted_graph.py` file. It contains two classes, `WeightedVertex` and `WeightedGraph`. Note that we are now storing vertices as objects, instead of strings. This is so that each vertex can keep track of the edge weights of each of their neighbors.

Implement the `WeightedVertex` class methods `add_neighbor()`, `get_neighbors()`, 
and `get_neighbors_with_weights()`, as described.

Implement the `WeightedGraph` class methods `add_vertex()` and `add_edge()`, as described.

## Kruskal's Algorithm - Find Edges of MST

In the `WeightedGraph` class, add the following method signatures for finding a **Minimum Spanning Tree** using **Kruskal's Algorithm**:

```py
class WeightedGraph:
    # ...

    def union(self, parent_map, vertex_id1, vertex_id2):
        """Combine vertex_id1 and vertex_id2 into the same group."""
        vertex1_root = self.find(parent_map, vertex_id1)
        vertex2_root = self.find(parent_map, vertex_id2)
        parent_map[vertex1_root] = vertex2_root


    def find(self, parent_map, vertex_id):
        """Get the root (or, group label) for vertex_id."""
        if(parent_map[vertex_id] == vertex_id):
            return vertex_id
        return self.find(parent_map, parent_map[vertex_id])

    def minimum_spanning_tree_kruskal(self):
        """
        Use Kruskal's Algorithm to return a list of edges, as tuples of 
        (start_id, dest_id, weight) in the graph's minimum spanning tree.
        """
        # TODO: Create a list of all edges in the graph, sort them by weight 
        # from smallest to largest

        # TODO: Create a dictionary `parent_map` to map vertex -> its "parent". 
        # Initialize it so that each vertex is its own parent.

        # TODO: Create an empty list to hold the solution (i.e. all edges in the 
        # final spanning tree)

        # TODO: While the spanning tree holds < V-1 edges, get the smallest 
        # edge. If the two vertices connected by the edge are in different sets 
        # (i.e. calling `find()` gets two different roots), then it will not 
        # create a cycle, so add it to the solution set and call `union()` on 
        # the two vertices.

        # TODO: Return the solution list.
```

Fill in the TODOs to complete `minimum_spanning_tree_kruskal`. Make sure to test your code thoroughly to ensure its correctness.

## Prim's Algorithm - Find Weight of MST

In the `WeightedGraph` class, add the following method signature for finding a **Minimum Spanning Tree** using **Prim's Algorithm**:

```py
class WeightedGraph(Graph):
    # ...

    def minimum_spanning_tree_prim(self):
        """
        Use Prim's Algorithm to return the total weight of all edges in the
        graph's spanning tree.

        Assume that the graph is connected.
        """
        # TODO: Create a dictionary `vertex_to_weight` and initialize all
        # vertices to INFINITY - hint: use `float('inf')`

        # TODO: Choose one vertex and set its weight to 0

        # TODO: While `vertex_to_weight` is not empty:
        # 1. Get the minimum-weighted remaining vertex, remove it from the
        #    dictionary, & add its weight to the total MST weight
        # 2. Update that vertex's neighbors, if edge weights are smaller than
        #    previous weights

        # TODO: Return total weight of MST
```

Fill in the TODOs to complete `minimum_spanning_tree_prim`. Make sure to test your code thoroughly to ensure its correctness.

**Stretch Challenge**: Modify the algorithm to use a [heap](https://www.geeksforgeeks.org/heap-data-structure/) to find and retrieve the minimum weight vertex.

## Dijkstra's Algorithm - Shortest Path

In the `WeightedGraph` class, add the following method signature for finding the **shortest path** between two vertices using **Dijkstra's Algorithm**:

```py
class WeightedGraph(Graph):
    # ...

    def find_shortest_path(self, start_id, target_id):
        """
        Use Dijkstra's Algorithm to return the total weight of the shortest path
        from a start vertex to a destination.
        """
        # TODO: Create a dictionary `vertex_to_distance` and initialize all
        # vertices to INFINITY - hint: use `float('inf')`

        # TODO: While `vertex_to_distance` is not empty:
        # 1. Get the minimum-distance remaining vertex, remove it from the
        #    dictionary. If it is the target vertex, return its distance.
        # 2. Update that vertex's neighbors by adding the edge weight to the
        #    vertex's distance, if it is lower than previous.

        # TODO: Return None if target vertex not found.
```

Fill in the TODOs to complete `find_shortest_path`. Make sure to test your code thoroughly to ensure its correctness.

**Stretch Challenge**: Modify the algorithm to use a [heap](https://www.geeksforgeeks.org/heap-data-structure/) to find and retrieve the minimum weight vertex.

## Submission

Submit your code repository using [Gradescope](https://gradescope.com).

## Resources

1. [Kruskal’s Minimum Spanning Tree](https://www.geeksforgeeks.org/kruskals-minimum-spanning-tree-algorithm-greedy-algo-2/)
1. [Disjoint Set (Or Union-Find)](https://www.geeksforgeeks.org/union-find/)
1. [Prim’s Minimum Spanning Tree](https://www.geeksforgeeks.org/prims-minimum-spanning-tree-mst-greedy-algo-5/)
1. [Dijkstra’s shortest path algorithm](https://www.geeksforgeeks.org/dijkstras-shortest-path-algorithm-greedy-algo-7/)

