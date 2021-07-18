import React, { Component } from 'react'
import { StyleSheet, Text, View, Button, Slider, Switch } from 'react-native'

class Buttons extends Component {
  constructor(props) {
    super(props)

    // Use state to hold the value of the slider and switch
    this.state = {
      sliderValue: 0, 
      switchOn: false
    }
  }
  render() {
    const { sliderValue, switchOn } = this.state

    // Use the value of switch state to manage style of components 
    const rowStyle = this.state.switchOn ? styles.rowDark : styles.row
    const textStyle = this.state.switchOn ? styles.textLight : styles.text

  return (
    <View style={rowStyle}>

      <Text style={textStyle}>Button Example</Text>

      <View style={[styles.container, styles.horizontal]}>
        <View style={{flexDirection:'column'}}>

          <Button
            // Handle button presses
            onPress={() => this.setState({ sliderValue: 0 })}
            title="Reset Button"  // Set the text of the button
            color="#841584"       // Set the color of the button
            accessibilityLabel="Learn more about this purple button"
            disabled={switchOn}   // Disable button
          />

          <Text style={{textAlign:'center'}}>{sliderValue}</Text>

          <Slider 
            style={{width:300}} 
            minimumValue={0}    // Set min value
            maximumValue={100}  // Set max value
            step={1}            // Set step change
            // Use 'Controlled component pattern'
            value={sliderValue}
            onValueChange={(value) => this.setState({ sliderValue: value })}
            disabled={switchOn} // Disable slider
          />

          <Switch 
            style={{marginTop: 20}}
            value={!switchOn}
            onValueChange={(value) => this.setState({ switchOn: !value })}
          />
          
        </View>
      </View>
    </View>
  )
  }
}

export default Buttons

const styles = StyleSheet.create({
  row: {
    padding: 40,
    backgroundColor: '#eee'
  },
  rowDark: {
    padding: 40,
    backgroundColor: '#aaa'
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
    textAlign: 'center'
  }, 
  textLight: {
    textAlign: 'center',
    color: '#fff'
  }
})