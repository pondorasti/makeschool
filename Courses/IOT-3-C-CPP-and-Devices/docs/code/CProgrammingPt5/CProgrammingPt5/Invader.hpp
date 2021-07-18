//
//  Invader.hpp
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#ifndef Invader_hpp
#define Invader_hpp

#define INVADER_ROWS 5
#define INVADER_COLUMNS 12

#define _WIDTH 80
#define _HEIGHT 22

class Invader {
    public:
        enum AlienType { SKINNY_ALIEN = 0, FAT_ALIEN, PRICKLY_ALIEN };
        Invader (int x, int y, AlienType type) {
            xPos = x; yPos = y; alienType = type; pose = 0; live = true;
        };
        void Move (void) { ; };
        void DrawAlien (void) {
            position_cursor (yPos, xPos);     // draw alien
            printf (">X<");
            fflush (stdout);
        };
        void EraseAlien (void) {
            position_cursor (yPos, xPos);     // erase alien
            printf ("   ");
        };
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
            xPos = x; yPos = y; weaponType = type;
        };
        void Move (void);
    private:
        void checkDestroyed (void);
        int xPos;
        int yPos;
        WeaponType weaponType;
        int direction;
};

class Turret {
    public:
        Turret (void) { xPos = 10; };
        Turret (int x) { xPos = x; };
        void Move (void) {
            int offset     = 0;
            char direction = 0;
            bool fire      = false;
            if (get_letter ( & direction ) ) {
                if ('a' == direction)
                    offset = -1;
                if ('d' == direction)
                    offset = 1;
                if (' ' == direction)
                    fire = true;

                if (((0 > offset) && (xPos > 2) )
                 || ((0 < offset) && (xPos < _WIDTH - 5) ) ) {
                    EraseTurret ();
                    xPos += offset;
                    DrawTurret ();
                }
            }
        };
        void DrawTurret (void) {
            position_cursor (_HEIGHT - 2, xPos + 2); // draw gun
            printf ("\u2588");
            position_cursor (_HEIGHT - 1, xPos);     // draw base
            printf ("\u2588\u2588\u2588\u2588\u2588");
            fflush (stdout);
        };
        void EraseTurret (void) {
            position_cursor (_HEIGHT - 2, xPos + 2); // erase gun
            printf (" ");
            position_cursor (_HEIGHT - 1, xPos);     // erase base
            printf ("     ");
        };
    private:
        int xPos;
        bool missleActive;
};

#endif // Invader_hpp

/* Solution for alien bombs, explosions, turret missles and invader movements
//
//  Invader.hpp
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#ifndef Invader_hpp
#define Invader_hpp

#define INVADER_ROWS 5
#define INVADER_COLUMNS 12

#define _WIDTH 80
#define _HEIGHT 22

int count;
int direction;
int nextDirection;
int drop;

void InitInvaders (void) {
    count = INVADER_ROWS * INVADER_COLUMNS;
    direction = 1;
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
                EraseAlien ();
                yPos++;
                DrawAlien ();
                if (yPos == _HEIGHT - 1)
                    return true;
            }
            return false;
        };
        void DrawAlien (void) {
            position_cursor (yPos, xPos);     // draw alien
            printf (">X<");
            fflush (stdout);
        };
        void EraseAlien (void) {
            position_cursor (yPos, xPos);     // erase alien
            printf ("   ");
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
                if ((xPos >= turretX) && (xPos < turretX + 5)) {
                    position_cursor (_HEIGHT - 2, turretX + 2);
                    printf (" ");
                    position_cursor (_HEIGHT - 1, turretX);
                    printf ("*-*-*");
                    fflush (stdout);
                    sleep (1);
                    position_cursor (_HEIGHT - 2, turretX + 2); // draw gun
                    printf ("\u2588");
                    position_cursor (_HEIGHT - 1, turretX);     // draw base
                    printf ("\u2588\u2588\u2588\u2588\u2588");
                    fflush (stdout);
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
                for (int x = 0; x < 60; x++) {
                    (*(invaders + x))->getInvaderXY(&alienX, &alienY);
                    if (yPos == alienY)
                        if ((xPos >= alienX) && (xPos <= alienX + 2))
                        {
                            for (int blowUp = 0; blowUp < 10; blowUp++) {
                                position_cursor (alienY, alienX);
                                printf ("*--");
                                fflush (stdout);
                                usleep (1000);
                                position_cursor (alienY, alienX);
                                printf ("-*-");
                                fflush (stdout);
                                usleep (1000);
                                position_cursor (alienY, alienX);
                                printf ("--*");
                                fflush (stdout);
                                usleep (1000);
                                position_cursor (alienY, alienX);
                                printf ("xxx");
                                fflush (stdout);
                                usleep (1000);
                            }
                            position_cursor (alienY, alienX);
                            printf ("   ");
                            fflush (stdout);
                            WeaponLive = false;
                            (*(invaders + x))->killInvader();
                        }
                }
            }
        }
        void DrawWeapon (void) {
            position_cursor (yPos, xPos);     // draw missile
            printf ("!");
            fflush (stdout);
        };
        void EraseWeapon (void) {
            position_cursor (yPos, xPos);     // erase missile
            printf (" ");
            fflush (stdout);
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
            if (GetLetter ( & direction ) ) {
                if ('a' == direction)
                    offset = -1;
                if ('d' == direction)
                    offset = 1;
                if (' ' == direction)
                    { Missile->SetMissilePosition(xPos + 2, _HEIGHT - 3);
                }
                if (((0 > offset) && (xPos > 2) )
                 || ((0 < offset) && (xPos < _WIDTH - 5) ) ) {
                    EraseTurret ();
                    xPos += offset;
                    DrawTurret ();
                }
            }
        };
        void FireMissile (void) { ; };
        int getTurretX ( void ) {
            return (xPos); }
        void DrawTurret (void) {
            position_cursor (_HEIGHT - 2, xPos + 2); // draw gun
            printf ("\u2588");
            position_cursor (_HEIGHT - 1, xPos);     // draw base
            printf ("\u2588\u2588\u2588\u2588\u2588");
            fflush (stdout);
        };
        void EraseTurret (void) {
            position_cursor (_HEIGHT - 2, xPos + 2); // erase gun
            printf (" ");
            position_cursor (_HEIGHT - 1, xPos);     // erase base
            printf ("     ");
        };
    private:
        int xPos;
        bool missleActive;
};

#endif // Invader_hpp
*/
