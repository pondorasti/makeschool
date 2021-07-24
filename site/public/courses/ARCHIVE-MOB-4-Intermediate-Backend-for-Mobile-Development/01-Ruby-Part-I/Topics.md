# Intro to Ruby Topics of Discussion

- Intro to Ruby
  - irb and REPL
  - variables, symbols, arrays, hash maps (dictionaries)
    Inspecting Variables
    - creating variables
    - puts vs p
    - using the methods, method on an object
    - using ||=
    - parallel assignment
    ```ruby
    a, b, c = 10, 20, 30
    ```

    Symbols
    - symbols are like fast immutable strings
    - can be used to represent constants eg. dictionary keys
    - aren't garbage collected

    Collections: Arrays
    - how to create an array
    - some methods on array - via methods method
      - include?
      - shuffle

    Collections: Hash maps
    - key value data structure in Ruby
    - used extensively
    - uses symbols as keys
    - keys are symbols so when using a methods like include?, use the symbol value

  - classes & objects, inheritance, functions
    Functions
    - how to define a function
    - Implicit return
    ```ruby
    def calc(first, second)
      first * second
    end
    ```
    - Ruby allows you to define methods on classes and objects
      On object
      ```
      some_string = "Eliel"
      def some_string.hello
        "hello"
      end

      some_string.hello # => "hello"
      ```
      On class
      Eg. MyClass.hello do
            puts "Hello"
          end
    - special functions (initialize, self, =)

    Modules
    - mixins - ways to include modules into classes
      - include - includes module methods as instance methods
      - extend - includes module methods as class methods

    Classes
    - classes are just objects of class Class
    - how to define a class
    - setting initializer, instance variables
    - attr_reader, attr_writer, attr_accessor
    - class variables - need instance method for class variables
    - functions in classes
    - subclassing/inheritance

    Objects
    - everything in Ruby is an object

    Runtime
    - Everything is done at Runtime in Ruby.
    - This allow use to do metaprogramming - code writing code
    - Eg. We can define functions dynamically
      ```ruby
      Animal = Class.new
      # animal instance
      a = Animal.new
      Animal.define_method :name do
        puts "Elephant"
      end
      ```
