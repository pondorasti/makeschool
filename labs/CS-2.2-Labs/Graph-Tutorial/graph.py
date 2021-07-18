#!python

class Vertex(object):
    """ Vertex Class
    A helper class for the Graph class that defines vertices and vertex
    neighbors.
    """

    def __init__(self, vertex_id):
        """Initialize a vertex and its neighbors.

        neighbors: set of vertices adjacent to self,
        stored in a dictionary with key = vertex,
        value = weight of edge between self and neighbor.
        """
        self.id = vertex_id
        self.neighbors = {}

    def add_neighbor(self, vertex, weight=1):
        """Add a neighbor along a weighted edge."""
        # TODO check if vertex is already a neighbor
        # TODO if not, add vertex to neighbors and assign weight.

    def __str__(self):
        """Output the list of neighbors of this vertex."""
        return f"{self.id} adjacent to {[x.id for x in self.neighbors]}"

    def get_neighbors(self):
        """Return the neighbors of this vertex."""
        # TODO return the neighbors

    def get_id(self):
        """Return the id of this vertex."""
        return self.id

    def get_edge_weight(self, vertex):
        """Return the weight of this edge."""
        # TODO return the weight of the edge from this
        # vertex to the given vertex.


class Graph:
    """ Graph Class
    A class demonstrating the essential facts and functionalities of graphs.
    """
    def __init__(self):
        """Initialize a graph object with an empty dictionary."""
        self.vert_list = {}
        self.num_vertices = 0

    def add_vertex(self, key):
        """Add a new vertex object to the graph with the given key and return
        the vertex."""
        # TODO increment the number of vertices
        # TODO create a new vertex
        # TODO add the new vertex to the vertex list
        # TODO return the new vertex

    def get_vertex(self, key):
        """Return the vertex if it exists"""
        # TODO return the vertex if it is in the graph

    def add_edge(self, key1, key2, weight=1):
        """Add an edge from vertex with key `key1` to vertex with key `key2`
        with a weight."""
        # TODO if either vertex is not in the graph,
        # add it - or return an error (choice is up to you).
        # TODO if both vertices in the graph, add the
        # edge by making key1 a neighbor of key2
        # and using the add_neighbor method of the Vertex class.
        # Hint: the vertex corresponding to key1 is stored in 
        # self.vert_list[key1].

    def get_vertices(self):
        """Return all the vertices in the graph"""
        return self.vert_list.keys()

    def __iter__(self):
        """Iterate over the vertex objects in the graph, to use sytax:
        for v in g"""
        return iter(self.vert_list.values())


# Driver code
if __name__ == "__main__":

    # Challenge 1: Create the graph

    g = Graph()

    # Add your friends
    g.add_vertex("Friend 1")
    g.add_vertex("Friend 2")
    g.add_vertex("Friend 3")

    # ...  add all 10 including you ...

    # Add connections (non weighted edges for now)
    g.add_edge("Friend 1", "Friend 2")
    g.add_edge("Friend 2", "Friend 3")

    # Challenge 1: Output the vertices & edges
    # Print vertices
    print(f"The vertices are: {g.get_vertices()} \n")

    # Print edges
    print("The edges are: ")
    for v in g:
        for w in v.get_neighbors():
            print(f"( {v.get_id()} , {w.get_id()} )")
