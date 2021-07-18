//
//  Invader.hpp
//  CProgrammingPt5
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#ifndef Invader_h
#define Invader_h

#define INVADER_ROWS 5
#define INVADER_COLUMNS 4

#define _WIDTH 36
#define _HEIGHT 24

int count;
int direction;
int score;
int nextDirection;
int drop;
void InitInvaders (void) {
    count = INVADER_ROWS * INVADER_COLUMNS;
    direction = 1;
    score = 0;
}

class Invader {
    public:
        enum AlienType { SKINNY_ALIEN = 0, FAT_ALIEN, PRICKLY_ALIEN };
        Invader (int x, int y, AlienType type) {
            xPos = x; yPos = y; alienType = type; pose = 0; live = true;
        };
        void Move (void) {
            if (live) {
                EraseAlien();
                xPos += direction;
                if ((direction == 1) && (xPos > _WIDTH - 4) ) {
                    nextDirection = -1; drop = 1; }
                if ((direction == -1) && (xPos < 3) ) {
                    nextDirection = 1; drop = 1; }
                DrawAlien();
            }
         };
         bool Drop (void) {
            if (live) {
                EraseAlien();
                yPos++;
                DrawAlien();
                if (yPos == _HEIGHT - 1)
                    return true;
            }
            return false;
        };
        void DrawAlien (void) {
            myGLCD.setColor(0,255, 15);
            myGLCD.fillRect(-22 + xPos * 14, -18 + yPos * 14, -10 + (xPos + 2) * 14, -6 + yPos * 14);
       };
        void EraseAlien (void) {
            myGLCD.setColor(0, 0, 0);
            myGLCD.fillRect(-22 + xPos * 14, -18 + yPos * 14, -10 + (xPos + 2) * 14, -6 + yPos * 14);
       };
        void getInvaderXY ( int * x, int * y) {
            *x = xPos; *y = yPos; }
        void killInvader (void) {
            live = false; xPos = -1; yPos = -1; count--; }
        bool getInvaderLive (void) {
            return live; }
    private:
        void nextPose (void) { ; };
        int xPos;
        int yPos;
        AlienType alienType;
        int pose;
        bool live;
};

class Weapon {
    public:
        enum WeaponType { SQUIGLY_BOMB = 0, ARROW_BOMB, SLOW_MISSILE, FAST_MISSILE };
        Weapon (int x, int y, WeaponType type, bool live) {
            xPos = x; yPos = y; weaponType = type; WeaponLive = live;
            if (weaponType == ARROW_BOMB)
                direction = 1;
            else direction = -1; // fix for invader bombs, use type to determine
        };
        void SetMissilePosition (int x, int y) {
            if (! WeaponLive) {
                xPos = x; yPos = y; WeaponLive = true;
                DrawWeapon ();
            }
        }
        bool Move (class Invader * * invaders, class Turret * turret, int turretX) {
            EraseWeapon ();
            yPos += direction;
            if (yPos == _HEIGHT - 1) {
                if ((xPos >= turretX - 1) && (xPos < turretX + 4)) {
                    myGLCD.setColor(128, 0, 0);
                    myGLCD.fillRect(-22 + (turretX + 2) * 14, -18 + (_HEIGHT - 2) * 14, -10 + (turretX + 2) * 14, -6 + (_HEIGHT - 1) * 14);
                    myGLCD.fillRect(-22 + turretX * 14, -18 + (_HEIGHT - 1) * 14, -10 + (turretX + 4) * 14, -6 + (_HEIGHT - 1) * 14);
                    delay (1000);
                    myGLCD.setColor(192, 192, 255);
                    myGLCD.fillRect(-22 + (turretX + 2) * 14, -18 + (_HEIGHT - 2) * 14, -10 + (turretX + 2) * 14, -6 + (_HEIGHT - 1) * 14);
                    myGLCD.fillRect(-22 + turretX * 14, -18 + (_HEIGHT - 1) * 14, -10 + (turretX + 4) * 14, -6 + (_HEIGHT - 1) * 14);
                }
                int randInvader;
                int index;
                if (count == 0) {
                    return (true); }
                do {
                    randInvader = rand() % (INVADER_ROWS * INVADER_COLUMNS);
                    int intX = randInvader % INVADER_COLUMNS;
                    for (int intY = INVADER_ROWS - 1; intY >= 0; intY--) {
                        index = (intY * INVADER_COLUMNS) + intX;
                        if (invaders[index]->getInvaderLive() ) {
                            invaders[index]->getInvaderXY(&xPos, &yPos);
                            xPos++;
                            goto NEXT_BOMB;
                        }
                    }
                } while ( true );
NEXT_BOMB:      ;
            }
            DrawWeapon ();
            return (false);
        }
        void Move (Invader * * invaders) {
            if (WeaponLive) {
                EraseWeapon ();
                yPos += direction;
                if (yPos > 2) {
                    DrawWeapon ();
                } else {
                    WeaponLive = false;
                }
                int alienX, alienY;
                for (int x = 0; x < INVADER_ROWS * INVADER_COLUMNS; x++) {
                    (*(invaders + x))->getInvaderXY(&alienX, &alienY);
                    if (yPos == alienY)
                        if ((xPos >= alienX - 1) && (xPos <= alienX + 1))
                        {
                            EraseWeapon ();
                            myGLCD.setColor (255,32, 32);
                            myGLCD.fillRect (-22 + alienX * 14, -18 + alienY * 14, -10 + (alienX + 2) * 14, -6 + alienY * 14);
                            delay (100);
                            myGLCD.setColor (0, 0, 0);
                            myGLCD.fillRect (-22 + alienX * 14, -18 + alienY * 14, -10 + (alienX + 2) * 14, -6 + alienY * 14);
                            WeaponLive = false;
                            invaders[x]->killInvader ();
                            myGLCD.setBackColor (255, 0, 0 );
                            myGLCD.setColor (255, 255, 255 );
                            myGLCD.printNumI ( ++score, 190, 1 );
                        }
                }
            }
        }
        void DrawWeapon (void) {
            myGLCD.setColor(255, 0, 0); // draw missile
            myGLCD.fillRect(-22 + (xPos + 2) * 14, -18 + yPos * 14, -10 + xPos * 14, -6 + yPos * 14);
        };
        void EraseWeapon (void) {
            myGLCD.setColor(0, 0, 0); // erase missile
            myGLCD.fillRect(-22 + (xPos + 2) * 14, -18 + yPos * 14, -10 + xPos * 14, -6 + yPos * 14);
        };
    private:
        void checkDestroyed (void);
        int xPos;
        int yPos;
        WeaponType weaponType;
        int direction;
        bool WeaponLive;
};

class Turret {
    public:
        Turret (void) { xPos = 10; };
        Turret (int x) { xPos = x; };
        void Move (Weapon * Missile) {
        int offset     = 0;
        char direction = 0;
            if (!digitalRead(P2_UP) )
                offset = -1;
            if (!digitalRead(P2_DOWN) )
                offset = 1;
            if (!digitalRead(P1_RED) )
                { Missile->SetMissilePosition(xPos + 1, _HEIGHT - 3);
            }
            if (((0 > offset) && (xPos > 2) )
             || ((0 < offset) && (xPos < _WIDTH - 5) ) ) {
                EraseTurret ();
                xPos += offset;
                DrawTurret ();
            }
        };
        int getTurretX ( void ) {
            return (xPos); }
        void DrawTurret (void) {
            myGLCD.setColor(192, 192, 255);
            myGLCD.fillRect(-22 + (xPos + 2) * 14, -18 + (_HEIGHT - 2) * 14, -10 + (xPos + 2) * 14, -6 + (_HEIGHT - 1) * 14);
            myGLCD.fillRect(-22 + xPos * 14, -18 + (_HEIGHT - 1) * 14, -10 + (xPos + 4) * 14, -6 + (_HEIGHT - 1) * 14);
        };
        void EraseTurret (void) {
            myGLCD.setColor(0, 0, 0);
            myGLCD.fillRect(-22 + (xPos + 2) * 14, -18 + (_HEIGHT - 2) * 14, -10 + (xPos + 2) * 14, -6 + (_HEIGHT - 1) * 14);
            myGLCD.fillRect(-22 + xPos * 14, -18 + (_HEIGHT - 1) * 14, -10 + (xPos + 4) * 14, -6 + (_HEIGHT - 1) * 14);
        };
    private:
        int xPos;
        bool missleActive;
};


#endif /* Invader_h */
