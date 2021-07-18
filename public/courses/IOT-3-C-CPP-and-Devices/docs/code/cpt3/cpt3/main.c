//
//  main.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

// *** Examine main.h to enable different sections of code ***

#include "main.h"

//-----------------
// Invoke selected projects

int main(int argc, char *argv[])
{
    printf ("\n Set breakpoints and attach debugger now if desired\n");
    getchar ();

#if STRUCTURES_AND_UNIONS       // only one of these can be compiled at a time
    structures_and_unions();    // as they use duplicate altered data structures
#elif FOOD_CHALLENGE
    structures_and_unions_food_challenge();
#elif DYNAMIC_MEMORY
    dynamic_memory_allocation();
#elif ADVANCED_DATA
    advanced_data_structures();
#endif

    printf ("\n Hit return key to run recursion code\n");
    getchar ();

    recursion();

    printf ("\n Hit return key to run threading code\n");
    getchar ();

    threads();
    
    printf ("\n Hit return key to exit program\n");
    getchar ();

    return 0;
}
