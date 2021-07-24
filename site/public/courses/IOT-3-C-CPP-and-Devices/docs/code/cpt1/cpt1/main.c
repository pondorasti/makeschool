//
//  main.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 3/23/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"
#include "TermKeyAndTime.h"

int main(int argc, const char * argv[]) {

    printf ("Hello World!\n");
    
    printf ("Attach debugger using Debug menu, Attach to Process\n");
    printf ("to running process and then press return key.");
    getchar ();
    
    arithmetic_logic_arrays ();
    
    strings ();

    control_flow ();
    
    printf ("Press return to continue\n");
    getchar ();

//    test_term_key_and_time ();

//    smily ();

//    snake ();

    return 0;
}
