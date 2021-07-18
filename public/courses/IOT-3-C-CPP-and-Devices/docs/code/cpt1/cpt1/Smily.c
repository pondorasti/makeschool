//
//  Smily.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"
#include "TermKeyAndTime.h"

//------------------------------------------------------------
// STARTING POINT - MAKE NAVIGATABLE SMILY CHARACTER
#define SMILY_CHARACTER "\U0001F60A"

void smily (void) {
    bool ready;
    char letter;
    uint64_t timeMillis;
    
    init_getch ();   // turn off terminal character echoing
    
    clear_screen ();    printf ("Press WSAD keys to move, ESC quits.\n");
    
    int y = 10;
    int x = 20;
    position_cursor (y, x);
    printf ("%s", SMILY_CHARACTER);
    
    do {
        ready = get_letter ( &letter );
        if (ready) {
            position_cursor (y, x);
            printf (" ");
            
            switch (letter) {  // Add diagonals with QEZC?
                case 'w': case 'W': y = (y > 2)  ? y-1 : 2;  break;
                case 's': case 'S': y = (y < 20) ? y+1 : 20; break;
                case 'a': case 'A': x = (x > 1)  ? x-1 : 1;  break;
                case 'd': case 'D': x = (x < 40) ? x+1 : 40; break;
                default: ;
            }
            position_cursor (y, x);
            printf ("%s", SMILY_CHARACTER); // Menlo 18pt Regular works well
        }
        timeMillis = get_time_in_milliseconds_since_boot();
        position_cursor (1, 40);
        printf ("y = %d, x = %d, time = %llu  ", y, x, timeMillis);
        fflush (stdout);
    } while (letter != '\033'); // esc key
}
