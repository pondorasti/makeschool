# C / C++ Programming Class 5

---
### C++ language features add object orientation, greater code modularity and large project scalability to C language.
## Objectives
- **Master use of object oriented programming added to C**
- **Use classes and this**
- **Use the new operator**
- **Explore function overloading**
- **Use encapsulation**

---
# Object Orientation
### C++ provides a convenient way to group related data and methods together in a single "object" using a class:
```c
class invader {
  public:
    invader (int x, int y, int type)
 { xPos = x; yPos = y; alienType = type};
    move (void) { ... };
  private:
    void nextPose (void) { ... };
    int  xPos;
    int  yPos;
    int  alienType;
};
```
### C++ allows classes to be instantiated conveniently:
```c 
invader * alien = new invader (100, 150, FAT_ALIEN);
```

---
# Function Overloading
### C++ allows function overloading, where functions have the same name but different parameters:
```c
class Turret {
  public:
   Turret (void) { xPos = 20 }; // default to 20
   Turret (int x) { xPos = x; }; // consructor
  private:
    int  xPos;
    ...
};
```
### C++ function overloading avoids function name spaghetti
```c
Turret secondTurret; // use default constructor
Turret * mainTurret = new Turret (30);
```

---
# Encapsulation
### C++ makes it convenient to group and protect class variables from access by code outside the class using the private keyword:
```c
class Turret {
  public:
   Turret (void) { xPos = 20 }; // default to 20
   Turret (int x) { xPos = x; }; // consructor
   Weapon missile;
  private:
    int  xPos;
    int  livesRemaining;
    int  score;
};
```
### C++ only allows methods in the class Turret access to private variables such as xPos and score

---
### Lets explore these C++ constructs in Xcode using the Space Invaders game starting point and solution for Challenge 1-5 in comments in the CProgrammingPt5 Xcode project.  Try to implement all challenges without referring to the solution too much.
- Challenge 1: Implement invader movement right and left and down until it collides with the turret
- Challenge 2: Implement invader bomb from bottom invaders and detect collision with turret
- Challenge 3: Implement turret explosion when hit with invader bomb
- Challenge 4: Implement turret missle and invader collision, explosion and deletion
- Challenge 5: Implement invaders speeding up more and more when there are less than 15, 8 and 3 left
- Challenge 6: Implement turret lives and score
- Stretch Challenge 1: Implement different invader shapes and bomb types and speed
- Stretch Challenge 2: Implement the mothership invader at top of screen for bonus score
- Stretch Challenge 3: Implement invader waves starting lower after a completed wave