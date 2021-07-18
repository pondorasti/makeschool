//
//  SpaceInvadersLCD_V1.c
//  CProgramming final project, porting snake with AI and two player to Arduino Mega 2560
//

#include <stdio.h>
#include <stdlib.h>
#include "TermAndKey.h"
#include "ButtonMaps.h"

#include <Adafruit_GFX.h>
#include <UTFTGLUE.h>
UTFTGLUE myGLCD(0x9488,A2,A1,A3,A4,A0);
#include <TouchScreen.h>

#include "InvaderMain.h"

// most mcufriend shields use these pins and Portrait mode:
uint8_t YP = A3;  // must be an analog pin, use "An" notation!
uint8_t XM = A2;  // must be an analog pin, use "An" notation!
uint8_t YM = 9;   // can be a digital pin
uint8_t XP = 8;   // can be a digital pin
uint8_t SwapXY = 0;

uint16_t TS_LEFT = 130;   //Touch screen calibration parameters
uint16_t TS_RT  = 905;
uint16_t TS_TOP = 960;
uint16_t TS_BOT = 127;
char *name = "Unknown controller";

// For better pressure precision, we need to know the resistance
// between X+ and X- Use any multimeter to read it
// For the one we're using, its 300 ohms across the X plate
TouchScreen ts = TouchScreen(XP, YP, XM, YM, 300);
TSPoint tp;

#define MINPRESSURE 20
#define MAXPRESSURE 1000

#define SWAP(a, b) {uint16_t tmp = a; a = b; b = tmp;}

uint8_t Orientation = 1;


void setup() {
    Serial.begin(115200);
    for (int x = 22; x <= 33; x += 1)
    pinMode(x, INPUT);

// initialize LCD panel
    pinMode(A0, OUTPUT);       //.kbv mcufriend have RD on A0
    digitalWrite(A0, HIGH);
  
// Setup the LCD
    myGLCD.InitLCD(LANDSCAPE);
    myGLCD.setFont(BigFont);
    int tmp;
    switch (Orientation) {      // adjust for different aspects
        case 0:   break;        //no change,  calibrated for PORTRAIT
        case 1:   tmp = TS_LEFT, TS_LEFT = TS_BOT, TS_BOT = TS_RT, TS_RT = TS_TOP, TS_TOP = tmp;  break;
        case 2:   SWAP(TS_LEFT, TS_RT);  SWAP(TS_TOP, TS_BOT); break;
        case 3:   tmp = TS_LEFT, TS_LEFT = TS_TOP, TS_TOP = TS_RT, TS_RT = TS_BOT, TS_BOT = tmp;  break;
    }

    ts = TouchScreen(XP, YP, XM, YM, 300);     //call the constructor AGAIN with new values.
}

void game (void);

void loop() {
    DrawOnLCD();
      
    game();
}

uint16_t bitmap[3202];

void DrawOnLCD (void) {
    myGLCD.clrScr();    // Clear the screen and draw the frame

    myGLCD.setTextSize(2);
    myGLCD.setColor(255, 0, 0);
    myGLCD.fillRect(0, 0, 320, 15);
    myGLCD.fillRect(0, 464, 320, 479);
    myGLCD.setColor(255, 255, 255);
    myGLCD.setBackColor(255, 0, 0);
    myGLCD.print("INVADER SCORE = 0", 0, 0);

// testing 
    uint16_t colors[10] = {0xFF88, 0x07FF, 0x1111, 0x07E0, 0xF81F, 0x3333, 0xF800, 0x001F, 0x019B, 0x44FF};
    for (int x = 0; x < 80; x++) {
        for (int y = 0; y < 40; y++) {
            bitmap [x + (y * 40)] = colors[x / 8];
        }
    }

// call lowest level graphics primitives
//    MCUFRIEND_kbv::setAddrWindow(x, y, x + sx*scale - 1, y + sy*scale - 1);
//    MCUFRIEND_kbv::pushColors((const uint8_t*)data, sx * sy, 1);
    myGLCD.setAddrWindow(40, 30, 40 + 79, 30 + 39);
    myGLCD.pushColors(bitmap, 80 * 40, 1);
    
    
    delay (3000);
}


