//
//  ControlFlow.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//------------------------
// CONTROL FLOW STATEMENTS

void control_flow (void) {
    printf ("\nControl flow statements\n");
    
    for_loops ();
    ternary_expressions ();
    while_loops ();
    switch_statements ();
    goto_statements ();
}


//---------------------------
// FOR LOOPS AND CONDITIONALS

#define ITEMS 5
void for_loops (void) {
    double sum = 0.0;
    double values[ITEMS] = {4.95, 7.50, 3.95, 2.15, 9.99};
    
    for (int x = 0; x < ITEMS; x++) {
        if (x == 0) {
            printf ("Item costs $%0.2lf", values[x]);
        } else {
            printf (" + $%0.2lf", values[x]);
        }
        sum += values[x];
    }
    printf (" = Total $%0.2lf\n", sum);
}


//--------------------
// TERNARY EXPRESSIONS

// Example: Only the left or right pin can be true for a D-Pad joystick
// Get the angle using two ternary expressions on one line for conciseness

void get_angle (bool leftPin, bool rightPin) {
  int angle = leftPin ? -30 : (rightPin ? 30 : 0);
  printf ("leftPin = %d, rightPin = %d,", leftPin, rightPin);
  printf (" angle = %d\n", angle);
}

void ternary_expressions (void) {
    get_angle ( false, false );
    get_angle ( true,  false );
    get_angle ( false, true  );
}


//------------
// WHILE LOOPS

void while_loops (void) {
    time_t oldTime, newTime;
    int count = 0;
 
    time ( &oldTime ); // pass time variables to time function by
    oldTime += 2;      // reference ‘&’ so they can be modified
    do {
        time ( &newTime );
        count++;
    }
    while (oldTime > newTime);
    printf ("count reached %d in 2 seconds\n", count);
}


//------------------
// SWITCH STATEMENTS
void check_value (char letter) {
    switch (letter) {
        case 'A': printf ("Letter A seen\n");
            break;
        case 'B': printf ("Letter B seen\n");
            break;
        default: printf ("Bad letter \"%c\" seen\n", letter);
    }
}

void switch_statements () {
    check_value ('A');
    check_value ('B');
    check_value ('Z');
}
 
 
//---------------
// GOTO STATEMENT

void goto_statements (void) {
    goto firstLabel;
    
    printf ("Unreachable code\n");
    
firstLabel:
    printf ("Destination first label\n");
    goto thirdLabel;
    
secondLabel:
    printf ("Destination second label\n");
    goto fourthLabel;
    
thirdLabel:
    printf ("Destination third label\n");
    goto secondLabel;
    
fourthLabel: ;
    printf ("Destination fourth label\n");
    printf ("Last goto reached\n");
}
