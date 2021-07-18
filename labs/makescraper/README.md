# 🕷 makescraper

[![Go Report Card](https://goreportcard.com/badge/github.com/YOUR_GITHUB_USERNAME/makescraper)](https://goreportcard.com/report/github.com/YOUR_GITHUB_USERNAME/makescraper)

_Create your very own web scraper and crawler using Go and [Colly](https://go-colly.org)!_

### 📚 Table of Contents

1. [Project Structure](#project-structure)
2. [Getting Started](#getting-started)
3. [Deliverables](#deliverables)
4. [Resources](#resources)

## Project Structure

```bash
📂 makescraper
├── README.md
└── scrape.go
```

## Getting Started

1. Visit [github.com/new](https://github.com/new) and create a new repository named `makescraper`.
2. Run each command line-by-line in your terminal to set up the project:

    ```bash
    $ git clone git@github.com:Make-School-Labs/makescraper.git
    $ cd makescraper
    $ git remote rm origin
    $ git remote add origin git@github.com:YOUR_GITHUB_USERNAME/makescraper.git
    $ go mod download
    ```

3. Open `README.md` in your editor and replace all instances of `YOUR_GITHUB_USERNAME` with your GitHub username to enable the Go Report Card badge.

## Deliverables

_Complete each task in the order they appear. Use [GitHub Task List](https://help.github.com/en/github/managing-your-work-on-github/about-task-lists) syntax to update the task list._

### Requirements

#### Scraping

- [ ] **IMPORTANT**: Complete the Web Scraper Workflow worksheet distributed in class.
- [ ] Create a `struct` to store your data.
- [ ] Refactor the `c.OnHTML` callback on line `16` to use the selector(s) you tested while completing the worksheet.
- [ ] Print the data you scraped to `stdout`.

##### Stretch Challenges

- [ ] Add more fields to your `struct`. Extract multiple data points from the website. Print them to `stdout` in a readable format.

#### Serializing & Saving

- [ ] Serialize the `struct` you created to JSON. Print the JSON to `stdout` to validate it.
- [ ] Write scraped data to a file named `output.json`.
- [ ] **Add, commit, and push to GitHub**.

## Resources

### Lesson Plans

- [**BEW 2.5** - Scraping the Web](https://make-school-courses.github.io/BEW-2.5-Strongly-Typed-Languages/#/Lessons/WebScraping.md): Concepts and examples covered in class related to web scraping and crawling.

### Example Code

#### Scraping

- [**Colly** - Docs](http://go-colly.org/docs/): Check out the sidebar for 20+ examples!
- [**Ali Shalabi** - Syntax-Helper](https://github.com/alishalabi/syntax-helper): Command line interface to help generate proper code syntax, pulled from the Golang documentation.

#### Serializing & Saving

- [JSON to Struct](https://mholt.github.io/json-to-go/): Paste any JSON data and convert it into a Go structure that will support storing that data.
- [GoByExample - JSON](https://gobyexample.com/json): Covers Go's built-in support for JSON encoding and decoding to and from built-in and custom data types (structs).
- [GoByExample - Writing Files](https://gobyexample.com/writing-files): Covers creating new files and writing to them.
