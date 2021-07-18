// UI.js
// --------------------------------------------------------
// UI - This class is responsible for managing User Interface 
// elements. It shows the Attack and Shop popups and displays
// notificcations as they occur. 

class UI {
  constructor(game) {
    this.game = game;
    this.shopDiv = document.getElementById('shop');
    this.prodsDiv = document.getElementById('prods');
    
    this.shopDiv.addEventListener('click', (e) => {
      this.shopDivHandler(e);
    });
  }
  
  // show a notification in the message area
  notify (message, type) {
    const { ceil } = Math;
    document.getElementById('updates-area').innerHTML = `<div class="update-${type}">Day ${ceil(this.caravan.day)}: ${message}</div>${document.getElementById('updates-area').innerHTML}`;
  }
  
  // refresh visual caravan stats
  refreshStats () {
    // Destructure some objects for easy access
    const { day, distance, crew, oxen, food, money, firepower, weight, capacity } = this.caravan;
    const { ceil, floor } = Math;

    // modify the dom
    document.getElementById('stat-day').innerHTML = `${ceil(day)}`;
    document.getElementById('stat-distance').innerHTML = `${floor(distance)}`;
    document.getElementById('stat-crew').innerHTML = `${crew}`;
    document.getElementById('stat-oxen').innerHTML = `${oxen}`;
    document.getElementById('stat-food').innerHTML = `${ceil(food)}`;
    document.getElementById('stat-money').innerHTML = `${money}`;
    document.getElementById('stat-firepower').innerHTML = `${firepower}`;
    document.getElementById('stat-weight').innerHTML = `${ceil(weight)}/${capacity}`;

    // update caravan position
    document.getElementById('caravan').style.left = `${(380 * distance / Config.FINAL_DISTANCE)}px`;
  }
  
  // show attack
  showAttack (firepower, gold) {
    var attackDiv = document.getElementById('attack');
    attackDiv.classList.remove('hidden');

    // keep properties
    this.firepower = firepower;
    this.gold = gold;

    // show firepower
    document.getElementById('attack-description').innerHTML = `Firepower: ${firepower}`;

    // init once
    if(!this.attackInitiated) {

      // fight
      document.getElementById('fight').addEventListener('click', this.fight.bind(this));

      // run away
      document.getElementById('runaway').addEventListener('click', this.runaway.bind(this));

      this.attackInitiated = true;
    }
  }
  
  // fight
  fight () {
    console.log('Fight!');

    var firepower = this.firepower;
    var gold = this.gold;

    // damage can be 0 to 2 * firepower
    var damage = Math.ceil(Math.max(0, firepower * 2 * Math.random() - this.caravan.firepower));

    // check there are survivors
    if (damage < this.caravan.crew) {
      this.caravan.crew -= damage;
      this.caravan.money += gold;
      this.notify(`${damage} people were killed fighting`, 'negative');
      this.notify('Found $' + gold, 'gold');
    } else {
      this.game.caravan.crew = 0;
      this.notify('Everybody died in the fight', 'negative');
    }

    // resume journey
    document.getElementById('attack').classList.add('hidden');
    this.game.resumeJourney();
  }
  
  // runing away from enemy
  runaway () {
    console.log('runway!')

    var firepower = this.firepower;

    // damage can be 0 to firepower / 2
    var damage = Math.ceil(Math.max(0, firepower * Math.random()/2));

    // check there are survivors
    if(damage < this.caravan.crew) {
      this.game.caravan.crew -= damage;
      this.notify(`${damage} people were killed running`, 'negative');
    }
    else {
      this.gamge.caravan.crew = 0;
      this.notify('Everybody died running away', 'negative');
    }

    // remove event listener
    // document.getElementById('runaway').removeEventListener('click', this.runaway);

    // resume journey
    document.getElementById('attack').classList.add('hidden');
    this.game.resumeJourney();
  }
  
  // show shop
  showShop (products) {
    console.log('Show Shop!');
    console.log(products)
    
    // show shop area
    this.shopDiv.classList.remove('hidden');
    
    // clear existing content
    this.prodsDiv.innerHTML = '';

    //show products
    let product;
    for(let i = 0; i < products.length; i++) {
      product = products[i];
      this.prodsDiv.innerHTML += `<div class="product" data-qty="${product.qty}" data-item="${product.item}" data-price="${product.price}">${product.qty} ${product.item} - $${product.price}</div>`;
    }
  }
  
  shopDivHandler (e) {
    // what was clicked
    var target = e.target || e.src;

    // exit button
    if (target.tagName == 'BUTTON') {
      //resume journey
      this.shopDiv.classList.add('hidden');
      this.game.resumeJourney();
    } else if (target.tagName == 'DIV' && target.className.match(/product/)) {
      // Buy a Product
      this.buyProduct({
        item: target.getAttribute('data-item'),
        qty: Number(target.getAttribute('data-qty')),
        price: Number(target.getAttribute('data-price'))
      });

    }
  }
  
  // ----------------------------------
  //buy product
  buyProduct (product) {
    const { item, price, qty } = product
    //check we can afford it
    if (price > this.game.caravan.money) {
      this.notify('Not enough money', 'negative');
      return false;
    }

    this.game.caravan.money -= price;

    this.game.caravan[item] += qty;

    this.notify(`Bought ${qty} x ${item}`, 'positive');

    //update weight
    this.game.caravan.updateWeight();

    //update visuals
    this.refreshStats();
  }
}
