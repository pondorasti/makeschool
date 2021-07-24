//
//  Strings.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

void strings (void) {

//--------------
// ASCII STRINGS
    printf ("\nStrings encoded in ASCII and Unicode\n");
    
    char rock[] = "C Programmers Rock";
    printf ("%s\n", rock);
    
    printf ("Length = %lu\n",    strlen(rock) );
    printf ("First  = 0x%02x\n", rock[0] );
    printf ("Last   = 0x%02x\n", rock[strlen(rock) - 1] );
    printf ("NULL   = 0x%02x\n", rock[strlen(rock)] );
    
//----------------
// UNICODE STRINGS
    char unicode[] = "\U0001F60A \u03C6 \u221A \u2467";
    printf("Some unicode %s characters\n", unicode);
}
