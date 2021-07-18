// Import default modules
import React, { Component } from 'react';
import { View, Text, StyleSheet } from 'react-native';

// Define a simple component
export default Example = (props) => {
  return (
    <View>
      <Text style={styles.headline}>{props.title}</Text>
      <Text style={styles.subheading}>{props.subheading}</Text>
    </View>
  )
}

// Define some styles to describe how this component will render itself.s
const styles = StyleSheet.create({
  headline: {
    fontSize: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    margin: 10,
    color: '#444'
  },
  subheading: {
    fontSize: 18,
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
