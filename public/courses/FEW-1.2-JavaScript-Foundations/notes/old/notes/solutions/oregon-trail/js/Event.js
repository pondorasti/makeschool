// Event.js
// ---------------------------------------------------------------
// Event - Stores all of the game events. These are things like 
// being attacked by bandits, finding a shop, and anything else
// that might occur on the trip. 

// This array of objects describes the events. This array is not 
// used by the game directly. Instead this array is turned into 
// Objects defined by the EventType Class below. Think of this 
// as the raw data for the event objects used by the game. 
const eventData = [
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'crew',
    value: -2,
    text: 'Asteroids storms pummel the caravan: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'crew',
    value: -3,
    text: 'Space craft malfunctions: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'crew',
    value: -4,
    text: 'X-Ray bombardment: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'food',
    value: -10,
    text: 'Replicator Malfunction: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'money',
    value: -50,
    text: 'Ventruvian Pirates steal $'
  },
  {
    type: 'STAT-CHANGE',
    notification: 'negative',
    stat: 'oxen',
    value: -1,
    text: 'Warp drive malfunctions: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'positive',
    stat: 'food',
    value: 20,
    text: 'Discover semi-habitable planet: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'positive',
    stat: 'food',
    value: 23,
    text: 'Meet Friendly Vulcans: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'positive',
    stat: 'food',
    value: 20,
    text: 'Trade with intergalactic Travelers: '
  },
  {
    type: 'STAT-CHANGE',
    notification: 'positive',
    stat: 'oxen',
    value: 1,
    text: 'Find Mineral rich asteroid field Repair: '
  },
  {
    type: 'SHOP',
    notification: 'neutral',
    text: 'You have found a shop',
    products: [
      {item: 'food', qty: 20, price: 50},
      {item: 'oxen', qty: 1, price: 200},
      {item: 'firepower', qty: 2, price: 50},
      {item: 'crew', qty: 5, price: 80}
    ]
  },
  {
    type: 'SHOP',
    notification: 'neutral',
    text: 'You have found a shop',
    products: [
      {item: 'food', qty: 30, price: 50},
      {item: 'oxen', qty: 1, price: 200},
      {item: 'firepower', qty: 2, price: 20},
      {item: 'crew', qty: 10, price: 80}
    ]
  },
  {
    type: 'SHOP',
    notification: 'neutral',
    text: 'Smugglers sell various goods',
    products: [
      {item: 'food', qty: 20, price: 60},
      {item: 'oxen', qty: 1, price: 300},
      {item: 'firepower', qty: 2, price: 80},
      {item: 'crew', qty: 5, price: 60}
    ]
  },
  {
    type: 'ATTACK',
    notification: 'negative',
    text: 'Klingonss Attack!'
  },
  {
    type: 'ATTACK',
    notification: 'negative',
    text: 'Romulons Attack'
  },
  {
    type: 'ATTACK',
    notification: 'negative',
    text: 'Borg Attack'
  }
];
 
// ----------------------------------------------
// Defines a product that can be bought from a shop
class Product  {
  constructor({ item, qty, price }) {
    this.item = item;
    this.qty = qty;
    this.price = price;
  }
}
// ----------------------------------------------
// This object describes an event that can occur in the game. 
class EventType {
  // Takes an object with props describing the event
  constructor({ type, notification, stat, value, text, products }) {
    this.type = type;
    this.notification = notification;
    this.stat = stat;
    this.value = value;
    this.text = text;
    this.products = products;
    // if the event has products turn these into an array of objects
    if (this.products) {
      this.products = [];
      for (let key in products) {
        // Make a new Product for each
        this.products.push(new Product(products[key]));
      }
    }
  }
}
// ----------------------------------------------
// This Object manages events
class EventManager {
  constructor(game) {
    this.game = game;
    this.eventTypes = [];
    // Take all of the events in eventData and make an EventType Object from each
    for (let key in eventData) {
      this.eventTypes.push(new EventType(eventData[key]));
    }
  }
  
  generateEvent () {
    // pick a random eventType
    var eventIndex = Math.floor(Math.random() * this.eventTypes.length);
    var eventData = this.eventTypes[eventIndex];

    // events that consist in updating a stat
    if (eventData.type == 'STAT-CHANGE') {
      this.stateChangeEvent(eventData);
    }

    // shops
    else if (eventData.type == 'SHOP') {
      // pause game
      this.game.pauseJourney();

      // notify user
      this.game.ui.notify(eventData.text, eventData.notification);

      // prepare event
      this.shopEvent(eventData);
    }

    // attacks
    else if (eventData.type == 'ATTACK') {
      // pause game
      this.game.pauseJourney();

      // notify user
      this.game.ui.notify(eventData.text, eventData.notification);

      // prepare event
      this.attackEvent(eventData);
    }
  }
  
  stateChangeEvent (eventData) {
    //can't have negative quantities
    if (eventData.value + this.game.caravan[eventData.stat] >= 0) {
      this.game.caravan[eventData.stat] += eventData.value;
      this.game.ui.notify(eventData.text + Math.abs(eventData.value), eventData.notification);
    }
  }
 
  shopEvent (eventData) {
    // number of products for sale
    // FIXME: Not displaying products in shop
    const numProds = Math.ceil(Math.random() * 4);

    // product list
    const products = [];
    let j, priceFactor;

    for (let i = 0; i < numProds; i++) {
      // random product
      j = Math.floor(Math.random() * eventData.products.length);

      // multiply price by random factor +-30%
      priceFactor = 0.7 + 0.6 * Math.random();

      products.push({
        item: eventData.products[j].item,
        qty: eventData.products[j].qty,
        price: Math.round(eventData.products[j].price * priceFactor)
      });
    }

    this.game.ui.showShop(products);
  }
  
  // prepare an attack event
  attackEvent (eventData) {
    var firepower = Math.round((0.7 + 0.6 * Math.random()) * Config.ENEMY_FIREPOWER_AVG);
    var gold = Math.round((0.7 + 0.6 * Math.random()) * Config.ENEMY_GOLD_AVG);

    this.game.ui.showAttack(firepower, gold);
  };

}