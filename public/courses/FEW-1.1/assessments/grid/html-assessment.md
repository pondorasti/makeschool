# HTML Assessment

You need to make a form that allows someone to order a custom t-shirt. They will input an image file, a message, the size of the shirt and whether it should have long sleeves.

The challenge contains some new tags an attributes. 

## Challenge 1 - 

Create a default HTML page Include:

- doctype 
- html
- head
- title
- body 

## Challenge 2 - 

Use the `<figure>` and `<figcaption>` tags (look these up). 

Make a `figure` which contains an `img` and a `figcaption`. Add the `id` names shown below. 

- figure 
  - img `id="user-image"`
  - figcaption `id="display-message"`

## Challenge 3 

Add a `<form>` to the page. 

Within the form add the following...

### File input 

This should be an `<input>` of type `file`. Give this an `id` of `"file-upload"`.

### Message input 

Add an `<input>` for a message. This should be type `text` and have an `id` of `"input-message"`.

### Radio button for shirt size

Create a radio button group for shirt size. 

You should have three radio buttons. Be sure to use appropriate attributes. They need to work together where only one can be selected at a time.

Give each radio button a `name` of `size` and the following labels, the `value` of each radio button should match it's label. 

- small 
- medium
- large

### Check box for long sleeves

Add an `<input>` with type `checkbox` and a label `"Long Sleeves"`.

## Validate your work

Use the HTML validator to validate your work. 

Add `id` attribute with value of "form" to the form tag. 

## Add a script

Add the following script below your form. 

```HTML
<script>
    const fileUpload = document.getElementById('file-upload')
    const userImage = document.getElementById('user-image')
    const displayMessage = document.getElementById('display-message')
    const inputMessage = document.getElementById('input-message')
    const form = document.getElementById('form')
  
    form.onsubmit = function(e) {
      e.preventDefault()
    }
  
    inputMessage.oninput = function(e) {
      console.log(e.target.value)
      displayMessage.innerHTML = e.target.value
    }
  
    fileUpload.onchange = function(e) {
      console.log(e.target.files)
      const fr = new FileReader()
      fr.onload = function(e) {
        userImage.src = e.target.result
      }
      fr.readAsDataURL(e.target.files[0])
    }
  </script>
  ```



