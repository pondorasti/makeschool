//
//  TermAndKey.c
//  CProgramming
//
//  Created by Shannon T Bailey on 3/25/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

// function to provide standard C printf like functionality
#include <stdarg.h>
void prt(char *fmt, ... ){

 return;

/*        char buf[80]; // resulting string limited to 80 chars
        va_list args;
        va_start (args, fmt );
        vsnprintf(buf, 80, fmt, args);
        va_end (args);
        Serial.print(buf);
*/
}

//#include "TermAndKey.h"
/*
uint64_t GetTimeInMillisecondsSinceBoot(void) {
    struct timespec time;
    
    clock_gettime (CLOCK_MONOTONIC, &time);
//    printf("tv_sec=%lu tv_nsec=%lu\n", time.tv_sec, time.tv_nsec);
    return (((uint64_t)time.tv_sec * 1000) + (time.tv_nsec / 1000000) );
}
*/
void InitGetch (void) { ; }

/*
void InitGetch (void) { // Set echo off to prevent glitching of echoed characters
    struct termios state;
    
    tcgetattr (STDIN_FILENO, &state);
    state.c_lflag &= ~(ICANON | ECHO);
    tcsetattr (STDIN_FILENO, TCSANOW, &state);
}

int getch(void) {  // A POSIX compatible version of getch() for OS/X
    char chbuf;
    struct termios oldstate, newstate;
    
    tcgetattr (STDIN_FILENO, &oldstate);
    newstate = oldstate;
    newstate.c_lflag &= ~(ICANON | ECHO);
    newstate.c_cc[VMIN] = 0;
    newstate.c_cc[VTIME] = 0;
    tcsetattr (STDIN_FILENO, TCSANOW, &newstate);
    read (STDIN_FILENO, &chbuf, 1);
    tcsetattr (STDIN_FILENO, TCSANOW, &oldstate);
    return chbuf;
}
*/

bool GetLetter (char * pLetter) {
    char letter;
    
//    letter = getch();
//    if (letter == 0) return false;
//    *pLetter = letter;

    if (0 == Serial.available() ) return false;
    *pLetter = Serial.read();

    return true;
}

void PositionCursor (int Y, int X) {
    prt ("\033[%d;%dH", Y, X);
}

void ClearScreen (void) {
    Serial.print ("\33c\e[3J");
    fflush (stdout);
    PositionCursor (1, 1);
    fflush (stdout);
}


