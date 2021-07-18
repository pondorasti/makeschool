# By Kami Bigdely
# PEP8 - whitespaces and variable names.
class pizza:
    def __init__ (obj, mybread_type,CHEESE_TYPE,meatType,pizza_toppings,size):
        obj.bread_type= mybread_type
        obj.cheese_type = CHEESE_TYPE
        obj.meatType= meatType
        obj.toppings = pizza_toppings
        obj.size = size        
    @classmethod
    def Create_ChicagoPizza (class_type, size):
        bread = 'deep-dish bread'
        cheese = 'mozzarella cheese'
        meatType= 'Italian sausage'
        toppings = ['green bell pepper','mushroom', 'chunky tomato sauce', 'onion']
        return class_type (bread, cheese, meatType, toppings, size)    
    @classmethod
    def createCalifornia_pizza(ct, meat_Type,size):
        bread = 'thin crust'
        CHEESE = 'feta cheese'
        toppings =[ 'garlic', 'spinach', 'broccoli', 'olives', 'red onion', 'red bell pepper' ]
        return ct(bread, CHEESE, meat_Type, toppings, size) 
    def printInfo(obj):
        print('bread type is: ', obj.bread_type)
        print('cheese type is: ', obj.cheese_type)
        print('meat type is: ', obj.meatType)
        print('Toppings are: ', end='')
        print(', '.join(map(str, obj.toppings)))

    
myPizza = pizza.createCalifornia_pizza('chicken', 'large')
myPizza.printInfo()