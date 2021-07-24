//
//  FunctionArgumentPointers.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

void function_argument_pointers (void) {
    char bigNumber[]    = "987654321";
    char smallNumber[]  = "971";
    char negBigNumber[] = "-876543210";
    char twoNumbers[]   = "12345,432109";

    int bigNum;
    int smallNum;
    int negBigNum;

    char * pNext;
    int firstNum, secondNum;

    if ( parse_number (bigNumber, & pNext, & bigNum))
        printf ("bigNumber string = %s, converted = %d\n", bigNumber, bigNum);
    else
        printf ("bigNumber string = %s, could not be converted!\n", bigNumber);
    
    if ( parse_number (smallNumber, NULL, & smallNum))
        printf ("smallNumber string = %s, converted = %d\n", smallNumber, smallNum);
    else
        printf ("smallNumber string = %s, could not be converted!\n", smallNumber);
    
    if ( parse_number (negBigNumber, NULL, & negBigNum))
        printf ("negBigNumber string = %s, converted = %d\n", negBigNumber, negBigNum);
    else
        printf ("negBigNumber string = %s, could not be converted!\n", negBigNumber);
    
    if ( parse_number (twoNumbers, & pNext, & firstNum)) {
        printf ("twoNumbers string = %s, first converted = %d\n", twoNumbers, firstNum);
        pNext++;    // skip comma
        if ( parse_number (pNext, NULL, & secondNum)) {
            printf ("twoNumbers string = %s, second converted = %d\n\n", twoNumbers, secondNum);
            return;
        }
    }
    printf ("twoNumbers string = %s, could not be converted!\n\n", twoNumbers);
}
