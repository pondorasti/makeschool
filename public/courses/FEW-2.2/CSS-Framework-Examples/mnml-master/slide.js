{ 
    
    class Slideshow extends HTMLElement{
        constructor(){
            super()

            this._shadowRoot = this.attachShadow({mode:"open"})
    
            const img = document.createElement("img")
            this._shadowRoot.appendChild(img)

            // get a list of img tags outside the shadows 
            const allImages = Array.from(document.querySelectorAll('slide-show img'))
            const allSources = allImages.map(image => image.src)
            
            img.style.width = "100%"
            img.style.height = "300px"
            img.style.borderRadius = "5px"
            
            

            let counter = 0
            setInterval(() => {
                img.src = allSources[counter]
                counter += 1
                if (counter === 3) {
                    counter = 0
                }
            },2500)
        }

        

        // use lifecycle methods 
        // added DOM 
            // Start timer...
            // show first image 

        // removed from DOM
            // clear interval 


    
    }
    
    customElements.define('slide-show',Slideshow)
}
