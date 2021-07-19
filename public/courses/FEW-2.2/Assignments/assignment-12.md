# FEW 2.2 - Advanced CSS - Framework 

## Description 

Besides all of the default elements your framework should offer some build in "components". These are things that can be used to present content in alternative ways. 

### Why this assignment?

Your framework is almost complete these are the details that will take it across the finish line making it useful in a wider range of cases. 

## Project requirements

Finish your framework by supporting the components below. Each of these components should implemented with sensible markup and a class name. Use selectors to your advantage here. 

Along with each of the components listed below I've included links to samples of these components implement by Bootstrap, Foundation, and Materialize. Follow their lead. Looks closely at the markup they have used and the class names.

Keep it simple. Don't over think these. Get the minimum features working to where it looks acceptable and move on to the next. By creating minimal style they can be used in more situations and modified by our end users. 

- **Alert** define an alert class. You should be able to apply this to a div and get a box that looks like an alert message. 
  - Sample - You can follow the styles here and the class name and HTML structure. The main formula is a background color, padding, text color, and may be a border. 
    - https://getbootstrap.com/docs/4.3/components/alerts/
- **Badge** are text elements that have a style that calls them out. You see them on your phone as the number messages waiting for, or you'll see them on web sites marking something as "New". 
  - Samples - Take a look at how these frameworks style badges. Notice the badge is usually a class name applied to a span. You can follow the same pattern. The formula is display: inline-blockm padding, background color, and color. 
    - https://materializecss.com/badges.html
    - https://foundation.zurb.com/sites/docs/badge.html
    - https://getbootstrap.com/docs/4.3/components/badge/
- **Button Group** is a set of buttons that look like they belong together. Usually we use these when we want to show related choices. 
  - Samples - Take a look at the sample and pay attention to the html structure and the class names. Usually there is a parent element with a class name and the children style themselves to look like a group. In both Foundation and Bootstrap the parent is a `div` and the children are `a` tags. Styles can be display inline-block, background color, color. Bootstrap styles the border radius of the first and last children.
    - https://foundation.zurb.com/sites/docs/button-group.html
    - https://getbootstrap.com/docs/4.3/components/button-group/
- **Card** Cards are content conmtainers. They are usually set apart from other elements with a border. A card might have a text, and a picture, and a button, or might only be some of these. 
  - Samples - Look at the mark up in the samples. Usually it's just a div with a class name. Styles might be border, display:flex, flex direction column, and maybe a background color. Card's might want overflow hidden also. 
    - https://getbootstrap.com/docs/4.3/components/card/
    - https://foundation.zurb.com/sites/docs/card.html
    - https://materializecss.com/cards.html
  - Stretch Goal - Make your card support the features below. Look closely at how Bootstrap and Foundation handle these. Usually it's class name for example `class="card"` on the container and `class="card-img"` for an image in a card. 
  - Image - An image in a card it should probably fill the card. 
  - Header - Appears at the top of a card maybe uses a different background color
  - Footer - Appears at the bottom of a card
  - Overlay - See the sample here: https://getbootstrap.com/docs/4.3/components/card/#image-overlays
  - Layouts - Cards can arrange their content on the horizontal or vertical axis. 
    - Horizontal - See the sample here: https://getbootstrap.com/docs/4.3/components/card/#horizontal
    - Vertical - 
- **Table** Style your tables. Tables are made of several tags. Familiarize yourself with these first. Then you can style the tag names. This will help you get started: https://www.w3schools.com/html/tryit.asp?filename=tryhtml_table_intro
  - Samples - Take a look at the samples to get an idea of what your tables could look like. These are a big improvement over the default styles. 
    - https://foundation.zurb.com/sites/docs/table.html
    - https://getbootstrap.com/docs/4.3/content/tables/
  - Headers `<thead>` & `<th>`
  - Table Rows `<tr>`

### Deliverable

- New styles added to your framework
- Samples of each style included in the documentation 

### Due date

Class 10

## Assessing the assignment

| Expectations | Does not meet | Meets | Exceeds |
|:---|:---|:---|:---|
| Completion | You have created less than 100% components listed in the homework description. | You have created 100% of the components listed in the assignment description | Besides the listed components you have added more components of your own design |
| Quality | You components don't work with the rest of your design and have obvious flaws | Your components look at home and match the rest of your framework | Your components looks great and beg designers to use them in a website |
| Comprehension | You're not sure why the styles are creating what you see on the screen | You can easily explain the styles used in your components and would not have a problem modifying these | YOu could easily build these components or extend these components in another project |
| Work ethic | few massive commits | Commits outline progress. Your read clearly documents the use and application of your framework | You have clearly outlined the progress and future extensions of your framework in your readme. |