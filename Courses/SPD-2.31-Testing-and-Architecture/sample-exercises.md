# SPD 2.3 Sample Assignments

- Download [Debugging Exercises](https://github.com/Make-School-Labs/SPD-2.3-Debugging-Steps-Lab) and solve them.

- Improve the code formatting and layout of the following programs according to PEP 8:

```python
# by Kami Bigdely
# docstrings for class

class fighter:
    def __init__(self):
        self.x = 0
        self.y = 0
        self.health = 100
        self.gas = 3
    def set_position(self, x, y):
        self.x = x
        self.y = y
    def render(self):
        print("rendered the fighter")
    def take_damage(self, damage):
        self.health -= damage
        if self.health <= 0:
            print("the figher fell apart!")
    def consume_gas(self):
        if self.gas > 0:
            self.gas -= 1
        else:
            print('out of gas! ')
    def take_gas(self, gas_amound):
        self.gas += gas_amound

f = fighter()
f.set_position(10, 10)
f.consume_gas()
f.take_damage(90)
f.take_damage(40)

```

----------

``` python
# by Kami Bigdely
# Writing docstring for functions and classes.
# reference: https://math.ryerson.ca/~danziger/professor/MTH141/Handouts/projections.pdf
import numpy as np
def proj_u_onto_v(u,v):
    return np.dot(u, v)/np.dot(v, v) * v

    
force = np.array([1,1])
displacement = np.array([1,0])
proj = proj_u_onto_v(force, displacement)
print(proj[0], proj[1])

```

----------

```python
# by Kami Bigdely
# Indentation
def write_to_db():
   print('person info are written into db.')
    
    
def set_person_info(first_name, last_name, gender, date_of_birth, photo, nationality, place_of_birth):
    if not first_name:
      print('first name is empty.') 
    if not last_name:
      print('last name is empty.')
    # ...    
    write_to_db()

photo_path = "https://en.wikipedia.org/wiki/Tim_Hunt#/media/File:Tim_Hunt_at_UCSF_05_2009_(4).jpg"
set_person_info('Tim', 'Hunt', 'male','19 February 1943', photo_path, 'Uited Kingdom', 'Neston, Cheshire, England')
```

----------

```python
# by Kami Bigdely
# PEP8 - whitespaces and variable names.
# This is a guess game. Guess what number the computer has chosen!
import random
lowerLimit=0
UPPER_limit= 100
randomNumber = random.randint (lowerLimit ,UPPER_limit )
print ('The computer has selected a number between 0 and 100. Use your supernatural superpowers to guess what the number is.')
while True:
    UserGuess = int (input("Enter a number between 0 and 100 (including): "))
    if UserGuess> randomNumber:
        print ("Guess a smaller number.")
    elif UserGuess <randomNumber:
        print ("Guess a larger number.")
    else: #UserGuess == randomNumber:
        print ("You Won!")
        break
    
```

- Use **Extract method** refactoring technique to improve the following code:
  
```python
# Adapted from a Java code in the "Refactoring" book by Martin Fowler.
# Code snippet. Not runnable.
def print_owing():
    outstanding = 0.0
    # print banner
    print("*******************")
    print("***Customer owes***")
    print("*******************")    
    # calculate outstanding
    for order in orders:
        outstanding += order.get_amount()    
    # print details
    print("name: " + name)
    print("amount: " + outstanding)
```

- Use **Replace Temp with Query** refactoring technique to improve the following code:
  
```python
# Adapted from a Java code in the "Refactoring" book by Martin Fowler.
# Replace temp with query
# Code snippet. Not runnable.
def getPrice():
    base_price = quantity * item_price
    discount_factor = 0
    if (base_price > 1000): 
        discount_factor = 0.95
    else: 
        discount_factor = 0.98
    return base_price * discount_factor

```

- Use **Introduce Explaining Variable (Extract Variable)** refactoring technique to improve the following code:
  
```python
# Adapted from a Java code in the "Refactoring" book by Martin Fowler.
# Introduce Explaining variable (aka extract variable)
platform = "mac pro 2018"
browser = 'safari 8.0'
resize = True
def is_initialized():
    return True
def render_banner():
    if ('MAC' in platform.upper() and
    "SAFARI" in browser.upper() and
    is_initialized()): 
        print("Yes!")
        # do something
 
render_banner()

```

- Use **Split Temporary Variable** refactoring technique to improve the following code:
  
```python
# Adapted from a Java code in the "Refactoring" book by Martin Fowler.
# split temporary variable
width = 5
height = 10
temp = 2 * (height + width)

print(temp)
temp = height * width
print(temp)

```
