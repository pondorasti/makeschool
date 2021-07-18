#!python

from linkedlist import LinkedList, Node
import unittest


class NodeTest(unittest.TestCase):

    def test_init(self):
        data = 'ABC'
        node = Node(data)
        # Initializer should add instance properties
        assert node.data is data
        assert node.next is None

    def test_linking_nodes(self):
        node1 = Node('A')
        node2 = Node('B')
        node3 = Node('C')
        # Link nodes together
        node1.next = node2
        node2.next = node3
        # Node links should be transitive
        assert node1.next is node2  # One link
        assert node1.next.next is node3  # Two links


class LinkedListTest(unittest.TestCase):

    def test_init(self):
        ll = LinkedList()
        # Initializer should add instance properties
        assert ll.head is None  # First node
        assert ll.tail is None  # Last node

    def test_init_with_list(self):
        ll = LinkedList(['A', 'B', 'C'])
        # Initializer should append items in order
        assert ll.head.data == 'A'  # First item
        assert ll.tail.data == 'C'  # Last item

    def test_items_after_append(self):
        ll = LinkedList()
        assert ll.items() == []
        # Append should add new item to tail of list
        ll.append('A')
        assert ll.items() == ['A']
        ll.append('B')
        assert ll.items() == ['A', 'B']
        ll.append('C')
        assert ll.items() == ['A', 'B', 'C']

    def test_items_after_prepend(self):
        ll = LinkedList()
        assert ll.items() == []
        # Prepend should add new item to head of list
        ll.prepend('C')
        assert ll.items() == ['C']
        ll.prepend('B')
        assert ll.items() == ['B', 'C']
        ll.prepend('A')
        assert ll.items() == ['A', 'B', 'C']

    def test_length_after_append(self):
        ll = LinkedList()
        assert ll.length() == 0
        # Append should increase length
        ll.append('A')
        assert ll.length() == 1
        ll.append('B')
        assert ll.length() == 2
        ll.append('C')
        assert ll.length() == 3

    def test_length_after_prepend(self):
        ll = LinkedList()
        assert ll.length() == 0
        # Prepend should increase length
        ll.prepend('C')
        assert ll.length() == 1
        ll.prepend('B')
        assert ll.length() == 2
        ll.prepend('A')
        assert ll.length() == 3

    def test_length_after_append_and_prepend(self):
        ll = LinkedList()
        assert ll.length() == 0
        # Append and prepend should increase length
        ll.append('C')
        assert ll.length() == 1
        ll.prepend('B')
        assert ll.length() == 2
        ll.append('D')
        assert ll.length() == 3
        ll.prepend('A')
        assert ll.length() == 4

    def test_length_after_delete(self):
        ll = LinkedList(['A', 'B', 'C', 'D', 'E'])
        assert ll.length() == 5
        # Delete should decrease length
        ll.delete('A')
        assert ll.length() == 4
        ll.delete('E')
        assert ll.length() == 3
        ll.delete('C')
        assert ll.length() == 2
        ll.delete('D')
        assert ll.length() == 1
        ll.delete('B')
        assert ll.length() == 0

    def test_append(self):
        ll = LinkedList()
        # Append should always update tail node
        ll.append('A')
        assert ll.head.data == 'A'  # New head
        assert ll.tail.data == 'A'  # New tail
        ll.append('B')
        assert ll.head.data == 'A'  # Unchanged
        assert ll.tail.data == 'B'  # New tail
        ll.append('C')
        assert ll.head.data == 'A'  # Unchanged
        assert ll.tail.data == 'C'  # New tail

    def test_prepend(self):
        ll = LinkedList()
        # Prepend should always update head node
        ll.prepend('C')
        assert ll.head.data == 'C'  # New head
        assert ll.tail.data == 'C'  # New head
        ll.prepend('B')
        assert ll.head.data == 'B'  # New head
        assert ll.tail.data == 'C'  # Unchanged
        ll.prepend('A')
        assert ll.head.data == 'A'  # New head
        assert ll.tail.data == 'C'  # Unchanged

    def test_find(self):
        ll = LinkedList(['A', 'B', 'C'])
        assert ll.find('B') == True
        assert ll.find('A') == True  # Match less than
        assert ll.find('C') == True  # Match greater than
        assert ll.find('X') == False   # No matching item

    def test_delete_with_3_items(self):
        ll = LinkedList(['A', 'B', 'C'])
        assert ll.head.data == 'A'  # First item
        assert ll.tail.data == 'C'  # Last item
        ll.delete('A')
        assert ll.head.data == 'B'  # New head
        assert ll.tail.data == 'C'  # Unchanged
        ll.delete('C')
        assert ll.head.data == 'B'  # Unchanged
        assert ll.tail.data == 'B'  # New tail
        ll.delete('B')
        assert ll.head is None  # No head
        assert ll.tail is None  # No tail
        # Delete should raise error if item was already deleted
        with self.assertRaises(ValueError):
            ll.delete('A')  # Item no longer in list
        with self.assertRaises(ValueError):
            ll.delete('B')  # Item no longer in list
        with self.assertRaises(ValueError):
            ll.delete('C')  # Item no longer in list

    def test_delete_with_5_items(self):
        ll = LinkedList(['A', 'B', 'C', 'D', 'E'])
        assert ll.head.data == 'A'  # First item
        assert ll.tail.data == 'E'  # Last item
        ll.delete('A')
        assert ll.head.data == 'B'  # New head
        assert ll.tail.data == 'E'  # Unchanged
        ll.delete('E')
        assert ll.head.data == 'B'  # Unchanged
        assert ll.tail.data == 'D'  # New tail
        ll.delete('C')
        assert ll.head.data == 'B'  # Unchanged
        assert ll.tail.data == 'D'  # Unchanged
        ll.delete('D')
        assert ll.head.data == 'B'  # Unchanged
        assert ll.tail.data == 'B'  # New tail
        ll.delete('B')
        assert ll.head is None  # No head
        assert ll.tail is None  # No tail

    def test_delete_with_item_not_in_list(self):
        ll = LinkedList(['A', 'B', 'C'])
        # Delete should raise error if item not found
        with self.assertRaises(ValueError):
            ll.delete('X')  # Item not found in list


if __name__ == '__main__':
    unittest.main()
