
class rainbowText extends HTMLElement {
  constructor() {
    super();

    this._shadowRoot = this.attachShadow({ mode: 'open' });
    this._text = this.innerHTML

    this._characters = this._text.split('')
    for (let i = 0; i < this._characters.length; i += 1) {
      const el = document.createElement('span')
      el.innerHTML = this._characters[i]
      this._shadowRoot.appendChild(el)
      const hue = 30 * i % 360
      el.style.color = `hsl(${hue}, 100%, 50%)`
    }
  }
}

customElements.define('rainbow-text', rainbowText);

/*

- Challenge - 1 - 

All of the words in the 'rainbow-text' tag should each be a different
color. To make this happen you'll need to get the text from the source
tag, split into words, make a span for each word and style each of 
these spans with a color. 

Follow these steps: 

- Get the text from the source tag with this.innerHTML
- Split this into an array of words with split(' ')
- Loop over the words
  - Make a span element 
  - Set the innerHTML to the word
  - Set the style to a color
  - Append the span to the shadowRoot

To set the color you can use one of these methods. 

Set the color with something like this: 

const hue = 360 / words.length * i
hsl(hue, 100%, 50%)

something like this would work also: 

const hue = 30 * i % 360

*/