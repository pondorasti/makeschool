## Creating a Singleton

#### Individually

Let's create a simple example of a Singleton class that designed to create an array to be used as an application's a single, globally-accessible data source.

**Step 1:** Create the Singleton

In a playground, create a Singleton class called `DataSource` with these members:

1. An array that holds a few items:

```Swift
var creationalPatternsArray = ["Abstract Factory", "Factory Method",
                      "Builder", "Dependency Injection", "Lazy Initialization",
                      "Object Pool", "Prototype", "Singleton"]
```

2. A `private init()` function that only contains these two statements:</br>

    ```Swift
        print("self is:", self)
        print("creationalPatternsArray is", creationalPatternsArray)
      ```

**Step 2:**  Instantiate the Singleton object

`let data = DataSource.sharedInstance`

Now, __*run*__ your playground...

**Step 3:**  Below your code so far, add and invoke the following `looper()` function:

```Swift
func looper(){

  for num in 1...5 {
          _ = DataSource.sharedInstance
          print("num is:", num)
    }
}
looper()
```

__*Run*__ your playground again...


#### As A Class

Discuss...

**Q:** What is surprising or noteworthy about the result of running `looper()`?

**Q:** What use cases can you imagine for the Singleton pattern?

   <!--
#### Part 2 - As A Class

Discuss...

**Q:** How do you think this pattern works to create a single, global instance?

**Q:** What advantages and disadvantages come to mind?
-->

<!-- FIRST ACTIVITY 1 - retained as fallback:
- View [Swift 2.0 Programming : Design Patterns : The Singleton Pattern](https://www.youtube.com/watch?v=3g7zZJWEbX0) video by the funza Academy (7 mins)

### 2. In Pairs - Discuss

**Q:** What iOS design patterns have you used or are familiar with so far?

**Q:** When have you encountered the Singleton pattern in code you've written or come across so far? (See the list of Apple examples above for ideas.)
- Why do you think a Singleton was chosen for either (a) the Apple examples listed, or (b) code you've used or seen?

### 3. As A Class

- 1 or 2 students to share results of discussion with class...
-->

#### Stretch Challenge

Create a networking class that will serve as a shared resource in an app. You can read [this article](https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift) to find some inspiration.
