# FEW 1.2 - Class 6

## Working with Class Objects

The original game was made with Object literals. You can improve on this by using Class Objects. Defining a Class makes the code easier to read and provides more intent on what we are trying to express with code. Using Classes also gives us a better syntax for expressing our code. 

## Objectives 

- Build and define classes from code written as object literals
	- Idenitfy and define Properties 
	- Identify and define Methods
- Create class structures with: 
	- constructor
	- methods 
	- properties 
- Use `this` and identify it's context

## Update to Class Objects 

Read up on JavaScript Classes [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)

## General Structure 

The game is built with a single object `OregonH`. This acts as a _name space_. The name space is a single variable to store all variables and functions used by the application. The alternative would be to have many global variables and functions, which is error prone and invites missuse. 

This name space gives the game a place to store all of it's data and methods. This good because other scripts are unlikely to overwrite names used here. 

At the root of `OregonH` are properties that are global to the game, that is they are shared by all of the Objects and methods. These are things like `FINAL_DISTANCE` which sets the distance the caravan has to travel to, and `WEIGHT_PER_OX` which sets the amount each oxen can carry. 

You can view these properties yourself by opening the game in the browser. Open the console and type: `OregonH`. You'll see an object with many properties.

Here is a list of all of the properties. 

- `DAY_PER_STEP`
- `ENEMY_FIREPOWER_AVG`
- `ENEMY_GOLD_AVG`
- `EVENT_PROBABILITY`
- `FINAL_DISTANCE`
- `FIREPOWER_WEIGHT`
- `FOOD_PER_PERSON`
- `FOOD_WEIGHT`
- `FULL_SPEED`
- `GAME_SPEED`
- `SLOW_SPEED`
- `WEIGHT_PER_OX`
- `WEIGHT_PER_PERSON`

The `OregonH` object also holds a couple other objects. These contain systems that manage parts of the game. These are: 

- `Caravan` - Keeps track of the Caravan
- `Event` - Manages events that occur in the game
- `Game` - Manages general game stuff
- `UI` - Handles the User Interface

Each of these has it's own file and the code that generates this object is contained in that file. 

Each of these files declares the `OregonH` variabel at the top like this: 

`var OregonH = OregonH || {};`

This says assign `OregonH` to itself or assign it an empty object, if it has been assigned.  This mechanism is used to share this object across all of the JS files. 

## Challenges 

The game is made up of several Objects each with properties and methods that control and manage game play. 

Your job is to convert these into Class Objects. You need to define a class to replace each of the object literals that were used by the original code. 

**Challenge 1**: Create the Caravan Class. 

Convert the Caravan Object into a Class. This Object is defined in `Caravan.js`. The Caravan Object has the following properties and methods.
    
- Properties: 
  - `day`
  - `distance` 
  - `crew`
  - `food`
  - `oxen`
  - `money`
  - `firepower`
- Methods 
  - `init(stats)`
  - `updateWeight()`
  - `updateDistance()`
  - `consumeFood()`
- Create an instance of the class to replace the existing object. 

**Challenge 2**: Create the UI Class

Convert the UI Object to a class. This Object is defined in 'UI.js'. The `UI` Object doesn't have any properties. Though it could make use of a few! The `refreshStats` looks up the 'stat' elements each time it is called. Rather than looking these up you could get a reference once and store it in a property. The same is true for the `div#shop` and `div#prods`.  
    
- Properties:
  - ?
- Methods:
  - `notify(message, type)`
  - `refreshStats()`
  - `showAttack(firePower, gold)`
  - `fight()`
  - `runAway()`
  - `showShop(products)`
  - `shopDivHandler(e)`
  - `buyProduct(product)`
  
**Challenge 3**: Create an Event Class, and classes for the other Objects used by Event. 

Look closely at `Event.js`. This file creates several Objects. 
  
- `Event` - Holds and manages all of the Event functionality. 
- `eventTypes` - is an Array of Objects. These Objects all describe an Event that can occur in the game. There are different types of events here
  - STAT-CHANGE
  - ATTACK
  - SHOP
  
Within a 'SHOP' event there is a `products` property. This is an Array of Objects. These Objects describe a product a player can buy from the shop. These Objects have the following properties: 

- `item`
- `qty`
- `price`

You should make a Class for each of these Objects! Here is a list of the Classes their properties and methods:  

- `Product`
  - Properties:
    - `item`
    - `qty`
    - `price`
- `EventType`
  - Properties:
    - `type`
    - `notification`
    - `stat`
    - `value`
    - `text`
    - `products`
- `EventManager`
  - Properties:
    - 
- `EventManager`
  - Properties:
    - game
    - eventTypes
  - Methods:
    - `generateEvent()`
    - `stateChangeEvent(eventData)`
    - `shopEvent(eventData)`
    - `attackEvent(eventData)`

**Challenge 4**: Create a Game Class. This should replace the Game Object. This Object is responsible for managing all of the other Objects. 
    
- Properties: 
  - `ui`
  - `eventManager`
  - `caravan`
- Methods
  - `init()`
  - `startJourney()`
  - `step()`
  - `updateGame()`
  - `pauseJourney()`
  
Looking closely you'll see that Each of these classes: UI, Caravan, and EventManager own a reference to the other classes. This is needed since Event will need to send an event to Caravan, and Caravan might need to update UI at some point

You won't be able to set these references until after the Objects are created. For this reason the Game Class has the job of creating and initializing the other classes. 

In the original code Game.init() has the job of setting reference to the other Objects. If you make a class Object for Game you can use the constructor function to create the other Objects and set the references for each. Something like:

```JavaScript
class Game {
  // Initialize the Game Object
  constructor() {
    // Create dependent Objects 
    this.ui = new UI(this);
    this.eventManager = new EventManager(this);
    this.caravan = new Caravan(this);

    // pass references - set dependencies 
    this.caravan.ui = this.ui;
    this.caravan.eventManager = this.eventManager;

    this.ui.caravan = this.caravan;
    this.ui.eventManager = this.eventManager;

    this.eventManager.caravan = this.caravan;
    this.eventManager.ui = this.ui;

    // begin adventure!
    this.startJourney();
  }
            
...

}
````

** Challenge 5**: Make it all work! The last step is getting all of this updated code to work. The goal is to have instances of the Class Objects replace the Objects from the original tutorial code. 

You'll need to create an instance of each of the new Class Objects. You'll also need to make these instances available to other instances. Notice in `OregonH.Game.init()` find: 

```JavaScript
//reference ui
this.ui = OregonH.UI;
```

Earlier in 'UI.js' the `UI` Object was created and assigned to `OregonH` as a property. The code snippet above from 'Game.js' assigns this to it's own `ui` property so it has a reference to UI. This happens in a few places. 



