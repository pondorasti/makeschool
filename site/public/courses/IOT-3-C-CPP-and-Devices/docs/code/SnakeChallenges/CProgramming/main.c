//
//  main.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 4/24/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "TermKeyAndTime.h"

#include "main.h"

int main(int argc, const char * argv[]) {

#if SNAKE_1_TO_9
    printf ("Conditional compilation enabled Snake game without AI\n");
    snake_1_to_9 ();
#endif

#if SNAKE_WITH_AI
    printf ("Conditional compilation enabled Snake game with AI opponent\n");
    snake_with_ai ();
#endif
    
    return 0;
}

