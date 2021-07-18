# By Kamran Bigdely Nov. 2020
# Move Field (attribute)
# Refactored.
class Gun:
    def __init__(self, name):
        self.name = name     
        self.num_cathridge_bullet = 0   

    def shoot(self):        
        if self.num_cathridge_bullet <= 0:
            return False
        print('shoot')
        self.num_cathridge_bullet -= 1
        return True

    def reload(self):
        print('reload')

    def setCathridgeBullets(self, nBullets):
        self.num_cathridge_bullet = nBullets


class Player:
    def __init__(self, guns):        
        self.guns = guns
        for i in range(len(guns)):
            # initialize with 10 bullets in each gun's cathridge.
            self.guns[i].setCathridgeBullets(10)

    def fire_once(self):
        for gun in self.guns:            
                if gun.shoot():
                    break


def game_loop():
    while (True):
        player.fire_once()
        # other logic here.
        break


guns = [Gun('pistol'), Gun('rifle')]
player = Player(guns)
game_loop()
