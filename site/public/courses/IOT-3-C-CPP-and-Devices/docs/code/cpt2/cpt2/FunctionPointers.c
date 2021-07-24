//
//  FunctionPointers.c
//  cpt2
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//------------------
// FUNCTION POINTERS
// Challenge 1: Improve text input so mistyped characters can be deleted
// Challenge 2: Ensure that only a valid number, single operator and second number are entered
// Challenge 3: make the calculations entered and values computed appear as a rolling receipt
// Challenge 4: Add bell sound if an error is entered
// Stretch Challenge 1: convert to allow floating point values to be entered and calculated
// Stretch Challenge 2: Add more math functions such as power, square root, modulo, etc.
// Stretch Challenge 3: Add parenthesis and multiple operations with left to right precedence
// Stretch Challenge 4: Implement math precendence rules with multiple operations

// Define four math functions that will be called using function pointers
void add (int first, int second)      { printf ("%d        ", first + second); }
void subtract (int first, int second) { printf ("%d        ", first - second); }
void multiply (int first, int second) { printf ("%d        ", first * second); }
void divide (int first, int second)   { if (second == 0) printf ("DIV0 ERROR");
                                   else printf ("%d        ", first / second); }

// define an array of function pointers, note: return and parameters must all be the same
void (* funcArray[]) (int, int) = {add, subtract, multiply, divide};

#define BUFFER_LENGTH 30

void calculator (void) {
    bool ready;
    char letter;
    char buffer[BUFFER_LENGTH];
    int  index;
    int first, second;
    char * pNewPosition;

    char operators[4] = "+-*/";
    char operator;
    int opIndex;

    init_getch ();   // turn off terminal character echoing
    clear_screen ();
    position_cursor (1, 1);
    printf ("Four function calculator   (type for example: 876543+135)   hit ESC to exit\n");
    
restart:
    for (index = 0; index < BUFFER_LENGTH; index++) {
        buffer [index] = 0;
    }
    index = 0;
    
// main loop
    do {
        ready = get_letter ( &letter );
        
        if (ready) { // get 0-9, +, -, *, / characters and display them
            if ((('0' <= letter) && ('9' >= letter))
                || ('+' == letter) || ('-' == letter)
                || ('*' == letter) || ('/' == letter) ) {
                if (index < BUFFER_LENGTH) {
                    buffer[index] = letter;
                    position_cursor (2, ++index);
                    printf ("%c", letter);
                    fflush (stdout);
                }
            }
// +++ insert delete key challenge code here +++
            if ('\n' == letter) { // when enter is pressed parse and calculate
                buffer[++index] = 0;
                if (parse_number(buffer, & pNewPosition, & first) )
                {
                    operator = *pNewPosition;
                    for (opIndex = 0; opIndex < sizeof(operators); opIndex++)
                        if (operator == operators[opIndex])
                            break;
                
                    ++pNewPosition; // skip operator character
                    
                    if (parse_number (pNewPosition, NULL, & second) )
                    {
                        position_cursor (3, 1);   // blank out previous answer area
                        printf ("                                                 ");
                        position_cursor (3, 1);   // copy user input to answer area
                        printf ("%s = ", buffer);
                        
// call one of four math functions here using array of function pointers
                        (*funcArray[opIndex]) (first, second);

                        index = 0;                // blank out user input area
                        position_cursor (2, 1);
                        printf ("                                  ");
                        fflush (stdout);
                        goto restart;
                    }
                    else goto error;
                } else {
error:              position_cursor (2, 1);
                    printf ("*** BAD INPUT ***  ");
                    fflush (stdout);
                    usleep (3000000);
                    position_cursor (2, 1);
                    printf ("                                      ");
                    fflush (stdout);
                    goto restart;
                }
            }
        }
    } while (letter != '\033'); // esc key
}

void function_pointers (void) {
    calculator ();
}

// Challenge 1 solution:
// Challenge 1: Improve text input so mistyped characters can be deleted
//
// Insert code next to +++ at the appropriate locations using other code between
// which does not need changing to locate the positions for insertion.
/*
                || ('*' == letter) || ('/' == letter) ) {
                buffer[index] = letter;
                position_cursor (2, ++index);
                printf ("%c", letter);
                fflush (stdout);
            }
+++         if ('\x7f' == letter) { // implement delete key
+++             if ( index > 0) {
+++                 position_cursor (2, index);
+++                 printf (" ");
+++                 position_cursor (2, index);
+++                 --index;
+++                 buffer[index] = ' ';
+++                 fflush (stdout);
+++             }
+++         }
            if ('\n' == letter) { // when enter is pressed parse and calculate
                buffer[++index] = 0;
*/
