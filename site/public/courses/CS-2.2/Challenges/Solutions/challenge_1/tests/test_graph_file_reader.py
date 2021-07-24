import unittest
from src.graph_file_reader import read_from_file

class FileInputTest(unittest.TestCase):
    """Test the graph output of reading from a file."""
    
    def test_input_type_incorrect(self):
        self.assertRaisesRegex(
            Exception, "File must start with", read_from_file,
            "test_inputs/type_incorrect.txt")

    def test_empty_file(self):
        self.assertRaisesRegex(
            Exception, "File must start with", read_from_file,
            "test_inputs/empty.txt")

    def test_edge_incorrect(self):
        self.assertRaisesRegex(
            Exception, "Lines adding edges", read_from_file,
            "test_inputs/edge_incorrect.txt")

    def test_basic_input(self):
        result_graph = read_from_file("test_inputs/simple.txt")
        self.assertEqual(4, result_graph.get_num_vertices())
        self.assertCountEqual(
            result_graph.get_vertices(),
            ['1', '2', '3', '4'])
        
        self.assertEqual(3, result_graph.get_num_edges())
        self.assertCountEqual(
            [('1', '2'), ('1', '3'), ('2', '4')],
            result_graph.get_edges())

    def test_extra_vertex(self):
        result_graph = read_from_file("test_inputs/extra_vertex.txt")
        self.assertEqual(5, result_graph.get_num_vertices())
        self.assertCountEqual(
            result_graph.get_vertices(),
            ['1', '2', '3', '4', '6'])
        
        self.assertEqual(4, result_graph.get_num_edges())
        self.assertCountEqual(
            [('1', '2'), ('1', '3'), 
             ('2', '4'), ('2', '6')],
            result_graph.get_edges())

    def test_unused_vertex(self):
        result_graph = read_from_file("test_inputs/unused_vertex.txt")
        self.assertEqual(5, result_graph.get_num_vertices())
        self.assertCountEqual(
            result_graph.get_vertices(),
            ['1', '2', '3', '4', '5'])
        
        self.assertEqual(4, result_graph.get_num_edges())
        self.assertCountEqual(
            [('1', '2'), ('1', '4'), 
             ('2', '3'), ('3', '1')],
            result_graph.get_edges())

    def test_weighted(self):
        result_graph = read_from_file("test_inputs/weighted.txt")
        self.assertEqual(5, result_graph.get_num_vertices())
        self.assertCountEqual(
            result_graph.get_vertices(),
            ['1', '6', '10', '15', '21'])
        
        self.assertEqual(6, result_graph.get_num_edges())
        self.assertCountEqual(
            [
                ('1', '6', 9),
                ('6','10',4),
                ('6','15',2),
                ('21','10',3),
                ('15','1',10),
                ('1','21',5)
            ],
            result_graph.get_edges())

if __name__ == "__main__":
    unittest.main()