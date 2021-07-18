import unittest
from src.graph import Graph
from src.vertex import Vertex

class GraphTest(unittest.TestCase):
    def test_add_vertex(self):
        graph = Graph(True)
        graph.add_vertex("apple")
        graph.add_vertex("banana")

        self.assertEqual(2, graph.get_num_vertices())
        self.assertIsInstance(graph.get_vertex("apple"), Vertex)


    def test_add_edge(self):
        graph = Graph(True)
        graph.add_vertex("apple")
        graph.add_vertex("banana")
        graph.add_vertex("coconut")

        graph.add_edge("apple", "banana")
        graph.add_edge("apple", "coconut", 3)

        self.assertEqual(3, graph.get_num_vertices())
        self.assertEqual(2, graph.get_num_edges())

        graph.add_edge("pineapple", "strawberry")

        self.assertEqual(5, graph.get_num_vertices())
        self.assertEqual(3, graph.get_num_edges())
        self.assertCountEqual(
            ["apple", "banana", "coconut", "pineapple", "strawberry"],
            graph.get_vertices())
    
    def test_get_edge_as_tuple(self):
        graph = Graph(True)
        v1 = graph.add_vertex("apple")
        v2 = graph.add_vertex("banana")
        v3 = graph.add_vertex("coconut")

        graph.add_edge("apple", "banana")
        graph.add_edge("apple", "coconut", 3)

        self.assertEqual(("apple", "banana"), graph.get_edge_as_tuple(v1, v2))
        self.assertEqual(
            ("apple", "coconut", 3), graph.get_edge_as_tuple(v1, v3))

if __name__ == "__main__":
    unittest.main()