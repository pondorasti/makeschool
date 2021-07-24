# HTML markup practice 

Mark up each of the documents to the best of your ability. Use the hints provided. You can also add more markup if you see opportunities to make good use of other tags. 

For all of the following challenges follow this procedure: 

1. Open the challenge file and read the text. 
2. Add markup to the document using the tags that you think are most appropriate. 
3. Read the recommened tags list for that challenge. Compare the tags you chose with what is on the list. 
1. Add any tags that are on the recommended list that you haven't included yet. 

## Challenge 1 - Heading and paragraphs 

**Step 1** Open [challenge-1.html](challenge-1.html) and read the text.

**Step 2** Markup the text to the best of your ability. Think of all the possible tags you could use for the text that is there. 

**Step 3** the text taken as a whole seems to be an article about HTML. The artical has a heading. You could thikn of the link at the bottom as a footer for the article. 

This document starts with a header followed by two paragraphs. The last line could also be considered a paragraph. These are all block tags. 

There is also opportunity to use some inline tags. HTML and CSS are abbreviations. There is a tag for this! The last line contains a link. There is a tag for this also. 

Use these tags: 

- Sectional tags 
  - article
  - header
  - footer
- Block tags
  - h1
  - p 
- Inline tags 
  - abbr
  - a 

## Challenge 2 - Block quotes and entities

**Step 1** open [challenge-2.html](challenge-2.html) and read the text. This appears to be a quote by someone. The quote stands alone in one block. The last line is the name of the author. 

Look closely at the quotation marks. These are special characters. They are not the straight quote ". Instead they are a curly quote. 

**Step 2** Markup the text to the best of your ability. Think of all the possible tags you could use for the text that is there. 

**Step 3** The text here is a blockquote followed by the name of the author. You can mark this up with a blockquote tag. The text inside is a paragraph. You can use a paragraph here. 

The authors name is not apart of the quote so you can seprate it from the quote using a footer. 

There is no heading. So this is not an article, and doesn't get a header or heading. 

- Block
  - blockquote
  - footer

Imagine the author is speaking the text. What workds would they say more strongly and which words would they emphasize. Use the inline tags below where you think is appropriate. 

- Inline
  - strong
  - em

HTML entities are special characters. To make the special quotes you should use: 

- left quote: &ldquo;
- right quote: &rdquo;

## Challenge 3 - List of Quotes

**Step 1** Open [challenge-3.html](challenge-3.html). Read the text and think about that you see. It looks like a list of three quotes each followed by the author. 

**Step 2** Markup the text to the best of your ability. Think of all the possible tags you could use for the text that is there. 

**Step 3** This is a list of quotes. The order of this list doesn't seem to matter. You'll want to use an unordered list - ul around everything. 

The only tags that can be the children of a ul are li tags. You'll want to make three of these. Inside each of these li tags will go the quotes. 

Each of these is a blockquote and the author. You can use the following for each quote like you used earlier.  

- blockquote
  - p
  - footer

## Challenge 4 - Weather Report

**Step 1** Open [challenge-5.html](challenge-5.html) in your editor and read the text. The text here is a weather report. It inlcudes a list of forecasts by dates. Each forecast leads with a a date followed by a short description of the weather for that day. 

**Step 2** Mark up the text to the best of your ability. 

**Step 3** The whole of the content could be considered an article, it has a heading, and is complete by itself. 

The article leads with a heading showing the source of the weather. 

The weather is shown as a list of dates and descriptions. This could be a unordered list (`<ul>`), or defintition list (`<dl>`). Each date could be marked up with the `<time>` tag. 

- Block 
  - article
  - h1
  - ul and li
  - dl, dt, and dd
- Inline 
  - time

## Challenge 5 - Tweet

**Step 1** Open [challenge-4.html](challenge-4.html) read the content. This is a tweet. 

The whole thing can be considered a complete article. An aritcle must have a heading. 

You can arrange all of the content into a header, content, and footer. 

"Follow" is a button or a link. 

The tweet itself is probably a paragraph. 

At the end there meta data about the tweet. This includes: 

- The date the tweet was published. 
- Retweet and Like counts
- List users who retweeted

**Step 2** Markup the content to the bext of your ability. 

**Step 3** This is open to interpretation.

The header probebly includes the user name, their @ version of their name and the follow link/button. 

The tweet body is probably a paragraph. There is a link in here. 

Everything below the tweet is a footer. The footer contains a date and time (use the `<time>` tag), retweets and likes could be anything use your best judgement. The list of users below is a list. 

Replies, retweens and likes at the bottom could be a few things including a list. Use your best judgement. 

- Block 
  - article 
  - h1
  - p 
  - ul, li
- Inline 
  - button
  - br

Check out the actual tweet for reference: https://twitter.com/hainbach101/status/1179812646415163392?s=12

## Challenge 6 - Android store sections

**Step 1** Open [challenge-6.html](challenge-6.html) read the content. There is a lot of content. 

We could divide the content into sections. I've inlcude a _single space_ to show **blocks** and _multiple lines_ where there should be a **section**. 

The begins with a heading followed by sections.

Each section is made up multiple elements. All sections have headings and headers. Content might be lists, parapgraphs, or other elements. 

**Step 2** Start marking up the document to the best of your ability. Choose the tags that you think best describe the content. 

**Step 3** The content was taken from the Android store. It starts with a heading (h1) followed by sections each with a heading (h2). 

Imagine the h1 as the title of the document with each h2 as an entry in the index. Headings are like that. The h2 headings are sub topics under the main topic h1. 

Let's look at the first section

```html
Phones & Tablets

If you want it,
Android
powers it.
```

The first line is a heading h2. The next three lines are a single paragraph that has been broken into three lines. To force a line break use the `<br>` tag. 

```html
LATEST AND GREATEST

The world’s 
first 5G 
phones.

Download a 4K movie ...

Samsung 
Galaxy 10 5G

LG
V50 ThinQ 5G

Xiaomi
Mi Mix 3 5G

Oppo
Reno 5G
```

This secton starts with a heading followed by two paragraphs. The next section is a list of phones. Each list item is made of the brand and the model. These could be a definition list.

```html
ANDROID ONE

...

POPULAR PICKS

...
```

In this section you can look at "ANDROID ONE" as a heading for this section (h2) and "POPULAR PICKS" as a sub heading (H3). 

Here are a list of tags you might use. 

- Block 
  - section
  - header
  - h1, h2, h3
  - ul, li or dl, dt, dd
  - p
- Inline 
  - br
  - button

Check out the source of the text for this challenge here: https://www.android.com/phones-tablets/
