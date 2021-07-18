# Go Relational

## Minute by Minute

| **Elapsed** | **Time**  | **Activity**              |
| ----------- | --------- | ------------------------- |
| 0:00        | 0:05      | Why/Objectives            |
| 0:05        | 0:20      | Warm Up                   |
| 0:25        | 0:30      | TT                        |
| 0:50        | 0:10      | BREAK                     |
| 0:60        | 0:60      | In Class Activity I       |
| TOTAL       | 2:00      |                           |

## Why You Should Know This

`gorm` is an incredibly popular object-relational mapping framework written in Golang.

It's superpower: the ability to support numerous popular SQL dialects, simply by changing a single imported package.

Your implementation will stay the same, regardless of the underlying relational database technology.

## Learning Objectives (5 min)

1. Identify and describe the role `gorm` plays in the architecture of a typical Golang application.
2. Define `gorm` models and use them to persist data to a SQLite database.
3. Integrate `gorm` with Echo to achieve data persistence within the group API project started on Day 4.

## Warm Up (20 min)

- Warm up with Golang this afternoon by spending a few minutes working on your Go Track Challenges.
- Make sure you commit to a public GitHub repo after completing each challenge.
- Take a moment to add your repo to the [tracker](https://make.sc/trackbew2.5) --- even if you haven't finished the required 20 challenges yet!

## Overview/TT I (30 min)

1. Introduce students to [gorm](http://gorm.io) and go over it's unique features. Contrast and compare `gorm` to their experience with `mongoose` in BEW1.2.

2. Demonstrate navigating `gorm`'s [documentation](http://gorm.io/docs/) and highlight `gorm`'s syntax to query and filter persistent data.

3. Walk through the following sample code that persists a `Product` model to a simple SQLite database named `test.db`:

    ```go
    package main

    import (
      "github.com/jinzhu/gorm"
      _ "github.com/jinzhu/gorm/dialects/sqlite"
    )

    type Product struct {
      gorm.Model
      Code string
      Price uint
    }

    func main() {
      db, err := gorm.Open("sqlite3", "test.db")
      if err != nil {
        panic("failed to connect database")
      }
      defer db.Close()

      // Migrate the schema
      db.AutoMigrate(&Product{})

      // Create
      db.Create(&Product{Code: "L1212", Price: 1000})

      // Read
      var product Product
      db.First(&product, 1) // find product with id 1
      db.First(&product, "code = ?", "L1212") // find product with code l1212

      // Update - update product's price to 2000
      db.Model(&product).Update("Price", 2000)

      // Delete - delete product
      db.Delete(&product)
    }
    ```

## BREAK (10 min)

## In Class Activity I (60 min)

1. Gather into the same groups and open up your API project.
2. Use the sample code above to drive a discussion on how to refactor the existing `struct`s in your project to enable `gorm.Model` functionality.
3. Write code to implement `gorm.Model` in the existing `struct`s.
4. Add CRUD functionality to your existing endpoints, using the above sample as the guide.
5. Manually test and verify that persistence is working:
   1.  Create a `GET` endpoint that returns all your saved objects in JSON format in the response.
   2.  Shut down the server and restart it.
   3.  Call the endpoint you created in Step 1.
       1.  Is the data still there? Awesome! Slack your code to the class channel.
       2.  No data? Incomplete data? Almost there! Keep working on this challenge until you can repeat the above 3 steps and return a list of data from your SQLite database.

