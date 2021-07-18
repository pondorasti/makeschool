// *************************************************
// Game thing
// *************************************************

// -------------------------------------------------
// --                Refereneces                  --
// This is how we get all of the elements of the html or the "DOM"
// These are all global variables we can access later in the code

const left_btn = document.getElementById('left-btn')
const up_btn = document.getElementById('up-btn')
const down_btn = document.getElementById('down-btn')
const right_btn = document.getElementById('right-btn')
const sprite = document.getElementById('sprite')
const coords = document.getElementById('coords')
const game_screen = document.getElementById('game-screen')
const scoreCard = document.getElementById('score-card')
  
// ------------------------------------------------
// --                 Variables                  --
// Here we are initializing all of the variables we will be 
// using in the rest code. 

const xyOffset = 64;

let score = 0

let player_x = xyOffset
let player_y = xyOffset
let targetX = player_x 
let targetY = player_y
const minX = xyOffset - 100
const maxX = xyOffset + (100 * 4)
const minY = xyOffset - 100
const maxY = xyOffset + (100 * 4)
let direction = 1

// These control how often bombs and fruits spawn

const timePerBomb = 3000
const timePerFruit = 1000


// -------------------------------------------------
// --                 Functions                   --

// This is function alters the css properties of the player 
// sprite to make it move.

function moveSprite() {
  player_x -= (player_x - targetX) * 0.1
  sprite.style.setProperty('--x', player_x)
  player_y -= (player_y - targetY) * 0.1
  sprite.style.setProperty('--y', player_y)
}

// This function updates the css properties on the background to 
// move it along with the player sprite.  

function updateBackground() {
  game_screen.style.setProperty('--x', player_x / -1)
  game_screen.style.setProperty('--y', player_y / -1)
}

// All of the move functions updated the "targetX" or "targetY" 
// variables which we use to update where the player is. and then 
// tells the background to move

function moveLeft() {
  if (targetX > minX) {
    targetX -= 100
    updateBackground()
  }
}

function moveRight() {
  if (targetX < maxX) {
    targetX += 100
    updateBackground()
  }
}

function moveUp() {
  if (targetY > minY) {
    targetY -= 100
    updateBackground()
  }
}

function moveDown() {
  if (targetY < maxY) {
    targetY += 100
    updateBackground()
  }
}
  
// -- Controls --

// these next few set the "onclick" listener of the buttons to 
// call their respective move function

left_btn.onclick = function(e) {
  moveLeft()
}
  
right_btn.onclick = function(e) {
  moveRight()
}
  
up_btn.onclick = function(e) {
  moveUp()
}
  
down_btn.onclick = function(e) {
  moveDown()
}

// -- Listen for keyboard events --

// this is setting the "onkeydown" event listener to check if 
// one of the arrow keys have been pressed, and calls the 
// correct move function.

document.onkeydown = function(e) {
  const { code } = e
  switch(code) {
    case 'ArrowLeft': 
      moveLeft()
      break
    case 'ArrowRight':
      moveRight()
      break
    case 'ArrowUp':
      moveUp()
      break
    case 'ArrowDown':
      moveDown()
      break
  }
}
 
// this just gives us a cleaner function to get a random integer

function random(range) {
  return Math.floor(Math.random() * range)
}
 
// This will be a list of all of the objects on screen other 
// than the player

const objects = []

// this function creates a new object and adds it to the 
// objects list

function makeObject(type) {
  // Creates a new div that will be our object, but doesn't 
  // actually put it on the page
  const new_object = document.createElement('div')
  // Adds a class to our new div
  new_object.classList.add(type)
  // Puts our new div on our game_screen, putting it into the scene
  game_screen.appendChild(new_object)

  const randomXY = random(4) * 100 + xyOffset
  let x = 0
  let y = 0
  let dx = 0
  let dy = 0
  
  // Randomly defines where the object starts
  switch(random(4)) {
    case 0: // top
      x = randomXY
      y = -100
      dx = 0
      dy = 1
      break

    case 1: // right
      x = 500
      y = randomXY
      dx = -1
      dy = 0
      break

    case 2: // bottom
      x = randomXY
      y = 500
      dx = 0
      dy = -1
      break

    case 3: // left
      x = -100
      y = randomXY
      dx = 1
      dy = 0
      break
  }
  // Tells the CSS to put the object where it is supposed to go
  new_object.style.left = `${x}px`
  new_object.style.top = `${y}px`

  // Makes the bombs move faster than the other elements
  // the 3 is the speed of the bombs, and the 1 is the speed of the fruits
  dx = type === 'bomb' ? dx * 3 : dx * 1 
  dy = type === 'bomb' ? dy * 3 : dy * 1

  // creates the object object and addsd it to the array
  const object = {
    new_object,
    x, y,
    dx, dy, 
    type
  }

  objects.push(object)
}

// Creates a new div where the bomb was and playes the explosion animation

function makeExplosion(x, y) {
  const new_explosion = document.createElement('div')
  game_screen.appendChild(new_explosion)
  new_explosion.classList.add('explosion')
  new_explosion.style.left = `${x}px`
  new_explosion.style.top = `${y}px`
  // This is called after 1000ms (1 second)
  setTimeout(() => {
    // Removes new_explosion
    new_explosion.parentNode.removeChild(new_explosion)
  }, 1000)
}

// Does the same thing as the makeExplosion function, but with a 
// different animation

function makeSparklyExplosion(x, y) {
  const new_sparkly_explosion = document.createElement('div')
  game_screen.appendChild(new_sparkly_explosion)
  new_sparkly_explosion.classList.add('explosion-sparkly')
  new_sparkly_explosion.style.left = `${x}px`
  new_sparkly_explosion.style.top = `${y}px`

  setTimeout(() => {
    new_sparkly_explosion.parentNode.removeChild(new_sparkly_explosion)
  }, 1000)
} 

// This checks to see if the 2 objects passed in are colliding

function checkForCollision(object_a, object_b) {
  const dx = Math.abs(object_a.x - object_b.x)
  const dy = Math.abs(object_a.y - object_b.y)
  const offset = xyOffset / 1

  if (dx < offset && dy < offset) {
    return true
  }

  return false
}


// -- Create Objects --

// This will create a new bomb on repeat with a delay we 
// set at the top of the code

setInterval(function() {
  makeObject('bomb')
}, timePerBomb)

// This will create a new fruit on repeat with a delay we set 
// at the top of the code

setInterval(function() {
  const types = ['apple', 'lemon', 'strawberry']
  const type = types[random(types.length)]
  makeObject(type)
}, timePerFruit)

makeObject()


// -- Game Loop --

// This is our game loop, all of the game logic happens here

function onFrame() {
  // This moves the sprite to where it is supposed to be
  moveSprite()

  // this loops through the objects array and updates each objects 
  // position so they keep moving it also checks to see if any 
  // objects are colliding with the player

  objects.forEach((object, i, arr) => {
    const { new_object, dx, dy } = object
    object.x += dx
    object.y += dy
    new_object.style.left = `${object.x}px`
    new_object.style.top = `${object.y}px`

    // this is where it checks for collision
    if (checkForCollision(object, {x: player_x, y: player_y})) {
      // this removes points if you hit a bomb, otherwise it adds points
      if (object.type === 'bomb') {
        score -= 5000
        scoreCard.innerHTML = score
        makeExplosion(object.x - 32, object.y - 32)
      } else {
        score += 1000
        scoreCard.innerHTML = score
        makeSparklyExplosion(object.x - 32, object.y - 32)
      }
      // This removes any object that has been collided with.
      new_object.parentNode.removeChild(new_object)
      arr.splice(i, 1)
      return
    }
    // This checks to see if the object is past the screen, and removes them if they are.
    if (object.x < -100 || object.x > 500 || object.y < -100 || object.y > 500) {
      new_object.parentNode.removeChild(new_object)
      arr.splice(i, 1)
    }
  })
  // This calls the game loop again on "animation frame" which 
  // waits until your browser can update whats on screen
  requestAnimationFrame(onFrame)
}

// Calls our game loop to start the whole thing
requestAnimationFrame(onFrame)