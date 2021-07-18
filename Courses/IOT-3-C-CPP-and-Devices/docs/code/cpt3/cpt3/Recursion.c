//
//  Recursion.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 7/10/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//----------------------
// Recursive solver for Tower of Hanoi game
// Challenge 1:  create animation of towers and disks of increasing size moving
//               between the three towers using TermKeyAndTime.c position function


void tower_of_hanoi(int limit, char source, char temp, char dest) {
    if (limit == 1) {
        printf("Move Disk %d From %c To %c\n", limit, source, dest);
        return;
    } 
    tower_of_hanoi (limit - 1, source, dest, temp);
    printf ("Move Disk %d From %c To %c\n", limit, source, dest);
    tower_of_hanoi (limit - 1, temp, source, dest);
}


void recursion(void) {
    char source = 'A', temp = 'B', dest = 'C';
    int disks = 6;
    
    printf ("\nEnter The Number of Disks: ");
    scanf ("%d", & disks);
    getchar ();
    if (disks > 10) disks = 10;
    if (disks < 3) disks = 3;
    
    printf ("\nSequence of Disks:\n");
    tower_of_hanoi (disks, source, temp, dest);
}
