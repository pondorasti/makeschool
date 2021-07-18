import unittest
from graphs.graph import Graph
from graphs.weighted_graph import WeightedGraph


class TestGraph(unittest.TestCase):

    def make_large_graph(self):
        graph = WeightedGraph(is_directed=False)
        vertex_a = graph.add_vertex('A')
        vertex_b = graph.add_vertex('B')
        vertex_c = graph.add_vertex('C')
        vertex_c = graph.add_vertex('D')
        vertex_c = graph.add_vertex('E')
        vertex_c = graph.add_vertex('F')
        vertex_c = graph.add_vertex('G')
        vertex_c = graph.add_vertex('H')
        vertex_c = graph.add_vertex('J')

        graph.add_edge('A','B', 4)
        graph.add_edge('A','C', 8)
        graph.add_edge('B','C', 11)
        graph.add_edge('B','D', 8)
        graph.add_edge('C','F', 1)
        graph.add_edge('C','E', 4)
        graph.add_edge('D','E', 2)
        graph.add_edge('D','G', 7)
        graph.add_edge('D','H', 4)
        graph.add_edge('E','F', 6)
        graph.add_edge('F','H', 2)
        graph.add_edge('G','H', 14)
        graph.add_edge('G','J', 9)
        graph.add_edge('H','J', 10)

        return graph

    def test_mst_kruskal(self):
        """Create a weighted graph."""
        graph = self.make_large_graph()

        expected_mst = [
            ('A', 'B', 4),
            ('A', 'C', 8),
            ('C', 'E', 4),
            ('C', 'F', 1),
            ('D', 'E', 2),
            ('D', 'G', 7),
            ('F', 'H', 2),
            ('G', 'J', 9)
        ]

        self.assertEqual(sorted(graph.minimum_spanning_tree_kruskal()), expected_mst)

    def test_mst_prim(self):
        """Create a weighted graph."""
        graph = self.make_large_graph()

        expected_mst_weight = 37

        self.assertEqual(
            graph.minimum_spanning_tree_prim(), expected_mst_weight)


    def test_shortest_path(self):
        graph = self.make_large_graph()

        expected_shortest_path = 21

        self.assertEqual(
            graph.find_shortest_path('A', 'J'), expected_shortest_path)

if __name__ == '__main__':
    unittest.main()