import React from 'react';
import { Text, View, TouchableOpacity, StyleSheet } from 'react-native';

// Redux -
// npm install --save redux
// npm install --save react-redux

export default B = (props) => {
  return (
    <TouchableOpacity onPress={props.onPress} activeOpacity={0.7}>
      <View style={styles.container}>
        <Text style={[styles.text, props.styles.text]}>{props.title}</Text>
      </View>
    </TouchableOpacity>
  );
};

// Don't export normally! See connect below...
// export default B;

// Styles

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#333',
    borderRadius: 10,
    flex: 0,
    margin: 5,
    padding: 5,
    flex: 0,
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center'
  },
  text: {
    flex: 0,
    fontSize: 40,
    textAlign: 'center',
    color: 'white',
    marginBottom: 0.1
  }
});
