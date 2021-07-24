import React from 'react';
import { View, StyleSheet } from 'react-native';
import Counter from './counter';

import { createStore } from 'redux';
import { Provider } from 'react-redux';
import reducers from '../reducers';


const App = () => {
  return (
    <Provider store={createStore(reducers)}>
      <View style={styles.container}>
        <Counter />
      </View>
    </Provider>
  );
}

export default App;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'orange'
  }
});
