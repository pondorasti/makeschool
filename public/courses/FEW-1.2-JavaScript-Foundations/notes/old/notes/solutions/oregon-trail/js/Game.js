// Game.js 
// ---------------------------------------------------------
// Game - The Game class creates and manages all of the 
// objects that run the game. 


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
 
  
  // start the journey and time starts running
  startJourney () {
    this.gameActive = true;
    this.previousTime = null;
    this.ui.notify('A great adventure begins', 'positive');

    this.step();
  }
  
  
  // game loop
  step(timestamp) {

    // starting, setup the previous time for the first time
    if(!this.previousTime){
      this.previousTime = timestamp;
      this.updateGame();
    }

    //time difference
    var progress = timestamp - this.previousTime;

    //game update
    if(progress >= Config.GAME_SPEED) {
      this.previousTime = timestamp;
      this.updateGame();
    }

    //we use "bind" so that we can refer to the context "this" inside of the step method
    if(this.gameActive) window.requestAnimationFrame(this.step.bind(this));
  }
  
  //update game stats
  updateGame() {
    //day update
    this.caravan.day += Config.DAY_PER_STEP;

    //food consumption
    this.caravan.consumeFood();

    //game over no food
    if(this.caravan.food === 0) {
      this.ui.notify('Your caravan starved to death', 'negative');
      this.gameActive = false;
      return;
    }

    //update weight
    this.caravan.updateWeight();

    //update progress
    this.caravan.updateDistance();

    //show stats
    this.ui.refreshStats();

    //check if everyone died
    if(this.caravan.crew <= 0) {
      this.caravan.crew = 0;
      this.ui.notify('Everyone died', 'negative');
      this.gameActive = false;
      return;
    }

    //check win game
    if(this.caravan.distance >= Config.FINAL_DISTANCE) {
      this.ui.notify('You have returned home!', 'positive');
      this.gameActive = false;
      return;
    }

    //random events
    if(Math.random() <= Config.EVENT_PROBABILITY) {
      this.eventManager.generateEvent();
    }

  }
  
  // pause the journey
  pauseJourney () {
    this.gameActive = false;
  }

  // resume the journey
  resumeJourney () {
    this.gameActive = true;
    this.step();
  }
}

