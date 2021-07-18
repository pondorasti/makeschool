# FEW 2.4 - React Native - Native Components

## Review 

## Learning Competencies 

- 

## Native Components 

React native is written in JavaScript using the React component architecture. This is very similar to React for Web applications. Where React Native is different is in the components that are used. Instead of HTML tags like: `div`, `h1`, `p`, `a`, etc. React Native uses "Native" tags like: `View`, `Text`, `FlatLsit`. These native components arr translated into native code for iOS or Android when the App is built. 

To understand these Native components you must read the documentation. Take a look through the documentation here: 

https://reactnative.dev/docs/components-and-apis

What did you see? 

Here a few important points: 

1. If there is functionality you need that is not covered by one of these components you either need to write your own component or you can use that feature. 
2. Some components are supported by both iOS and Android and other components are only supported by Android or only supported by iOS. 
3. The components use CSS for styles but each component only supports a subset of the regular CSS properties. Check the bottom each components description for notes on which CSS properties that component supports. 

## Using Text Input

Many apps require text input. React uses the Controlled component pattern to handle input. On Native it's the same but you must use the Native `TextINput` component in place of the `input` tag. 

Read about the component here: https://reactnative.dev/docs/textinput

Follow these steps to create a Search field for the By Breed app. 

The following steps are all applied to `App.js`.

Import the component: 

```JS
import { ..., TextInput } from 'react-native';
```

Import `useState`, this will be used the same way it is used a regular web app!

```JS
import React, { useState } from 'react';
```

At the top of the App component define a state variable to hold the search value. 

```JS
export default function App() {
  const [search, setSearch] = useState('')

  ...
}
```

Add the `TextInput` at the bottom of the existing JSX in `App.js`. 

```JS
<SafeAreaView style={styles.container}>
  ...
  <TextInput 
    style={styles.search}
    placeholder="Search"
    onChangeText={setSearch}
    value={search}
  />
</SafeAreaView>
```

Here you are setting the value to the search term. Notice that `TextInput` uses `onchangeText` instead of `onChange`! This `onChangeText` prop wants a function that will receive a string (the new value in the input), so you can put the `search` setter function here: `setSearch`.

Also note, I added a new style property here: `style={styles.search}`. The `TextInput` is really small it would be good to give it some styles. 

Add the following to your style object: 

```JS
const styles = StyleSheet.create({
  ...
  search: {
    fontSize: 24,
    padding: 10
  }
});
```

## KeyboardAvoidingView

On mobile text input is handled by a software/virtual keyboard. This keyboard appears on the screen. It can cover other UI elements including the test you are inputing. Not being able to see what you are typing could be a bad user experience! 

React Native Provides a component for this! Take a look: 

https://reactnative.dev/docs/keyboardavoidingview

Try out the KeyboardAvoiding View for yourself. 

In `App.js` import the `KeyboardAvoidingView` and `Platform` at the top. Platform is an object that provides information about the current platform. 

```JS
import { ..., KeyboardAvoidingView, Platform } from 'react-native';
```

Next wrap your content in the `KeyboardAvoidingView`: 

```JS
export default function App() {
  const [search, setSearch] = useState('')

  return (
    <SafeAreaView style={styles.container}>
      <KeyboardAvoidingView 
        style={styles.container}
        behavior={Platform.OS === "ios" ? "padding" : "height"}
      >
      ...
      </KeyboardAvoidingView>
    </SafeAreaView>
    
  );
}
```

Note! I used the `styles.container` styles on the `KeyboardAvoidingView`. If you have some custom styles here you might need to create a new style for this component. What's needed here is `flex: 1,`! This is required to make the `KeyboardAvoidingView` expand to fill the screen.

Also note! `behavior` prop. I took this from the docs. It appears that `KeyboardAvoidingView` behaves differently on different playforms and needs a different stting for each! 

## After Class 

Continue working on the By Breed app. Your app should be able to do the following: 

- List all of the Cats or Dogs
  - Display the features of each breed
  - Show the name of the feature and value
  - Display the Feature on the left and the value on the right
  - Display an average rating for each breed
- Style the list
  - Set the font size for each row
  - Use padding and margin to add some space between rows and to add some space between the text and the edge of the screen
- Search breeds
  - Add a TextInput search
  - Search value should filter the list
  - Use KeyboardAvoidingView
- Stretch Goals 
  - Add a button to switch between cats and dogs. 

## Resources 

- https://reactnative.dev
- https://reactnative.dev/docs/flatlist
- https://reactnative.dev/docs/keyboardavoidingview
- https://reactnative.dev/docs/textinput