# SQL

Most relational databases use SQL which stands for Structured Query Language. It is a language that allows us to write code that will interact with our database.

In relational databases, to find data we will need to run a *query* to find our entries in tables.

## Objectives

- Understand why we need SQL
- Practice creating tables, entries in POSTgres
- Practice executing queries with SQL in POSTgres

## Class Resources

[WEB Class on SQL](https://github.com/Product-College-Courses/WEB-3-Advanced-Web-Patterns/tree/master/01.%20SQL)


## Creating a Database

## Creating Tables


## Finding entries in a table (Running Queries)

#### Get all entries in products table
```sql
select * from products
```

#### Get all entries in products table, return only name an id as a tuple

``` sql
select (name, id) from products
```

#### Get all entries in products table that have the name "Coke"

```sql
select * from products where name='Coke'
```

#### Get all entries in products table that have and id less than 2
```sql
select * from products where id<=2
```


Often times we need data from two or more tables. Joins are a way to achieve this.

There are 4 main types of JOINS.

**JOIN (INNER)** - Returns records that have matching values in both tables

**LEFT JOIN (OUTER)** - Return all records from the left table, and the matched records from the right table

**RIGHT JOIN (OUTER)** - Return all records from the right table, and the matched records from the left table

**FULL JOIN (OUTER)** - Return all records when there is a match in either left or right table


## Resources

[SQL Tutorials - W3School](https://www.w3schools.com/sql/)
