//
//  StructuresAndUnionsFoodChallenge.c
//  cpt3
//
//  Created by Shannon T Bailey on 7/10/17.
//  Copyright © 2017 Shannon T Bailey. All rights reserved.
//

#include "main.h"

// Challenge 1 solution completed:
//----------------------
// Challenge 1 : Add 2 food items using a distinct new TYPE_FOOD object structure added to the union
// Stretch Challenge 1:  Add a function pointer unique to each object type giving each a behavior

#if FOOD_CHALLENGE

#define NAME_LENGTH 24
#define NUM_OF_OBJECTS 10

enum {
    TYPE_NULL = 0,
    TYPE_OBJECT,
    TYPE_ANIMAL,
    TYPE_FOOD
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

typedef struct my_food_tag {
    char FoodType [NAME_LENGTH];
    char FoodName [NAME_LENGTH];
    int Calories;
    double Price;
} sMyFood;

// create a structure to hold the type and a union for both types of things
typedef struct my_stuff_tag {
    char type;
    union my_ustuff_tag {
        sMyObject sObject;
        sMyAnimal sAnimal;
        sMyFood sFood;
    } uMyStuff;
} sMyStuff;

// define some static example object and animal types and their info.
sMyStuff Car = {TYPE_OBJECT, "Highlander", 104, 154, 248};
sMyStuff Dog = {TYPE_ANIMAL, .uMyStuff.sAnimal={"Labradore Retriever", "Superdog", 20120425, 90, 86} };
sMyStuff Food = {TYPE_FOOD, .uMyStuff.sFood={"Italian", "Pizza", 340, 2.95} };

void structures_and_unions_food_challenge(void) {
    sMyStuff * arrayOfThings = (sMyStuff *) calloc (NUM_OF_OBJECTS, sizeof(sMyStuff));
    sMyStuff * pArrayOfThings = arrayOfThings;

// use pointer to initialize an objects data
    pArrayOfThings->type = TYPE_OBJECT;
    strcpy (arrayOfThings->uMyStuff.sObject.ObjectName, "Refridgerator");
    arrayOfThings->uMyStuff.sObject.Height = 128;
    arrayOfThings->uMyStuff.sObject.Width  = 80;
    arrayOfThings->uMyStuff.sObject.Length = 74;
 
// use indexing to initialize an objects data
    arrayOfThings[2].type = TYPE_OBJECT;
    strcpy (arrayOfThings[2].uMyStuff.sObject.ObjectName, "Macbook Pro");
    arrayOfThings[2].uMyStuff.sObject.Height = 2;
    arrayOfThings[2].uMyStuff.sObject.Width  = 23;
    arrayOfThings[2].uMyStuff.sObject.Length = 29;

// use memcpy to copy the static values for Car and Dog into the array at index 4 and 6
    memcpy (pArrayOfThings + 4, & Car, sizeof(sMyStuff) );
    memcpy (& arrayOfThings[6], & Dog, sizeof(sMyStuff) );
    memcpy (& arrayOfThings[8], & Food, sizeof(sMyStuff) );


// iterate through the array of structures priting out their values
    for (int index = 0; index < NUM_OF_OBJECTS; index++, pArrayOfThings++) {
        switch (arrayOfThings[index].type) {
            case TYPE_OBJECT:
                printf ("Object %s is # %d and is %d cm tall by %d cmwide by %d cm long\n",
                        arrayOfThings[index].uMyStuff.sObject.ObjectName, index,
                        arrayOfThings[index].uMyStuff.sObject.Height,
                        arrayOfThings[index].uMyStuff.sObject.Width,
                        arrayOfThings[index].uMyStuff.sObject.Length);
                break;
            case TYPE_ANIMAL:
                printf ("Animal type %s name %s is # %d and was born on %d, weighs %d kg and is %d cm long\n",
                        pArrayOfThings->uMyStuff.sAnimal.AnimalType,
                        pArrayOfThings->uMyStuff.sAnimal.AnimalName, index,
                        pArrayOfThings->uMyStuff.sAnimal.BirthDate,
                        pArrayOfThings->uMyStuff.sAnimal.Weight,
                        pArrayOfThings->uMyStuff.sAnimal.Length);
                break;
            case TYPE_FOOD:
                printf ("Food type %s name %s is # %d and has %d calories and costs $%lf\n",
                        pArrayOfThings->uMyStuff.sFood.FoodType,
                        pArrayOfThings->uMyStuff.sFood.FoodName, index,
                        pArrayOfThings->uMyStuff.sFood.Calories,
                        pArrayOfThings->uMyStuff.sFood.Price);
                break;
            default:
                printf ("Item %d is undefined\n", index);
                break;
        }
    }
    
// free the array of structures allocated on the heap
    free (arrayOfThings);
}
#endif
