# FEW 2.4 React Native Elements

React native ELements is a library of cross platform UI elements. This library fills in many of the gaps in the default React Native components making it quicker and easier to spin up mobile applications.

https://react-native-training.github.io/react-native-elements/docs/overview.html

## Learning Objectives/Competencies

- Build Native apps with Native Components

## Initial Exercise

Identify and implement React Native Elements. Get started with React Native Elements by taking a look at the docs: 

https://reactnativeelements.com/docs/

Follow these instructions to start using React Native Elements:

Make a new expo app:

```
expo init react-native-elements-example
```

Choose blank project

Navigate to the project: 

```
cd react-native-elements-example
```

Install native elements:

```
yarn add react-native-elements
```

Add vector icons: 

```
yarn add react-native-vector-icons
```

Install safe area context:

```
yarn add react-native-safe-area-context
```

In `App.js` add the SafeAreaProvider: 

```JS
import { SafeAreaProvider } from 'react-native-safe-area-context';

function App() {
  return <SafeAreaProvider>...</SafeAreaProvider>;
}
```

Test your app at this point: 

```
yarn start
```

If everything is working you'll see the default app!

Let's experiment with some of the React Native Elements. 

Start with an image. This is NOT a React Native ELements component but you may want to use images. 

Create a folder named images in your project directory and add an image to the folder. Find an image you can use and add it to this folder. I used an image named `dog.png`:

```JS
import { ..., Image } from 'react-native';

export default function App() {
  return (
    <SafeAreaProvider>
			...
      <Image source={require('./images/dog.png')} />
      ...
    </SafeAreaProvider>
  );
}
```

Here's more info about the Image component: https://reactnative.dev/docs/images

Create an Avatar. An Avatar is typically used to display a user image, but can also be used to display images of products or other content. 

The Avatar component does the work of displaying the image and adds more features. It also: 

- Can be a button
- Displays an Icon
- Has a background color
- Can be round
- Has a title in the background
- Can have a placeholder

https://reactnativeelements.com/docs/avatar

Try out the Avatar component:

```JS
import { Avatar } from 'react-native-elements';

export default function App() {
  return (
    <SafeAreaProvider>
			...
			<Avatar
				overlayContainerStyle={{backgroundColor: '#eee'}}
				size="large"
				rounded
				source={require('./images/dog.png')}
			/>
			...
    </SafeAreaProvider>
  );
}
```

A badge is one of those little circles that appears in the upper right of an element. It usually displays a number. 

https://reactnativeelements.com/docs/badge

Add a badge to the Avatar: 

```JS
import { ..., Badge } from 'react-native-elements';

export default function App() {
  return (
    <SafeAreaProvider>
      <View style={styles.container}>
        <Badge value="99+" status="error" />
        <Badge value={<Text>My Custom Badge</Text>} />

        <Badge status="success" />
        <Badge status="error" />
        <Badge status="primary" />
        <Badge status="warning" />
        ...
      </View>
    </SafeAreaProvider>
  );
}
```

With a value the value is displayed. 

When value is a component that component is wrapped in the badge. 

When there is no value the badge is a small colored circle. 

Set the base color of the badge with the `status` prop.

## Defining your final project

To stretch your skills your goal now is to tqke the ideas from class and put them all togetherr into a project of your own design. 

Start with idea. Think about what types of apps people use on mobile and why you would make a mobile app. 

Next scope your app. We have about 2 weeks to put the final project together. You'll need to create your final and complete it before class 13 Wed, Dec 9. You may have to choose which features of your final you implement. 

### Final Project ideas

Here a few ideas you can consider for a final project. 

- Recreate one of the React Redux Tutorials in React Native
- Create a Mobile app for a backend app you created previously
- Create a Mobile app from one of your previous web projects. This could be an intensive or other project.  

### Wireframes for Final

Having a plan or blueprint will help

- Draw some wireframes for your final project.

## After Class

- Start working on your [final project](https://github.com/Make-School-Courses/FEW-2.4-Native-Development-with-JavaScript/blob/master/Assignments/Assignment-final-project.md)

## Additional Resources

- Compare Android and iOS
	- https://medium.com/@chunchuanlin/android-vs-ios-compare-20-ui-components-patterns-part-1-ad33c2418b45
	- https://medium.com/@vedantha/interaction-design-patterns-ios-vs-android-111055f8a9b7
	- https://www.ready4s.com/blog/android-vs-ios-comparing-ui-design
