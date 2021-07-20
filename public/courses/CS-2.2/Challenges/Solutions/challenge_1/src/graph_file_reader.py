from src.graph import Graph

def read_from_file(filename):
    """Read from a file located at `filename` and return the corresponding graph object."""
    file = open(filename, "r")
    lines = file.readlines()
    file.close()

    # Check if it is a graph or digraph
    graph_or_digraph_str =  lines[0].strip() if len(lines) > 0 else None
    if graph_or_digraph_str != "G" and graph_or_digraph_str != "D":
        raise Exception("File must start with G or D.")
    is_directed = graph_or_digraph_str == "D"

    g = Graph(is_directed)

    # Add all vertices
    for vertex_key in lines[1].strip("() \n").split(","):
        g.add_vertex(vertex_key)

    # Add all edges
    for line in lines[2:]:
        # Split components of edge
        new_edge = line.strip("() \n").split(",")
        if len(new_edge) < 2 or len(new_edge) > 3:
            raise Exception("Lines adding edges must include 2 or 3 values")
        
        # Get vertices
        vertex1, vertex2 = new_edge[:2]

        # Get weight if it exists
        weight = int(new_edge[2]) if len(new_edge) == 3 else None

        # Add edge(s)
        g.add_edge(vertex1, vertex2, weight)

    return g