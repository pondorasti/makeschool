//
//  TermKeyAndTime.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 3/25/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "TermKeyAndTime.h"

void position_cursor (int Y, int X) {
    printf ("\033[%d;%dH", Y, X);
}

void clear_screen (void) {
    printf ("\33c\e[3J");
    fflush (stdout);
}

void init_getch (void) { // Set echo off to prevent glitching of echoed characters
    struct termios state;
    
    tcgetattr (STDIN_FILENO, &state);
    state.c_lflag &= ~(ICANON | ECHO);
    tcsetattr (STDIN_FILENO, TCSANOW, &state);
}

int getch (void) {  // A POSIX compatible version of getch() for OS/X
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

bool get_letter (char * pLetter) {
    char letter;
    
    letter = getch();
    if (letter == 0) return false;
    *pLetter = letter;
    return true;
}

uint64_t get_time_in_milliseconds_since_boot (void) {
    struct timespec time;
    
    clock_gettime (CLOCK_MONOTONIC, &time);
//    printf("tv_sec=%lu tv_nsec=%lu\n", time.tv_sec, time.tv_nsec);
    return (((uint64_t)time.tv_sec * 1000) + (time.tv_nsec / 1000000) );
}
