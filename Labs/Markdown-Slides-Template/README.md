# Markdown Slides Template

Love Markdown? Clone this template repository to easily write slide decks using Markdown.

[Make School] themed and ready to go --- just add content!

### Table of Contents

1. [Features](#features)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Where to Learn More](#where-to-learn-more)

## Features

- Write slides in pure Markdown quickly and easily.
- Automatic syntax highlighting.
- Honors the standards set in the [Make School Style Guide].
- Automatically scales to any device size.
- Searchable when linked in a Docsify site.
- Presentation will auto-refresh anytime a change is made.
- Each slide has a unique link you can easily share.
- Deployable to any static website host.
- No UI tweaking required! Try that in Google Slides.

## Prerequisites

- Node `>=9.0.0`

## Installation

Run the following command in your terminal to install `reveal-md` globally --- the command that will launch your Markdown-based presentation:

```bash
npm install -g reveal-md
```

You'll now be able to run this command in any of your curriculum repositories!

## Usage

Run this command to launch a Markdown document named `slides.md`:

```bash
reveal-md slides.md -w --css=makeschool.css
```

Your default browser will be launched automatically. By default, your presentation will be running at `http://localhost:1948/slides.md#/`.

## Where to Learn More

Check out the [Reveal.js] repository for further customizations!

[Make School]: https://www.makeschool.com
[Make School Style Guide]: https://www.makeschool.com/style-guide
[Reveal.js]: https://github.com/hakimel/reveal.js/
