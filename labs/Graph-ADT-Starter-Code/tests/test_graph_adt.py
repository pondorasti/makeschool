import unittest
from graphs.graph import Graph
from util.file_reader import read_graph_from_file


class TestGraph(unittest.TestCase):

    def test_create_directed_graph(self):
        """Create a graph."""
        graph = Graph(is_directed=True)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('B','C')

        self.assertEqual(len(graph.get_vertices()), 3)

        self.assertEqual(len(graph.get_neighbors('A')), 2)
        self.assertEqual(len(graph.get_neighbors('B')), 1)
        self.assertEqual(len(graph.get_neighbors('C')), 0)

    def test_create_undirected_graph(self):
        """Create a graph."""
        graph = Graph(is_directed=False)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('B','C')

        self.assertEqual(len(graph.get_vertices()), 3)

        self.assertEqual(len(graph.get_neighbors('A')), 2)
        self.assertEqual(len(graph.get_neighbors('B')), 2)
        self.assertEqual(len(graph.get_neighbors('C')), 2)

class TestReadGraphFromFile(unittest.TestCase):
    def test_read_directed_graph_from_file(self):
        filename = 'test_files/graph_small_directed.txt'
        graph = read_graph_from_file(filename)

        self.assertEqual(len(graph.get_vertices()), 4)

        self.assertEqual(len(graph.get_neighbors('1')), 1)
        self.assertEqual(len(graph.get_neighbors('2')), 1)
        self.assertEqual(len(graph.get_neighbors('3')), 1)
        self.assertEqual(len(graph.get_neighbors('4')), 0)

    def test_read_undirected_graph_from_file(self):
        filename = 'test_files/graph_small_undirected.txt'
        graph = read_graph_from_file(filename)

        self.assertEqual(len(graph.get_vertices()), 4)

        self.assertEqual(len(graph.get_neighbors('1')), 1)
        self.assertEqual(len(graph.get_neighbors('2')), 2)
        self.assertEqual(len(graph.get_neighbors('3')), 1)
        self.assertEqual(len(graph.get_neighbors('4')), 2)

    def test_improper_graph_type(self):
        filename = 'test_files/improper_graph_type.txt'

        with self.assertRaises(ValueError) as error:
            graph = read_graph_from_file(filename)

    def test_find_shortest_path(self):
        filename = 'test_files/graph_medium_undirected.txt'
        graph = read_graph_from_file(filename)

        path_from_A_to_F = graph.find_shortest_path('A', 'F')

        self.assertEqual(len(path_from_A_to_F), 4)

    def test_get_all_vertices_n_away(self):
        filename = 'test_files/graph_medium_undirected.txt'
        graph = read_graph_from_file(filename)

        vertices_1_away = graph.find_vertices_n_away('A', 1)
        self.assertEqual(sorted(vertices_1_away), ['B','C'])

        vertices_2_away = graph.find_vertices_n_away('A', 2)
        self.assertEqual(sorted(vertices_2_away), ['D','E'])

        vertices_3_away = graph.find_vertices_n_away('A', 3)
        self.assertEqual(vertices_3_away, ['F'])


if __name__ == '__main__':
    unittest.main()