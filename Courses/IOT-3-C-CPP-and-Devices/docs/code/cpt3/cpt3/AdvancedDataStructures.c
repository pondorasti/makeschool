//
//  AdvancedDataStructures.c
//  C / C++ Programming
//
//  Created by Shannon T Bailey on 7/10/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

//----------------------
// Challenge 1:  Create code to remove and free a thing in the list based on matching its type and name
// Challenge 2:  Create code to insert a new item at a specific index in the list
// Stretch Challenge 1:  Sort by name using bubble sort algorithm only changing doubly linked list pointers

#if ADVANCED_DATA

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
    struct my_stuff_tag * pPreviousStuff;
    char type;
    union my_ustuff_tag {
        sMyObject sObject;
        sMyAnimal sAnimal;
    } uMyStuff;
} sMyStuff;

// define some static example object and animal types and their info.
sMyStuff Car      = {NULL, NULL, TYPE_OBJECT, "Highlander",    104, 154, 248};
sMyStuff Refridge = {NULL, NULL, TYPE_OBJECT, "Refridgerator", 128,  80, 74};
sMyStuff Macbook  = {NULL, NULL, TYPE_OBJECT, "Macbook Pro",     2,  23, 29};
sMyStuff Dog      = {NULL, NULL, TYPE_ANIMAL, .uMyStuff.sAnimal={"Labradore Retriever", "Superdog", 20120425, 90, 86} };
sMyStuff Cat      = {NULL, NULL, TYPE_ANIMAL, .uMyStuff.sAnimal={"Tabby", "Mr Cuddles", 20110912, 20, 22} };

sMyStuff * pThings;     // global root pointer to list of things
sMyStuff * pLastThing;  // pointer to last item on list of things


// forward declarations of utility functions
void AddItem (sMyStuff * pStuff);
void RemoveItem (int itemToRemove);


void advanced_data_structures(void) {
    sMyStuff * pNextThing;
    sMyStuff * pTemp;

    pThings = pLastThing = NULL;
    
// add some items, remove a few then add them back in a different order
    AddItem(& Car);
    AddItem(& Refridge);
    AddItem(& Macbook);
    AddItem(& Dog);
    AddItem(& Cat);

    RemoveItem(4);
    RemoveItem(0);
    RemoveItem(1);
//    RemoveItem(1);
//    RemoveItem(0);
//    RemoveItem(0);    // attempted removal more items than were added
    
    AddItem(& Cat);
    AddItem(& Macbook);
    AddItem(& Car);

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


// add an item to the end of the linked list without scanning the list
void AddItem (sMyStuff * pStuff) {
    sMyStuff * pNewThing;
    
    pNewThing = (sMyStuff *) calloc (1, sizeof(sMyStuff));
    memcpy(pNewThing, pStuff, sizeof(sMyStuff) );
    pNewThing->pPreviousStuff = pLastThing;

    if (pThings == NULL) {      // first item added?
        pThings = pNewThing;
    }
    if (pLastThing == NULL) {   // first item added?
        pLastThing = pNewThing;
    } else {
        pLastThing->pNextStuff = pNewThing;
    }
    pLastThing = pNewThing;
}


// remove an item from any position in the doubly linked list
void RemoveItem (int itemToRemove) {
    int item = 0;
    sMyStuff * pBackwardThing;
    sMyStuff * pNextThing;
    sMyStuff * pForwardThing;
    
    pNextThing = pThings;
    while (pNextThing != NULL) {
        if (item == itemToRemove) {
            pBackwardThing = pNextThing->pPreviousStuff;
            pForwardThing  = pNextThing->pNextStuff;
            free (pNextThing);
            
            if (pBackwardThing != NULL) {
                pBackwardThing->pNextStuff = pForwardThing;
            } else {
                pThings = pForwardThing;
            }
            if (pForwardThing != NULL) {
                pForwardThing->pPreviousStuff = pBackwardThing;
            } else {
                pLastThing = pBackwardThing;
            }
            break;
        }
        pNextThing = pNextThing->pNextStuff;
        item++;
    }
}
#endif
