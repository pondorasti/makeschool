import React from 'react';
import { ScrollView } from 'react-native';

import Title from './components/Title'
import ActivityIndicatorExample from './components/ActivityIndicatorExample'
import Buttons from './components/Buttons'
import ImageTest from './components/ImageTest';
import ImageBackgroundExample from './components/ImageBackgroundExample'

export default class App extends React.Component {
  render() {
    return (
      // Use ScrollView to create a scrollinglist of components
      <ScrollView>
        <Title />
        <ActivityIndicatorExample />
        <Buttons />
        <ImageTest />
        <ImageBackgroundExample />
      </ScrollView>
    );
  }
}



