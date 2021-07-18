(function() {

  // Use this to simplify handling key codes 
  const KEYCODE = {
    DOWN: 40,
    LEFT: 37,
    RIGHT: 39,
    UP: 38,
    HOME: 36,
    END: 35,
  }

  // Count the number of tabs created to generate unique ids
  // Could this be a static method? 
  let howtoTabCounter = 0;
  // Count the number of panels use to generate unique ids
  // Could this be a static method
  let howtoPanelCounter = 0;

  // Define a template for the howto tabs container
  const template = document.createElement('template');
  template.innerHTML = `
    <style>
      :host {
        display: flex;
        flex-wrap: wrap;
      }
      ::slotted(howto-panel) {
        flex-basis: 100%;
      }
    </style>
    <slot name="tab"></slot>
    <slot name="panel"></slot>
  `;

  // Define the HowtoTabs class it extends HTMLElement 
  // and will be used to create a new HTML tag
  class HowtoTabs extends HTMLElement {
    constructor() {
      super(); // must call super!

      // bind slot change event 
      this._onSlotChange = this._onSlotChange.bind(this)
      // Create a shadow root 
      this.attachShadow({mode: 'open'})
      this.shadowRoot.appendChild(template.content.cloneNode(true))
      // Get the slot tab element
      this._tabSlot = this.shadowRoot.querySelector('slot[name=tab]')
      // Get the slot panel element 
      this._panelSlot = this.shadowRoot.querySelector('slot[name=panel]')
      // Listen for slot change events 
      this._tabSlot.addEventListener('slotchange', this._onSlotChange)
      this._panelSlot.addEventListener('slotchange', this._onSlotChange)
    }

    // Lifecycle handle adding to the DOM
    connectedCallback() {
      // Setup some keyboard and mouse events 
      this.addEventListener('keydown', this._onKeyDown)
      this.addEventListener('click', this._onClick)

      // Check for role attribute 
      if (!this.hasAttribute('role'))
        this.setAttribute('role', 'tablist');

      // Wait til this component has been loaded then link panels
      Promise.all([
        customElements.whenDefined('howto-tab'),
        customElements.whenDefined('howto-panel'),
      ]).then(_ => this._linkPanels())
    }

    // Lifecycle method handle removal of this element from the DOM
    disconnectedCallback() {
      // Better clean up those listeners
      this.removeEventListener('keydown', this._onKeyDown)
      this.removeEventListener('click', this._onClick)
    }

    // Handle slot change events
    _onSlotChange() {
      this._linkPanels()
    }

    // Link the tabs with the adjacent panels 
    // Remember these are user defined in the markup
    // The role attribute sets the role of each element
    _linkPanels() {
      // Get the tabs 
      const tabs = this._allTabs()
      // Set up the aria labels on each element
      // These are used for accessibility and are used here to 
      // ... 
      tabs.forEach(tab => {
        const panel = tab.nextElementSibling
        if (panel.tagName.toLowerCase() !== 'howto-panel') {
          console.error(`Tab #${tab.id} is not a` +
            `sibling of a <howto-panel>`);
          return;
        }

        tab.setAttribute('aria-controls', panel.id);
        panel.setAttribute('aria-labelledby', tab.id);
      })

      // Mark the selected tab
      const selectedTab =
      tabs.find(tab => tab.selected) || tabs[0];
      this._selectTab(selectedTab);
    }

    // Gets all the panels 
    // querySelector() returns an Array "like so convert to array
    _allPanels() {
      return Array.from(this.querySelectorAll('howto-panel'));
    }

    // Get all the tabs
    _allTabs() {
      return Array.from(this.querySelectorAll('howto-tab'));
    }

    // Helper function returns the panel for a given tab
    _panelForTab(tab) {
      const panelId = tab.getAttribute('aria-controls');
      return this.querySelector(`#${panelId}`);
    }

    // Returns the previous tab from the selected tab
    _prevTab() {
      const tabs = this._allTabs();
      const newIdx =
      tabs.findIndex(tab => tab.selected) - 1;
      return tabs[(newIdx + tabs.length) % tabs.length];
    }

    // Returns the first tab
    _firstTab() {
      const tabs = this._allTabs();
      return tabs[0];
    }

    // Returns the last tab
    _lastTab() {
      const tabs = this._allTabs();
      return tabs[tabs.length - 1];
    }

    // Get the next tab from the selected tab
    _nextTab() {
      const tabs = this._allTabs();
      let newIdx = tabs.findIndex(tab => tab.selected) + 1;
      return tabs[newIdx % tabs.length];
    }

    // Resets tabs and panels
    // Deselects all tabs and hides all panels
    reset() {
      const tabs = this._allTabs();
      const panels = this._allPanels();

      tabs.forEach(tab => tab.selected = false);
      panels.forEach(panel => panel.hidden = true);
    }

    // Selects the given tab and shows the corresponding panel
    _selectTab(newTab) {
      this.reset(); // deselect and hide everything
      const newPanel = this._panelForTab(newTab); // Get the panel
      if (!newPanel)
        throw new Error(`No panel with id ${newPanelId}`);

      newTab.selected = true;
      newPanel.hidden = false;
      newTab.focus();    
    }

    // Handle key events
    _onKeyDown(event) {
      // Prevent the default behavior
      event.preventDefault();
      // Check the role of the sender of this event
      if (event.target.getAttribute('role') !== 'tab')
        return;

      // Wasa the alt key involved?
      if (event.altKey)
        return;

      // Figure out the new tab
      let newTab;
      switch (event.keyCode) {
        case KEYCODE.LEFT:
        case KEYCODE.UP:
          newTab = this._prevTab();
          break;

        case KEYCODE.RIGHT:
        case KEYCODE.DOWN:
          newTab = this._nextTab();
          break;

        case KEYCODE.HOME:
          newTab = this._firstTab();
          break;

        case KEYCODE.END:
          newTab = this._lastTab();
          break;
        default:
          return;
      }

      // Select the new tab
      this._selectTab(newTab);
    }

    // Handle clicks 
    _onClick(event) {
      // Check the role of the event target
      if (event.target.getAttribute('role') !== 'tab')
        return;

        this._selectTab(event.target);
      }
    }

    // Define the new custom element
    customElements.define('howto-tabs', HowtoTabs);
    




    
    // -----------------------------------------------------
    // make a class for a how tab
    class HowtoTab extends HTMLElement {
      // make this attribute available outside 
      static get observedAttributes() {
        return ['selected'];
      }
  
      // call super! 
      constructor() {
        super();

      }
  
      // Lifecycle added to DOM
      connectedCallback() {
        // Set the rol attribute to tab
        this.setAttribute('role', 'tab');
        // Generate a unique id
        if (!this.id)
          this.id = `howto-tab-generated-${howtoTabCounter++}`;

        // Set some other attributes for fun and profit!
        this.setAttribute('aria-selected', 'false');
        this.setAttribute('tabindex', -1);
        this._upgradeProperty('selected');
      }
        
      // Not sure what's going on here. Sounds like it's safeguarding 
      // against situations where the property is set but the component
      // isn't notified or doesn't read the change. 
      _upgradeProperty(prop) {
        if (this.hasOwnProperty(prop)) {
          const value = this[prop];
          delete this[prop];
          this[prop] = value;
        }
      }

      // Handle changes to attributes and reflect them to properties
      attributeChangedCallback() {
        const value = this.hasAttribute('selected');
        this.setAttribute('aria-selected', value);
        this.setAttribute('tabindex', value ? 0 : -1);
      }
  
      set selected(value) {
        value = Boolean(value);
        if (value)
          this.setAttribute('selected', ''); // Use an empty attribute as truthy
        else
          this.removeAttribute('selected'); // Remove attribute as falsy
      }
    
      get selected() {
        return this.hasAttribute('selected');
      }
    }
    
    // Define the new custom element 
    customElements.define('howto-tab', HowtoTab);

    // ----------------------------------------------------
    
    // Define the howto panel Component 

    class HowtoPanel extends HTMLElement {
      constructor() {
        super(); // must call super!
      }
  
      // Lifecycle do stuff when added to the DOM
      connectedCallback() {
        // Set the role
        this.setAttribute('role', 'tabpanel');
        if (!this.id)
          this.id = `howto-panel-generated-${howtoPanelCounter++}`;
      }
    }

    // Define the custom element 
    customElements.define('howto-panel', HowtoPanel);
  })();

