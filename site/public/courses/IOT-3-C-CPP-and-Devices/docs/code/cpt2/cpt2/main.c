//
//  main.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//-----------------
// POINTERS TO DATA

int main(int argc, const char * argv[]) {

    printf ("\nSet breakpoints and attach debugger now if desired\n");
    getchar ();

    pointers_to_data();

    function_argument_pointers ();
    
    array_of_pointers ();
    
    pointer_arithmetic ();
    
    printf (" Hit return key to continue to calculator app that exercises function pointers\n");
    getchar ();
 
    function_pointers ();
    
    getchar();
    
    return 0;
}
