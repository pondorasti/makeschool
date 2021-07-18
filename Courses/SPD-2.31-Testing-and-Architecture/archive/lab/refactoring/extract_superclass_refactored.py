# By Kamran Bigdely
# Extract superclass
# Refactored.
class Enemy:
    
    def __init__(self):
        self.health = 100   
         
    def take_damage(self, damage):
        self.health -= damage


class AngryMushroom(Enemy):
    
    def __init__(self):
        pass
    
    def spread_poison(self):
        print('spreading poison!')


class AngryBot(Enemy):
    
    def __init__(self):
        self.n_bullets = 40
        
    def punch_iron_fist(self):
        print("punching with iron fist!")
        
    def shoot(self):
        print("shot a bullet!")
        self.n_bullets -= 1



class AgressiveAlligator(Enemy):
    
    def bite(self):
        print('bitting!')


angryMushroom = AngryMushroom()
print("initial health level:", angryMushroom.health)
angryMushroom.take_damage(25)
print("took damage!")
print("current health level:",angryMushroom.health)
