# Homework 1: SQL Commands Practice

In this assignment, you'll practice writing SQL code to create and query data in a SQL database.

## Setup

You will complete the TODOs in [this SQL fiddle](http://sqlfiddle.com/#!7/a34037/2) for this assignment.

You can also clone the [starter code](https://github.com/make-school-labs/sql-commands-practice) and work on your machine. You can run SQLite code on your machine using the starter code instructions.

## Instructions

### Write Table(s)

In addition to the existing `Albums` table, write a `Songs` table containing the following fields:

- `id` - integer, primary key
- `name` - string
- `album_id` - foreign key

You may want to reference the examples we created in class.

Then, **add at least 4 songs to the `Songs` table** using the `INSERT INTO` command.

### Write Queries

After you create a table and add data, write the following queries:

1. Select all song names and their respective album names. (Hint: Use a table join.)
1. Select all albums published between 1970 and 1980.
1. Select all **songs** on albums published between 1970 and 1980. (Hint: Use a table join.)
1. Select all albums with names containing "California".

## Stretch Challenge

If you'd like to enhance your understanding of SQL commands and terminology, you can follow [this W3Schools tutorial](https://w3schools.com/sql/sql_intro.asp) which covers the basics.

## Submission

To submit this assignment, save your code in a file called `songs_albums.sql` and submit it to Gradescope.

## Resources

1. [SQLite Create Table](https://www.sqlitetutorial.net/sqlite-create-table/)
1. [SQL WHERE Clause](https://www.w3schools.com/sql/sql_where.asp)
1. [SQL AND, OR, and NOT Operators](https://www.w3schools.com/sql/sql_and_or.asp)
1. [SQL LIKE Operator](https://www.w3schools.com/sql/sql_like.asp)
