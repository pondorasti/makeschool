//
//  ParseNumbers.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

// Convert text digits formatted as proper signed integers into binary values
bool parse_number (char * psText, char * * ppsNewTextPosition, int * piNumber) {
    char letter;
    bool negative;
    int number = 0;
    int count  = 0;
    
    negative = ('-' == *psText);  // Look for leading minus sign
    if ( negative )
        psText++;
  
    letter = *psText;
    while (('0' <= letter) && ('9' >= letter) && (count < 10) )
    {
        number = number * 10 + (letter - '0');  // for each digit, multiply previous
        letter = * ++psText;                    // value by 10 and add new digit
        count++;
    }

    if ((count == 0) || (count == 10) ) {   // error if the number of digits exceed limit
        return false;
    } else {
        *piNumber = (negative) ? - number : number;
        if (NULL != ppsNewTextPosition)     // if caller provided a return variable,
            *ppsNewTextPosition = psText;   // provide current text position
    }
    return true;
}
