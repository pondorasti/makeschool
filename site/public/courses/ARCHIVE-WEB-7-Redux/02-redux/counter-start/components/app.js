import React from 'react';
import { View, StyleSheet } from 'react-native';
import Counter from './counter';


const App = () => {
  return (
    
      <View style={styles.container}>
        <Counter />
      </View>
   
  );
}

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'orange'
  }
});
