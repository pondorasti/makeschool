# Pop The Bubble

Pop the bubble game

## Baseline Challenges
Complete the following Phases of the `Pop The Bubble` iOS Game.

### Phase 1 - Setup Scene

1. Create An Xcode Game Project.

  | Step 1: New Game | Step 2: Project Name |
  | :------------- | :------------- |
  | ![Game Project 1](assets/xcode1.png) | ![Game Project 2](assets/xcode2.png) |

2. Remove all the .sks files

  ![Remove Sks Files](assets/removeSksFiles.png)

3. Replace the contents of `viewDidLoad` in `GameViewController.swift` to setup the GameScene for presentation

  ![Game Controller](assets/gameViewController.png)

4. Remove boilerplate code from the `GameScene.swift` file

  ![Game Scene](assets/gameScene.png)

---

### Phase 2 - Create A Bubble

1. Write a function that generates a bubble

  ![Generate Bubble](assets/generateBubble.png)

2. Modify the function to add a random color to the bubble being created

  ![Generate Bubble With Color](assets/bubbleWithColor.png)

---

### Phase 2 - Timer - Generate Random Bubbles

1. Setup a timer to generate a random bubble to add to the scene every (x) seconds

  ![Setup Timer](assets/setupTimer.png)

2. Move the bubble towards the top of the screen

  | Step 1: Create Move Bubble Function | Step 2: Call moveBubble() |
  | :------------- | :------------- |
  | ![Move Bubble To Top](assets/moveBubble.png) | ![Call Move Bubble](assets/callMoveButton.png) |

---

### Phase 3 - Bubble Interactions

1. Create a variable to hold Points and a label to show the points on screen

  ![Show Points](assets/showPoints.png)

2. Setup PointsLabel to display points

  | Step 1: Create function to display points | Step 2: Call setupPointsLabel() |
  | :------------- | :------------- |
  | ![Crete Function](assets/pointsLabel.png) | ![Call setupPointsLabel() ](assets/callSetupPointsLabel.png) |

3. Handle touch events when user taps a Bubble

  ![Touched Bubble](assets/touchesBegan1.png)

  ![Touched Bubble](assets/touchesBegan2.png)

3. Increment number of points and remove Bubble when user taps a Bubble

  ![Increment Points](assets/handleTouch1.png)

  ![Increment Points](assets/handleTouch2.png)
---

### Phase 4 - Game Over Scene

1. Create a function to check if the game is over

  ![Game Over Scene](assets/isGameOver.png)

2. Create a scene to handle when the game is over

  ![Handle Game Over](assets/handleGameOver1.png)

3. Present `GameOverScene` when won

  ![Game Over Present](assets/handleGameOver2.png)

4. Display results of game and restart button
