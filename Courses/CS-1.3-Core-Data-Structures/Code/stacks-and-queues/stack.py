class Stack:

  def __init__(self):
    #CREATE the stack
    self.my_stack = []

  #ADD something to the top of the stack
  def push(self, item):
    self.my_stack.append(item)

  #DELETE remove something from the top of the stack
  def my_pop(self):
    return self.my_stack.pop(len(self.my_stack) - 1)

  #READ the top of the stack
  def peek(self):
    return self.my_stack[len(self.my_stack) - 1]
