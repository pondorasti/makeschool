# 📜 Day 6: Scraping the Web

<!-- omit in toc -->
## ⏱ Agenda

1. [[**05m**] 🏆 Objectives](#05m-%F0%9F%8F%86-objectives)
1. [[**05m**] 🤷‍♀️ Why You Should Know This](#05m-%F0%9F%A4%B7%E2%80%8D%E2%99%80%EF%B8%8F-why-you-should-know-this)
1. [[**15m**] 📖 Overview: Web Scraping](#15m-%F0%9F%93%96-overview-web-scraping)
	1. [Web Crawling vs. Web Scraping](#web-crawling-vs-web-scraping)
	1. [Parsing & Extracting Data Using Selectors](#parsing--extracting-data-using-selectors)
1. [[**20m**] 💻 Game: Selector Diner](#20m-%F0%9F%92%BB-game-selector-diner)
1. [[**10m**] 💻 Demo: Selecting Selectors](#10m-%F0%9F%92%BB-demo-selecting-selectors)
	1. [Techniques Demonstrated](#techniques-demonstrated)
1. [[**10m**] BREAK](#10m-break)
1. [[**15m**] 📖 Overview: Colly](#15m-%F0%9F%93%96-overview-colly)
1. [[**20m**] Activity: Colly Calls Back](#20m-activity-colly-calls-back)
1. [[**10m**] TT: Advantages and Disadvantages to Using Colly](#10m-tt-advantages-and-disadvantages-to-using-colly)
	1. [Good](#good)
	1. [Not So Good](#not-so-good)
1. [[**30m**] Video: Headless Web Scraping](#30m-video-headless-web-scraping)
1. [[**20m**] Example Code / Demo](#20m-example-code--demo)
1. [📚 Resources & Credits](#%F0%9F%93%9A-resources--credits)

## [**05m**] 🏆 Objectives

1. Identify the critical steps to collecting data using web scraping techniques.
2. Apply selectors to an HTML document to retreive data.
3. Design and create a web scraper that retrieves data from your favorite website!

## [**05m**] 🤷‍♀️ Why You Should Know This

- All projects need data before launching!
- Available datasets may not meet your needs or require additional supporting data from a source on the web.
- Save important data before a website goes offline for archival purposes.

## [**15m**] 📖 Overview: Web Scraping

Web Scrapers crawl a website, extract it's data, transform that data to a usable structured format, finally writing it to a file or database for subsequent use.

<p align="center">
  <img src="https://www.scrapehero.com/wp/wp-content/uploads/2018/01/xhow-does-a-web-scraper-work-simple-2.png.pagespeed.ic.MeNRriGmi9.webp">
</p>

Programs that use this design pattern follow the **Extract-Transform-Load (ETL) Process**.

### Web Crawling vs. Web Scraping

- Not interchangeable terms!
- Crawlers download and store the contents of large numbers of sites by following the links in pages.
	- How Google got famous
- Scrapers are built for the structure of a specific website.
	- Use site's own structure to extract individual specific data elements.
	- Crawling is the first step to web scraping.

### Parsing & Extracting Data Using Selectors

Below are the most common selectors used when scraping the web for the purposes of data collection.

| Name                 | Syntax          | Description                                                  |
| -------------------- | --------------- | ------------------------------------------------------------ |
| **Element**          | `a`             | Any element  `section`, `a`, `table`, etc.                   |
| **ID**               | `#home-link`    | First element with `id="video-player"`                       |
| **Class**            | `.blog-post`    | Any element with `class="blog-post"`                         |
| **Attribute**        | `a[href]`       | All values of the `href` attribute assigned to any `a` element |
| **Pseudo-Attribute** | `a:first-child` | The first `a` element                                        |

Let's practice selectors now --- they're the most important part of writing an awesome web scraper! If the selector isn't correct, nothing will return, and no data will have been collected as a result of running your scraper.

## [**20m**] 💻 Game: Selector Diner

Choose the right plates while working the window at the [CSS Diner](https://flukeout.github.io/). This fun game will level up your selector skills in preparation for your Web Scraper project.

## [**10m**] 💻 Demo: Selecting Selectors

_Instructor will demonstrate how to find and test selectors in Chrome before integrating them in your web scraper._

### Techniques Demonstrated

- Inspect an element > right click it's node in the DOM tree > choosing Copy > Copy Selector.
- Testing using `Ctrl` + `F` in the inspector.

**If your selector does not work using these methods, it WILL NOT WORK IN YOUR SCRAPER**!

## [**10m**] BREAK

## [**15m**] 📖 Overview: Colly

A popular open source package, [Colly](https://go-colly.org), provides a clean foundation to write any kind of crawler/scraper/spider. Features include:

- Lots of cool Go language concepts!
- Fast (>1k request/sec on a single core)
- Manages request delays and maximum concurrency per domain
- Automatic cookie and session handling
- Sync/async/parallel scraping
- Distributed scraping
- Caching

## [**20m**] Activity: Colly Calls Back

Colly works via a series of callbacks that are executed anytime `Visit()` is called on a collector.

Callbacks are functions that execute after another function completes.

Colly supports the following callbacks:

```golang
package main

import (
	"fmt"

	"github.com/gocolly/colly"
)

// main() contains code adapted from example found in Colly's docs:
// http://go-colly.org/docs/examples/basic/
func main() {
	// Instantiate default collector
	c := colly.NewCollector()

	c.OnHTML("a[href]", func(e *colly.HTMLElement) {
		// Find link using an attribute selector
		// Matches any element that includes href=""
		link := e.Attr("href")

		// Print link
		fmt.Printf("Link found: %q -> %s\n", e.Text, link)

		// Visit link
		e.Request.Visit(link)
	})

	c.OnRequest(func(r *colly.Request) {
		fmt.Println("Visiting", r.URL)
	})

	c.OnError(func(_ *colly.Response, err error) {
		fmt.Println("Something went wrong:", err)
	})

	c.OnResponse(func(r *colly.Response) {
		fmt.Println("Visited", r.Request.URL)
	})

	c.OnScraped(func(r *colly.Response) {
		fmt.Println("Finished", r.Request.URL)
	})

	// Start scraping on https://hackerspaces.org
	c.Visit("https://hackerspaces.org/")
}
```

With a partner, use the sample code to determine which order these callbacks fire
To examine the output, paste the above snippet, build, and run your executable.

## [**10m**] TT: Advantages and Disadvantages to Using Colly

### Good

- Quick to copy and paste an example from the docs and modify it to create your own web scraper.
- Lots of plugins and libraries with good documentation
- Security features allow you cloak your scraper so it isn't detected

### Not So Good

- Can't scrape websites that take advantage of a shadow DOM to render components
- This means you can't use Colly to scrape websites written in Angular, Vue, and React

## [**30m**] Video: Headless Web Scraping

<iframe id="ytplayer" type="text/html" width="720" height="405" src="https://www.youtube.com/embed/_7pWCg94sKw?modestbranding=1&playsinline=1" frameborder="0" allow="picture-in-picture" allowfullscreen>

## [**20m**] Example Code / Demo

- [chromedp/examples](https://github.com/chromedp/examples): awesome `chromedp` examples, use these to get started
- [droxey/makeshort](https://github.com/droxey/makeshort): example app for creating `make.sc` shortlinks from the command line

<!--
# [**30m**] 💻 Activity: Work Out a Workflow

_Complete the [workflow worksheet]() distributed in class._

When you're done, use the remaining lab time to begin your project!

## [**55m**] 🧪 Lab Time: Begin Web Scraper Project

Read the project [README](https://github.com/make-school-labs/makescraper) to begin your project.

You'll be able to complete at least a few requirements after what you've learned today.

We'll learn how to serialize and store JSON during our next class!
-->

## 📚 Resources & Credits

- [**ScrapeHero**: What is Web Scraping – Part 1 – Beginner’s Guide](https://www.scrapehero.com/a-beginners-guide-to-web-scraping-part-1-the-basics/)
- [**W3C**: Selectors](https://www.w3.org/TR/CSS22/selector.html)
- [Colly](https://go-colly.org): Starter code derived from [basic](http://go-colly.org/docs/examples/basic/) example.
- [chromedp/examples](https://github.com/chromedp/examples): various `chromedp` examples
- [Chrome DevTools Protocol](https://chromedevtools.github.io/devtools-protocol/): Chrome DevTools Protocol Domain documentation
