# By Kamran Bigdely
# Extract superclass
class AngryMushroom:
    
    def __init__(self):
        self.health = 100
        
    def take_damage(self, damage):
        self.health -= damage
        
    def spread_poison(self):
        print('spreading poison!')


class AngryBot:
    
    def __init__(self):
        self.health = 100
        self.n_bullets = 40
        
    def take_damage(self, damage):
        self.health -= damage
        
    def punch_iron_fist(self):
        print("punching with iron fist!")
        
    def shoot(self):
        print("shot a bullet!")
        self.n_bullets -= 1



class AgressiveAlligator:
    
    def __init__(self):
        self.health = 100
        
    def take_damage(self, damage):
        self.health -= damage
        
    def bite(self):
        print('bitting!')


angryMushroom = AngryMushroom()
print("initial health level:", angryMushroom.health)
angryMushroom.take_damage(25)
print("took damage!")
print("current health level:",angryMushroom.health)
