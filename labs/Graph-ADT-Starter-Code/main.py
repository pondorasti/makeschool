from graphs.graph import Graph
from util.file_reader import read_graph_from_file


# Driver code
if __name__ == '__main__':

    # Create the graph

    graph = Graph(is_directed=True)

    # Add some vertices
    graph.add_vertex('A')
    graph.add_vertex('E')
    graph.add_vertex('B')
    graph.add_vertex('C')
    graph.add_vertex('D')
    graph.add_vertex('F')
    graph.add_vertex('G')

    # Add connections
    graph.add_edge('A', 'B')
    graph.add_edge('B', 'C')
    graph.add_edge('B', 'D')
    graph.add_edge('D', 'E')
    graph.add_edge('F', 'G')

    # Or, read a graph in from a file
    # graph = read_graph_from_file('test_files/graph_small_directed.txt')

    # Output the vertices & edges
    print(graph)

    # Search the graph
    # print('Performing BFS traversal...')
    # graph.bfs_traversal('A')

    # Find shortest path
    # print('Finding shortest path from vertex A to vertex E...')
    # shortest_path = graph.find_shortest_path('A', 'E')
    # print(shortest_path)

    # Find all vertices N distance away
    # print('Finding all vertices distance 2 away...')
    # vertices_2_away = graph.find_vertices_n_away('A', 2)
    # print(vertices_2_away)
