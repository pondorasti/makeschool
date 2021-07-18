# C / C++ Programming Class 7

---
### Templates and The Standard Template Library
## Objectives
- **Templates**
- **Standard Template Library**
 - **Containers**
 - **Iterators**
 - **Algorithms**
 - **Functors**

---
# Templates
### C++ is a strongly typed language which provides templating for reuse of identical code that simply differs in type:
```c
template <typename T>  
T minimum(const T& left, const T& right)  
{  
    return left < right ? left : right;  
}

int a = get_a();  
int b = get_b();  
int i = minimum<int>(a, b);

int minimum(const int& left, const int& right)  
{  
    return left < right ? left : right;
}
```

---
# Standard Template Library
### Early in C++'s existence a standard template library was created to speed up coding common tasks:

### Containers: template classes that support common ways to organize data, such as
```c
<vector>, <list>, <deque>, <stack>, <queue>, <set>, and <map>
```
### Algorithms: template functions for performing common operations on sequences of objects, such as
```c
<functional>, <algorithm>, and <numeric>
```
### Iterators: the glue that pastes algorithms and containers together, such as <utility>, <iterator>, and <memory>
```c
<utility>, <iterator>, and <memory>
```

---
# STL Containers
### There are several types of STL containers:
- Sequence Containers:
 - array, vector, deque, forward_list, list
- Associative Containers
 - set, map, multi set, multi map
- Unordered Containers
 - unordered_set, unordered_map, unordered_multiset, unordered_multimap
- Container Adaptors
 - stack, queue, prority_queue

---
# STL Iterators
### C++ provide STL iterators that providing access to an individual element in a container:
```c
#include <iostream>
#include <iterator>

void test (){
  vector<int> vec{ 0,1,2,3,4 };

  for (auto it = begin(vec); it != end(vec); it++)  
  {  // Access element using dereference operator
    cout << *it <<" ";  
  }
}
```
### C++ provide STL specialized iterators that can traverse special types of containers such as front_insert_iterator of a sequential container:
```c
#include <iostream>     // std::cout
#include <iterator>     // std::front_insert_iterator
#include <deque>        // std::deque
#include <algorithm>    // std::copy

void test () {
  std::deque<int> foo, bar;
  for (int i=1; i<=5; i++)
  { foo.push_back(i); bar.push_back(i*10); }

  std::front_insert_iterator< std::deque<int> > front_it (foo);

  std::copy (bar.begin(),bar.end(),front_it);

  for ( std::deque<int>::iterator it = foo.begin(); it!= foo.end(); ++it )
	  std::cout << ' ' << *it;
  std::cout << '\n';
}
```
```c 
Output:  50 40 30 20 10 1 2 3 4 5
```

---
# STL Algorithems
### C++ provides useful common algorithms that work with STL types and templates:
```c
#include <iostream>     // std::cout
#include <algorithm>    // std::sort
#include <vector>       // std::vector
bool myfunction (int i, int j) { return (i<j); }
struct myclass {
  bool operator() (int i, int j) { return (i<j); }
} myobject;

void test () {
  int myints[] = {32,71,12,45,26,80,53,33};
  std::vector<int> myvector (myints, myints+8);               // 32 71 12 45 26 80 53 33

  // using default comparison (operator <):
  std::sort (myvector.begin(), myvector.begin()+4);           //(12 32 45 71)26 80 53 33

  // using function as comp
  std::sort (myvector.begin()+4, myvector.end(), myfunction); // 12 32 45 71(26 33 53 80)

  // using object as comp
  std::sort (myvector.begin(), myvector.end(), myobject);     //(12 26 32 33 45 53 71 80)

  // print out content:
  std::cout << "myvector contains:";
  for (std::vector<int>::iterator it = myvector.begin(); it != myvector.end(); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';
}
```

---
# STL Functors
### C++ provides the ability to define special functions that can contain state and behave like operators called functors.  They can be more efficient than function pointers:
```c 
// this is a functor
struct add_x {
  add_x(int x) : x(x) {}
  int operator()(int y) const { return x + y; }

private:
  int x;
};

// Now you can use it like this:
add_x add42(42); // create an instance of the functor class
int i = add42(8); // and "call" it
assert(i == 50); // and it added 42 to its argument

std::vector<int> in; // assume this contains a bunch of values)
std::vector<int> out(in.size());
// Pass a functor to std::transform, which calls the functor on every element 
// in the input sequence, and stores the result to the output sequence
std::transform(in.begin(), in.end(), out.begin(), add_x(1)); 
assert(out[i] == in[i] + 1); // for all i  return 0;
}
```