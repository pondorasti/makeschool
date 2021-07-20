#!python

class Node(object):

    def __init__(self, data):
        """Initialize this node with the given data."""
        self.data = data
        self.next = None


class LinkedList(object):

    def __init__(self):
        """Initialize this linked list."""
        self.head = None
        self.tail = None


    def append(self, item):
        """Insert the given item at the tail of this linked list.
      """
        # Create a new node to hold the given item
        new_node = Node(item)
        # Check if this linked list is empty
        if self.head is None:
            # Assign head to new node
            self.head = new_node
        else:
            # Otherwise insert new node after tail
            self.tail.next = new_node
        # Update tail to new node regardless
        self.tail = new_node

    def prepend(self, item):
      #need to make the new node the head
      #set the new node's next to the current head
      # Create a new node to hold the given item
      new_node = Node(item)
      if self.head is None:#if empty make head new node
        self.head = new_node
        self.tail = new_node
      else:#otherwise set new node to head
        new_node.next = self.head
        self.head = new_node
      


    def delete_from_tail(self):
        """Delete the last item in the linked list
      """
        current = self.head
        while current != None:
            if current.next == self.tail:
                break
        current = current.next
        #have the node right before the tail
        current.next = None
        self.tail = current

    def delete_from_head(self):
      self.head = self.head.next
    
    def print_list(self):
        """ Print everything in this linked list """
        
        current = self.head
        while current != None:
            print(current.data)
            current = current.next