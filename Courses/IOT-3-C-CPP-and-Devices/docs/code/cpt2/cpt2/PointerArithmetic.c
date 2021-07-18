//
//  PointerArithmetic.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

#define RED   0
#define GREEN 1
#define BLUE  2

// Define an 8 bit per color channel RGB bitmap of 4 rows by 13 columns
char bitmapFile[] = {"3,4,13,AAaBBbCCcDDdEEeFFfGGgHHhIIiJJjKKkLLlMMm"
                            "NNnOOoPPpQQqRRrSSsTTtUUuVVvWWwXXxYYyZZz"
                            "aa1bb1cc1dd1ee1ff1gg1hh1ii1jj1kk1ll1mm1"
                            "nn1oo1pp1qq1rr1ss1tt1uu1vv1ww1xx1yy1z11"};

char pPixels[1000000]; // Reserve global buffer of 1 megabyte for any size and depth bitmap


void pointer_arithmetic(void) {
    int colorDepth, rows, columns;
    char * pNewPosition;
    
    // simulate reading bitmap file into memory array
    for (int i = 0; i < sizeof(bitmapFile); i++)
        pPixels[i] = bitmapFile[i];

    if ( ! parse_number (pPixels, & pNewPosition, & colorDepth) )
        return;
    
    pNewPosition++; // skip comma
    if ( ! parse_number (pNewPosition, & pNewPosition, & rows) )
        return;

    pNewPosition++; // skip comma
    if ( ! parse_number (pNewPosition, & pNewPosition, & columns) )
        return;

    pNewPosition++; // skip comma
    
    printf ("Bitmap is %d bytes per pixel, %d rows and %d columns\n", colorDepth, rows, columns);

    // examples of complex pointer arithmetic where array dimensions are dynamic
    // retrieving one color channel from a specific pixel.  Index origin is 0
    printf ("Red value at row 2, column 6 is = %c\n",
        *(pNewPosition + RED + (colorDepth * ((columns * 2) + 6)) ) );
 
    printf ("Green value at row 3, column 8 is = %c\n\n",
        *(pNewPosition + GREEN + (colorDepth * ((columns * 3) + 8)) ) );
}
