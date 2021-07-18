class Node:

  def __init__(self, data):
    self.__data = data 
    self.__next = None

  def set_data(self, new_data):
    self.__data = new_data