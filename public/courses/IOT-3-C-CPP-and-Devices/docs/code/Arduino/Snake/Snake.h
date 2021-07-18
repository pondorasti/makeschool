//---------------------------------------

#define _UPSYM     "\u25B2"
#define _DOWNSYM   "\u25BC"
#define _LEFTSYM   "\u25C0"
#define _RIGHTSYM  "\u25BA"
#define _HEIGHT 34
#define _WIDTH  24
#define MOVE_MILLIS 200
#define SNAKE_MAX_LENGTH 100 // Change from 30 for testing to 200 or whatever maximum seems reasonable
#define _LIVE 1
#define _DEAD 0
#define _UP 'W'
#define _DOWN 'S'
#define _LEFT 'A'
#define _RIGHT 'D'
#define _AI_UP 'I'
#define _AI_DOWN 'K'
#define _AI_LEFT 'J'
#define _AI_RIGHT 'L'


// scan array specifies Y,X pairs around current point used to create area distance map from food
int scanBoard[_HEIGHT + 1][_WIDTH + 1];  // add +1 to compensate for zero index origin

bool setPrint = false;

void doScan (int row, int col);
void doScan2 (int row, int col, int depth);
void setBoard (int row, int col, int value);
void dumpScan (void);

void DrawOnLCD (void);

int SnakeGame(void) {
bool AI = false;  // press and hold player 1 RED button to start AI opponent game

uint32_t timeMillis, newTimeMillis;

char board[_HEIGHT + 1][_WIDTH + 1];  // add +1 to compensate for zero index origin

char validation[]   = "WSADwsad\033";  // validation for letters and ESC
char AIvalidation[] = "IJKLijkl\033";  // validation for AI letters and ESC

bool ready;
char letter, newLetter, aiLetter;
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
int aiScore;
int aiState;
int aiRespawn;
int aixPos[SNAKE_MAX_LENGTH];
int aiyPos[SNAKE_MAX_LENGTH];
char * aiDirections[] = {_UPSYM, _DOWNSYM, _LEFTSYM, _RIGHTSYM};

int foodX, foodY;

    srand(millis());

Start:
    if (!digitalRead(P1_RED) )
        AI = true;
    else
        AI = false;
        
    ClearScreen ();

    DrawOnLCD();

    prt ("Press WSAD keys to move, ESC quits.\n");

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
    score = aiScore = 0;

// initialize the board array to blank
    for (y = 1; y < _HEIGHT; y++) {
        for (x = 1; x < _WIDTH; x++) {
            board[y][x] = ' ';
        }
    }

// draw box around playfield
    for (y = 2; y <= _HEIGHT; y++) {
        PositionCursor (y, 1);
        prt ("\u2588");
        PositionCursor (y, _WIDTH);
        prt ("\u2588\n");
        board[y][1]      = 'X';
        board[y][_WIDTH] = 'X';
    }
    for (x = 2; x < _WIDTH; x++) {
        PositionCursor (2, x);
        prt ("\u2588");
        PositionCursor (_HEIGHT, x);
        prt ("\u2588");
        board[2][x]       = 'X';
        board[_HEIGHT][x] = 'X';
    }

// initialize and draw player starting position
    newLetter = _UP;
    letter = _UP;
    
    sym = _UPSYM;
    x = 13; y = 17;
    PositionCursor (y, x);
    board[y][x] = 'X';
    prt ("%s", sym);
    myGLCD.setColor(0, 0, 255);
    myGLCD.fillRect(-22 + x * 14, -18 + y * 14, -10 + x * 14, -6 + y * 14);
    xPos[head] = x; // set snake segments in tail arrays
    yPos[head] = y;
    head++;
    myGLCD.setBackColor(255, 0, 0);
    myGLCD.setColor(255, 255, 255);
    myGLCD.printNumI(score, 180, 1);

// initialize and draw AI starting position
    aiSym = _DOWNSYM;
    aiX = 13; aiY = 18;
    PositionCursor (aiY, aiX);
    board[aiY][aiX] = 'X';
    prt ("\e[0;31m%s\e[0m", aiSym); // set AI to red in terminal then set symbol and reset back to black
    myGLCD.setColor(0, 255, 0);
    myGLCD.fillRect(-22 + aiX * 14, -18 + aiY * 14, -10 + aiX * 14, -6 + aiY * 14);
    aixPos[aiHead] = aiX; // set snake segments in tail arrays
    aiyPos[aiHead] = aiY;
    aiHead++;
    aiState = _LIVE;
    aiLetter = _AI_DOWN;
    myGLCD.setBackColor(255, 0, 0);
    myGLCD.setColor(255, 255, 255);
    myGLCD.setRotation(2);
    myGLCD.printNumI(aiScore, 180, 465);
    myGLCD.setRotation(0);
              
    
// choose first food location
    do {
        foodX = 2 + (rand() % (_WIDTH - 2));
        foodY = 3 + (rand() % (_HEIGHT - 3));
   } while ('X' == board[foodY][foodX]);

// JUST FOR TESTING
// foodY = 4; foodX = 24;
   
    PositionCursor (foodY, foodX);
    prt("\U0001F42D");
    myGLCD.setColor(255, 0, 0);
    myGLCD.fillRect(-22 + foodX * 14, -18 + foodY * 14, -10 + foodX * 14, -6 + foodY * 14);
 
// initialize game timing
    timeMillis = millis();
    newTimeMillis = timeMillis + MOVE_MILLIS;

// main game loop gets keystroke, moves player, tests for collision
    while (1) {
      int xval, yval;
        ready = GetLetter ( & newLetter );
        GetPlayerButtons (1, & newLetter );
        if (letter != newLetter ) {
        
            if (newLetter == 'p')
                setPrint = true;
        
            for (int i = 0; i < sizeof(validation); i++) {
                if (newLetter == validation[i]) {
                  letter = newLetter;
                }
                if (!AI) {
                    if (newLetter == AIvalidation[i]) {
                      aiLetter = newLetter;
                    }
                }
            }
        }

        if (!AI) {
            GetPlayerButtons (2, & aiLetter );
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
                    PositionCursor (yPos[tail], xPos[tail]);
                    prt (" ");
                    myGLCD.setColor(0, 0, 0);
                    myGLCD.fillRect(-22 + xPos[tail] * 14, -18 + yPos[tail] * 14, -10 + xPos[tail] * 14, -6 + yPos[tail] * 14);
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
                PositionCursor (foodY, foodX);
                prt("\U0001F42D");
                myGLCD.setColor(255, 0, 0);
                myGLCD.fillRect(-22 + foodX * 14, -18 + foodY * 14, -10 + foodX * 14, -6 + foodY * 14);

                score++;    
                myGLCD.setBackColor(255, 0, 0);   
                myGLCD.setColor(255, 255, 255);
                myGLCD.printNumI(score, 180, 1);
                
// grow snake length by one segment
                snakeLength = (snakeLength < (SNAKE_MAX_LENGTH - 1)) ? snakeLength + 1 : snakeLength;

// update the player score info, etc.
                PositionCursor (1, 40);
                prt ("snake length = %d, score = %d  ", currentLength, score);
                fflush (stdout);
            }

// check to see if the player has crashed snake head into obstacle
            if (' ' != board[y][x]) {
                PositionCursor (y, x);
                prt ("\U0001F4A5"); // Collision (explosion)

// draw the player snake tail turning to flames
                if (head > tail) {  // case where head greater than tail in circular queue
                    for (int i = head - 1; i >= tail; i--) {
                        delay (100);
                        PositionCursor (yPos[i], xPos[i]);
                        prt ("\U0001F525"); // fire
                        myGLCD.setColor(255, 0, 0);
                        myGLCD.fillRect(-22 + xPos[i] * 14, -18 + yPos[i] * 14, -10 + xPos[i] * 14, -6 + yPos[i] * 14);
                        fflush (stdout);
                    }
                } else {    // handle case where tail is greater than head in circular queue
                    for (int i = head - 1; i >= 0; i--) {
                        delay (100);
                        PositionCursor (yPos[i], xPos[i]);
                        prt ("\U0001F525"); // fire
                        myGLCD.setColor(255, 0, 0);
                        myGLCD.fillRect(-22 + xPos[i] * 14, -18 + yPos[i] * 14, -10 + xPos[i] * 14, -6 + yPos[i] * 14);
                       fflush (stdout);
                    }
                    for (int i = SNAKE_MAX_LENGTH - 1; i >= tail; i--) {
                        delay (100);
                        PositionCursor (yPos[i], xPos[i]);
                        prt ("\U0001F525"); // fire
                        myGLCD.setColor(255, 0, 0);
                        myGLCD.fillRect(-22 + xPos[i] * 14, -18 + yPos[i] * 14, -10 + xPos[i] * 14, -6 + yPos[i] * 14);
                        fflush (stdout);
                    }
                }
GAME_OVER:
                PositionCursor (1, 1);
                prt ("         *** GAME OVER ***           ");
                prt ("\a\a\a\a");
/*
ASK_AGAIN:
                PositionCursor (43, 0);
                prt ("Continue? y/n");
                while (GetLetter ( & letter ) )
                  ;
                switch (letter) {
                   case 'y': case 'Y': goto Start;
                   case 'n': case 'N': goto Exit;
                   default: goto ASK_AGAIN;
               }
*/              delay (5000);
                goto Start;
            }
// draw new snake head
            board[y][x] = 'X';
            PositionCursor (y, x);
            prt ("%s", sym); // Menlo 18pt Regular works well
            fflush(stdout);
            myGLCD.setColor(0, 0, 255);
            myGLCD.fillRect(-22 + x * 14, -18 + y * 14, -10 + x * 14, -6 + y * 14);

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
                        PositionCursor (aiyPos[aiTail], aixPos[aiTail]);
                        prt (" ");
                        myGLCD.setColor(0, 0, 0);
                        myGLCD.fillRect(-22 + aixPos[aiTail] * 14, -18 + aiyPos[aiTail] * 14, -10 + aixPos[aiTail] * 14, -6 + aiyPos[aiTail] * 14);
                        board[aiyPos[aiTail]][aixPos[aiTail]] = ' ';
                        aiTail++;
                        if (aiTail >= SNAKE_MAX_LENGTH) {
                            aiTail = 0;
                        }
                    }
                }

                if (AI) {
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

                } else {
// use player key presses
                    GetPlayerButtons (2, & aiLetter );
                    switch (aiLetter) {
                        case 'i': case 'I': aiY =(aiY > 2)      ? aiY-1 : 2;       aiSym = _UPSYM;    break;
                        case 'k': case 'K': aiY =(aiY < _HEIGHT)? aiY+1 : _HEIGHT; aiSym = _DOWNSYM;  break;
                        case 'j': case 'J': aiX =(aiX > 1)      ? aiX-1 : 1;       aiSym = _LEFTSYM;  break;
                        case 'l': case 'L': aiX =(aiX < _WIDTH) ? aiX+1 : _WIDTH;  aiSym = _RIGHTSYM; break;
                        case '\033': goto GAME_OVER;
                        default: ;
                    }
                }
                
// check to see if despite best efforts, AI snake has crashed into obstacle
                if (' ' != board[aiY][aiX]) {
                    aiState = _DEAD;
                    aiRespawn = 30 + rand() % 30;
                    PositionCursor (aiY, aiX);
                    if ((aiY > 2) && (aiY < _HEIGHT) && (aiX > 1) && (aiX < _WIDTH) )
                        board[aiY][aiX] = ' ';  // don't delete bounding box section
                    prt ("\U0001F4A5"); // Collision (explosion)

// draw the AI snake tail catching fire, then disappearing
                    if (aiHead > aiTail) {  // case where head greater than tail in circular queue
                        for (int i = aiHead - 1; i >= aiTail; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            prt ("\U0001F525"); // fire
                            myGLCD.setColor(255, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                            fflush (stdout);
                        }
                    } else {    // handle case where tail is greater than head in circular queue
                        for (int i = aiHead - 1; i >= 0; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            prt ("\U0001F525"); // fire
                            myGLCD.setColor(255, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                            fflush (stdout);
                        }
                        for (int i = SNAKE_MAX_LENGTH - 1; i >= aiTail; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            prt ("\U0001F525"); // fire
                            myGLCD.setColor(255, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                            fflush (stdout);
                        }
                    }
                    if (!AI) {
                        goto GAME_OVER;
                    }
                    
                    delay(1000);
                    PositionCursor (aiY, aiX);
                    if ((aiY > 2) && (aiY < _HEIGHT) && (aiX > 1) && (aiX < _WIDTH) )
                        prt (" ");
                    else
                        prt ("\u2588");  // restore bounding box if AI crashed into it
                    
                    if (aiHead > aiTail) {  // case where head greater than tail in circular queue
                        for (int i = aiHead - 1; i >= aiTail; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            prt (" ");
                            fflush (stdout);
                            myGLCD.setColor(0, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                       }
                    } else {    // handle case where tail is greater than head in circular queue
                        for (int i = aiHead - 1; i >= 0; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            prt (" ");
                            fflush (stdout);
                            myGLCD.setColor(0, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                       }
                        for (int i = SNAKE_MAX_LENGTH - 1; i >= aiTail; i--) {
                            delay (100);
                            PositionCursor (aiyPos[i], aixPos[i]);
                            board[aiyPos[i]][aixPos[i]] = ' ';
                            prt (" ");
                            fflush (stdout);
                            myGLCD.setColor(0, 0, 0);
                            myGLCD.fillRect(-22 + aixPos[i] * 14, -18 + aiyPos[i] * 14, -10 + aixPos[i] * 14, -6 + aiyPos[i] * 14);
                       }
                    }

                }

                if (aiState == _LIVE) {
// draw AI snake head in new position
                    board[aiY][aiX] = 'X';
                    PositionCursor (aiY, aiX);
                    prt ("\e[0;31m%s\e[0m", aiSym); // Menlo 18pt Regular works well
                    fflush(stdout);
                    myGLCD.setColor(0, 255, 0);
                    myGLCD.fillRect(-22 + aiX * 14, -18 + aiY * 14, -10 + aiX * 14, -6 + aiY * 14);                    
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
                        PositionCursor (foodY, foodX);
                        prt("\U0001F42D");
                        fflush(stdout);
                        myGLCD.setColor(255, 0, 0);
                        myGLCD.fillRect(-22 + foodX * 14, -18 + foodY * 14, -10 + foodX * 14, -6 + foodY * 14);
                      
                        aiScore++;
                        myGLCD.setBackColor(255, 0, 0);
                        myGLCD.setColor(255, 255, 255);
                        myGLCD.setRotation(2);
                        myGLCD.printNumI(aiScore, 180, 465);
                        myGLCD.setRotation(0);
                
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
                    PositionCursor (aiY, aiX);
                    prt ("\e[0;31m%s\e[0m", aiSym); // Menlo 18pt Regular works well
                    fflush(stdout);

                    aixPos[aiHead] = aiX; // set snake segments in tail arrays
                    aiyPos[aiHead] = aiY;
                    aiHead++;
                    aiState = _LIVE;
                }
            }
        } // end of snake update on timer event
        
// update game timer
        timeMillis = millis();
    }
    
Exit:
  return 0;
}



// algorithm limits the depth of recursion and attempts to cover
// the board by using neighboring values that have been set in a first
// depth limit area.  It often covers the entire board but
// also frequently leaves huge areas unset if the initial area
// is blocked by tails being close to the food.
// This AI code produces some hard to predict behavior that makes
// the AI less predictable.  It can be corraled down a single wide
// alley and killed which is still hard to arrange.  It sometimes
// will make poor decisions when map distance data is unavailable
// int the location it is occupying and run into itself.

void doScan (int row, int col) {
    doScan2 (row, col, 6);
    
    for (int depth = 2; depth < 10; depth++) {
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
    PositionCursor (24, 1);
    for (int row = 2; row <= _HEIGHT; row++) {
        for (int col = 1; col <= _WIDTH; col++) {
            int value = scanBoard[row][col];
            if (100 > value) {
                prt ("%2d ", scanBoard[row][col]);
            } else {
                if (value == 32000) {
                    prt ("\u2588\u2588 ");
                } else {
                    prt ("99 ");
                }
            }
        }
        prt ("\r\n");
    }
}

void DrawOnLCD (void) {
    myGLCD.clrScr();    // Clear the screen and draw the frame

    myGLCD.setTextSize(2);
    myGLCD.setColor(255, 0, 0);
    myGLCD.fillRect(0, 0, 320, 15);
    myGLCD.fillRect(0, 464, 320, 479);
    myGLCD.setColor(255, 255, 255);
    myGLCD.setBackColor(255, 0, 0);
    myGLCD.print("SNAKE SCORE =", 0, 0);

    myGLCD.setRotation(2);
    myGLCD.print("SNAKE SCORE =", 319, 449);  //, 180); rotation not working
    myGLCD.setRotation(0);

    myGLCD.setBackColor(0, 0, 0);
    myGLCD.setColor(0, 0, 255);
    myGLCD.drawRect(0, 18, 319, 461); 
}

