//
//  main.h
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#ifndef main_h
#define main_h

#include <stdlib.h>
#include <string.h>
#include "TermKeyAndTime.h"

// Enable any one of these, one at a time:
// this is required because each uses duplicated data structure definitions

#define STRUCTURES_AND_UNIONS 1 // change 0 to 1 to enable a code section
#define FOOD_CHALLENGE 0
#define DYNAMIC_MEMORY 0
#define ADVANCED_DATA 0

void structures_and_unions(void);
void structures_and_unions_food_challenge(void);
void dynamic_memory_allocation(void);
void advanced_data_structures(void);
void recursion(void);
void threads(void);

#endif /* main_h */
