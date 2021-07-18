//
//  TwoPlayerGamesLCD.c
//  CProgramming final project, porting snake with AI and two player to Arduino Mega 2560
//
#include <stdio.h>
#include <stdlib.h>
#include "TermAndKey.h"
#include "ButtonMaps.h"

uint8_t Orientation = 0;
#include "Touch.h"


void setup() {
  Serial.begin(115200);
  for (int x = 22; x <= 33; x += 1)
    pinMode(x, INPUT);

  SetupLCD ();
}

int SnakeGame (void);

void loop() {
  SnakeGame();
}

#include "Snake.h"

