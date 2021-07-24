import React, { Component } from 'react';
import { StyleSheet, View, Text } from 'react-native';

export default Boxes = () => {
  return (
    <View style={styles.containerStyle}>
      <View style={styles.boxStyle}></View>
      <View style={styles.boxStyle}></View>
      <View style={styles.boxStyle}></View>
    </View>
  );
}


const styles = StyleSheet.create({
  boxStyle: {
    height: 150,
    width: 150,
    backgroundColor: '#ddd',
    borderWidth: 1,
    borderStyle: 'solid',
    borderColor: '#000'
  },
  containerStyle: {
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'space-around',
  }
});
