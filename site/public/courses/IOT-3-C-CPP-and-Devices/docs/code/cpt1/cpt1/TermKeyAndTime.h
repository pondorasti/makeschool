//
//  TermKeyAndTime.h
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 3/25/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#ifndef TermKeyAndTime_h
#define TermKeyAndTime_h

#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include <sys/types.h>
#include <termios.h>
#include <unistd.h>

void position_cursor (int Y, int X);
void clear_screen (void);
void init_getch (void);
int getch(void);
bool get_letter (char * pLetter);
uint64_t get_time_in_milliseconds_since_boot(void);

#endif /* TermKeyAndTime_h */
