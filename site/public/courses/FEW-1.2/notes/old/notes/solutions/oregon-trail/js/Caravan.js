// Caravan.js
// ---------------------------------------------------------
// Caravan 

class Caravan {
  constructor(game) {
    this.game = game;
    // Initialize Caravan with a default Object and proeprties 
    this.init({
      day: 0,
      distance: 0,
      crew: 30,
      food: 80,
      oxen: 2,
      money: 300,
      firepower: 2
    });
  }

  // Initializes the caravan
  init({ day, distance, crew, food, oxen, money, firepower }) {
    this.day = day;
    this.distance = distance;
    this.crew = crew;
    this.food = food;
    this.oxen = oxen;
    this.money = money;
    this.firepower = firepower;
  }
  
  // update weight and capacity
  updateWeight () {
    let droppedFood = 0;
    let droppedGuns = 0;

    // how much can the caravan carry
    this.capacity = this.oxen * Config.WEIGHT_PER_OX + this.crew * Config.WEIGHT_PER_PERSON;

    // how much weight do we currently have
    this.weight = this.food * Config.FOOD_WEIGHT + this.firepower * Config.FIREPOWER_WEIGHT;

    // drop things behind if it's too much weight
    // assume guns get dropped before food
    while (this.firepower && this.capacity <= this.weight) {
      this.firepower--;
      this.weight -= Config.FIREPOWER_WEIGHT;
      droppedGuns++;
    }

    if (droppedGuns) {
      this.game.ui.notify(`Left ${droppedGuns} guns behind`, 'negative');
    }

    while (this.food && this.capacity <= this.weight) {
      this.food--;
      this.weight -= Config.FOOD_WEIGHT;
      droppedFood++;
    }

    if (droppedFood) {
      this.game.ui.notify(`Left ${droppedFood} food provisions behind`, 'negative');
    }
  }


  // update covered distance
  updateDistance () {
    // the closer to capacity, the slower
    const diff = this.capacity - this.weight;
    const speed = Config.SLOW_SPEED + diff / this.capacity * Config.FULL_SPEED;
    this.distance += speed;
  }

  // food consumption 
  consumeFood () {
    this.food -= this.crew * Config.FOOD_PER_PERSON;

    if (this.food < 0) {
      this.food = 0;
    }
  }
}
