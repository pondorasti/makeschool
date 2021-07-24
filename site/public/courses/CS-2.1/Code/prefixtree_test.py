#!python3

from prefixtree import PrefixTree, PrefixTreeNode
import unittest


class PrefixTreeTest(unittest.TestCase):

    def test_init_and_properties(self):
        tree = PrefixTree()
        # Verify tree size property
        assert isinstance(tree.size, int)
        assert tree.size == 0
        # Verify root node
        assert isinstance(tree.root, PrefixTreeNode)
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 0

    def test_init_with_string(self):
        tree = PrefixTree(['A'])
        # Verify root node
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 1
        assert tree.root.has_child('A') is True
        # Verify node 'A'
        node_A = tree.root.get_child('A')
        assert node_A.character == 'A'
        assert node_A.is_terminal() is True
        assert node_A.num_children() == 0

    def test_insert_with_string(self):
        tree = PrefixTree()
        tree.insert('AB')
        # Verify root node
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 1
        assert tree.root.has_child('A') is True
        # Verify node 'A'
        node_A = tree.root.get_child('A')
        assert node_A.character == 'A'
        assert node_A.is_terminal() is False
        assert node_A.num_children() == 1
        assert node_A.has_child('B') is True
        # Verify node 'B'
        node_B = node_A.get_child('B')
        assert node_B.character == 'B'
        assert node_B.is_terminal() is True
        assert node_B.num_children() == 0

    def test_insert_with_4_strings(self):
        tree = PrefixTree()
        # Insert new string that starts from root node
        tree.insert('ABC')
        # Verify root node
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 1
        assert tree.root.has_child('A') is True
        # Verify new node 'A'
        node_A = tree.root.get_child('A')
        assert node_A.character == 'A'
        assert node_A.is_terminal() is False
        assert node_A.num_children() == 1
        assert node_A.has_child('B') is True
        # Verify new node 'B'
        node_B = node_A.get_child('B')
        assert node_B.character == 'B'
        assert node_B.is_terminal() is False
        assert node_B.num_children() == 1
        assert node_B.has_child('C') is True
        # Verify new node 'C'
        node_C = node_B.get_child('C')
        assert node_C.character == 'C'
        assert node_C.is_terminal() is True
        assert node_C.num_children() == 0

        # Insert string with partial overlap so node 'B' has new child node 'D'
        tree.insert('ABD')
        # Verify root node again
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 1
        assert tree.root.has_child('A') is True
        # Verify node 'A' again
        assert node_A.character == 'A'
        assert node_A.is_terminal() is False
        assert node_A.num_children() == 1
        assert node_A.has_child('B') is True
        # Verify node 'B' again
        assert node_B.character == 'B'
        assert node_B.is_terminal() is False
        assert node_B.num_children() == 2  # Node 'B' now has two children
        assert node_B.has_child('C') is True  # Node 'C' is still its child
        assert node_B.has_child('D') is True  # Node 'D' is its new child
        # Verify new node 'D'
        node_D = node_B.get_child('D')
        assert node_D.character == 'D'
        assert node_D.is_terminal() is True
        assert node_D.num_children() == 0

        # Insert substring already in tree so node 'A' becomes terminal
        tree.insert('A')
        # Verify root node again
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 1
        assert tree.root.has_child('A') is True
        # Verify node 'A' again
        assert node_A.character == 'A'
        assert node_A.is_terminal() is True  # Node 'A' is now terminal
        assert node_A.num_children() == 1  # Node 'A' still has one child
        assert node_A.has_child('B') is True  # Node 'B' is still its child

        # Insert new string with no overlap that starts from root node
        tree.insert('XYZ')
        # Verify root node again
        assert tree.root.character == PrefixTree.START_CHARACTER
        assert tree.root.is_terminal() is False
        assert tree.root.num_children() == 2  # Root node now has two children
        assert tree.root.has_child('A') is True  # Node 'A' is still its child
        assert tree.root.has_child('X') is True  # Node 'X' is its new child
        # Verify new node 'X'
        node_X = tree.root.get_child('X')
        assert node_X.character == 'X'
        assert node_X.is_terminal() is False
        assert node_X.num_children() == 1
        assert node_X.has_child('Y') is True
        # Verify new node 'Y'
        node_Y = node_X.get_child('Y')
        assert node_Y.character == 'Y'
        assert node_Y.is_terminal() is False
        assert node_Y.num_children() == 1
        assert node_Y.has_child('Z') is True
        # Verify new node 'Z'
        node_Z = node_Y.get_child('Z')
        assert node_Z.character == 'Z'
        assert node_Z.is_terminal() is True
        assert node_Z.num_children() == 0

    def test_size_and_is_empty(self):
        tree = PrefixTree()
        # Verify size after initializing tree
        assert tree.size == 0
        assert tree.is_empty() is True
        # Verify size after first insert
        tree.insert('A')
        assert tree.size == 1
        assert tree.is_empty() is False
        # Verify size after second insert
        tree.insert('ABC')
        assert tree.size == 2
        assert tree.is_empty() is False
        # Verify size after third insert
        tree.insert('ABD')
        assert tree.size == 3
        assert tree.is_empty() is False
        # Verify size after fourth insert
        tree.insert('XYZ')
        assert tree.size == 4
        assert tree.is_empty() is False

    def test_size_with_repeated_insert(self):
        tree = PrefixTree()
        # Verify size after initializing tree
        assert tree.size == 0
        assert tree.is_empty() is True
        # Verify size after first insert
        tree.insert('A')
        assert tree.size == 1
        assert tree.is_empty() is False
        # Verify size after repeating first insert
        tree.insert('A')
        assert tree.size == 1
        # Verify size after second insert
        tree.insert('ABC')
        assert tree.size == 2
        # Verify size after repeating second insert
        tree.insert('ABC')
        assert tree.size == 2
        # Verify size after third insert
        tree.insert('ABD')
        assert tree.size == 3
        # Verify size after repeating third insert
        tree.insert('ABD')
        assert tree.size == 3
        # Verify size after fourth insert
        tree.insert('XYZ')
        assert tree.size == 4
        # Verify size after repeating fourth insert
        tree.insert('XYZ')
        assert tree.size == 4

    def test_contains(self):
        strings = ['ABC', 'ABD', 'A', 'XYZ']
        tree = PrefixTree(strings)
        # Verify contains for all substrings
        assert tree.contains('ABC') is True
        assert tree.contains('ABD') is True
        assert tree.contains('AB') is False
        assert tree.contains('BC') is False
        assert tree.contains('BD') is False
        assert tree.contains('A') is True
        assert tree.contains('B') is False
        assert tree.contains('C') is False
        assert tree.contains('D') is False
        assert tree.contains('XYZ') is True
        assert tree.contains('XY') is False
        assert tree.contains('YZ') is False
        assert tree.contains('X') is False
        assert tree.contains('Y') is False
        assert tree.contains('Z') is False

    def test_complete(self):
        strings = ['ABC', 'ABD', 'A', 'XYZ']
        tree = PrefixTree(strings)
        # Verify completions for all substrings
        assert tree.complete('ABC') == ['ABC']
        assert tree.complete('ABD') == ['ABD']
        assert tree.complete('AB') == ['ABC', 'ABD']
        assert tree.complete('BC') == []
        assert tree.complete('BD') == []
        assert tree.complete('A') == ['A', 'ABC', 'ABD']
        assert tree.complete('B') == []
        assert tree.complete('C') == []
        assert tree.complete('D') == []
        assert tree.complete('XYZ') == ['XYZ']
        assert tree.complete('XY') == ['XYZ']
        assert tree.complete('YZ') == []
        assert tree.complete('X') == ['XYZ']
        assert tree.complete('Y') == []
        assert tree.complete('Z') == []

    def test_strings(self):
        tree = PrefixTree()
        input_strings = []  # Strings that have been inserted into the tree
        for string in ['ABC', 'ABD', 'A', 'XYZ']:  # Strings to be inserted
            # Insert new string and add to list of strings already inserted
            tree.insert(string)
            input_strings.append(string)
            # Verify tree can retrieve all strings that have been inserted
            tree_strings = tree.strings()
            assert len(tree_strings) == len(input_strings)  # Check length only
            self.assertCountEqual(tree_strings, input_strings)  # Ignore order


if __name__ == '__main__':
    unittest.main()
