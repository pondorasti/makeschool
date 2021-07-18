//
//  InvaderMain.h
//  CProgrammingPt5
//
//  Created by Shannon T Bailey on 5/1/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "InvaderClasses.h"

#define MOVE_MILLIS 30
#define INVADER_MOVE_MILLIS 500
#define INVADER_BOMB_MILLIS 200
uint32_t timeMillis, newTimeMillis, invaderTimeMillis, bombTimeMillis;

void SpaceInvaders (void);
void SetupGame (void);
void PlayGame (void);
void ReleaseGameObjects(void);

void game() {    
    InitGetch ();   // turn off terminal character echoing

// initialize game timing
    timeMillis = millis();
    newTimeMillis = timeMillis + MOVE_MILLIS;
    invaderTimeMillis = timeMillis + INVADER_MOVE_MILLIS;
    bombTimeMillis    = timeMillis + INVADER_BOMB_MILLIS;
    
    SpaceInvaders ();
}

void SpaceInvaders (void) {
    ClearScreen ();
    SetupGame();
    PlayGame();
    ReleaseGameObjects();
}

Turret * myTurret;  // pointer to instance of Turret
Invader * invaders[70];

Weapon * TurretMissile;
Weapon * AlienBomb1;

void SetupGame (void){
int index = 0;

    InitInvaders();
    
    myTurret = new Turret (20);    // instantiate Object using function overloading
    TurretMissile = new Weapon (0, 0, Weapon::WeaponType::SLOW_MISSILE, false);

    for (int row = 0; row < INVADER_ROWS; row++) {
        for (int col = 0; col < INVADER_COLUMNS; col++)  {
            int type = row % 3;
            switch (type) {
                case 0: invaders[index] = new Invader (col * 5 + 2, row * 2 + 3,
                            Invader::AlienType::SKINNY_ALIEN);
                    break;
                case 1: invaders[index] = new Invader (col * 5 + 2, row * 2 + 3,
                            Invader::AlienType::FAT_ALIEN);
                    break;
                case 2: invaders[index] = new Invader (col * 5 + 2, row * 2 + 3,
                            Invader::AlienType::PRICKLY_ALIEN);
                    break;
                default:
                    ;
            }
            invaders[index++]->DrawAlien();
        }
    }
    
    AlienBomb1 = new Weapon (0, 0, Weapon::WeaponType::ARROW_BOMB, false);
    
    AlienBomb1->SetMissilePosition(4, _HEIGHT - 2);
}


void ReleaseGameObjects(void) {
    delete myTurret;
    delete TurretMissile;

    for (int index = 0; index < INVADER_ROWS * INVADER_COLUMNS; index++) {
        delete invaders[index];
    }
    
    delete AlienBomb1;
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
        timeMillis = millis();
    }
}


