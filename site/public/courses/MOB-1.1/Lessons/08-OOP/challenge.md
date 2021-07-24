# Pop the squares with OOP

- Your doing a lot of work in the GameScene it would be good to move some of this into another file.
  - Make a class Box. It should handle the following
    - Set the size of the box
    - set the color of the box
    - set the name of the box
    - Stretch goals
      - Position the box
      - Animate and remove box
- Stretch goals
  - Make a class for score label
    - It should set all the default properties of the label
    - It should have a method that updates the score it displays
    - When the score changes the label counts up to the new value
  - It would be cool if some points appeared at the location of a box that was tapped. This should show the points scored and animate up the screen, fade out, and remove itself. **Make this a class!**
  - Make a particle system that appears at the location of a bubble when it has been tapped. This particle
  should remove itself after a short animation.
    - Make a sub class SKEmitterNode
