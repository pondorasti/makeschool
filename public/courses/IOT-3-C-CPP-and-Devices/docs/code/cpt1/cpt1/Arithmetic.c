//
//  Arithmetic.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/27/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//------------------------
// ARITHMETIC LOGIC AND ARRAYS
void arithmetic_logic_arrays (void) {
    printf ("\nArithmetic operators, bitwise logical operators and arrays\n");
//---------------------
// ARITHMETIC OPERATORS
    double angle = 45.0;
    double radianAngle = angle * (3.1415 / 180.0);    // Convert degrees to radians
    printf ("sin of %3.2lf degrees is %lf\n", angle, sin(radianAngle));

//--------------------------
// BITWISE LOGICAL OPERATORS
    int myValue      = 0b00111110; // 0x3e
    int shiftAndMask = 0b00111000 & (myValue << 3);
    printf ("masked and shifted = %x\n", shiftAndMask);

//-------
// ARRAYS
    #define NUM_ITEMS 4
    int items[NUM_ITEMS] = {5, 3, 11, 99};
    printf ("Second element of the array is %d\n", items[1] );

//-------------------------
// MULTI DIMENSIONAL ARRAYS
    #define GROUPS 2
    #define NUM_ELEMENTS 3
    int values[GROUPS][NUM_ELEMENTS]={{5, 3, 11},
                                      {99, 101, 123}};
    printf ("2nd group, 3rd value is %d\n", values[1][2] );
    
}

