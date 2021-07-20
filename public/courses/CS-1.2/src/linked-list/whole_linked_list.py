class Node:
    def __init__(self,initdata):
        self.data = initdata # Data part
        self.next = None # Address part

    def getData(self): # getter method
        return self.data

    def getNext(self): # getter method
        return self.next

    def setData(self,newdata): # setter method
        self.data = newdata

    def setNext(self,newnext): # setter method
        self.next = newnext


class LinkedList:

    def __init__(self):
        self.head = None

    def isEmpty(self):
        return self.head == None

    def add(self,item):
        temp = Node(item)
        temp.setNext(self.head)        
        self.head = temp

    def size(self):
        current = self.head
        count = 0
        while current != None:
            count = count + 1
            current = current.getNext()

        return count

    def search(self,item):
        current = self.head
        found = False
        while current != None and not found:
            if current.getData() == item:
                found = True
            else:
                current = current.getNext()

        return found

    def remove(self,item):
        current = self.head
        previous = None
        found = False
        while not found:
            if current.getData() == item:
                found = True
            else:
                previous = current
                current = current.getNext()

        if previous == None:
            self.head = current.getNext()
        else:
            previous.setNext(current.getNext())

    def print(self):
        current = self.head
        while current != None:
            print(current.data)
            current = current.getNext() 


mylist = LinkedList()

mylist.add(31)
mylist.print()
mylist.add(77)
mylist.print()
# mylist.add(17)
# mylist.add(93)
# mylist.add(26)
# mylist.add(54)

# print(mylist.size())
# print(mylist.search(93))
# print(mylist.search(100))

# mylist.add(100)
# print(mylist.search(100))
# print(mylist.size())

# mylist.remove(54)
# print(mylist.size())
# mylist.remove(93)
# print(mylist.size())
# mylist.remove(31)
# print(mylist.size())
# print(mylist.search(93))
