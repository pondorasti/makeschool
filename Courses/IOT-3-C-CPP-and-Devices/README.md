# Course Description/Overview 

The C and C++ programming languages are THE core languages of the computer industry and are used to write all operating systems, interpreters and compilers and other performance critical software like web servers, browsers, networking devices, device drivers, game engines and embedded real-time devices.

## Who should enroll

This class is critical for advancing software engineers interested in participating in open source development of C/C++ software.  The class is also excellent for software engineers interested in building real-time programs such as games or computer vision, and especially critical for engineers working with embedded systems or where creating the highest performance code is critical.  Hardware oriented engineers that wish to explore bare metal programming, pixel direct game programming and game AI opponent algorithms also will benefit from this class.

## Prerequisites

Light experience using Xcode and Arduino is required.  Familiarity with fundamental programming concepts of variables, data types, loops, conditionals and functions is required.  If unfamiliar with the Xcode or Arduino IDE, following the tutorials and building and then modifying the two projects to do a new function should be adequate preparation:

Here is the first of a few intro to Xcode console application development in C
[https://www.youtube.com/watch?v=34shb-jBX9w]() <br>
Intro to possibilities with Arduino by Make Magazine
[https://www.youtube.com/watch?v=CqrQmQqpHXc]() <br>
Intro to Arduino programming
[https://www.youtube.com/watch?v=scySICLlhsk]() <br>
Intro to running Arduino simulator in 123D Circuits by Autodesk
[https://www.youtube.com/watch?v=2iYI7cXI3eM&t=5s]()

Standard "Hello World" C program:

~~~c
#include <stdio.h>
int main(int argc, const char * argv[])	// standard OS command line parameter passing arguments argc and argv[]
{
	printf ("Hello World\n");
	return 0;
}
~~~

## Learning Outcomes/Course competencies

Mastery of C programming language features:

- Variables
- standard data types and casting
- functions and parameters
- Arrays
- Strings
- Conditionals including **if then else, do while, for, switch** and **ternary** expressions
- structures and unions
- pointers

Mastery of C++ programming language features

- classes
- methods
- operator overloading
- functors
- templates

Mastery creating functions implementing managing single and double linked lists<br>
Mastery creating event loops with timers triggering event driven code<br>
Mastery of when and how to use data driven code and state machines<br>
Expertise creating AI game opponents for classic 2D games<br>
Expertise porting C/C++ code to Arduino IDE and converting to different display hardware<br>
Expertise using the Xcode debugger to examine variables and step through code

## Course Outline/Topics 

This class will focus on learning C and C++ languages while using event driven, data driven and state machine driven techniques.  By the end of the class you will achieve mastery of most C/C++ programming language features available in Xcode and Arduino IDE.  You will code several small apps and two classic video games and build and refine a classic video game AI opponent.  We'll port the games from Xcode to the Arduino IDE and run them on resource limited 8 bit hardware with a smart phone size display screen and buttons.  Students interested in making Demo Day projects based on this class can use either game as a starting point to create a new game of their own design or other application.

### Class Sessions 

Class 1: Review of computer architecture and C language fundamental features

- ALU (Arithmetic Logic Unit) in a CPU and logical operations and instruction execution<br>
- Variables, Functions, Arithmetic and Logical Operators, Bitwise Logical Operators, Arrays and Multidimensional arrays and their initializers

Class 2: Essential C language features for representing data, iteration and decision logic

- ASCII and Unicode Strings, **for** loops and conditionals, **while** loops and **switch** statements
- Standard libraries
- Snake game starting point and a series of challenges

Class 3: Advanced C language features for complex data structures and pointers

- Review of computer memory
- Pointers to data
- Pointer arithmetic
- Pointers to functions

Class 4: Advanced C language features structures, recursion and threading

- Structures and Unions
- Dynamic memory allocation
- Recursion and recursive algorithms

Class 5: Fundamental C++ features, object oriented programming on top of C

- Object Oriented programming added to C
- Classes, methods and this
- Function overloading
- Encapsulation

Class 6: Fundamental and Advanced C++ features, essential object oriented capabilities

- Inheritance and P[]()olymorphism
- Operator overloading
- Namespaces and exception handling

Class 7: Advanced C++ features

- Templates and the Standard Template Library
- Containers, Iterators, Algorithms and Functors

Other classes mixed in with the classes above:

- Snake game implementation of several challenges
- Snake game implementation of two Snake Game Opponent AI
- Space Invaders game implementation of several challenges
- Porting Snake game to Arduino Mega2560 with 320x480 display and custom controller board
- Porting Space Invaders to Arduino Mega2560 with 320x480 display and custom controller board


## Evaluation methods 

To pass this class:

- Students must be able to define the purpose and function of fundamental and advanced C/C++ langauge features<br>
- Students must attend or make up and complete all topic classes and associated in class projects<br>
- Students must complete Snake and Space Invaders game implementations<br>
- Students must complete 5 challenges in each game implementation and the AI challenge in Snake<br>
- Students must complete the porting of Snake and Space Invaders to Arduino<br>
- Students are incouraged to complete all challenges and stretch challenges<br>
- Students are incouraged to create a new possibly similar game to Snake or Space Invaders on Arduino hardware


## All Materials 
- C Coding Standards [https://users.ece.cmu.edu/~eno/coding/CCodingStandard.html]()
- The C Programming Language  [https://en.wikipedia.org/wiki/The_C_Programming_Language]()
- Online C playground  [https://repl.it/site/languages/c]()
- Arduino hardware and IDE simulator  [https://circuits.io/]()
- Circular Queue simulator [https://www.cs.usfca.edu/~galles/JavascriptVisual/QueueArray.html]()
- Path finding AI algorithms  [https://en.wikipedia.org/wiki/A*_search_algorithm]()
- C++ resource  [https://en.wikibooks.org/wiki/C%2B%2B_Programming]()

