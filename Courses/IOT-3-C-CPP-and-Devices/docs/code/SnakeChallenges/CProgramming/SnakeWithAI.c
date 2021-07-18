//
//  SnakeWithAI.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 4/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//
// Snake game for OS/X terminal
// Colorful, challenging, pretty bug free, AI version with two AI algorithms to choose from
// Pressing 'p' turns on the graphical real-time distance map display used by the AI.
//  

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
// DONE: Stretch Challenge, Add an AI opponent snake that starts off facing down
// Optional: Game mode might allow optional diagonal moves using QEZC keys
// Extra credit: Break up code into a set of functions
// Extra credit: Invent new game play dynamics, changing maze obstacles?, smart AI enemies?

#include <stdio.h>
#include <stdlib.h>
#include "TermKeyAndTime.h"

#include "main.h"

#if SNAKE_WITH_AI

#define _UPSYM     "\u25B2"
#define _DOWNSYM   "\u25BC"
#define _LEFTSYM   "\u25C0"
#define _RIGHTSYM  "\u25BA"
#define _HEIGHT 23
#define _WIDTH  32
#define MOVE_MILLIS 200
#define SNAKE_MAX_LENGTH 100 // Change from 30 for testing to 200 or whatever maximum seems reasonable
#define _LIVE 1
#define _DEAD 0
#define _UP 'W'
#define _DOWN 'S'
#define _LEFT 'A'
#define _RIGHT 'D'

uint64_t timeMillis, newTimeMillis;
time_t t;

char board[_HEIGHT + 1][_WIDTH + 1];  // add +1 to compensate for zero index origin

char validation[] ="WSADwsad\033";  // validation for letters and ESC

bool ready;
char letter, newLetter;
int x, y;
char * sym;
int head, tail, currentLength;
int snakeLength;
int score;
int xPos[SNAKE_MAX_LENGTH];
int yPos[SNAKE_MAX_LENGTH];

int aiX, aiY;
char * aiSym;
int aiHead, aiTail, aiCurrentLength;
int aiSnakeLength;
int aiState;
int aiRespawn;
int aixPos[SNAKE_MAX_LENGTH];
int aiyPos[SNAKE_MAX_LENGTH];
char * aiDirections[] = {_UPSYM, _DOWNSYM, _LEFTSYM, _RIGHTSYM};

int foodX, foodY;

// scan array specifies Y,X pairs around current point used to create area distance map from food
int scanBoard[_HEIGHT + 1][_WIDTH + 1];  // add +1 to compensate for zero index origin

bool setPrint = false;

void doScan (int row, int col);
void doScan2 (int row, int col, int depth);
void setBoard (int row, int col, int value);
void dumpScan (void);

//---------------------------------------
void snake_with_ai (void) {

    srand ((unsigned) time(&t));

    getchar ();

Start:
    init_getch ();   // turn off terminal character echoing
    
    clear_screen ();

    printf ("Press WSAD keys to move, ESC quits.\n");
    printf ("During game play, press P to get AI distance map real-time display.\n");

// initialize snake tail arrays
    for (int i = 0; i < SNAKE_MAX_LENGTH; i++) {
        xPos[i] = 0;
        yPos[i] = 0;
        aixPos[i] = 0;
        aiyPos[i] = 0;
    }
    head = aiHead = 0;
    tail = aiTail = 0;
    snakeLength = aiSnakeLength = 20;   // snake starting length
    score = 0;

// initialize the board array to blank
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
        printf ("\u2588\n");
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

// initialize and draw player starting position
    newLetter = _UP;
    letter = _UP;
    
    sym = _UPSYM;
    x = 16; y = 12;
    position_cursor (y, x);
    board[y][x] = 'X';
    printf ("%s", sym);
    xPos[head] = x; // set snake segments in tail arrays
    yPos[head] = y;
    head++;

// initialize and draw AI starting position
    aiSym = _DOWNSYM;
    aiX = 16; aiY = 13;
    position_cursor (aiY, aiX);
    board[aiY][aiX] = 'X';
    printf ("\e[0;31m%s\e[0m", aiSym);
    aixPos[aiHead] = aiX; // set snake segments in tail arrays
    aiyPos[aiHead] = aiY;
    aiHead++;
    aiState = _LIVE;
    
// choose first food location
    do {
        foodX = 2 + (rand() % (_WIDTH - 2));
        foodY = 3 + (rand() % (_HEIGHT - 3));
   } while ('X' == board[foodY][foodX]);

// JUST FOR TESTING
// foodY = 4; foodX = 24;
   
    position_cursor (foodY, foodX);
    printf ("\U0001F42D");

// initialize game timing
    timeMillis = get_time_in_milliseconds_since_boot ();
    newTimeMillis = timeMillis + MOVE_MILLIS;

// main game loop gets keystroke, moves player, tests for collision
    while (1) {
        ready = get_letter ( &newLetter );
        if (letter != newLetter ) {
        
            if (newLetter == 'p')
                setPrint = true;
        
            for (int i = 0; i < sizeof(validation); i++) {
                if (newLetter == validation[i]) {
                  letter = newLetter;
                }
            }
        }
// instead of moving on a keystroke ready, move on timer event
        if (newTimeMillis < timeMillis) {
            newTimeMillis = timeMillis + MOVE_MILLIS;

// remove tail segments
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

// use player key presses
            switch (letter) {
                case 'w': case 'W': y =(y > 2)      ? y-1 : 2;       sym = _UPSYM;    break;
                case 's': case 'S': y =(y < _HEIGHT)? y+1 : _HEIGHT; sym = _DOWNSYM;  break;
                case 'a': case 'A': x =(x > 1)      ? x-1 : 1;       sym = _LEFTSYM;  break;
                case 'd': case 'D': x =(x < _WIDTH) ? x+1 : _WIDTH;  sym = _RIGHTSYM; break;
                case '\033': goto GAME_OVER;
                default: ;
            }
// check to see if we are about to eat some food
            if ((x == foodX) && (y == foodY)) {

                do {
                    foodX = 2 + (rand() % (_WIDTH - 2));
                    foodY = 3 + (rand() % (_HEIGHT - 3));
                } while (board[foodY][foodX] == 'X');
                position_cursor (foodY, foodX);
                printf("\U0001F42D");
                score++;
// grow snake length by one segment
                snakeLength = (snakeLength < (SNAKE_MAX_LENGTH - 1)) ? snakeLength + 1 : snakeLength;

// update the player score info, etc.
                position_cursor (1, 40);
                printf ("snake length = %d, score = %d  ", currentLength, score);
                fflush (stdout);
            }

// check to see if the player has crashed snake head into obstacle
            if (' ' != board[y][x]) {
                position_cursor (y, x);
                printf ("\U0001F4A5"); // Collision (explosion)

// draw the player snake tail turning to flames
                if (head > tail) {  // case where head greater than tail in circular queue
                    for (int i = head - 1; i >= tail; i--) {
                        usleep(100000);
                        position_cursor (yPos[i], xPos[i]);
                        printf ("\U0001F525"); // fire
                        fflush (stdout);
                    }
                } else {    // handle case where tail is greater than head in circular queue
                    for (int i = head - 1; i >= 0; i--) {
                        usleep(100000);
                        position_cursor (yPos[i], xPos[i]);
                        printf ("\U0001F525"); // fire
                        fflush (stdout);
                    }
                    for (int i = SNAKE_MAX_LENGTH - 1; i >= tail; i--) {
                        usleep(100000);
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
                letter = getchar();
                switch (letter) {
                   case 'y': case 'Y': goto Start;
                   case 'n': case 'N': goto Exit;
                   default: goto ASK_AGAIN;
               }
            }
// draw new snake head
            board[y][x] = 'X';
            position_cursor (y, x);
            printf ("%s", sym); // Menlo 18pt Regular works well
            fflush(stdout);

// add new snake head to circular queue
            xPos[head] = x;
            yPos[head] = y;
            head++;
            if (head >= SNAKE_MAX_LENGTH) {
                head = 0;
            }

//------------------------
// AI code
            if (aiState == _LIVE) {
            
// remove AI tail segments
                if (aiHead >= aiTail) {
                    aiCurrentLength = aiHead - aiTail;
                } else {
                    aiCurrentLength = (SNAKE_MAX_LENGTH - aiTail) + aiHead;
                }
                if (aiCurrentLength == aiSnakeLength) {
                    if (0 != aiyPos[aiTail]) {  // erase end of ai snake tail
                        position_cursor (aiyPos[aiTail], aixPos[aiTail]);
                        printf (" ");
                        board[aiyPos[aiTail]][aixPos[aiTail]] = ' ';
                        aiTail++;
                        if (aiTail >= SNAKE_MAX_LENGTH) {
                            aiTail = 0;
                        }
                    }
                }
            
// process the AI's thinking
// initialize the scan board array to blank
                for (int iy = 0; iy <= _HEIGHT; iy++) {
                    for (int ix = 0; ix <= _WIDTH; ix++) {
                        if (' ' == board[iy][ix])
                            scanBoard[iy][ix] = 30000;    // set to insanely far distance
                        else scanBoard[iy][ix] = 32000;    // set to insanely far distance
                    }
                }
 
// do recursive scan from food position to all reachable board positions creating distance array
                setBoard (foodY, foodX, 0);
                doScan (foodY, foodX);
                if (setPrint) {
                    dumpScan ();
                }

// from current position, AI determines best path to move using 'scanBoard' distance array
                int options[4];
                options[0] = scanBoard[aiY - 1][aiX];
                options[1] = scanBoard[aiY + 1][aiX];
                options[2] = scanBoard[aiY][aiX - 1];
                options[3] = scanBoard[aiY][aiX + 1];
                
                int min = options[0];
                int minIndex = 0;
                for (int i = 1; i < 4; i++) {
                    if (options[i] < min) {
                        min = options[i];
                        minIndex = i;
                    }
                }
                
                int scanArray[4][2] = { {-1, 0},{1, 0},{0, -1},{0, 1} };

                aiY += scanArray[minIndex][0];
                aiX += scanArray[minIndex][1];
                
                aiSym = aiDirections[minIndex];
            
// check to see if despite best efforts, AI snake has crashed into obstacle
                if (' ' != board[aiY][aiX]) {
                    aiState = _DEAD;
                    aiRespawn = 30 + rand() % 30;
                    position_cursor (aiY, aiX);
                    if ((aiY > 2) && (aiY < _HEIGHT) && (aiX > 1) && (aiX < _WIDTH) )
                        board[aiY][aiX] = ' ';  // don't delete bounding box section
                    printf ("\U0001F4A5"); // Collision (explosion)

// draw the AI snake tail catching fire, then disappearing
                    if (aiHead > aiTail) {  // case where head greater than tail in circular queue
                        for (int i = aiHead - 1; i >= aiTail; i--) {
                            usleep (100000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            printf ("\U0001F525"); // fire
                            fflush (stdout);
                        }
                    } else {    // handle case where tail is greater than head in circular queue
                        for (int i = aiHead - 1; i >= 0; i--) {
                            usleep (100000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            printf ("\U0001F525"); // fire
                            fflush (stdout);
                        }
                        for (int i = SNAKE_MAX_LENGTH - 1; i >= aiTail; i--) {
                            usleep (100000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            printf ("\U0001F525"); // fire
                            fflush (stdout);
                        }
                    }
                    usleep(1000000);
                    position_cursor (aiY, aiX);
                    if ((aiY > 2) && (aiY < _HEIGHT) && (aiX > 1) && (aiX < _WIDTH) )
                        printf (" ");
                    else
                        printf ("\u2588");  // restore bounding box if AI crashed into it
                    
                    if (aiHead > aiTail) {  // case where head greater than tail in circular queue
                        for (int i = aiHead - 1; i >= aiTail; i--) {
                            usleep (10000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            printf (" ");
                            fflush (stdout);
                        }
                    } else {    // handle case where tail is greater than head in circular queue
                        for (int i = aiHead - 1; i >= 0; i--) {
                            usleep (10000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            printf (" ");
                            fflush (stdout);
                        }
                        for (int i = SNAKE_MAX_LENGTH - 1; i >= aiTail; i--) {
                            usleep (10000);
                            position_cursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            printf (" ");
                            fflush (stdout);
                        }
                    }

                }

                if (aiState == _LIVE) {
// draw AI snake head in new position
                    board[aiY][aiX] = 'X';
                    position_cursor (aiY, aiX);
                    printf ("\e[0;31m%s\e[0m", aiSym); // Menlo 18pt Regular works well
                    fflush (stdout);
                    
// add new snake head to circular queue
                    aixPos[aiHead] = aiX;
                    aiyPos[aiHead] = aiY;
                    aiHead++;
                    if (aiHead >= SNAKE_MAX_LENGTH) {
                        aiHead = 0;
                    }

// check in AI snake has eaten a mouse food
                    if ((aiX == foodX) && (aiY == foodY)) {
                        do {
                            foodX = 2 + (rand() % (_WIDTH - 2));
                            foodY = 3 + (rand() % (_HEIGHT - 3));
                        } while (board[foodY][foodX] == 'X');
                        position_cursor (foodY, foodX);
                        printf ("\U0001F42D");
                        fflush (stdout);
                
// grow ai snake length by one segment
                        aiSnakeLength = (aiSnakeLength < (SNAKE_MAX_LENGTH - 1)) ? aiSnakeLength + 1 : aiSnakeLength;
                    }
                }
            } else { // AI snake is currently dead and waiting to respawn
                if (0 == --aiRespawn) {
// choose new AI snake head location
                    do {
                        aiX = 5 + (rand() % (_WIDTH - 8));  // keep away from edge
                        aiY = 6 + (rand() % (_HEIGHT - 9));
                    } while ('X' == board[foodY][foodX]);
                    aiHead = 0;
                    aiTail = 0;
                    aiSnakeLength = 20;   // snake starting length
                    aiSym = aiDirections[rand() % 4];
                    board[aiY][aiX] = 'X';
                    position_cursor (aiY, aiX);
                    printf ("\e[0;31m%s\e[0m", aiSym); // Menlo 18pt Regular works well
                    fflush (stdout);

                    aixPos[aiHead] = aiX; // set snake segments in tail arrays
                    aiyPos[aiHead] = aiY;
                    aiHead++;
                    aiState = _LIVE;
                }
            }
        } // end of snake update on timer event
        
// update game timer
        timeMillis = get_time_in_milliseconds_since_boot ();
    }
    
Exit:
  return;
}


// starting at food y,x location, scan the board setting distance values.
// Scans left then up and down, and then right and up and down recursively
// to all reachable positions.

// Algorithm often produces very long paths to the food but fills all
// positions with a distance that leads to the food.  This allows the
// AI to always make reasonable decisions that keep it from running
// into itself.

/*
void doScan (int row, int col) {
    if (' ' == board[foodY - 1][foodX]) {
        doScan2 (foodY - 1, foodX, 0);
    } else {
        if (' ' == board[foodY + 1][foodX]) {
            doScan2 (foodY + 1, foodX, 0);
        } else {
            if (' ' == board[foodY][foodX - 1]) {
                doScan2 (foodY, foodX - 1, 0);
            } else {
                if (' ' == board[foodY][foodX + 1]) {
                    doScan2 (foodY, foodX + 1, 0);
                }
            }
        }
    }
}


void doScan2 (int row, int col, int depth) {
    int min = 30000;
    
    if (30000 == scanBoard[row][col]) {
        if (min > scanBoard[row - 1][col])
            min = scanBoard[row - 1][col];
        if (min > scanBoard[row + 1][col])
            min = scanBoard[row + 1][col];
        if (min > scanBoard[row][col - 1])
            min = scanBoard[row][col - 1];
        if (min > scanBoard[row][col + 1])
            min = scanBoard[row][col + 1];
        
        setBoard (row, col, min + 1);

        if (30000 == scanBoard[row - 1][col]) {
            doScan2 (row - 1, col, 0);
        }
        if (30000 == scanBoard[row + 1][col]) {
            doScan2 (row + 1, col, 0);
        }
        if (30000 == scanBoard[row][col - 1]) {
            doScan2 (row, col - 1, 0);
        }
        if (30000 == scanBoard[row][col + 1]) {
            doScan2 (row, col + 1, 0);
        }
    }
}
*/

// algorithm limits the depth of recursion and attempts to cover
// the board by using neighboring values that have been set in a first
// depth limit area.  It often covers the entire board but
// also frequently leaves huge areas unset if the initial area
// is blocked by tails being close to the food.
// This AI code produces some unexpected behavior in some situations that
// makes it less predictable.  It can be corraled down a single wide
// alley and killed, though that is still hard to accomplish.  It sometimes
// will make poor decisions when map distance data is unavailable
// such as entering the area it is occupying and run into itself.

void doScan (int row, int col) {
    doScan2 (row, col, 6);
    
    for (int depth = 2; depth < 30; depth++) {
        for (int i = -depth; i <= depth; i++) {
            for (int z = -depth; z <= depth; z++)
            doScan2 (row + i, col + z, 3);
        }
    }
}

void doScan2 (int row, int col, int depth) {
int min, val;

    if ((row > 2) && (row < _HEIGHT) && (col > 1) && (col < _WIDTH) ) {
        min = scanBoard[row][col];
        
        if (30000 >= min) {
            if (30000 >= (val = scanBoard[row - 1][col]) ) {
                if (30000 == val)
                    setBoard (row - 1, col, min + 1);
                if (depth > 1)
                doScan2 (row - 1, col, depth - 1);
            }
            if (30000 >= (val = scanBoard[row + 1][col]) ) {
                if (30000 == val)
                    setBoard (row + 1, col, min + 1);
                if (depth > 1)
                    doScan2 (row + 1, col, depth - 1);
            }
            if (30000 >= (val = scanBoard[row][col - 1]) ) {
                if (30000 == val)
                    setBoard (row, col - 1, min + 1);
                if (depth > 1)
                    doScan2 (row, col - 1, depth - 1);
            }
            if (30000 >= (val = scanBoard[row][col + 1]) ) {
                if (30000 == val)
                    setBoard (row, col + 1, min + 1);
                if (depth > 1)
                    doScan2 (row, col + 1, depth - 1);
            }
        }
    }
}


// avoid setting values out of bounds
void setBoard (int row, int col, int value) {
    if ((row > 2) && (row < _HEIGHT) && (col > 1) && (col < _WIDTH) )
        scanBoard[row][col] = value;
}

// display the distance map data in real-time with the game board
void dumpScan (void) {
    position_cursor (24, 1);
    for (int row = 2; row <= _HEIGHT; row++) {
        for (int col = 1; col <= _WIDTH; col++) {
            int value = scanBoard[row][col];
            if (100 > value) {
                printf ("%2d ", scanBoard[row][col]);
            } else {
                if (value == 32000) {
                    printf ("\u2588\u2588 ");
                } else {
                    printf ("99 ");
                }
            }
        }
        printf ("\n");
    }
// enable to step one move at a time for testing
//    newLetter = getchar ();
}

#endif
