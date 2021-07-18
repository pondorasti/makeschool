from collections import deque


class Graph:
    """ Graph Class
    Represents a directed or undirected graph.
    """
    def __init__(self, is_directed=True):
        """
        Initialize a graph object with an empty vertex dictionary.

        Parameters:
        is_directed (boolean): Whether the graph is directed (edges go in only one direction).
        """
        self.vertex_dict = {} # id -> list of neighbor ids
        self.is_directed = is_directed

    def add_vertex(self, vertex_id):
        """
        Add a new vertex object to the graph with the given key.
        
        Parameters:
        vertex_id (string): The unique identifier for the new vertex.
        """
        pass

    def add_edge(self, start_id, end_id):
        """
        Add an edge from vertex with id `start_id` to vertex with id `end_id`.

        Parameters:
        start_id (string): The unique identifier of the first vertex.
        end_id (string): The unique identifier of the second vertex.
        """
        pass

    def contains_vertex(self, vertex_id):
        """Return True if the vertex is contained in the graph."""
        pass

    def contains_edge(self, start_id, end_id):
        """
        Return True if the edge is contained in the graph from vertex `start_id`
        to vertex `end_id`.

        Parameters:
        start_id (string): The unique identifier of the first vertex.
        end_id (string): The unique identifier of the second vertex."""
        pass

    def get_vertices(self):
        """
        Return all vertices in the graph.
        
        Returns:
        list<string>: The vertex ids contained in the graph.
        """
        return list(self.vertex_dict.values())

    def get_neighbors(self, start_id):
        """
        Return a list of neighbors to the vertex `start_id`.

        Returns:
        list<string>: The neigbors of the start vertex.
        """
        return self.vertex_dict[start_id]

    def __str__(self):
        """Return a string representation of the graph."""
        graph_repr = [f'{vertex} -> {self.vertex_dict[vertex]}' 
            for vertex in self.vertex_dict.keys()]
        return f'Graph with vertices: \n' +'\n'.join(graph_repr)

    def __repr__(self):
        """Return a string representation of the graph."""
        return self.__str__()

    def bfs_traversal(self, start_id):
        """
        Traverse the graph using breadth-first search.
        """
        if start_id not in self.vertex_dict:
            raise KeyError("The start vertex is not in the graph!")

        # Keep a set to denote which vertices we've seen before
        seen = set()
        seen.add(start_id)

        # Keep a queue so that we visit vertices in the appropriate order
        queue = deque()
        queue.append(start_id)

        while queue:
            current_vertex_id = queue.popleft()

            # Process current node
            print('Processing vertex {}'.format(current_vertex_id))

            # Add its neighbors to the queue
            for neighbor_id in self.get_neighbors(current_vertex_id):
                if neighbor_id not in seen:
                    seen.add(neighbor_id)
                    queue.append(neighbor_id)

        return # everything has been processed

    def find_shortest_path(self, start_id, target_id):
        """
        Find and return the shortest path from start_id to target_id.

        Parameters:
        start_id (string): The id of the start vertex.
        target_id (string): The id of the target (end) vertex.

        Returns:
        list<string>: A list of all vertex ids in the shortest path, from start to end.
        """
        pass

    def find_vertices_n_away(self, start_id, target_distance):
        """
        Find and return all vertices n distance away.
        
        Arguments:
        start_id (string): The id of the start vertex.
        target_distance (integer): The distance from the start vertex we are looking for

        Returns:
        list<string>: All vertex ids that are `target_distance` away from the start vertex
        """
        pass
