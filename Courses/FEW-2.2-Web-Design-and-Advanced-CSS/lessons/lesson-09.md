# FEW 2.2 - Advanced CSS - Styling form Controls

Styling controls like buttons and form elements provide some extra challenges and opportunities.

## Why you should know this?

Form elements and controls are points of interaction in your applications. These need to be extra engaging. Hard to use and confusing forms risk losing potential users for application and customers for your business.

## Learning Objectives

1. Style form elements
1. Style elements according to state
1. Use attribute selector
1. Use parent element to control the layout of children

## Review 

- 

### Form elements 

Form elements are `input`, `textarea`, radio button, and checkbox. Your goal today is to style these elements. 

Add the markup below to your style example: 

```HTML
<form>
  <label for="name">Name</label>
  <input id="name" type="text" placeholder="enter name" />
  <label for="email">email</label>
  <input id="email" type="email" placeholder="enter email" />
  <label for="password">password</label>
  <input id="password" type="password" placeholder="enter password" />
  <label for="notes">Notes</label>
  <textarea id="notes" placeholder="enter notes"></textarea>
  <input type="submit">
</form>
```

These are only a few of the input types. There are also input types for: 

- number
- date
- color
- and more...

You'll just style these for now. 

## Styling Inputs

Selectors: 

```CSS
input[type=text], 
input[type=email], 
input[type=password], 
input[type=number], 
textarea {
  /* Your styles here */
}
```

Why these form elements? `<input type="button">` is a thing, it creates a button. Also `<input type="radio">` and `<input type="checkbox">` exist. The inputs listed above all create a single line text input. Though these act differently they all appear as a single line of text entry. 

When styling your inputs use these properties: 

- Typography
  - `font-size`
  - `font-weight` 
  - `color`
- Box 
  - `border-style`
  - `border-width`
  - `border-radius`
  - `border-color`
  - `background-color`
  - `padding`
  - `margin`
  - `box-shadow` (can have multiple, can be inset)

Let's talk about focus. An input has focus when the keyboard can enter text. You can style the input in its focussed state. 

```CSS
input[type=text]:focus, 
input[type=email]:focus, 
input[type=password]:focus, 
input[type=number]:focus,
textarea:focus {
  /* Your styles here */
}
```

What about that outline? The accessibility outline is very important. 

https://a11yproject.com/posts/never-remove-css-outlines/

`outline: none !important;`

Many people don't like the outline. If you don't like this replace it with your own style. Don't remove it!

## Challenge 

Style the form inputs and `textarea`. Use the properties listed above to make good-looking form inputs. 

Think about readability by looking closely at padding and `font-size`. 

Use the `:focus` pseudo-selector to style form elements in their focussed state.

Here are a few ideas: 

- Set a consistent border for all elements 
- Use padding to give some space around the text and the border
- Set the font size, the default font is too small

```CSS
input[type=text], 
input[type=email], 
input[type=password], 
textarea {
  padding: 1em;
  font-size: 1em;
  border: 3px solid var(--dark-gray); /* use a custom property! */
  /* Removing the outline! */
  outline: none !important;
  /* Animate changes */
  transition: 300ms;
}
```

If you've removed the outline be sure to Style the `:focus` state for these elements!

```CSS
input[type=text]:focus, 
input[type=email]:focus, 
input[type=password]:focus, 
textarea:focus {
  border-color: var(--selected-color); /* Use a custom property! */
}
```

## Labels and Selectors

Form elements should always have labels. A label must be associated with its form input. Why? 

- Used by screen readers and accessibility helpers
- Clicking a label activates the form element

A label can be associated with a form element in one of two ways: 

Using an `id` and `for` attributes:

```HTML
<label for="name">Your name</label>
<input id="name">
```
Or wrap the input in the label: 

```HTML
<label for="name">
  Your name
  <input id="name">
</label>
```

Each of these methods has its pros and cons. You should choose one style to use for your framework. This is how developers using your framework will need to write markup when using for elements. 

## Challenge: inputs

Define some styles for form elements in your framework. Use Bootstrap or one of the other frameworks we looked at earlier as a guide. 

Take a look at these:

https://getbootstrap.com/docs/5.0/forms/overview/#overview

These styles are not complicated but they do look better than the default styles. 

Add style for the input elements to your framework. The input can represent the test inputs like text, email, password, and number. An `input` can also be a button, radio button, and checkbox. These have a vastly different style. Here you want to style: text, email, password, and number. 

Use the guide above and be sure to consider the following: 

- font family
- font size
- color
- border
- padding

Also, style the label element. Labels are used to label form elements! Usually, a form element will have a label. 

## Forms 

Forms are groups of inputs. Forms are important to your applications. If people aren't willing to enter their information your websites are not going to go very far. Good-looking easy to use forms encourage people to use them. 

By default form elements are inline. This means they line up like words in a paragraph. More often you'll want forms to arrange themselves in a column. 

The form element can arrange it's children using flex. Using flex-direction. Here are some styles to get you started: 

```CSS
form {
  display: flex;
  flex-direction: column;
}
```

Style the labels. They might look better with a little margin: 

```CSS
label {
  margin: 1em
}
```

Usually, the submit button will be at the bottom and often on the left. 

```CSS
input[type=submit], button[type=submit] {
  align-self: flex-end;
}
```

## Challenge: Forms

Style your form. You want to set the basic layout without doing everything. The goal is to get enough style to make things look good while not doing so much that your forms can't be customized.

Add style for form layout to your framework. Use flexbox. You probably want form elements to default to a column. 

## Checkboxes and radio buttons

Checkboxes and radio buttons are special inputs. These do not provide much that you can style. They also appear different in different browsers. 

What can you do? You can style the label! Remember that clicking on the label is the same as clicking on the input it is associated with! 

The label can be styled extensively. 

Follow the example here and create a customized check box and radio button. 

https://www.w3schools.com/howto/howto_css_custom_checkbox.asp

With only the label element to work there is a limit to what you can draw. Luckily CSS provides to special elements: 

- `:before` (adds a first child element)
- `:after` (add a last child element)
- `:checked` (is active when the element is selected)

These can be used to add elements that don't exist in your source markup. You can use them with the check box to add the checkmark. 

Use the content property to set the content of the new pseudo-element. 

Follow the custom checkbox example. Here `:after` is used to add the checkmark. This checkmark is a box with a border on two sides, that has been rotated 45 degrees. 

The `:checked` pseudo-class applies when a check box or a radio button is currently selected. 

## After Class

Wrap up your CSS Framework styles by styling the form elements. Submit your completed framework to GradeScope. 

- Add styles for input elements to your framework. See [Challenges: Input](#challenge-inputs)
- Add form layout styles. See [Challenges: Forms](#challenge-forms)
- Add add radio and checbox styles. [See notes above](#Check-boxes-and-radio-buttons)

## Additional Resources

1. https://css-tricks.com/the-checkbox-hack/
