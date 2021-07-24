# C / C++ Programming Class 6

---
### C++ language features add object orientation, greater code modularity and large project scalability to C language.
## Objectives
- **Inheritance**
- **Polymorphism**
- **Operator overloading**
- **Namespaces**
- **Exception handling with try catch throw**

---
# Inheritance
### C++ allows a class with a common set of data and methods to be inherited by a more specialized class:
```c
class invader {
  public:
    invader (int x, int y, int type)
 { xPos = x; yPos = y; alienType = type};
    virtual move (void) { ... };
  private:
    void nextPose (void) { ... };
    int  xPos;
    int  yPos;
    int  alienType;
};
class mothership: public invader {
  public:
    mothership (int x, int y, int moveLR)
 { xPos = x; yPos = y; direction = moveLR};
    virtual move (void) { ... };
  private:
    int direction;
};
```

---
# Polymorphism
### In C++, you can create pointers to a base class that refer to an inherited class and access methods in the inherited class:
```c
class mothership: public invader {
  public:
    mothership (int moveLR)
 { xPos = (-1 == moveLR)? 1 : _WIDTH-5;
   yPos = 2; direction = moveLR};
    virtual move (void) { ... };
  private:
    int direction;
};
```
### For example:
```c
invader * alien = new invader (3, 5, FAT_ALIEN);
invader * evilMotherShip = new mothership (-1);
. . .
  alien->move();
  evilMotherShip->move();
```
---
# Operator Overloading
### C++ allows mathematical operators to be used (extended) to provide operations on special data types such as:
```c
class CVector {
  public:
    int x,y;
    CVector () {};
    CVector (int a,int b) : x(a), y(b) {}
    CVector operator + (const CVector&);
};

CVector CVector::operator+ (const CVector& param) {
  CVector temp;
  temp.x = x + param.x;
  temp.y = y + param.y;
  return temp;
}

int main () {
  CVector foo (3,1);
  CVector bar (1,2);
  CVector result;
  result = foo + bar;
  cout << result.x << ',' << result.y << '\n';
  return 0;
}
```
### Copied from www.cplusplus.com/doc/tutorial/templates/

---
# Name Spaces
### C++ provides name spaces as a way to separate libraries and major code modules form having variable, function and class name collisions:
```c
#include <iostream>
using namespace std;

namespace foo
{
  int value() { return 5; }
}

namespace bar
{
  const double pi = 3.1416;
  double value() { return 2*pi; }
}

int main () {
  cout << foo::value() << '\n';
  cout << bar::value() << '\n';
  std::cout << bar::pi << '\n';  // specifying namespace for cout
  return 0;
}
```
### Copied from www.cplusplus.com/doc/tutorial/namespaces/

---
# Exceptions
### C++ provides a formal exception control structure using try, catch and throw:
```c
#include <iostream>
using namespace std;

int main () {
  try
  {
    throw 20;
  }
  catch (int e)
  {
    cout << "An exception occurred, # = " << e << '\n';
  }
  return 0;
}
```
### Copied from www.cplusplus.com/doc/tutorial/exceptions/

---