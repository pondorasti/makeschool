//
//  DynamicMemoryAllocation.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 7/10/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//----------------------
// Challenge 1:  Create code to remove and free a thing in the list based on matching its type and name
// Stretch Challenge 1:  Sort the list by name using bubble sort algorithm

#if DYNAMIC_MEMORY

#define NAME_LENGTH 24

enum {
    TYPE_NULL = 0,
    TYPE_OBJECT,
    TYPE_ANIMAL
};

// define two types of things
typedef struct my_object_tag {
    char ObjectName [NAME_LENGTH];
    int  Height;
    int  Width;
    int  Length;
} sMyObject;

typedef struct my_animal_tag {
    char AnimalType [NAME_LENGTH];
    char AnimalName [NAME_LENGTH];
    int  BirthDate;
    int  Weight;
    int  Length;
} sMyAnimal;

// create a structure to hold the type and a union for both types of things
typedef struct my_stuff_tag {
    struct my_stuff_tag * pNextStuff;   // notice tag my_stuff_tag used as sMyStuff is not defined yet
    char type;
    union my_ustuff_tag {
        sMyObject sObject;
        sMyAnimal sAnimal;
    } uMyStuff;
} sMyStuff;

// define some static example object and animal types and their info.
sMyStuff Car      = {NULL, TYPE_OBJECT, "Highlander",    104, 154, 248};
sMyStuff Refridge = {NULL, TYPE_OBJECT, "Refridgerator", 128,  80, 74};
sMyStuff Macbook  = {NULL, TYPE_OBJECT, "Macbook Pro",     2,  23, 29};
sMyStuff Dog      = {NULL, TYPE_ANIMAL, .uMyStuff.sAnimal={"Labradore Retriever", "Superdog", 20120425, 90, 86} };
sMyStuff Cat      = {NULL, TYPE_ANIMAL, .uMyStuff.sAnimal={"Tabby", "Mr Cuddles", 20110912, 20, 22} };

sMyStuff * pThings; // global root pointer to list of things


void dynamic_memory_allocation(void) {
    sMyStuff * pNextThing;
    sMyStuff * pTemp;
 
// use memcpy to copy the static values for Car through Dog into singly linked list
    pThings = (sMyStuff *) malloc (sizeof(sMyStuff));
    memcpy (pThings, & Car, sizeof(sMyStuff) );
    
    pNextThing = (sMyStuff *) malloc (sizeof(sMyStuff));
    pThings->pNextStuff = pNextThing;
    memcpy (pNextThing, & Refridge, sizeof(sMyStuff) );
    
    pTemp = (sMyStuff *) malloc (sizeof(sMyStuff));
    pNextThing->pNextStuff = pTemp;
    memcpy (pTemp, & Macbook, sizeof(sMyStuff) );

    pNextThing = (sMyStuff *) malloc (sizeof(sMyStuff));
    pTemp->pNextStuff = pNextThing;
    memcpy (pNextThing, & Dog, sizeof(sMyStuff) );

    pTemp = (sMyStuff *) malloc (sizeof(sMyStuff));
    pNextThing->pNextStuff = pTemp;
    memcpy (pTemp, & Cat, sizeof(sMyStuff) );

// iterate through the linked list of structures priting out their values
    pNextThing = pThings;
    int index = 0;
    while (pNextThing != NULL) {
        switch (pNextThing->type) {
            case TYPE_OBJECT:
                printf ("Object %s is # %d and is %d cm tall by %d cmwide by %d cm long\n",
                        pNextThing->uMyStuff.sObject.ObjectName, index++,
                        pNextThing->uMyStuff.sObject.Height,
                        pNextThing->uMyStuff.sObject.Width,
                        pNextThing->uMyStuff.sObject.Length);
                break;
            case TYPE_ANIMAL:
                printf ("Animal type %s name %s is # %d and was born on %d, weighs %d kg and is %d cm long\n",
                        pNextThing->uMyStuff.sAnimal.AnimalType,
                        pNextThing->uMyStuff.sAnimal.AnimalName, index++,
                        pNextThing->uMyStuff.sAnimal.BirthDate,
                        pNextThing->uMyStuff.sAnimal.Weight,
                        pNextThing->uMyStuff.sAnimal.Length);
                break;
            default:
                printf ("Item %d is undefined\n", index++);
                break;
        }
        pNextThing = pNextThing->pNextStuff;
    }
    
// free the linked list of structures allocated on the heap
    pTemp = pThings;
    while (pTemp != NULL) {
        pNextThing = pTemp->pNextStuff;
        free (pTemp);
        pTemp = pNextThing;
    }
}
#endif
