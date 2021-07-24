from Node import Node

class LinkedList:
  
  def __init__(self):
    self.head = None

  def add(self, new_data):
    # 1. Create a new node
    new_node = Node(new_data)

    # 2. Set new node's next pointer to where the head is pointing
    new_node.next = self.head

    # 3. Set head pointer to point at the new node
    self.head = new_node


  def is_empty(self):
    return self.head == None


  def size(self):
    counter = 0
    current_node = self.head

    while current_node != None:
      counter += 1
      current_node = current_node.next

    return counter