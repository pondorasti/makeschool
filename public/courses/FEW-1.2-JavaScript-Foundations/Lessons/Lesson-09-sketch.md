<!-- .slide: data-background="./Images/header.svg" data-background-repeat="none" data-background-size="40% 40%" data-background-position="center 10%" class="header" -->
# FEW 1.2 - Lesson 9 - Styling Components

<!-- Put a link to the slides so that students can find them -->

<!-- ➡️ [**Slides**](/Syllabus-Template/Slides/Lesson1.html ':ignore') -->

<!-- > -->

## Minute-by-Minute

| **Elapsed** | **Time** | **Activity** |
| ----------- | --------- | ------------ |
| 0:00 | 0:05 | [Why you should know this?](#why-you-should-know-this) |
| 0:05 | 0:15 | [Learning Objectives](#learning-objectives) |
| 0:20 | 0:30 | [Using Sketch](#using-sketch) |
| 0:50 | 0:10 | BREAK |
| 1:00 | 0:45 | In Class Activity II |
| 1:45 | 0:05 | Wrap up review objectives |

<!-- > -->

## Why you should know this?

Components can be styled with CSS. The component architecture and virtual DOM mean styles need to be handled a little differently with React projects.

<!-- > -->

## Learning Objectives

1. Use CSS with React
1. Organize CSS with Components 
1. Describe BEM (Block Element Modifer) naming
1. Use BEM

<!-- > -->

## Using Sketch 

Sketch can be a valuable tool for designing websites. I recommend you plan your project with Sketch before starting to code. 

Create an art board for web. Use the artboard as one webpage. For responsive designs you'll need an artboard for each screen size you want to support. 

- Choose insert > Artboard
- Choose Responsive Web
  - Create an artboard at one of the sizes
  - You can choose sizes for desktop, tablet, and mobile
- Draw your wire frame!

Wire frame in components. As you work on your wireframes think of each box you draw as a component. Remember you can reuse components. Elements that are repeated can share the same component.

Use Symbols like components. Symbols in Sketch are reusable elements that also allow some level of configuration. 

**Symbols in Sketch are very similar to React Components**

Dram soemthing with Sketch. This could be an object made of several shapes and text. Draw a button using a rectangle for the background and a text object as a label. 

- Select both elements and choose: Layer > Create Symbol. 
- Give the Symbol a descriptive name
- Select the symbol in your Artboard. Look at the properties. Notice the Overrides section. You can edit the text of the Symbole here. 
- Insert a new copy of this Symbol choose: Insert > Document > [Symbol Name]
- With this new Symbol override the text.

Editing a Symbol changes all instacnes of a Symbol. 

- Double Click either of your Symbol instances. This should display a special Page where you can edit the source of the Symbol. 
- Change your Symbole. Chaneg the font, color, or background
- Click Return to Instance. 

You can have as many sintacnes in a document as you need. Instances can be embeded in other Symbols. This is an especially powerful feature since the symbol becomes an override. 

- Edit the button Symbol. 
- Make a Symbol out of backgroud rectangle in the button symbol. Make sure to not include the text object. 
- Give your new Symbol a name like: "Button back gray"
- Copy this symbol in your Symbols page. Change the color of the reactangle and rename the Symbol: "Button Back Blue" or something similar. 
- In your main page select one of of the instances of the button symbol. Override the background color symbol instance. 

## Wire frame your project in skecth 

- Open Sketch or Adobe XD. 
- Make an artboard for a desktop sized app.
- Wireframe the page page you want to create, or tutorial project. 
- When you find an element that is repeated make a symbol. 
  - Repeated elements might be: 
    - Links
    - Content sections
    - Cards

Do your best to style elements as closely as you can to what you want in your web site. 

- Set the colors
- Set the fonts

Later when you are applying styles right click elements in sketch and choose "Copy CSS Styles". While this will do all of the work it migth help you respolve the style properties needed for various elements. 

<!-- > -->

## Styling Comoponents

https://reactjs.org/docs/faq-styling.html

**Inline styles**

Any HTML element can uses styles defined in the style sttribute. Generally these are considered not best practice. 

React turns this notion on it's head. Since components are self contained and reusable it's a good idea for them to contain their styles. 

In traditional websites separation of style structure and logic is the standard. 

```JSX
const divStyle = {
  color: 'blue',
  backgroundImage: 'url(' + imgUrl + ')',
};

function HelloWorldComponent() {
  return <div style={divStyle}>Hello World!</div>;
}
```

Note the value assigned to the style prop/attribute is an object and all properties should match the JS property names in camelcase.

```JSX
function HelloWorldComponent() {
  return <div style={{ color: 'blue', fontSize: '24px' }}>Hello World!</div>;
}
```

- Pros: 
  - Styles and components are in a single file. You can see the styles and code side by side.
  - Styles are written in JS which allows values to be calculated with JS
  - Styles are very portable with no extra files. 
  - Avoids name space collisions
- Cons: 
  - Inline styles may have performance issue. 
  - Inline styles are add some extra code to your component files.
  - Doesn't leverage the advantages of using a styl`esheet`

**Single Stylesheet**

You can still use a single stylesheet like you have done in the past. This works best when components are not shared across multiple projects. 

This has the advantages of traditional stylesheets in that all of your styles are in one place.

To implement this technique put all of your styles in index.css or App.css.

- Pros: 
  - Having all of your styles in one place is efficient
  - It's way you have worked in the past. 
  - Leverages the advantages of stylesheets
- Cons: 
  - Components are less portable since styles are separate.

**Component StyleSheets**

Since components are reusable from project to project being able to easily include styles with the component is good. 

This technique replies on the configuration of the Create React App project. This project allows styles to be imported into components just like JS files. 

Using this technique you would create a style sheet for each component. Best practice would be to name the style sheet with the same name as the component. You'll see this in the Create React App starter code. 

Create a style sheet with the same name as your component. 

`App.css`

Import that style sheet at the top of the component: 

`import App.css`

- Pros: 
  - Using Style sheets is good
  - Components are very portable
  - Clear which styles belong to which components
- Cons: 
  - Has potential for name clashes
  - Requires careful naming of classes in style sheet

<!-- > -->

## Defining your Final Project

Your final project should

- Use react
- Use React Router
- Be worth putting in your portfolio

<!-- > -->

<!-- .slide: data-background="#087CB8" -->
## [**10m**] BREAK

<!-- > -->

## Lab



<!-- > -->

## Wrap Up (5 min)

- Continue working on your current tutorial
- Complete reading
- Complete challenges

<!-- > -->

## Additional Resources

1. Links to additional readings and videos

