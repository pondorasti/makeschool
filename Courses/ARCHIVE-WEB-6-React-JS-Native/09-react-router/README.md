# React Native - Navigator

Mobile apps built for small screens usually use manage information by navigating between 
screens or pages of data. Often a transition is applied to hint at the type of navigation
that is being performed. 

React Native Provides a couple solutions and more solutions are provided by third party 
packages. The built in solutions are 

- React Navigation - A cross platform solution that works on both iOS and Android. 
supports stack and tabbed navigation. It is a JavaScript implementation with a 
great amount of configurability. 
- NavigatorIOS - An iOS only solution that provides a simple to configure solution that 
wraps the native iOS UINavigationController class. 

For more info on Navigation see the React Native Navigation guide. 

- https://facebook.github.io/react-native/docs/navigation.html

There are a couple more third party navigation libraries available and more than a few 
options to using each of these. Check out these links to explore more options.  

- https://reacttraining.com/react-router/web/guides/philosophy
- https://github.com/wix/react-native-navigation
- https://reactnavigation.org/docs/getting-started.html

## Navigator vs NavigatorIOS

React Native supplies a Navigator component to manage navigation. There are two versions:

- Reaxct Navigation - works on both Android and iOS
- NavigatorIOS - only works on iOS provides better performance on iOS

## Navigator 

The Navigator component is part of the React Navigation package. 

Navigation has several "Navigators" that can be used to create 
common navigation schemes on mobile devices. 

- StackNavigator - Creates a navigation stack with a history. 
This is a deep navigation. 
- TabNavigator - Use for a tabbed navigation scheme. This is a 
flat navigation scheme with a fixed number of choices. 
- Drawer Navigator - Creates a side bar navigation scheme. This is a 
flat navigation scheme with fixed number of choices. 

You can combine any of the navigators to create more complex navigation. 

## StackNavigator

The base coponent for a stack navigation scheme is the `StackNavigator`. 
`StackNavigator` is a component that manages a group of other 
components. Imagine you have a group of Components A, B, and C. 

```
const App = StackNavigator({
  a: { screen: A },
  b: { screen: B },
  c: { screen: C }
});
```

In this scheme `A`, `B`, `C` would be React Components that could be 
displayed by the `App` component. StackNavigator is supplied with an
Object that defines a group of objects that each represent a screen 
that can be displayed. 

**navigationOptions** is a static property which is shared by all 
StackNavigator children. Use it to set options on the navigator. 
Set the title of the navbar like this: 

```
class A extends Component {
  static navigationOptions = { title: "Screen" }; // Set the title
  
  render() {}
    return (
    <View>
      <Text>A</Text>
    </View>
    );
  );
}
```

**props.navigation** is passed to all navigator children and holds a 
reference to the Navigator. Use this navigate to other screens. 

```
class A extends Component {
  static navigationOptions = { title: "Screen" };
  const { navigate } = this.props.navigation; // get navigate
  render() {
    
    return (
    <View>
      <Text>A</Text>
      <Button onPress={()=>{
        navigate('b'); // Navigates to B
        title="Go B"; 
      }} />
    </View>
    );
  };
}
```

**params** pass variables to a new screen via navigate like this: 

`navigate('b', { one: 1, two: 2 });`

- Params: https://reactnavigation.org/docs/intro/#Passing-params

### Tutorial 

The tutorials and documentation below is pretty good. 

- https://reactnavigation.org/docs/intro/

## Challenge 

You have a thing for math and Fibonacci numbers are all the rage at 
interviews. Instantly generating a long list of numbers lacks style
and misses the opportunity to enjoy each integer for it's own merits. 
You want to create an app that displays each Fibonacci number on a
screen. 

Use StackNavigator to display each Fibonacci number in sequence. 
Each screen should display one number.

Try this challenge in pairs. 

