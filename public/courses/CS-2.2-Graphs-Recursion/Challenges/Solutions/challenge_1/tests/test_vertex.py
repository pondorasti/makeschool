import unittest
from src.vertex import Vertex

class VertexTest(unittest.TestCase):
    def test_add_neighbor(self):
        vertex1 = Vertex("apple")
        vertex2 = Vertex("banana")
        vertex3 = Vertex("coconut")

        vertex1.add_neighbor(vertex2)
        vertex1.add_neighbor(vertex3, 3)

        self.assertEqual(2, len(vertex1.neighbors))
        self.assertEqual(1, vertex1.neighbors[vertex2])
        self.assertEqual(3, vertex1.neighbors[vertex3])

if __name__ == "__main__":
    unittest.main()