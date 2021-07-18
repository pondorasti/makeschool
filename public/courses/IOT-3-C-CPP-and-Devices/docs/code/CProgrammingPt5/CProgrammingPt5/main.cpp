//
//  main.cpp
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include <iostream>

#include "TermKeyAndTime.hpp"
#include "Invader.hpp"

#define MOVE_MILLIS 50
uint64_t timeMillis, newTimeMillis;

void SpaceInvaders (void);
void DrawPlayfield (void);
void SetupGame (void);
void PlayGame (void);

int main(int argc, const char * argv[]) {

    printf ("Attach debugger now, use A and D keys for left right and SPACE for firing (not yet implemented)\n");

    getchar ();
    
    init_getch ();   // turn off terminal character echoing

// initialize game timing
    timeMillis = get_time_in_milliseconds_since_boot ();
    newTimeMillis = timeMillis + MOVE_MILLIS;
    
    SpaceInvaders ();
    
    getchar ();
    
    return 0;
}

void SpaceInvaders (void) {
    clear_screen ();
    DrawPlayfield ();
    SetupGame ();
    PlayGame ();
}

Turret * myTurret;  // pointer to instance of Turret
Invader * invaders[70];

Weapon * AlienBomb1;

void SetupGame (void){
    int index = 0;

    myTurret = new Turret (20);    // instantiate Object using function overloading

    for (int row = 0; row < INVADER_ROWS; row++) {
        for (int col = 0; col < INVADER_COLUMNS; col++)  {
            int type = row % 3;
            switch (type) {
                case 0: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::SKINNY_ALIEN);
                    break;
                case 1: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::FAT_ALIEN);
                    break;
                case 2: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::PRICKLY_ALIEN);
                    break;
                default:
                    ;
            }
            invaders[index++]->DrawAlien ();
        }
    }
    
    AlienBomb1 = new Weapon (0, 0, Weapon::WeaponType::ARROW_BOMB, false);
    
}

void PlayGame (void) {

    myTurret->DrawTurret ();
    
    while (1) {
    
// instead of moving on a keystroke ready, move on timer event
        if (newTimeMillis < timeMillis) {
            newTimeMillis = timeMillis + MOVE_MILLIS;
            
            myTurret->Move ();

        }
        
// update game timer
        timeMillis = get_time_in_milliseconds_since_boot ();
    }
}

void DrawPlayfield (void) {
// draw box around playfield
    for (int y = 2; y <= _HEIGHT; y++) {
        position_cursor (y, 1);
        printf ("\u2588");
        position_cursor (y, _WIDTH);
        printf ("\u2588");
    }
    for (int x = 2; x < _WIDTH; x++) {
        position_cursor (2, x);
        printf ("\u2588");
        position_cursor (_HEIGHT, x);
        printf ("\u2588");
    }
    fflush (stdout);
}


/*  Solution for alien bombs, explosions, turret missles and invader movements
//
//  main.cpp
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include <iostream>

#include "TermKeyAndTime.hpp"
#include "Invader.hpp"

#define MOVE_MILLIS 50
#define INVADER_MOVE_MILLIS 500
#define INVADER_BOMB_MILLIS 200
uint64_t timeMillis, newTimeMillis, invaderTimeMillis, bombTimeMillis;

void SpaceInvaders (void);
void DrawPlayfield (void);
void SetupGame (void);
void PlayGame (void);

int main(int argc, const char * argv[]) {    

    printf ("Attach debugger now, use AS keys for left right and SPACE for firing\n");

    getchar ();
    
    init_getch ();   // turn off terminal character echoing

// initialize game timing
    timeMillis = get_time_in_milliseconds_since_boot ();
    newTimeMillis = timeMillis + MOVE_MILLIS;
    invaderTimeMillis = timeMillis + INVADER_MOVE_MILLIS;
    bombTimeMillis    = timeMillis + INVADER_BOMB_MILLIS;
    
    SpaceInvaders ();
    
    getchar ();
    
    return 0;
}

void SpaceInvaders (void) {
    clear_screen ();
    DrawPlayfield ();
    SetupGame ();
    PlayGame ();
}

Turret * myTurret;  // pointer to instance of Turret
Invader * invaders[70];

Weapon * TurretMissile;
Weapon * AlienBomb1;

void SetupGame (void) {
    int index = 0;

    InitInvaders ();
    
    myTurret = new Turret (20);    // instantiate Object using function overloading
    TurretMissile = new Weapon (0, 0, Weapon::WeaponType::SLOW_MISSILE, false);

    for (int row = 0; row < INVADER_ROWS; row++) {
        for (int col = 0; col < INVADER_COLUMNS; col++)  {
            int type = row % 3;
            switch (type) {
                case 0: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::SKINNY_ALIEN);
                    break;
                case 1: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::FAT_ALIEN);
                    break;
                case 2: invaders[index] = new Invader (col * 5 + 2, row + 5,
                            Invader::AlienType::PRICKLY_ALIEN);
                    break;
                default:
                    ;
            }
            invaders[index++]->DrawAlien ();
        }
    }
    
    AlienBomb1 = new Weapon (0, 0, Weapon::WeaponType::ARROW_BOMB, false);
    
    AlienBomb1->SetMissilePosition(4, _HEIGHT - 2);
}

void PlayGame (void) {

    myTurret->DrawTurret ();
    
    while (1) {
    
// instead of moving on a keystroke ready, move on timer event
        if (newTimeMillis < timeMillis) {
            newTimeMillis = timeMillis + MOVE_MILLIS;
            
            myTurret->Move (TurretMissile);
        
            TurretMissile->Move (invaders);
            
            if (bombTimeMillis < timeMillis) {
                bombTimeMillis = timeMillis + INVADER_BOMB_MILLIS;
                if (AlienBomb1->Move (invaders, myTurret, myTurret->getTurretX () ) )
                    return; // All invaders have been killed
            }
            
            if (invaderTimeMillis < timeMillis) {
                invaderTimeMillis = timeMillis + INVADER_MOVE_MILLIS;
                if (count < 15)
                    invaderTimeMillis = timeMillis + INVADER_MOVE_MILLIS / 2;
                if (count < 8)
                    invaderTimeMillis = timeMillis + INVADER_MOVE_MILLIS / 4;
                if (count < 3)
                    invaderTimeMillis = timeMillis + MOVE_MILLIS;
                
                if (drop == 0) {
                for (int x = 0; x < (INVADER_ROWS * INVADER_COLUMNS); x++)
                    invaders[x]->Move();
                } else {
                    direction = nextDirection;
                    drop = 0;
                    for (int x = (INVADER_ROWS * INVADER_COLUMNS) - 1; x >= 0 ; x--)
                        if (invaders[x]->Drop() )
                            return; // Invader has landed on the ground, game over
                }
            }
        }
// update game timer
        timeMillis = get_time_in_milliseconds_since_boot ();
    }
}

void DrawPlayfield (void) {
// draw box around playfield
    for (int y = 2; y <= _HEIGHT; y++) {
        position_cursor (y, 1);
        printf ("\u2588");
        position_cursor (y, _WIDTH);
        printf ("\u2588");
    }
    for (int x = 2; x < _WIDTH; x++) {
        position_cursor (2, x);
        printf ("\u2588");
        position_cursor (_HEIGHT, x);
        printf ("\u2588");
    }
    fflush (stdout);
}
*/
