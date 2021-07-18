# MNML

## Colors
MNML offers a ton of color options all available in CSS variable at the top of the CSS file
## Navbars
```
<div class="navbar">
    <ul>
        <li class="title">MNML</li>
    </ul>
    <ul>
        <li>Link 1</li>
        <li>Link 2</li>
        <li>Link 3</li>
    </ul>
</div>
<div class="navbar">
    <ul>
        <li class="title">MNML</li>
        <li>Link 1</li>
        <li>Link 2</li>
        <li>Link 3</li>
    </ul>
</div>
<div class="navbar">
    <ul>
        <li>Link</li>
        <li>Link</li>
        <li>Link</li>
    </ul>
    <ul>
        <li class="title">MNML</li>
    </ul>
    <ul>
        <li>Link</li>
        <li>Link</li>
        <li>Link</li>
    </ul>
</div>
```
## Buttons 
buttons can have a danger or success class added to quickly make them cyan or red
```
<button class="primary" type="button">Primary</button>
<button class="secondary " type="button">Secondary</button>
<button class="tertiary" type="button">Tertiary</button>
```
## Forms 
to have inputs on the same row simply add a div with the class container-row class!
```
<form action="" style="margin-left: 5px">
    <label>Username</label>
    <input type="text">
    <label>Password</label>
    <input type="text">
    <div class="container-row" style="justify-content: space-evenly">
        <div class="container">
            <label for="">Birthday</label>
            <input type="text">
        </div>
        <div class="container">
            <label for="">Date</label>
            <input type="text">
        </div>
    </div>
    <div class="container-row" style="justify-content: flex-start">
        <button class="primary">Sign Up!</button>
        <button class="tertiary">cancel</button>
    </div>
</form>
```
## Components
MNML offers a slideshow component, just make sure to include the slide.js file in your HTML
```
<slide-show></slide-show>
```
## Footers 
footers take in containers and can also have footer-subtitles!
```
<div class="footer">
    <div class="container-column">
        <div class="container-row" style="justify-content: flex-start">
            <a href="https://github.com/salvadb23/mnml">Github</a>
            <a href="https://linkedin.com/in/salvadorbecerra">LinkedIn</a>
            <a href="https://salvadb23.github.io">Portfolio</a>
        </div>
        <div class="footer-subtitle"> MNML was made with ❤️ in SF by Salvador Becerra</div>
        <div class="footer-subtitle">we also have a footer class!</div>
    </div>
</div>
```
