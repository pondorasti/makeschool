import React from 'react'
import { StyleSheet, Text, View, Image, Dimensions } from 'react-native'

// Import an image 
const kittenJPG = require('../assets/kitten.jpg')

const ImageTest = (props) => {
  return (
    <View style={styles.row}>
      <Text style={styles.text}>Image Example</Text>
      <View style={[styles.container, styles.horizontal]}>

        <Image 
          style={styles.image}  // Style the image
          source={kittenJPG}    // set the source for the image
          resizeMode="contain"
          resizeMethod="resize"
        />

      </View>
    </View>
  )
}

export default ImageTest

// Get dimensions object
const { height, width } = Dimensions.get('window')

const styles = StyleSheet.create({
  row: {
    padding: 40,
    backgroundColor: '#fff'
  },
  container: {
    flex: 1,
    justifyContent: 'center'
  },
  horizontal: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    padding: 10
  }, 
  text: {
    textAlign: 'center',
    marginBottom: 40
  },
  image: {
    width: '100%',
    height: 300,
    // https://medium.com/the-react-native-log/tips-for-react-native-images-or-saying-goodbye-to-trial-and-error-b2baaf0a1a4d
    // flex: 1,
    // alignSelf: 'stretch',
    // width: undefined,
    // height: undefined
  }
})