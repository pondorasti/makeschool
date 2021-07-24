//
//  TestTermKeyAndTime.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"
#include "TermKeyAndTime.h"

//-------------------------------------------------
// STANDARD LIBRARIES (uses TermKeyAndTime.c functions)

void test_term_key_and_time (void) {
    bool ready;
    char letter;
    uint64_t timeMillis;
    
    init_getch ();   // turn off terminal character echoing
    
    clear_screen ();
    
    printf ("Press some letter keys to see position_cursor operate, ESC quits.\n");

    do {
        ready = get_letter ( &letter );
        if (ready) {
            position_cursor (2, 1);
            printf ("%c", (char )(toupper(letter) ) );
            position_cursor (7, 15);
            printf ("%c", (char )(toupper(letter) ) );
            fflush (stdout);

            position_cursor (4, 2);
            char unicode[] = "\U0001F60A \u03C6 \u221A \u2467";
            printf("Some unicode %s characters\n", unicode);
        }
        timeMillis = get_time_in_milliseconds_since_boot();
        position_cursor (5, 5);
        printf ("Time since boot = %llu\n", timeMillis);
    } while (letter != '\033'); // esc key
}
