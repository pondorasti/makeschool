import sys
from src.graph_file_reader import read_from_file

def main():
    # Create the graph
    filename = sys.argv[1]
    g = read_from_file(filename)

    # Print number of vertices, edges
    print(f"# vertices: {len(g.get_vertices())}")
    print(f"# edges: {len(g.get_edges())} \n")

    # Print vertices
    print(f"The vertices are: {g.get_vertices()}")

    # Print edges
    print("The edges are: ")
    for edge in g.get_edges():
        print(edge)

    print(g.dijkstra(sys.argv[2], sys.argv[3]))


if __name__ == "__main__":
    main()
