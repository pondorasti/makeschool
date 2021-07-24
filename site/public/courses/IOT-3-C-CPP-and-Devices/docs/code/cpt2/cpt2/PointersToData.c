//
//  PointersToData.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//-----------------
// POINTERS TO DATA

int    myInt = 1234;
char * psString;

void pointers_to_data (void) {
    char   myCharacter = 'X';
    double myPi        = 3.1415962;
    char   myString[]  = "Hello Pointers";

    char   * pointerToChar;
    int    * piInt;  // Hungarian notation standard
    double * pdPi;
    char * * ppsString;

    pointerToChar = & myCharacter;
    piInt         = & myInt;
    pdPi          = & myPi;
    psString      = myString;
    ppsString     = & psString;

    printf ("address of char pointer value = 0x%llx\n", (unsigned long long) & pointerToChar);
    printf ("char pointer value = 0x%llx", (unsigned long long)pointerToChar);
    printf (", actual character = %c\n\n", * pointerToChar);

    printf ("address of int pointer value = 0x%llx\n", (unsigned long long) & piInt);
    printf ("int pointer value = 0x%llx", (unsigned long long)piInt);
    printf (", actual integer = %d\n\n", * piInt);
    
    printf ("address of double pointer value = 0x%llx\n", (unsigned long long) & pdPi);
    printf ("double pointer value = 0x%llx", (unsigned long long)pdPi);
    printf (", actual double = %lf\n\n", * pdPi);

    printf ("address of string pointer value = 0x%llx\n", (unsigned long long) & psString);
    printf ("string pointer value = 0x%llx", (unsigned long long)psString);
    printf (", actual string = %s\n\n", psString);

    printf ("address of string pointer to pointer value = 0x%llx\n", (unsigned long long) & ppsString);
    printf ("string pointer to pointer value = 0x%llx", (unsigned long long)ppsString);
    printf (", actual string = %s\n\n", * ppsString);
}
