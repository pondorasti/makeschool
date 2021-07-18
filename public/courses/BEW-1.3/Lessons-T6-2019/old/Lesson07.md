# Day 7: Advanced Schema Design for Fun and Profit

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity**               |
| ----------- | -------- | ---------------------------|
| 0:00        | 0:05     | Objectives                 |
| 0:05        | 0:15     | Initial Exercise           |
| 0:20        | 0:30     | TT 1: Code Theatres API    |
| 0:50        | 0:10     | BREAK                      |
| 1:00        | 0:30     | TT 2: Slides               |
| 1:30        | 0:30     | Wrap Up / Tutorial Time    |
| TOTAL       | 2:00     |                            |

## Learning Objectives (5 Minutes)

1. Review MongoDB schema basics at a high-level by reviewing and demonstrating a sample implmentation of the Theatre Reservations API.
2. Gain the ability to articulate the most common relational database patterns at an introductory level.
3. Dive deeper into the common design considerations present when evaluating the effacacy of document based database schemas.
4. Understand the use of MongoDB and Mongoose techniques within RESTful APIs.

## Initial Exercise (15 Minutes)

### CRUD? REST? DBs? TLDR PLZ! Acroynm Glue

Display the following table on the projector. Ask students to **fill in the blanks** below for each row in their worksheets.

| **URL**             | **CRUD** | **HTTP**    | **SQL**  | **MongoDB**                  | **Mongoose**                  |
| ------------------- | -------- | ----------- |--------- | ---------------------------- | ----------------------------- |
| `/theater/:id`      |          |             | `SELECT` |                              | `Theater.find({})`            |
| `/theater/new`      |          | `POST`      |          | `db.theaters.insert()`       |                               |
| `/theater/:id/edit` |          | `PUT`       | `UPDATE` |                              |                               |
| `/theater/:id`      | `DELETE` |             | `DELETE` |                              |                               |

## Overview / TT (30 Minutes)

Live code a potential solution for the Theatre Reservations API.

## BREAK (10 Minutes)

## TT II: Schema Slides (30 Minutes)

### Data Modeling and Schema Design for Document DBs

Present this [slide deck](https://www.slideshare.net/mongodb/database-trends-for-modern-applications-why-the-database-you-choose-matters) to the class as an overview.

## After Class

Continue work on both the Reddit Tutorial. It's a good idea to complete this by the start of next week so that you have plenty of time to work on your Custom API Project.

## Additional Resources

1. [Learn MongoDB the Hard Way: Schema Design](http://learnmongodbthehardway.com/schema/schemadesign/)
1. [MongoDB CRUD Operations](https://docs.mongodb.com/manual/crud/)
1. [MongoDB Shell Methods: Collection Methods](https://docs.mongodb.com/manual/reference/method/js-collection/)
1. [Mongoose: Models](https://mongoosejs.com/docs/models.html)
1. [The MongoDB Engineering Journal](https://engineering.mongodb.com)
