
// Unit 1 button mappings
#define P1_RED   30
#define P1_BLUE  32
#define P1_LEFT  28
#define P1_RIGHT 22
#define P1_UP    24
#define P1_DOWN  26

#define P2_RED   25
#define P2_BLUE  23
#define P2_LEFT  33
#define P2_RIGHT 27
#define P2_UP    29
#define P2_DOWN  31


void GetPlayerButtons (int Player, char * pLetter ) {
  if (Player == 1) {
    if (!digitalRead(P1_LEFT) )
      *pLetter = 'A';
    if (!digitalRead(P1_RIGHT) )
      *pLetter = 'D';
    if (!digitalRead(P1_UP) )
      *pLetter = 'W';
    if (!digitalRead(P1_DOWN) )
      *pLetter = 'S';
  } else {
     if (!digitalRead(P2_LEFT) )
      *pLetter = 'J';
    if (!digitalRead(P2_RIGHT) )
      *pLetter = 'L';
    if (!digitalRead(P2_UP) )
      *pLetter = 'I';
    if (!digitalRead(P2_DOWN) )
      *pLetter = 'K';   
  }
}

/* Code to display all the buttons used to map them
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  for (int x = 22; x <= 33; x += 1)
    pinMode(x, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:

  Serial.print("Pins ");
  for (int x = 22; x <= 33; x += 1) {
    Serial.print(x, DEC);
    Serial.print(" = [");  
    Serial.print(digitalRead(x), DEC);
    Serial.print("] ");  
  }
  Serial.println (" ");
  delay (10);
}
*/
