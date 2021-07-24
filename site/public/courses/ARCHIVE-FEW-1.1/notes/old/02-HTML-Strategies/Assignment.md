# Assignment 2

Your goal is to mark up some forms and use attributes to configure elements.  

## Challenge 1 - SWAPI - input type number

**Step 1** Open [challenge-1.html](challenge-1.html) in your browser. You should see a simple form with three elements: 

- input field
- select drop down menu
- submit button

Type the number 1 in the field and click submit. It should display information about Luke Skywalker. 

This web page is sending a message to the Star Wars API and displaying the data returned. 

**Step 2** Open [challenge-1.html](challenge-1.html) in your code editor. 

You should see a form element. Inside the form there is an input element with the `id="swapi-id"`. This field should only allow numbers. Add `type="number"`. 

Test your work. 

**Step 3** Find the select element with the `id="swapi-category"`. The select creates a menu defined by the child `<option>` tags. Add an option for each of the categories shown in the comment. 

`<option value="people">People</option>`

The value is used by the program, and text between the tags is displayed in the menu. 

Test the form, refresh the browser. Then choose one of the categories, type a number into the field, and press submit. 

**Step 4** Add a new button between the form tags at the bottom. Set the type to "reset"

`<button type="reset">Reset</button>`

Test the form, refresh the browser. Fill out the form, type soemthing in the field and choose something from the menu. Pressing the reset button should clear the form. 

## Challenge 2 - Input Range and Radio

**Step 1** Open [challenge-2.html](challenge-2.html) in your browser. This is a minimal version of the Giphy API. 

Type a search word into the field and press submit. The page should load a gif and display it. 

**Step 2** Open [challenge-2.html](challenge-2.html) in your code editor. Find form. 

There is an input with `id="giphy-search"`. This is where you are typing the search words. 

Find the comment:

`<!-- make three radio buttons -->`

Do what it says make three radio buttons. Radio buttons are inputs with `type="radio"`. When radio buttons share the same `name` attribuet they work as a group. 

Make some radio buttons with the attribues shown in the comments. The first might look like:  

```html
<label>
  <input type="radio" name="size" value="fixed_height">
  Fixed Height
</label>
```
Wrapping the `input` in a `label` means you'll be able to click the label text "Fixed Height" to activate the radio button, and the radio button will have a label. 

It's important the values match what's shown in the comments these are used by the program to show different types of gifs. 

**Step 3** Add another group of radio buttons. All radio buttons with the same name work together as a group. Only one of the group can be selected at a time. 

Add a new group of radio buttons to set the number of gifs to display. These should all have `name="count"`. The value of each of these should be the number of gifs to show. A radio button to show three gifs might look like: 

```html
<label>
  <input name="count" value="3" type="radio">
  Three
</label>
```

Make a group that with values of 1, 3, 5, and 10. 

## Challenge 3 - Making your own web page 

Use the ideas from lesson 1 to create your own web page. 

Your page can be notes on HTML. Imagine taking notes on HTML using markup to identify and clarify the text content. 

Your web page should use the following tags: 

- Default 
  - html
  - head
  - body
- Sectional
  - section
  - header
  - footer
- Block
  - h1-6
  - p 
  - pre
- Inline 
  - strong
  - em
  - mark
  - a
  - code
  - br 
- Form elements 
  - form
  - input
    - type 








