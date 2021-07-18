import React from 'react'
import { View, Text, StyleSheet } from 'react-native'

const Title = (props) => {
  return (
    <View style={styles.container}>
      {/* Use Text to create text */}
      <Text style={styles.text}>Component Demo</Text>
    </View>
  )
}

export default Title

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#eee',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 40
  },
  // Style text component with CSS styles 
  text: {
    color: '#333',
    fontSize: 30,
    fontWeight: 'bold'
  }
});