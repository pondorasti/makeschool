import React, { Component } from 'react'
import { StyleSheet, Text, View, ActivityIndicator, Switch } from 'react-native'

class ActivityIndicatorExample extends Component {
  constructor(props) {
    super(props)
    // Use state to manage the value of the switch
    this.state = {
      on: false
    }
  }
  render() {
    const { on } = this.state
    return (
      <View style={styles.row}>
        <View style={{display: 'flex', alignItems:'center'}}>
          <Text style={styles.text}>Activity Indicator Component</Text>
          <Switch 
            style={{marginTop: 30}}
            // Use the 'controlled component pattern' to change state
            value={on}
            onValueChange={(value) => this.setState({ on: value })}
          />
        </View>

        <View style={[styles.container, styles.horizontal]}>
          {/* Use state 'on' to activate Activity indicators  */}
          <ActivityIndicator animating={on} size="large" color="#ff00ff" />
          <ActivityIndicator animating={on} size="small" color="#4A90E2" />
          <ActivityIndicator animating={on} size="large" color="#D0021B" />
          <ActivityIndicator animating={on} size="small" color="#9013FE" />
        </View>
      </View>
    )
  }
}

export default ActivityIndicatorExample

const styles = StyleSheet.create({
  row: {
    padding: 40
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    marginTop: 40
  },
  horizontal: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    padding: 10
  }, 
  text: {
    textAlign: 'center'
  }
})