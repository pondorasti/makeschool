class Queue:

  def __init__(self):
    #CREATE AN EMPTY Queue
    #put the front at index 0
    #back at index n - 1
    self.my_queue = []

  #ADDS and item to the back of the queue
  #If the back is at index n - 1
  def enqueue(self, item):
    self.my_queue.append(item)

  #Remove the item at the front
  def dequeue(self):
    #write the code for dequeue
    self.my_queue.pop(0)

  #Look at the item at the item at the front
  def front(self):
    return self.my_queue[0]