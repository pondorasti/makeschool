# FEW 2.4 Class 5 Defining a project

From here until the end of the term you will be working on your final project. Your goal is to define what the project is and plan how you will complete it between now and the end of the term. 

## Learning Objectives

- Apply Styles to components 
- Explore Native Components and read documentation apply what you find
- Define project goals
- Identify the platform
- Map out milestones

## Styling Components

Components in React Native are styled using inline styles. 

```JavaScript
...
return <View style={{width: 100}}>...</View>
...
```

Use `StyleSheet.create()` for some reason not clearly explained in the docs. The `StyleSheet` also has some helper functions. 

```JavaScript
...
return <View style={styles.container}></View>
...
import { StyleSheet }
const styles = StyleSheet.create({
	container: {
		width: 100
	}
})
```

**Important!** React Native uses CSS styles but there are a few differences between React Native and the Web. 

- Does not support all styles 
- Not all components support all styles 
- All units are pixels/points (with a few expections)

### Flex Box

Everything is styled with Flex. The following properties will take your layouts far. 

- flex
- justifyContent
- alignItems 

Keep in mind that Flexbox applies to children. While Flexbox applies to a single axis you can mix axis by nesting elements in in a view. 

## React Native Q and A

What kinds of questions do you have so far about React Native? 

## Handling Input 

Touch screen devices have their own input paradigms. Touch screen interaction is a very different experience from mouse driven interaction.

Discuss the differences

https://facebook.github.io/react-native/docs/handling-touches

React Native provides a few interactive components. 

- Button - Good for basic button
- Touchables - Good when the button isn't enough or can't be styled to meet your needs. 
	- TouchableHighlight
	- TouchableNativeFeedback
	- TouchableOpacity
	- TouchableWithoutNativeFeedback
- TextInput

Use the 'Touchable' components to create custom buttons and things you can tap to handle input. 

## Forms 

Forms on native follow the same patterns used with React on the web with a few unique issues. 

Keyboard avoiding!

Mobile screens are small and space is limited. On mobile the keyboard will often obscure an input field. React Native solves this with it's: 

[KeyboardAvoidingView](https://facebook.github.io/react-native/docs/keyboardavoidingview)

For Text input use: 

- [InputAccessoryView]( https://facebook.github.io/react-native/docs/inputaccessoryview) - Customizes keyboard input view
- [Picker](https://facebook.github.io/react-native/docs/picker) - Handles multi-choice input with a scrolling list of choices. Good for many choices.
- [PickerIOS](https://facebook.github.io/react-native/docs/pickerios) - iOS Picker View
- [SegmentedConreolIOS](https://facebook.github.io/react-native/docs/segmentedcontrolios) - Multi-choice input, iOS only, good for picking one choice from a short list. 
- [Slider](https://facebook.github.io/react-native/docs/slider)
- [Switch](https://facebook.github.io/react-native/docs/switch) - Like a checkbox
- [TextInput](https://facebook.github.io/react-native/docs/textinput) - Use for Single line and multi-line text input 

## Controlled Component Pattern

Use the [Controlled Component pattern](https://reactjs.org/docs/forms.html) with form elements. 

**tl;dr** Store the value of the input element on state, set the state when the element changes, and set the value of the element from state. 

- Define a property on state
- Set the valuse of the form element it value on state
- Set state when the form element changes

Taking the By Breed project as an example add a search field. Use this to search for animals by breed name. The example below uses Hooks. 

**Step 1** Import `useState` to track the search query. 

```JS
import React, { useState } from 'react';
```

**Step 2** Import the `TextInput` and `KeyboardAvoidingView`.

```JS
...
import { ..., TextInput, KeyboardAvoidingView } from 'react-native';
...
```

**Step 3** Define a variable to be used to hold the search query. This would go at the top of your component. 

```JS 
...
const [ query, setQuery ] = useState('')
...
```

**Step 4** Add an input. I put my input at the bottom, below the FlatList I used to display the list of animals.

```JS 
...
<TextInput 
	style={styles.input}
	onChangeText={text => setQuery(text)}
	value={query}
/>
...
```

Notice you're using the Controlled component pattern here to set the `value` from the state variable (`query`) and you're setting state in the `onChangeText`. 

Note! We have't set `styles.input` yet! 

**Step 5** Since the `TextInput` is at the bottom the keyboard will cover it when it pops up. Usde the `KeyboardAvoidingView` to move the input up and out of the way. 

We want the `KeyboardAvoidingView` to be the container for all of the other views. I had a View in that position so I **replaced** it with the `KeyboardAvoidingView`. I also had the `SafeAreaView` at the top. 

Here is what the structure of my component looked like: 

```HTML
<SafeAreaView ...>
  <KeyboardAvoidingView 
		behavior={Platform.OS == "ios" ? "padding" : "height"}
    style={styles.container}
	>
		<FlatList .../>
		<TextInput .../>
		<StatusBar style="auto" />
  </KeyboardAvoidingView>
</SafeAreaView>
```

Take note of the props in the `KeyboardAvoidingView`. It didn't seem to work for me without these. Seems like there are special settings for this that are unique to Android and iOS. I was testing on the iOS simulator. 

**Step 6** Add some styles for the `TextInput`.

```JS
const styles = StyleSheet.create({
  ...
  input: {
    width: '100%', 
    borderWidth: 1,
    padding: 10
  }
});
```

You can work with these. I needed width 100% to get the TextInputt to span the space. Some padding to the give the text content a little room. And I added a border to define the area. 

**Step 7** Now it's time to get the query to filter the list of animals. Inside the FlatList you're seting the data prop to an array of animals. If you filter it here it will change what's displayed in the list. 

To make this happen you can use `Array.filter()` and `String.includes()`. 

```JS
cats.filter((item) => item.breed.includes(query))
```

Here is the whole FlatList with the search.

```JS
<FlatList 
	style={{width: '100%'}}
	data={cats.filter((item) => item.breed.includes(query))}
	renderItem={( { index, item } ) => {
		return <Cell3 item={item} />
	}}
	keyExtractor={item => item.breed}
/>
```

You could also move this to the top of the component and make a temp variable use in FlatList. It might look like this: 

```JS
const filteredCats = cats.filter((item) => item.breed.includes(query))
```

## Activity 

Use components to solve these problems. 

- ScrollView 
	- Make a scrolling view with content Use any components to fill the view.
- FlatList
	- Use header, footer, and or separator in the list
	- Use TextInput to filter list 
- TextInput 
	- Input zip code in Wthr app to show whether
	- Use KeyBoardAvoidingView

## After Class

Define your final project. This must be a native app of some kind. 

## Defining the final 

What are you going to make? 

What platform will it use? 

- Mobile
- Desktop

Define milestones for the project. A milestone is a a step in the construction of your project and should have a deliverable.

## Additional Resources

- [Controlled Component pattern](https://reactjs.org/docs/forms.html) 
- [InputAccessoryView]( https://facebook.github.io/react-native/docs/inputaccessoryview) - Customizes keyboard input view
- [Picker](https://facebook.github.io/react-native/docs/picker) - Handles multi-choice input with a scrolling list of choices. Good for many choices.
- [PickerIOS](https://facebook.github.io/react-native/docs/pickerios) - iOS Picker View
- [SegmentedConreolIOS](https://facebook.github.io/react-native/docs/segmentedcontrolios) - Multi-choice input, iOS only, good for a few choices. 
- [Slider](https://facebook.github.io/react-native/docs/slider)
- [Switch](https://facebook.github.io/react-native/docs/switch) - Like a checkbox
- [TextInput](https://facebook.github.io/react-native/docs/textinput) - Use for Single line and multi-line text input 