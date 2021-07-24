//
//  SnakeWith1to9Complete.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 4/24/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//
// Snake game for OS/X terminal
// Colorful, challenging, pretty bug free, AI version with two AI algorithms to choose from
// Pressing 'p' turns on the graphical real-time distance map display used by the AI.
//   *** AI starting point ***

// DONE: Challenge 1, Add Bell sound effect at appropriate times using printf ("\a");
// DONE: Challenge 2, Do not exit the application on GAME OVER, ask user, y/n?
// DONE: Challenge 3, Add 20 character long tail length limit to snake
// DONE: Challenge 4, Make snake tail slowly grow longer to a maximum of 200 segments
// Challenge 5, Add obstacles at start and then add more as game progresses
// DONE: Challenge 6, Change the game so the snake head moves based on a fixed timer
// PARTIAL: Challenge 7, Provide a game start count down and game score counter with high score
// Challenge 8, Make the snake head move slightly faster as the game progresses
// DONE Challenge 9, Make the dying snake head explode and body whither away in an animation
// Challenge 10, Add periodically appearing enemy "bugs" that wander and vanish
// DONE: Challenge 11, Add snake food (mice) adn then grow the snakes length
// Challenge 12, Make a game configuration console to adjust difficulty and game options
// Stretch Challenge, Add an AI opponent snake that starts off facing down
// Optional: Game mode might allow optional diagonal moves using QEZC keys
// Extra credit: Break up code into a set of functions
// Extra credit: Invent new game play dynamics, changing maze obstacles?, smart AI enemies?

#include <stdio.h>
#include <stdlib.h>
#include "TermKeyAndTime.h"

#include "main.h"

#if SNAKE_1_TO_9

#define _UPSYM     "\u25B2"
#define _DOWNSYM   "\u25BC"
#define _LEFTSYM   "\u25C0"
#define _RIGHTSYM  "\u25BA"
#define _HEIGHT 23
#define _WIDTH  42
#define MOVE_MILLIS 200
#define SNAKE_MAX_LENGTH 100 // Change from 30 for testing to 200 or whatever maximum seems reasonable

char validation[] ="WSADwsad\033";  // validation for letters and ESC
int xPos[SNAKE_MAX_LENGTH];
int yPos[SNAKE_MAX_LENGTH];

void snake_1_to_9 (void) {
    bool ready;
    char newLetter;
    char letter;
    char * dir;
    int y, x;
    int head, tail, currentLength;
    int snakeLength;
    int score;
    uint64_t timeMillis, newTimeMillis;
    time_t t;
    int foodX, foodY;
    
    srand ((unsigned) time(&t));

    getchar ();

Start:
    init_getch ();   // turn off terminal character echoing
    
    clear_screen ();

    printf ("Press WSAD keys to move, ESC quits.\n");

// initialize snake tail arrays
    for (int i = 0; i < SNAKE_MAX_LENGTH; i++) {
        xPos[i] = 0;
        yPos[i] = 0;
    }
    head = 0;
    tail = 0;
    snakeLength = 20;   // snake starting length
    currentLength = head - tail;
    score = 0;

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
    newLetter = 'w';
    letter = 'w';
    
    dir = _UPSYM;
    y = 12; x = 21;
    position_cursor (y, x);
    board[y][x] = 'X';
    printf ("%s", dir);
    
    xPos[head] = x; // set snake segment in tail arrays
    yPos[head] = y;
    head++;

// choose first food location
    do {
        foodX = 2 + (rand() % (_WIDTH - 2));
        foodY = 3 + (rand() % (_HEIGHT - 3));
   } while (board[foodY][foodX] == 'X');
    position_cursor (foodY, foodX);
    printf ("\U0001F42D");
    
    timeMillis = get_time_in_milliseconds_since_boot ();
    newTimeMillis = timeMillis + MOVE_MILLIS;

// main game loop gets keystroke, moves player, tests for collision
    while (1) {
        ready = get_letter ( &newLetter );
        if (letter != newLetter ) {
            for (int i = 0; i < sizeof(validation); i++) {
                if (newLetter == validation[i]) {
                  letter = newLetter;
                }
            }
        }
        
        if (newTimeMillis < timeMillis) {      // instead of moving on a keystroke, move
            newTimeMillis = timeMillis + MOVE_MILLIS;  // based on time in milliseconds

            if (head >= tail) {
                currentLength = head - tail;
            } else {
                currentLength = (SNAKE_MAX_LENGTH - tail) + head;
            }
            if (currentLength == snakeLength) {
                if (0 != yPos[tail]) {  // erase end of snake tail
                    position_cursor (yPos[tail], xPos[tail]);
                    printf (" ");
                    board[yPos[tail]][xPos[tail]] = ' ';
                    tail++;
                    if (tail >= SNAKE_MAX_LENGTH) {
                        tail = 0;
                    }
                }
            }
            
            switch (letter) {  // Maybe add diagonals with QEZC keys?
                case 'w': case 'W': y =(y > 2)      ? y-1 : 2;       dir = _UPSYM;    break;
                case 's': case 'S': y =(y < _HEIGHT)? y+1 : _HEIGHT; dir = _DOWNSYM;  break;
                case 'a': case 'A': x =(x > 1)      ? x-1 : 1;       dir = _LEFTSYM;  break;
                case 'd': case 'D': x =(x < _WIDTH) ? x+1 : _WIDTH;  dir = _RIGHTSYM; break;
                case '\033': goto GAME_OVER;
                default: ;
            }
// check to see if we are about to eat some food
//            if (1) {  // to test mouse code enable this and disable next line
            if ((x == foodX) && (y == foodY)) {

                do {
                    foodX = 2 + (rand() % (_WIDTH - 2));
                    foodY = 3 + (rand() % (_HEIGHT - 3));
                } while (board[foodY][foodX] == 'X');
//                if ((foodX < 2) || (foodX >= _WIDTH) || (foodY < 3) || ( foodY >= _HEIGHT) )
//                    foodY = foodY;    // set breakpoint here to trap bad values
                position_cursor (foodY, foodX);
                printf("\U0001F42D");
                score++;
// grow snake length by one segment for each user input if it is a different direction
                snakeLength = (snakeLength < (SNAKE_MAX_LENGTH - 1)) ? snakeLength + 1 : snakeLength;
            }
                
            if (' ' != board[y][x]) {
                position_cursor (y, x);
                printf ("\U0001F4A5"); // Collision (explosion)y
                
                if (head > tail) {
                    for (int i = head - 1; i >= tail; i--) {
                        usleep (100000);
                        position_cursor (yPos[i], xPos[i]);
                        printf ("\U0001F525"); // fire
                        fflush (stdout);
                    }
                } else {    // handle case where tail is less than head
                    for (int i = head - 1; i >= 0; i--) {
                        usleep (100000);
                        position_cursor (yPos[i], xPos[i]);
                        printf ("\U0001F525"); // fire
                        fflush (stdout);
                    }
                    for (int i = SNAKE_MAX_LENGTH - 1; i >= tail; i--) {
                        usleep (100000);
                        position_cursor (yPos[i], xPos[i]);
                        printf ("\U0001F525"); // fire
                        fflush (stdout);
                    }
                }
GAME_OVER:
                position_cursor (1, 1);
                printf ("         *** GAME OVER ***           ");
                printf ("\a\a\a\a");
ASK_AGAIN:
                position_cursor (43, 0);
                printf ("Continue? y/n");
                letter = getchar ();
                switch (letter) {
                   case 'y': case 'Y': goto Start;
                   case 'n': case 'N': goto Exit;
                   default: goto ASK_AGAIN;
               }
            }
            board[y][x] = 'X';
            position_cursor (y, x);
            printf ("%s", dir); // Menlo 18pt Regular works well
            
            xPos[head] = x;
            yPos[head] = y;
            head++;
            if (head >= SNAKE_MAX_LENGTH) {
                head = 0;
            }
//            score++;
        }
        timeMillis = get_time_in_milliseconds_since_boot ();
        position_cursor (1, 40);
        printf ("snake length = %d, score = %d  ", currentLength, score);
        fflush (stdout);
    }
Exit:
  return;
}

#endif
