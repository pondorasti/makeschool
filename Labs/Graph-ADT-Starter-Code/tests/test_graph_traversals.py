
import unittest
from graphs.graph import Graph


class TestBipartite(unittest.TestCase):
    def test_not_bipartite(self):
        """Test that a cycle on 3 vertices is NOT bipartite."""
        graph = Graph(is_directed=False)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('B','C')

        self.assertFalse(graph.is_bipartite())
        

    def test_is_bipartite_cycle(self):
        """Test that a cycle on 4 vertices is bipartite."""
        graph = Graph(is_directed=False)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_vertex('D')
        graph.add_edge('A','B')
        graph.add_edge('B','C')
        graph.add_edge('C','D')
        graph.add_edge('A','D')

        self.assertTrue(graph.is_bipartite())
        

    def test_is_bipartite_tree(self):
        """Test that a tree on 4 vertices is bipartite."""
        graph = Graph(is_directed=False)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_vertex('D')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('A','D')

        self.assertTrue(graph.is_bipartite())


class TestConnectedComponents(unittest.TestCase):
    def test_get_connected_components(self):
        """Get connected components of a graph."""
        graph = Graph(is_directed=False)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_vertex('D')
        graph.add_vertex('E')
        graph.add_vertex('F')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('B','C')
        graph.add_edge('D', 'E')

        expected_components = [
            ['A', 'B', 'C'],
            ['D', 'E'],
            ['F']
        ]
        # sort each component for ease of comparison
        actual_components = graph.find_connected_components()
        actual_components = [sorted(comp) for comp in actual_components]

        self.assertCountEqual(expected_components, actual_components)


class TestFindPathDfs(unittest.TestCase):
    def test_find_path_dfs(self):
        graph = Graph(is_directed=True)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('B','C')
        graph.add_edge('C','A')

        path = graph.find_path_dfs_iter('A', 'C')
        self.assertEqual(path, ['A', 'B', 'C'])


class TestContainsCycle(unittest.TestCase):
    def test_contains_cycle(self):
        graph = Graph(is_directed=True)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('B','C')
        graph.add_edge('C','A')

        self.assertTrue(graph.contains_cycle())

    def test_does_not_contain_cycle_tree(self):
        """Test that a tree on 4 vertices does not contain a cycle."""
        graph = Graph(is_directed=True)
        vertex_a = graph.add_vertex('A')
        vertex_b = graph.add_vertex('B')
        vertex_c = graph.add_vertex('C')
        vertex_d = graph.add_vertex('D')
        graph.add_edge('A','B')
        graph.add_edge('A','C')
        graph.add_edge('A','D')

        self.assertFalse(graph.contains_cycle())

    def test_does_not_contain_cycle_dag(self):
        """Test that a DAG does not contain a cycle."""
        graph = Graph(is_directed=True)
        graph.add_vertex('A')
        graph.add_vertex('B')
        graph.add_vertex('C')
        graph.add_edge('A','B')
        graph.add_edge('B','C')
        graph.add_edge('A','C')

        self.assertFalse(graph.contains_cycle())


class TestTopologicalSort(unittest.TestCase):
    def test_topological_sort(self):
        graph = Graph(is_directed=True)
        vertex_b = graph.add_vertex('B')
        vertex_c = graph.add_vertex('C')
        vertex_d = graph.add_vertex('D')
        vertex_d = graph.add_vertex('E')
        vertex_a = graph.add_vertex('A')
        graph.add_edge('A','C')
        graph.add_edge('B','D')
        graph.add_edge('C','D')
        graph.add_edge('D','E')
        graph.add_edge('A','B')

        possible_sorts = [
            ['A', 'B', 'C', 'D', 'E'],
            ['A', 'C', 'B', 'D', 'E']
        ]
        topo_sort = graph.topological_sort()

        self.assertIn(topo_sort, possible_sorts)


if __name__ == '__main__':
    unittest.main()