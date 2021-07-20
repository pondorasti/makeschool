#!python

from sorting import random_ints
from sorting_iterative import is_sorted, bubble_sort, selection_sort, insertion_sort
from sorting_recursive import merge_sort, quick_sort

sort = bubble_sort

def test_is_sorted_on_sorted_integers():
    # Positive test cases (examples) with lists of sorted integers
    assert is_sorted([]) is True  # Empty lists are vacuously sorted
    assert is_sorted([3]) is True  # Single item is trivially sorted
    assert is_sorted([3, 4]) is True  # Duplicate items are in order
    assert is_sorted([3, 5]) is True
    assert is_sorted([3, 5, 7]) is True
    

def test_is_sorted_on_unsorted_integers():
    # Negative test cases (counterexamples) with lists of unsorted integers
    assert is_sorted([5, 3]) is False
    assert is_sorted([3, 5, 2]) is False
    assert is_sorted([7, 5, 3]) is False
    

def test_is_sorted_on_sorted_strings():
    # Positive test cases (examples) with lists of sorted strings
    assert is_sorted(['A']) is True  # Single item is trivially sorted
    assert is_sorted(['A', 'B']) is True  # Duplicate items are in order
    assert is_sorted(['A', 'C']) is True
    assert is_sorted(['A', 'B', 'C']) is True
    

def test_is_sorted_on_unsorted_strings():
    # Negative test cases (counterexamples) with lists of unsorted strings
    assert is_sorted(['B', 'A']) is False
    assert is_sorted(['D', 'A', 'C']) is False
    assert is_sorted(['C', 'B', 'A']) is False
    

def test_sort_on_empty_list():
    items = []
    sort(items)
    assert items == []  # List should not be changed

def test_sort_on_small_lists_of_integers():
    items1 = [3]
    sort(items1)
    assert items1 == [3]  # List should not be changed
    items2 = [5, 3]
    sort(items2)
    assert items2 == [3, 5]  # List should be in sorted order
    items3 = [5, 7, 3]
    sort(items3)
    assert items3 == [3, 5, 7]


def test_sort_on_lists_of_random_integers():
    # Generate list of 10 random integers from range [1...20]
    items1 = random_ints(10, 1, 20)
    sorted_items1 = sorted(items1)  # Create a copy of list in sorted order
    sort(items1)  # Call mutative sort function to sort list items in place
    assert items1 == sorted_items1

    # Generate list of 20 random integers from range [1...50]
    items2 = random_ints(20, 1, 50)
    sorted_items2 = sorted(items2)  # Copy
    sort(items2)  # Mutate
    assert items2 == sorted_items2

    # Generate list of 30 random integers from range [1...100]
    items3 = random_ints(30, 1, 100)
    sorted_items3 = sorted(items3)  # Copy
    sort(items3)  # Mutate
    assert items3 == sorted_items3



def test_sort_on_small_lists_of_strings():
    items1 = ['A']
    sort(items1)
    assert items1 == ['A']  # List should not be changed
    items2 = ['B', 'A']
    sort(items2)
    assert items2 == ['A', 'B']  # List should be in sorted order
    items3 = ['B', 'C', 'A']
    sort(items3)
    assert items3 == ['A', 'B', 'C']

def test_sort_on_fish_book_title():
    items = 'one fish two fish red fish blue fish'.split()
    sorted_items = sorted(items)  # Create a copy of list in sorted order
    sort(items)  # Call mutative sort function to sort list items in place
    assert items == sorted_items

def test_sort_on_seven_dwarf_names():
    items = 'Doc Grumpy Happy Sleepy Bashful Sneezy Dopey'.split()
    sorted_items = sorted(items)  # Copy
    sort(items)  # Mutate
    assert items == sorted_items
