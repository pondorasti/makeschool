import React, { Component } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import B from './b';

class Counter extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.text}>{this.props.counter}</Text>
        <B styles={styles.button} title="+" onPress={()=>{this.props.inc()}} />
        <B styles={styles.button} title="-" onPress={()=>{this.props.dec()}} />
        <B styles={styles.button} title="+5" onPress={()=>{this.props.incBy(5)}} />
        <B styles={styles.button} title="Reset" onPress={()=>{this.props.reset()}} />
      </View>
    );
  }
}

export default Counter;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center'
  },
  text: {
    fontSize: 50,
    fontWeight: 'bold',
    textAlign: 'center',
    alignItems: 'center'
  },
  button: {
    fontSize: 40
  }
});



















