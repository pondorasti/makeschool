# FEW 2.4 Animation 

Making things move on mobile provides that thing that makes your apps interesting and irresistible. 

## Objectives 

- Make things that move on mobile
- Use Animated for discreet animated objects 
- Use LayoutAnimation for animating groups of elements

## Animation

Animation is about making things change over time. On the computer this boils down to changing numeric values over time. The appearance of any component on the screen is controlled by a series of numeric values. Change these values and and the appearance of the things changes. Continuously change the values and it looks like it's moving.

For the record motion includes changes in color, opacity, size, shape, and rotation. 

While you could changes values using timers React Native has provides more abstract systems for making things move.

React Native provides two complimentry animation systems: `Animated` for animating specific elements and interactions, and `LayoutAnimation` for animating global layout transactions. 

## `Animated`

Animation is making things move on the screen. Behind the scenes this is handled by changing values over time. 

For example if you wanted a view to fade you would animate the opacity of the view from 0 to 1. 

Animated is a built in Component, you'll use it to handle animating other components. 

Animated has many options!

**Use Animated for discreet animations**. Think of single elements that move or change. Animated is also better suited to continuous animations. 

https://reactnative.dev/docs/animations

Take a look at the docs above and identify some of the key ideas. 

### Example

```JS
// A simple animation. This example fades a view in by animating 
// the opacity

// 1. Import Animated from react native 
// 2. Define a property to be animate
// 3. Define and start an Animation
// 4. Use the animated to value 

import React from 'react';
// 1. Import Animated
import { StyleSheet, Text, View, Animated } from 'react-native';

export default class Animated_1 extends React.Component {
  // 2. Define a value to animate on state: fade with an initial value of 0
  state = {
    fade: new Animated.Value(0),
  }

  // Start the animation when this view loads
  componentDidMount() {
    // 3. Call Animated.timing() and set the ending value, duration, and delay
    Animated.timing(
      this.state.fade, {
        toValue: 1,
        duration: 3000,
        delay: 1000
      }
    ).start() // Start the Animation
  }

  render() {
    // 4. Get the fade value 
    const { fade } = this.state
    return (
      <View style={styles.container}>
        {/* Apply the fade value to a CSS property */}
        <Animated.View style={{ ...styles.box, opacity: fade }}>
          <Text style={styles.title}>Animation 1</Text>
          <Text>Fades in using Animated</Text>
        </Animated.View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    backgroundColor: 'rgba(255, 0, 0, 0.5)',
    width: 200,
    height: 200,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold'
  }
});
```

Here is the same example written with a hooks. This example uses `useEffect()` a React Hook that handles lifecycle events. 

https://medium.com/recraftrelic/usestate-and-useeffect-explained-cdb5dc252baf

https://leewarrick.com/blog/react-use-effect-explained/


```JS

// A simple animation. This example fades a view in by animating 
// the opacity

// 0. Import Hooks useEffect and useRef
// 1. Import Animated from react native 
// 2. Define a property to be animate
// 3. Define and start an Animation
// 4. Use the animated to value 

// 0. Import some hooks 
import React, { useEffect, useRef } from 'react';
// 1. Import Animated
import { StyleSheet, Text, View, Animated } from 'react-native';

export default function Animated_1_hooks() {
  // 2. Define a value to animate on state: fade with an initial value of 0
  const fadeAnim = useRef(new Animated.Value(0)).current 
  
  // This acts as a lifecycle method
  useEffect(() => {
    Animated.timing(
      fadeAnim,
      {
        toValue: 1,
        duration: 5000,
      }
    ).start();
  }, [])

  return (
    <View style={styles.container}>
      {/* Apply the fade value to a CSS property */}
      <Animated.View style={{ ...styles.box, opacity: fadeAnim }}>
        <Text style={styles.title}>Animation 1</Text>
        <Text>Fades in using Animated</Text>
      </Animated.View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    backgroundColor: 'rgba(255, 0, 0, 0.5)',
    width: 200,
    height: 200,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold'
  }
});
```

### Challenges 

Practice with animation by solving these problems. 

- Change the duration of the animation
- Change the delay of the animation

Observe your changes. 

## Animating X and Y position

Animated provides a special method for animating the X and Y position of elements. 

The animated value used to move elements across the screen is a vector. A vector is made of two values x and y. The x represents the horizontal position and y is the vertical position. 

Make an animated vector with: 

`this.state.move = new Animated.ValueXY({ x:0, y: 400 })`

Think of this value as the starting point or an offset from the object will end up. In the sample above x is 0 so there is no change in the horzontal, but y is 400 which would start the object 400 points below it's ending position. 

To start the animation use: 

```js
Animated.spring(
	this.state.move, {
		toValue: { x: 0, y: 0 } // end at 0, 0
	}
).start()
```

Animate to the edning position. Notice the `toValue` has an x and y of 0. This represents no offset.

```JS

import React from 'react';
// Import Animated
import { StyleSheet, Text, View, Animated } from 'react-native';

export default class Animated_2 extends React.Component {
  // Define State that holds the values for the animation. 
  // In this case animating the position of the object with x and y. 
  // The numbers here is starting position. Imagine this as the 
  // offset from where the object would appear without these numebrs. 
  state = {
    move: new Animated.ValueXY({ x:0, y: 400 })
  }
  
  componentDidMount() {
    // Use spring animation
    Animated.timing(
      this.state.move, {
        toValue: { x: 0, y: 0 } // toValue consists of x and y
      }
    ).start() // Start the animation
  }
  
  render() {
    const { move } = this.state
    return (
      <View style={styles.container}>
        {/* Combine the styles with move. Call getLayout() to convert x and y to screen coords */}
        <Animated.View style={[styles.box, move.getLayout()]}>
          <Text style={styles.title}>Animated 2</Text>
          <Text>Animation moves up using spring.</Text>
        </Animated.View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    // Position the object in the center (with no offset). 
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff',
  },
  box: {
    backgroundColor: 'rgba(255, 0, 0, 0.5)',
    width: 200,
    height: 200,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold'
  }
});
```

Here is a version using hooks

```js 
import React, { useEffect, useRef } from 'react';
import { StyleSheet, Text, View, Animated } from 'react-native';

export default function Animated_2_hooks() {
	// Create a ref for the animated value object
  const move = useRef(new Animated.ValueXY({ x:0, y: 400 })).current 

	// useEffect to start the animation when the component is mounted
  useEffect(() => {
    Animated.timing(
      move, {
        toValue: { x: 0, y: 0 } 
      }
    ).start() 
  })
  
	return (
		<View style={styles.container}>
			{/* Combine the styles with move. Call getLayout() to convert x and y to screen coords */}
			<Animated.View style={[styles.box, move.getLayout()]}>
				<Text style={styles.title}>Animated 2</Text>
				<Text>Animation moves up using spring. (Uses Hooks)</Text>
			</Animated.View>
		</View>
	);
}

const styles = StyleSheet.create({
  container: {
    // Position the object in the center (with no offset). 
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff',
  },
  box: {
    backgroundColor: 'rgba(255, 0, 0, 0.5)',
    width: 200,
    height: 200,
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold'
  }
});
```

### Challenges

Try these ideas: 

- Change the starting x and y values to: 
	- Make the box slide down from the top
	- Make the box slide in from the right
- Change the ending value to: 
	- Make the box end closer to the top
	- Make the box end closer to the bottom

### Easing 

The default timing function is not very interesting. The rate of change over time is linear. A linear change works well for opacity or changes in color but looks stiff and boring for motion, rotation, and scale. 

Luckily Animated has some other timing functions built in. 

Looking at the previous example find: 

`Animated.timing( ...`

The examples here use `Animated.timing()` but React Native also provides these other other methods: 

- `Animated.decay()` starts with an initial velocity and gradually slows to a stop.
- `Animated.spring()` provides a basic spring physics model.
- `Animated.timing()` animates a value over time using easing functions.

Try replacing: `Animated.timing( ...` with: `Animated.spring( ...`

This adds a nice elastic bounce to the motion. 

You can explore some of the easing options in this demo: 

https://reactnative.dev/docs/easing#example

You can apply these by adding the property: `easing` to your your Animated timing configuration: 

```js
Animated.timing(
  move, {
    easing: Easing.bezier(0, 2, 1, -1), // Easing function here!
    toValue: { x: 0, y: 0 } 
  }
).start()
```

### Challenge 

Try these easing functions

- Predefined Animations
	- `easing: Easing.bounce`
	- `easing: Easing.ease`
	- `easing: Easing.elastic(4)`
- Standard Functions
	- `easing: Easing.linear`
	- `easing: Easing.quad`
	- `easing: Easing.cubic`
- Additional Functions
	- `easing: Easing.bezier(0, 2, 1, -1)`
	- `easing: Easing.circle`
	- `easing: Easing.sin`
	- `easing: Easing.exp`
- Combinations
	- `easing: Easing.in(Easing.bounce)`
	- `easing: Easing.out(Easing.exp)`
	- `easing: Easing.inOut(Easing.elastic(1))`

## Demo Example 

Follow the example here: https://github.com/Make-School-Labs/react-native-animation-examples

There are several example Components: Animated_1-6 that show introductory examples of motion using animated. 

## Resources 

- 





