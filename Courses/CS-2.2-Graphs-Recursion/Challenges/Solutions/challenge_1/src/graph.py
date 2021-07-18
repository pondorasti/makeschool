from src.vertex import Vertex

class Graph:
    """ Graph Class
    A class demonstrating the essential facts and functionalities of graphs.
    """
    # Static variables
    DEFAULT_EDGE_WEIGHT = 0

    def __init__(self, is_directed):
        """Initialize a graph object with an empty dictionary."""
        self.is_directed = is_directed
        self.vert_list = {}

    def add_vertex(self, key):
        """Add a new vertex object to the graph with the given key and return the vertex."""
        if key in self.vert_list:
            raise Exception(f"Vertex {key} already in graph.")
        self.vert_list[key] = Vertex(key)
        return self.vert_list[key]

    def get_vertex(self, key):
        """Return the vertex if it exists."""
        return self.vert_list[key]

    def get_vertices(self):
        """Return all the vertices in the graph."""
        return list(self.vert_list.keys())

    def get_num_vertices(self):
        """Return the number of vertices in the graph."""
        return len(self.vert_list.keys())

    def add_edge(self, key1, key2, weight=None):
        """Add an edge from vertex with key `key1` to vertex with key `key2` with a weight."""
        if weight is None:
            weight = Graph.DEFAULT_EDGE_WEIGHT

        # Add edges if they are not already in the graph
        if key1 not in self.vert_list:
            self.add_vertex(key1)
        if key2 not in self.vert_list:
            self.add_vertex(key2)

        # Add neighbor(s) to vertex objects
        self.vert_list[key1].add_neighbor(self.vert_list[key2], weight)
        if not self.is_directed:
            self.vert_list[key2].add_neighbor(self.vert_list[key1], weight)

    def get_edge_as_tuple(self, v, w):
        """
        Return a tuple representing the edge from v to w. If graph is
        undirected, v and w should be in alphabetical order to deduplicate.

        Parameters:
        v (Vertex): The 'from' vertex
        w (Vertex): The 'to' vertex
        """
        edge_tuple = None
        if self.is_directed:
            edge_tuple = (v.id, w.id, v.get_edge_weight(w))
        else:
            # Alphabetize if graph is undirected
            if v.id < w.id:
                edge_tuple = (v.id, w.id, v.get_edge_weight(w))
            else:
                edge_tuple = (w.id, v.id, w.get_edge_weight(v))
        # If edge weight is 0, do not include it in tuple
        if edge_tuple[2] == 0:
            edge_tuple = edge_tuple[:2]
        return edge_tuple

    def get_edges(self):
        """Return the list of edges with weights, as tuples."""
        edges = set()
        for v in self.vert_list.values():
            for w in v.neighbors:
                edges.add(self.get_edge_as_tuple(v, w))
        return edges

    def get_num_edges(self):
        num_total_edges = 0
        for v in self.vert_list.values():
            num_total_edges += len(v.get_neighbors())
        if self.is_directed:
            return num_total_edges
        else:
            return num_total_edges / 2

    def __iter__(self):
        """Iterate over the vertex objects in the graph, to use sytax: for v in g"""
        return iter(self.vert_list.values())

    def dijkstra(self, a, b):
        distances = {}
        min_distances = {}
        for vert in self.vert_list:
            distances[vert] = 10000
        distances[a] = 0

        while distances:
            next_vertex = min(distances.keys(), key=lambda v: distances[v])
            next_vertex_obj = self.vert_list[next_vertex]

            # put in min distances
            min_distances[next_vertex] = distances[next_vertex]

            # update its neighbors
            for neighbor in next_vertex_obj.get_neighbors():
                alt = distances[next_vertex] + next_vertex_obj.get_edge_weight(neighbor)
                if neighbor.id in distances and alt < distances[neighbor.id]:
                    distances[neighbor.id] = alt
            
            # remove from queue
            del distances[next_vertex]
        
        return min_distances[b]

