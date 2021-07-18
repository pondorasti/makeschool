//
//  Snake.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"
#include "TermKeyAndTime.h"

//---------------------------------------
// STARTING POINT - SNAKE GAME VARIATIONS

// Challenge 1, Add Bell sound effect at appropriate times using printf ("\a");
// Challenge 2, Do not exit the application on GAME OVER, ask user, y/n?
// Challenge 3, Add 20 character long tail length limit to snake
// Challenge 4, Make snake tail slowly grow longer to a maximum of 200 segments
// Challenge 5, Add obstacles at start and then add more as game progresses
// Challenge 6, Change the game so the snake head moves based on a fixed timer
// Challenge 7, Provide a game start count down and game score counter with high score
// Challenge 8, Make the snake head move slightly faster as the game progresses
// Challenge 9, Make the dying snake head explode and body whither away in an animation
// Challenge 10, Add periodically appearing enemy "bugs" that wander and vanish
// Challenge 11, Add snake food (mice) adn then grow the snakes length
// Challenge 12, Make a game configuration console to adjust difficulty and game options
// Stretch Challenge, Add an AI opponent snake that starts off facing down
// Extra credit: Break up code into a set of functions
// Extra credit: Invent new game play dynamics, changing maze obstacles?, smart AI enemies?

#define _UP     "\u25B2"
#define _DOWN   "\u25BC"
#define _LEFT   "\u25C0"
#define _RIGHT  "\u25BA"
#define _HEIGHT 23
#define _WIDTH  42

void snake (void) {
    bool ready;
    char letter;
    char * dir;
    int y, x;
    uint64_t timeMillis, newTimeMillis;
    
    init_getch ();   // turn off terminal character echoing
    
    clear_screen ();

    printf ("Press WSAD keys to move, ESC quits.\n");

// initialize the board array to blank
    char board[_HEIGHT + 1][_WIDTH + 1];  // add +1 to compensate for zero index origin
    for (y = 1; y < _HEIGHT; y++) {
        for (x = 1; x < _WIDTH; x++) {
            board[y][x] = ' ';
        }
    }

// draw box around playfield
    for (y = 2; y <= _HEIGHT; y++) {
        position_cursor (y, 1);
        printf ("\u2588");
        position_cursor (y, _WIDTH);
        printf ("\u2588");
        board[y][1]      = 'X';
        board[y][_WIDTH] = 'X';
    }
    for (x = 2; x < _WIDTH; x++) {
        position_cursor (2, x);
        printf ("\u2588");
        position_cursor (_HEIGHT, x);
        printf ("\u2588");
        board[2][x]       = 'X';
        board[_HEIGHT][x] = 'X';
    }

// set and draw starting position
    letter = 'w';
    dir = _UP;
    y = 12; x = 21;
    position_cursor (y, x);
    board[y][x] = 'X';
    printf ("%s", dir);

// main game loop gets keystroke, moves player, tests for collision
    do {
        ready = get_letter ( &letter );
        if (ready) {
//            position_cursor (y, x);  // comment out for
//            printf (" ");            // snake game
//            board[y][x] = ' ';       // infinite tail length

            switch (letter) {  // Maybe add diagonals with QEZC keys?
                case 'w': case 'W': y =(y > 2)      ? y-1 : 2;       dir = _UP;    break;
                case 's': case 'S': y =(y < _HEIGHT)? y+1 : _HEIGHT; dir = _DOWN;  break;
                case 'a': case 'A': x =(x > 1)      ? x-1 : 1;       dir = _LEFT;  break;
                case 'd': case 'D': x =(x < _WIDTH) ? x+1 : _WIDTH;  dir = _RIGHT; break;
                default: ;
            }
            if (' ' != board[y][x]) {
                position_cursor (y, x);
                printf ("\u2620"); // Skull and Bones
                position_cursor (1, 1);
                printf ("    *** GAME OVER ***        ");
                goto Exit;
            }
            board[y][x] = 'X';
            position_cursor (y, x);
            printf ("%s", dir); // Menlo 18pt Regular works well
        }
        timeMillis = get_time_in_milliseconds_since_boot();
        position_cursor (1, 40);
        printf ("y = %d, x = %d, time = %llu  ", y, x, timeMillis);
        fflush (stdout);
    } while (letter != '\033'); // esc key
    
Exit:   // instead of ending the process, ask Yes/No and restart new game?
    getchar ();
}


/*
// CHALLENGE 6 solution:
// Challenge 6, Change the game so the snake head moves based on a fixed timer
//
// Insert code next to +++ at the appropriate locations using other code between
// which does not need changing to locate the positions for insertions.
// Add // comment characters to comment out code that has >>> preceding it

----------
+++ #define _MOVE_MILLIS 300

    board[y][x] = 'X';
    printf ("%s", dir);
    
+++    timeMillis = get_time_in_milliseconds_since_boot();
+++    newTimeMillis = timeMillis + _MOVE_MILLIS;

// main game loop gets keystroke, moves player, tests for collision
----------
        ready = get_letter ( &letter );
        
+++        if (newTimeMillis < timeMillis) {      // instead of moving on a keystroke, move
+++            newTimeMillis = timeMillis + _MOVE_MILLIS;  // based on time in milliseconds
>>> //        if (ready) {
//            position_cursor (y, x);  // comment out for
//            printf (" ");           // snake game
//            board[y][x] = ' ';      // infinite tail length
----------
*/


