#!python

from binaryheap import BinaryMinHeap
import random
import unittest


class TestBinaryMinHeap(unittest.TestCase):
    def test_size_of_empty_heap(self):
        heap = BinaryMinHeap()
        assert heap.size() == 0

    def test_get_min_on_empty_heap(self):
        heap = BinaryMinHeap()
        with self.assertRaises(ValueError):
            heap.get_min()

    def test_delete_min_on_empty_heap(self):
        heap = BinaryMinHeap()
        with self.assertRaises(ValueError):
            heap.delete_min()

    def test_insert_and_get_one_item(self):
        heap = BinaryMinHeap()
        heap.insert(5)
        assert heap.size() == 1
        assert heap.get_min() == 5
        assert heap.items == [5]

    def test_insert_and_get_many_items(self):
        heap = BinaryMinHeap()
        items = [9, 25, 86, 3, 29, 5, 55]
        for index, item in enumerate(items):
            heap.insert(item)
            assert heap.size() == index + 1
            min_item = min(items[: index + 1])
            assert heap.get_min() == min_item
        assert heap.size() == len(items)
        assert heap.items == [3, 9, 5, 25, 29, 86, 55]

    def test_insert_and_get_many_random_items(self):
        heap = BinaryMinHeap()
        items = random.sample(range(1000), 50)
        for index, item in enumerate(items):
            heap.insert(item)
            assert heap.size() == index + 1
            min_item = min(items[: index + 1])
            assert heap.get_min() == min_item
        assert heap.size() == len(items)

    def test_insert_and_delete_one_item(self):
        heap = BinaryMinHeap()
        heap.insert(5)
        assert heap.size() == 1
        assert heap.delete_min() == 5
        assert heap.size() == 0

    def test_insert_and_delete_many_items(self):
        heap = BinaryMinHeap()
        items = [9, 25, 86, 3, 29, 5, 55]
        for item in items:
            heap.insert(item)
        assert heap.size() == len(items)
        for item in sorted(items):
            assert heap.delete_min() == item
        assert heap.size() == 0

    def test_insert_and_delete_many_random_items(self):
        heap = BinaryMinHeap()
        items = random.sample(range(1000), 50)
        for item in items:
            heap.insert(item)
        assert heap.size() == len(items)
        for item in sorted(items):
            assert heap.delete_min() == item
        assert heap.size() == 0

    def test_parent_index(self):
        heap = BinaryMinHeap()
        with self.assertRaises(IndexError):
            heap._parent_index(0)
        assert heap._parent_index(1) == 0
        assert heap._parent_index(2) == 0
        assert heap._parent_index(3) == 1
        assert heap._parent_index(4) == 1
        assert heap._parent_index(5) == 2
        assert heap._parent_index(6) == 2
        assert heap._parent_index(7) == 3
        assert heap._parent_index(8) == 3
        assert heap._parent_index(9) == 4
        assert heap._parent_index(10) == 4
        assert heap._parent_index(11) == 5
        assert heap._parent_index(12) == 5
        assert heap._parent_index(13) == 6
        assert heap._parent_index(14) == 6

    def test_child_index(self):
        heap = BinaryMinHeap()
        assert heap._left_child_index(0) == 1
        assert heap._right_child_index(0) == 2
        assert heap._left_child_index(1) == 3
        assert heap._right_child_index(1) == 4
        assert heap._left_child_index(2) == 5
        assert heap._right_child_index(2) == 6
        assert heap._left_child_index(3) == 7
        assert heap._right_child_index(3) == 8
        assert heap._left_child_index(4) == 9
        assert heap._right_child_index(4) == 10
        assert heap._left_child_index(5) == 11
        assert heap._right_child_index(5) == 12
        assert heap._left_child_index(6) == 13
        assert heap._right_child_index(6) == 14


if __name__ == '__main__':
    unittest.main()
