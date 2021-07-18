# Go, Fetch!

2:30 - 3:15

---

<!-- omit in toc -->
## Agenda

1. [About Me](#about-me)
1. [Think, Pair, Share](#think-pair-share)
1. [Reflect: Common Themes](#reflect-common-themes)
1. [Identifying a Trend](#identifying-a-trend)
1. [Selecting Data in a Web Page](#selecting-data-in-a-web-page)
1. [CSS Diner](#css-diner)

---

## About Me

---

## Think, Pair, Share

Write down as many sites that you can think of that you visit every day.

---

## Reflect: Common Themes

- Charts, tables, graphs
- Social media
- Pricing websites
- News sources
- RSS
- HTML websites
- Search engines
- Game updates

---

## Identifying a Trend

The problem we're solving:

we visit certain sites every day to see updated content.

What if we wrote a program that could check the website for us?

---

## Selecting Data in a Web Page

- introducing inspect element
- how selectors work

---

## CSS Diner

How many orders can you fulfill at the CSS diner?

---

<!-- .slide: data-background-iframe="https://flukeout.github.io/" data-background-interactive data-preload -->

---

How many did you solve?

---

How can we use selectors in a Go program?

---

```golang
package main

import (
        "fmt"
        "github.com/gocolly/colly/v2"
)

func main() {
        c := colly.NewCollector()

        c.OnHTML("a[href]", func(e *colly.HTMLElement) {
                link := e.Attr("href")
                fmt.Printf("Link found: %q -> %s\n", e.Text, link)
        })

        c.Visit("https://hackerspaces.org/")
}
```

---

<!-- .slide: data-background-iframe="https://repl.it/@droxey/go-fetch?lite=1" data-background-interactive data-preload -->

---
