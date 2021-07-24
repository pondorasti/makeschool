//
//  ArrayOfPointers.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 6/29/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//-------------------
// ARRAYS OF POINTERS
// BUBBLE SORT ALGORITHM

#define COUNT 6

char * animals [COUNT] = {"cat", "dog", "rabbit", "horse", "chicken", "duck"};

void bubble_sort (void) {
    int number_of_animals = COUNT;
    int inner, outer;
    char * pTemp;
    for (outer = 0; outer < number_of_animals ; outer++) {
        for (inner = 0; inner < number_of_animals -1; inner++) {
            if (0 < strcmp(animals[inner], animals[inner +1]) ) {
                pTemp = animals[inner];
                animals[inner] = animals[inner +1];
                animals[inner +1] = pTemp;
            }
        }
    }

    for (outer = 0; outer < number_of_animals; outer++) {
        printf("%s\n", animals[outer]);
    }
}

void array_of_pointers () {
    bubble_sort ();
    printf ("\n");
}
